Count unique points in polygon
==============================

Description
-----------

Counts the number of unique values of a points in a polygons layer. Creates
a new polygons layer with an extra column in the attribute table containing
the count of unique values for each feature.

Parameters
----------

``Polygons`` [vector: polygon]
  Polygons layer.

``Points`` [vector: point]
  Points layer.

``Class field`` [tablefield: any]
  Points layer column name of the unique value chosen.

``Count field name`` [string]
  Column name containing the count of unique values in the resulting polygons
  layer.

  Default: *NUMPOINTS*

Outputs
-------

``Result`` [vector]
  The resulting polygons layer.

Console usage
-------------

::

  processing.runalg('qgis:countuniquepointsinpolygon', polygons, points, classfield, field, output)

See also
--------

