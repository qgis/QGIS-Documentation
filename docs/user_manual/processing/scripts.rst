
.. highlight:: python
   :linenothreshold: 5

Writing new Processing algorithms as Python scripts
===================================================

.. only:: html

   .. contents::
      :local:

There are two options for writing Processing algorithms using Python.

* :ref:`Extending <scripts_extend>` :class:`QgsProcessingAlgorithm
  <qgis.core.QgsProcessingAlgorithm>`
* :ref:`Using the @alg decorator <scripts_alg>`

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

.. _scripts_extend:

Extending QgsProcessingAlgorithm
--------------------------------

The following code

#. takes a vector layer as input
#. counts the number of features
#. does a buffer operation
#. creates a raster layer from the result of the buffer operation
#. returns the buffer layer, raster layer and number of features

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
    from qgis import processing


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
            # Must return a new copy of your algorithm.
            return ExampleProcessingAlgorithm()

        def name(self):
            """
            Returns the unique algorithm name.
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
            # values. Since these are numeric values, they are retrieved
            # using self.parameterAsDouble.
            bufferdist = self.parameterAsDouble(parameters, 'BUFFERDIST',
                                                context)
            rastercellsize = self.parameterAsDouble(parameters, 'CELLSIZE',
                                                    context)
            if feedback.isCanceled():
                return {}
            buffer_result = processing.run(
                'native:buffer',
                {
                    # Here we pass on the original parameter values of INPUT
                    # and BUFFER_OUTPUT to the buffer algorithm.
                    'INPUT': parameters['INPUT'],
                    'OUTPUT': parameters['BUFFER_OUTPUT'],
                    'DISTANCE': bufferdist,
                    'SEGMENTS': 10,
                    'DISSOLVE': True,
                    'END_CAP_STYLE': 0,
                    'JOIN_STYLE': 0,
                    'MITER_LIMIT': 10
                },
                # Because the buffer algorithm is being run as a step in
                # another larger algorithm, the is_child_algorithm option
                # should be set to True
                is_child_algorithm=True,
                #
                # It's important to pass on the context and feedback objects to
                # child algorithms, so that they can properly give feedback to
                # users and handle cancelation requests.
                context=context,
                feedback=feedback)

            # Check for cancelation
            if feedback.isCanceled():
                return {}

            # Run the separate rasterization algorithm using the buffer result
            # as an input.
            rasterized_result = processing.run(
                'qgis:rasterize',
                {
                    # Here we pass the 'OUTPUT' value from the buffer's result
                    # dictionary off to the rasterize child algorithm.
                    'LAYER': buffer_result['OUTPUT'],
                    'EXTENT': buffer_result['OUTPUT'],
                    'MAP_UNITS_PER_PIXEL': rastercellsize,
                    # Use the original parameter value.
                    'OUTPUT': parameters['OUTPUT']
                },
                is_child_algorithm=True,
                context=context,
                feedback=feedback)

            if feedback.isCanceled():
                return {}

            # Return the results
            return {'OUTPUT': rasterized_result['OUTPUT'],
                    'BUFFER_OUTPUT': buffer_result['OUTPUT'],
                    'NUMBEROFFEATURES': numfeatures}

Processing algorithm standard functions:

* createInstance (mandatory)
    Must return a new copy of your algorithm.
    If you change the name of the class, make sure you also update the value
    returned here to match!

* name (mandatory)
    Returns the unique algorithm name, used for identifying the algorithm.

* displayName (mandatory)
    Returns the translated algorithm name.

* group
    Returns the name of the group this algorithm belongs to.

* groupId
    Returns the unique ID of the group this algorithm belongs to.

* shortHelpString
    Returns a localised short help string for the algorithm.

* initAlgorithm (mandatory)
    Here we define the inputs and outputs of the algorithm.

    ``INPUT`` and ``OUTPUT`` are recommended names for the main input and
    main output parameters, respectively.

    If a parameter depends on another parameter, ``parentParameterName``
    is used to specify this relationship (could be the field / band of a
    layer or the distance units of a layer).

* processAlgorithm (mandatory)
    This is where the processing takes place.

    Parameters are retrieved using special purpose functions, for
    instance ``parameterAsSource`` and ``parameterAsDouble``.

    ``processing.run`` can be used to run other processing algorithms from
    a processing algorithm. The first parameter is the name of the
    algorithm, the second is a dictionary of the parameters to the algorithm.
    ``is_child_algorithm`` is normally set to ``True`` when running an
    algorithm from within another algorithm.
    ``context`` and ``feedback`` inform the algorithm about the
    environment to run in and the channel for communicating with the user
    (catching cancel request, reporting progress, providing textual feedback).
    When using the (parent) algorithm's parameters as parameters to "child"
    algorithms, the original parameter values should be used (e.g.
    ``parameters['OUTPUT']``).

    It is good practice to check the feedback object for cancelation
    as much as is sensibly possible! Doing so allows for responsive
    cancelation, instead of forcing users to wait for unwanted processing
    to occur.

    The algorithm should return values for all the output
    parameters it has defined as a dictionary.
    In this case, that's the buffer and rasterized output layers, and the
    count of features processed.
    The dictionary keys must match the original parameter/output names.

.. _scripts_alg:

The @alg decorator
------------------

Using the @alg decorator, you can create your own algorithms by writing the
Python code and adding a few extra lines to supply additional
information needed to make it a proper Processing algorithm.
This simplifies the creation of algorithms and the specification of inputs
and outputs.

One important limitation with the decorator approach is that algorithms
created in this way will always be added to a user's Processing Scripts
provider -- it is not possible to add these algorithms to a custom provider,
e.g. for use in plugins.

The following code uses the @alg decorator to

#. use a vector layer as input
#. count the number of features
#. do a buffer operation
#. create a raster layer from the result of the buffer operation
#. returns the buffer layer, raster layer and number of features

.. testcode::

    from qgis import processing
    from qgis.processing import alg
    from qgis.core import QgsProject

    @alg(name='bufferrasteralg', label='Buffer and export to raster (alg)',
         group='examplescripts', group_label='Example scripts')
    # 'INPUT' is the recommended name for the main input parameter
    @alg.input(type=alg.SOURCE, name='INPUT', label='Input vector layer')
    # 'OUTPUT' is the recommended name for the main output parameter
    @alg.input(type=alg.RASTER_LAYER_DEST, name='OUTPUT',
               label='Raster output')
    @alg.input(type=alg.VECTOR_LAYER_DEST, name='BUFFER_OUTPUT',
               label='Buffer output')
    @alg.input(type=alg.DISTANCE, name='BUFFERDIST', label='BUFFER DISTANCE',
               default=1.0)
    @alg.input(type=alg.DISTANCE, name='CELLSIZE', label='RASTER CELL SIZE',
               default=10.0)
    @alg.output(type=alg.NUMBER, name='NUMBEROFFEATURES',
                label='Number of features processed')

    def bufferrasteralg(instance, parameters, context, feedback, inputs):
        """
        Description of the algorithm.
        (If there is no comment here, you will get an error)
        """
        input_featuresource = instance.parameterAsSource(parameters,
                                                         'INPUT', context)
        numfeatures = input_featuresource.featureCount()
        bufferdist = instance.parameterAsDouble(parameters, 'BUFFERDIST',
                                                context)
        rastercellsize = instance.parameterAsDouble(parameters, 'CELLSIZE',
                                                    context)
        if feedback.isCanceled():
            return {}
        buffer_result = processing.run('native:buffer',
                                   {'INPUT': parameters['INPUT'],
                                    'OUTPUT': parameters['BUFFER_OUTPUT'],
                                    'DISTANCE': bufferdist,
                                    'SEGMENTS': 10,
                                    'DISSOLVE': True,
                                    'END_CAP_STYLE': 0,
                                    'JOIN_STYLE': 0,
                                    'MITER_LIMIT': 10
                                    },
                                   is_child_algorithm=True,
                                   context=context,
                                   feedback=feedback)
        if feedback.isCanceled():
            return {}
        rasterized_result = processing.run('qgis:rasterize',
                                   {'LAYER': buffer_result['OUTPUT'],
                                    'EXTENT': buffer_result['OUTPUT'],
                                    'MAP_UNITS_PER_PIXEL': rastercellsize,
                                    'OUTPUT': parameters['OUTPUT']
                                   },
                                   is_child_algorithm=True, context=context,
                                   feedback=feedback)
        if feedback.isCanceled():
            return {}
        return {'OUTPUT': rasterized_result['OUTPUT'],
                'BUFFER_OUTPUT': buffer_result['OUTPUT'],
                'NUMBEROFFEATURES': numfeatures}

As you can see, it involves two algorithms ('native:buffer' and
'qgis:rasterize').
The last one ('qgis:rasterize') creates a raster layer from the buffer
layer that was generated by the first one ('native:buffer').

The part of the code where this processing takes place is not
difficult to understand if you have read the previous chapter.
The first lines, however, need some additional explanation.
They provide the information that is needed to turn your code into
an algorithm that can be run from any of the GUI components, like
the toolbox or the model designer.

These lines are all calls to the ``@alg`` decorator functions that
help simplify the coding of the algorithm.

* The @alg decorator is used to define the name and location of the
  algorithm in the Toolbox.
* The @alg.input decorator is used to define the inputs of the algorithm.
* The @alg.output decorator is used to define the outputs of the algorithm.

.. _processing_algs_input_output:

Input and output types for Processing Algorithms
-------------------------------------------------------

Here is the list of input and output types that are supported in
Processing with their corresponding alg decorator constants
(the :source:`algfactory.py <python/processing/algfactory.py>` file contains
the complete list of alg constants). Sorted on class name.

Input types
...........

.. list-table::
   :widths: 45 31 24
   :header-rows: 1
   :class: longtable

   * - Class
     - Alg constant
     - Description
   * - :class:`QgsProcessingParameterAnnotationLayer <qgis.core.QgsProcessingParameterAnnotationLayer>`
     - ``alg.ANNOTATION_LAYER``
     - An annotation layer
   * - :class:`QgsProcessingParameterAuthConfig <qgis.core.QgsProcessingParameterAuthConfig>`
     - ``alg.AUTH_CFG``
     - Allows users to select from available authentication configurations or
       create new authentication configurations
   * - :class:`QgsProcessingParameterBand <qgis.core.QgsProcessingParameterBand>`
     - ``alg.BAND``
     - A band of a raster layer
   * - :class:`QgsProcessingParameterBoolean <qgis.core.QgsProcessingParameterBoolean>`
     - ``alg.BOOL``
     - A boolean value
   * - :class:`QgsProcessingParameterColor <qgis.core.QgsProcessingParameterColor>`
     - ``alg.COLOR``
     - A color
   * - :class:`QgsProcessingParameterCoordinateOperation <qgis.core.QgsProcessingParameterCoordinateOperation>`
     - ``alg.COORDINATE_OPERATION``
     - A coordinate operation (for CRS transformations)
   * - :class:`QgsProcessingParameterCrs <qgis.core.QgsProcessingParameterCrs>`
     - ``alg.CRS``
     - A Coordinate Reference System
   * - :class:`QgsProcessingParameterDatabaseSchema <qgis.core.QgsProcessingParameterDatabaseSchema>`
     - ``alg.DATABASE_SCHEMA``
     - A database schema
   * - :class:`QgsProcessingParameterDatabaseTable <qgis.core.QgsProcessingParameterDatabaseTable>`
     - ``alg.DATABASE_TABLE``
     - A database table
   * - :class:`ProcessingDateTimeParameterDataType.Date <qgis.gui.Qgis.ProcessingDateTimeParameterDataType>`
     - ``alg.DATE``
     - A pure date
   * - :class:`ProcessingDateTimeParameterDataType.DateTime <qgis.gui.Qgis.ProcessingDateTimeParameterDataType>`
     - ``alg.DATETIME``
     - A datetime
   * - :class:`QgsProcessingParameterDistance <qgis.core.QgsProcessingParameterDistance>`
     - ``alg.DISTANCE``
     - A double numeric parameter for distance values
   * - :class:`QgsProcessingParameterEnum <qgis.core.QgsProcessingParameterEnum>`
     - ``alg.ENUM``
     - An enumeration, allowing for selection from a set of predefined values
   * - :class:`QgsProcessingParameterExpression <qgis.core.QgsProcessingParameterExpression>`
     - ``alg.EXPRESSION``
     - An expression
   * - :class:`QgsProcessingParameterExtent <qgis.core.QgsProcessingParameterExtent>`
     - ``alg.EXTENT``
     - A spatial extent defined by xmin, xmax, ymin, ymax
   * - :class:`QgsProcessingParameterField <qgis.core.QgsProcessingParameterField>`
     - ``alg.FIELD``
     - A field in the attribute table of a vector layer
   * - :class:`QgsProcessingParameterFile <qgis.core.QgsProcessingParameterFile>`
     - ``alg.FILE``
     - A filename of an existing file
   * - :class:`QgsProcessingParameterFileDestination <qgis.core.QgsProcessingParameterFileDestination>`
     - ``alg.FILE_DEST``
     - A filename for a newly created output file
   * - :class:`QgsProcessingParameterFolderDestination <qgis.core.QgsProcessingParameterFolderDestination>`
     - ``alg.FOLDER_DEST``
     - A folder (destination folder)
   * - :class:`QgsProcessingParameterGeometry <qgis.core.QgsProcessingParameterGeometry>`
     - ``alg.GEOMETRY``
     - A geometry
   * - :class:`ProcessingNumberParameterType.Integer <qgis.gui.Qgis.ProcessingNumberParameterType>`
     - ``alg.INT``
     - An integer
   * - :class:`QgsProcessingParameterLayout <qgis.core.QgsProcessingParameterLayout>`
     - ``alg.LAYOUT``
     - A layout
   * - :class:`QgsProcessingParameterLayoutItem <qgis.core.QgsProcessingParameterLayoutItem>`
     - ``alg.LAYOUT_ITEM``
     - A layout item
   * - :class:`QgsProcessingParameterMapLayer <qgis.core.QgsProcessingParameterMapLayer>`
     - ``alg.MAPLAYER``
     - A map layer
   * - :class:`QgsProcessingParameterMapTheme <qgis.core.QgsProcessingParameterMapTheme>`
     - ``alg.MAP_THEME``
     - A project map theme
   * - :class:`QgsProcessingParameterMatrix <qgis.core.QgsProcessingParameterMatrix>`
     - ``alg.MATRIX``
     - A matrix
   * - :class:`QgsProcessingParameterMeshLayer <qgis.core.QgsProcessingParameterMeshLayer>`
     - ``alg.MESH_LAYER``
     - A mesh layer
   * - :class:`QgsProcessingParameterMultipleLayers <qgis.core.QgsProcessingParameterMultipleLayers>`
     - ``alg.MULTILAYER``
     - A set of layers
   * - :class:`ProcessingNumberParameterType.Double <qgis.gui.Qgis.ProcessingNumberParameterType>`
     - ``alg.NUMBER``
     - A numerical value
   * - :class:`QgsProcessingParameterPoint <qgis.core.QgsProcessingParameterPoint>`
     - ``alg.POINT``
     - A point
   * - :class:`QgsProcessingParameterPointCloudDestination <qgis.core.QgsProcessingParameterPointCloudDestination>`
     - ``alg.POINTCLOUD_LAYER_DEST``
     - A point cloud layer destination parameter, for specifying the destination path
       for a point cloud layer created by the algorithm
   * - :class:`QgsProcessingParameterPointCloudLayer <qgis.core.QgsProcessingParameterPointCloudLayer>`
     - ``alg.POINTCLOUD_LAYER``
     - A point cloud layer
   * - :class:`QgsProcessingParameterProviderConnection <qgis.core.QgsProcessingParameterProviderConnection>`
     - ``alg.PROVIDER_CONNECTION``
     - An available connection for a database provider
   * - :class:`QgsProcessingParameterRange <qgis.core.QgsProcessingParameterRange>`
     - ``alg.RANGE``
     - A number range
   * - :class:`QgsProcessingParameterRasterLayer <qgis.core.QgsProcessingParameterRasterLayer>`
     - ``alg.RASTER_LAYER``
     - A raster layer
   * - :class:`QgsProcessingParameterRasterDestination <qgis.core.QgsProcessingParameterRasterDestination>`
     - ``alg.RASTER_LAYER_DEST``
     - A raster layer destination parameter, for specifying the destination path
       for a raster layer created by the algorithm
   * - :class:`QgsProcessingParameterScale <qgis.core.QgsProcessingParameterScale>`
     - ``alg.SCALE``
     - A map scale
   * - :class:`QgsProcessingParameterFeatureSink <qgis.core.QgsProcessingParameterFeatureSink>`
     - ``alg.SINK``
     - A feature sink
   * - :class:`QgsProcessingParameterFeatureSource <qgis.core.QgsProcessingParameterFeatureSource>`
     - ``alg.SOURCE``
     - A feature source
   * - :class:`QgsProcessingParameterString <qgis.core.QgsProcessingParameterString>`
     - ``alg.STRING``
     - A text string
   * - :class:`ProcessingDateTimeParameterDataType.Time <qgis.gui.Qgis.ProcessingDateTimeParameterDataType>`
     - ``alg.TIME``
     - A pure time
   * - :class:`QgsProcessingParameterVectorLayer <qgis.core.QgsProcessingParameterVectorLayer>`
     - ``alg.VECTOR_LAYER``
     - A vector layer
   * - :class:`QgsProcessingParameterVectorDestination <qgis.core.QgsProcessingParameterVectorDestination>`
     - ``alg.VECTOR_LAYER_DEST``
     - A vector layer destination parameter, for specifying the destination path
       for a vector layer created by the algorithm
   * - :class:`QgsProcessingParameterVectorTileDestination <qgis.core.QgsProcessingParameterVectorTileDestination>`
     -
     - A vector tile layer destination parameter, for specifying the destination path
       for a vector tile layer created by the algorithm


Output types
............

.. list-table::
   :widths: 47 24 29
   :header-rows: 1
   :class: longtable

   * - Class
     - Alg constant
     - Description
   * - :class:`QgsProcessingOutputBoolean <qgis.core.QgsProcessingOutputBoolean>`
     - ``alg.BOOL``
     - A boolean value
   * - :class:`QgsProcessingOutputNumber <qgis.core.QgsProcessingOutputNumber>`
     - ``alg.DISTANCE``
     - A double numeric parameter for distance values
   * - :class:`QgsProcessingOutputFile <qgis.core.QgsProcessingOutputFile>`
     - ``alg.FILE``
     - A filename of an existing file
   * - :class:`QgsProcessingOutputFolder <qgis.core.QgsProcessingOutputFolder>`
     - ``alg.FOLDER``
     - A folder
   * - :class:`QgsProcessingOutputHtml <qgis.core.QgsProcessingOutputHtml>`
     - ``alg.HTML``
     - HTML
   * - :class:`QgsProcessingOutputNumber <qgis.core.QgsProcessingOutputNumber>`
     - ``alg.INT``
     - A integer
   * - :class:`QgsProcessingOutputLayerDefinition <qgis.core.QgsProcessingOutputLayerDefinition>`
     - ``alg.LAYERDEF``
     - A layer definition
   * - :class:`QgsProcessingOutputMapLayer <qgis.core.QgsProcessingOutputMapLayer>`
     - ``alg.MAPLAYER``
     - A map layer
   * - :class:`QgsProcessingOutputMultipleLayers <qgis.core.QgsProcessingOutputMultipleLayers>`
     - ``alg.MULTILAYER``
     - A set of layers
   * - :class:`QgsProcessingOutputNumber <qgis.core.QgsProcessingOutputNumber>`
     - ``alg.NUMBER``
     - A numerical value
   * - :class:`QgsProcessingOutputPointCloudLayer <qgis.core.QgsProcessingOutputPointCloudLayer>`
     - ``alg.POINTCLOUD_LAYER``
     - A point cloud layer
   * - :class:`QgsProcessingOutputRasterLayer <qgis.core.QgsProcessingOutputRasterLayer>`
     - ``alg.RASTER_LAYER``
     - A raster layer
   * - :class:`QgsProcessingOutputString <qgis.core.QgsProcessingOutputString>`
     - ``alg.STRING``
     - A text string
   * - :class:`QgsProcessingOutputVectorLayer <qgis.core.QgsProcessingOutputVectorLayer>`
     - ``alg.VECTOR_LAYER``
     - A vector layer
   * - :class:`QgsProcessingOutputVectorTileLayer <qgis.core.QgsProcessingOutputVectorTileLayer>`
     -
     - A vector tile layer


Handing algorithm output
------------------------

When you declare an output representing a layer (raster or vector),
the algorithm will try to add it to QGIS once it is finished.

* Raster layer output: QgsProcessingParameterRasterDestination /
  alg.RASTER_LAYER_DEST.
* Vector layer output: QgsProcessingParameterVectorDestination /
  alg.VECTOR_LAYER_DEST.

So even if the ``processing.run()`` method does not add the layers
it creates to the user's current project,
the two output layers (buffer and raster buffer) will be loaded,
since they are saved to the destinations entered by the user (or to
temporary destinations if the user does not specify destinations).

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

You can provide more information by using
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

You can override the :meth:`flags() <qgis.core.QgsProcessingAlgorithm.flags>`
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
You can find code on the :source:`QGIS <python/plugins/processing/algs/qgis>` repo.
