Raster analysis
===============

.. only:: html

   .. contents::
      :local:
      :depth: 1

.. _qgisfuzzifyrastergaussianmembership:

Fuzzify raster (gaussian membership) |312|
------------------------------------------

Transforms an input raster to a fuzzified raster by assigning a membership
value to each pixel, using a Gaussian membership function.
Membership values range from 0 to 1. In the fuzzified raster, a value of 0 implies
no membership of the defined fuzzy set, whereas a value of 1 means full membership.
The gaussian membership function is defined as |gaussian_formula|, where *f1* is 
the spread and *f2* the midpoint.

.. figure:: img/gaussianimage.png
  :align: center
  
  Fuzzify raster example. Input raster source: Land Tirol - data.tirol.gv.at.

.. seealso:: :ref:`qgisfuzzifyrasterlargemembership` , :ref:`qgisfuzzifyrasterlinearmembership`

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
   * - **Input Raster**
     - ``INPUT``
     - [raster]
     - Input raster layer
   * - **Band Number**
     - ``BAND`` 
     - [raster band]
       
       Default: The first band of the raster layer
     - If the raster is multiband, choose the band that
       you want to fuzzify.
   * - **Function midpoint**
     - ``FUZZYMIDPOINT``
     - [number]

       Default: 10
     - Midpoint of the gaussian function
   * - **Function spread**
     - ``FUZZYSPREAD``
     - [number]

       Default: 0.01
     - Spread of the gaussian function
   * - **Fuzzified raster**
     - ``OUTPUT``
     - [same as input]
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
   * - **Fuzzified raster**
     - ``OUTPUT``
     - [same as input]
     - Output raster layer containing the result

   * - **CRS authority identifier**
     - ``CRS_AUTHID``
     - [crs]
     - The coordinate reference system of the output raster layer
   * - **CRS authority identifier**
     - ``EXTENT``
     - [extent]
     - The spatial extent of the output raster layer
   * - **Width in pixels**
     - ``WIDTH_IN_PIXELS``
     - [integer]
     - The width in pixels of the output raster layer
   * - **Height in pixels**
     - ``HEIGHT_IN_PIXELS``
     - [integer]
     - The height in pixels of the output raster layer
   * - **Total pixel count**
     - ``TOTAL_PIXEL_COUNT``
     - [integer]
     - The count of pixels in the output raster layer


.. _qgisfuzzifyrasterlargemembership:

Fuzzify raster (large membership) |312|
------------------------------------------

Transforms an input raster to a fuzzified raster by assigning a membership
value to each pixel, using a Large membership function.
Membership values range from 0 to 1. In the fuzzified raster, a value of 0 implies
no membership of the defined fuzzy set, whereas a value of 1 means full membership.
The large membership function is defined as |fuzzy_large_formula|, where *f1* is 
the spread and *f2* the midpoint.

.. seealso:: :ref:`qgisfuzzifyrastergaussianmembership`, :ref:`qgisfuzzifyrasterlinearmembership`

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
   * - **Input Raster**
     - ``INPUT``
     - [raster]
     - Input raster layer
   * - **Band Number**
     - ``BAND`` 
     - [raster band]
       
       Default: The first band of the raster layer
     - If the raster is multiband, choose the band that
       you want to fuzzify.
   * - **Function midpoint**
     - ``FUZZYMIDPOINT``
     - [number]

       Default: 10
     - Midpoint of the large function
   * - **Function spread**
     - ``FUZZYSPREAD``
     - [number]

       Default: 0.01
     - Spread of the large function
   * - **Fuzzified raster**
     - ``OUTPUT``
     - [same as input]
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
   * - **Fuzzified raster**
     - ``OUTPUT``
     - [same as input]
     - Output raster layer containing the result

   * - **CRS authority identifier**
     - ``CRS_AUTHID``
     - [crs]
     - The coordinate reference system of the output raster layer
   * - **CRS authority identifier**
     - ``EXTENT``
     - [extent]
     - The spatial extent of the output raster layer
   * - **Width in pixels**
     - ``WIDTH_IN_PIXELS``
     - [integer]
     - The width in pixels of the output raster layer
   * - **Height in pixels**
     - ``HEIGHT_IN_PIXELS``
     - [integer]
     - The height in pixels of the output raster layer
   * - **Total pixel count**
     - ``TOTAL_PIXEL_COUNT``
     - [integer]
     - The count of pixels in the output raster layer


