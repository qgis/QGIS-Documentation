PCT to RGB
==========

Description
-----------
Convert an 8bit paletted image to 24bit RGB

This utility will convert a pseudocolor band on the input file into an output RGB file of the desired format.

Parameters
----------

``Input layer`` [raster]
  Input 8bit raster image

``Band to convert`` [selection]
  Band to convert to RGB

  Options:

  * 0 --- 1
  * 1 --- 2
  * 2 --- 3
  * 3 --- 4
  * 4 --- 5
  * 5 --- 6
  * 6 --- 7
  * 7 --- 8
  * 8 --- 9
  * 9 --- 10
  * 10 --- 11
  * 11 --- 12
  * 12 --- 13
  * 13 --- 14
  * 14 --- 15
  * 15 --- 16
  * 16 --- 17
  * 17 --- 18
  * 18 --- 19
  * 19 --- 20
  * 20 --- 21
  * 21 --- 22
  * 22 --- 23
  * 23 --- 24
  * 24 --- 25

  Default: *0*

Outputs
-------

``Output layer`` [raster]
  24bit RGB raster image

Console usage
-------------

::

  processing.runalg('gdalogr:pcttorgb', input, nband, output)

See also
--------
`GDAL pct2rgb utility <http://www.gdal.org/pct2rgb.html>`_
