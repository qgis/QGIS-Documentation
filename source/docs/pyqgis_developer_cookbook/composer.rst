.. only:: html

   |updatedisclaimer|

.. index:: Map rendering, Map printing

.. _layout:

**************************
Map Rendering and Printing
**************************

.. warning:: |outofdate|

.. contents::
   :local:

There are generally two approaches when input data should be rendered as a map:
either do it quick way using `QgsMapRendererJob` or produce more fine-tuned
output by composing the map with the :class:`QgsLayout <qgis.core.QgsLayout>` class.

.. index:: Map rendering; Simple

Simple Rendering
================

The rendering is done creating a :class:`QgsMapSettings <qgis.core.QgsMapSettings>` object to define the rendering options,
and then constructing a :class:`QgsMapRendererJob <qgis.core.QgsMapRendererJob>` with those options. The latter is then
used to create the resulting image.

Here's an example

.. code-block:: python

  layer=iface.activeLayer()
  options = QgsMapSettings()
  options.setLayers([layer])
  options.setBackgroundColor(QColor(255, 255, 255))
  options.setOutputSize(QSize(800, 600))
  options.setExtent(layer.extent())

  render = QgsMapRendererParallelJob(options)

  def finished():
      img = render.renderedImage()
      img.save("/Users/myuser/render.png","png")
      print("saved")

  render.finished.connect(finished)

  render.start()


Rendering layers with different CRS
====================================

If you have more than one layer and they have a different CRS, the simple
example above will probably not work: to get the right values from the
extent calculations you have to explicitly set the destination CRS

.. code-block:: python

  settings.setLayers(layers)
  render.setDestinationCrs(layers[0].crs())

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
`Qt Graphics View framework <http://doc.qt.io/qt-5/graphicsview.html>`_,
then you are encouraged to check the documentation now, because the layout
is based on it.

The central class of the layout is the :class:`QgsLayout <qgis.core.QgsLayout>` class, which is derived from the Qt :class:`QGraphicsScene` class. Let us create an instance of it:

.. code-block:: python

  p = QgsProject()
  layout = QgsLayout(p)
  layout.initializeDefaults()

Now we can add various elements (map, label, ...) to the layout. All these objects
are represented by classes that inherit from the base :class:`QgsLayoutItem <qgis.core.QgsLayoutItem>` class.

Here's a description of some of the main layout items that can be added to a layout.

* map --- this item tells the libraries where to put the map itself. Here we
  create a map and stretch it over the whole paper size

  .. code-block:: python

    map = QgsLayoutItemMap(layout)
    layout.addItem(mapp)

* label --- allows displaying labels. It is possible to modify its font, color,
  alignment and margin

  .. code-block:: python

    label = QgsLayoutItemLabel(layout)
    label.setText("Hello world")
    label.adjustSizeToText()
    layout.addItem(label)

* legend

  .. code-block:: python

    legend = QgsLayoutItemLegend(layout)
    legend.setLinkedMap(map) # map is an instance of QgsLayoutItemMap
    layout.addItem(legend)

* scale bar

  .. code-block:: python

    item = QgsLayoutItemScaleBar(layout)
    item.setStyle('Numeric') # optionally modify the style
    item.setLinkedMap(map) # map is an instance of QgsLayoutItemMap
    item.applyDefaultSize()
    layout.addItem(item)

* arrow
* picture
* basic shape
* nodes based shape

  .. code-block:: python

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

.. code-block:: python

  composerLabel.setFrameEnabled(False)

Besides creating the layout items by hand, QGIS has support for layout
templates which are essentially compositions with all their items saved to a
.qpt file (with XML syntax).

Once the composition is ready (the layout items have been created and added
to the composition), we can proceed to produce a raster and/or vector output.

.. index:: Output; Raster image

Exporting the layout
------------------------

To export a layout, the :class:`QgsLayoutExporter <qgis.core.QgsLayoutExporter>` class must be used.

.. code-block:: python

  exporter = QgsLayoutExporter(layout)
  exporter.exportToPdf("path/to/output/pdf", QgsLayoutExporter.PdfExportSettings())

Use the :meth:`exportToImage() <qgis.core.QgsLayoutExporter.exportToImage>` in case you want to export to an image instead of a PDF file.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |outofdate| replace:: `Despite our constant efforts, information beyond this line may not be updated for QGIS 3. Refer to https://qgis.org/pyqgis/master for the python API documentation or, give a hand to update the chapters you know about. Thanks.`
.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
