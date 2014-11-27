Add polygon attributes to points
================================

Description
-----------

Adds the specified field of the polygons layer to the attribute table of the
points layer. The new attributes added for each point depend on the value of
the background polygon layer.

Parameters
----------

``Points`` [vector: point]
  Points layer.

``Polygons`` [vector: polygon]
  Background polygons layer.

``Attribute`` [tablefield: any]
  Attribute of the polygons layer that will be added to the points layer.

Outputs
-------

``Result`` [vector]
  The resulting layer.

Console usage
-------------

::

  processing.runalg('saga:addpolygonattributestopoints', input, polygons, field, output)

See also
--------

