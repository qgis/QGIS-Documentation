Relative heights and slope positions
====================================

Description
-----------

<put algortithm description here>

Parameters
----------

``Elevation`` [raster]
  <put parameter description here>

``w`` [number]
  <put parameter description here>

  Default: *0.5*

``t`` [number]
  <put parameter description here>

  Default: *10.0*

``e`` [number]
  <put parameter description here>

  Default: *2.0*

Outputs
-------

``Slope Height`` [raster]
  <put output description here>

``Valley Depth`` [raster]
  <put output description here>

``Normalized Height`` [raster]
  <put output description here>

``Standardized Height`` [raster]
  <put output description here>

``Mid-Slope Positon`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:relativeheightsandslopepositions', dem, w, t, e, ho, hu, nh, sh, ms)

See also
--------

