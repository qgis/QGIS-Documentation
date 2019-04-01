.. only:: html


Writing new Processing algorithms as python scripts
====================================================

.. only:: html

   .. contents::
      :local:

Currently, the only way to write Processing algorithms using Python is
to extend the :class:`QgsProcessingAlgorithm <qgis.core.QgsProcessingAlgorithm>`
class.
using Python.

* Extending
  :class:`QgsProcessingAlgorithm <qgis.core.QgsProcessingAlgorithm>`

The @alg decorator introduced in QGIS 3.6 to simplify the writing of
Processing algorithms is not available in QGIS 3.4.

Within QGIS, you can use :guilabel:`Create new script` in the
:guilabel:`Scripts` menu at the top of the :guilabel:`Processing Toolbox`
to open the :guilabel:`Processing Script Editor` where you can write
your code.
To simplify the task, you can start with a script template by using
:guilabel:`Create new script from template` from the same menu.
This opens a template that extends
:class:`QgsProcessingAlgorithm <qgis.core.QgsProcessingAlgorithm>`.

If you save the script in the :file:`scripts` folder
(the default location) with a :file:`.py` extension, the algorithm will
become available in the :guilabel:`Processing Toolbox`.

Extending QgsProcessingAlgorithm
--------------------------------

The following code takes a vector layer, counts the number of features,
does a buffer operation and creates a raster layer from the result of
the buffer operation.
The buffer layer, raster layer and number of features are returned.

