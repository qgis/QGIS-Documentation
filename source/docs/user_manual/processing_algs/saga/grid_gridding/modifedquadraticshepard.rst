Modifed quadratic shepard
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

``Quadratic Neighbors`` [number]
  <put parameter description here>

  Default: *13*

``Weighting Neighbors`` [number]
  <put parameter description here>

  Default: *19*

``Left`` [number]
  <put parameter description here>

  Default: *0.0*

``Right`` [number]
  <put parameter description here>

  Default: *0.0*

``Bottom`` [number]
  <put parameter description here>

  Default: *0.0*

``Top`` [number]
  <put parameter description here>

  Default: *0.0*

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

  processing.runalg('saga:modifedquadraticshepard', shapes, field, target, quadratic_neighbors, weighting_neighbors, user_xmin, user_xmax, user_ymin, user_ymax, user_size, user_grid)

See also
--------

