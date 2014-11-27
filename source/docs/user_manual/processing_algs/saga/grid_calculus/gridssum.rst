Grids sum
=========

Description
-----------

Creates a new grid layer as the result of the sum of two or more grid layers.

Parameters
----------

``Grids`` [multipleinput: rasters]
  Grid layers to sum

Outputs
-------

``Sum`` [raster]
  The resulting layer.

Console usage
-------------

::

  processing.runalg('saga:gridssum', grids, result)

See also
--------

