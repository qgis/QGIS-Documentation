|updatedisclaimer|

Grid spline
===========

B-spline approximation
----------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Points`` [vector: point]
  <put parameter description here>

``Attribute`` [tablefield: any]
  <put parameter description here>

``Target Grid`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] user defined

  Default: *0*

``Resolution`` [number]
  <put parameter description here>

  Default: *1.0*

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

  processing.runalg('saga:bsplineapproximation', shapes, field, target, level, output_extent, user_size, user_grid)

See also
........

Cubic spline approximation
--------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Points`` [vector: point]
  <put parameter description here>

``Attribute`` [tablefield: any]
  <put parameter description here>

``Target Grid`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] user defined

  Default: *0*

``Minimal Number of Points`` [number]
  <put parameter description here>

  Default: *3*

``Maximal Number of Points`` [number]
  <put parameter description here>

  Default: *20*

``Points per Square`` [number]
  <put parameter description here>

  Default: *5*

``Tolerance`` [number]
  <put parameter description here>

  Default: *140.0*

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

  processing.runalg('saga:cubicsplineapproximation', shapes, field, target, npmin, npmax, nppc, k, output_extent, user_size, user_grid)

See also
........

Multilevel b-spline interpolation (from grid)
---------------------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

``Target Grid`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] user defined

  Default: *0*

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] without B-spline refinement
  * 1 --- [1] with B-spline refinement

  Default: *0*

``Threshold Error`` [number]
  <put parameter description here>

  Default: *0.0001*

``Maximum Level`` [number]
  <put parameter description here>

  Default: *11.0*

``Data Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] same as input grid
  * 1 --- [1] floating point

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

  processing.runalg('saga:multilevelbsplineinterpolationfromgrid', gridpoints, target, method, epsilon, level_max, datatype, output_extent, user_size, user_grid)

See also
........

Multilevel b-spline interpolation
---------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Points`` [vector: point]
  <put parameter description here>

``Attribute`` [tablefield: any]
  <put parameter description here>

``Target Grid`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] user defined

  Default: *0*

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] without B-spline refinement
  * 1 --- [1] with B-spline refinement

  Default: *0*

``Threshold Error`` [number]
  <put parameter description here>

  Default: *0.0001*

``Maximum Level`` [number]
  <put parameter description here>

  Default: *11.0*

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

  processing.runalg('saga:multilevelbsplineinterpolation', shapes, field, target, method, epsilon, level_max, output_extent, user_size, user_grid)

See also
........

Thin plate spline (global)
--------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Points`` [vector: point]
  <put parameter description here>

``Attribute`` [tablefield: any]
  <put parameter description here>

``Target Grid`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] user defined

  Default: *0*

``Regularisation`` [number]
  <put parameter description here>

  Default: *0.0*

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

  processing.runalg('saga:thinplatesplineglobal', shapes, field, target, regul, output_extent, user_size, user_grid)

See also
........

Thin plate spline (local)
-------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Points`` [vector: point]
  <put parameter description here>

``Attribute`` [tablefield: any]
  <put parameter description here>

``Target Grid`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] user defined

  Default: *0*

``Regularisation`` [number]
  <put parameter description here>

  Default: *0.0001*

``Search Radius`` [number]
  <put parameter description here>

  Default: *100.0*

``Search Mode`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] all directions
  * 1 --- [1] quadrants

  Default: *0*

``Points Selection`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] all points in search radius
  * 1 --- [1] maximum number of points

  Default: *0*

``Maximum Number of Points`` [number]
  <put parameter description here>

  Default: *10*

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

  processing.runalg('saga:thinplatesplinelocal', shapes, field, target, regul, radius, mode, select, maxpoints, output_extent, user_size, user_grid)

See also
........

Thin plate spline (tin)
-----------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Points`` [vector: point]
  <put parameter description here>

``Attribute`` [tablefield: any]
  <put parameter description here>

``Target Grid`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] user defined

  Default: *0*

``Regularisation`` [number]
  <put parameter description here>

  Default: *0.0*

``Neighbourhood`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] immediate
  * 1 --- [1] level 1
  * 2 --- [2] level 2

  Default: *0*

``Add Frame`` [boolean]
  <put parameter description here>

  Default: *True*

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

  processing.runalg('saga:thinplatesplinetin', shapes, field, target, regul, level, frame, output_extent, user_size, user_grid)

See also
........

