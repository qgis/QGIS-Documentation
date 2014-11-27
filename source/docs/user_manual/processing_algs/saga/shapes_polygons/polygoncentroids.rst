Polygon centroids
=================

Description
-----------

Calculates the centroids of polygons.

Parameters
----------

``Polygons`` [vector: polygon]
  Input layer.

``Centroids for each part`` [boolean]
  Determites whether centroids should be calculated for each part of multipart
  polygon or not.

  Default: *True*

Outputs
-------

``Centroids`` [vector]
  The resulting layer.

Console usage
-------------

::

  processing.runalg('saga:polygoncentroids', polygons, method, centroids)

See also
--------

