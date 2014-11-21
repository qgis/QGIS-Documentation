Concave hull
============

Description
-----------

<put algortithm description here>

Parameters
----------

``Input point layer`` [vector: point]
  <put parameter description here>

``Threshold (0-1, where 1 is equivalent with Convex Hull)`` [number]
  <put parameter description here>

  Default: *0.3*

``Allow holes`` [boolean]
  <put parameter description here>

  Default: *True*

``Split multipart geometry into singleparts geometries`` [boolean]
  <put parameter description here>

  Default: *False*

Outputs
-------

``Concave hull`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('qgis:concavehull', input, alpha, holes, no_multigeometry, output)

See also
--------

