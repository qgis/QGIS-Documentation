Grid standardisation
====================

Description
-----------

Standardises the grid layer values.

Parameters
----------

``Grid`` [raster]
  Grid to process.

``Stretch Factor`` [number]
  stretching factor.

  Default: *1.0*

Outputs
-------

``Standardised Grid`` [raster]
  The resulting layer.

Console usage
-------------

::

  processing.runalg('saga:gridstandardisation', input, stretch, output)

See also
--------

