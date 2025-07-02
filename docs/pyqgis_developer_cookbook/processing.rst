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

Creating from scratch
=====================

To create a plugin from scratch which contains an algorithm provider, you can
follow these steps using the Plugin Builder:

#. Install the **Plugin Builder** plugin
#. Create a new plugin using the Plugin Builder. When the Plugin Builder asks you for
   the template to use, select "Processing provider".
#. The created plugin contains a provider with a single algorithm. Both the provider
   file and the algorithm file are fully commented and contain information about how to
   modify the provider and add additional algorithms. Refer to them for more information.

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

Implementing custom Processing algorithms
=========================================

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

Customizing the algorithm dialog
--------------------------------

Custom dialogs are especially useful when working with nested or dynamic inputs, 
when parameters depend on external data sources such as APIs (e.g. dynamically populated dropdowns), 
or when you need advanced validation and custom layout behavior that isn’t supported by the default Processing dialog.
To override the default UI (e.g. for complex parameter types or dynamic logic),
subclass :class:`QgsProcessingAlgorithmDialogBase <qgis.gui.QgsProcessingAlgorithmDialogBase>`.
To render your custom UI in the standard Processing dialog window, you must call ``self.setMainWidget(panel)``,
where ``panel`` is a :class:`QgsPanelWidget <qgis.gui.QgsPanelWidget>` containing your custom layout.
This ensures your interface is correctly displayed and interacts properly with the Processing framework.

Here is an example that integrates signal management using QTimer_ for debounced input:

.. testcode:: processing

    from qgis.PyQt.QtCore import Qt, QT_VERSION_STR, QTimer
    from qgis.core import (
        QgsProcessingAlgorithm,
        QgsProcessingContext,
        QgsProcessingFeedback,
        Qgis,
    )
    from qgis.PyQt.QtWidgets import QWidget, QVBoxLayout, QLineEdit
    from qgis import gui, processing
    from datetime import datetime
    from typing import Dict, Optional
    from osgeo import gdal

    class CustomAlgorithmDialog(gui.QgsProcessingAlgorithmDialogBase):
        def __init__(
            self,
            algorithm: QgsProcessingAlgorithm,
            parent: Optional[QWidget] = None,
            title: Optional[str] = None,
        ):
            super().__init__(
                parent,
                flags=Qt.WindowFlags(),
                mode=gui.QgsProcessingAlgorithmDialogBase.DialogMode.Single,
            )
            self.context = QgsProcessingContext()
            self.setAlgorithm(algorithm)
            self.setModal(True)
            self.setWindowTitle(title or algorithm.displayName())

            self.panel = gui.QgsPanelWidget()
            layout = self.buildDialog()
            self.panel.setLayout(layout)
            self.setMainWidget(self.panel)

            self.cancelButton().clicked.connect(self.reject)

        def buildDialog(self) -> QVBoxLayout:
            layout = QVBoxLayout()

            self.input = QLineEdit()

            # Set up a debounced signal using QTimer
            self._update_timer = QTimer(self, singleShot=True)
            self._update_timer.timeout.connect(self._on_collection_id_ready)
            self.input.textChanged.connect(self._on_collection_id_changed)

            layout.addWidget(self.input)

            return layout

        def _on_collection_id_changed(self):
            self._update_timer.start(500)  # Debounce input

        def _on_collection_id_ready(self):
            self.pushInfo("Fetching metadata for collection ID…")

        def getParameters(self) -> Dict:
            try:
                return {'DISTANCE': float(self.input.text())}
            except ValueError:
                raise ValueError("Invalid buffer distance")

        def processingContext(self):
            return self.context

        def createFeedback(self):
            return QgsProcessingFeedback()

        def runAlgorithm(self):
            context = self.processingContext()
            feedback = self.createFeedback()
            params = self.getParameters()

            self.pushDebugInfo(f"QGIS version: {Qgis.QGIS_VERSION}")
            self.pushDebugInfo(f"QGIS code revision: {Qgis.QGIS_DEV_VERSION}")
            self.pushDebugInfo(f"Qt version: {QT_VERSION_STR}")
            self.pushDebugInfo(f"GDAL version: {gdal.VersionInfo('--version')}")
            self.pushCommandInfo(f"Algorithm started at: {datetime.now().isoformat(timespec='seconds')}")
            self.pushCommandInfo(f"Algorithm '{self.algorithm().displayName()}' starting…")
            self.pushCommandInfo("Input parameters:")
            for k, v in params.items():
                self.pushCommandInfo(f"  {k}: {v}")

            results = processing.run(self.algorithm(), params, context=context, feedback=feedback)
            self.setResults(results)
            self.showLog()


To launch the custom dialog for a given algorithm, simply instantiate
``CustomAlgorithmDialog`` with your algorithm instance and call ``exec()``:

.. testcode:: processing
   :skipif: True

   dlg = CustomAlgorithmDialog(BufferAlgorithm())
   dlg.exec()

Managing Qt Signals
-------------------

When building reactive dialogs, manage signal connections carefully. 
The above pattern uses a QTimer_ to debounce input from the text field, preventing rapid repeated calls. 
This is especially useful when fetching metadata or updating UI elements based on user input. 
Always connect signals once (typically in ``__init__``) and use ``singleShot=True``
to ensure the slot is triggered only once after a delay.

.. _QTimer: https://doc.qt.io/archives/qt-5.15/qtimer.html
