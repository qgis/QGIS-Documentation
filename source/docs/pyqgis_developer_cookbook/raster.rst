.. _raster:

.. index:: raster layers; using

*******************
Using Raster Layers
*******************

This sections lists various operations you can do with raster layers.

.. index:: raster layers; details

Layer Details
=============

A raster layer consists of one or more raster bands --- it is referred to as
either single band or multi band raster. One band represents a matrix of
values. Usual color image (e.g. aerial photo) is a raster consisting of red,
blue and green band. Single band layers typically represent either continuous
variables (e.g. elevation) or discrete variables (e.g. land use). In some
cases, a raster layer comes with a palette and raster values refer to colors
stored in the palette::

  rlayer.width(), rlayer.height()
  (812, 301)
  rlayer.extent()
  <qgis._core.QgsRectangle object at 0x000000000F8A2048>
  rlayer.extent().toString()
  u'12.095833,48.552777 : 18.863888,51.056944'
  rlayer.rasterType()
  2  # 0 = GrayOrUndefined (single band), 1 = Palette (single band), 2 = Multiband
  rlayer.bandCount()
  3
  rlayer.metadata()
  u'<p class="glossy">Driver:</p>...'
  rlayer.hasPyramids()
  False

.. index:: raster layers; renderer

Renderer
========

When a raster layer is loaded, it gets a default renderer based on its
type. It can be altered either in raster layer properties or programmatically.

To query the current renderer::

  >>> rlayer.renderer()
  <qgis._core.QgsSingleBandPseudoColorRenderer object at 0x7f471c1da8a0>
  >>> rlayer.renderer().type()
  u'singlebandpseudocolor'

To set a renderer use :func:`setRenderer` method of :class:`QgsRasterLayer`. There
are several available renderer classes (derived from :class:`QgsRasterRenderer`):

* QgsMultiBandColorRenderer
* QgsPalettedRasterRenderer
* QgsSingleBandColorDataRenderer
* QgsSingleBandGrayRenderer
* QgsSingleBandPseudoColorRenderer

Single band raster layers can be drawn either in gray colors (low values =
black, high values = white) or with a pseudocolor algorithm that assigns colors
for values from the single band. Single band rasters with a palette can be
additionally drawn using their palette. Multiband layers are typically drawn by
mapping the bands to RGB colors. Other possibility is to use just one band for
gray or pseudocolor drawing.

The following sections explain how to query and modify the layer drawing style.
After doing the changes, you might want to force update of map canvas, see
:ref:`refresh-layer`.

**TODO:**
   contrast enhancements, transparency (no data), user defined min/max, band statistics

.. index:: rasters; single band

Single Band Rasters
-------------------

Let's say we want to render our raster layer (assuming one band only)
with colors ranging from green to yellow (for pixel values from 0 to 255).
In the first stage we will prepare ``QgsRasterShader`` object and configure
its shader function:

  >>> fcn = QgsColorRampShader()
  >>> fcn.setColorRampType(QgsColorRampShader.INTERPOLATED)
  >>> lst = [ QgsColorRampShader.ColorRampItem(0, QColor(0,255,0)), \
      QgsColorRampShader.ColorRampItem(255, QColor(255,255,0)) ]
  >>> fcn.setColorRampItemList(lst)
  >>> shader = QgsRasterShader()
  >>> shader.setRasterShaderFunction(fcn)

The shader maps the colors as specified by its color map. The color map is
provided as a list of items with pixel value and its associated color.
There are three modes of interpolation of values:

* linear (``INTERPOLATED``): resulting color is linearly interpolated from the
  color map entries above and below the actual pixel value
* discrete (``DISCRETE``): color is used from the color map entry with equal
  or higher value
* exact (``EXACT``): color is not interpolated, only the pixels with value
  equal to color map entries are drawn

In the second step we will associate this shader with the raster layer::

  >>> renderer = QgsSingleBandPseudoColorRenderer(layer.dataProvider(), 1, shader)
  >>> layer.setRenderer(renderer)

The number 1 in the code above is band number (raster bands are indexed from one).


.. index:: rasters; multi band

Multi Band Rasters
------------------

By default, QGIS maps the first three bands to red, green and blue values to
create a color image (this is the ``MultiBandColor`` drawing style. In some
cases you might want to override these setting. The following code interchanges
red band (1) and green band (2)::

    rlayer.renderer().setGreenBand(1)
    rlayer.renderer().setRedBand(2)

In case only one band is necessary for visualization of the raster, single band
drawing can be chosen --- either gray levels or pseudocolor.

.. index::
  pair: raster layers; refreshing

.. _refresh-layer:

Refreshing Layers
=================

If you do change layer symbology and would like ensure that the changes are
immediately visible to the user, call these methods

::

   if hasattr(layer, "setCacheImage"):
     layer.setCacheImage(None)
   layer.triggerRepaint()

The first call will ensure that the cached image of rendered layer is erased
in case render caching is turned on. This functionality is available from
QGIS 1.4, in previous versions this function does not exist --- to make sure
that the code works with all versions of QGIS, we first check whether the
method exists.

The second call emits signal that will force any map canvas containing the
layer to issue a refresh.

With WMS raster layers, these commands do not work. In this case, you have
to do it explicitly

::

  layer.dataProvider().reloadData()
  layer.triggerRepaint()

In case you have changed layer symbology (see sections about raster and vector
layers on how to do that), you might want to force QGIS to update the layer
symbology in the layer list (legend) widget. This can be done as follows
(``iface`` is an instance of :class:`QgisInterface`)

::

   iface.legendInterface().refreshLayerSymbology(layer)

.. index::
  pair: raster layers; querying

Query Values
============

To do a query on value of bands of raster layer at some specified point

::

  ident = rlayer.dataProvider().identify(QgsPoint(15.30, 40.98), \
    QgsRaster.IdentifyFormatValue)
  if ident.isValid():
    print ident.results()

The ``results`` method in this case returns a dictionary, with band indices as
keys, and band values as values.

::

  {1: 17, 2: 220}
