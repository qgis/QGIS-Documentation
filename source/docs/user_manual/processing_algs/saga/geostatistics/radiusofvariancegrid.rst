Radius of variance (grid)
=========================

Description
-----------

<put algortithm description here>

Parameters
----------

``Grid`` [raster]
  <put parameter description here>

``Standard Deviation`` [number]
  <put parameter description here>

  Default: *1.0*

``Maximum Search Radius (cells)`` [number]
  <put parameter description here>

  Default: *20*

``Type of Output`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Cells
  * 1 --- [1] Map Units

  Default: *0*

Outputs
-------

``Variance Radius`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:radiusofvariancegrid', input, variance, radius, output, result)

See also
--------

