.. only:: html


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

The resulting layer will have its values computed according to an
expression.
The expression can contain numerical values, operators and references
to any of the layers in the current project.

.. note:: When using the calculator in :ref:`processing_batch` or from the
  :ref:`console` the files to use have to be specified. The corresponding 
  layers are referred using the base name of the file (without the full
  path).
  For instance, if using a layer at ``path/to/my/rasterfile.tif``, the first
  band of that layer will be referred as ``rasterfile.tif@1``.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Layers**
     -  GUI only
     - 
     - Shows the list of all raster layers loaded in the legend.
       These can be used to fill the expression box (double click to
       add).
       Raster layers are referred by their name and the number of the
       band: ``layer_name@band_number``.
       For instance, the first band from a layer named ``DEM`` will
       be referred as ``DEM@1``.
   * - **Operators**
     -  GUI only
     - 
     - Contains some calculator like buttons that can be used to fill
       the expression box.
   * - **Expression**
     -  ``EXPRESSION``
     - [string]
     - Expression that will be used to calculate the output raster layer.
       You can use the operator buttons provided to type directly the
       expression in this box.
   * - **Predefined expressions**
     - GUI only
     - 
     - You can use the predefined ``NDVI`` expression or you can define
       new expressions for calculations.
       The :guilabel:`Add...` button loads a defined expression (and lets
       you set the parameters).
       The :guilabel:`Save...` button lets you define a new expression.
   * - **Reference layer(s) (used for automated extent, cellsize, and CRS)**
       
       Optional
     - ``LAYERS``
     - [raster] [list]
     - Layer(s) that will be used to fetch extent, cell size and CRS.
       By choosing the layer in this box you avoid filling in all the
       other parameters by hand.
       Raster layers are referred by their name and the number of
       the band: ``layer_name@band_number``.
       For instance, the first band from a layer named ``DEM`` will be
       referred as ``DEM@1``.
   * - **Cell size (use 0 or empty to set it automatically)**
       
       Optional
     - ``CELLSIZE``
     - [number]
     - Cell size of the output raster layer.
       If the cell size is not specified, the minimum cell size of
       the selected reference layer(s) will be used.
       The cell size will be the same for the X and Y axes.
   * - **Output extent (xmin, xmax, ymin, ymax)**
     - ``EXTENT``
     - [extent]
     - Extent of the output raster layer.
       If the extent is not specified, the minimum extent that covers
       all the selected reference layers will be used.
   * - **Output CRS**
       
       Optional
     - ``CRS``
     - [crs]
     - CRS of the output raster layer.
       If the output CRS is not specified, the CRS of the first
       reference layer will be used.
   * - **Output**
     - ``OUTPUT``
     - [raster]
       
       Default: ``[Save to temporary file]``
     - Specification of the output raster. One of:
       
       * Save to a Temporary File
       * Save to File...
       
       The file encoding can also be changed here.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Output**
     - ``OUTPUT``
     - [raster]
     - Output raster file with the calculated values.


.. _qgisrasterlayerstatistics:

Raster layer statistics
-----------------------
Calculates basic statistics from the values in a given band of the
raster layer.
The output is loaded in the
:menuselection:`Processing --> Results viewer` menu.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [raster]
     - Input raster layer
   * - **Band number**
     - ``BAND``
     - [raster band]
       
       Default: The first band of the input layer
     - If the raster is multiband, choose the band you want to get
       statistics for.
   * - **Output**
     - ``OUTPUT_HTML_FILE``
     - [html]
       
       Default: ``[Save to temporary file]``
     - Specification of the output file:
       
       * Skip Output
       * Save to a Temporary File
       * Save to File...
       
       The file encoding can also be changed here.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Maximum value**
     - ``MAX``
     - [number]
     - 
   * - **Mean value**
     - ``MEAN``
     - [number]
     - 
   * - **Minimum value**
     - ``MIN``
     - [number]
     - 
   * - **Output**
     - ``OUTPUT_HTML_FILE``
     - [html]
     - The output file contains the following information:
       
       * Analyzed file: path of the raster layer
       * Minimum value: minimum value of the raster
       * Maximum value: maximum value of the raster
       * Range: difference between the maximum and minimum values
       * Sum: total sum of the values
       * Mean value: mean of the values
       * Standard deviation: standard deviation of the values
       * Sum of the squares: sum of the squared differences of
         each observation from the overall mean
       
   * - **Range**
     - ``RANGE``
     - [number]
     - 
   * - **Standard deviation**
     - ``STD_DEV``
     - [number]
     - 
   * - **Sum**
     - ``SUM``
     - [number]
     - 
   * - **Sum of the squares**
     - ``SUM_OF_SQUARES``
     - [number]
     - 


