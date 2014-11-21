Grid statistics for polygons
============================

Description
-----------

<put algortithm description here>

Parameters
----------

``Grids`` [multipleinput: rasters]
  <put parameter description here>

``Polygons`` [vector: polygon]
  <put parameter description here>

``Number of Cells`` [boolean]
  <put parameter description here>

  Default: *True*

``Minimum`` [boolean]
  <put parameter description here>

  Default: *True*

``Maximum`` [boolean]
  <put parameter description here>

  Default: *True*

``Range`` [boolean]
  <put parameter description here>

  Default: *True*

``Sum`` [boolean]
  <put parameter description here>

  Default: *True*

``Mean`` [boolean]
  <put parameter description here>

  Default: *True*

``Variance`` [boolean]
  <put parameter description here>

  Default: *True*

``Standard Deviation`` [boolean]
  <put parameter description here>

  Default: *True*

``Quantiles`` [number]
  <put parameter description here>

  Default: *0*

Outputs
-------

``Statistics`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:gridstatisticsforpolygons', grids, polygons, count, min, max, range, sum, mean, var, stddev, quantile, result)

See also
--------

