Channel network
===============

Description
-----------

<put algortithm description here>

Parameters
----------

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
-------

``Channel Network`` [raster]
  <put output description here>

``Channel Direction`` [raster]
  <put output description here>

``Channel Network`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:channelnetwork', elevation, sinkroute, init_grid, init_method, init_value, div_grid, div_cells, trace_weight, minlen, chnlntwrk, chnlroute, shapes)

See also
--------

