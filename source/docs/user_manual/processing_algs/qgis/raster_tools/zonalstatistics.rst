Zonal Statistics
================

Description
-----------

<put algortithm description here>

Parameters
----------

``Raster layer`` [raster]
  <put parameter description here>

``Raster band`` [number]
  <put parameter description here>

  Default: *1*

``Vector layer containing zones`` [vector: polygon]
  <put parameter description here>

``Output column prefix`` [string]
  <put parameter description here>

  Default: *_*

``Load whole raster in memory`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
-------

``Output layer`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('qgis:zonalstatistics', input_raster, raster_band, input_vector, column_prefix, global_extent, output_layer)

See also
--------