.. _qgisfuzzifyrasterlinearmembership:

Fuzzify raster (linear membership) |312|
------------------------------------------

Transforms an input raster to a fuzzified raster by assigning a membership
value to each pixel, using a Linear membership function.
Membership values range from 0 to 1. In the fuzzified raster, a value of 0 implies
no membership of the defined fuzzy set, whereas a value of 1 means full membership.
The linear function is defined as |fuzzy_linear_formula|, where *a* is 
the low bound and *b* the high bound. This equation assigns membership values using
a linear transformation for pixel values between the low and high bounds. Pixels values
smaller than the low bound are given 0 membership whereas pixel values greater than the 
high bound are given 1 membership


.. seealso:: :ref:`qgisfuzzifyrasterlargemembership`, :ref:`qgisfuzzifyrastergaussianmembership`

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
   * - **Input Raster**
     - ``INPUT``
     - [raster]
     - Input raster layer
   * - **Band Number**
     - ``BAND`` 
     - [raster band]
       
       Default: The first band of the raster layer
     - If the raster is multiband, choose the band that
       you want to fuzzify.
   * - **Low fuzzy membership bound**
     - ``FUZZYLOWBOUND``
     - [number]

       Default: 10
     - Low bound of the linear function
   * - **High fuzzy membership bound**
     - ``FUZZYHIGHBOUND``
     - [number]

       Default: 0.01
     - High bound of the linear function
   * - **Fuzzified raster**
     - ``OUTPUT``
     - [same as input]
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
   * - **Fuzzified raster**
     - ``OUTPUT``
     - [same as input]
     - Output raster layer containing the result

   * - **CRS authority identifier**
     - ``CRS_AUTHID``
     - [crs]
     - The coordinate reference system of the output raster layer
   * - **CRS authority identifier**
     - ``EXTENT``
     - [extent]
     - The spatial extent of the output raster layer
   * - **Width in pixels**
     - ``WIDTH_IN_PIXELS``
     - [integer]
     - The width in pixels of the output raster layer
   * - **Height in pixels**
     - ``HEIGHT_IN_PIXELS``
     - [integer]
     - The height in pixels of the output raster layer
   * - **Total pixel count**
     - ``TOTAL_PIXEL_COUNT``
     - [integer]
     - The count of pixels in the output raster layer


.. _qgisrasterbooleanand:

Raster boolean AND
-----------------------
Calculates the boolean ``AND`` for a set of input rasters.
If all of the input rasters have a non-zero value for a pixel, that
pixel will be set to ``1`` in the output raster.
If any of the input rasters have ``0`` values for the pixel it will
be set to ``0`` in the output raster.

The reference layer parameter specifies an existing raster layer to
use as a reference when creating the output raster.
The output raster will have the same extent, CRS, and pixel dimensions
as this layer.

By default, a nodata pixel in ANY of the input layers will result in a
nodata pixel in the output raster.
If the :guilabel:`Treat nodata values as false` option is checked,
then nodata inputs will be treated the same as a ``0`` input value.

