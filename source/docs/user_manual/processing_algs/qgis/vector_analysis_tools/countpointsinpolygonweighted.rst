Count points in polygon(weighted)
=================================

Description
-----------

<put algortithm description here>

Parameters
----------

``Polygons`` [vector: polygon]
  <put parameter description here>

``Points`` [vector: point]
  <put parameter description here>

``Weight field`` [tablefield: any]
  <put parameter description here>

``Count field name`` [string]
  <put parameter description here>

  Default: *NUMPOINTS*

Outputs
-------

``Result`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('qgis:countpointsinpolygonweighted', polygons, points, weight, field, output)

See also
--------

