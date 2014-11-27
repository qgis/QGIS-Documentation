Create graticule
================

Description
-----------

Creates a grid.

Parameters
----------

``Extent`` [vector: any]
  Optional.

  Grid will be created according to the selected layer.

``Output extent`` [extent]
  Extent of the grid.

  Default: *0,1,0,1*

``Division Width`` [number]
  X-axes spacing between the lines.

  Default: *1.0*

``Division Height`` [number]
  Y-axes spacing between the lines.

  Default: *1.0*

``Type`` [selection]
  Geometry type of the resulting grid.

  Options:

  * 0 --- [0] Lines
  * 1 --- [1] Rectangles

  Default: *0*

Outputs
-------

``Graticule`` [vector]
  The resulting layer.

Console usage
-------------

::

  processing.runalg('saga:creategraticule', extent, output_extent, distx, disty, type, graticule)

See also
--------

