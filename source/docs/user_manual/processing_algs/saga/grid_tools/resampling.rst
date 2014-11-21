Resampling
==========

Description
-----------

<put algortithm description here>

Parameters
----------

``Grid`` [raster]
  <put parameter description here>

``Preserve Data Type`` [boolean]
  <put parameter description here>

  Default: *True*

``Target Grid`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] user defined

  Default: *0*

``Interpolation Method (Scale Up)`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Nearest Neighbor
  * 1 --- [1] Bilinear Interpolation
  * 2 --- [2] Inverse Distance Interpolation
  * 3 --- [3] Bicubic Spline Interpolation
  * 4 --- [4] B-Spline Interpolation
  * 5 --- [5] Mean Value
  * 6 --- [6] Mean Value (cell area weighted)
  * 7 --- [7] Minimum Value
  * 8 --- [8] Maximum Value
  * 9 --- [9] Majority

  Default: *0*

``Interpolation Method (Scale Down)`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Nearest Neighbor
  * 1 --- [1] Bilinear Interpolation
  * 2 --- [2] Inverse Distance Interpolation
  * 3 --- [3] Bicubic Spline Interpolation
  * 4 --- [4] B-Spline Interpolation

  Default: *0*

``Output extent`` [extent]
  <put parameter description here>

  Default: *0,1,0,1*

``Cellsize`` [number]
  <put parameter description here>

  Default: *100.0*

Outputs
-------

``Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:resampling', input, keep_type, target, scale_up_method, scale_down_method, output_extent, user_size, user_grid)

See also
--------

