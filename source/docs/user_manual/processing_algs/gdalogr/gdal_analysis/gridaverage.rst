Grid (Moving average)
=====================

Description
-----------
The Moving Average is a simple data averaging algorithm. It uses a moving window of elliptic form to search values 
and averages all data points within the window. Search ellipse can be rotated by specified angle, the center of ellipse
located at the grid node. Also the minimum number of data points to average can be set, if there are not enough points 
in window, the grid node considered empty and will be filled with specified NODATA value.


Parameters
----------

``Input layer`` [vector: point]
  Point vector layer

``Z field`` [tablefield: numeric]
  Field for the interpolation (*Optional*)

``Radius 1`` [number]
  The first radius (X axis if rotation angle is 0) of search ellipse.
  
  Default: *0.0*

``Radius 2`` [number]
  The second radius (Y axis if rotation angle is 0) of search ellipse.
  
  Default: *0.0*

``Min points`` [number]
  Minimum number of data points to average.
  If less amount of points found the grid node considered empty and will be filled with NODATA marker.
  
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

  processing.runalg('gdalogr:gridaverage', input, z_field, radius_1, radius_2, min_points, angle, nodata, rtype, output)

See also
--------
 `GDAL grid tutorial <http://www.gdal.org/grid_tutorial.html>`_
