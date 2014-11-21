D-Infinity Distance Up
======================

Description
-----------

<put algortithm description here>

Parameters
----------

``D-Infinity Flow Direction Grid`` [raster]
  <put parameter description here>

``Pit Filled Elevation Grid`` [raster]
  <put parameter description here>

``Slope Grid`` [raster]
  <put parameter description here>

``Statistical Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Minimum
  * 1 --- Maximum
  * 2 --- Average

  Default: *2*

``Distance Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Pythagoras
  * 1 --- Horizontal
  * 2 --- Vertical
  * 3 --- Surface

  Default: *1*

``Proportion Threshold`` [number]
  <put parameter description here>

  Default: *0.5*

``Check for edge contamination`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
-------

``D-Infinity Distance Up`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('taudem:dinfinitydistanceup', dinf_flow_dir_grid, pit_filled_grid, slope_grid, stat_method, dist_method, threshold, edge_contam, dist_up_grid)

See also
--------

