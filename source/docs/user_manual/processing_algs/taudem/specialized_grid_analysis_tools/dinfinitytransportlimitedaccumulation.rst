D-Infinity Transport Limited Accumulation
=========================================

Description
-----------

<put algortithm description here>

Parameters
----------

``D-Infinity Flow Direction Grid`` [raster]
  <put parameter description here>

``Supply Grid`` [raster]
  <put parameter description here>

``Transport Capacity Grid`` [raster]
  <put parameter description here>

``Outlets Shapefile`` [vector: point]
  Optional.

  <put parameter description here>

``Check for edge contamination`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
-------

``Transport Limited Accumulation Grid`` [raster]
  <put output description here>

``Deposition Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('taudem:dinfinitytransportlimitedaccumulation', dinf_flow_dir_grid, supply_grid, capacity_grid, outlets_shape, edge_contam, transp_lim_accum_grid, deposition_grid)

See also
--------

