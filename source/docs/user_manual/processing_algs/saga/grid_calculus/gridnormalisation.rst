Grid normalisation
==================

Description
-----------

Normalises the grid values according to minimum and maximum values chosen.

Parameters
----------

``Grid`` [raster]
  Grid to normalize.

``Target Range (min)`` [number]
  Minimum value.

  Default: *0*

``Target Range (max)`` [number]
  Maximum value.

  Default: *1*

Outputs
-------

``Normalised Grid`` [raster]
  The resulting layer.

Console usage
-------------

::

  processing.runalg('saga:gridnormalisation', input, range_min, range_max, output)

See also
--------

