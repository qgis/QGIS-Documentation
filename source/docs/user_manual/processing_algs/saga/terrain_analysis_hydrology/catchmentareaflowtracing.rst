Catchment area (flow tracing)
=============================

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

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Rho 8
  * 1 --- [1] Kinematic Routing Algorithm
  * 2 --- [2] DEMON

  Default: *0*

``DEMON - Min. DQV`` [number]
  <put parameter description here>

  Default: *0.0*

``Flow Correction`` [boolean]
  <put parameter description here>

  Default: *True*

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

Console usage
-------------

::

  processing.runalg('saga:catchmentareaflowtracing', elevation, sinkroute, weight, material, target, step, method, mindqv, correct, carea, cheight, cslope, accu_tot, accu_left, accu_right)

See also
--------

