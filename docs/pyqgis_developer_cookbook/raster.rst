.. index::
   pair: Raster; Raster layers

.. _raster:

*********************
 Using Raster Layers
*********************

.. warning:: |outofdate|

.. contents::
   :local:

The code snippets on this page needs the following imports if you're outside the pyqgis console:

.. code-block:: python

    from qgis.core import (
      QgsRasterLayer,
      QgsColorRampShader,
      QgsSingleBandPseudoColorRenderer
    )

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

.. code-block:: python

    rlayer = QgsProject.instance().mapLayersByName('srtm')[0]
    # get the resolution of the raster in layer unit
    rlayer.width(), rlayer.height()
    (919, 619)
    # get the extent of the layer as QgsRectangle
    rlayer.extent()
    <QgsRectangle: 20.06856808199999875 -34.27001076999999896, 20.83945284300000012 -33.75077500700000144>
    # get the extent of the layer as Strings
    rlayer.extent().toString()
    '20.0685680819999988,-34.2700107699999990 : 20.8394528430000001,-33.7507750070000014'
    # get the raster type: 0 = GrayOrUndefined (single band), 1 = Palette (single band), 2 = Multiband
    rlayer.rasterType()
    0
    # get the total band count of the raster
    rlayer.bandCount()
    1
    # get all the available metadata as a QgsLayerMetadata object
    rlayer.metadata()
    '<qgis._core.QgsLayerMetadata object at 0x13711d558>'

.. index:: Raster layers; Renderer

Renderer
========

When a raster layer is loaded, it gets a default renderer based on its
type. It can be altered either in the layer properties or programmatically.

To query the current renderer:

.. code-block:: python

    rlayer.renderer()
    <qgis._core.QgsSingleBandGrayRenderer object at 0x7f471c1da8a0>
    rlayer.renderer().type()
    'singlebandgray'

To set a renderer, use the :meth:`setRenderer <qgis.core.QgsRasterLayer.setRenderer>`
method of :class:`QgsRasterLayer <qgis.core.QgsRasterLayer>`. There are a
number of renderer classes (derived from :class:`QgsRasterRenderer
<qgis.core.QgsRasterRenderer>`):

* :class:`QgsMultiBandColorRenderer <qgis.core.QgsMultiBandColorRenderer>`
* :class:`QgsPalettedRasterRenderer <qgis.core.QgsPalettedRasterRenderer>`
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

.. code-block:: python

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

.. code-block:: python

    renderer = QgsSingleBandPseudoColorRenderer(rlayer.dataProvider(), 1, shader)
    rlayer.setRenderer(renderer)

The number ``1`` in the code above is the band number (raster bands are
indexed from one).

Finally we have to use the
:meth:`triggerRepaint <qgis.core.QgsMapLayer.triggerRepaint>` method
to see the results:

.. code-block:: python

    rlayer.triggerRepaint()


.. index:: Raster layers; Multi band

Multi Band Rasters
------------------

By default, QGIS maps the first three bands to red, green and blue to
create a color image (this is the ``MultiBandColor`` drawing style.
In some cases you might want to override these setting.
The following code interchanges red band (1) and green band (2):

.. code-block:: python

    rlayer_multi = QgsProject.instance().mapLayersByName('multiband')[0]
    rlayer_multi.renderer().setGreenBand(1)
    rlayer_multi.renderer().setRedBand(2)

In case only one band is necessary for visualization of the raster,
single band drawing can be chosen, either gray levels or pseudocolor.

We have to use :meth:`triggerRepaint <qgis.core.QgsMapLayer.triggerRepaint>`
to update the map and see the result:

.. code-block:: python

    rlayer_multi.triggerRepaint()

.. index::
  pair: Raster layers; Refreshing

.. index::
  pair: Raster layers; Querying

Query Values
============

Raster values can be queried using the
:meth:`sample <qgis.core.QgsRasterDataProvider.sample>` method of
the :class:`QgsRasterDataProvider <qgis.core.QgsRasterDataProvider>` class.
You have to specify a :class:`QgsPointXY <qgis.core.QgsPointXY>`
and the band number of the raster layer you want to query. The method returns a
tuple with the value and ``True`` or ``False`` depending on the results:

.. code-block:: python

    val, res = rlayer.dataProvider().sample(QgsPointXY(20.50, -34), 1)

Another method to query raster values is using the :meth:`identify
<qgis.core.QgsRasterDataProvider.identify>` method that returns a
:class:`QgsRasterIdentifyResult <qgis.core.QgsRasterIdentifyResult>` object.

.. code-block:: python

    ident = rlayer.dataProvider().identify(QgsPointXY(20.5, -34), QgsRaster.IdentifyFormatValue)

    if ident.isValid():
      print(ident.results())

In this case, the :meth:`results <qgis.core.QgsRasterIdentifyResult.results>`
method returns a dictionary, with band indices as keys, and band values as
values.
For instance, something like ``{1: 323.0}``

.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |outofdate| replace:: `Despite our constant efforts, information beyond this line may not be updated for QGIS 3. Refer to https://qgis.org/pyqgis/master for the python API documentation or, give a hand to update the chapters you know about. Thanks.`
