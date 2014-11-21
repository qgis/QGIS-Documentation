Kernel density estimation
=========================

Description
-----------

<put algortithm description here>

Parameters
----------

``Points`` [vector: point]
  <put parameter description here>

``Weight`` [tablefield: any]
  <put parameter description here>

``Radius`` [number]
  <put parameter description here>

  Default: *10*

``Kernel`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] quartic kernel
  * 1 --- [1] gaussian kernel

  Default: *0*

``Target Grid`` [selection]
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

``Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:kerneldensityestimation', points, population, radius, kernel, target, output_extent, user_size, user_grid)

See also
--------

