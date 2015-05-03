Near black
==========

Description
-----------
Convert nearly black/white borders to black.

This utility will scan an image and try to set all pixels that are nearly or exactly black, white or one or more custom
colors around the collar to black or white. This is often used to "fix up" lossy compressed airphotos so that color
pixels can be treated as transparent when mosaicking

Parameters
----------

``Input layer`` [raster]
  Raster file in input

``How far from black (white)`` [number]
  Select how far from black, white or custom colors the pixel values can be and still considered near black, white or custom color

  Default: *15*

``Search for nearly white pixels instead of nearly black`` [boolean]
  Search for nearly white (255) pixels instead of nearly black pixels

  Default: *False*

Outputs
-------

``Output layer`` [raster]
  Raster file in output

Console usage
-------------

::

  processing.runalg('gdalogr:nearblack', input, near, white, output)

See also
--------
 `GDAL nearblack <http://www.gdal.org/nearblack.html>`_

