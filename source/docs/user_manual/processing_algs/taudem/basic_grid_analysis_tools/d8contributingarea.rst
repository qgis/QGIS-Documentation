D8 Contributing Area
====================

Description
-----------

Calculates a grid of contributing areas using the single direction D8 flow model.
The contribution of each grid cell is taken as one (or when the optional weight
grid is used, the value from the weight grid). The contributing area for each
grid cell is taken as its own contribution plus the contribution from upslope
neighbors that drain in to it according to the D8 flow model.

If the optional outlet point shapefile is used, only the outlet cells and the
cells upslope (by the D8 flow model) of them are in the domain to be evaluated.

By default, the tool checks for edge contamination. This is defined as the
possibility that a contributing area value may be underestimated due to grid
cells outside of the domain not being counted. This occurs when drainage is
inwards from the boundaries or areas with "no data" values for elevation. The
algorithm recognizes this and reports "no data" for the contributing area. It is
common to see streaks of "no data" values extending inwards from boundaries
along flow paths that enter the domain at a boundary. This is the desired effect
and indicates that contributing area for these grid cells is unknown due to it
being dependent on terrain outside of the domain of data available. Edge
contamination checking may be turned off in cases where you know this is not an
issue or want to ignore these problems, if for example, the DEM has been clipped
along a watershed outline.

Parameters
----------

``D8 Flow Direction Grid`` [raster]
  A grid of D8 flow directions which are defined, for each cell, as the
  direction of the one of its eight adjacent or diagonal neighbors with the
  steepest downward slope. This grid can be obtained as the output of the
  **"D8 Flow Directions"** tool.

``Outlets Shapefile`` [vector: point]
  Optional.

  A point shapefile defining the outlets of interest. If this input file is
  used, only the cells upslope of these outlet cells are considered to be
  within the domain being evaluated.

``Weight Grid`` [raster]
  Optional.

  A grid giving contribution to flow for each cell. These contributions (also
  sometimes referred to as weights or loadings) are used in the contributing
  area accumulation. If this input file is not used, the contribution to flow
  will assumed to be one for each grid cell.

``Check for edge contamination`` [boolean]
  A flag that indicates whether the tool should check for edge contamination.
  Edge contamination is defined as the possibility that a contributing area
  value may be underestimated due to the fact that grid cells outside of the
  domain have not been evaluated. This occurs when drainage is inwards from the
  boundaries or areas with NODATA values for elevation. The algorithm recognizes
  this and reports NODATA for the impated cells. It is common to see streaks of
  NODATA values extending inwards from boundaries along flow paths that enter
  the domain at a boundary. This is the desired effect and indicates that
  contributing area for these grid cells is unknown due to it being dependent
  on terrain outside of the domain of available data. Edge contamination
  checking may be turned off in cases where you know this is not an issue,
  or want to ignore these problems, if for example, the DEM has been clipped
  along a watershed outline.

  Default: *True*

Outputs
-------

``D8 Contributing Area Grid`` [raster]
  A grid of contributing area values calculated as the cells own contribution
  plus the contribution from upslope neighbors that drain in to it according
  to the D8 flow model.

Console usage
-------------

::

  processing.runalg('taudem:d8contributingarea', -p, -o, -wg, -nc, -ad8)

See also
--------

