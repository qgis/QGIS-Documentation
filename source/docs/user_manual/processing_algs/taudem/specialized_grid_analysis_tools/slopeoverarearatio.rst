Slope Over Area Ratio
=====================

Description
-----------

Calculates the ratio of the slope to the specific catchment area (contributing
area). This is algebraically related to the more common ln(a/tan beta) wetness
index, but contributing area is in the denominator to avoid divide by 0 errors
when slope is 0.

Parameters
----------

``Slope Grid`` [raster]
  A grid of slope. This grid can be generated using ether the
  **"D8 Flow Directions"** tool or the **"D-Infinity Flow Directions"** tool.

``Specific Catchment Area Grid`` [raster]
  A grid giving the contributing area value for each cell taken as its own
  contribution plus the contribution from upslope neighbors that drain in to it.
  Contributing area is counted in terms of the number of grid cells (or
  summation of weights). This grid can be generated using either the
  **"D8 Contributing Area"** tool or the **"D-Infinity Contributing Area"** tool.

Outputs
-------

``Slope Divided By Area Ratio Grid`` [raster]
  A grid of the ratio of slope to specific catchment area (contributing area).
  This is algebraically related to the more common ``ln(a/tan beta)`` wetness
  index, but contributing area is in the denominator to avoid divide by 0
  errors when slope is 0.

Console usage
-------------

::

  processing.runalg('taudem:slopeoverarearatio', -slp, -sca, -sar)

See also
--------

