|updatedisclaimer|

Grid gridding
=============

Inverse distance weighted
-------------------------

Description
...........

Inverse distance grid interpolation from irregular distributed points.

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

``Distance Weighting`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] inverse distance to a power
  * 1 --- [1] linearly decreasing within search radius
  * 2 --- [2] exponential weighting scheme
  * 3 --- [3] gaussian weighting scheme

  Default: *0*

``Inverse Distance Power`` [number]
  <put parameter description here>

  Default: *2*

``Exponential and Gaussian Weighting Bandwidth`` [number]
  <put parameter description here>

  Default: *1*

``Search Range`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] search radius (local)
  * 1 --- [1] no search radius (global)

  Default: *0*

``Search Radius`` [number]
  <put parameter description here>

  Default: *100.0*

``Search Mode`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] all directions
  * 1 --- [1] quadrants

  Default: *0*

``Number of Points`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] maximum number of points
  * 1 --- [1] all points

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

  processing.runalg('saga:inversedistanceweighted', shapes, field, target, weighting, power, bandwidth, range, radius, mode, points, npoints, output_extent, user_size, user_grid)

See also
........

Kernel density estimation
-------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Points`` [vector: point]
  <put parameter description here>

``Weight`` [tablefield: any]
  <put parameter description here>

``Radius`` [number]
  <put parameter description here>

  Default: *10*

``Kernel`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] quartic kernel
  * 1 --- [1] gaussian kernel

  Default: *0*

``Target Grid`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] user defined

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

  processing.runalg('saga:kerneldensityestimation', points, population, radius, kernel, target, output_extent, user_size, user_grid)

See also
........

Modifed quadratic shepard
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

``Quadratic Neighbors`` [number]
  <put parameter description here>

  Default: *13*

``Weighting Neighbors`` [number]
  <put parameter description here>

  Default: *19*

``Left`` [number]
  <put parameter description here>

  Default: *0.0*

``Right`` [number]
  <put parameter description here>

  Default: *0.0*

``Bottom`` [number]
  <put parameter description here>

  Default: *0.0*

``Top`` [number]
  <put parameter description here>

  Default: *0.0*

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

  processing.runalg('saga:modifedquadraticshepard', shapes, field, target, quadratic_neighbors, weighting_neighbors, user_xmin, user_xmax, user_ymin, user_ymax, user_size, user_grid)

See also
........

Natural neighbour
-----------------

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

``Sibson`` [boolean]
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

  processing.runalg('saga:naturalneighbour', shapes, field, target, sibson, output_extent, user_size, user_grid)

See also
........

Nearest neighbour
-----------------

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

  processing.runalg('saga:nearestneighbour', shapes, field, target, output_extent, user_size, user_grid)

See also
........

Shapes to grid
--------------

Description
...........

<put algorithm description here>

Parameters
..........

``Shapes`` [vector: any]
  <put parameter description here>

``Attribute`` [tablefield: any]
  <put parameter description here>

``Method for Multiple Values`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] first
  * 1 --- [1] last
  * 2 --- [2] minimum
  * 3 --- [3] maximum
  * 4 --- [4] mean

  Default: *0*

``Method for Lines`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] thin
  * 1 --- [1] thick

  Default: *0*

``Preferred Target Grid Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Integer (1 byte)
  * 1 --- [1] Integer (2 byte)
  * 2 --- [2] Integer (4 byte)
  * 3 --- [3] Floating Point (4 byte)
  * 4 --- [4] Floating Point (8 byte)

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

  processing.runalg('saga:shapestogrid', input, field, multiple, line_type, grid_type, output_extent, user_size, user_grid)

See also
........

Triangulation
-------------

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

  processing.runalg('saga:triangulation', shapes, field, target, output_extent, user_size, user_grid)

See also
........

