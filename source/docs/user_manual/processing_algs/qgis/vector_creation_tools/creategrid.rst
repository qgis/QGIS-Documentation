Create grid
===========

Description
-----------

<put algortithm description here>

Parameters
----------

``Grid type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Rectangle (line)
  * 1 --- Rectangle (polygon)
  * 2 --- Diamond (polygon)
  * 3 --- Hexagon (polygon)

  Default: *0*

``Width`` [number]
  <put parameter description here>

  Default: *360.0*

``Height`` [number]
  <put parameter description here>

  Default: *180.0*

``Horizontal spacing`` [number]
  <put parameter description here>

  Default: *10.0*

``Vertical spacing`` [number]
  <put parameter description here>

  Default: *10.0*

``Center X`` [number]
  <put parameter description here>

  Default: *0.0*

``Center Y`` [number]
  <put parameter description here>

  Default: *0.0*

``Output CRS`` [crs]
  <put parameter description here>

  Default: *EPSG:4326*

Outputs
-------

``Output`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('qgis:creategrid', type, width, height, hspacing, vspacing, centerx, centery, crs, output)

See also
--------

