Stream power index
==================

Description
-----------

<put algortithm description here>

Parameters
----------

``Slope`` [raster]
  <put parameter description here>

``Catchment Area`` [raster]
  <put parameter description here>

``Area Conversion`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] no conversion (areas already given as specific catchment area)
  * 1 --- [1] 1 / cell size (pseudo specific catchment area)

  Default: *0*

Outputs
-------

``Stream Power Index`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:streampowerindex', slope, area, conv, spi)

See also
--------

