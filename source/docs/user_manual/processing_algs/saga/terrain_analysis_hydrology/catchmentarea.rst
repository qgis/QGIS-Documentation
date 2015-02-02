Catchment Area
==============

Description
-----------

<put algortithm description here>

Parameters
----------

``Elevation`` [raster]
  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Deterministic 8
  * 1 --- [1] Rho 8
  * 2 --- [2] Braunschweiger Reliefmodell
  * 3 --- [3] Deterministic Infinity
  * 4 --- [4] Multiple Flow Direction
  * 5 --- [5] Multiple Triangular Flow Direction

  Default: *0*

Outputs
-------

``Catchment Area`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:catchmentarea', elevation, method, carea)

See also
--------

