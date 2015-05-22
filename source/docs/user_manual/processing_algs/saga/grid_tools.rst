|updatedisclaimer|

Grid tools
==========

Aggregate
---------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

``Aggregation Size`` [number]
  <put parameter description here>

  Default: *3*

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Sum
  * 1 --- [1] Min
  * 2 --- [2] Max

  Default: *0*

Outputs
.......

Console usage
.............

::

  processing.runalg('saga:aggregate', input, size, method)

See also
........

Change grid values
------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

``Replace Condition`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Grid value equals low value
  * 1 --- [1] Low value < grid value < high value
  * 2 --- [2] Low value <= grid value < high value

  Default: *0*

``Lookup Table`` [fixedtable]
  <put parameter description here>

Outputs
.......

``Changed Grid`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:changegridvalues', grid_in, method, lookup, grid_out)

See also
........

Close gaps
----------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

``Mask`` [raster]
  Optional.

  <put parameter description here>

``Tension Threshold`` [number]
  <put parameter description here>

  Default: *0.1*

Outputs
.......

``Changed Grid`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:closegaps', input, mask, threshold, result)

See also
........

Close gaps with spline
----------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

``Mask`` [raster]
  Optional.

  <put parameter description here>

``Only Process Gaps with Less Cells`` [number]
  <put parameter description here>

  Default: *0*

``Maximum Points`` [number]
  <put parameter description here>

  Default: *1000*

``Number of Points for Local Interpolation`` [number]
  <put parameter description here>

  Default: *10*

``Extended Neighourhood`` [boolean]
  <put parameter description here>

  Default: *True*

``Neighbourhood`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Neumann
  * 1 --- [1] Moore

  Default: *0*

``Radius (Cells)`` [number]
  <put parameter description here>

  Default: *0*

``Relaxation`` [number]
  <put parameter description here>

  Default: *0.0*

Outputs
.......

``Closed Gaps Grid`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:closegapswithspline', grid, mask, maxgapcells, maxpoints, localpoints, extended, neighbours, radius, relaxation, closed)

See also
........

Close one cell gaps
-------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

Outputs
.......

``Changed Grid`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:closeonecellgaps', input, result)

See also
........

Convert data storage type
-------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

``Data storage type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] bit
  * 1 --- [1] unsigned 1 byte integer
  * 2 --- [2] signed 1 byte integer
  * 3 --- [3] unsigned 2 byte integer
  * 4 --- [4] signed 2 byte integer
  * 5 --- [5] unsigned 4 byte integer
  * 6 --- [6] signed 4 byte integer
  * 7 --- [7] 4 byte floating point number
  * 8 --- [8] 8 byte floating point number

  Default: *0*

Outputs
.......

``Converted Grid`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:convertdatastoragetype', input, type, output)

See also
........

Crop to data
------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [raster]
  <put parameter description here>

Outputs
.......

``Cropped layer`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:croptodata', input, output)

See also
........

Grid buffer
-----------

Description
...........

<put algorithm description here>

Parameters
..........

``Features Grid`` [raster]
  <put parameter description here>

``Distance`` [number]
  <put parameter description here>

  Default: *1000*

``Buffer Distance`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Fixed
  * 1 --- [1] Cell value

  Default: *0*

Outputs
.......

``Buffer Grid`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:gridbuffer', features, dist, buffertype, buffer)

See also
........

Grid masking
------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

``Mask`` [raster]
  <put parameter description here>

Outputs
.......

``Masked Grid`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:gridmasking', grid, mask, masked)

See also
........

Grid orientation
----------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Copy
  * 1 --- [1] Flip
  * 2 --- [2] Mirror
  * 3 --- [3] Invert

  Default: *0*

Outputs
.......

``Changed Grid`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:gridorientation', input, method, result)

See also
........

Grid proximity buffer
---------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Source Grid`` [raster]
  <put parameter description here>

``Buffer distance`` [number]
  <put parameter description here>

  Default: *500.0*

``Equidistance`` [number]
  <put parameter description here>

  Default: *100.0*

Outputs
.......

``Distance Grid`` [raster]
  <put output description here>

``Allocation Grid`` [raster]
  <put output description here>

``Buffer Grid`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:gridproximitybuffer', source, dist, ival, distance, alloc, buffer)

See also
........

Grid shrink/expand
------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

``Operation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Shrink
  * 1 --- [1] Expand

  Default: *0*

``Search Mode`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Square
  * 1 --- [1] Circle

  Default: *0*

