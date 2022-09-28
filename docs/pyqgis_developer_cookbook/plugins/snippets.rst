.. highlight:: python
   :linenothreshold: 5

.. testsetup:: plugin_snippets

    from qgis.core import (
        QgsProject,
    )
    
    import mock

    iface = start_qgis()

    self =  mock.Mock()

    self.iface = iface

    # Add layer to the tree
    root = QgsProject.instance().layerTreeRoot()
    root.addLayer(iface.activeLayer())
    iface.activeLayer().selectAll()


*************
Code Snippets
*************

.. hint:: The code snippets on this page need the following imports if you're outside the pyqgis console:

  .. testcode:: plugin_snippets

    from qgis.core import (
        QgsProject,
        QgsApplication,
        QgsMapLayer,
    )

    from qgis.gui import (
        QgsGui,
        QgsOptionsWidgetFactory,
        QgsOptionsPageWidget,
        QgsLayerTreeEmbeddedWidgetProvider,
        QgsLayerTreeEmbeddedWidgetRegistry,
    )

    from qgis.PyQt.QtCore import Qt
    from qgis.PyQt.QtWidgets import (
        QMessageBox,
        QAction,
        QHBoxLayout,
        QComboBox,
    )
    from qgis.PyQt.QtGui import QIcon

.. only:: html

   .. contents::
      :local:

This section features code snippets to facilitate plugin development.

.. index:: Plugins; Adding shortcut

How to call a method by a key shortcut
--------------------------------------

In the plug-in add to the :func:`initGui()`

.. testcode:: plugin_snippets

  self.key_action = QAction("Test Plugin", self.iface.mainWindow())
  self.iface.registerMainWindowAction(self.key_action, "Ctrl+I")  # action triggered by Ctrl+I
  self.iface.addPluginToMenu("&Test plugins", self.key_action)
  self.key_action.triggered.connect(self.key_action_triggered)

To :func:`unload()` add

.. testcode:: plugin_snippets

  self.iface.unregisterMainWindowAction(self.key_action)

The method that is called when CTRL+I is pressed

.. testcode:: plugin_snippets

  def key_action_triggered(self):
    QMessageBox.information(self.iface.mainWindow(),"Ok", "You pressed Ctrl+I")

It is also possible to allow users to customize key shortcuts for the provided actions.
This is done by adding:

.. testcode:: plugin_snippets

  # in the initGui() function
  QgsGui.shortcutsManager().registerAction(self.key_action)

  # and in the unload() function
  QgsGui.shortcutsManager().unregisterAction(self.key_action)


How to reuse QGIS icons
-----------------------

Because they are well-known and convey a clear message to the users, you may want
sometimes to reuse QGIS icons in your plugin instead of drawing and setting a new one.
Use the :meth:`getThemeIcon() <qgis.core.QgsApplication.getThemeIcon>` method.

For example, to reuse the |fileOpen|
:source:`mActionFileOpen.svg <images/themes/default/mActionFileOpen.svg>` icon available
in the QGIS code repository:

.. code:: py

    # e.g. somewhere in the initGui
    self.file_open_action = QAction(
        QgsApplication.getThemeIcon("/mActionFileOpen.svg"),
        self.tr("Select a File..."),
        self.iface.mainWindow()
    )
    self.iface.addPluginToMenu("MyPlugin", self.file_open_action)

:meth:`iconPath() <qgis.core.QgsApplication.iconPath>` is another method to call QGIS
icons. Find examples of calls to theme icons at `QGIS embedded images - Cheatsheet
<https://static.geotribu.fr/toc_nav_ignored/qgis_resources_preview_table/>`_.


.. index:: Plugins; Customization

Interface for plugin in the options dialog
------------------------------------------

You can add a custom plugin options tab to :menuselection:`Settings --> Options`.
This is preferable over adding a specific main menu entry for your plugin's 
options, as it keeps all of the QGIS application settings and plugin settings in 
a single place which is easy for users to discover and navigate.

The following snippet will just add a new blank tab for the plugin's settings, 
ready for you to populate with all the options and settings specific to your 
plugin.
You can split the following classes into different files. In this example, we are
adding two classes into the main :file:`mainPlugin.py` file.

