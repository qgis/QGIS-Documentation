Add grid values to points
=========================

Description
-----------

Creates a new vector layer as a result of the union of a points layer with the
interpolated value of one or more base background grid layer(s). This way, the
new layer created will have a new column in the attribute table that reflects
the interpolated value of the background grid.

Parameters
----------

``Points`` [vector: point]
  Input layer.

``Grids`` [multipleinput: rasters]
  Background grid layer(s)

``Interpolation`` [selection]
  interpolation method to use.

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
  The resulting layer.

Console usage
-------------

::

  processing.runalg('saga:addgridvaluestopoints', shapes, grids, interpol, result)

See also
--------

