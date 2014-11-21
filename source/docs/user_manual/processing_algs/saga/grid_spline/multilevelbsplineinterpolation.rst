Multilevel b-spline interpolation
=================================

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

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] without B-spline refinement
  * 1 --- [1] with B-spline refinement

  Default: *0*

``Threshold Error`` [number]
  <put parameter description here>

  Default: *0.0001*

``Maximum Level`` [number]
  <put parameter description here>

  Default: *11.0*

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

  processing.runalg('saga:multilevelbsplineinterpolation', shapes, field, target, method, epsilon, level_max, output_extent, user_size, user_grid)

See also
--------