.. testcode:: plugin_snippets

    class MyPluginOptionsFactory(QgsOptionsWidgetFactory):

        def __init__(self):
            super().__init__()

        def icon(self):
            return QIcon('icons/my_plugin_icon.svg')

        def createWidget(self, parent):
            return ConfigOptionsPage(parent)


    class ConfigOptionsPage(QgsOptionsPageWidget):

        def __init__(self, parent):
            super().__init__(parent)
            layout = QHBoxLayout()
            layout.setContentsMargins(0, 0, 0, 0)
            self.setLayout(layout)

Finally we are adding the imports and modifying the ``__init__`` function:

.. testcode:: plugin_snippets

    from qgis.PyQt.QtWidgets import QHBoxLayout
    from qgis.gui import QgsOptionsWidgetFactory, QgsOptionsPageWidget


    class MyPlugin:
        """QGIS Plugin Implementation."""

        def __init__(self, iface):
            """Constructor.

            :param iface: An interface instance that will be passed to this class
                which provides the hook by which you can manipulate the QGIS
                application at run time.
            :type iface: QgsInterface
            """
            # Save reference to the QGIS interface
            self.iface = iface


        def initGui(self):
            self.options_factory = MyPluginOptionsFactory()
            self.options_factory.setTitle(self.tr('My Plugin'))
            iface.registerOptionsWidgetFactory(self.options_factory)

        def unload(self):
            iface.unregisterOptionsWidgetFactory(self.options_factory)

.. tip:: **Add custom tabs to layer properties dialog**

    You can apply a similar logic to add the plugin custom option to the layer
    properties dialog using the classes
    :class:`QgsMapLayerConfigWidgetFactory <qgis.gui.QgsMapLayerConfigWidgetFactory>`
    and :class:`QgsMapLayerConfigWidget <qgis.gui.QgsMapLayerConfigWidget>`.


.. index:: Embedding widgets

Embed custom widgets for layers in the layer tree
--------------------------------------------------

Beside usual layer symbology elements displayed next or below the layer entry
in the :guilabel:`Layers` panel, you can add your own widgets, allowing for
quick access to some actions that are often used with a layer (setup filtering,
selection, style, refreshing a layer with a button widget, create a layer based
time slider or just show extra layer information in a Label there, or ...).
These so-called **Layer tree embedded widgets** are made available through
the layer's properties :guilabel:`Legend` tab for individual layers.

The following code snippet creates a drop-down in the legend which shows you
the layer-styles available for the layer, allowing to quickly switch between
the different layer styles.

.. testcode:: plugin_snippets

   class LayerStyleComboBox(QComboBox):
       def __init__(self, layer):
           QComboBox.__init__(self)
           self.layer = layer
           for style_name in layer.styleManager().styles():
               self.addItem(style_name)

           idx = self.findText(layer.styleManager().currentStyle())
           if idx != -1:
             self.setCurrentIndex(idx)

           self.currentIndexChanged.connect(self.on_current_changed)

       def on_current_changed(self, index):
           self.layer.styleManager().setCurrentStyle(self.itemText(index))

   class LayerStyleWidgetProvider(QgsLayerTreeEmbeddedWidgetProvider):
       def __init__(self):
           QgsLayerTreeEmbeddedWidgetProvider.__init__(self)

       def id(self):
           return "style"

       def name(self):
           return "Layer style chooser"

       def createWidget(self, layer, widgetIndex):
           return LayerStyleComboBox(layer)

       def supportsLayer(self, layer):
           return True   # any layer is fine

   provider = LayerStyleWidgetProvider()
   QgsGui.layerTreeEmbeddedWidgetRegistry().addProvider(provider)

Then from a given layer's :guilabel:`Legend` properties tab, drag the
``Layer style chooser`` from the :guilabel:`Available widgets` to
:guilabel:`Used widgets` to enable the widget in the layer tree.
Embedded widgets are ALWAYS displayed at the top of their associated layer
node subitems.

If you want to use the widgets from within e.g. a plugin, you can add them
like this:

.. testcode:: plugin_snippets

   layer = iface.activeLayer()
   counter = int(layer.customProperty("embeddedWidgets/count", 0))
   layer.setCustomProperty("embeddedWidgets/count", counter+1)
   layer.setCustomProperty("embeddedWidgets/{}/id".format(counter), "style")
   view = self.iface.layerTreeView()
   view.layerTreeModel().refreshLayerLegend(view.currentLegendNode())
   view.currentNode().setExpanded(True)


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |fileOpen| image:: /static/common/mActionFileOpen.png
   :width: 1.5em