.. seealso:: :ref:`qgisrasterbooleanor`


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
   * - **Input layers**
     - ``INPUT``
     - [raster] [list]
     - List of input raster layers
   * - **Reference layer**
     - ``REF_LAYER``
     - [raster]
     - The reference layer to create the output layer
       from (extent, CRS, pixel dimensions)
   * - **Treat nodata values as false**
     - ``NODATA_AS_FALSE``
     - [boolean]

       Default: False
     - Treat nodata values in the input files as 0 when performing the
       operation
   * - **Output no data value**
     - ``NO_DATA``
     - [number]

       Default: -9999.0
     - Value to use for nodata in the output layer
   * - **Output data type**
     - ``DATA_TYPE``
     - [enumeration]

       Default: 5
     - Output raster data type. Options:

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

   * - **Output layer**
     - ``OUTPUT``
     - [raster]
     - Output raster layer

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
   * - **Extent**
     - ``EXTENT``
     - [extent]
     - The extent of the output raster layer
   * - **CRS authority identifier**
     - ``CRS_AUTHID``
     - [crs]
     - The coordinate reference system of the output raster layer
   * - **Width in pixels**
     - ``WIDTH_IN_PIXELS``
     - [integer]
     - The width in pixels of the output raster layer
   * - **Height in pixels**
     - ``HEIGHT_IN_PIXELS``
     - [integer]
     - The height in pixels of the output raster layer
   * - **Total pixel count**
     - ``TOTAL_PIXEL_COUNT``
     - [integer]
     - The count of pixels in the output raster layer
   * - **NODATA pixel count**
     - ``NODATA_PIXEL_COUNT``
     - [integer]
     - The count of nodata pixels in the output raster layer
   * - **True pixel count**
     - ``TRUE_PIXEL_COUNT``
     - [integer]
     - The count of True pixels (value = 1) in the output raster layer
   * - **False pixel count**
     - ``FALSE_PIXEL_COUNT``
     - [integer]
     - The count of False pixels (value = 0) in the output raster layer
   * - **Output layer**
     - ``OUTPUT``
     - [raster]
     - Output raster layer containing the result


.. _qgisrasterbooleanor:

Raster boolean OR
----------------------
Calculates the boolean ``OR`` for a set of input rasters.
If all of the input rasters have a zero value for a pixel, that
pixel will be set to ``0`` in the output raster.
If any of the input rasters have ``1`` values for the pixel it will
be set to ``1`` in the output raster.

The reference layer parameter specifies an existing raster layer to
use as a reference when creating the output raster.
The output raster will have the same extent, CRS, and pixel dimensions
as this layer.

By default, a nodata pixel in ANY of the input layers will result in a
nodata pixel in the output raster.
If the :guilabel:`Treat nodata values as false` option is checked,
then nodata inputs will be treated the same as a ``0`` input value.

.. seealso:: :ref:`qgisrasterbooleanand`


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
   * - **Input layers**
     - ``INPUT``
     - [raster] [list]
     - List of input raster layers
   * - **Reference layer**
     - ``REF_LAYER``
     - [raster]
     - The reference layer to create the output layer
       from (extent, CRS, pixel dimensions)
   * - **Treat nodata values as false**
     - ``NODATA_AS_FALSE``
     - [boolean]

       Default: False
     - Treat nodata values in the input files as 0 when performing the
       operation
   * - **Output no data value**
     - ``NO_DATA``
     - [number]

       Default: -9999.0
     - Value to use for nodata in the output layer
   * - **Output data type**
     - ``DATA_TYPE``
     - [enumeration]

       Default: 5
     - Output raster data type. Options:

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

   * - **Output layer**
     - ``OUTPUT``
     - [raster]
     - Output raster layer

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
   * - **Extent**
     - ``EXTENT``
     - [extent]
     - The extent of the output raster layer
   * - **CRS authority identifier**
     - ``CRS_AUTHID``
     - [crs]
     - The coordinate reference system of the output raster layer
   * - **Width in pixels**
     - ``WIDTH_IN_PIXELS``
     - [integer]
     - The width in pixels of the output raster layer
   * - **Height in pixels**
     - ``HEIGHT_IN_PIXELS``
     - [integer]
     - The height in pixels of the output raster layer
   * - **Total pixel count**
     - ``TOTAL_PIXEL_COUNT``
     - [integer]
     - The count of pixels in the output raster layer
   * - **NODATA pixel count**
     - ``NODATA_PIXEL_COUNT``
     - [integer]
     - The count of nodata pixels in the output raster layer
   * - **True pixel count**
     - ``TRUE_PIXEL_COUNT``
     - [integer]
     - The count of True pixels (value = 1) in the output raster layer
   * - **False pixel count**
     - ``FALSE_PIXEL_COUNT``
     - [integer]
     - The count of False pixels (value = 0) in the output raster layer
   * - **Output layer**
     - ``OUTPUT``
     - [raster]
     - Output raster layer containing the result


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
Calculates basic statistics from the values in a given band of the raster layer.
The output is loaded in the :menuselection:`Processing --> Results viewer` menu.

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
Returns the count and area of each unique value in a given raster layer.

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
       * Save to PostGIS Table......
       
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


