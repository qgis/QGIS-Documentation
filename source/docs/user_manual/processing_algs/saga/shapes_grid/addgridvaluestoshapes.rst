Add grid values to shapes
=========================

Description
-----------

<put algortithm description here>

Parameters
----------

``Shapes`` [vector: any]
  <put parameter description here>

``Grids`` [multipleinput: rasters]
  <put parameter description here>

``Interpolation`` [selection]
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

``Result`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:addgridvaluestoshapes', shapes, grids, interpol, result)

See also
--------

