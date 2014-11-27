Count points in polygon
=======================

Description
-----------

Counts the number of points present in each feature of a polygon layer.

Parameters
----------

``Polygons`` [vector: polygon]
  Polygons layer.

``Points`` [vector: point]
  Points layer.

``Count field name`` [string]
  The name of the attribute table column containing the points number.

  Default: *NUMPOINTS*

Outputs
-------

``Result`` [vector]
  Resulting layer with the attribute table containing the new column of the
  points count.

Console usage
-------------

::

  processing.runalg('qgis:countpointsinpolygon', polygons, points, field, output)

See also
--------

