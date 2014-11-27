Polygon shape indices
=====================

Description
-----------

Calculates spatial statistics for polygons. This includes:

* area
* perimeter
* perimeter / area
* perimeter / square root of the area
* maximum distance
* maximum distance / area
* maximum distance / square root of the area
* shape index

Parameters
----------

``Shapes`` [vector: polygon]
  Layer to analyze.

Outputs
-------

``Shape Index`` [vector]
  The resulting layer.

Console usage
-------------

::

  processing.runalg('saga:polygonshapeindices', shapes, index)

See also
--------

