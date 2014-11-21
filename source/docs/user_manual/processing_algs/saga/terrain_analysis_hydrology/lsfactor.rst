Ls factor
=========

Description
-----------

<put algortithm description here>

Parameters
----------

``Slope`` [raster]
  <put parameter description here>

``Catchment Area`` [raster]
  <put parameter description here>

``Area to Length Conversion`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] no conversion (areas already given as specific catchment area)
  * 1 --- [1] 1 / cell size (specific catchment area)
  * 2 --- [2] square root (catchment length)

  Default: *0*

``Method (LS)`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Moore et al. 1991
  * 1 --- [1] Desmet & Govers 1996
  * 2 --- [2] Boehner & Selige 2006

  Default: *0*

``Rill/Interrill Erosivity`` [number]
  <put parameter description here>

  Default: *0.0*

``Stability`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] stable
  * 1 --- [1] instable (thawing)

  Default: *0*

Outputs
-------

``LS Factor`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:lsfactor', slope, area, conv, method, erosivity, stability, ls)

See also
--------

