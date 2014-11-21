Cell balance
============

Description
-----------

<put algortithm description here>

Parameters
----------

``Elevation`` [raster]
  <put parameter description here>

``Parameter`` [raster]
  Optional.

  <put parameter description here>

``Default Weight`` [number]
  <put parameter description here>

  Default: *1.0*

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Deterministic 8
  * 1 --- [1] Multiple Flow Direction

  Default: *0*

Outputs
-------

``Cell Balance`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:cellbalance', dem, weights, weight, method, balance)

See also
--------