.. _qgisrasterlayerzonalstats:

Raster layer zonal statistics
----------------------------------
Calculates statistics for a raster layer's values, categorized by zones defined in 
another raster layer.

.. seealso:: :ref:`qgiszonalstatistics`

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
   * - **Input Layer**
     - ``INPUT``
     - [raster]
     - Input raster layer
   * - **Band number**
     - ``BAND``
     - [raster band]
       
       Default: The first band of the raster layer
     - If the raster is multiband choose the band for
       which you want to calculate the statistics.
   * - **Zones layer**
     - ``ZONES``
     - [raster]
     - Raster layer defining zones.
       Zones are given by contiguous pixels having the same pixel
       value.
   * - **Zones band number**
     - ``ZONES_BAND``
     - [raster band]
       
       Default: The first band of the raster layer
     - If the raster is multiband, choose the band that defines
       the zones
   * - **Reference layer**
       
       Optional
     - ``REF_LAYER``
     - [enumeration]
       
       Default: 0
     - Raster layer used to calculate the centroids that will be
       used as reference when determining the zones in the output
       layer. One of:
       
       * 0 --- Input layer
       * 1 --- Zones layer
       
   * - **Statistics**
     - ``OUTPUT_TABLE``
     - [table]
     - Table with the calculated statistics

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
   * - **Statistics**
     - ``OUTPUT_TABLE``
     - [table]
     - The output layer contains the following information **for each zone**:
       
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
     - [raster]
     - Input raster, representing a surface
   * - **Band number**
     - ``BAND``
     - [raster band]
       
       Default: The first band of the raster layer
     - If the raster is multiband, choose the band that
       shall define the surface.
   * - **Base level**
     - ``LEVEL``
     - [number]
       
       Default: 0.0
     - Define a base or reference value.
       This base is used in the volume calculation according
       to the ``Method`` parameter (see below).
   * - **Method**
     - ``METHOD``
     - [enumeration]
       
       Default: 0
     - Define the method for the volume calculation given by
       the difference between the raster pixel value and the
       ``Base level``.  Options:
       
       * 0 --- Count Only Above Base Level: only pixels above
         the base level will add to the volume.
       * 1 --- Count Only Below Base Level: only pixels below
         the base level will add to the volume.
       * 2 --- Subtract Volumes Below Base level: pixels above
         the base level will add to the volume, pixels below
         the base level will subtract from the volume.
       * 3 --- Add Volumes Below Base level: Add the volume
         regardless whether the pixel is above or below the
         base level.
         This is equivalent to sum the absolute values of the
         difference between the pixel value and the base level.
   * - **Surface volume report**
     - ``OUTPUT_HTML_FILE``
     - [html]
       
       Default: ``[Save to temporary file]``
     - Specification of the output HTML report. One of:
       
       * Skip output
       * Save to Temporary File
       * Save to File...
      
       The file encoding can also be changed here.
   * - **Surface volume table**
     - ``OUTPUT_TABLE``
     - [table]
       
       Default: ``[Skip output]``
     - Specification of the output table. One of:
       
       * Skip output
       * Create Temporary Layer (``TEMPORARY_OUTPUT``)
       * Save to File...
       * Save to Geopackage...
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
   * - **Volume**
     - ``VOLUME``
     - [number]
     - The calculated volume
   * - **Area**
     - ``AREA``
     - [number]
     - The area in square map units
   * - **Pixel_count**
     - ``PIXEL_COUNT``
     - [number]
     - The total number of pixels that have been analyzed
   * - **Surface volume report**
     - ``OUTPUT_HTML_FILE``
     - [html]
     - The output report (containing volume, area and
       pixel count) in HTML format
   * - **Surface volume table**
     - ``OUTPUT_TABLE``
     - [table]
     - The output table (containing volume, area and
       pixel count)


