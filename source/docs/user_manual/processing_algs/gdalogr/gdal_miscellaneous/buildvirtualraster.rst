Build Virtual Raster
====================

Description
-----------

Builds a VRT (Virtual Dataset) that is a mosaic of the list of input GDAL-supported rasters.
With a mosaic you can merge several raster files.

Parameters
----------

``Input layers`` [multipleinput: rasters]
  GDAL-supported raster layers.

``Resolution`` [selection]
  The output resolution of the mosaic. By default the average resolution of th
  raster files will be chosen.

  Options:

  * 0 --- average
  * 1 --- highest
  * 2 --- lowest

  Default: *0*

``Layer stack`` [boolean]
  With 'False' you can define that each raster file goes into a separated stacked band 
  in the VRT band.

  Default: *True*

``Allow projection difference`` [boolean]
  Allows that the output bands have different projections derived from the
  projection of the input raster layers.

  Default: *False*

Outputs
-------

``Output layer`` [raster]
  Output raster file.

Console usage
-------------

::

  processing.runalg('gdalogr:buildvirtualraster', input, resolution, separate, proj_difference, output)

See also
--------

