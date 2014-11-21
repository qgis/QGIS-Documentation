Grid (Data metrics)
===================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input layer`` [vector: point]
  <put parameter description here>

``Z field`` [tablefield: numeric]
  Optional.

  <put parameter description here>

``Metrics`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Minimum
  * 1 --- Maximum
  * 2 --- Range
  * 3 --- Count
  * 4 --- Average distance
  * 5 --- Average distance between points

  Default: *0*

``Radius 1`` [number]
  <put parameter description here>

  Default: *0.0*

``Radius 2`` [number]
  <put parameter description here>

  Default: *0.0*

``Min points`` [number]
  <put parameter description here>

  Default: *0.0*

``Angle`` [number]
  <put parameter description here>

  Default: *0.0*

``Nodata`` [number]
  <put parameter description here>

  Default: *0.0*

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

``Output file`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('gdalogr:griddatametrics', input, z_field, metric, radius_1, radius_2, min_points, angle, nodata, rtype, output)

See also
--------

