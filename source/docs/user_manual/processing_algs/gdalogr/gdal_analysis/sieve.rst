Sieve
=====

Description
-----------

Removes raster polygons smaller than a provided threshold size (in pixels) and
replaces them with the pixel value of the largest neighbour polygon. It is 
useful if you have a large amount of small areas on your raster map.
The algorithm is derived from the `GDAL sieve utility <http://www.gdal.org/gdal_sieve.html>`_ .

Parameters
----------

``Input layer`` [raster]
  Raster layer.

``Threshold`` [number]
  Only raster polygons smaller than this size will be removed.

  Default: *2*

``Pixel connection`` [selection]
  Either four connectedness or eight connectedness should be used when determining.

  Options:

  * 0 --- 4
  * 1 --- 8

  Default: *0*

Outputs
-------

``Output layer`` [raster]
  Output raster layer.

Console usage
-------------

::

  processing.runalg('gdalogr:sieve', input, threshold, connections, output)

See also
--------

