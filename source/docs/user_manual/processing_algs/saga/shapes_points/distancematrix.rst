Distance matrix
===============

Description
-----------

Generates a distance matrix between each point of the input layer. A unique ID
will be created in the first row of the resulting matrix (symmetric matrix),
while every other cell reflects the distance between the points.

Parameters
----------

``Points`` [vector: point]
  Input layer.

Outputs
-------

``Distance Matrix Table`` [table]
  The resulting table.

Console usage
-------------

::

  processing.runalg('saga:distancematrix', points, table)

See also
--------

