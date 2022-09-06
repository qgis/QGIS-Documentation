.. highlight:: python
   :linenothreshold: 5

.. testsetup:: pluginlayer

   iface = start_qgis()


.. index:: Plugin layers
.. _pluginlayer:

*******************
Using Plugin Layers
*******************

.. hint:: The code snippets on this page need the following imports if you're outside the pyqgis console:

  .. testcode:: pluginlayer

    from qgis.core import (
        QgsPluginLayer,
        QgsPluginLayerType,
        QgsMapLayerRenderer,
        QgsApplication,
        QgsProject,
    )

    from qgis.PyQt.QtGui import QImage

.. only:: html

   .. contents::
      :local:

If your plugin uses its own methods to render a map layer, writing your own
layer type based on :class:`QgsPluginLayer <qgis.core.QgsPluginLayer>` might be the best way to implement that.

.. index:: Plugin layers; Subclassing QgsPluginLayer

Subclassing QgsPluginLayer
==========================

Below is an example of a minimal QgsPluginLayer implementation. It is based on
the original code  of the `Watermark example plugin <https://github.com/sourcepole/qgis-watermark-plugin>`_.

The custom renderer is the part of the implement that defines the actual drawing on the canvas.

.. testcode:: pluginlayer
    :skipif: True

    class WatermarkLayerRenderer(QgsMapLayerRenderer):

        def __init__(self, layerId, rendererContext):
            super().__init__(layerId, rendererContext)

        def render(self):
            image = QImage("/usr/share/icons/hicolor/128x128/apps/qgis.png")
            painter = self.renderContext().painter()
            painter.save()
            painter.drawImage(10, 10, image)
            painter.restore()
            return True

    class WatermarkPluginLayer(QgsPluginLayer):

        LAYER_TYPE="watermark"

        def __init__(self):
            super().__init__(WatermarkPluginLayer.LAYER_TYPE, "Watermark plugin layer")
            self.setValid(True)

        def createMapRenderer(self, rendererContext):
            return WatermarkLayerRenderer(self.id(), rendererContext)

        def setTransformContext(self, ct):
            pass

        # Methods for reading and writing specific information to the project file can
        # also be added:

        def readXml(self, node, context):
            pass

        def writeXml(self, node, doc, context):
            pass


The plugin layer can be added to the project and to the canvas as
any other map layer:

.. testcode:: pluginlayer
    :skipif: True

    plugin_layer = WatermarkPluginLayer()
    QgsProject.instance().addMapLayer(plugin_layer)

When loading a project containing such a layer, a factory class is needed:

.. testcode:: pluginlayer
    :skipif: True

    class WatermarkPluginLayerType(QgsPluginLayerType):

        def __init__(self):
            super().__init__(WatermarkPluginLayer.LAYER_TYPE)

        def createLayer(self):
            return WatermarkPluginLayer()

        # You can also add GUI code for displaying custom information
        # in the layer properties
        def showLayerProperties(self, layer):
            pass


    # Keep a reference to the instance in Python so it won't
    # be garbage collected
    plt =  WatermarkPluginLayerType()

    assert QgsApplication.pluginLayerRegistry().addPluginLayerType(plt)
