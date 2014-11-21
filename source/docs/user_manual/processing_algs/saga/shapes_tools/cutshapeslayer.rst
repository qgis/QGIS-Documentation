Cut shapes layer
================

Description
-----------

<put algortithm description here>

Parameters
----------

``Vector layer to cut`` [vector: any]
  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] completely contained
  * 1 --- [1] intersects
  * 2 --- [2] center

  Default: *0*

``Cutting polygons`` [vector: any]
  <put parameter description here>

Outputs
-------

``Result`` [vector]
  <put output description here>

``Extent`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:cutshapeslayer', shapes, method, polygons_polygons, cut, extent)

See also
--------

