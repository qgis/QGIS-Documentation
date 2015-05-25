|updatedisclaimer|

Terrain channels
================

Channel network and drainage basins
-----------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Threshold`` [number]
  <put parameter description here>

  Default: *5.0*

Outputs
.......

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
.............

::

  processing.runalg('saga:channelnetworkanddrainagebasins', dem, threshold, direction, connection, order, basin, segments, basins, nodes)

See also
........

Channel network
---------------

Description
...........

<put algorithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Flow Direction`` [raster]
  Optional.

  <put parameter description here>

``Initiation Grid`` [raster]
  <put parameter description here>

``Initiation Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Less than
  * 1 --- [1] Equals
  * 2 --- [2] Greater than

  Default: *0*

``Initiation Threshold`` [number]
  <put parameter description here>

  Default: *0.0*

``Divergence`` [raster]
  Optional.

  <put parameter description here>

``Tracing: Max. Divergence`` [number]
  <put parameter description here>

  Default: *10*

``Tracing: Weight`` [raster]
  Optional.

  <put parameter description here>

``Min. Segment Length`` [number]
  <put parameter description here>

  Default: *10*

Outputs
.......

``Channel Network`` [raster]
  <put output description here>

``Channel Direction`` [raster]
  <put output description here>

``Channel Network`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:channelnetwork', elevation, sinkroute, init_grid, init_method, init_value, div_grid, div_cells, trace_weight, minlen, chnlntwrk, chnlroute, shapes)

See also
........

Overland flow distance to channel network
-----------------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Channel Network`` [raster]
  <put parameter description here>

``Flow Algorithm`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] D8
  * 1 --- [1] MFD

  Default: *0*

Outputs
.......

``Overland Flow Distance`` [raster]
  <put output description here>

``Vertical Overland Flow Distance`` [raster]
  <put output description here>

``Horizontal Overland Flow Distance`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:overlandflowdistancetochannelnetwork', elevation, channels, method, distance, distvert, disthorz)

See also
........

Strahler order
--------------

Description
...........

<put algorithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

Outputs
.......

``Strahler Order`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:strahlerorder', dem, strahler)

See also
........

Vertical distance to channel network
------------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Channel Network`` [raster]
  <put parameter description here>

``Tension Threshold [Percentage of Cell Size]`` [number]
  <put parameter description here>

  Default: *1*

``Keep Base Level below Surface`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
.......

``Vertical Distance to Channel Network`` [raster]
  <put output description here>

``Channel Network Base Level`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:verticaldistancetochannelnetwork', elevation, channels, threshold, nounderground, distance, baselevel)

See also
........

Watershed basins
----------------

Description
...........

<put algorithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Channel Network`` [raster]
  <put parameter description here>

``Sink Route`` [raster]
  Optional.

  <put parameter description here>

``Min. Size`` [number]
  <put parameter description here>

  Default: *0*

Outputs
.......

``Watershed Basins`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:watershedbasins', elevation, channels, sinkroute, minsize, basins)

See also
........

