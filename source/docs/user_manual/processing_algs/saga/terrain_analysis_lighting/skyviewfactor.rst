Sky view factor
===============

Description
-----------

<put algortithm description here>

Parameters
----------

``Elevation`` [raster]
  <put parameter description here>

``Maximum Search Radius`` [number]
  <put parameter description here>

  Default: *10000*

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] multi scale
  * 1 --- [1] sectors

  Default: *0*

``Multi Scale Factor`` [number]
  <put parameter description here>

  Default: *3*

``Number of Sectors`` [number]
  <put parameter description here>

  Default: *8*

Outputs
-------

``Visible Sky`` [raster]
  <put output description here>

``Sky View Factor`` [raster]
  <put output description here>

``Sky View Factor (Simplified)`` [raster]
  <put output description here>

``Terrain View Factor`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:skyviewfactor', dem, maxradius, method, level_inc, ndirs, visible, svf, simple, terrain)

See also
--------

