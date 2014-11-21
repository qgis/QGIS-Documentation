Rasterize (vector to raster)
============================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input layer`` [vector: any]
  <put parameter description here>

``Attribute field`` [tablefield: any]
  <put parameter description here>

``Write values inside an existing raster layer(*)`` [boolean]
  <put parameter description here>

  Default: *False*

``Set output raster size (ignored if above option is checked)`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Output size in pixels
  * 1 --- Output resolution in map units per pixel

  Default: *1*

``Horizontal`` [number]
  <put parameter description here>

  Default: *100.0*

``Vertical`` [number]
  <put parameter description here>

  Default: *100.0*

``Raster type`` [selection]
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

  Default: *0*

Outputs
-------

``Output layer: mandatory to choose an existing raster layer if the (*) option is selected`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('gdalogr:rasterize', input, field, writeover, dimensions, width, height, rtype, output)

See also
--------

