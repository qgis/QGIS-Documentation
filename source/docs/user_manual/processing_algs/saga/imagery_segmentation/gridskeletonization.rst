Grid skeletonization
====================

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

  * 0 --- [0] Standard
  * 1 --- [1] Hilditch's Algorithm
  * 2 --- [2] Channel Skeleton

  Default: *0*

``Initialisation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Less than
  * 1 --- [1] Greater than

  Default: *0*

``Threshold (Init.)`` [number]
  <put parameter description here>

  Default: *0.0*

``Convergence`` [number]
  <put parameter description here>

  Default: *3.0*

Outputs
-------

``Skeleton`` [raster]
  <put output description here>

``Skeleton`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:gridskeletonization', input, method, init_method, init_threshold, convergence, result, vector)

See also
--------

