Move Outlets To Streams
=======================

Description
-----------

<put algortithm description here>

Parameters
----------

``D8 Flow Direction Grid`` [raster]
  <put parameter description here>

``Stream Raster Grid`` [raster]
  <put parameter description here>

``Outlets Shapefile`` [vector: point]
  <put parameter description here>

``Maximum Number of Grid Cells to traverse`` [number]
  <put parameter description here>

  Default: *50*

Outputs
-------

``Output Outlet Shapefile`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('taudem:moveoutletstostreams', -p, -src, -o, -md, -om)

See also
--------

