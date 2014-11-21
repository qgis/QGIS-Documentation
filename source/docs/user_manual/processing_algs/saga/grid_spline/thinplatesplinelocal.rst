Thin plate spline (local)
=========================

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

  Default: *0.0001*

``Search Radius`` [number]
  <put parameter description here>

  Default: *100.0*

``Search Mode`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] all directions
  * 1 --- [1] quadrants

  Default: *0*

``Points Selection`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] all points in search radius
  * 1 --- [1] maximum number of points

  Default: *0*

``Maximum Number of Points`` [number]
  <put parameter description here>

  Default: *10*

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

  processing.runalg('saga:thinplatesplinelocal', shapes, field, target, regul, radius, mode, select, maxpoints, output_extent, user_size, user_grid)

See also
--------

