Dtm filter (slope-based)
========================

Description
-----------

<put algortithm description here>

Parameters
----------

``Grid to filter`` [raster]
  <put parameter description here>

``Search Radius`` [number]
  <put parameter description here>

  Default: *2*

``Approx. Terrain Slope`` [number]
  <put parameter description here>

  Default: *30.0*

``Use Confidence Interval`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
-------

``Bare Earth`` [raster]
  <put output description here>

``Removed Objects`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:dtmfilterslopebased', input, radius, terrainslope, stddev, ground, nonground)

See also
--------

