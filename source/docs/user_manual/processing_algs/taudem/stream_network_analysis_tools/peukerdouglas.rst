Peuker Douglas
==============

Description
-----------

<put algortithm description here>

Parameters
----------

``Elevation Grid`` [raster]
  <put parameter description here>

``Center Smoothing Weight`` [number]
  <put parameter description here>

  Default: *0.4*

``Side Smoothing Weight`` [number]
  <put parameter description here>

  Default: *0.1*

``Diagonal Smoothing Weight`` [number]
  <put parameter description here>

  Default: *0.05*

Outputs
-------

``Stream Source Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('taudem:peukerdouglas', elevation_grid, center_weight, side_weight, diagonal_weight, stream_source_grid)

See also
--------

