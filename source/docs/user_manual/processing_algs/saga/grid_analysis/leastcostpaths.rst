Least cost paths
================

Description
-----------

<put algortithm description here>

Parameters
----------

``Source Point(s)`` [vector: point]
  <put parameter description here>

``Accumulated cost`` [raster]
  <put parameter description here>

``Values`` [multipleinput: rasters]
  Optional.

  <put parameter description here>

Outputs
-------

``Profile (points)`` [vector]
  <put output description here>

``Profile (lines)`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:leastcostpaths', source, dem, values, points, line)

See also
--------

