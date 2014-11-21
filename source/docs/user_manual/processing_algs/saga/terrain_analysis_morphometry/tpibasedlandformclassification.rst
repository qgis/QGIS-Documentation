Tpi based landform classification
=================================

Description
-----------

<put algortithm description here>

Parameters
----------

``Elevation`` [raster]
  <put parameter description here>

``Min Radius A`` [number]
  <put parameter description here>

  Default: *0*

``Max Radius A`` [number]
  <put parameter description here>

  Default: *100*

``Min Radius B`` [number]
  <put parameter description here>

  Default: *0*

``Max Radius B`` [number]
  <put parameter description here>

  Default: *1000*

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

``Landforms`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:tpibasedlandformclassification', dem, radius_a_min, radius_a_max, radius_b_min, radius_b_max, distance_weighting_weighting, distance_weighting_idw_power, distance_weighting_idw_offset, distance_weighting_bandwidth, landforms)

See also
--------

