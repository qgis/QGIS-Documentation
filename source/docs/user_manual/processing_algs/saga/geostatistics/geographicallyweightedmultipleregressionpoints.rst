Geographically weighted multiple regression (points)
====================================================

Description
-----------

<put algortithm description here>

Parameters
----------

``Points`` [vector: any]
  <put parameter description here>

``Dependent Variable`` [tablefield: any]
  <put parameter description here>

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

  Default: *1*

``Inverse Distance Offset`` [boolean]
  <put parameter description here>

  Default: *True*

``Gaussian and Exponential Weighting Bandwidth`` [number]
  <put parameter description here>

  Default: *1.0*

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

Outputs
-------

``Regression`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:geographicallyweightedmultipleregressionpoints', points, dependent, distance_weighting_weighting, distance_weighting_idw_power, distance_weighting_idw_offset, distance_weighting_bandwidth, range, radius, mode, npoints, maxpoints, minpoints, regression)

See also
--------

