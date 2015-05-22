|updatedisclaimer|

Raster
======

Hypsometric curves
------------------

Description
...........

Calculate hypsometric curves for features of polygon layer and save them as
CSV file for further processing.

Parameters
..........

``DEM to analyze`` [raster]
  DEM to use for calculating altitudes.

``Boundary layer`` [vector: polygon]
  Polygonal vector layer with boundaries of areas used to calculate hypsometric
  curves.

``Step`` [number]
  Distance between curves.

  Default: *100.0*

``Use % of area instead of absolute value`` [boolean]
  Write area percentage to "Area" field of the CSV file instead of absolute
  area value.

  Default: *False*

Outputs
.......

``Output directory`` [directory]
  Directory where output will be saved. For each feature from input vector
  layer CSV file with area and altitude values will be created.

  File name consists of prefix :file:`hystogram_` followed by layer name and feature
  ID.

Console usage
.............

::

  processing.runalg('qgis:hypsometriccurves', input_dem, boundary_layer, step, use_percentage, output_directory)

See also
........

Raster layer statistics
-----------------------

Description
...........

Calculates basic statistics of the raster layer.

Parameters
..........

``Input layer`` [raster]
  Raster to analyze.

Outputs
.......

``Statistics`` [html]
  Analysis results in HTML format.

``Minimum value`` [number]
  Minimum cell value.

``Maximum value`` [number]
  Maximum cell value.

``Sum`` [number]
  Sum of all cells values.

``Mean value`` [number]
  Mean cell value.

``valid cells count`` [number]
  Number of cells with data.

``No-data cells count`` [number]
  Number of NODATA cells.

``Standard deviation`` [number]
  Standard deviation of cells values.

Console usage
.............

::

  processing.runalg('qgis:rasterlayerstatistics', input, output_html_file)

See also
........

Zonal Statistics
----------------

Description
...........

Calculates some statistics values for pixels of input raster inside certain
zones, defined as polygon layer.

Following values calculated for each zone:

* minimum
* maximum
* sum
* count
* mean
* standard deviation
* number of unique values
* range
* variance

Parameters
..........

``Raster layer`` [raster]
  Raster to analyze.

``Raster band`` [number]
  Number of raster band to analyze.

  Default: *1*

``Vector layer containing zones`` [vector: polygon]
  Layer with zones boundaries.

``Output column prefix`` [string]
  Prefix for output fields.

  Default: *_*

``Load whole raster in memory`` [boolean]
  Determines if raster band will be loaded in memory (``True``) or readed by
  chunks (``False``). Useful only when disk IO or raster scanning inefficiencies
  are your limiting factor.

  Default: *True*

Outputs
.......

``Output layer`` [vector]
  The resulting layer. Basically this is same layer as zones layer with new
  columns containing statistics added.

Console usage
.............

::

  processing.runalg('qgis:zonalstatistics', input_raster, raster_band, input_vector, column_prefix, global_extent, output_layer)

See also
........

