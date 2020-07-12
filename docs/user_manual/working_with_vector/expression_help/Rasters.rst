:orphan:

.. raster_statistic_section

.. _expression_function_Rasters_raster_statistic:

raster_statistic
................

Returns statistics from a raster layer.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - raster_statistic(layer, band, property)

   * - Arguments
     - * **layer** - a string, representing either a raster layer name or layer ID

       * **band** - integer representing the band number from the raster layer, starting at 1

       * **property** - a string corresponding to the property to return. Valid options are:<br /><ul><li>min: minimum value</li><li>max: maximum value</li><li>avg: average (mean) value</li><li>stdev: standard deviation of values</li><li>range: range of values (max - min)</li><li>sum: sum of all values from raster</li></ul>

   * - Examples
     - * raster_statistic('lc',1,'avg') → Average value from band 1 from 'lc' raster layer

       * raster_statistic('ac2010',3,'min') → Minimum value from band 3 from 'ac2010' raster layer


.. end_raster_statistic_section

.. raster_value_section

.. _expression_function_Rasters_raster_value:

raster_value
............

Returns the raster value found at the provided point.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - raster_value(layer, band, point)

   * - Arguments
     - * **layer** - the name or id of a raster layer

       * **band** - the band number to sample the value from.

       * **point** - point geometry (for multipart geometries having more than one part, a null value will be returned)

   * - Examples
     - * raster_value('dem', 1, make_point(1,1)) → 25


.. end_raster_value_section

