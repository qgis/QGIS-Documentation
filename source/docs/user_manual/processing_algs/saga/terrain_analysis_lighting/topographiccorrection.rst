Topographic correction
======================

Description
-----------

<put algortithm description here>

Parameters
----------

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
-------

``Corrected Image`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:topographiccorrection', dem, original, azi, hgt, method, minnaert, maxcells, maxvalue, corrected)

See also
--------

