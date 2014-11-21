D-Infinity Concentration Limited Accumulation
=============================================

Description
-----------

<put algortithm description here>

Parameters
----------

``D-Infinity Flow Direction Grid`` [raster]
  <put parameter description here>

``Disturbance Indicator Grid`` [raster]
  <put parameter description here>

``Decay Multiplier Grid`` [raster]
  <put parameter description here>

``Effective Runoff Weight Grid`` [raster]
  <put parameter description here>

``Outlets shapefile`` [vector: point]
  Optional.

  <put parameter description here>

``Concentration Threshold`` [number]
  <put parameter description here>

  Default: *1.0*

``Check for edge contamination`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
-------

``Concentration Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('taudem:dinfinityconcentrationlimitedaccumulation', -ang, -dg, -dm, -q, -o, -csol, -nc, -ctpt)

See also
--------

