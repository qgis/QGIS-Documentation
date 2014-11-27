Grid division
=============

Description
-----------

Creates a new grid layer as the result of the division between two other grid
layers.

Parameters
----------

``Dividend`` [raster]
  First layer.

``Divisor`` [raster]
  Second layer.

Outputs
-------

``Quotient`` [raster]
  The resulting layer.

Console usage
-------------

::

  processing.runalg('saga:griddivision', a, b, c)

See also
--------

