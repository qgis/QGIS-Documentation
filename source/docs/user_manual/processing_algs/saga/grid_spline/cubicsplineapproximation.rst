Cubic spline approximation
==========================

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

``Minimal Number of Points`` [number]
  <put parameter description here>

  Default: *3*

``Maximal Number of Points`` [number]
  <put parameter description here>

  Default: *20*

``Points per Square`` [number]
  <put parameter description here>

  Default: *5*

``Tolerance`` [number]
  <put parameter description here>

  Default: *140.0*

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

  processing.runalg('saga:cubicsplineapproximation', shapes, field, target, npmin, npmax, nppc, k, output_extent, user_size, user_grid)

See also
--------

