Upslope Area
============

Description
-----------

<put algortithm description here>

Parameters
----------

``Target Area`` [raster]
  Optional.

  <put parameter description here>

``Target X coordinate`` [number]
  <put parameter description here>

  Default: *0.0*

``Target Y coordinate`` [number]
  <put parameter description here>

  Default: *0.0*

``Elevation`` [raster]
  <put parameter description here>

``Sink Routes`` [raster]
  Optional.

  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Deterministic 8
  * 1 --- [1] Deterministic Infinity
  * 2 --- [2] Multiple Flow Direction

  Default: *0*

``Convergence`` [number]
  <put parameter description here>

  Default: *1.1*

Outputs
-------

``Upslope Area`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:upslopearea', target, target_pt_x, target_pt_y, elevation, sinkroute, method, converge, area)

See also
--------

