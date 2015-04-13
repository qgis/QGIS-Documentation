.. index:: map rendering, map printing

.. _composer:

**************************
Map Rendering and Printing
**************************

There are generally two approaches when input data should be rendered as a map:
either do it quick way using :class:`QgsMapRenderer` or produce more fine-tuned
output by composing the map with :class:`QgsComposition` class and friends.

.. index:: map rendering; simple

Simple Rendering
================

Render some layers using :class:`QgsMapRenderer` --- create destination paint
device (``QImage``, ``QPainter`` etc.), set up layer set, extent, output size
and do the rendering

::

  # create image
  img = QImage(QSize(800, 600), QImage.Format_ARGB32_Premultiplied)

  # set image's background color
  color = QColor(255, 255, 255)
  img.fill(color.rgb())

  # create painter
  p = QPainter()
  p.begin(img)
  p.setRenderHint(QPainter.Antialiasing)

  render = QgsMapRenderer()

  # set layer set
  lst = [layer.getLayerID()]  # add ID of every layer
  render.setLayerSet(lst)

  # set extent
  rect = QgsRect(render.fullExtent())
  rect.scale(1.1)
  render.setExtent(rect)

  # set output size
  render.setOutputSize(img.size(), img.logicalDpiX())

  # do the rendering
  render.render(p)

  p.end()

  # save image
  img.save("render.png","png")



Rendering layers with different CRS
====================================

If you have more than one layer and they have a different CRS, the simple
example above will probably not work: to get the right values from the
extent calculations you have to explicitly set the destination CRS and enable
OTF reprojection as in the example below (only the renderer configuration
part is reported)


::

    ...
    # set layer set
    layers = QgsMapLayerRegistry.instance().mapLayers()
    lst = layers.keys()
    render.setLayerSet(lst)

    # Set destination CRS to match the CRS of the first layer
    render.setDestinationCrs(layers.values()[0].crs())
    # Enable OTF reprojection
    render.setProjectionsEnabled(True)
    ...


.. index:: output; using Map Composer

Output using Map Composer
=========================

Map composer is a very handy tool if you would like to do a more sophisticated
output than the simple rendering shown above. Using the composer it is possible
to create complex map layouts consisting of map views, labels, legend, tables
and other elements that are usually present on paper maps. The layouts can be
then exported to PDF, raster images or directly printed on a printer.

The composer consists of a bunch of classes. They all belong to the core
library. QGIS application has a convenient GUI for placement of the elements,
though it is not available in the GUI library. If you are not familiar with
`Qt Graphics View framework <http://doc.qt.nokia.com/stable/graphicsview.html>`_,
then you are encouraged to check the documentation now, because the composer
is based on it.

The central class of the composer is :class:`QgsComposition` which is derived
from :class:`QGraphicsScene`. Let us create one

::

  mapRenderer = iface.mapCanvas().mapRenderer()
  c = QgsComposition(mapRenderer)
  c.setPlotStyle(QgsComposition.Print)

Note that the composition takes an instance of :class:`QgsMapRenderer`. In the
code we expect we are running within QGIS application and thus use the map
renderer from map canvas. The composition uses various parameters from the map
renderer, most importantly the default set of map layers and the current extent.
When using composer in a standalone application, you can create your own map
renderer instance the same way as shown in the section above and pass it to
the composition.

It is possible to add various elements (map, label, ...) to the composition ---
these elements have to be descendants of :class:`QgsComposerItem` class.
Currently supported items are:

* map --- this item tells the libraries where to put the map itself. Here we
  create a map and stretch it over the whole paper size

  ::

    x, y = 0, 0
    w, h = c.paperWidth(), c.paperHeight()
    composerMap = QgsComposerMap(c, x ,y, w, h)
    c.addItem(composerMap)

* label --- allows displaying labels. It is possible to modify its font, color,
  alignment and margin

  ::

    composerLabel = QgsComposerLabel(c)
    composerLabel.setText("Hello world")
    composerLabel.adjustSizeToText()
    c.addItem(composerLabel)

* legend

  ::

    legend = QgsComposerLegend(c)
    legend.model().setLayerSet(mapRenderer.layerSet())
    c.addItem(legend)

* scale bar

  ::

    item = QgsComposerScaleBar(c)
    item.setStyle('Numeric') # optionally modify the style
    item.setComposerMap(composerMap)
    item.applyDefaultSize()
    c.addItem(item)

* arrow
* picture
* shape
* table

By default the newly created composer items have zero position (top left corner
of the page) and zero size. The position and size are always measured in
millimeters

::

  # set label 1cm from the top and 2cm from the left of the page
  composerLabel.setItemPosition(20, 10)
  # set both label's position and size (width 10cm, height 3cm)
  composerLabel.setItemPosition(20, 10, 100, 30)

A frame is drawn around each item by default. How to remove the frame

::

  composerLabel.setFrame(False)

Besides creating the composer items by hand, QGIS has support for composer
templates which are essentially compositions with all their items saved to a
.qpt file (with XML syntax). Unfortunately this functionality is not yet
available in the API.

Once the composition is ready (the composer items have been created and added
to the composition), we can proceed to produce a raster and/or vector output.

The default output settings for composition are page size A4 and resolution 300
DPI. You can change them if necessary. The paper size is specified in
millimeters

::

  c.setPaperSize(width, height)
  c.setPrintResolution(dpi)

.. index:: output; raster image

Output to a raster image
------------------------

The following code fragment shows how to render a composition to a raster image

::

  dpi = c.printResolution()
  dpmm = dpi / 25.4
  width = int(dpmm * c.paperWidth())
  height = int(dpmm * c.paperHeight())

  # create output image and initialize it
  image = QImage(QSize(width, height), QImage.Format_ARGB32)
  image.setDotsPerMeterX(dpmm * 1000)
  image.setDotsPerMeterY(dpmm * 1000)
  image.fill(0)

  # render the composition
  imagePainter = QPainter(image)
  sourceArea = QRectF(0, 0, c.paperWidth(), c.paperHeight())
  targetArea = QRectF(0, 0, width, height)
  c.render(imagePainter, targetArea, sourceArea)
  imagePainter.end()

  image.save("out.png", "png")

.. index:: output; PDF

Output to PDF
-------------

The following code fragment renders a composition to a PDF file

::

  printer = QPrinter()
  printer.setOutputFormat(QPrinter.PdfFormat)
  printer.setOutputFileName("out.pdf")
  printer.setPaperSize(QSizeF(c.paperWidth(), c.paperHeight()), QPrinter.Millimeter)
  printer.setFullPage(True)
  printer.setColorMode(QPrinter.Color)
  printer.setResolution(c.printResolution())

  pdfPainter = QPainter(printer)
  paperRectMM = printer.pageRect(QPrinter.Millimeter)
  paperRectPixel = printer.pageRect(QPrinter.DevicePixel)
  c.render(pdfPainter, paperRectPixel, paperRectMM)
  pdfPainter.end()
