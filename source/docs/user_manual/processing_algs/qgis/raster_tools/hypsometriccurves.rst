Hypsometric curves
==================

Description
-----------

<put algortithm description here>

Parameters
----------

``DEM to analyze`` [raster]
  <put parameter description here>

``Boundary layer`` [vector: polygon]
  <put parameter description here>

``Step`` [number]
  <put parameter description here>

  Default: *100.0*

``Use % of area instead of absolute value`` [boolean]
  <put parameter description here>

  Default: *False*

Outputs
-------

``Output directory`` [directory]
  <put output description here>

Console usage
-------------

::

  processing.runalg('qgis:hypsometriccurves', input_dem, boundary_layer, step, use_percentage, output_directory)

See also
--------

