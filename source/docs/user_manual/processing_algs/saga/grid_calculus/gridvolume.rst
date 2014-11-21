Grid volume
===========

Description
-----------

<put algortithm description here>

Parameters
----------

``Grid`` [raster]
  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Count Only Above Base Level
  * 1 --- [1] Count Only Below Base Level
  * 2 --- [2] Subtract Volumes Below Base Level
  * 3 --- [3] Add Volumes Below Base Level

  Default: *0*

``Base Level`` [number]
  <put parameter description here>

  Default: *0.0*

Outputs
-------

Console usage
-------------

::

  processing.runalg('saga:gridvolume', grid, method, level)

See also
--------

