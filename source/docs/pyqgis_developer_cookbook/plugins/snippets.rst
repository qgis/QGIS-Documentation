.. only:: html

   |updatedisclaimer|

*************
Code Snippets
*************

.. warning:: |outofdate|

.. contents::
   :local:

This section features code snippets to facilitate plugin development.

.. index:: Plugins; Adding shortcut

How to call a method by a key shortcut
--------------------------------------

In the plug-in add to the :func:`initGui()`

::

  self.keyAction = QAction("Test Plugin", self.iface.mainWindow())
  self.iface.registerMainWindowAction(self.keyAction, "F7") # action1 triggered by F7 key
  self.iface.addPluginToMenu("&Test plugins", self.keyAction)
  QObject.connect(self.keyAction, SIGNAL("triggered()"),self.keyActionF7)

To :func:`unload()` add

::

  self.iface.unregisterMainWindowAction(self.keyAction)

The method that is called when F7 is pressed

::

  def keyActionF7(self):
    QMessageBox.information(self.iface.mainWindow(),"Ok", "You pressed F7")

.. index:: Plugins; Toggle layers

How to toggle Layers
--------------------

Since QGIS 2.4 there is new layer tree API that allows direct access to the
layer tree in the legend. Here is an example how to toggle visibility of the
active layer

::

  root = QgsProject.instance().layerTreeRoot()
  node = root.findLayer(iface.activeLayer().id())
  new_state = Qt.Checked if node.isVisible() == Qt.Unchecked else Qt.Unchecked
  node.setVisible(new_state)

.. index:: Plugins; Access attributes of selected features

How to access attribute table of selected features
--------------------------------------------------

.. code-block:: python

  def changeValue(self, value):
    layer = self.iface.activeLayer()
    if(layer):
      nF = layer.selectedFeatureCount()
      if (nF > 0):
        layer.startEditing()
        ob = layer.selectedFeaturesIds()
        b = QVariant(value)
        if (nF > 1):
          for i in ob:
          layer.changeAttributeValue(int(i), 1, b) # 1 being the second column
        else:
          layer.changeAttributeValue(int(ob[0]), 1, b) # 1 being the second column
        layer.commitChanges()
      else:
        QMessageBox.critical(self.iface.mainWindow(), "Error",
          "Please select at least one feature from current layer")
    else:
      QMessageBox.critical(self.iface.mainWindow(), "Error", "Please select a layer")


The method requires one parameter (the new value for the attribute
field of the selected feature(s)) and can be called by

::

  self.changeValue(50)


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |outofdate| replace:: `Despite our constant efforts, information beyond this line may not be updated for QGIS 3. Refer to https://qgis.org/pyqgis/master for the python API documentation or, give a hand to update the chapters you know about. Thanks.`
.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/3.4 for QGIS 3.4 docs and translations.`
