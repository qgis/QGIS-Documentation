Grid (Nearest neighbor)
=======================

Description
-----------
The Nearest Neighbor method doesn't perform any interpolation or smoothing, it just takes the value of nearest point 
found in grid node search ellipse and returns it as a result. If there are no points found, the specified NODATA value
will be returned.

Parameters
----------

``Input layer`` [vector: point]
  Point vector layer

``Z field`` [tablefield: numeric]
  Field for the interpolation (*Optional*).

``Radius 1`` [number]
  The first radius (X axis if rotation angle is 0) of search ellipse.
  
  Default: *0.0*

``Radius 2`` [number]
  The second radius (Y axis if rotation angle is 0) of search ellipse.
  
  Default: *0.0*

``Angle`` [number]
  Angle of ellipse rotation in degrees.
  Ellipse rotated counter clockwise.
  
  Default: *0.0*

``Nodata`` [number]
  No data marker to fill empty points.
  
  Default: *0.0*

``Output raster type`` [selection]

  Raster file type
  
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

Interpolated raster file

Console usage
-------------

::

  processing.runalg('gdalogr:gridnearestneighbor', input, z_field, radius_1, radius_2, angle, nodata, rtype, output)

See also
--------
`GDAL grid tutorial <http://www.gdal.org/grid_tutorial.html>`_

