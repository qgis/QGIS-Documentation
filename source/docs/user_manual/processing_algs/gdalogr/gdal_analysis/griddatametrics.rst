Grid (Data metrics)
===================

Description
-----------
This algorith computes some data metrics using the specified window and output grid geometry. 

Parameters
----------

``Input layer`` [vector: point]
  Point vector layer

``Z field`` [tablefield: numeric]
  Field for the interpolation (*Optional*)

``Metrics`` [selection]
  List of available metrics:

  Options:

  * 0 --- Minimum, minimum value found in grid node search ellipse.
  * 1 --- Maximum, maximum value found in grid node search ellipse
  * 2 --- Range, a difference between the minimum and maximum values found in grid node search ellipse
  * 3 --- Count, a number of data points found in grid node search ellipse
  * 4 --- Average distance, an average distance between the grid node (center of the search ellipse) and all of the data points found in grid node search ellipse
  * 5 --- Average distance between points, an average distance between the data points found in grid node search ellipse. The distance between each pair of points within ellipse is calculated and average of all distances is set as a grid node value

  Default: *0*

``Radius 1`` [number]
  The first radius (X axis if rotation angle is 0) of search ellipse. Set this parameter to zero to use whole point array 
  
  Default: *0.0*

``Radius 2`` [number]
  The second radius (Y axis if rotation angle is 0) of search ellipse. Set this parameter to zero to use whole point array
  
  Default: *0.0*

``Min points`` [number]
  Minimum number of data points to use. If less amount of points found the grid node considered empty and will be filled with NODATA marker. 
  
  This is only used if search ellipse is set (both radii are non-zero)
  
  Default: *0.0*

``Angle`` [number]
  Angle of search ellipse rotation in degrees (counter clockwise)

  Default: *0.0*

``Nodata`` [number]
  NODATA marker to fill empty points

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

  processing.runalg('gdalogr:griddatametrics', input, z_field, metric, radius_1, radius_2, min_points, angle, nodata, rtype, output)

See also
--------
`GDAL grid tutorial <http://www.gdal.org/grid_tutorial.html>`_
