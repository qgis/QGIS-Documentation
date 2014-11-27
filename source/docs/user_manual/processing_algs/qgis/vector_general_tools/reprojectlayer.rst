Reproject layer
===============

Description
-----------

Reprojects a vector layer in a different CRS.

Parameters
----------

``Input layer`` [vector: any]
  Layer to reproject.

``Target CRS`` [crs]
  Destination coordinate reference system.

  Default: *EPSG:4326*

Outputs
-------

``Reprojected layer`` [vector]
  The resulting layer.

Console usage
-------------

::

  processing.runalg('qgis:reprojectlayer', input, target_crs, output)

See also
--------

