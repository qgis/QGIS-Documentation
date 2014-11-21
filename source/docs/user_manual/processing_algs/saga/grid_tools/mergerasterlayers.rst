Merge raster layers
===================

Description
-----------

<put algortithm description here>

Parameters
----------

``Grids to Merge`` [multipleinput: rasters]
  <put parameter description here>

``Preferred data storage type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] 1 bit
  * 1 --- [1] 1 byte unsigned integer
  * 2 --- [2] 1 byte signed integer
  * 3 --- [3] 2 byte unsigned integer
  * 4 --- [4] 2 byte signed integer
  * 5 --- [5] 4 byte unsigned integer
  * 6 --- [6] 4 byte signed integer
  * 7 --- [7] 4 byte floating point
  * 8 --- [8] 8 byte floating point

  Default: *0*

``Interpolation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Nearest Neighbor
  * 1 --- [1] Bilinear Interpolation
  * 2 --- [2] Inverse Distance Interpolation
  * 3 --- [3] Bicubic Spline Interpolation
  * 4 --- [4] B-Spline Interpolation

  Default: *0*

``Overlapping Cells`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] mean value
  * 1 --- [1] first value in order of grid list

  Default: *0*

Outputs
-------

``Merged Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:mergerasterlayers', grids, type, interpol, overlap, merged)

See also
--------

