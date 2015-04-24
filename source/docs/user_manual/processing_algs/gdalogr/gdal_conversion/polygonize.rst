Polygonize (raster to vector)
=============================

Description
-----------

Creates vector polygons for all connected regions of pixels in the
raster sharing a common pixel value. Each polygon is created with an
attribute indicating the pixel value of that polygon. 
Parameters
----------

``Input layer`` [raster]
  Input raster layer.

``Output field name`` [string]
  Defines the field name in which the attributes of the connected regions are
  entered. If no field name is defined the name will be 'DN'.

  Default: *DN*

Outputs
-------

``Output layer`` [vector]
  Output vector layer. Default format is *.shp .

Console usage
-------------

::

  processing.runalg('gdalogr:polygonize', input, field, output)

See also
--------