.. _qgisreclassifybylayer:

Reclassify by layer
-------------------
Reclassifies a raster band by assigning new class values based on the
ranges specified in a vector table.

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
   * - **Reclassified raster**
     - ``OUTPUT``
     - [raster]
     - Output raster layer with reclassified band values


.. _qgisreclassifybytable:

Reclassify by table
-------------------
Reclassifies a raster band by assigning new class values based on the ranges
specified in a fixed table.

Parameters
..........

``Raster Layer`` [raster]
  Raster layer to reclassify.

``Band number`` [raster band]
  Band of the raster you want to recalculate values.

  Default: *1*

``Reclassification table`` [table]
  A 3-columns table to fill with the values to set the boundaries of each class
  (``Minimum`` and ``Maximum``) and the new ``Value`` to assign to the band
  values that fall in the class.

``Output no data value`` [number]
  Value to apply to no data values.

  Default: *-9999.0*

``Range boundaries`` [enumeration]
  Defines comparison rules to apply to values classification.

  Options:

  * 0 --- min < value <= max
  * 1 --- min <= value < max
  * 2 --- min <= value <= max
  * 3 --- min < value < max

  Default: *0*

``Use no data when no range matches`` [boolean]
  Applies the no data value to band values that do not fall in any class.
  If False, the original value is kept.

  Default: *False*

``Output data type`` [enumeration]
  Defines the format of the output raster file.

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

  Default: *5*

Outputs
.......

``Reclassified raster`` [raster]
  Raster layer in output with reclassified band values.


.. _qgisrastersampling:

Sample raster values
--------------------
Extracts raster values at the point locations. If the raster layer is multiband,
each band is sampled.

The attribute table of the resulting layer will have as many new columns as the
raster layer band count.

Parameters
..........

``Input Point Layer`` [vector: point]
  Point vector layer in input to use for the sampling.

``Raster Layer to sample`` [raster]
  Raster layer with corresponding band(s) to sample at given point locations.

``Output column prefix`` [string]
  Prefix for the column(s) name.

  Default: ``rvalue``

Outputs
.......

``Sampled Points`` [vector: point]
  Layer in output with additional column(s) of sampled raster values.


.. _qgiszonalhistogram:

Zonal histogram
---------------
Appends fields representing counts of each unique value from a raster layer contained
within polygon features.

The output layer attribute table will have as many fields as the unique values
of the raster layer that intersects the polygon(s).

.. figure:: img/raster_histogram.png
  :align: center

  Raster layer histogram example


Parameters
..........

``Raster layer`` [raster]
  Raster layer in input.

``Band number`` [raster band]
  If the raster is multiband, choose the band you want to calculate the statistics.

``Vector layer containing the zones`` [vector: polygon]
  Overlaying vector layer where unique raster values will be appended.

``Output column prefix`` [string]
  Optional

  Prefix string for output columns.

Outputs
.......

``Output zones`` [vector: polygon]
  Output polygon vector layer with unique count of raster values.

.. _qgiszonalstatistics:

Zonal statistics
----------------
Calculates statistics of a raster layer for each feature of an overlapping polygon
vector layer.

.. warning:: No new output file will be created. The algorithm adds new columns
  to the source vector layer.

Parameters
..........

``Raster layer`` [raster]
  Raster layer in input.

``Band number`` [raster band]
  If the raster is multiband choose the band you want to calculate the statistics.

  Default: *1*

``Vector layer containing zones`` [vector: polygon]
  Polygon vector layer.

``Output column prefix`` [string]
  Prefix string for output columns.

  Default: ``_``

``Statistics to calculate`` [enumeration] [list]
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
.. |312| replace:: ``NEW in 3.12``
.. |gaussian_formula| image:: img/fuzzy_gaussian_formula.png
   :height: 1.5em
.. |fuzzy_large_formula| image:: img/fuzzy_large_formula.png
   :height: 3.2em
.. |fuzzy_linear_formula| image:: img/fuzzy_linear_formula.png
   :height: 3.2em   
  