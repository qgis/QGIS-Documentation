Points layer from table
=======================

Description
-----------

Creates points layer from geometryless table with columns that contain point
coordinates.

Parameters
----------

``Input layer`` [table]
  Input table

``X field`` [tablefield: any]
  Table column containing the X coordinate.

``Y field`` [tablefield: any]
  Table column containing the Y coordinate.

``Target CRS`` [crs]
  Coordinate reference system to use for layer.

  Default: *EPSG:4326*

Outputs
-------

``Output layer`` [vector]
  The resulting layer.

Console usage
-------------

::

  processing.runalg('qgis:pointslayerfromtable', input, xfield, yfield, target_crs, output)

See also
--------

