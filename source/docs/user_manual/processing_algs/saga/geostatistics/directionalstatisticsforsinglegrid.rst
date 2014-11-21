Directional statistics for single grid
======================================

Description
-----------

<put algortithm description here>

Parameters
----------

``Grid`` [raster]
  <put parameter description here>

``Points`` [vector: any]
  Optional.

  <put parameter description here>

``Direction [Degree]`` [number]
  <put parameter description here>

  Default: *0.0*

``Tolerance [Degree]`` [number]
  <put parameter description here>

  Default: *0.0*

``Maximum Distance [Cells]`` [number]
  <put parameter description here>

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

  Default: *1*

``Inverse Distance Offset`` [boolean]
  <put parameter description here>

  Default: *True*

``Gaussian and Exponential Weighting Bandwidth`` [number]
  <put parameter description here>

  Default: *1.0*

Outputs
-------

``Arithmetic Mean`` [raster]
  <put output description here>

``Difference from Arithmetic Mean`` [raster]
  <put output description here>

``Minimum`` [raster]
  <put output description here>

``Maximum`` [raster]
  <put output description here>

``Range`` [raster]
  <put output description here>

``Variance`` [raster]
  <put output description here>

``Standard Deviation`` [raster]
  <put output description here>

``Mean less Standard Deviation`` [raster]
  <put output description here>

``Mean plus Standard Deviation`` [raster]
  <put output description here>

``Deviation from Arithmetic Mean`` [raster]
  <put output description here>

``Percentile`` [raster]
  <put output description here>

``Directional Statistics for Points`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:directionalstatisticsforsinglegrid', grid, points, direction, tolerance, maxdistance, distance_weighting_weighting, distance_weighting_idw_power, distance_weighting_idw_offset, distance_weighting_bandwidth, mean, difmean, min, max, range, var, stddev, stddevlo, stddevhi, devmean, percent, points_out)

See also
--------

