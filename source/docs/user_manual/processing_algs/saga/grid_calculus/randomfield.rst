Random field
============

Description
-----------

Generates a random grid layer.

Parameters
----------

``Width (Cells)`` [number]
  Width of the layer in cells.

  Default: *100*

``Height (Cells)`` [number]
  Height of the layer in cells.

  Default: *100*

``Cellsize`` [number]
  Cell size to use.

  Default: *100.0*

``West`` [number]
  West coordinate of the bottom-left corner of the grid.

  Default: *0.0*

``South`` [number]
  South coordinate of the bottom-left corner of the grid.

  Default: *0.0*

``Method`` [selection]
  Statistical method used for the calculation.

  Options:

  * 0 --- [0] Uniform
  * 1 --- [1] Gaussian

  Default: *0*

``Range Min`` [number]
  Minimum cell value to use.

  Default: *0.0*

``Range Max`` [number]
  Maximum cell value to use.

  Default: *1.0*

``Arithmetic Mean`` [number]
  Mean of all the cell values to use.

  Default: *0.0*

``Standard Deviation`` [number]
  Standard deviation of all the cell values to use.

  Default: *1.0*

Outputs
-------

``Random Field`` [raster]
  The resulting layer.

Console usage
-------------

::

  processing.runalg('saga:randomfield', nx, ny, cellsize, xmin, ymin, method, range_min, range_max, mean, stddev, output)

See also
--------

