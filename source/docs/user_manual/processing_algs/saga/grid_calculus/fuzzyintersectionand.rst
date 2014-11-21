Fuzzy intersection (and)
========================

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

  * 0 --- [0] min(a, b) (non-interactive)
  * 1 --- [1] a * b
  * 2 --- [2] max(0, a + b - 1)

  Default: *0*

Outputs
-------

``Intersection`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:fuzzyintersectionand', grids, type, and)

See also
--------

