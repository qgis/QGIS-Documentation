Mean coordinate(s)
==================

Description
-----------

Calculates the mean of the coordinates of a layer starting from a field of the
attribute table.

Parameters
----------

``Input layer`` [vector: any]
  <put parameter description here>

``Weight field`` [tablefield: numeric]
  Optional.

  Field to use if you want to perform a weighted mean.

``Unique ID field`` [tablefield: numeric]
  Optional.

  Unique field on which the calculation of the mean will be made.

Outputs
-------

``Result`` [vector]
  The resulting points layer.

Console usage
-------------

::

  processing.runalg('qgis:meancoordinates', points, weight, uid, output)

See also
--------