.. _qgisrasterlayeruniquevaluesreport:

Raster layer unique values report
---------------------------------
Returns the count and area of each unique value in a given raster
layer.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [raster]
     - Input raster layer
   * - **Band number**
     - ``BAND``
     - [raster band]
       
       Default: The first band of the input layer
     - If the raster is multiband, choose the band you want to get
       statistics for.
   * - **Unique values report**
     - ``OUTPUT_HTML_FILE``
     - [file]
       
       Default: ``[Save to temporary file]``
     - Specification of the output file:
       
       * Skip Output
       * Save to a Temporary File
       * Save to File...
       
       The file encoding can also be changed here.
   * - **Unique values table**
     - ``OUTPUT_TABLE``
     - [table]
       
       Default: ``[Skip output]``
     - Specification of the table for unique values:
       
       * Skip Output
       * Create Temporary Layer
       * Save to File...
       * Save to GeoPackage...
       * Save to PostGIS Table...
       
       The file encoding can also be changed here.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **CRS authority identifier**
     - ``CRS_AUTHID``
     - [crs]
     - 
   * - **Extent**
     - ``EXTENT``
     - [extent]
     - 
   * - **Height in pixels**
     - ``HEIGHT_IN_PIXELS``
     - [number]
     - 
   * - **NODATA pixel count**
     - ``NODATA_PIXEL_COUNT``
     - [number]
     - 
   * - **Total pixel count**
     - ``TOTAL_PIXEL_COUNT``
     - [number]
     - 
   * - **Unique values report**
     - ``OUTPUT_HTML_FILE``
     - [html]
     - The output HTML file contains the following information:
       
       * Analyzed file: the path of the raster layer
       * Extent: xmin, ymin, xmax, ymax coordinates of the extent
       * Projection: projection of the layer
       * Width in pixels: number of columns and pixel width size
       * Height in pixels: number of rows and pixel width size
       * Total pixel count: count of all the pixels
       * NODATA pixel count: count of pixels with NODATA value
   * - **Unique values table**
     - ``OUTPUT_TABLE``
     - [table]
     - A table with three columns:
         
       * *value*: pixel value
       * *count*: count of pixels with this value
       * *m*\ :sup:`2`: total area in square meters of pixels with
         this value.
       
   * - **Width in pixels**
     - ``WIDTH_IN_PIXELS``
     - [number]
     - 


<<<<<<< HEAD
.. _qgisreclassifybylayer:
=======
.. _qgisrasterlayerzonalstats:

Raster layer zonal statistics
----------------------------------
Calculates statistics for a raster layer's values, categorized by
zones defined in another raster layer.
>>>>>>> 80c67adea... Update the QGIS raster analysis algorithms - table for parameters (#5379)

Reclassify by layer
-------------------
Reclassifies a raster band by assigning new class values based on the ranges
specified in a vector table.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Raster layer**
     - ``INPUT_RASTER``
     - [raster]
     - Raster layer to reclassify
   * - **Band number**
     - ``RASTER_BAND``
     - [raster band]
       
       Default: The first band of the raster layer
     - If the raster is multiband, choose the band you want to
       reclassify.
   * - **Layer containing class breaks**
     - ``INPUT_TABLE``
     - [vector: any]
     - Vector layer containing the values to use for classification.
   * - **Minimum class value field**
     - ``MIN_FIELD``
     - [tablefield: numeric]
     - Field with the minimum value of the range for the class.
   * - **Maximum class value field**
     - ``MAX_FIELD``
     - [tablefield: numeric]
     - Field with the maximum value of the range for the class.
   * - **Output value field**
     - ``VALUE_FIELD``
     - [tablefield: numeric]
     - Field with the value that will be assigned to the pixels that
       fall in the class (between the corresponding min and max
       values).
   * - **Output no data value**
     - ``NO_DATA``
     - [number]
       
       Default: -9999.0
     - Value to apply to no data values.
   * - **Range boundaries**
     - ``RANGE_BOUNDARIES``
     - [enumeration]
       
       Default: 0
     - Defines comparison rules for the classification.
       Options:
       
       * 0 --- min < value <= max
       * 1 --- min <= value < max
       * 2 --- min <= value <= max
       * 3 --- min < value < max
       
   * - **Use no data when no range matches value**
     - ``NODATA_FOR_MISSING``
     - [boolean]
       
       Default: False
     - Values that do not belong to a class will result in the
       no data value.
       If False, the original value is kept.
   * - **Output data type**
     - ``DATA_TYPE``
     - [enumeration]
       
       Default: 5
     - Defines the data type of the output raster file.
       Options:
       
       * 0 --- Byte
       * 1 --- Int16
       * 2 --- UInt16
       * 3 --- UInt32
       * 4 --- Int32
       * 5 --- Float32
       * 6 --- Float64
       * 7 --- CInt16
       * 8 --- CInt32
       * 9 --- CFloat32
       * 10 --- CFloat64
       
   * - **Reclassified raster**
     - ``OUTPUT``
     - [raster]
     - Specification of the output raster. One of:
       
       * Save to a Temporary File
       * Save to File...
       
       The file encoding can also be changed here.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
<<<<<<< HEAD
   * - **Reclassified raster**
     - ``OUTPUT``
=======
   * - **CRS authority identifier**
     - ``CRS_AUTHID``
     - [crs]
     - 
   * - **Extent**
     - ``EXTENT``
     - [extent]
     - 
   * - **Height in pixels**
     - ``HEIGHT_IN_PIXELS``
     - [number]
     - 
   * - **NODATA pixel count**
     - ``NODATA_PIXEL_COUNT``
     - [number]
     - 
   * - **Statistics**
     - ``OUTPUT_TABLE``
     - [table]
     - The output layer contains the following information
       **for each zone**:
       
       * Area: the area in square raster units in the zone;
       * Sum: the total sum of the pixel values in the zone;
       * Count: the number of pixels in the zone;
       * Min: the minimum pixel value in the zone;
       * Max: the maximum pixel value in the zone;
       * Mean: the mean of the pixel values in the zone;
   * - **Total pixel count**
     - ``TOTAL_PIXEL_COUNT``
     - [number]
     - 
   * - **Width in pixels**
     - ``WIDTH_IN_PIXELS``
     - [number]
     - 


.. _qgisrastersurfacevolume:

Raster surface volume
--------------------------
Calculates the volume under a raster surface relative to a given base
level. This is mainly useful for Digital Elevation Models (DEM).

Parameters
..........
  
.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **INPUT layer**
     - ``INPUT``
>>>>>>> 80c67adea... Update the QGIS raster analysis algorithms - table for parameters (#5379)
     - [raster]
     - Output raster layer with reclassified band values


.. _qgisreclassifybytable:

Reclassify by table
-------------------
Reclassifies a raster band by assigning new class values based on the ranges
specified in a fixed table.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Raster layer**
     - ``INPUT_RASTER``
     - [raster]
     - Raster layer to reclassify
   * - **Band number**
     - ``RASTER_BAND``
     - [raster band]
       
       Default: The first band of the raster layer
     - If the raster is multiband, choose the band you want to
       reclassify.
   * - **Reclassification table**
     - ``TABLE``
     - [matrix]
     - A 3-columns table (formatted as a list of nine numbers)
       containing the values to use for class boundaries  (``Minimum``
       and ``Maximum``) and the new ``Value`` to assign to the band
       values that fall in the class.
   * - **Output no data value**
     - ``NO_DATA``
     - [number]
       
       Default: -9999.0
     - Value to use for nodata in the output
   * - **Range boundaries**
     - ``RANGE_BOUNDARIES``
     - [enumeration]
       
       Default: 0
     - Defines comparison rules for the classification.
       Options:
       
       * 0 --- min < value <= max
       * 1 --- min <= value < max
       * 2 --- min <= value <= max
       * 3 --- min < value < max
       
   * - **Use no data when no range matches value**
     - ``NODATA_FOR_MISSING``
     - [boolean]
       
       Default: False
     - Values that do not belong to a class will result in the
       no data value.
       If False, the original value is kept.
   * - **Output data type**
     - ``DATA_TYPE``
     - [enumeration]
       
       Default: 5
     - Defines the data type of the output raster file.
       Options:
       
       * 0 --- Byte
       * 1 --- Int16
       * 2 --- UInt16
       * 3 --- UInt32
       * 4 --- Int32
       * 5 --- Float32
       * 6 --- Float64
       * 7 --- CInt16
       * 8 --- CInt32
       * 9 --- CFloat32
       * 10 --- CFloat64
       
   * - **Reclassified raster**
     - ``OUTPUT``
     - [raster]
     - Specification of the output raster. One of:
       
       * Save to a Temporary File
       * Save to File...
       
       The file encoding can also be changed here.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Reclassified raster**
     - ``OUTPUT``
     - [raster]
     - Output raster layer with reclassified band values


<<<<<<< HEAD
=======
.. _qgisreclassifybytable:

Reclassify by table
-------------------
Reclassifies a raster band by assigning new class values based on
the ranges specified in a fixed table.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Raster layer**
     - ``INPUT_RASTER``
     - [raster]
     - Raster layer to reclassify
   * - **Band number**
     - ``RASTER_BAND``
     - [raster band]

       Default: 1
     - Raster band for which you want to recalculate values.
   * - **Reclassification table**
     - ``TABLE``
     - [table]
     - A 3-columns table to fill with the values to set the
       boundaries of each class (``Minimum`` and ``Maximum``) and
       the new ``Value`` to assign to the band values that fall in
       the class.
   * - **Output no data value**
     - ``NO_DATA``
     - [number]

       Default: -9999.0
     - Value to apply to no data values.
   * - **Range boundaries**
     - ``RANGE_BOUNDARIES``
     - [enumeration]

       Default: 0
     - Defines comparison rules for the classification.
       Options:

       * 0 --- min < value <= max
       * 1 --- min <= value < max
       * 2 --- min <= value <= max
       * 3 --- min < value < max

   * - **Use no data when no range matches value**
     - ``NODATA_FOR_MISSING``
     - [boolean]

       Default: False
     - Applies the no data value to band values that do
       not fall in any class.
       If False, the original value is kept.
   * - **Output data type**
     - ``DATA_TYPE``
     - [enumeration]

       Default: 5
     - Defines the format of the output raster file.

       Options:

       * 0 --- Byte
       * 1 --- Int16
       * 2 --- UInt16
       * 3 --- UInt32
       * 4 --- Int32
       * 5 --- Float32
       * 6 --- Float64
       * 7 --- CInt16
       * 8 --- CInt32
       * 9 --- CFloat32
       * 10 --- CFloat64

   * - **Reclassified raster**
     - ``OUTPUT``
     - [raster]

       Default: '[Save to temporary file]'
     - Specification of the output raster layer.
       One of:

       * Save to a Temporary File
       * Save to File...

       The file encoding can also be changed here

Outputs
.......

   * - **Reclassified raster**
     - ``OUTPUT``
     - [raster]

       Default: '[Save to temporary file]'
     - The output raster layer.


>>>>>>> 80c67adea... Update the QGIS raster analysis algorithms - table for parameters (#5379)
.. _qgisrastersampling:

Sample raster values
--------------------
Extracts raster values at the point locations. If the raster layer
is multiband, each band is sampled.

<<<<<<< HEAD
The attribute table of the resulting layer will have as many new columns
as there are bands in the raster layer.
=======
The attribute table of the resulting layer will have as many new
columns as the raster layer band count.
>>>>>>> 80c67adea... Update the QGIS raster analysis algorithms - table for parameters (#5379)

Parameters
..........

.. list-table::
   :header-rows: 1
<<<<<<< HEAD
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Input Point Layer**
     - ``INPUT``
     - [vector: point]
     - Point vector layer in input to use for the sampling.
   * - **Raster Layer to sample**
     - ``RASTERCOPY``
     - [raster]
     - Raster layer to sample at input point layer locations.
   * - **Output column prefix**
     - ``COLUMN_PREFIX``
     - [string]
       
       Default: 'rvalue'
     - Prefix for the column(s) name.
   * - **Sampled Points**
     - ``OUTPUT``
     - [vector: point]
       
       Default: ``[Create temporary layer]``
     - Specify the output point vector layer for the sampled raster
       values.
       One of:
       
       * Create Temporary Layer (``TEMPORARY_OUTPUT``)
       * Save to File...
       * Save to Geopackage...
       * Save to PostGIS Table
       
=======
   :widths: 30 20 20 30
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Input Point Layer**
     - ``INPUT``
     - [vector: point]
     - Point vector layer to use for  sampling
   * - **Raster Layer to sample**
     - ``RASTERCOPY``
     - [raster]
     - Raster layer to sample at the given point locations.
   * - **Output column prefix**
     - ``COLUMN_PREFIX``
     - [string]

       Default: 'rvalue'
     - Prefix for the names of the added columns.
   * - **Sampled Points**

       (Optional)
     - ``OUTPUT``
     - [vector: point]

       Default: ``[Create temporary layer]``
     - Specify the output layer containing the sampled values.
       One of:

       * Create Temporary Layer (``TEMPORARY_OUTPUT``)
       * Save to File...
       * Save to GeoPackage...
       * Save to PostGIS Table...

>>>>>>> 80c67adea... Update the QGIS raster analysis algorithms - table for parameters (#5379)
       The file encoding can also be changed here.

Outputs
.......

<<<<<<< HEAD
.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Sampled Points**
     - ``OUTPUT``
     - [vector: point]
     - Output point vector layer with additional column(s) containing
       the sampled raster values.
=======
   * - **Sampled Points**

       (Optional)
     - ``OUTPUT``
     - [vector: point]
     - The output layer containing the sampled values.
>>>>>>> 80c67adea... Update the QGIS raster analysis algorithms - table for parameters (#5379)


.. _qgiszonalhistogram:

Zonal histogram
---------------
Appends fields representing counts of each unique value from a raster
layer contained within zones defined as polygons.

The output layer attribute table will have as many fields as the
unique values of the raster layer that intersects the polygon(s).

.. figure:: img/raster_histogram.png
  :align: center

  Raster layer histogram example


Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0
<<<<<<< HEAD

   * - Label
     - Name
     - Type
     - Description
   * - **Raster layer**
     - ``INPUT_RASTER``
     - [raster]
     - Input raster layer
   * - **Band number**
     - ``RASTER_BAND``
     - [raster band]
       
       Default: The first band raster layer to sample
     - If the raster is multiband, choose the band to use for the
       zonal histogram.
   * - **Vector layer containing the zones**
     - ``INPUT_VECTOR``
     - [vector: polygon]
     - Polygon vector layer that defines the zones.
   * - **Output column prefix**
       
       Optional
     - ``COLUMN_PREFIX``
     - [string]
       
       Default: 'HISTO\_'
     - Prefix for output column name(s).
   * - **Output zones**
     - ``OUTPUT``
     - [vector: polygon]
       
       Default: ``[Create temporary layer]``
     - Specify the output polygon vector layer with count of raster
       values.
       One of:
       
       * Create Temporary Layer (``TEMPORARY_OUTPUT``)
       * Save to File...
       * Save to Geopackage...
       * Save to PostGIS Table
       
=======

   * - Label
     - Name
     - Type
     - Description
   * - **Raster layer**
     - ``INPUT_RASTER``
     - [raster]
     - Input raster layer.
   * - **Band number**
     - ``RASTER_BAND``
     - [raster band]
       
       Default: The first band of the input layer
     - If the raster is multiband, choose a band.
   * - **Vector layer containing zones**
     - ``INPUT_VECTOR``
     - [vector: polygon]
     - Vector polygon layer that defines the zones.
   * - **Output column prefix**
     - ``COLUMN_PREFIX``

       Optional
     - [string]

       Default: 'HISTO\_'
     - Prefix for the output columns names.
   * - **Output zones**
     - ``OUTPUT``
     - [vector: polygon]

       Default: ``[Create temporary layer]``
     - Specify the output vector polygon layer.
       One of:

       * Create Temporary Layer (``TEMPORARY_OUTPUT``)
       * Save to File...
       * Save to GeoPackage...
       * Save to PostGIS Table...

>>>>>>> 80c67adea... Update the QGIS raster analysis algorithms - table for parameters (#5379)
       The file encoding can also be changed here.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Output zones**
<<<<<<< HEAD
     - ``OUTPUT``
     - [vector: polygon]
     - Output polygon vector layer with count of raster values.
  
=======

       (Optional)
     - ``OUTPUT``
     - [vector: polygon]

       Default: ``[Create temporary layer]``
     - The output vector polygon layer.

>>>>>>> 80c67adea... Update the QGIS raster analysis algorithms - table for parameters (#5379)

.. _qgiszonalstatistics:

Zonal statistics
----------------
<<<<<<< HEAD
Calculates statistics of a raster layer for each feature of an overlapping
polygon vector layer.

.. warning:: No new output file will be created. The algorithm adds new
  columns to the input vector layer.
=======
Calculates statistics of a raster layer for each feature
of an overlapping polygon vector layer.

.. warning:: No new output file will be created.
   The algorithm adds new columns to the source vector
   layer.
>>>>>>> 80c67adea... Update the QGIS raster analysis algorithms - table for parameters (#5379)

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0
<<<<<<< HEAD

   * - Label
     - Name
     - Type
     - Description
   * - **Raster Layer**
     - ``INPUT_RASTER``
     - [raster]
     - Input raster layer
   * - **Band number**
     - ``RASTER_BAND``
     - [raster band]
       
       Default: The first band of the raster layer
     - If the raster is multiband, choose the band to use for the
       zonal histogram.
   * - **Vector layer containing the zones**
     - ``INPUT_VECTOR``
     - [vector: polygon]
     - Pologyn vector layer that defines the zones (and that will
       be updated with new statistics columns).
   * - **Output column prefix**
       
       Optional
     - ``COLUMN_PREFIX``
     - [string]
       
       Default: '_'
     - Prefix for the output column name(s).
   * - **Statistics to calculate**
     - ``STATS``
     - [enumeration] [list]
       
       Default: [0 1 2]
     - List of statistical operators for the output.
       The available operators are:
       
       * 0 -- Count
       * 1 -- Sum
       * 2 -- Mean
       * 3 -- Median
       * 4 -- St. dev.
       * 5 -- Min
       * 6 -- Max
       * 7 -- Range
       * 8 -- Minority
       * 9 -- Majority (mode)
       * 10 -- Variety
       * 11 -- Variance
       * 12 -- All

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Vector layer containing the zones**
     - ``INPUT_VECTOR``
     - [vector: polygon]
     - The input polygon vector layer with new fields added for the
       zone statistics.
=======

   * - Label
     - Name
     - Type
     - Description
   * - **Raster layer**
     - ``INPUT_RASTER``
     - [raster]
     - Input raster layer.
   * - **Raster band**
     - ``RASTER_BAND``
     - [raster band]
       
       Default: The first band of the input layer
     - If the raster is multiband, choose a band for the statistics.
   * - **Vector layer containing zones**
     - ``INPUT_VECTOR``
     - [vector: polygon]
     - Vector polygon layer that defines the zones.
   * - **Output column prefix**
     - ``COLUMN_PREFIX``
     - [string]

       Default: '_'
     - Prefix for the output columns names.
   * - **Statistics to calculate**
     - ``STATISTICS``
     - [enumeration] [list]

       Default: [0,1,2]
     - List of statistical operator for the output.
       Options:

       * 0 --- Count
       * 1 --- Sum
       * 2 --- Mean
       * 3 --- Median
       * 4 --- St. dev.
       * 5 --- Minimum
       * 6 --- Maximum
       * 7 --- Range
       * 8 --- Minority
       * 9 --- Majority
       * 10 --- Variety
       * 11 --- Variance

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Vector layer containing zones**
     - ``INPUT_VECTOR``
     - [vector: polygon]
     - The input zone vector layer with added statistics.

>>>>>>> 80c67adea... Update the QGIS raster analysis algorithms - table for parameters (#5379)
