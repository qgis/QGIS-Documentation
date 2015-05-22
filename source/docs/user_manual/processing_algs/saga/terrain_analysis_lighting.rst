|updatedisclaimer|

Terrain lighting
================

Analytical hillshading
----------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Shading Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Standard
  * 1 --- [1] Standard (max. 90Degree)
  * 2 --- [2] Combined Shading
  * 3 --- [3] Ray Tracing

  Default: *0*

``Azimuth [Degree]`` [number]
  <put parameter description here>

  Default: *315.0*

``Declination [Degree]`` [number]
  <put parameter description here>

  Default: *45.0*

``Exaggeration`` [number]
  <put parameter description here>

  Default: *4.0*

Outputs
.......

``Analytical Hillshading`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:analyticalhillshading', elevation, method, azimuth, declination, exaggeration, shade)

See also
........

Sky view factor
---------------

Description
...........

<put algortithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Maximum Search Radius`` [number]
  <put parameter description here>

  Default: *10000*

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] multi scale
  * 1 --- [1] sectors

  Default: *0*

``Multi Scale Factor`` [number]
  <put parameter description here>

  Default: *3*

``Number of Sectors`` [number]
  <put parameter description here>

  Default: *8*

Outputs
.......

``Visible Sky`` [raster]
  <put output description here>

``Sky View Factor`` [raster]
  <put output description here>

``Sky View Factor (Simplified)`` [raster]
  <put output description here>

``Terrain View Factor`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:skyviewfactor', dem, maxradius, method, level_inc, ndirs, visible, svf, simple, terrain)

See also
........

Topographic correction
----------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Original Image`` [raster]
  <put parameter description here>

``Azimuth`` [number]
  <put parameter description here>

  Default: *180.0*

``Height`` [number]
  <put parameter description here>

  Default: *45.0*

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Cosine Correction (Teillet et al. 1982)
  * 1 --- [1] Cosine Correction (Civco 1989)
  * 2 --- [2] Minnaert Correction
  * 3 --- [3] Minnaert Correction with Slope (Riano et al. 2003)
  * 4 --- [4] Minnaert Correction with Slope (Law & Nichol 2004)
  * 5 --- [5] C Correction
  * 6 --- [6] Normalization (after Civco, modified by Law & Nichol)

  Default: *0*

``Minnaert Correction`` [number]
  <put parameter description here>

  Default: *0.5*

``Maximum Cells (C Correction Analysis)`` [number]
  <put parameter description here>

  Default: *1000*

``Value Range`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] 1 byte (0-255)
  * 1 --- [1] 2 byte (0-65535)

  Default: *0*

Outputs
.......

``Corrected Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:topographiccorrection', dem, original, azi, hgt, method, minnaert, maxcells, maxvalue, corrected)

See also
........

