Channel network and drainage basins
===================================

Description
-----------

<put algortithm description here>

Parameters
----------

``Elevation`` [raster]
  <put parameter description here>

``Threshold`` [number]
  <put parameter description here>

  Default: *5.0*

Outputs
-------

``Flow Direction`` [raster]
  <put output description here>

``Flow Connectivity`` [raster]
  <put output description here>

``Strahler Order`` [raster]
  <put output description here>

``Drainage Basins`` [raster]
  <put output description here>

``Channels`` [vector]
  <put output description here>

``Drainage Basins`` [vector]
  <put output description here>

``Junctions`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:channelnetworkanddrainagebasins', dem, threshold, direction, connection, order, basin, segments, basins, nodes)

See also
--------

