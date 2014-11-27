Geometric figures
=================

Description
-----------

Draws simple geometric figures.

Parameters
----------

``Cell Count`` [number]
  Number of cells to use.

  Default: *0*

``Cell Size`` [number]
  Size of the single cell.

  Default: *0*

``Figure`` [selection]
  Type of the figure.

  Options:

  * 0 --- [0] Cone (up)
  * 1 --- [1] Cone (down)
  * 2 --- [2] Plane

  Default: *0*

``Direction of Plane [Degree]`` [number]
  Rotation factor in degrees.

  Default: *0*

Outputs
-------

``Result`` [raster]
  The resulting layer.

Console usage
-------------

::

  processing.runalg('saga:geometricfigures', cell_count, cell_size, figure, plane, result)

See also
--------

