Grid (Inverse distance to a power)
==================================

Description
-----------
The Inverse Distance to a Power gridding method is a weighted average interpolator. 

You should supply the input arrays with the scattered data values including coordinates of every data point and output
grid geometry. The function will compute interpolated value for the given position in output grid.

Parameters
----------

``Input layer`` [vector: point]
  Point vector layer

``Z field`` [tablefield: numeric]
  Field for the interpolation (*Optional*).

``Power`` [number]
  Weighting power 
  
  Default: *2.0*

``Smothing`` [number]
  Smoothing parameter

  Default: *0.0*

``Radius 1`` [number]
  The first radius (X axis if rotation angle is 0) of search ellipse

  Default: *0.0*

``Radius 2`` [number]
  The second radius (Y axis if rotation angle is 0) of search ellipse

  Default: *0.0*

``Max points`` [number]
  Maximum number of data points to use.
  
  Do not search for more points than this number. If less amount of points found the grid node considered empty and 
  will be filled with NODATA marker

  Default: *0.0*

``Min points`` [number]
  Minimum number of data points to use.
  
  If less amount of points found the grid node considered empty and will be filled with NODATA marker

  Default: *0.0*

``Angle`` [number]
  Angle of ellipse rotation in degrees.
  
  Ellipse rotated counter clockwise.

  Default: *0.0*

``Nodata`` [number]
  No data marker to fill empty points

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

  processing.runalg('gdalogr:gridinvdist', input, z_field, power, smothing, radius_1, radius_2, max_points, min_points, angle, nodata, rtype, output)

See also
--------
`GDAL grid tutorial <http://www.gdal.org/grid_tutorial.html>`_

