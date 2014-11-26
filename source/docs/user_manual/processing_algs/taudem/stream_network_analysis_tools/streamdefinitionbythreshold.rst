Stream Definition By Threshold
==============================

Description
-----------

Operates on any grid and outputs an indicator (1, 0) grid identifing cells with
input values >= the threshold value. The standard use is to use an accumulated
source area grid to as the input grid to generate a stream raster grid as the
output. If you use the optional input mask grid, it limits the domain being
evaluated to cells with mask values >= 0. When you use a D-infinity contributing
area grid (:file:`*sca`) as the mask grid, it functions as an edge contamination
mask. The threshold logic is:

::

  src = ((ssa >= thresh) & (mask >= s0)) ? 1:0

Parameters
----------

``Accumulated Stream Source Grid`` [raster]
  This grid nominally accumulates some characteristic or combination of
  characteristics of the watershed. The exact characteristic(s) varies depending
  on the stream network raster algorithm being used. This grid needs to have
  the property that grid cell values are monotonically increasing downslope
  along D8 flow directions, so that the resulting stream network is continuous.
  While this grid is often from an accumulation, other sources such as a maximum
  upslope function will also produce a suitable grid.

``Threshold`` [number]
  This parameter is compared to the value in the Accumulated Stream Source grid
  (:file:`*ssa`) to determine if the cell should be considered a stream cell.
  Streams are identified as grid cells for which ssa value is >= this threshold.

  Default: *100*

``Mask Grid`` [raster]
  Optional.

  This optional input is a grid that is used to mask the domain of interest and
  output is only provided where this grid is >= 0. A common use of this input
  is to use a D-Infinity contributing area grid as the mask so that the
  delineated stream network is constrained to areas where D-infinity
  contributing area is available, replicating the functionality of an edge
  contamination mask.

Outputs
-------

``Stream Raster Grid`` [raster]
  This is an indicator grid (1, 0) that indicates the location of streams, with
  a value of 1 for each of the stream cells and 0 for the remainder of the cells.

Console usage
-------------

::

  processing.runalg('taudem:streamdefinitionbythreshold', -ssa, -thresh, -mask, -src)

See also
--------

