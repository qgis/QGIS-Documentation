Grid values to points
=====================

Description
-----------

<put algortithm description here>

Parameters
----------

``Grids`` [multipleinput: rasters]
  <put parameter description here>

``Polygons`` [vector: any]
  Optional.

  <put parameter description here>

``Exclude NoData Cells`` [boolean]
  <put parameter description here>

  Default: *True*

``Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] nodes
  * 1 --- [1] cells

  Default: *0*

Outputs
-------

``Shapes`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:gridvaluestopoints', grids, polygons, nodata, type, shapes)

See also
--------

