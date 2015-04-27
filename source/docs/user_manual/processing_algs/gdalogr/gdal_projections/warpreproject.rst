Warp (reproject)
================

Description
-----------

Transfers a raster layer into another Coordinate Reference System (CRS).
The output file resolution and the resampling method can be chosen.

Parameters
----------

``Input layer`` [raster]
  Input raster layer.

``Source SRS (EPSG Code)`` [crs]
  Defines the CRS of the input raster layer.

  Default: *EPSG:4326*

``Destination SRS (EPSG Code)`` [crs]
  Defines the target CRS of the raster layer. 

  Default: *EPSG:4326*

``Output file resolution in target georeferenced units (leave 0 for no change)`` [number]
  Defines the output file resolution of reprojection result.

  Default: *0.0*

``Resampling method`` [selection]
  Several resampling methods can be chosen for the reprojection.
  By default a near resampling method is chosen.

  Options:

  * 0 --- near
  * 1 --- bilinear
  * 2 --- cubic
  * 3 --- cubicspline
  * 4 --- lanczos

  Default: *0*

``Additional creation parameters`` [string]
  Optional.

  <put parameter description here>

  Default: *(not set)*

``Output raster type`` [selection]
  Defines the format of the output raster file.
  By default this is Float32.

  Options:

  * 0 --- Byte
  * 1 --- Int16
  * 2 --- UInt16
  * 3 --- UInt32
  * 4 --- Int32
  * 5 --- Float32
  * 6 --- Float64
  * 7 --- CInt16
  * 8 --- CInt32
  * 9 --- CFloat32
  * 10 --- CFloat64

  Default: *5*

Outputs
-------

``Output layer`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('gdalogr:warpreproject', input, source_srs, dest_srs, tr, method, extra, rtype, output)

See also
--------

