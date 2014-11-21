Terrain ruggedness index (tri)
==============================

Description
-----------

<put algortithm description here>

Parameters
----------

``Elevation`` [raster]
  <put parameter description here>

``Radius (Cells)`` [number]
  <put parameter description here>

  Default: *1*

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

Outputs
-------

``Terrain Ruggedness Index (TRI)`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:terrainruggednessindextri', dem, radius, distance_weighting_weighting, distance_weighting_idw_power, distance_weighting_idw_offset, distance_weighting_bandwidth, tri)

See also
--------

