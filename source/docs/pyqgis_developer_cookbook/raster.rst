.. _raster:

.. index:: raster layers; using

*******************
Using Raster Layers
*******************

This sections lists various operations you can do with raster layers.

.. index:: raster layers; details

Layer Details
=============

A raster layer consists of one or more raster bands - it is referred to as
either single band or multi band raster. One band represents a matrix of
values. Usual color image (e.g. aerial photo) is a raster consisting of red,
blue and green band. Single band layers typically represent either continuous
variables (e.g. elevation) or discrete variables (e.g. land use). In some
cases, a raster layer comes with a palette and raster values refer to colors
stored in the palette.

  >>> rlayer.width(), rlayer.height()
  (812, 301)
  >>> rlayer.extent()
  u'12.095833,48.552777 : 18.863888,51.056944'
  >>> rlayer.rasterType()
  2  # 0 = GrayOrUndefined (single band), 1 = Palette (single band), 2 = Multiband
  >>> rlayer.bandCount()
  3
  >>> rlayer.metadata()
  u'<p class="glossy">Driver:</p>...'
  >>> rlayer.hasPyramids()
  False

.. index:: raster layers; drawing style

Drawing Style
=============

When a raster layer is loaded, it gets a default drawing style based on its
type. It can be altered either in raster layer properties or programmatically.
The following drawing styles exist:

====== =============================== ===============================================================================================
Index   Constant: QgsRasterLater.X     Comment
====== =============================== ===============================================================================================
  1     SingleBandGray                 Single band image drawn as a range of gray colors
  2     SingleBandPseudoColor          Single band image drawn using a pseudocolor algorithm
  3     PalettedColor                  "Palette" image drawn using color table
  4     PalettedSingleBandGray         "Palette" layer drawn in gray scale
  5     PalettedSingleBandPseudoColor  "Palette" layer drawn using a pseudocolor algorithm
  7     MultiBandSingleBandGray        Layer containing 2 or more bands, but a single band drawn as a range of gray colors
  8     MultiBandSingleBandPseudoColor Layer containing 2 or more bands, but a single band drawn using a pseudocolor algorithm
  9     MultiBandColor                 Layer containing 2 or more bands, mapped to RGB color space.
====== =============================== ===============================================================================================

To query the current drawing style:

  >>> rlayer.drawingStyle()
  9

Single band raster layers can be drawn either in gray colors (low values =
black, high values = white) or with a pseudocolor algorithm that assigns colors
for values from the single band. Single band rasters with a palette can be
additionally drawn using their palette. Multiband layers are typically drawn by
mapping the bands to RGB colors. Other possibility is to use just one band for
gray or pseudocolor drawing.

The following sections explain how to query and modify the layer drawing style.
After doing the changes, you might want to force update of map canvas, see
:ref:`refresh-layer`.

**TODO:** contrast enhancements, transparency (no data), user defined min/max, band statistics

.. index:: rasters; single band

Single Band Rasters
-------------------

They are rendered in gray colors by default. To change the drawing style to
pseudocolor:

  >>> rlayer.setDrawingStyle(QgsRasterLayer.SingleBandPseudoColor)
  >>> rlayer.setColorShadingAlgorithm(QgsRasterLayer.PseudoColorShader)

The ``PseudoColorShader`` is a basic shader that highlights low values in blue
and high values in red. Another, ``FreakOutShader`` uses more fancy colors and
according to the documentation, it will frighten your granny and make your dogs
howl.

There is also ``ColorRampShader`` which maps the colors as specified by its
color map. It has three modes of interpolation of values:

* linear (``INTERPOLATED``): resulting color is linearly interpolated from the
  color map entries above and below the actual pixel value
* discrete (``DISCRETE``): color is used from the color map entry with equal
  or higher value
* exact (``EXACT``): color is not interpolated, only the pixels with value
  equal to color map entries are drawn

To set an interpolated color ramp shader ranging from green to yellow color
(for pixel values from 0 to 255)::

  >>> rlayer.setColorShadingAlgorithm(QgsRasterLayer.ColorRampShader)
  >>> lst = [ QgsColorRampShader.ColorRampItem(0, QColor(0,255,0)), \
      QgsColorRampShader.ColorRampItem(255, QColor(255,255,0)) ]
  >>> fcn = rlayer.rasterShader().rasterShaderFunction()
  >>> fcn.setColorRampType(QgsColorRampShader.INTERPOLATED)
  >>> fcn.setColorRampItemList(lst)

To return back to default gray levels, use:

  >>> rlayer.setDrawingStyle(QgsRasterLayer.SingleBandGray)

.. index:: rasters; multi band

Multi Band Rasters
------------------

By default, QGIS maps the first three bands to red, green and blue values to
create a color image (this is the ``MultiBandColor`` drawing style. In some
cases you might want to override these setting. The following code interchanges
red band (1) and green band (2):

  >>> rlayer.setGreenBandName(rlayer.bandName(1))
  >>> rlayer.setRedBandName(rlayer.bandName(2))

In case only one band is necessary for visualization of the raster, single band
drawing can be chosen --- either gray levels or pseudocolor, see previous
section::

  >>> rlayer.setDrawingStyle(QgsRasterLayer.MultiBandSingleBandPseudoColor)
  >>> rlayer.setGrayBandName(rlayer.bandName(1))
  >>> rlayer.setColorShadingAlgorithm(QgsRasterLayer.PseudoColorShader)
  >>> # now set the shader

.. index:: 
  pair: raster layers; refreshing

.. _refresh-layer:

Refreshing Layers
=================

If you do change layer symbology and would like ensure that the changes are
immediately visible to the user, call these methods::

   if hasattr(layer, "setCacheImage"): layer.setCacheImage(None)
   layer.triggerRepaint()

The first call will ensure that the cached image of rendered layer is erased
in case render caching is turned on. This functionality is available from
QGIS 1.4, in previous versions this function does not exist --- to make sure
that the code works with all versions of QGIS, we first check whether the
method exists.

The second call emits signal that will force any map canvas containing the
layer to issue a refresh.

With WMS raster layers, these commands do not work. In this case, you have
to do it explicitly::

  layer.dataProvider().reloadData()
  layer.triggerRepaint()

In case you have changed layer symbology (see sections about raster and vector
layers on how to do that), you might want to force QGIS to update the layer
symbology in the layer list (legend) widget. This can be done as follows
(``iface`` is an instance of QgisInterface)::

   iface.legendInterface().refreshLayerSymbology(layer)

.. index::
  pair: raster layers; querying

Query Values
============

To do a query on value of bands of raster layer at some specified point::

  ident = rlayer.dataProvider().identify(QgsPoint(15.30,40.98), \
    QgsRaster.IdentifyFormatValue)
  if ident.isValid():
    print ident.results()

The ``results`` method in this case returns a dictionary, with band indices as keys, and band values as values.

::

  {1: 17, 2: 220}

