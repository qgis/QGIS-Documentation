Raster layer statistics
=======================

Description
-----------

Calculates basic statistics of the raster layer.

Parameters
----------

``Input layer`` [raster]
  Raster to analyze.

Outputs
-------

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
  Number of cell with data.

``No-data cells count`` [number]
  Number of NODATA cells.

``Standard deviation`` [number]
  Standard deviation of cells values.

Console usage
-------------

::

  processing.runalg('qgis:rasterlayerstatistics', input, output_html_file)

See also
--------

