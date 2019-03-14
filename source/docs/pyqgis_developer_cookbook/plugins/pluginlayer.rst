.. only:: html

   |updatedisclaimer|

.. index:: Plugin layers

.. _pluginlayer:

*******************
Using Plugin Layers
*******************

.. warning:: |outofdate|

If your plugin uses its own methods to render a map layer, writing your own
layer type based on QgsPluginLayer might be the best way to implement that.

**TODO:**
   Check correctness and elaborate on good use cases for QgsPluginLayer, ...

.. index:: Plugin layers; Subclassing QgsPluginLayer

Subclassing QgsPluginLayer
==========================

Below is an example of a minimal QgsPluginLayer implementation. It is an
excerpt of the `Watermark example plugin <https://github.com/sourcepole/qgis-watermark-plugin>`_

::

  class WatermarkPluginLayer(QgsPluginLayer):

    LAYER_TYPE="watermark"

    def __init__(self):
      QgsPluginLayer.__init__(self, WatermarkPluginLayer.LAYER_TYPE, "Watermark plugin layer")
      self.setValid(True)

    def draw(self, rendererContext):
      image = QImage("myimage.png")
      painter = rendererContext.painter()
      painter.save()
      painter.drawImage(10, 10, image)
      painter.restore()
      return True

Methods for reading and writing specific information to the project file can
also be added

::

    def readXml(self, node):
      pass

    def writeXml(self, node, doc):
      pass


When loading a project containing such a layer, a factory class is needed

::

  class WatermarkPluginLayerType(QgsPluginLayerType):

    def __init__(self):
      QgsPluginLayerType.__init__(self, WatermarkPluginLayer.LAYER_TYPE)

    def createLayer(self):
      return WatermarkPluginLayer()

You can also add code for displaying custom information in the layer properties

::

    def showLayerProperties(self, layer):
      pass


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |outofdate| replace:: `Despite our constant efforts, information beyond this line may not be updated for QGIS 3. Refer to https://qgis.org/pyqgis/master for the python API documentation or, give a hand to update the chapters you know about. Thanks.`
.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/3.4 for QGIS 3.4 docs and translations.`
