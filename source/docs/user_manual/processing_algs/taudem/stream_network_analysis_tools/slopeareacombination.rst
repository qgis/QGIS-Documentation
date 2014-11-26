Slope Area Combination
======================

Description
-----------

Creates a grid of slope-area values = ``(Sm) (An)`` based on slope and specific
catchment area grid inputs, and parameters ``m`` and ``n``. This tool is intended
for use as part of the slope-area stream raster delineation method.

Parameters
----------

``Slope Grid`` [raster]
  This input is a grid of slope values. This grid can be obtained from the
  **"D-Infinity Flow Directions"** tool.

``Contributing Area Grid`` [raster]
  A grid giving the specific catchment area for each cell taken as its own
  contribution (grid cell length or summation of weights) plus the proportional
  contribution from upslope neighbors that drain in to it. This grid is
  typically obtained from the **"D-Infinity Contributing Area"** tool.

``Slope Exponent`` [number]
  The slope exponent (``m``) parameter which will be used in the formula:
  ``(Sm)(An)``, that is used to create the slope-area grid.

  Default: *2*

``Area Exponent`` [number]
  The area exponent (``n``) parameter which will be used in the formula:
  ``(Sm)(An)``, that is used to create the slope-area grid.

  Default: *1*

Outputs
-------

``Slope Area Grid`` [raster]
  A grid of slope-area values = ``(Sm)(An)`` calculated from the slope grid,
  specific catchment area grid, ``m`` slope exponent parameter, and ``n`` area
  exponent parameter.

Console usage
-------------

::

  processing.runalg('taudem:slopeareacombination', slope_grid, area_grid, slope_exponent, area_exponent, slope_area_grid)

See also
--------

