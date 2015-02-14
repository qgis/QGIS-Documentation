Slope Average Down
==================

Description
-----------

This tool computes slope in a D8 downslope direction averaged over a user selected
distance. Distance should be specified in horizontal map units.

Parameters
----------

``D8 Flow Direction Grid`` [raster]
  This input is a grid of flow directions that are encoded using the D8 method
  where all flow from a cells goes to a single neighboring cell in the direction
  of steepest descent. This grid can be obtained as the output of the
  **"D8 Flow Directions"** tool.

``Pit Filled Elevation Grid`` [raster]
  This input is a grid of elevation values. As a general rule, it is recommended
  that you use a grid of elevation values that have had the pits removed for
  this input. Pits are generally taken to be artifacts that interfere with the
  analysis of flow across them. This grid can be obtained as the output of the
  **"Pit Remove"** tool, in which case it contains elevation values where the
  pits have been filled to the point where they just drain.

``Downslope Distance`` [number]
  Input parameter of downslope distance over which to calculate the slope (in
  horizontal map units).

  Default: *50*

Outputs
-------

``Slope Average Down Grid`` [raster]
  This output is a grid of slopes calculated in the D8 downslope direction,
  averaged over the selected distance.

Console usage
-------------

::

  processing.runalg('taudem:slopeaveragedown', -p, -fel, -dn, -slpd)

See also
--------

