Grid orientation
================

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

  * 0 --- [0] Copy
  * 1 --- [1] Flip
  * 2 --- [2] Mirror
  * 3 --- [3] Invert

  Default: *0*

Outputs
-------

``Changed Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:gridorientation', input, method, result)

See also
--------

