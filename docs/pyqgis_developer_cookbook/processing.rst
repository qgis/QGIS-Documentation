.. highlight:: python
   :linenothreshold: 5

.. Tests are skipped because they fail to import from processing_provider under CI
.. everything runs fine when testing locally with make -f docker.mk doctest

.. testsetup:: processing

    iface = start_qgis()

.. index:: Plugins; Processing algorithm
.. _processing_plugin:

****************************
Writing a Processing plugin
****************************

.. only:: html

   .. contents::
      :local:

Depending on the kind of plugin that you are going to develop, it might be a better
option to add its functionality as a Processing algorithm (or a set of them).
That would provide a better integration within QGIS, additional functionality (since
it can be run in the components of Processing, such as the modeler or the batch
processing interface), and a quicker development time (since Processing will take of
a large part of the work).

To distribute those algorithms, you should create a new plugin that adds them to the
Processing Toolbox. The plugin should contain an algorithm provider, which has to be
registered when the plugin is instantiated.

Updating a plugin
=================

If you want to add your existing plugin to Processing, you need to add some code.

#. In your :file:`metadata.txt` file, you need to add a variable:

   .. code-block:: ini

    hasProcessingProvider=yes

#. In the Python file where your plugin is setup with the ``initGui`` method,
   you need to adapt some lines like this:

   .. testcode:: processing
      :skipif: True

      from qgis.core import QgsApplication
      from .processing_provider.provider import Provider

      class YourPluginName:

          def __init__(self):
              self.provider = None

          def initProcessing(self):
              self.provider = Provider()
              QgsApplication.processingRegistry().addProvider(self.provider)

          def initGui(self):
              self.initProcessing()

          def unload(self):
              QgsApplication.processingRegistry().removeProvider(self.provider)

#. You can create a folder :file:`processing_provider` with three files in it:

   * :file:`__init__.py` with nothing in it. This is necessary to make a valid
     Python package.
   * :file:`provider.py` which will create the Processing provider and expose
     your algorithms.

     .. testcode:: processing
        :skipif: True

        from qgis.core import QgsProcessingProvider
        from qgis.PyQt.QtGui import QIcon

        from .example_processing_algorithm import ExampleProcessingAlgorithm

        class Provider(QgsProcessingProvider):

            """ The provider of our plugin. """

            def loadAlgorithms(self):
                """ Load each algorithm into the current provider. """
                self.addAlgorithm(ExampleProcessingAlgorithm())
                # add additional algorithms here
                # self.addAlgorithm(MyOtherAlgorithm())

            def id(self) -> str:
                """The ID of your plugin, used for identifying the provider.

                This string should be a unique, short, character only string,
                eg "qgis" or "gdal". This string should not be localised.
                """
                return 'yourplugin'

            def name(self) -> str:
                """The human friendly name of your plugin in Processing.

                This string should be as short as possible (e.g. "Lastools", not
                "Lastools version 1.0.1 64-bit") and localised.
                """
                return self.tr('Your plugin')

            def icon(self) -> QIcon:
                """Should return a QIcon which is used for your provider inside
                the Processing toolbox.
                """
                return QgsProcessingProvider.icon(self)

   * :file:`example_processing_algorithm.py` which contains the example
     algorithm file. Copy/paste the content of the :source:`script template
     file <python/plugins/processing/script/ScriptTemplate.py>` and
     update it according to your needs.

   You should have a tree similar to this:

   .. code-block:: bash

    └── your_plugin_root_folder
       ├── __init__.py
       ├── LICENSE
       ├── metadata.txt
       └── processing_provider
             ├── example_processing_algorithm.py
             ├── __init__.py
             └── provider.py

#. Now you can reload your plugin in QGIS and you should see your example
   script in the Processing toolbox and modeler.

Creating a custom algorithm
---------------------------

Here's a simple example of a custom buffer algorithm:

.. testcode:: processing

    from qgis.core import (
        QgsProcessingAlgorithm,
        QgsProcessingParameterFeatureSource,
        QgsProcessingParameterNumber,
        QgsProcessingParameterFeatureSink,
        QgsFeatureSink,
    )

    class BufferAlgorithm(QgsProcessingAlgorithm):

        INPUT = 'INPUT'
        DISTANCE = 'DISTANCE'
        OUTPUT = 'OUTPUT'

        def initAlgorithm(self, config=None):
            self.addParameter(QgsProcessingParameterFeatureSource(self.INPUT, 'Input layer'))
            self.addParameter(QgsProcessingParameterNumber(self.DISTANCE, 'Buffer distance', defaultValue=100.0))
            self.addParameter(QgsProcessingParameterFeatureSink(self.OUTPUT, 'Output layer'))

        def processAlgorithm(self, parameters, context, feedback):
            source = self.parameterAsSource(parameters, self.INPUT, context)
            distance = self.parameterAsDouble(parameters, self.DISTANCE, context)
            (sink, dest_id) = self.parameterAsSink(parameters, self.OUTPUT, context,
                                                   source.fields(), source.wkbType(), source.sourceCrs())

            for f in source.getFeatures():
                f.setGeometry(f.geometry().buffer(distance, 5))
                sink.addFeature(f, QgsFeatureSink.FastInsert)

            return {self.OUTPUT: dest_id}

        def name(self):
            return 'buffer'

        def displayName(self):
            return 'Buffer Features'

        def group(self):
            return 'Examples'

        def groupId(self):
            return 'examples'

        def createInstance(self):
            return BufferAlgorithm()
