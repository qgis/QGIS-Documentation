Catchment area (recursive)
==========================

Description
-----------

<put algortithm description here>

Parameters
----------

``Elevation`` [raster]
  <put parameter description here>

``Sink Routes`` [raster]
  Optional.

  <put parameter description here>

``Weight`` [raster]
  Optional.

  <put parameter description here>

``Material`` [raster]
  Optional.

  <put parameter description here>

``Target`` [raster]
  Optional.

  <put parameter description here>

``Step`` [number]
  <put parameter description here>

  Default: *1*

``Target Areas`` [raster]
  Optional.

  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Deterministic 8
  * 1 --- [1] Rho 8
  * 2 --- [2] Deterministic Infinity
  * 3 --- [3] Multiple Flow Direction

  Default: *0*

``Convergence`` [number]
  <put parameter description here>

  Default: *1.1*

Outputs
-------

``Catchment Area`` [raster]
  <put output description here>

``Catchment Height`` [raster]
  <put output description here>

``Catchment Slope`` [raster]
  <put output description here>

``Total accumulated Material`` [raster]
  <put output description here>

``Accumulated Material from _left_ side`` [raster]
  <put output description here>

``Accumulated Material from _right_ side`` [raster]
  <put output description here>

``Flow Path Length`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:catchmentarearecursive', elevation, sinkroute, weight, material, target, step, targets, method, convergence, carea, cheight, cslope, accu_tot, accu_left, accu_right, flowlen)

See also
--------