.. testcode:: 

    from qgis.PyQt.QtCore import QCoreApplication
    from qgis.core import (QgsProcessing,
                           QgsProcessingAlgorithm,
                           QgsProcessingException,
                           QgsProcessingOutputNumber,
                           QgsProcessingParameterDistance,
                           QgsProcessingParameterFeatureSource,
                           QgsProcessingParameterVectorDestination,
                           QgsProcessingParameterRasterDestination)
    import processing


    class ExampleProcessingAlgorithm(QgsProcessingAlgorithm):
        """
        This is an example algorithm that takes a vector layer,
        creates some new layers and returns some results.
        """
    
        def tr(self, string):
            """
            Returns a translatable string with the self.tr() function.
            """
            return QCoreApplication.translate('Processing', string)
    
        def createInstance(self):
            # createInstance must return a new copy of your algorithm.
            # If you change the name of the class, make sure you also
            # update the the value returned here to match!
            return ExampleProcessingAlgorithm()
    
        def name(self):
            """
            Returns the unique algorithm name, used for identifying
            the algorithm.
            """
            return 'bufferrasterextend'
    
        def displayName(self):
            """
            Returns the translated algorithm name.
            """
            return self.tr('Buffer and export to raster (extend)')
    
        def group(self):
            """
            Returns the name of the group this algorithm belongs to.
            """
            return self.tr('Example scripts')
    
        def groupId(self):
            """
            Returns the unique ID of the group this algorithm belongs
            to.
            """
            return 'examplescripts'
    
        def shortHelpString(self):
            """
            Returns a localised short help string for the algorithm.
            """
            return self.tr('Example algorithm short description')
    
        def initAlgorithm(self, config=None):
            """
            Here we define the inputs and outputs of the algorithm.
            """
            # 'INPUT' is the recommended name for the main input
            # parameter.
            self.addParameter(
                QgsProcessingParameterFeatureSource(
                    'INPUT',
                    self.tr('Input vector layer'),
                    types=[QgsProcessing.TypeVectorAnyGeometry]
                )
            )
            self.addParameter(
                QgsProcessingParameterVectorDestination(
                    'BUFFER_OUTPUT',
                    self.tr('Buffer output'),
                )
            )
            # 'OUTPUT' is the recommended name for the main output
            # parameter.
            self.addParameter(
                QgsProcessingParameterRasterDestination(
                    'OUTPUT',
                    self.tr('Raster output')
                )
            )
            self.addParameter(
                QgsProcessingParameterDistance(
                    'BUFFERDIST',
                    self.tr('BUFFERDIST'),
                    defaultValue = 1.0,
                    # Make distance units match the INPUT layer units:
                    parentParameterName='INPUT'
                )
            )
            self.addParameter(
                QgsProcessingParameterDistance(
                    'CELLSIZE',
                    self.tr('CELLSIZE'),
                    defaultValue = 10.0,
                    parentParameterName='INPUT'
                )
            )
            self.addOutput(
                QgsProcessingOutputNumber(
                    'NUMBEROFFEATURES',
                    self.tr('Number of features processed')
                )
            )
    
        def processAlgorithm(self, parameters, context, feedback):
            """
            Here is where the processing itself takes place.
            """
            # First, we get the count of features from the INPUT layer.
            # This layer is defined as a QgsProcessingParameterFeatureSource
            # parameter, so it is retrieved by calling
            # self.parameterAsSource.
            input_featuresource = self.parameterAsSource(parameters,
                                                         'INPUT',
                                                         context)
            numfeatures = input_featuresource.featureCount()
            # Retrieve the buffer distance and raster cell size numeric
            # values.
            # Since these are numeric values, they are retrieved using
            # self.parameterAsDouble.
            bufferdist = self.parameterAsDouble(parameters, 'BUFFERDIST',
                                                context)
            rastercellsize = self.parameterAsDouble(parameters, 'CELLSIZE',
                                                    context)
            if feedback.isCanceled():
                return {}
            buffer_result = processing.run('native:buffer',
                                   {
                                    # Here we pass on the original
                                    # parameter values of INPUT and
                                    # BUFFER_OUTPUT to the buffer algorithm,
                                    # in the way that this particular
                                    # algorithm requires.
                                    'INPUT': parameters['INPUT'],
                                    'OUTPUT': parameters['BUFFER_OUTPUT'],
                                    'DISTANCE': bufferdist,
                                    'SEGMENTS': 10, 
                                    'DISSOLVE': True,
                                    'END_CAP_STYLE': 0,
                                    'JOIN_STYLE': 0,
                                    'MITER_LIMIT': 10
                                    },
                                   # Because the buffer algorithm is being
                                   # run as a step in another larger algorithm,
                                   # the is_child_algorithm option should be
                                   # set to True
                                   is_child_algorithm=True,
                                   # It's important to pass on the context and
                                   # feedback objects to child algorithms, so
                                   # that they can properly give feedback to
                                   # users and handle cancelation requests.
                                   context=context,
                                   feedback=feedback)
            # It's good practice to check for cancelation as much as is sensibly
            # possible!
            # Doing so allows for responsive cancelation, instead of forcing users
            # to wait for unwanted processing to occur.
            if feedback.isCanceled():
                return {}
            # Run the separate rasterization algorithm using the buffer result as
            # an input.
            rasterized_result = processing.run('qgis:rasterize',
                                   {
                                    # Here we pass the 'OUTPUT' value from the
                                    # buffer's result dictionary off to the
                                    # rasterize child algorithm.
                                    # This dictionary value contains everything
                                    # the child algorithm needs to know to retrieve
                                    # the correct output layer from the buffer step.
                                    'LAYER': buffer_result['OUTPUT'],
                                    # The rasterize 'EXTENT' parameter is a
                                    # QgsProcessingParameterExtent type.
                                    # Extent parameters accept a wide range of
                                    # input value types, including QgsRectangle
                                    # values, comma separated strings of x/y
                                    # min/max values, and also layer values.
                                    # When a layer value is used, then the full
                                    # extent of that layer will be used as the
                                    # extent parameter value.
                                    # It's a handy shortcut to ensure that the
                                    # rasterize algorithm creates a raster which
                                    # covers the full extent of the buffered output
                                    # layer.
                                    # Use processing.algorithmHelp to see detailed
                                    # documentation on all the possible input
                                    # values which the parameters for a particular
                                    # algorithm will accept.
                                    'EXTENT': buffer_result['OUTPUT'],
                                    'MAP_UNITS_PER_PIXEL': rastercellsize,
                                    # Just like input values, output/destination
                                    # style parameters should be passed using their
                                    # original parameter value to child algorithms.
                                    # There's no need to evaluate these values in
                                    # advance!
                                    'OUTPUT': parameters['OUTPUT']
                                   },
                                   is_child_algorithm=True,
                                   context=context,
                                   feedback=feedback)
            if feedback.isCanceled():
                return {}
            # Our successful algorithm should return values for all the output
            # parameters it has defined. In this case, that's the buffer and
            # rasterized output layers, and the count of features processed.
            # The dictionary keys here match the original parameter/output name.
            return {'OUTPUT': rasterized_result['OUTPUT'],
                    'BUFFER_OUTPUT': buffer_result['OUTPUT'],
                    'NUMBEROFFEATURES': numfeatures}
 
