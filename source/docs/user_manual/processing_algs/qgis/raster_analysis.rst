.. only:: html

   |updatedisclaimer|

Raster analysis
===============

.. only:: html

   .. contents::
      :local:
      :depth: 1

.. _qgis_raster_calculator:

Raster calculator
-----------------
Performs algebraic operations using raster layers.

The resulting layer will have its values computed according to an expression.
The expression can contain numerical values, operators and references to any of
the layers in the current project.

.. note:: When using the calculator in the batch interface or from the console,
  the files to use have to be specified. The corresponding layers are referred
  using the base name of the file (without the full path). For instance, if using
  a layer at ``path/to/my/rasterfile.tif``, the first band of that layer will be
  referred as ``rasterfile.tif@1``.

Parameters
..........

``Layers (double click to add)`` [raster selection]
  List of all raster layers loaded in the legend. Raster layers are referred by
  their name and the number of the band: ``layer_name@band_number``. For instance,
  the first band from a layer named ``DEM`` will be referred as ``DEM@1``.

``Values and operators`` [calculator]
  Contains some calculator like buttons that can be used to fill the expression
  box. Besides the visible buttons also the the following functions are supported:
  ``sin()``, ``cos()``, ``tan()``, ``atan2()``, ``ln()``, ``log10()``.


``Expression`` [string]
  Expression that will be used to calculate the output raster layer. You can use
  the operator buttons provided of type directly the expression in this box.

``Predefined expressions`` [selection]
  You can use the existing ``NDVI`` expression or you can define new expressions
  to use for some default and advanced calculations.

  Clicking on the :kbd:`Save...` button you can enter a new expression while
  using the :kbd:`Add...` button you can use the expression and set the parameters.


  Default: *NDVI*

``Cell size (use 0 or empty to set it automatically)`` [number]
  Optional.

  Cell size of the output raster layer. If the cell size is not specified, the
  minimum cell size of all input layers will be used. The cell size is assumed to
  be the same in both X and Y axes.

``Output extent (xmin, xmax, ymin, ymax)`` [extent]
  Optional.

  Extent of the output raster layer. If the extent is not specified, the minimum
  extent that covers the input layers will be used.

Outputs
.......

``Output`` [raster]
  Output raster file containing calculated values.

Console usage
.............

.. code-block:: python

  # import the processing class
  import processing
  # define the parameters dictionary with all the inputs
  parameters = {
    'EXPRESSION': ' ( dtm@1  > 1000) AND  ( dtm@1 < 2000)',
    'CELLSIZE': 0,
    'OUTPUT': 'path_of_your_output'
  }
  # run the algorithm and load the results
  processing.runAndLoadResults('qgis:rastercalculator', parameters)


.. _qgis_raster_layer_statistics:

Raster layer statistics
-----------------------
Calculates basic statistics from the values in a given band of the raster layer.
The output is loaded in the :menuselection:`Processing --> Results viewer` menu.

Parameters
..........

``Input layer`` [raster]
  Raster layer in input

``Band number`` [raster band]
  If the raster is multiband choose the band you want to calculate the statistics

  Default: *Band 1 (Gray)*

Outputs
.......

``Statistics`` [html]
  The output file contains the following information:

  - Analyzed file: the path of the raster layer
  - Minimum value: minimum value of the raster
  - Maximum value: maximum value of the raster
  - Range: maximum values minus the minimum values
  - Sum: total sum of the values
  - Mean value: mean of the values
  - Standard deviation: standard deviation of the values
  - Sum of the squares: sum of the squared differences of each observation from
    the overall mean

Console usage
.............

.. code-block:: python

  # import the processing class
  import processing
  # define the parameters dictionary with all the inputs
  parameters = {
    'INPUT': 'path_of_your_raster',
    'BAND':1,
    'OUTPUT': 'path_of_your_output'
  }
  # run the algorithm and load the results
  processing.runAndLoadResults('qgis:rasterlayerstatistics', parameters)


.. _qgis_raster_layer_unique_values_report:

Raster layer unique values report
---------------------------------
Returns the count and area of each unique value in a given raster layer.

Parameters
..........

``Input layer`` [raster]
  Raster layer in input

``Band number`` [raster band]
  If the raster is multiband choose the band you want to calculate the statistics

  Default: *Band 1 (Gray)*

Outputs
.......

``Unique values report`` [html]
  The output file contains the following information:

  - Analyzed file: the path of the raster layer
  - Extent: xmin, ymin, xmax, ymax coordinates of the extent
  - Projection: projection of the layer
  - Width in pixels: number of columns and pixel width size
  - Height in pixels: number of rows and pixel width size
  - Total pixel count: count of all the pixels
  - NODATA pixel count: count of pixel with NODATA value
  - Final table with 3 different columns:

    - Value: unique value of each pixel
    - Pixel count: count of how many pixels belons to each value
    - Area (m :sup:`2`): square meters of the area for each pixel class

Console usage
.............

.. code-block:: python

  # import the processing class
  import processing
  # define the parameters dictionary with all the inputs
  parameters = {
    'INPUT': 'path_of_your_raster',
    'BAND': 1,
    'OUTPUT': 'path_of_your_output'
  }
  # run the algorithm and load the results
  processing.runAndLoadResults('native:rasterlayeruniquevaluesreport', parameters)


.. _qgis_zonal_statistics:

Raster zonal statistics
-----------------------
Calculates statistics of a raster layer for each feature of an overlapping polygon
vector layer.

.. warning:: no new output file will be created. The algorithms adds new columns
  to the source vector layer

Parameters
..........

``Raster layer`` [raster]
 Raster layer in input

``Band number`` [raster band]
 If the raster is multiband choose the band you want to calculate the statistics

 Default: *Band 1 (Gray)*

``Vector layer containing zones`` [vector: polygon]
  Polygon vector layer

``Output column prefix`` [string]
  Prefix string for output columns

  Default: ``_``

``Statistics to calculate`` [multiple selection]
  List of statistical operator for the output. The available operators are:

  * Count
  * Sum
  * Mean
  * Median
  * St. dev.
  * Min
  * Max
  * Range
  * Minority
  * Majority (mode)
  * Variety
  * Variance
  * All

Console usage
.............

.. code-block:: python

  # import the processing class
  import processing
  # define the parameters dictionary with all the inputs
  parameters = {
    'INPUT': 'path_of_your_raster',
    'RASTER_BAND':1,
    'INPUT_VECTOR':': 'path_of_your_vector',
    'COLUMN_PREFIX':'_',
    'STATS':[0,1,2]
  }
  # run the algorithm and load the results
  processing.runAndLoadResults('qgis:zonalstatistics', parameters)
