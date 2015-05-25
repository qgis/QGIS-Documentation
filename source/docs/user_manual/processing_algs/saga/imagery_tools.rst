|updatedisclaimer|

Imagery tools
=============

Vegetation index[distance based]
--------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Near Infrared Band`` [raster]
  <put parameter description here>

``Red Band`` [raster]
  <put parameter description here>

``Slope of the soil line`` [number]
  <put parameter description here>

  Default: *0.0*

``Intercept of the soil line`` [number]
  <put parameter description here>

  Default: *0.0*

Outputs
.......

``PVI (Richardson and Wiegand)`` [raster]
  <put output description here>

``PVI (Perry & Lautenschlager)`` [raster]
  <put output description here>

``PVI (Walther & Shabaani)`` [raster]
  <put output description here>

``PVI (Qi, et al)`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:vegetationindexdistancebased', nir, red, slope, intercept, pvi, pvi1, pvi2, pvi3)

See also
........

Vegetation index[slope based]
-----------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Near Infrared Band`` [raster]
  <put parameter description here>

``Red Band`` [raster]
  <put parameter description here>

Outputs
.......

``Normalized Difference Vegetation Index`` [raster]
  <put output description here>

``Ratio Vegetation Index`` [raster]
  <put output description here>

``Transformed Vegetation Index`` [raster]
  <put output description here>

``Corrected Transformed Vegetation Index`` [raster]
  <put output description here>

``Thiam's Transformed Vegetation Index`` [raster]
  <put output description here>

``Normalized Ratio Vegetation Index`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:vegetationindexslopebased', nir, red, ndvi, ratio, tvi, ctvi, ttvi, nratio)

See also
........

