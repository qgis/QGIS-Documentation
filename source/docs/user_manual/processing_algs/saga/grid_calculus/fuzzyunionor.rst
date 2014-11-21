Fuzzy union (or)
================

Description
-----------

<put algortithm description here>

Parameters
----------

``Grids`` [multipleinput: rasters]
  <put parameter description here>

``Operator Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] max(a, b) (non-interactive)
  * 1 --- [1] a + b - a * b
  * 2 --- [2] min(1, a + b)

  Default: *0*

Outputs
-------

``Union`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:fuzzyunionor', grids, type, or)

See also
--------

