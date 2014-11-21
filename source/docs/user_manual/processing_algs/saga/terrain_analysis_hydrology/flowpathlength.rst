Flow path length
================

Description
-----------

<put algortithm description here>

Parameters
----------

``Elevation`` [raster]
  <put parameter description here>

``Seeds`` [raster]
  Optional.

  <put parameter description here>

``Seeds Only`` [boolean]
  <put parameter description here>

  Default: *True*

``Flow Routing Algorithm`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Deterministic 8 (D8)
  * 1 --- [1] Multiple Flow Direction (FD8)

  Default: *0*

``Convergence (FD8)`` [number]
  <put parameter description here>

  Default: *1.1*

Outputs
-------

``Flow Path Length`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:flowpathlength', elevation, seed, seeds_only, method, convergence, length)

See also
--------

