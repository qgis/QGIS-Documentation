Move Outlets To Streams
=======================

Description
-----------

Moves outlet points that are not aligned with a stream cell from a stream raster
grid, downslope along the D8 flow direction until a stream raster cell is
encountered, the "max_dist" number of grid cells are examined, or the flow path
exits the domain (i.e. a "no data" value is encountered for the D8 flow direction).
The output file is a new outlets shapefile where each point has been moved to
coincide with the stream raster grid, if possible. A field "dist_moved" is added
to the new outlets shapefile to indicate the changes made to each point. Points
that are already on a stream cell are not moved and their "dist_moved" field is
assigned a value 0. Points that are initially not on a stream cell are moved by
sliding them downslope along the D8 flow direction until one of the following
occurs: a) A stream raster grid cell is encountered before traversing the
"max_dist" number of grid cells. In which case, the point is moved and the
"dist_moved" field is assigned a value indicating how many grid cells the point
was moved. b) More than the "max_number" of grid cells are traversed, or c) the
traversal ends up going out of the domain (i.e., a "no data" D8 flow direction
value is encountered). In which case, the point is not moved and the
"dist_moved" field is assigned a value of -1.

Parameters
----------

``D8 Flow Direction Grid`` [raster]
  A grid of D8 flow directions which are defined, for each cell, as the
  direction of the one of its eight adjacent or diagonal neighbors with the
  steepest downward slope. This grid can be obtained as the output of the
  **"D8 Flow Directions"** tool.

``Stream Raster Grid`` [raster]
  This output is an indicator grid (1, 0) that indicates the location of
  streams, with a value of 1 for each of the stream cells and 0 for the
  remainder of the cells. This file is produced by several different tools in
  the **"Stream Network Analysis"** toolset.

``Outlets Shapefile`` [vector: point]
  A point shape file defining points of interest or outlets that should ideally
  be located on a stream, but may not be exactly on the stream due to the fact
  that the shapefile point locations may not have been accurately registered
  with respect to the stream raster grid.

``Maximum Number of Grid Cells to traverse`` [number]
  This input paramater is the maximum number of grid cells that the points in
  the input outlet shapefile will be moved before they are saved to the output
  outlet shapefile.

  Default: *50*

Outputs
-------

``Output Outlet Shapefile`` [vector]
  A point shape file defining points of interest or outlets. This file has one
  point in it for each point in the input outlet shapefile. If the original
  point was located on a stream, then the point was not moved. If the origianl
  point was not on a stream, the point was moved downslope according to the D8
  flow direction until it reached a stream or the maximum distance had been
  reached. This file has an additional field "dist_moved" added to it which is
  the number of cells that the point was moved. This field is 0 if the cell was
  originally on a stream, -1 if it was not moved becuase there was not a stream
  within the maximum distance, or some positive value if it was moved.

Console usage
-------------

::

  processing.runalg('taudem:moveoutletstostreams', -p, -src, -o, -md, -om)

See also
--------

