Tile Index
==========

Description
-----------

This tool builds a shapefile with a record for each input raster file, an
attribute containing the filename, and a polygon geometry outlining the raster.
This output is suitable for use with MapServer as a raster tileindex.

Parameters
----------

``Input layers`` [multipleinput: rasters]
  The input raster files. Can be multiple files.

``Tile index field`` [string]
  Optional.

  The output field name to hold the file path/location to the indexed rasters.

  Default: *location*

``Skip files with different projection reference`` [boolean]
  Only files with same projection as files already inserted in the tile index
  will be inserted. Default does not check projection and accepts all inputs.

  Default: *False*

Outputs
-------

``Output layer`` [vector]
  The name of the output file to create/append to. The default shapefile will
  be created if it doesn't already exist, otherwise it will append to the
  existing file.

Console usage
-------------

::

  processing.runalg('gdalogr:tileindex', input, field_name, proj_difference, output)

See also
--------

