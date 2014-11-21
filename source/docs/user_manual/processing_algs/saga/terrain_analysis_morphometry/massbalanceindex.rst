Mass balance index
==================

Description
-----------

<put algortithm description here>

Parameters
----------

``Elevation`` [raster]
  <put parameter description here>

``Vertical Distance to Channel Network`` [raster]
  Optional.

  <put parameter description here>

``T Slope`` [number]
  <put parameter description here>

  Default: *15.0*

``T Curvature`` [number]
  <put parameter description here>

  Default: *0.01*

``T Vertical Distance to Channel Network`` [number]
  <put parameter description here>

  Default: *15.0*

Outputs
-------

``Mass Balance Index`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:massbalanceindex', dem, hrel, tslope, tcurve, threl, mbi)

See also
--------

