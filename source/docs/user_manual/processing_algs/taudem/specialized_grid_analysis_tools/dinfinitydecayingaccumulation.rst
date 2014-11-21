D-Infinity Decaying Accumulation
================================

Description
-----------

<put algortithm description here>

Parameters
----------

``D-Infinity Flow Direction Grid`` [raster]
  <put parameter description here>

``Decay Multiplier Grid`` [raster]
  <put parameter description here>

``Weight Grid`` [raster]
  Optional.

  <put parameter description here>

``Outlets Shapefile`` [vector: point]
  Optional.

  <put parameter description here>

``Check for edge contamination`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
-------

``Upslope Dependence Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('taudem:dinfinitydecayingaccumulation', -ang, -dm, -wg, -o, -nc, -dsca)

See also
--------

