Overland flow distance to channel network
=========================================

Description
-----------

<put algortithm description here>

Parameters
----------

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
-------

``Overland Flow Distance`` [raster]
  <put output description here>

``Vertical Overland Flow Distance`` [raster]
  <put output description here>

``Horizontal Overland Flow Distance`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:overlandflowdistancetochannelnetwork', elevation, channels, method, distance, distvert, disthorz)

See also
--------

