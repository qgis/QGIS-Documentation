.. highlight:: python
   :linenothreshold: 5

.. testsetup:: raster

    from qgis.core import (
        Qgis,
        QgsRasterLayer,
        QgsProject,
        QgsPointXY,
        QgsRaster,
        QgsRasterBlock,
        QgsRasterShader,
        QgsColorRampShader,
        QgsSingleBandPseudoColorRenderer,
        QgsSingleBandColorDataRenderer,
        QgsSingleBandGrayRenderer,
    )

    from qgis.PyQt.QtGui import (
        QColor,
    )

    iface = start_qgis()

    rlayer = QgsRasterLayer("GPKG:%s/testdata/sublayers.gpkg:srtm" % os.getcwd(), "srtm")
    rlayer_multi = QgsRasterLayer("GPKG:%s/testdata/sublayers.gpkg:raster_layer" % os.getcwd(), "multiband")
    QgsProject.instance().addMapLayers([rlayer, rlayer_multi])
    assert rlayer.isValid()

.. _raster:

.. index::
   pair: Raster; Raster layers

*********************
 Using Raster Layers
*********************

.. hint:: The code snippets on this page need the following imports if you're outside the pyqgis console:

  .. testcode:: raster

    from qgis.core import (
        QgsRasterLayer,
        QgsProject,
        QgsPointXY,
        QgsRaster,
        QgsRasterShader,
        QgsColorRampShader,
        QgsSingleBandPseudoColorRenderer,
        QgsSingleBandColorDataRenderer,
        QgsSingleBandGrayRenderer,
    )

    from qgis.PyQt.QtGui import (
        QColor,
    )

.. only:: html

   .. contents::
      :local:

.. index:: Raster layers; Details

Layer Details
=============

A raster layer consists of one or more raster bands --- referred to as
single band and multi band rasters. One band represents a matrix of
values. A color image (e.g. aerial photo) is a raster consisting of red,
blue and green bands. Single band rasters typically represent either continuous
variables (e.g. elevation) or discrete variables (e.g. land use). In some
cases, a raster layer comes with a palette and the raster values refer to
the colors stored in the palette.

The following code assumes ``rlayer`` is a
:class:`QgsRasterLayer <qgis.core.QgsRasterLayer>` object.


.. testcode:: raster

    rlayer = QgsProject.instance().mapLayersByName('srtm')[0]
    # get the resolution of the raster in layer unit
    print(rlayer.width(), rlayer.height())

.. testoutput:: raster

    919 619

.. testcode:: raster

    # get the extent of the layer as QgsRectangle
    print(rlayer.extent())

.. testoutput:: raster

    <QgsRectangle: 20.06856808199999875 -34.27001076999999896, 20.83945284300000012 -33.75077500700000144>

.. testcode:: raster

    # get the extent of the layer as Strings
    print(rlayer.extent().toString())

.. testoutput:: raster

    20.0685680819999988,-34.2700107699999990 : 20.8394528430000001,-33.7507750070000014

.. testcode:: raster

    # get the raster type: 0 = GrayOrUndefined (single band), 1 = Palette (single band), 2 = Multiband
    print(rlayer.rasterType())

.. testoutput:: raster

    0

.. testcode:: raster

     # get the total band count of the raster
    print(rlayer.bandCount())

.. testoutput:: raster

    1

.. testcode:: raster

     # get the first band name of the raster
     print(rlayer.bandName(1))

.. testoutput:: raster

    Band 1: Height

.. testcode:: raster

    # get all the available metadata as a QgsLayerMetadata object
    print(rlayer.metadata())

.. testoutput:: raster

    <qgis._core.QgsLayerMetadata object at 0x13711d558>

.. index:: Raster layers; Renderer

Renderer
========

When a raster layer is loaded, it gets a default renderer based on its
type. It can be altered either in the layer properties or programmatically.

To query the current renderer:

.. testcode:: raster

    print(rlayer.renderer())

.. testoutput:: raster

    <qgis._core.QgsSingleBandGrayRenderer object at 0x7f471c1da8a0>


.. testcode:: raster

    print(rlayer.renderer().type())

.. testoutput:: raster

    singlebandgray

To set a renderer, use the :meth:`setRenderer() <qgis.core.QgsRasterLayer.setRenderer>`
method of :class:`QgsRasterLayer <qgis.core.QgsRasterLayer>`. There are a
number of renderer classes (derived from :class:`QgsRasterRenderer
<qgis.core.QgsRasterRenderer>`):

* :class:`QgsHillshadeRenderer <qgis.core.QgsHillshadeRenderer>`
* :class:`QgsMultiBandColorRenderer <qgis.core.QgsMultiBandColorRenderer>`
* :class:`QgsPalettedRasterRenderer <qgis.core.QgsPalettedRasterRenderer>`
* :class:`QgsRasterContourRenderer <qgis.core.QgsRasterContourRenderer>`
* :class:`QgsSingleBandColorDataRenderer <qgis.core.QgsSingleBandColorDataRenderer>`
* :class:`QgsSingleBandGrayRenderer <qgis.core.QgsSingleBandGrayRenderer>`
* :class:`QgsSingleBandPseudoColorRenderer <qgis.core.QgsSingleBandPseudoColorRenderer>`

