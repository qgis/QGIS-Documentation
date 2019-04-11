.. only:: html

   |updatedisclaimer|

.. index:: Plugins; Processing algorithm
.. _processing_plugin:

****************************
Writing a Processing plugin
****************************

.. contents::
   :local:

Depending on the kind of plugin that you are going to develop, it might be better
option to add its functionality as a Processing algorithm (or a set of them).
That would provide a better integration within QGIS, additional functionality (since
it can be run in the components of Processing, such as the modeler or the batch
processing interface), and a quicker development time (since Processing will take of
a large part of the work).

To distribute those algorithms, you should create a new plugin that adds them to the
Processing Toolbox. The plugin should contain an algorithm provider, which has to be
registered when the plugin is instantiated.

To create a plugin from scratch which contains an algorithm provider, you can
follow these steps using the Plugin Builder:

* Install the Plugin Builder plugin
* Create a new plugin using the Plugin Builder. When the Plugin Builder asks you for
  the template to use, select "Processing provider".
* The created plugin contains a provider with a single algorithm. Both the provider
  file and the algorithm file are fully commented and contain information about how to
  modify the provider and add additional algorithms. Refer to them for more information.

If you want to add your existing plugin to Processing, you need to add some code.

In your :file:`metadata.txt`, you need to add a variable:

.. code-block:: ini

    hasProcessingProvider=yes

In the Python file where your plugin is setup with the ``initGui`` method,
you need to adapt some lines like this:

.. code-block:: python

   from qgis.core import QgsApplication
   from .processing_provider import Provider


   class YourPluginName():

       def __init__(self):
           self.provider = None

       def initProcessing(self):
           self.provider = Provider()
           QgsApplication.processingRegistry().addProvider(self.provider)

       def initGui(self):
           self.initProcessing()

       def unload(self):
           QgsApplication.processingRegistry().removeProvider(self.provider)

You can create a folder :file:`processing_provider` with three files in it:

* :file:`__init__.py` with nothing in it. This is necessary to make a valid Python package.

* :file:`provider.py` which will create the Processing provider and expose your algorithms.

.. code-block:: python

   from qgis.core import QgsProcessingProvider

   from .example_processing_algorithm import ExampleProcessingAlgorithm


   class Provider(QgsProcessingProvider):

       def loadAlgorithms(self, *args, **kwargs):
           self.addAlgorithm(ExampleProcessingAlgorithm())
           # add additional algorithms here
           # self.addAlgorithm(MyOtherAlgorithm())

       def id(self, *args, **kwargs):
           """The ID of your plugin, used for identifying the provider.

           This string should be a unique, short, character only string,
           eg "qgis" or "gdal". This string should not be localised.
           """
           return 'yourplugin'

       def name(self, *args, **kwargs):
           """The human friendly name of your plugin in Processing.

           This string should be as short as possible (e.g. "Lastools", not
           "Lastools version 1.0.1 64-bit") and localised.
           """
           return self.tr('Your plugin')

       def icon(self):
           """Should return a QIcon which is used for your provider inside
           the Processing toolbox.
           """
           return QgsProcessingProvider.icon(self)

* :file:`example_processing_algorithm.py` which contains the example algorithm file.
  Copy/paste the content of the script template:
  https://github.com/qgis/QGIS/blob/master/python/plugins/processing/script/ScriptTemplate.py

Now you can reload your plugin in QGIS and you should see your example script in
the Processing toolbox and modeler.

.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/3.4 for QGIS 3.4 docs and translations.`
