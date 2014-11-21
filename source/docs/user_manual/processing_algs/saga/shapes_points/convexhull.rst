Convex hull
===========

Description
-----------

<put algortithm description here>

Parameters
----------

``Points`` [vector: point]
  <put parameter description here>

``Hull Construction`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] one hull for all shapes
  * 1 --- [1] one hull per shape
  * 2 --- [2] one hull per shape part

  Default: *0*

Outputs
-------

``Convex Hull`` [vector]
  <put output description here>

``Minimum Bounding Box`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:convexhull', shapes, polypoints, hulls, boxes)

See also
--------

