Patching
========

Description
-----------

<put algortithm description here>

Parameters
----------

``Grid`` [raster]
  <put parameter description here>

``Patch Grid`` [raster]
  <put parameter description here>

``Interpolation Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Nearest Neighbor
  * 1 --- [1] Bilinear Interpolation
  * 2 --- [2] Inverse Distance Interpolation
  * 3 --- [3] Bicubic Spline Interpolation
  * 4 --- [4] B-Spline Interpolation

  Default: *0*

Outputs
-------

``Completed Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:patching', original, additional, interpolation, completed)

See also
--------