Handing data produced by the algorithm
--------------------------------------

When you declare an output representing a layer (raster or vector),
the algorithm will try to add it to QGIS once it is finished.

* Raster layer output: QgsProcessingParameterRasterDestination.
* Vector layer output: QgsProcessingParameterVectorDestination.

So even if the ``processing.run()`` method does not add the layers
it creates into the user's current project,
the two output layers (buffer and raster buffer) will be loaded,
since they are saved to the destinations entered by the user (or to
temporary destinations if the user does not specify a destination).

If a layer is created as output of an algorithm, it should be
declared as such.
Otherwise, you will not be able to properly use the algorithm in the
modeler, since what is declared will not match what the algorithm
really creates.

You can return strings, numbers and more by specifying them in the result
dictionary (as demonstrated for "NUMBEROFFEATURES"), but they should
always be explicitly defined as outputs from your algorithm.
We encourage algorithms to output as many useful values as possible,
since these can be valuable for use in later algorithms when your
algorithm is used as part of a model.


Communicating with the user
---------------------------

If your algorithm takes a long time to process, it is a good idea to
inform the user about the progress.  You can use ``feedback``
(:class:`QgsProcessingFeedback <qgis.core.QgsProcessingFeedback>`) for this.

The progress text and progressbar can be updated using two methods:
:meth:`setProgressText(text) <qgis.core.QgsProcessingFeedback.setProgressText>`
and :meth:`setProgress(percent) <qgis.core.QgsFeedback.setProgress>`.

You can provide more information to the user using
:meth:`pushCommandInfo(text) <qgis.core.QgsProcessingFeedback.pushCommandInfo>`,
:meth:`pushDebugInfo(text) <qgis.core.QgsProcessingFeedback.pushDebugInfo>`,
:meth:`pushInfo(text) <qgis.core.QgsProcessingFeedback.pushInfo>` and
:meth:`reportError(text) <qgis.core.QgsProcessingFeedback.reportError>`.

If your script has a problem, the correct way of handling it is to raise
a :class:`QgsProcessingException <qgis.core.QgsProcessingException>`.
You can pass a message as an argument to the constructor of the exception.
Processing will take care of handling it and communicating with the user,
depending on where the algorithm is being executed from (toolbox, modeler,
Python console, ...)


Documenting your scripts
------------------------

You can document your scripts by overloading the
:meth:`helpString() <qgis.core.QgsProcessingAlgorithm.helpString>` and
:meth:`helpUrl() <qgis.core.QgsProcessingAlgorithm.helpUrl>` methods of
:class:`QgsProcessingAlgorithm <qgis.core.QgsProcessingAlgorithm>`.

Flags
-----

You can override the :meth:`flags <qgis.core.QgsProcessingAlgorithm.flags>`
method of :class:`QgsProcessingAlgorithm <qgis.core.QgsProcessingAlgorithm>`
to tell QGIS more about your algorithm.
You can for instance tell QGIS that the script shall be hidden from
the modeler, that it can be canceled, that it is not thread safe,
and more.

.. tip::
    By default, Processing runs algorithms in a separate thread in order
    to keep QGIS responsive while the processing task runs.
    If your algorithm is regularly crashing, you are probably using API
    calls which are not safe to do in a background thread.
    Try returning the QgsProcessingAlgorithm.FlagNoThreading flag from
    your algorithm's flags() method to force Processing to run your
    algorithm in the main thread instead.

Best practices for writing script algorithms
--------------------------------------------

Here's a quick summary of ideas to consider when creating your script
algorithms and, especially, if you want to share them with other QGIS users.
Following these simple rules will ensure consistency across the different
Processing elements such as the toolbox, the modeler or the batch processing
interface.

* Do not load resulting layers. Let Processing handle your results and load
  your layers if needed.
* Always declare the outputs your algorithm creates.
* Do not show message boxes or use any GUI element from the script.
  If you want to communicate with the user, use the methods of the
  feedback object
  (:class:`QgsProcessingFeedback <qgis.core.QgsProcessingFeedback>`) or
  throw a :class:`QgsProcessingException <qgis.core.QgsProcessingException>`.

There are already many processing algorithms available in QGIS.
You can find code on
https://github.com/qgis/QGIS/tree/release-3_4/python/plugins/processing/algs/qgis.

.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.
