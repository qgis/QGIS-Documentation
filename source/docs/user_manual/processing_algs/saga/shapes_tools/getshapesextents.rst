Get shapes extents
==================

Description
-----------

Creates polygons according to the extent of the input layer features.

Parameters
----------

``Shapes`` [vector: any]
  Input layer.

``Parts`` [boolean]
  Determines whether create polygon for each feature (``True``) or just create
  single polygon for whole layer (``False``).

  Default: *True*

Outputs
-------

``Extents`` [vector]
  The resulting layer.

Console usage
-------------

::

  processing.runalg('saga:getshapesextents', shapes, parts, extents)

See also
--------

