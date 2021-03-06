.. index:: Vector Tiles, vector tiles properties
.. _`label_vector_tiles`:

*************************
Working with Vector Tiles
*************************

.. only:: html

   .. contents::
      :local:

What are Vector Tiles?
======================

Vector tiles are packets of geographic data, packaged into pre-defined
roughly-square shaped "tiles" for transfer over the web. They combine
pre-rendered raster map tiles and vector map tiles. 
The vector tile server returns vector map data, which has been clipped
to the boundaries of each tile, instead of a pre-rendered map image.
The clipped tiles represent the zoom-levels of the vector tile service,
derived from a pyramid approach.
Using this structure, the data-transfer is reduced in comparison to
un-tiled vector maps. Only data within the current map view, and at the
current zoom level needs to be transferred.
Also, compared to a tiled raster map, data transfer is also greatly reduced,
as vector data is typically much smaller than a rendered bitmap.
Vector tiles do not have any styling information assigned so QGIS needs to
apply a cartographic style in order to display the data. 

.. _figure_vector_tiles_pyramidstructure

.. figure:: img/vector_tiles_pyramid_structure.png
   :align: center

   Pyramid structure of vector tiles with zoom-levels


Supported Formats
=================

There is support for vector tiles through:

* remote sources (HTTP/S) - with XYZ template - ``type=xyz&url=http://example.com/{z}/{x}/{y}.pbf``
* local files - with XYZ template - e.g. ``type=xyz&url=file:///path/to/tiles/{z}/{x}/{y}.pbf``
* local MBTiles database - e.g. ``type=mbtiles&url=file:///path/to/file.mbtiles``


