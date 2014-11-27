Inverse distance weighted
=========================

Description
-----------

Inverse distance grid interpolation from irregular distributed points.

Parameters
----------

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
-------

``Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:inversedistanceweighted', shapes, field, target, weighting, power, bandwidth, range, radius, mode, points, npoints, output_extent, user_size, user_grid)

See also
--------

