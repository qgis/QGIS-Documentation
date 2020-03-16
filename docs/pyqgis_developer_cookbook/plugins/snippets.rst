.. only:: html


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

::

  self.key_action = QAction("Test Plugin", self.iface.mainWindow())
  self.iface.registerMainWindowAction(self.key_action, "Ctrl+I")  # action triggered by Ctrl+I
  self.iface.addPluginToMenu("&Test plugins", self.key_action)
  self.key_action.triggered.connect(self.key_action_triggered)

To :func:`unload()` add

::

  self.iface.unregisterMainWindowAction(self.key_action)

The method that is called when CTRL+I is pressed

::

  def key_action_triggered(self):
    QMessageBox.information(self.iface.mainWindow(),"Ok", "You pressed Ctrl+I")

.. index:: Plugins; Toggle layers

How to toggle Layers
--------------------

There is an API to access layers in the legend.
Here is an example that toggles the visibility of the active layer
::

  root = QgsProject.instance().layerTreeRoot()
  node = root.findLayer(iface.activeLayer().id())
  new_state = Qt.Checked if node.isVisible() == Qt.Unchecked else Qt.Unchecked
  node.setItemVisibilityChecked(new_state)

.. index:: Plugins; Access attributes of selected features

How to access attribute table of selected features
--------------------------------------------------

.. code-block:: python

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


The method requires one parameter (the new value for the second
field of the selected feature(s)) and can be called by

::

  changeValue(50)
