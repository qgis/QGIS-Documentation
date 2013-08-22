******************
Code Snippets
******************

This section features code snippets to facilitate plugin development.

.. index:: plugins; call method with shortcut

How to call a method by a key shortcut
--------------------------------------

In the plug-in add to the ``initGui()``::

  self.keyAction = QAction("Test Plugin", self.iface.mainWindow())
  self.iface.registerMainWindowAction(self.keyAction, "F7") # action1 is triggered by the F7 key
  self.iface.addPluginToMenu("&Test plugins", self.keyAction)
  QObject.connect(self.keyAction, SIGNAL("triggered()"),self.keyActionF7)

To ``unload()`` add::

  self.iface.unregisterMainWindowAction(self.keyAction)

The method that is called when F7 is pressed::

  def keyActionF7(self):
    QMessageBox.information(self.iface.mainWindow(),"Ok", "You pressed F7")

.. index:: plugins; toggle layers

How to toggle Layers (work around)
----------------------------------

As there is currently no method to directly access the layers in the legend,
here is a workaround how to toggle the layers using layer transparency::

  def toggleLayer(self, lyrNr):
    lyr = self.iface.mapCanvas().layer(lyrNr)
    if lyr:
      cTran = lyr.getTransparency()
      lyr.setTransparency(0 if cTran > 100 else 255)
      self.iface.mapCanvas().refresh()

The method requires the layer number (0 being the top most) and can be called by::

  self.toggleLayer(3)

.. index:: plugins; access attributes of selected features

How to access attribute table of selected features
--------------------------------------------------

::

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
        layer.changeAttributeValue(int(i),1,b) # 1 being the second column
      else:
        layer.changeAttributeValue(int(ob[0]),1,b) # 1 being the second column
      layer.commitChanges()
      else:
        QMessageBox.critical(self.iface.mainWindow(),"Error", "Please select at least one feature from current layer")
    else:
      QMessageBox.critical(self.iface.mainWindow(),"Error","Please select a layer")


The method requires one parameter (the new value for the attribute
field of the selected feature(s)) and can be called by::

  self.changeValue(50)

