D-Infinity Avalanche Runout
===========================

Description
-----------

<put algortithm description here>

Parameters
----------

``D-Infinity Flow Direction Grid`` [raster]
  <put parameter description here>

``Pit Filled Elevation Grid`` [raster]
  <put parameter description here>

``Avalanche Source Site Grid`` [raster]
  <put parameter description here>

``Proportion Threshold`` [number]
  <put parameter description here>

  Default: *0.2*

``Alpha Angle Threshold`` [number]
  <put parameter description here>

  Default: *18*

``Measure distance along flow path`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
-------

``Runout Zone Grid`` [raster]
  <put output description here>

``Path Distance Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('taudem:dinfinityavalancherunout', -ang, -fel, -ass, -thresh, -alpha, -direct, -rz, -dfs)

See also
--------

