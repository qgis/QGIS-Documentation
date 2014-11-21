Line-polygon intersection
=========================

Description
-----------

<put algortithm description here>

Parameters
----------

``Lines`` [vector: line]
  <put parameter description here>

``Polygons`` [vector: polygon]
  <put parameter description here>

``Output`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] one multi-line per polygon
  * 1 --- [1] keep original line attributes

  Default: *0*

Outputs
-------

``Intersection`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:linepolygonintersection', lines, polygons, method, intersect)

See also
--------

