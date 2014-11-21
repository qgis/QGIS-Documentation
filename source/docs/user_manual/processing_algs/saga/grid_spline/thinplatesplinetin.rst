Thin plate spline (tin)
=======================

Description
-----------

<put algortithm description here>

Parameters
----------

``Points`` [vector: point]
  <put parameter description here>

``Attribute`` [tablefield: any]
  <put parameter description here>

``Target Grid`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] user defined

  Default: *0*

``Regularisation`` [number]
  <put parameter description here>

  Default: *0.0*

``Neighbourhood`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] immediate
  * 1 --- [1] level 1
  * 2 --- [2] level 2

  Default: *0*

``Add Frame`` [boolean]
  <put parameter description here>

  Default: *True*

``Output extent`` [extent]
  <put parameter description here>

  Default: *0,1,0,1*

``Cellsize`` [number]
  <put parameter description here>

  Default: *100.0*

Outputs
-------

``Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:thinplatesplinetin', shapes, field, target, regul, level, frame, output_extent, user_size, user_grid)

See also
--------

