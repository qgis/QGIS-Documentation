Stream Drop Analysis
====================

Description
-----------

<put algortithm description here>

Parameters
----------

``D8 Contributing Area Grid`` [raster]
  <put parameter description here>

``D8 Flow Direction Grid`` [raster]
  <put parameter description here>

``Pit Filled Elevation Grid`` [raster]
  <put parameter description here>

``Contributing Area Grid`` [raster]
  <put parameter description here>

``Outlets Shapefile`` [vector: point]
  <put parameter description here>

``Minimum Threshold`` [number]
  <put parameter description here>

  Default: *5*

``Maximum Threshold`` [number]
  <put parameter description here>

  Default: *500*

``Number of Threshold Values`` [number]
  <put parameter description here>

  Default: *10*

``Spacing for Threshold Values`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Logarithmic
  * 1 --- Linear

  Default: *0*

Outputs
-------

``D-Infinity Drop to Stream Grid`` [file]
  <put output description here>

Console usage
-------------

::

  processing.runalg('taudem:streamdropanalysis', d8_contrib_area_grid, d8_flow_dir_grid, pit_filled_grid, accum_stream_source_grid, outlets_shape, min_treshold, max_threshold, treshold_num, step_type, drop_analysis_file)

See also
--------

