Add coordinates to points
=========================

Description
-----------

Adds the X and Y coordinates of feature in the attribute table of input layer.

Parameters
----------

``Points`` [vector: point]
  Input layer.

Outputs
-------

``Output`` [vector]
  Resulting layer with the updated attribute table.

Console usage
-------------

::

  processing.runalg('saga:addcoordinatestopoints', input, output)

See also
--------

