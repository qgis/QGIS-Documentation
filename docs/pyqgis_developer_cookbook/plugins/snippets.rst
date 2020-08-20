
.. highlight:: python
   :linenothreshold: 5

.. testsetup:: plugin_snippets

    from qgis.core import (
        QgsProject,
    )

    from qgis.gui import (
        QgsOptionsWidgetFactory,
        QgsOptionsPageWidget
    )

    from qgis.PyQt.QtCore import Qt
    from qgis.PyQt.QtWidgets import QMessageBox, QAction, QHBoxLayout
    from qgis.PyQt.QtGui import QIcon

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

.. index:: Plugins; Toggle layers

How to toggle Layers
--------------------

There is an API to access layers in the legend.
Here is an example that toggles the visibility of the active layer


.. testcode:: plugin_snippets

  root = QgsProject.instance().layerTreeRoot()
  node = root.findLayer(iface.activeLayer().id())
  new_state = Qt.Checked if node.isVisible() == Qt.Unchecked else Qt.Unchecked
  node.setItemVisibilityChecked(new_state)

.. index:: Plugins; Access attributes of selected features

How to access attribute table of selected features
--------------------------------------------------

.. testcode:: plugin_snippets

    def change_value(value):
        """Change the value in the second column for all selected features.

        :param value: The new value.
        """
        layer = iface.activeLayer()
        if layer:
            count_selected = layer.selectedFeatureCount()
            if count_selected > 0:
                layer.startEditing()
                id_features = layer.selectedFeatureIds()
                for i in id_features:
                    layer.changeAttributeValue(i, 1, value) # 1 being the second column
                layer.commitChanges()
            else:
                iface.messageBar().pushCritical("Error",
                    "Please select at least one feature from current layer")
        else:
            iface.messageBar().pushCritical("Error", "Please select a layer")

    # The method requires one parameter (the new value for the second
    # field of the selected feature(s)) and can be called by
    change_value(50)

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

.. tip:: You can apply a similar logic to add the plugin custom option to the layer 
    properties dialog using the classes :class:`QgsMapLayerConfigWidgetFactory <qgis.gui.QgsMapLayerConfigWidgetFactory>` 
    and :class:`QgsMapLayerConfigWidget <qgis.gui.QgsMapLayerConfigWidget>`.