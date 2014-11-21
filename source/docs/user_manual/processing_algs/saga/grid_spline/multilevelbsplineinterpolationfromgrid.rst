Multilevel b-spline interpolation (from grid)
=============================================

Description
-----------

<put algortithm description here>

Parameters
----------

``Grid`` [raster]
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

``Data Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] same as input grid
  * 1 --- [1] floating point

  Default: *0*

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

  processing.runalg('saga:multilevelbsplineinterpolationfromgrid', gridpoints, target, method, epsilon, level_max, datatype, output_extent, user_size, user_grid)

See also
--------

