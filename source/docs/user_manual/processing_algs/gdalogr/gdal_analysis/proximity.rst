Proximity (raster distance)
===========================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input layer`` [raster]
  <put parameter description here>

``Values`` [string]
  <put parameter description here>

  Default: *(not set)*

``Dist units`` [selection]
  <put parameter description here>

  Options:

  * 0 --- GEO
  * 1 --- PIXEL

  Default: *0*

``Max dist (negative value to ignore)`` [number]
  <put parameter description here>

  Default: *-1*

``No data (negative value to ignore)`` [number]
  <put parameter description here>

  Default: *-1*

``Fixed buf val (negative value to ignore)`` [number]
  <put parameter description here>

  Default: *-1*

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

  processing.runalg('gdalogr:proximity', input, values, units, max_dist, nodata, buf_val, rtype, output)

See also
--------

