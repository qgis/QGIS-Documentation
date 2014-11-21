D-Infinity Contributing Area
============================

Description
-----------

<put algortithm description here>

Parameters
----------

``D-Infinity Flow Direction Grid`` [raster]
  <put parameter description here>

``Outlets Shapefile`` [vector: point]
  Optional.

  <put parameter description here>

``Weight Grid`` [raster]
  Optional.

  <put parameter description here>

``Check for edge contamination`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
-------

``D-Infinity Specific Catchment Area Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('taudem:dinfinitycontributingarea', -ang, -o, -wg, -nc, -sca)

See also
--------

