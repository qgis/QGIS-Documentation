.. index:: Map rendering, Map printing

.. highlight:: python
   :linenothreshold: 5

.. testsetup:: composer

    iface = start_qgis()

The code snippets on this page need the following imports:

.. testcode:: composer

    import os

    from qgis.core import (
        QgsGeometry,
        QgsMapSettings,
        QgsPrintLayout,
        QgsMapSettings,
        QgsMapRendererParallelJob,
        QgsLayoutItemLabel,
        QgsLayoutItemLegend,
        QgsLayoutItemMap,
        QgsLayoutItemPolygon,
        QgsLayoutItemScaleBar,
        QgsLayoutExporter,
        QgsLayoutItem,
        QgsLayoutPoint,
        QgsLayoutSize,
        QgsUnitTypes,
        QgsProject,
        QgsFillSymbol,
    )

    from qgis.PyQt.QtGui import (
        QPolygonF,
        QColor,
    )

    from qgis.PyQt.QtCore import (
        QPointF,
        QRectF,
        QSize,
    )

.. _layout:

**************************
Map Rendering and Printing
**************************

.. contents::
   :local:

There are generally two approaches when input data should be rendered as a map:
either do it quick way using `QgsMapRendererJob` or produce more fine-tuned
output by composing the map with the :class:`QgsLayout <qgis.core.QgsLayout>` class.

.. index:: Map rendering; Simple

Simple Rendering
================

The rendering is done creating a :class:`QgsMapSettings <qgis.core.QgsMapSettings>` object to define the rendering settings,
and then constructing a :class:`QgsMapRendererJob <qgis.core.QgsMapRendererJob>` with those settings. The latter is then
used to create the resulting image.

Here's an example:

.. testcode:: composer

 image_location = os.path.join(QgsProject.instance().homePath(), "render.png")

 vlayer = iface.activeLayer()
 settings = QgsMapSettings()
 settings.setLayers([vlayer])
 settings.setBackgroundColor(QColor(255, 255, 255))
 settings.setOutputSize(QSize(800, 600))
 settings.setExtent(vlayer.extent())

 render = QgsMapRendererParallelJob(settings)

 def finished():
     img = render.renderedImage()
     # save the image; e.g. img.save("/Users/myuser/render.png","png")
     img.save(image_location, "png")

 render.finished.connect(finished)

 # Start the rendering
 render.start()

 # The following loop is not normally required, we
 # are using it here because this is a standalone example.
 from qgis.PyQt.QtCore import QEventLoop
 loop = QEventLoop()
 render.finished.connect(loop.quit)
 loop.exec_()


Rendering layers with different CRS
====================================

If you have more than one layer and they have a different CRS, the simple
example above will probably not work: to get the right values from the
extent calculations you have to explicitly set the destination CRS


.. testcode:: composer

  layers = [iface.activeLayer()]
  settings.setLayers(layers)
  settings.setDestinationCrs(layers[0].crs())

.. index:: Output; Using print layout

Output using print layout
=========================

Print layout is a very handy tool if you would like to do a more sophisticated
output than the simple rendering shown above. It is possible
to create complex map layouts consisting of map views, labels, legend, tables
and other elements that are usually present on paper maps. The layouts can be
then exported to PDF, raster images or directly printed on a printer.

The layout consists of a bunch of classes. They all belong to the core
library. QGIS application has a convenient GUI for placement of the elements,
though it is not available in the GUI library. If you are not familiar with
`Qt Graphics View framework <https://doc.qt.io/qt-5/graphicsview.html>`_,
then you are encouraged to check the documentation now, because the layout
is based on it.

The central class of the layout is the :class:`QgsLayout <qgis.core.QgsLayout>`
class, which is derived from the Qt `QGraphicsScene <https://doc.qt.io/qt-5/qgraphicsscene.html>`_
class. Let us create an instance of it:

.. testcode:: composer

  project = QgsProject()
  layout = QgsPrintLayout(project)
  layout.initializeDefaults()

