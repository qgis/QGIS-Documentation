Rasterize (vector to raster)
============================

Description
-----------

Converts vector geometries (points, lines and polygons) into a raster image.


Parameters
----------

``Input layer`` [vector: any]
  Input vector layer with point, line or polygon geometries.

``Attribute field`` [tablefield: any]
  Defines the attribute field from which the attributes for the pixels
  should be chosen.

``Write values inside an existing raster layer(*)`` [boolean]
  If activated writes the results into an existing raster layer. 

  Default: *False*

``Set output raster size (ignored if above option is checked)`` [selection]
  If the above option is not checked either the output size is in pixels (0)
  or the output resolution is in map units per pixel (1).

  Options:

  * 0 --- Output size in pixels
  * 1 --- Output resolution in map units per pixel

  Default: *1*

``Horizontal`` [number]
  Sets the horizontal resolution of the output raster.

  Default: *100.0*

``Vertical`` [number]
  Sets the vertical resolution of the output raster.

  Default: *100.0*

``Raster type`` [selection]
  Defines the type of the resulting raster image.

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
  Output raster layer. Give in here the name of the raster layer in which the results should be written
  (if this option is used).

Console usage
-------------

::

  processing.runalg('gdalogr:rasterize', input, field, writeover, dimensions, width, height, rtype, output)

See also
--------

