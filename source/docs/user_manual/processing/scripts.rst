.. only:: html

   |updatedisclaimer|

Writing new Processing algorithms as Python scripts
===================================================

.. only:: html

   .. contents::
      :local:

There are two options for writing Processing algorithms using Python.

* Extending :class:`QgsProcessingAlgorithm <qgis.core.QgsProcessingAlgorithm>`
* Using the @alg decorator

Within QGIS, you can use :guilabel:`Create new script` in the
:guilabel:`Scripts` menu at the top of the :guilabel:`Processing Toolbox` to
open the :guilabel:`Processing Script Editor` where you can write your code.
To simplify the task, you can start with a script template by using
:guilabel:`Create new script from template` from the same menu.
This opens a template that extends
:class:`QgsProcessingAlgorithm <qgis.core.QgsProcessingAlgorithm>`.

If you save the script in the script to the :file:`scripts` folder
(the default location) with a :file:`.py` extension, the algorithm will
become available in the :guilabel:`Processing Toolbox`.

Extending QgsProcessingAlgorithm
--------------------------------

The following code takes a vector layer, counts the number of features, does a
buffer operation and creates a raster layer from the result of the buffer
operation.
The buffer layer, raster layer and number of features are returned.

.. test-code:: 

    from qgis.PyQt.QtCore import QCoreApplication
    from qgis.core import (QgsProcessing,
                           QgsProcessingAlgorithm,
                           QgsProcessingException,
                           QgsProcessingOutputNumber,
                           QgsProcessingParameterDistance,
                           QgsProcessingParameterVectorLayer,
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
            return ExampleProcessingAlgorithm()
    
        def name(self):
            """
            Returns the algorithm name, used for identifying the algorithm.
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
            Returns the unique ID of the group this algorithm belongs to.
            """
            return 'examplescripts'
    
        def shortHelpString(self):
            """
            Returns a localised short helper string for the algorithm.
            """
            return self.tr('Example algorithm short description')
    
        def initAlgorithm(self, config=None):
            """
            Here we define the inputs and outputs of the algorithm.
            """
            self.addParameter(
                QgsProcessingParameterVectorLayer(
                    'INPUTVECTOR',
                    self.tr('Input vector layer'),
                    types=[QgsProcessing.TypeVectorAnyGeometry]
                )
            )
            self.addParameter(
                QgsProcessingParameterVectorDestination(
                    'BUFFER',
                    self.tr('BUFFER'),
                )
            )
            self.addParameter(
                QgsProcessingParameterRasterDestination(
                    'OUTPUTRASTER',
                    self.tr('OUTPUTRASTER')
                )
            )
            self.addParameter(
                QgsProcessingParameterDistance(
                    'BUFFERDIST',
                    self.tr('BUFFERDIST'),
                    defaultValue = 1
                )
            )
            self.addParameter(
                QgsProcessingParameterDistance(
                    'CELLSIZE',
                    self.tr('CELLSIZE'),
                    defaultValue = 10
                )
            )
            self.addOutput(
                QgsProcessingOutputNumber(
                    'NUMBEROFFEATURES',
                    self.tr('NUMBEROFFEATURES')
                )
            )
    
        def processAlgorithm(self, parameters, context, feedback):
            """
            Here is where the processing itself takes place.
            """
            inputlayer = self.parameterAsVectorLayer(parameters, 'INPUTVECTOR',
                                                     context)
            numfeatures = inputlayer.featureCount()
            bufferlayer = self.parameterAsOutputLayer(parameters, 'BUFFER',
                                                      context)
            outputraster = self.parameterAsOutputLayer(parameters, 'OUTPUTRASTER',
                                                       context)
            bufferdist = self.parameterAsDouble(parameters, 'BUFFERDIST', context)
            rastercellsize = self.parameterAsDouble(parameters, 'CELLSIZE',
                                                    context)
            if feedback.isCanceled():
                return {'OUTPUTRASTER': None, 'BUFFER': None,
                        'NUMBEROFFEATURES': numfeatures}
            inpbuffer = processing.run('native:buffer',
                                   {'INPUT': inputlayer, 'OUTPUT': bufferlayer,
                                    'DISTANCE': bufferdist, 'SEGMENTS': 10, 
                                    'DISSOLVE': True, 'END_CAP_STYLE': 0,
                                    'JOIN_STYLE': 0, 'MITER_LIMIT': 10
                                    },
                                   is_child_algorithm=True, context=context,
                                   feedback=feedback)
            # both bufferlayer and inpbuffer['OUTPUT'] refer to the result
            if feedback.isCanceled():
                return {'OUTPUTRASTER': None, 'BUFFER': bufferlayer,
                        'NUMBEROFFEATURES': numfeatures}
            rasterized = processing.run('qgis:rasterize',
                                   {'LAYER': bufferlayer, 'EXTENT': bufferlayer,
                                    'MAP_UNITS_PER_PIXEL': rastercellsize,
                                    'OUTPUT': outputraster
                                   },
                                   is_child_algorithm=True, context=context,
                                   feedback=feedback)
            # both outputraster and rasterized['OUTPUT'] refer to the result
            return {'OUTPUTRASTER': outputraster, 'BUFFER': bufferlayer,
                    'NUMBEROFFEATURES': numfeatures}
 
The @alg decorator
------------------

By using the @alg decorator, you can create your own algorithms by writing the
corresponding Python code and adding a few extra lines to supply additional
information needed to define the semantics of the algorithm.

The following code takes a vector layer, counts the number of features, does a
buffer operation and creates a raster layer from the result of the buffer
operation using the @alg decorator.
The buffer layer, raster layer and number of features are returned.

.. testcode:: 

    import processing
    from qgis.processing import alg
    from qgis.core import QgsProject
    
    @alg(name='bufferrasteralg', label='Buffer and export to raster (alg)', group='examplescripts',
         group_label='Example scripts')
    @alg.input(type=alg.VECTOR_LAYER, name='INPUTVECTOR', label='Input vector layer')
    @alg.input(type=alg.RASTER_LAYER_DEST, name='OUTPUTRASTER', label='OUTPUTRASTER')
    @alg.input(type=alg.VECTOR_LAYER_DEST, name='BUFFER', label='BUFFER')
    @alg.input(type=alg.DISTANCE, name='BUFFERDIST', label='BUFFER DISTANCE', default=1.0)
    @alg.input(type=alg.DISTANCE, name='CELLSIZE', label='RASTER CELL SIZE', default=10.0)
    @alg.output(type=alg.NUMBER, name='NUMBEROFFEATURES', label='NUMBEROFFEATURES')
    
    def bufferrasteralg(instance, parameters, context, feedback, inputs):
        """
        Description of the algorithm.
        (If there is no comment here, you will get an error)
        """
        inputlayer = instance.parameterAsVectorLayer(parameters, 'INPUTVECTOR', context)
        numfeatures = inputlayer.featureCount()
        bufferlayer = instance.parameterAsOutputLayer(parameters, 'BUFFER', context)
        outputraster = instance.parameterAsOutputLayer(parameters, 'OUTPUTRASTER', context)
        bufferdist = instance.parameterAsDouble(parameters, 'BUFFERDIST', context)
        rastercellsize = instance.parameterAsDouble(parameters, 'CELLSIZE', context)
        if feedback.isCanceled():
            return {'OUTPUTRASTER': None, 'BUFFER': None,
                    'NUMBEROFFEATURES': numfeatures}
        inpbuffer = processing.run('native:buffer',
                                   {'INPUT': inputlayer, 'OUTPUT': bufferlayer,
                                    'DISTANCE': bufferdist, 'SEGMENTS': 10, 
                                    'DISSOLVE': True, 'END_CAP_STYLE': 0,
                                    'JOIN_STYLE': 0, 'MITER_LIMIT': 10
                                    },
                                   is_child_algorithm=True, context=context,
                                   feedback=feedback)
        # both bufferlayer and inpbuffer['OUTPUT'] refer to the result
        if feedback.isCanceled():
            return {'OUTPUTRASTER': None, 'BUFFER': bufferlayer,
                    'NUMBEROFFEATURES': numfeatures}
        rasterized = processing.run('qgis:rasterize',
                                   {'LAYER': bufferlayer, 'EXTENT': bufferlayer,
                                    'MAP_UNITS_PER_PIXEL': rastercellsize,
                                    'OUTPUT': outputraster
                                   },
                                   is_child_algorithm=True, context=context,
                                   feedback=feedback)
        # both outputraster and rasterized['OUTPUT'] refer to the result
        return {'OUTPUTRASTER': outputraster, 'BUFFER': bufferlayer,
                'NUMBEROFFEATURES': numfeatures}

As you can see, it involves two algorithms.
The last one creates a raster from the buffer layer that was
generated by the first one.

The part of the code where this processing takes place is not
difficult to understand if you have read the previous chapter.
The first lines, however, need some additional explanation.
They provide the information that is needed to turn your code into
an algorithm that can be run from any of the GUI components, like
the toolbox or the graphical modeler.

These lines are all calls to the ``@alg`` functions that help
simplify the coding of the algorithm.

The @alg function is used to define the name and location of the
algorithm in the Toolbox.
The @alg.input function is used to define the inputs of the algorithm.
The @alg.output function is used to define the outputs of the algorithm.

Here is the list of input and output types types that are supported in
processing and their corresponding alg decorator constants
(:file:`algfactory.py` contains the complete list of alg constants).

.. list-table:: Input and output types
   :widths: 50 20 30
   :header-rows: 1

   * - Class
     - alg
     - Description
   * - :class:`QgsProcessingParameterAuthConfig <qgis.core.QgsProcessingParameterAuthConfig>`
     - ``alg.AUTH_CFG``
     - Allows users to select from available authentication configurations or create new authentication configurations.
   * - :class:`QgsProcessingParameterBand <qgis.core.QgsProcessingParameterBand>`
     - ``alg.BAND``
     - A band of a raster layer.
   * - :class:`QgsProcessingParameterBoolean <qgis.core.QgsProcessingParameterBoolean>`
     - ``alg.BOOL``
     - A boolean value.
   * - :class:`QgsProcessingParameterCrs <qgis.core.QgsProcessingParameterCrs>`
     - ``alg.CRS``
     - A Coordinate Reference System
   * - :class:`QgsProcessingParameterDistance <qgis.core.QgsProcessingParameterDistance>`
     - ``alg.DISTANCE``
     - A double numeric parameter for distance values.
   * - :class:`QgsProcessingParameterEnum <qgis.core.QgsProcessingParameterEnum>`
     - ``alg.ENUM``
     - An enumeration, allowing for selection from a set of predefined values.
   * - :class:`QgsProcessingParameterExpression <qgis.core.QgsProcessingParameterExpression>`
     - ``alg.EXPRESSION``
     - An expression.
   * - :class:`QgsProcessingParameterExtent <qgis.core.QgsProcessingParameterExtent>`
     - ``alg.EXTENT``
     - A spatial extent defined by xmin, xmax, ymin, ymax.
   * - :class:`QgsProcessingParameterField <qgis.core.QgsProcessingParameterField>`
     - ``alg.FIELD``
     - A field in the attribute table of a vector layer.
   * - :class:`QgsProcessingParameterFile <qgis.core.QgsProcessingParameterFile>`
     - ``alg.FILE``
     - A filename.
   * - :class:`QgsProcessingParameterFileDestination <qgis.core.QgsProcessingParameterFileDestination>`
     - ``alg.FILE_DEST``
     - A filename.
   * - :class:`QgsProcessingParameterFolderDestination <qgis.core.QgsProcessingParameterFolderDestination>`
     - ``alg.FOLDER_DEST``
     - A folder.
   * - :class:`QgsProcessingParameterMapLayer <qgis.core.QgsProcessingParameterMapLayer>`
     - ``alg.MAPLAYER``
     - A map layer.
   * - :class:`QgsProcessingParameterMatrix <qgis.core.QgsProcessingParameterMatrix>`
     - ``alg.MATRIX``
     - A matrix.
   * - :class:`QgsProcessingParameterMeshLayer <qgis.core.QgsProcessingParameterMeshLayer>`
     - ``alg.MESH_LAYER``
     - A mesh layer.
   * - :class:`QgsProcessingParameterMultipleLayers <qgis.core.QgsProcessingParameterMultipleLayers>`
     - ``alg.MULTILAYER``
     - A set of layers.
   * - :class:`QgsProcessingParameterNumber <qgis.core.QgsProcessingParameterNumber>`
     - ``alg.NUMBER``
     - A numerical value.
   * - :class:`QgsProcessingParameterPoint <qgis.core.QgsProcessingParameterPoint>`
     - ``alg.POINT``
     - A point.
   * - :class:`QgsProcessingParameterRange <qgis.core.QgsProcessingParameterRange>`
     - ``alg.RANGE``
     - A number range.
   * - :class:`QgsProcessingParameterRasterLayer <qgis.core.QgsProcessingParameterRasterLayer>`
     - ``alg.RASTER_LAYER``
     - A raster layer.
   * - :class:`QgsProcessingParameterRasterDestination <qgis.core.QgsProcessingParameterRasterDestination>`
     - ``alg.RASTER_LAYER_DEST``
     - A raster layer.
   * - :class:`QgsProcessingParameterFeatureSink <qgis.core.QgsProcessingParameterFeatureSink>`
     - ``alg.SINK``
     - A feature sink.
   * - :class:`QgsProcessingParameterFeatureSource <qgis.core.QgsProcessingParameterFeatureSource>`
     - ``alg.SOURCE``
     - A feature source.
   * - :class:`QgsProcessingParameterString <qgis.core.QgsProcessingParameterString>`
     - ``alg.STRING``
     - A text string.
   * - :class:`QgsProcessingParameterVectorLayer <qgis.core.QgsProcessingParameterVectorLayer>`
     - ``alg.VECTOR_LAYER``
     - A vector layer.
   * - :class:`QgsProcessingParameterVectorDestination <qgis.core.QgsProcessingParameterVectorDestination>`
     - ``alg.VECTOR_LAYER_DEST``
     - A vector layer.

Layer values are strings containing the filepath of the corresponding
object.
A multiple layer input will come as a string value, containing the filepaths
to all selected objects, separated by semicolons (``;``).


Handing data produced by the algorithm
--------------------------------------

When you declare an output representing a layer (raster or vector),
the algorithm will try to add it to QGIS once it is finished.

* Raster layer output: QgsProcessingParameterRasterDestination /
  alg.RASTER_LAYER_DEST.
* Vector layer output: QgsProcessingParameterVectorDestination /
  alg.VECTOR_LAYER_DEST.

So even if the ``run()`` method does not load the layers it produces,
the two output layers (buffer and raster buffer) will be loaded,
since they are saved to the destinations entered by the user (or to
temporary destinations if the user does not specify a destination).

Do not use the ``load()`` method in your script algorithms.
If a layer is created as output of an algorithm, it should be
declared as such.
Otherwise, you will not be able to properly use the algorithm in the
modeler, since what is declared will not match what the algorithm
really creates.

Hidden outputs (numbers and strings) do not have a value. Instead, it is you who
has to assign a value to them. To do so, just set the value of a variable with
the name you used to declare that output. For instance, if you have used this
declaration,

You can return strings, numbers and more by specifying them in the result
dictionary (as demonstrated for "NUMBEROFFEATURES").


Communicating with the user
---------------------------

If your algorithm takes a long time to process, it is a good idea to inform the
user about the progress.  You can use ``feedback``
(:class:`QgsProcessingFeedback <qgis.core.QgsProcessingFeedback>`) for this.

The progress text and progressbar can be updated using two methods:
:meth:`setProgressText(text) <qgis.core.QgsProcessingFeedback.setProgressText>`
and :meth:`setProgress(percent) <qgis.core.QgsFeedback.setProgress>`.

You can provide more information to the user using
:meth:`pushCommandInfo(text) <qgis.core.QgsProcessingFeedback.pushCommandInfo>`,
:meth:`pushDebugInfo(text) <qgis.core.QgsProcessingFeedback.pushDebugInfo>`,
:meth:`pushInfo(text) <qgis.core.QgsProcessingFeedback.pushInfo>` and
:meth:`reportError(text) <qgis.core.QgsProcessingFeedback.reportError>`.

If your script has a problem, the correct way of propagating it is to raise
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

You can override the :meth:`flags <qgis.core.QgsProcessingAlgorithm.flags>` method of
:class:`QgsProcessingAlgorithm <qgis.core.QgsProcessingAlgorithm>`
to tell QGIS more about your algorithm.
You can for instance tell QGIS that the script shall be hidden from
the modeler, that it can be canceled, that it is not thread safe,
and more.

Best practices for writing script algorithms
--------------------------------------------

Here's a quick summary of ideas to consider when creating your script algorithms
and, especially, if you want to share them with other QGIS users.
Following these simple rules will ensure consistency across the different
Processing elements such as the toolbox, the modeler or the batch processing
interface.

* Do not load resulting layers. Let Processing handle your results and load
  your layers if needed.
* Always declare the outputs your algorithm creates.
* Do not show message boxes or use any GUI element from the script. If you want
  to communicate with the user, use the methods of the feedback object
  (:class:`QgsProcessingFeedback <qgis.core.QgsProcessingFeedback>`) or
  throw a :class:`QgsProcessingException <qgis.core.QgsProcessingException>`.

There are already many processing algorithms available in QGIS.
You can find code on
https://github.com/qgis/QGIS/tree/master/python/plugins/processing/algs/qgis.

.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/3.4 for QGIS 3.4 docs and translations.`
