Convex hull
===========

Description
-----------

<put algortithm description here>

Parameters
----------

``Input layer`` [vector: any]
  <put parameter description here>

``Field (optional, only used if creating convex hulls by classes)`` [tablefield: any]
  Optional.

  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Create single minimum convex hull
  * 1 --- Create convex hulls based on field

  Default: *0*

Outputs
-------

``Convex hull`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('qgis:convexhull', input, field, method, output)

See also
--------

