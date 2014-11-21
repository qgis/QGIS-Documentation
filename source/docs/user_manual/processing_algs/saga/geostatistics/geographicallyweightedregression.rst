Geographically weighted regression
==================================

Description
-----------

<put algortithm description here>

Parameters
----------

``Points`` [vector: point]
  <put parameter description here>

``Dependent Variable`` [tablefield: any]
  <put parameter description here>

``Predictor`` [tablefield: any]
  <put parameter description here>

``Target Grids`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] user defined

  Default: *0*

``Distance Weighting`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] no distance weighting
  * 1 --- [1] inverse distance to a power
  * 2 --- [2] exponential
  * 3 --- [3] gaussian weighting

  Default: *0*

``Inverse Distance Weighting Power`` [number]
  <put parameter description here>

  Default: *0*

``Inverse Distance Offset`` [boolean]
  <put parameter description here>

  Default: *True*

``Gaussian and Exponential Weighting Bandwidth`` [number]
  <put parameter description here>

  Default: *0.0*

``Search Range`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] search radius (local)
  * 1 --- [1] no search radius (global)

  Default: *0*

``Search Radius`` [number]
  <put parameter description here>

  Default: *100*

``Search Mode`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] all directions
  * 1 --- [1] quadrants

  Default: *0*

``Number of Points`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] maximum number of observations
  * 1 --- [1] all points

  Default: *0*

``Maximum Number of Observations`` [number]
  <put parameter description here>

  Default: *10*

``Minimum Number of Observations`` [number]
  <put parameter description here>

  Default: *4*

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

``Quality`` [raster]
  <put output description here>

``Intercept`` [raster]
  <put output description here>

``Slope`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:geographicallyweightedregression', points, dependent, predictor, target, distance_weighting_weighting, distance_weighting_idw_power, distance_weighting_idw_offset, distance_weighting_bandwidth, range, radius, mode, npoints, maxpoints, minpoints, output_extent, user_size, user_grid, user_quality, user_intercept, user_slope)

See also
--------

