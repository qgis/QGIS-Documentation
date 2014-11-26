D8 Distance To Streams
======================

Description
-----------

Computes the horizontal distance to stream for each grid cell, moving downslope
according to the D8 flow model, until a stream grid cell is encountered.

Parameters
----------

``D8 Flow Direction Grid`` [raster]
  This input is a grid of flow directions that are encoded using the D8 method
  where all flow from a cells goes to a single neighboring cell in the direction
  of steepest descent. This grid can be obtained as the output of the
  **"D8 Flow Directions"** tool.

``Stream Raster Grid`` [raster]
  A grid indicating streams. Such a grid can be created by several of the tools
  in the **"Stream Network Analysis"** toolset. However, the tools in the
  **"Stream Network Analysis"** toolset only create grids with a value of 0 for
  no stream, or 1 for stream cells. This tool can also accept grids with values
  greater than 1, which can be used in conjunction with the ``Threshold``
  parameter to determine the location of streams. This allows Contributing Area
  grids to be used to define streams as well as the normal Stream Raster grids.
  This grid expects integer (long integer) values and any non-integer values
  will be truncated to an integer before being evaluated.

``Threshold`` [number]
  This value acts as threshold on the ``Stream Raster Grid`` to determine the
  location of streams. Cells with a ``Stream Raster Grid`` value  greater than
  or equal to the ``Threshold`` value are interpreted as streams.

  Default: *50*

Outputs
-------

``Output Distance to Streams`` [raster]
  A grid giving the horizontal distance along the flow path as defined by the
  D8 Flow Directions Grid to the streams in the Stream Raster Grid.

Console usage
-------------

::

  processing.runalg('taudem:d8distancetostreams', -p, -src, -thresh, -dist)

See also
--------