``Radius`` [number]
  <put parameter description here>

  Default: *1*

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] min
  * 1 --- [1] max
  * 2 --- [2] mean
  * 3 --- [3] majority

  Default: *0*

Outputs
.......

``Result Grid`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:gridshrinkexpand', input, operation, mode, radius, method_expand, result)

See also
........

Invert data/no-data
-------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

Outputs
.......

``Result`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:invertdatanodata', input, output)

See also
........

Merge raster layers
-------------------

Description
...........

<put algorithm description here>

Parameters
..........

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
.......

``Merged Grid`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:mergerasterlayers', grids, type, interpol, overlap, merged)

See also
........

Patching
--------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

``Patch Grid`` [raster]
  <put parameter description here>

``Interpolation Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Nearest Neighbor
  * 1 --- [1] Bilinear Interpolation
  * 2 --- [2] Inverse Distance Interpolation
  * 3 --- [3] Bicubic Spline Interpolation
  * 4 --- [4] B-Spline Interpolation

  Default: *0*

Outputs
.......

``Completed Grid`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:patching', original, additional, interpolation, completed)

See also
........

Proximity grid
--------------

Description
...........

<put algorithm description here>

Parameters
..........

``Features`` [raster]
  <put parameter description here>

Outputs
.......

``Distance`` [raster]
  <put output description here>

``Direction`` [raster]
  <put output description here>

``Allocation`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:proximitygrid', features, distance, direction, allocation)

See also
........

Reclassify grid values
----------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] single
  * 1 --- [1] range
  * 2 --- [2] simple table

  Default: *0*

``old value (for single value change)`` [number]
  <put parameter description here>

  Default: *0.0*

``new value (for single value change)`` [number]
  <put parameter description here>

  Default: *1.0*

``operator (for single value change)`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] =
  * 1 --- [1] <
  * 2 --- [2] <=
  * 3 --- [3] >=
  * 4 --- [4] >

  Default: *0*

``minimum value (for range)`` [number]
  <put parameter description here>

  Default: *0.0*

``maximum value (for range)`` [number]
  <put parameter description here>

  Default: *1.0*

``new value(for range)`` [number]
  <put parameter description here>

  Default: *2.0*

``operator (for range)`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] <=
  * 1 --- [1] <

  Default: *0*

``Lookup Table`` [fixedtable]
  <put parameter description here>

``operator (for table)`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] min <= value < max
  * 1 --- [1] min <= value <= max
  * 2 --- [2] min < value <= max
  * 3 --- [3] min < value < max

  Default: *0*

``replace no data values`` [boolean]
  <put parameter description here>

  Default: *True*

``new value for no data values`` [number]
  <put parameter description here>

  Default: *0.0*

``replace other values`` [boolean]
  <put parameter description here>

  Default: *True*

``new value for other values`` [number]
  <put parameter description here>

  Default: *0.0*

Outputs
.......

``Reclassified Grid`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:reclassifygridvalues', input, method, old, new, soperator, min, max, rnew, roperator, retab, toperator, nodataopt, nodata, otheropt, others, result)

See also
........

Resampling
----------

Description
...........

<put algorithm description here>

Parameters
..........

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
.......

``Grid`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:resampling', input, keep_type, target, scale_up_method, scale_down_method, output_extent, user_size, user_grid)

See also
........

Sort grid
---------

Description
...........

<put algorithm description here>

Parameters
..........

``Input Grid`` [raster]
  <put parameter description here>

``Down sort`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
.......

``Sorted Grid`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:sortgrid', grid, down, output)

See also
........

Split RGB bands
---------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input layer`` [raster]
  <put parameter description here>

Outputs
.......

``Output R band layer`` [raster]
  <put output description here>

``Output G band layer`` [raster]
  <put output description here>

``Output B band layer`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:splitrgbbands', input, r, g, b)

See also
........

Threshold buffer
----------------

Description
...........

<put algorithm description here>

Parameters
..........

``Features Grid`` [raster]
  <put parameter description here>

``Value Grid`` [raster]
  <put parameter description here>

``Threshold Grid`` [raster]
  Optional.

  <put parameter description here>

``Threshold`` [number]
  <put parameter description here>

  Default: *0.0*

``Threshold Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Absolute
  * 1 --- [1] Relative from cell value

  Default: *0*

Outputs
.......

``Buffer Grid`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:thresholdbuffer', features, value, thresholdgrid, threshold, thresholdtype, buffer)

See also
........

