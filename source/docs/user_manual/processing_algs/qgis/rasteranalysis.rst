.. only:: html

   |updatedisclaimer|

Raster analysis
===============

.. only:: html

   .. contents::
      :local:
      :depth: 1

.. _qgisrastercalculator:

Raster calculator
-----------------
Performs algebraic operations using raster layers.

The resulting layer will have its values computed according to an expression.
The expression can contain numerical values, operators and references to any of
the layers in the current project.

.. note:: When using the calculator in :ref:`processing_batch` or from the
  :ref:`console` the files to use have to be specified. The corresponding layers
  are referred using the base name of the file (without the full path). For instance,
  if using a layer at ``path/to/my/rasterfile.tif``, the first band of that layer
  will be referred as ``rasterfile.tif@1``.

Parameters
..........

``Layers (double click to add)`` [raster selection]
  List of all raster layers loaded in the legend. Raster layers are referred by
  their name and the number of the band: ``layer_name@band_number``. For instance,
  the first band from a layer named ``DEM`` will be referred as ``DEM@1``.

``Values and operators`` [calculator]
  Contains some calculator like buttons that can be used to fill the expression
  box. Besides the visible buttons also the following functions are supported:
  ``sin()``, ``cos()``, ``tan()``, ``atan2()``, ``ln()``, ``log10()``.

``Expression`` [string]
  Expression that will be used to calculate the output raster layer. You can use
  the operator buttons provided to type directly the expression in this box.

``Predefined expressions`` [enumeration]
  You can use the existing ``NDVI`` expression or you can define new expressions
  to use for some default and advanced calculations.

  Clicking on the :kbd:`Save...` button you can enter a new expression while
  using the :kbd:`Add...` button you can use the expression and set the parameters.


  Default: *NDVI*

``Reference layers(s)(used for automated extent, cellsize and CRS)`` [raster] [list]
  Optional.

  Layer(s) that will be used to fetch extent, cell size and CRS. Choosing the
  layer in this box avoids to fill all the other parameters by hand.

``Cell size (use 0 or empty to set it automatically)`` [number]
  Optional.

  Cell size of the output raster layer. If the cell size is not specified, the
  minimum cell size of selected reference layer(s) will be used. The cell size is
  assumed to be the same in both X and Y axes.

``Output extent (xmin, xmax, ymin, ymax)`` [extent]
  Optional.

  Extent of the output raster layer. If the extent is not specified, the minimum
  extent that covers selected reference layer(s) will be used.

``Output CRS`` [crs]
  Optional

  CRS of the output raster layer. If the output CRS is not specified, the CRS of
  the first reference layer will be used.

Outputs
.......

``Output`` [raster]
  Output raster file containing calculated values.


.. _qgisrasterlayerstatistics:

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

  - Analyzed file: path of the raster layer
  - Minimum value: minimum value of the raster
  - Maximum value: maximum value of the raster
  - Range: difference between the maximum and minimum values
  - Sum: total sum of the values
  - Mean value: mean of the values
  - Standard deviation: standard deviation of the values
  - Sum of the squares: sum of the squared differences of each observation from
    the overall mean


.. _qgisrasterlayeruniquevaluesreport:

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
  - NODATA pixel count: count of pixels with NODATA value
  - Final table with 3 different columns:

    - Value: unique value of each pixel
    - Pixel count: count of how many pixels belong to each value
    - Area (m :sup:`2`): square meters of the area for each pixel class


.. _qgiszonalstatistics:

Raster zonal statistics
-----------------------
Calculates statistics of a raster layer for each feature of an overlapping polygon
vector layer.

.. warning:: no new output file will be created. The algorithm adds new columns
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


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit http://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
