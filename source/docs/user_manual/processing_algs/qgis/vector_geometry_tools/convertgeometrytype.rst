Convert geometry type
=====================

Description
-----------

Converts a geometry type to another one.

Parameters
----------

``Input layer`` [vector: any]
  Layer in input.

``New geometry type`` [selection]
  Type of conversion to perform.

  Options:

  * 0 --- Centroids
  * 1 --- Nodes
  * 2 --- Linestrings
  * 3 --- Multilinestrings
  * 4 --- Polygons

  Default: *0*

Outputs
-------

``Output`` [vector]
  The resulting layer.

Console usage
-------------

::

  processing.runalg('qgis:convertgeometrytype', input, type, output)

See also
--------

