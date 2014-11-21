D-Infinity Distance Down
========================

Description
-----------

<put algortithm description here>

Parameters
----------

``D-Infinity Flow Direction Grid`` [raster]
  <put parameter description here>

``Pit Filled Elevation Grid`` [raster]
  <put parameter description here>

``Stream Raster Grid`` [raster]
  <put parameter description here>

``Weight Path Grid`` [raster]
  Optional.

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

``Check for edge contamination`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
-------

``D-Infinity Drop to Stream Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('taudem:dinfinitydistancedown', dinf_flow_dir_grid, pit_filled_grid, stream_grid, weight_path_grid, stat_method, dist_method, edge_contam, dist_down_grid)

See also
--------