Single band raster layers can be drawn either in gray colors (low values =
black, high values = white) or with a pseudocolor algorithm that assigns colors
to the values.
Single band rasters with a palette can also be drawn using the palette.
Multiband layers are typically drawn by mapping the bands to RGB colors.
Another possibility is to use just one band for drawing.


.. index:: Raster layers; Single band

Single Band Rasters
-------------------

Let's say we want a render single band raster layer with colors ranging from
green to yellow (corresponding to pixel values from 0 to 255).
In the first stage we will prepare a
:class:`QgsRasterShader <qgis.core.QgsRasterShader>` object and configure
its shader function:

.. testcode:: raster

    fcn = QgsColorRampShader()
    fcn.setColorRampType(QgsColorRampShader.Interpolated)
    lst = [ QgsColorRampShader.ColorRampItem(0, QColor(0,255,0)),
          QgsColorRampShader.ColorRampItem(255, QColor(255,255,0)) ]
    fcn.setColorRampItemList(lst)
    shader = QgsRasterShader()
    shader.setRasterShaderFunction(fcn)

The shader maps the colors as specified by its color map. The color map is
provided as a list of pixel values with associated colors.
There are three modes of interpolation:

* linear (``Interpolated``): the color is linearly interpolated
  from the color map entries above and below the pixel value
* discrete (``Discrete``): the color is taken from the closest color
  map entry with equal or higher value
* exact (``Exact``): the color is not interpolated, only pixels with
  values equal to color map entries will be drawn

In the second step we will associate this shader with the raster layer:

.. testcode:: raster

    renderer = QgsSingleBandPseudoColorRenderer(rlayer.dataProvider(), 1, shader)
    rlayer.setRenderer(renderer)

The number ``1`` in the code above is the band number (raster bands are
indexed from one).

Finally we have to use the
:meth:`triggerRepaint() <qgis.core.QgsMapLayer.triggerRepaint>` method
to see the results:

.. testcode:: raster

    rlayer.triggerRepaint()


.. index:: Raster layers; Multi band

Multi Band Rasters
------------------

By default, QGIS maps the first three bands to red, green and blue to
create a color image (this is the ``MultiBandColor`` drawing style).
In some cases you might want to override these setting.
The following code interchanges red band (1) and green band (2):

.. testcode:: raster

    rlayer_multi = QgsProject.instance().mapLayersByName('multiband')[0]
    rlayer_multi.renderer().setGreenBand(1)
    rlayer_multi.renderer().setRedBand(2)

In case only one band is necessary for visualization of the raster,
single band drawing can be chosen, either gray levels or pseudocolor.

We have to use :meth:`triggerRepaint() <qgis.core.QgsMapLayer.triggerRepaint>`
to update the map and see the result:

.. testcode:: raster

    rlayer_multi.triggerRepaint()

.. index::
  pair: Raster layers; Refreshing

.. index::
  pair: Raster layers; Querying

Query Values
============

Raster values can be queried using the
:meth:`sample() <qgis.core.QgsRasterDataProvider.sample>` method of
the :class:`QgsRasterDataProvider <qgis.core.QgsRasterDataProvider>` class.
You have to specify a :class:`QgsPointXY <qgis.core.QgsPointXY>`
and the band number of the raster layer you want to query. The method returns a
tuple with the value and :const:`True` or :const:`False` depending on the results:

.. testcode:: raster

    val, res = rlayer.dataProvider().sample(QgsPointXY(20.50, -34), 1)

Another method to query raster values is using the :meth:`identify()
<qgis.core.QgsRasterDataProvider.identify>` method that returns a
:class:`QgsRasterIdentifyResult <qgis.core.QgsRasterIdentifyResult>` object.

.. testcode:: raster

    ident = rlayer.dataProvider().identify(QgsPointXY(20.5, -34), QgsRaster.IdentifyFormatValue)

    if ident.isValid():
      print(ident.results())

.. testoutput:: raster

    {1: 323.0}

In this case, the :meth:`results() <qgis.core.QgsRasterIdentifyResult.results>`
method returns a dictionary, with band indices as keys, and band values as
values.
For instance, something like ``{1: 323.0}``


Editing raster data
===================

You can create a raster layer using the :class:`QgsRasterBlock <qgis.core.QgsRasterBlock>`
class. For example, to create a 2x2 raster block with one byte per pixel:

.. testcode:: raster

    block = QgsRasterBlock(Qgis.Byte, 2, 2)
    block.setData(b'\xaa\xbb\xcc\xdd')

Raster pixels can be overwritten thanks to the :meth:`writeBlock()
<qgis.core.QgsRasterDataProvider.writeBlock>` method.
To overwrite existing raster data at position 0,0 by the 2x2 block:

.. testcode:: raster

    provider = rlayer.dataProvider()
    provider.setEditable(True)
    provider.writeBlock(block, 1, 0, 0)
    provider.setEditable(False)
