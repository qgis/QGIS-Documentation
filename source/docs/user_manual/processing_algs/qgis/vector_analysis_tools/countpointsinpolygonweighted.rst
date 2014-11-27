Count points in polygon (weighted)
==================================

Description
-----------

Counts the number of points in each feature of a polygon layer and calculates
the mean of the selected field for each feature of the polygon layer. These
values will be added to the attribute table of the resulting polygon layer.

Parameters
----------

``Polygons`` [vector: polygon]
  Polygons layer.

``Points`` [vector: point]
  Points layer.

``Weight field`` [tablefield: any]
  Weight field of the points attribute table.

``Count field name`` [string]
  Name of the column for the new weighted field.

  Default: *NUMPOINTS*

Outputs
-------

``Result`` [vector]
  The resulting polygons layer.

Console usage
-------------

::

  processing.runalg('qgis:countpointsinpolygonweighted', polygons, points, weight, field, output)

See also
--------

