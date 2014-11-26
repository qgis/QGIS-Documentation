Grid Network
============

Description
-----------

Creates 3 grids that contain for each grid cell: 1) the longest path, 2) the total
path, and 3) the Strahler order number. These values are derived from the network
defined by the D8 flow model.

The longest upslope length is the length of the flow path from the furthest cell
that drains to each cell. The total upslope path length is the length of the
entire grid network upslope of each grid cell. Lengths are measured between cell
centers taking into account cell size and whether the direction is adjacent or
diagonal.

Strahler order is defined as follows: A network of flow paths is defined by the
D8 Flow Direction grid. Source flow paths have a Strahler order number of one.
When two flow paths of different order join the order of the downstream flow path
is the order of the highest incoming flow path. When two flow paths of equal
order join the downstream flow path order is increased by 1. When more than two
flow paths join the downstream flow path order is calculated as the maximum of
the highest incoming flow path order or the second highest incoming flow path
order + 1. This generalizes the common definition to cases where more than two
flow paths join at a point.

Where the optional mask grid and threshold value are input, the function is
evaluated only considering grid cells that lie in the domain with mask grid value
greater than or equal to the threshold value. Source (first order) grid cells are
taken as those that do not have any other grid cells from inside the domain
draining in to them, and only when two of these flow paths join is order
propagated according to the ordering rules. Lengths are also only evaluated
counting paths within the domain greater than or equal to the threshold.

If the optional outlet point shapefile is used, only the outlet cells and the
cells upslope (by the D8 flow model) of them are in the domain to be evaluated.

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
  used, only the cells upslope of these outlet cells are considered to be within
  the domain being evaluated.

``Mask Grid`` [raster]
  Optional.

  A grid that is used to determine the domain do be analyzed. If the mask grid
  value >= mask threshold (see below), then the cell will be included in the
  domain. While this tool does not have an edge contamination flag, if edge
  contamination analysis is needed, then a mask grid from a function like
  **"D8 Contributing Area"** that does support edge contamination can be used
  to achieve the same result.

``Mask Threshold`` [number]
  This input parameter is used in the calculation mask grid value >= mask
  threshold to determine if the grid cell is in the domain to be analyzed.

  Default: *100*

Outputs
-------

``Longest Upslope Length Grid`` [raster]
  A grid that gives the length of the longest upslope D8 flow path terminating
  at each grid cell. Lengths are measured between cell centers taking into
  account cell size and whether the direction is adjacent or diagonal.

``Total Upslope Length Grid`` [raster]
  The total upslope path length is the length of the entire D8 flow grid network
  upslope of each grid cell. Lengths are measured between cell centers taking
  into account cell size and whether the direction is adjacent or diagonal.

``Strahler Network Order Grid`` [raster]
  A grid giving the Strahler order number for each cell. A network of flow paths
  is defined by the D8 Flow Direction grid. Source flow paths have a Strahler
  order number of one. When two flow paths of different order join the order of
  the downstream flow path is the order of the highest incoming flow path. When
  two flow paths of equal order join the downstream flow path order is increased
  by 1. When more than two flow paths join the downstream flow path order is
  calculated as the maximum of the highest incoming flow path order or the
  second highest incoming flow path order + 1. This generalizes the common
  definition to cases where more than two flow paths join at a point.

Console usage
-------------

::

  processing.runalg('taudem:gridnetwork', d8_flow_dir_grid, outlets_shape, mask_grid, threshold, longest_len_grid, total_len_grid, strahler_grid)

See also
--------

