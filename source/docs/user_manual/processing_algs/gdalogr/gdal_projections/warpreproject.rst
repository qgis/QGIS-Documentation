Warp (reproject)
================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input layer`` [raster]
  <put parameter description here>

``Source SRS (EPSG Code)`` [crs]
  <put parameter description here>

  Default: *EPSG:4326*

``Destination SRS (EPSG Code)`` [crs]
  <put parameter description here>

  Default: *EPSG:4326*

``Output file resolution in target georeferenced units (leave 0 for no change)`` [number]
  <put parameter description here>

  Default: *0.0*

``Resampling method`` [selection]
  <put parameter description here>

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
  <put parameter description here>

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

