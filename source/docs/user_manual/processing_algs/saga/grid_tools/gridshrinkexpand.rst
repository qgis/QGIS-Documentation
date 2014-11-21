Grid shrink/expand
==================

Description
-----------

<put algortithm description here>

Parameters
----------

``Grid`` [raster]
  <put parameter description here>

``Operation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Shrink
  * 1 --- [1] Expand

  Default: *0*

``Search Mode`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Square
  * 1 --- [1] Circle

  Default: *0*

``Radius`` [number]
  <put parameter description here>

  Default: *1*

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] min
  * 1 --- [1] max
  * 2 --- [2] mean
  * 3 --- [3] majority

  Default: *0*

Outputs
-------

``Result Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:gridshrinkexpand', input, operation, mode, radius, method_expand, result)

See also
--------

