D8 Contributing Area
====================

Description
-----------

<put algortithm description here>

Parameters
----------

``D8 Flow Direction Grid`` [raster]
  <put parameter description here>

``Outlets Shapefile`` [vector: point]
  Optional.

  <put parameter description here>

``Weight Grid`` [raster]
  Optional.

  <put parameter description here>

``Check for edge contamination`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
-------

``D8 Contributing Area Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('taudem:d8contributingarea', -p, -o, -wg, -nc, -ad8)

See also
--------

