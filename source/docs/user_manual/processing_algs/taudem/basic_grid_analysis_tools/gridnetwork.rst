Grid Network
============

Description
-----------

<put algortithm description here>

Parameters
----------

``D8 Flow Direction Grid`` [raster]
  <put parameter description here>

``Outlets Shapefile`` [vector: point]
  Optional.

  <put parameter description here>

``Mask Grid`` [raster]
  Optional.

  <put parameter description here>

``Proportion Threshold`` [number]
  <put parameter description here>

  Default: *100*

Outputs
-------

``Longest Upslope Length Grid`` [raster]
  <put output description here>

``Total Upslope Length Grid`` [raster]
  <put output description here>

``Strahler Network Order Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('taudem:gridnetwork', d8_flow_dir_grid, outlets_shape, mask_grid, threshold, longest_len_grid, total_len_grid, strahler_grid)

See also
--------

