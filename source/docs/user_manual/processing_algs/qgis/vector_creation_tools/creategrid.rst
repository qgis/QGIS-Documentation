Create grid
===========

Description
-----------

Creates a grid.

Parameters
----------

``Grid type`` [selection]
  Grid type.

  Options:

  * 0 --- Rectangle (line)
  * 1 --- Rectangle (polygon)
  * 2 --- Diamond (polygon)
  * 3 --- Hexagon (polygon)

  Default: *0*

``Width`` [number]
  Horizontal extent of the grid.

  Default: *360.0*

``Height`` [number]
  Vertical extent of the grid.

  Default: *180.0*

``Horizontal spacing`` [number]
  X-axes spacing between the lines.

  Default: *10.0*

``Vertical spacing`` [number]
  Y-axes spacing between the lines.

  Default: *10.0*

``Center X`` [number]
  X-coordinate of the grid center.

  Default: *0.0*

``Center Y`` [number]
  Y-coordinate of the grid center.

  Default: *0.0*

``Output CRS`` [crs]
  Coordinate reference system for grid.

  Default: *EPSG:4326*

Outputs
-------

``Output`` [vector]
  The resulting grid layer (lines or polygons).

Console usage
-------------

::

  processing.runalg('qgis:creategrid', type, width, height, hspacing, vspacing, centerx, centery, crs, output)

See also
--------

