Hypsometric curves
==================

Description
-----------

Calculate hypsometric curves for features of polygon layer and save them as
CSV file for further processing.

Parameters
----------

``DEM to analyze`` [raster]
  DEM to use for calculating altitudes.

``Boundary layer`` [vector: polygon]
  Polygonal vector layer with boundaries of areas used to calculate hypsometric
  curves.

``Step`` [number]
  Distanse between curves.

  Default: *100.0*

``Use % of area instead of absolute value`` [boolean]
  Write area percentage to "Area" field of the CSV file instead of absolute
  area value.

  Default: *False*

Outputs
-------

``Output directory`` [directory]
  Directory where output will be saved. For each feature from input vector
  layer CSV file with area and altitude values will be created.

  File name consists of prefix "hystogram_" followed by layer name and feature
  ID.

Console usage
-------------

::

  processing.runalg('qgis:hypsometriccurves', input_dem, boundary_layer, step, use_percentage, output_directory)

See also
--------

