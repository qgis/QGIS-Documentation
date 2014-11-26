D-Infinity Distance Down
========================

Description
-----------

Calculates the distance downslope to a stream using the D-infinity flow model.
The D-infinity flow model is a multiple flow direction model, because the outflow
from each grid cell is proportioned between up to 2 downslope grid cells. As such,
the distance from any grid cell to a stream is not uniquely defined. Flow that
originates at a particular grid cell may enter the stream at a number of different
cells. The statistical method may be selected as the longest, shortest or weighted
average of the flow path distance to the stream. Also one of several ways of
measuring distance may be selected: the total straight line path (Pythagoras),
the horizontal component of the straight line path, the vertical component of
the straight line path, or the total surface flow path.

Parameters
----------

``D-Infinity Flow Direction Grid`` [raster]
  A grid giving flow direction by the D-infinity method. Flow direction is
  measured in radians, counter clockwise from east. This can be created by the
  tool **"D-Infinity Flow Directions"**.

``Pit Filled Elevation Grid`` [raster]
  This input is a grid of elevation values. As a general rule, it is
  recommended that you use a grid of elevation values that have had the pits
  removed for this input. Pits are generally taken to be artifacts that
  interfere with the analysis of flow across them. This grid can be obtained as
  the output of the **"Pit Remove"** tool, in which case it contains elevation
  values where the pits have been filled to the point where they just drain.

``Stream Raster Grid`` [raster]
  A grid indicating streams, by using a grid cell value of 1 on streams and 0
  off streams. This is usually the output of one of the tools in the
  **"Stream Network Analysis"** toolset.

``Weight Path Grid`` [raster]
  Optional.

  A grid giving weights (loadings) to be used in the distance calculation. This
  might be used for example where only flow distance through a buffer is to be
  calculated. The weight is then 1 in the buffer and 0 outside it. Alternatively
  the weight may reflect some sort of cost function for travel over the surface,
  perhaps representing travel time or attenuation of a process. If this input
  file is not used, the loadings will assumed to be one for each grid cell.

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

``Check for edge contamination`` [boolean]
  A flag that determines whether the tool should check for edge contamination.
  This is defined as the possibility that a value may be underestimated due to
  grid cells outside of the domain not being counted. In the context of Distance
  Down this occurs when part of a flow path traced downslope from a grid cell
  leaves the domain without reaching a stream grid cell. With edge contamination
  checking selected, the algorithm recognizes this and reports no data for the
  result. This is the desired effect and indicates that values for these grid
  cells is unknown due to it being dependent on terrain outside of the domain
  of data available. Edge contamination checking may be overridden in cases
  where you know this is not an issue or want to evaluate the distance using
  only the fraction of flow paths that terminate at a stream.

  Default: *True*

Outputs
-------

``D-Infinity Drop to Stream Grid`` [raster]
  Grid containing the distance to stream calculated using the D-infinity flow
  model and the statistical and path methods chosen.

Console usage
-------------

::

  processing.runalg('taudem:dinfinitydistancedown', dinf_flow_dir_grid, pit_filled_grid, stream_grid, weight_path_grid, stat_method, dist_method, edge_contam, dist_down_grid)

See also
--------

