Zonal Statistics
================

Description
-----------

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
----------

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
-------

``Output layer`` [vector]
  The resulting layer. Basically this is same layer as zones layer with new
  columns containing statistics added.

Console usage
-------------

::

  processing.runalg('qgis:zonalstatistics', input_raster, raster_band, input_vector, column_prefix, global_extent, output_layer)

See also
--------

