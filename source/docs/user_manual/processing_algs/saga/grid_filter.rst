|updatedisclaimer|

Grid filter
===========

Dtm filter (slope-based)
------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid to filter`` [raster]
  <put parameter description here>

``Search Radius`` [number]
  <put parameter description here>

  Default: *2*

``Approx. Terrain Slope`` [number]
  <put parameter description here>

  Default: *30.0*

``Use Confidence Interval`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
.......

``Bare Earth`` [raster]
  <put output description here>

``Removed Objects`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:dtmfilterslopebased', input, radius, terrainslope, stddev, ground, nonground)

See also
........

Filter clumps
-------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input Grid`` [raster]
  <put parameter description here>

``Min. Size`` [number]
  <put parameter description here>

  Default: *10*

Outputs
.......

``Filtered Grid`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:filterclumps', grid, threshold, output)

See also
........

Gaussian filter
---------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

``Standard Deviation`` [number]
  <put parameter description here>

  Default: *1*

``Search Mode`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Square
  * 1 --- [1] Circle

  Default: *0*

``Search Radius`` [number]
  <put parameter description here>

  Default: *3*

Outputs
.......

``Filtered Grid`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:gaussianfilter', input, sigma, mode, radius, result)

See also
........

Laplacian filter
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

  * 0 --- [0] standard kernel 1
  * 1 --- [1] standard kernel 2
  * 2 --- [2] Standard kernel 3
  * 3 --- [3] user defined kernel

  Default: *0*

``Standard Deviation (Percent of Radius)`` [number]
  <put parameter description here>

  Default: *0*

``Radius`` [number]
  <put parameter description here>

  Default: *1*

``Search Mode`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] square
  * 1 --- [1] circle

  Default: *0*

Outputs
.......

``Filtered Grid`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:laplacianfilter', input, method, sigma, radius, mode, result)

See also
........

Majority filter
---------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

``Search Mode`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Square
  * 1 --- [1] Circle

  Default: *0*

``Radius`` [number]
  <put parameter description here>

  Default: *1*

``Threshold [Percent]`` [number]
  <put parameter description here>

  Default: *0*

Outputs
.......

``Filtered Grid`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:majorityfilter', input, mode, radius, threshold, result)

See also
........

Morphological filter
--------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

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

  * 0 --- [0] Dilation
  * 1 --- [1] Erosion
  * 2 --- [2] Opening
  * 3 --- [3] Closing

  Default: *0*

Outputs
.......

``Filtered Grid`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:morphologicalfilter', input, mode, radius, method, result)

See also
........

Multi direction lee filter
--------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

``Estimated Noise (absolute)`` [number]
  <put parameter description here>

  Default: *1.0*

``Estimated Noise (relative)`` [number]
  <put parameter description here>

  Default: *1.0*

``Weighted`` [boolean]
  <put parameter description here>

  Default: *True*

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] noise variance given as absolute value
  * 1 --- [1] noise variance given relative to mean standard deviation
  * 2 --- [2] original calculation (Ringeler)

  Default: *0*

Outputs
.......

``Filtered Grid`` [raster]
  <put output description here>

``Minimum Standard Deviation`` [raster]
  <put output description here>

``Direction of Minimum Standard Deviation`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:multidirectionleefilter', input, noise_abs, noise_rel, weighted, method, result, stddev, dir)

See also
........

Rank filter
-----------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

``Search Mode`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Square
  * 1 --- [1] Circle

  Default: *0*

``Radius`` [number]
  <put parameter description here>

  Default: *1*

``Rank [Percent]`` [number]
  <put parameter description here>

  Default: *50*

Outputs
.......

``Filtered Grid`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:rankfilter', input, mode, radius, rank, result)

See also
........

Simple filter
-------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

``Search Mode`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Square
  * 1 --- [1] Circle

  Default: *0*

``Filter`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Smooth
  * 1 --- [1] Sharpen
  * 2 --- [2] Edge

  Default: *0*

``Radius`` [number]
  <put parameter description here>

  Default: *2*

Outputs
.......

``Filtered Grid`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:simplefilter', input, mode, method, radius, result)

See also
........

User defined filter
-------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

``Filter Matrix`` [table]
  Optional.

  <put parameter description here>

``Default Filter Matrix (3x3)`` [fixedtable]
  <put parameter description here>

Outputs
.......

``Filtered Grid`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:userdefinedfilter', input, filter, filter_3x3, result)

See also
........

