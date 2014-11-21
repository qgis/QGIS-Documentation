Merge
=====

Description
-----------

<put algortithm description here>

Parameters
----------

``Input layers`` [multipleinput: rasters]
  <put parameter description here>

``Grab pseudocolor table from first layer`` [boolean]
  <put parameter description here>

  Default: *False*

``Layer stack`` [boolean]
  <put parameter description here>

  Default: *False*

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

  processing.runalg('gdalogr:merge', input, pct, separate, rtype, output)

See also
--------

