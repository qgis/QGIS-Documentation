Surface specific points
=======================

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

  * 0 --- [0] Mark Highest Neighbour
  * 1 --- [1] Opposite Neighbours
  * 2 --- [2] Flow Direction
  * 3 --- [3] Flow Direction (up and down)
  * 4 --- [4] Peucker & Douglas

  Default: *0*

``Threshold`` [number]
  <put parameter description here>

  Default: *2.0*

Outputs
-------

``Result`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:surfacespecificpoints', elevation, method, threshold, result)

See also
--------

