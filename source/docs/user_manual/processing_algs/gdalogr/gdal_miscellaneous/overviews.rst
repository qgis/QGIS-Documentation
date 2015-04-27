Build overviews (pyramids)
==========================

Description
-----------

To speed up rendering time of raster layers overviews (pyramids) can
be created. Overviews are lower resolution copies of the data which 
QGIS uses depending of the level of zoom.

Parameters
----------

``Input layer`` [raster]
  Input raster layer.

``Overview levels`` [string]
  Defines the number of overview levels calculated by the original resolution
  of the input raster layer. By default 4 levels will be taken into consideration.

  Default: *2 4 8 16*

``Remove all existing overviews`` [boolean]
  Removes existing overviews from the raster. By default these aren't removed.

  Default: *False*

``Resampling method`` [selection]
  Calculates the overviews with a defined resampling method.

  Options:

  * 0 --- nearest
  * 1 --- average
  * 2 --- gauss
  * 3 --- cubic
  * 4 --- average_mp
  * 5 --- average_magphase
  * 6 --- mode

  Default: *0*

``Overview format`` [selection]
  The overviews can be stored internally, or externally as GTiff or ERDAS Imagine file.
  By default the overviews are stored in the output raster.

  Options:

  * 0 --- Internal (if possible)
  * 1 --- External (GTiff .ovr)
  * 2 --- External (ERDAS Imagine .aux)

  Default: *0*

Outputs
-------

``Output layer`` [raster]
  Output raster layer with overviews.

Console usage
-------------

::

  processing.runalg('gdalogr:overviews', input, levels, clean, resampling_method, format)

See also
--------

