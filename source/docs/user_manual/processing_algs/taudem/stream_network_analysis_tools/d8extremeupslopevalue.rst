D8 Extreme Upslope Value
========================

Description
-----------

Evaluates the extreme (either maximum or minimum) upslope value from an input
grid based on the D8 flow model. This is intended initially for use in stream
raster generation to identify a threshold of the slope times area product that
results in an optimum (according to drop analysis) stream network.

If the optional outlet point shapefile is used, only the outlet cells and the
cells upslope (by the D8 flow model) of them are in the domain to be evaluated.

By default, the tool checks for edge contamination. This is defined as the
possibility that a result may be underestimated due to grid cells outside of the
domain not being counted. This occurs when drainage is inwards from the boundaries
or areas with "no data" values for elevation. The algorithm recognizes this and
reports "no data" for the result for these grid cells. It is common to see streaks
of "no data" values extending inwards from boundaries along flow paths that enter
the domain at a boundary. This is the desired effect and indicates that the result
for these grid cells is unknown due to it being dependent on terrain outside of
the domain of data available. Edge contamination checking may be turned off in
cases where you know this is not an issue or want to ignore these problems, if
for example, the DEM has been clipped along a watershed outline.

Parameters
----------

``D8 Flow Directions Grid`` [raster]
  A grid of D8 flow directions which are defined, for each cell, as the
  direction of the one of its eight adjacent or diagonal neighbors with the
  steepest downward slope. This grid can be obtained as the output of the
  **"D8 Flow Directions"** tool.

``Upslope Values Grid`` [raster]
  This is the grid of values of which the maximum or minimum upslope value is
  selected. The values most commonly used are the slope times area product
  needed when generating stream rasters according to drop analysis.

``Outlets Shapefile`` [vector: point]
  Optional.

  A point shape file defining outlets of interest. If this input file is used,
  only the area upslope of these outlets will be evaluated by the tool.

``Check for edge contamination`` [boolean]
  A flag that indicates whether the tool should check for edge contamination.

  Default: *True*

``Use max upslope value`` [boolean]
  A flag to indicate whether the maximum or minimum upslope value is to be
  calculated.

  Default: *True*

Outputs
-------

``Extereme Upslope Values Grid`` [raster]
  A grid of the maximum/minimum upslope values.

Console usage
-------------

::

  processing.runalg('taudem:d8extremeupslopevalue', -p, -sa, -o, -nc, -min, -ssa)

See also
--------

