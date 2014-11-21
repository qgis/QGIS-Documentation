Clip points with polygons
=========================

Description
-----------

<put algortithm description here>

Parameters
----------

``Points`` [vector: point]
  <put parameter description here>

``Polygons`` [vector: polygon]
  <put parameter description here>

``Add Attribute to Clipped Points`` [tablefield: any]
  <put parameter description here>

``Clipping Options`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] one layer for all points
  * 1 --- [1] separate layer for each polygon

  Default: *0*

Outputs
-------

``Clipped Points`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:clippointswithpolygons', points, polygons, field, method, clips)

See also
--------

