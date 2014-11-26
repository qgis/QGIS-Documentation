D-Infinity Distance Up
======================

Description
-----------

This tool calculates the distance from each grid cell up to the ridge cells along
the reverse D-infinity flow directions. Ridge cells are defined to be grid cells
that have no contribution from grid cells further upslope. Given the convergence
of multiple flow paths at any grid cell, any given grid cell can have multiple
upslope ridge cells. There are three statictical methods that this tool can use:
maximum distance, minimum distance and waited flow average over these flow paths.
A variant on the above is to consider only grid cells that contribute flow with
a proportion greater than a user specified threshold (t) to be considered as
upslope of any given grid cell. Setting t=0.5 would result in only one flow path
from any grid cell and would give the result equivalent to a D8 flow model,
rather than D-infinity flow model, where flow is proportioned between two
downslope grid cells. Finally there are several different optional paths that can
be measured: the total straight line path (Pythagoras), the horizontal component
of the straight line path, the vertical component of the straight line path, or
the total surface flow path.

Parameters
----------

``D-Infinity Flow Direction Grid`` [raster]
  A grid giving flow direction by the D-infinity method. Flow direction is
  measured in radians, counter clockwise from east. This can be created by the
  tool **"D-Infinity Flow Directions"**.

``Pit Filled Elevation Grid`` [raster]
  This input is a grid of elevation values. As a general rule, it is recommended
  that you use a grid of elevation values that have had the pits removed for
  this input. Pits are generally taken to be artifacts that interfere with the
  analysis of flow across them. This grid can be obtained as the output of the
  **"Pit Remove"** tool, in which case it contains elevation values where the
  pits have been filled to the point where they just drain.

``Slope Grid`` [raster]
  This input is a grid of slope values. This is measured as drop/distance and
  it is most often obtained as the output of the **"D-Infinity Flow Directions"**
  tool.

``Statistical Method`` [selection]
  Statistical method used to calculate the distance down to the stream. In the
  D-Infinity flow model, the outflow from each grid cell is proportioned between
  two downslope grid cells. Therefore, the distance from any grid cell to a
  stream is not uniquely defined. Flow that originates at a particular grid cell
  may enter the stream at a number of cells. The distance to the stream may be
  defined as the longest (maximum), shortest (minimum) or weighted average of
  the distance down to the stream.

  Options:

  * 0 --- Minimum
  * 1 --- Maximum
  * 2 --- Average

  Default: *2*

``Distance Method`` [selection]
  Distance method used to calculate the distance down to the stream. One of
  several ways of measuring distance may be selected: the total straight line
  path (Pythagoras), the horizontal component of the straight line path
  (horizontal), the vertical component of the straight line path (vertical),
  or the total surface flow path (surface).

  Options:

  * 0 --- Pythagoras
  * 1 --- Horizontal
  * 2 --- Vertical
  * 3 --- Surface

  Default: *1*

``Proportion Threshold`` [number]
  The proportion threshold parameter where only grid cells that contribute flow
  with a proportion greater than this user specified threshold (``t``) is
  considered to be upslope of any given grid cell. Setting ``t=0.5`` would
  result in only one flow path from any grid cell and would give the result
  equivalent to a D8 flow model, rather than D-Infinity flow model, where flow
  is proportioned between two downslope grid cells.

  Default: *0.5*

``Check for edge contamination`` [boolean]
  A flag that determines whether the tool should check for edge contamination.
  This is defined as the possibility that a value may be underestimated due to
  grid cells outside of the domain not being counted.

  Default: *True*

Outputs
-------

``D-Infinity Distance Up`` [raster]
  Grid containing the distances up to the ridge calculated using the D-Infinity
  flow model and the statistical and path methods chosen.

Console usage
-------------

::

  processing.runalg('taudem:dinfinitydistanceup', dinf_flow_dir_grid, pit_filled_grid, slope_grid, stat_method, dist_method, threshold, edge_contam, dist_up_grid)

See also
--------

