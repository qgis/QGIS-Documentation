Topographic wetness index (twi)
===============================

Description
-----------

<put algortithm description here>

Parameters
----------

``Slope`` [raster]
  <put parameter description here>

``Catchment Area`` [raster]
  <put parameter description here>

``Transmissivity`` [raster]
  Optional.

  <put parameter description here>

``Area Conversion`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] no conversion (areas already given as specific catchment area)
  * 1 --- [1] 1 / cell size (pseudo specific catchment area)

  Default: *0*

``Method (TWI)`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Standard
  * 1 --- [1] TOPMODEL

  Default: *0*

Outputs
-------

``Topographic Wetness Index`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:topographicwetnessindextwi', slope, area, trans, conv, method, twi)

See also
--------

