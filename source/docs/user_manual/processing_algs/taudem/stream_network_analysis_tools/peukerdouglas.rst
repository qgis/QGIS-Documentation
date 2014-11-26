Peuker Douglas
==============

Description
-----------

Creates an indicator grid (1, 0) of upward curved grid cells according to the
Peuker and Douglas algorithm.

With this tool, the DEM is first smoothed by a kernel with weights at the center,
sides, and diagonals. The Peuker and Douglas (1975) method (also explained in
Band, 1986), is then used to identify upwardly curving grid cells. This technique
flags the entire grid, then examines in a single pass each quadrant of 4 grid
cells, and unflags the highest. The remaining flagged cells are deemed "upwardly
curved", and when viewed, resemble a channel network. This proto-channel network
generally lacks connectivity and requires thinning, issues that were discussed
in detail by Band (1986).

Parameters
----------

``Elevation Grid`` [raster]
  A grid of elevation values. This is usually the output of the
  **"Pit Remove"** tool, in which case it is elevations with pits removed.

``Center Smoothing Weight`` [number]
  The center weight parameter used by a kernel to smooth the DEM before the tool
  identifies upwardly curved grid cells.

  Default: *0.4*

``Side Smoothing Weight`` [number]
  The side weight parameter used by a kernel to smooth the DEM before the tool
  identifies upwardly curved grid cells.

  Default: *0.1*

``Diagonal Smoothing Weight`` [number]
  The diagonal weight parameter used by a kernel to smooth the DEM before the
  tool identifies upwardly curved grid cells.

  Default: *0.05*

Outputs
-------

``Stream Source Grid`` [raster]
  An indicator grid (1, 0) of upward curved grid cells according to the Peuker
  and Douglas algorithm, and if viewed, resembles a channel network. This
  proto-channel network generally lacks connectivity and requires thinning,
  issues that were discussed in detail by Band (1986).

Console usage
-------------

::

  processing.runalg('taudem:peukerdouglas', elevation_grid, center_weight, side_weight, diagonal_weight, stream_source_grid)

See also
--------

* Band, L. E., (1986), "Topographic partition of watersheds with digital elevation
  models", Water Resources Research, 22(1): 15-24.
* Peuker, T. K. and D. H. Douglas, (1975), "Detection of surface-specific points
  by local parallel processing of discrete terrain elevation data", Comput.
  Graphics Image Process., 4: 375-387.
