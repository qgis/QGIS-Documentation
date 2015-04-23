Sieve
=====

Description
-----------

Removes raster polygons smaller than a provided threshold size (in pixels) and
replaces them with the pixel value of the largest neighbour polygon. It is 
useful if you have a large amount of small areas on your raster map.

Parameters
----------

``Input layer`` [raster]
  Raster layer.

``Threshold`` [number]
  <put parameter description here>

  Default: *2*

``Pixel connection`` [selection]
  <put parameter description here>

  Options:

  * 0 --- 4
  * 1 --- 8

  Default: *0*

Outputs
-------

``Output layer`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('gdalogr:sieve', input, threshold, connections, output)

See also
--------

