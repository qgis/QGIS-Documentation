Polygon dissolve
================

Description
-----------

<put algortithm description here>

Parameters
----------

``Polygons`` [vector: polygon]
  <put parameter description here>

``1. Attribute`` [tablefield: any]
  Optional.

  <put parameter description here>

``2. Attribute`` [tablefield: any]
  Optional.

  <put parameter description here>

``3. Attribute`` [tablefield: any]
  Optional.

  <put parameter description here>

``Dissolve...`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] polygons with same attribute value
  * 1 --- [1] all polygons
  * 2 --- [2] polygons with same attribute value (keep inner boundaries)
  * 3 --- [3] all polygons (keep inner boundaries)

  Default: *0*

Outputs
-------

``Dissolved Polygons`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:polygondissolve', polygons, field_1, field_2, field_3, dissolve, dissolved)

See also
--------

