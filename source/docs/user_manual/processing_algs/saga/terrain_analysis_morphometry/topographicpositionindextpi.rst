Topographic position index (tpi)
================================

Description
-----------

<put algortithm description here>

Parameters
----------

``Elevation`` [raster]
  <put parameter description here>

``Standardize`` [boolean]
  <put parameter description here>

  Default: *True*

``Min Radius`` [number]
  <put parameter description here>

  Default: *0.0*

``Max Radius`` [number]
  <put parameter description here>

  Default: *100.0*

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

  Default: *75.0*

Outputs
-------

``Topographic Position Index`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:topographicpositionindextpi', dem, standard, radius_min, radius_max, distance_weighting_weighting, distance_weighting_idw_power, distance_weighting_idw_offset, distance_weighting_bandwidth, tpi)

See also
--------

