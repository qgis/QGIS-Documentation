Polynomial regression
=====================

Description
-----------

<put algortithm description here>

Parameters
----------

``Points`` [vector: any]
  <put parameter description here>

``Attribute`` [tablefield: any]
  <put parameter description here>

``Polynom`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] simple planar surface
  * 1 --- [1] bi-linear saddle
  * 2 --- [2] quadratic surface
  * 3 --- [3] cubic surface
  * 4 --- [4] user defined

  Default: *0*

``Maximum X Order`` [number]
  <put parameter description here>

  Default: *4*

``Maximum Y Order`` [number]
  <put parameter description here>

  Default: *4*

``Maximum Total Order`` [number]
  <put parameter description here>

  Default: *4*

``Trend Surface`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] user defined

  Default: *0*

``Output extent`` [extent]
  <put parameter description here>

  Default: *0,1,0,1*

``Cellsize`` [number]
  <put parameter description here>

  Default: *100.0*

Outputs
-------

``Residuals`` [vector]
  <put output description here>

``Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:polynomialregression', points, attribute, polynom, xorder, yorder, torder, target, output_extent, user_size, residuals, user_grid)

See also
--------