Now we can add various elements (map, label, ...) to the layout. All these objects
are represented by classes that inherit from the base :class:`QgsLayoutItem <qgis.core.QgsLayoutItem>` class.

Here's a description of some of the main layout items that can be added to a layout.

* map --- this item tells the libraries where to put the map itself. Here we
  create a map and stretch it over the whole paper size

  .. testcode:: composer

    map = QgsLayoutItemMap(layout)
    layout.addItem(map)

* label --- allows displaying labels. It is possible to modify its font, color,
  alignment and margin

  .. testcode:: composer

    label = QgsLayoutItemLabel(layout)
    label.setText("Hello world")
    label.adjustSizeToText()
    layout.addItem(label)

* legend

  .. testcode:: composer

    legend = QgsLayoutItemLegend(layout)
    legend.setLinkedMap(map) # map is an instance of QgsLayoutItemMap
    layout.addItem(legend)

* scale bar

  .. testcode:: composer

    item = QgsLayoutItemScaleBar(layout)
    item.setStyle('Numeric') # optionally modify the style
    item.setLinkedMap(map) # map is an instance of QgsLayoutItemMap
    item.applyDefaultSize()
    layout.addItem(item)

* arrow
* picture
* basic shape
* nodes based shape

  .. testcode:: composer

    polygon = QPolygonF()
    polygon.append(QPointF(0.0, 0.0))
    polygon.append(QPointF(100.0, 0.0))
    polygon.append(QPointF(200.0, 100.0))
    polygon.append(QPointF(100.0, 200.0))

    polygonItem = QgsLayoutItemPolygon(polygon, layout)
    layout.addItem(polygonItem)

    props = {}
    props["color"] = "green"
    props["style"] = "solid"
    props["style_border"] = "solid"
    props["color_border"] = "black"
    props["width_border"] = "10.0"
    props["joinstyle"] = "miter"

    symbol = QgsFillSymbol.createSimple(props)
    polygonItem.setSymbol(symbol)

* table

Once an item is added to the layout, it can be moved and resized:

::

  item.attemptMove(QgsLayoutPoint(1.4, 1.8, QgsUnitTypes.LayoutCentimeters))
  item.attemptResize(QgsLayoutSize(2.8, 2.2, QgsUnitTypes.LayoutCentimeters))

A frame is drawn around each item by default. You can remove it as follows:

.. testcode:: composer

  # for a composer label
  label.setFrameEnabled(False)

Besides creating the layout items by hand, QGIS has support for layout
templates which are essentially compositions with all their items saved to a
.qpt file (with XML syntax).

Once the composition is ready (the layout items have been created and added
to the composition), we can proceed to produce a raster and/or vector output.

.. index:: Output; Raster image

Exporting the layout
------------------------

To export a layout, the :class:`QgsLayoutExporter <qgis.core.QgsLayoutExporter>` class must be used.

.. testcode:: composer

   base_path = os.path.join(QgsProject.instance().homePath())
   pdf_path = os.path.join(base_path, "output.pdf")

   exporter = QgsLayoutExporter(layout)
   exporter.exportToPdf(pdf_path, QgsLayoutExporter.PdfExportSettings())

Use the :meth:`exportToImage() <qgis.core.QgsLayoutExporter.exportToImage>`
in case you want to export to an image instead of a PDF file.

Exporting a layout atlas
------------------------

If you want to export all pages from a layout that has the atlas option
configured and enabled, you need to use the :meth:`atlas()
<qgis.core.QgsPrintLayout.atlas>` method in the exporter (:class:`QgsLayoutExporter
<qgis.core.QgsLayoutExporter>`) with small adjustments. In the following
example, the pages are exported to PNG images:

.. testcode:: composer

   exporter.exportToImage(layout.atlas(), base_path, 'png', QgsLayoutExporter.ImageExportSettings())

Notice that the outputs will be saved in the base path folder, using the output
filename expression configured on atlas.

