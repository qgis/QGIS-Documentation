Fragmentation classes from density and connectivity
===================================================

Description
-----------

<put algortithm description here>

Parameters
----------

``Density [Percent]`` [raster]
  <put parameter description here>

``Connectivity [Percent]`` [raster]
  <put parameter description here>

``Add Border`` [boolean]
  <put parameter description here>

  Default: *True*

``Connectivity Weighting`` [number]
  <put parameter description here>

  Default: *0*

``Minimum Density [Percent]`` [number]
  <put parameter description here>

  Default: *10*

``Minimum Density for Interior Forest [Percent]`` [number]
  <put parameter description here>

  Default: *99*

Outputs
-------

``Fragmentation`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:fragmentationclassesfromdensityandconnectivity', density, connectivity, border, weight, density_min, density_int, fragmentation)

See also
--------

