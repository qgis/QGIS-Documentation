Grid difference
===============

Description
-----------

Creates a new grid layer as the result of the difference between two other grid
layers.

Parameters
----------

``A`` [raster]
  First layer.

``B`` [raster]
  Second layer.

Outputs
-------

``Difference (A - B)`` [raster]
  The resulting layer.

Console usage
-------------

::

  processing.runalg('saga:griddifference', a, b, c)

See also
--------

