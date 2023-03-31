Raster Creation
===============

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _qgiscreateconstantrasterlayer:

Create constant raster layer
----------------------------

Generates raster layer for given extent and cell size filled
with the specified value.

Additionally an output data type can be specified.
The algorithm will abort if a value has been entered that
cannot be represented by the selected output raster data type.

Parameters
..........

Basic parameters
^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Desired extent**
     - ``EXTENT``
     - [extent]
     - Specify the spatial extent of the output raster layer.
       It will internally be extended to a multiple of the tile size.

       .. include:: ../algs_include.rst
          :start-after: **extent_options**
          :end-before: **end_extent_options**

   * - **Target CRS**
     - ``TARGET_CRS``
     - [crs]

       Default: Project CRS
     - CRS for the output raster layer
   * - **Pixel size**
     - ``PIXEL_SIZE``
     - [number]

       Default: 0.1
     - Pixel size (X=Y) in map units. Minimum value: 0.01
   * - **Constant value**
     - ``NUMBER``
     - [number]

       Default: 1
     - Constant pixel value for the output raster layer.
   * - **Constant**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specification of the output raster. One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output raster data type**
     - ``OUTPUT_TYPE``

       Default: 5
     - [enumeration]
     - Defines the data type of the output raster file. Options:

       * 0 --- Byte
       * 1 --- Integer16
       * 2 --- Unsigned Integer16
       * 3 --- Integer32
       * 4 --- Unsigned Integer32
       * 5 --- Float32
       * 6 --- Float64

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Constant**
     - ``OUTPUT``
     - [raster]
     - Raster covering the desired extent with the specified pixel
       size and value.

Python code
...........

**Algorithm ID**: ``native:createconstantrasterlayer``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgiscreaterandombinomialrasterlayer:

Create random raster layer (binomial distribution)
---------------------------------------------------

Generates a raster layer for given extent and cell size filled with binomially
distributed random values.

By default, the values will be chosen given an N of 10 and a probability of 0.5.
This can be overridden by using the advanced parameter for N and probability.
The raster data type is set to Integer types (Integer16 by default).
The binomial distribution random values are defined as positive integer numbers.
A floating point raster will represent a cast of integer values to floating point.

Parameters
..........

Basic parameters
^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Desired extent**
     - ``EXTENT``
     - [extent]
     - Specify the spatial extent of the output raster layer.
       It will internally be extended to a multiple of the tile size.

       .. include:: ../algs_include.rst
          :start-after: **extent_options**
          :end-before: **end_extent_options**

   * - **Target CRS**
     - ``TARGET_CRS``
     - [crs]

       Default: Project CRS
     - CRS for the output raster layer
   * - **Pixel size**
     - ``PIXEL_SIZE``
     - [number]

       Default: 0.1
     - Pixel size (X=Y) in map units. Minimum value: 0.01
   * - **Output raster**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specification of the output raster. One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output raster data type**
     - ``OUTPUT_TYPE``

       Default: 0
     - [enumeration]
     - Defines the data type of the output raster file. Options:

       * 0 --- Integer16
       * 1 --- Unsigned Integer16
       * 2 --- Integer32
       * 3 --- Unsigned Integer32
       * 4 --- Float32
       * 5 --- Float64
   * - **N**
     - ``N``
     - [number]

       Default: 10
     -
   * - **Probability**
     - ``PROBABILITY``
     - [number]

       Default: 0.5
     -

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output raster**
     - ``OUTPUT``
     - [raster]
     - Raster covering the desired extent with the cell
       size filled with random values

Python code
...........

**Algorithm ID**: ``native:createrandombinomialrasterlayer``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgiscreaterandomexponentialrasterlayer:

Create random raster layer (exponential distribution)
------------------------------------------------------

Generates a raster layer for given extent and cell size filled
with exponentially distributed random values.

By default, the values will be chosen given a lambda of 1.0.
This can be overridden by using the advanced parameter for lambda.
The raster data type is set to Float32 by default as the exponential 
distribution random values are floating point numbers.

Parameters
..........

Basic parameters
^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Desired extent**
     - ``EXTENT``
     - [extent]
     - Specify the spatial extent of the output raster layer.
       It will internally be extended to a multiple of the tile size.

       .. include:: ../algs_include.rst
          :start-after: **extent_options**
          :end-before: **end_extent_options**

   * - **Target CRS**
     - ``TARGET_CRS``
     - [crs]

       Default: Project CRS
     - CRS for the output raster layer
   * - **Pixel size**
     - ``PIXEL_SIZE``
     - [number]

       Default: 1.0
     - Pixel size (X=Y) in map units. Minimum value: 0.01
   * - **Output raster**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specification of the output raster. One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output raster data type**
     - ``OUTPUT_TYPE``

       Default: 0
     - [enumeration]
     - Defines the data type of the output raster file. Options:

       * 0 --- Float32
       * 1 --- Float64
   * - **Lambda**
     - ``LAMBDA``
     - [number]

       Default: 1.0
     -

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output raster**
     - ``OUTPUT``
     - [raster]
     - Raster covering the desired extent with the cell
       size filled with random values

Python code
...........

**Algorithm ID**: ``native:createrandomexponentialrasterlayer``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgiscreaterandomgammarasterlayer:

Create random raster layer (gamma distribution)
-----------------------------------------------

Generates a raster layer for given extent and cell size filled
with gamma distributed random values.

By default, the values will be chosen given an alpha and beta value of 1.0.
This can be overridden by using the advanced parameter for alpha and beta.
The raster data type is set to Float32 by default as the gamma distribution
random values are floating point numbers.

Parameters
..........

Basic parameters
^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Desired extent**
     - ``EXTENT``
     - [extent]
     - Specify the spatial extent of the output raster layer.
       It will internally be extended to a multiple of the tile size.

       .. include:: ../algs_include.rst
          :start-after: **extent_options**
          :end-before: **end_extent_options**

   * - **Target CRS**
     - ``TARGET_CRS``
     - [crs]

       Default: Project CRS
     - CRS for the output raster layer
   * - **Pixel size**
     - ``PIXEL_SIZE``
     - [number]

       Default: 1.0
     - Pixel size (X=Y) in map units. Minimum value: 0.01
   * - **Output raster**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specification of the output raster. One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output raster data type**
     - ``OUTPUT_TYPE``

       Default: 0
     - [enumeration]
     - Defines the data type of the output raster file. Options:

       * 0 --- Float32
       * 1 --- Float64
   * - **Alpha**
     - ``ALPHA``
     - [number]

       Default: 1.0
     -
   * - **Beta**
     - ``BETA``
     - [number]

       Default: 1.0
     -

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output raster**
     - ``OUTPUT``
     - [raster]
     - Raster covering the desired extent with the cell
       size filled with randomly distributed values

Python code
...........

**Algorithm ID**: ``native:createrandomgammarasterlayer``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgiscreaterandomgeometricrasterlayer:

Create random raster layer (geometric distribution)
---------------------------------------------------

Generates a raster layer for given extent and cell size filled
with geometrically distributed random values.

By default, the values will be chosen given a probability of 0.5.
This can be overridden by using the advanced parameter for mean value.
The raster data type is set to Integer types (Integer16 by default).
The geometric distribution random values are defined as positive integer numbers.
A floating point raster will represent a cast of integer values to floating point.

Parameters
..........

Basic parameters
^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Desired extent**
     - ``EXTENT``
     - [extent]
     - Specify the spatial extent of the output raster layer.
       It will internally be extended to a multiple of the tile size.

       .. include:: ../algs_include.rst
          :start-after: **extent_options**
          :end-before: **end_extent_options**

   * - **Target CRS**
     - ``TARGET_CRS``
     - [crs]

       Default: Project CRS
     - CRS for the output raster layer
   * - **Pixel size**
     - ``PIXEL_SIZE``
     - [number]

       Default: 1.0
     - Pixel size (X=Y) in map units. Minimum value: 0.01
   * - **Output raster**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specification of the output raster. One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output raster data type**
     - ``OUTPUT_TYPE``

       Default: 0
     - [enumeration]
     - Defines the data type of the output raster file. Options:

       * 0 --- Integer16
       * 1 --- Unsigned Integer16
       * 2 --- Integer32
       * 3 --- Unsigned Integer32
       * 4 --- Float32
       * 5 --- Float64
   * - **Probability**
     - ``PROBABILITY``
     - [number]

       Default: 0.5
     -

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output raster**
     - ``OUTPUT``
     - [raster]
     - Raster covering the desired extent with the cell
       size filled with randomly distributed values

Python code
...........

**Algorithm ID**: ``native:createrandomgeometricrasterlayer``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgiscreaterandomnegativebinomialrasterlayer:

Create random raster layer (negative binomial distribution)
-----------------------------------------------------------

Generates a raster layer for given extent and cell size filled
with negative binomially distributed random values.

By default, the values will be chosen given a distribution parameter k of 10.0
and a probability of 0.5. This can be overridden by using the advanced parameters
for k and probability. The raster data type is set to Integer types (Integer16 by default).
The negative binomial distribution random values are defined as positive integer numbers.
A floating point raster will represent a cast of integer values to floating point.

Parameters
..........

Basic parameters
^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Desired extent**
     - ``EXTENT``
     - [extent]
     - Specify the spatial extent of the output raster layer.
       It will internally be extended to a multiple of the tile size.

       .. include:: ../algs_include.rst
          :start-after: **extent_options**
          :end-before: **end_extent_options**

   * - **Target CRS**
     - ``TARGET_CRS``
     - [crs]

       Default: Project CRS
     - CRS for the output raster layer
   * - **Pixel size**
     - ``PIXEL_SIZE``
     - [number]

       Default: 1.0
     - Pixel size (X=Y) in map units. Minimum value: 0.01
   * - **Output raster**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specification of the output raster. One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output raster data type**
     - ``OUTPUT_TYPE``

       Default: 0
     - [enumeration]
     - Defines the data type of the output raster file. Options:

       * 0 --- Integer16
       * 1 --- Unsigned Integer16
       * 2 --- Integer32
       * 3 --- Unsigned Integer32
       * 4 --- Float32
       * 5 --- Float64
   * - **Distribution parameter k**
     - ``K_PARAMETER``
     - [number]

       Default: 10
     -
   * - **Probability**
     - ``PROBABILITY``
     - [number]

       Default: 0.5
     -

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output raster**
     - ``OUTPUT``
     - [raster]
     - Raster covering the desired extent with the cell
       size filled with randomly distributed values

Python code
...........

**Algorithm ID**: ``native:createrandomnegativebinomialrasterlayer``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgiscreaterandomnormalrasterlayer:

Create random raster layer (normal distribution)
------------------------------------------------

Generates a raster layer for given extent and cell size filled
with normally distributed random values.

By default, the values will be chosen given a mean of 0.0 and a standard deviation of 1.0.
This can be overridden by using the advanced parameters for mean and standard
deviation value. The raster data type is set to Float32 by default as the normal
distribution random values are floating point numbers.

Parameters
..........

Basic parameters
^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Desired extent**
     - ``EXTENT``
     - [extent]
     - Specify the spatial extent of the output raster layer.
       It will internally be extended to a multiple of the tile size.

       .. include:: ../algs_include.rst
          :start-after: **extent_options**
          :end-before: **end_extent_options**

   * - **Target CRS**
     - ``TARGET_CRS``
     - [crs]

       Default: Project CRS
     - CRS for the output raster layer
   * - **Pixel size**
     - ``PIXEL_SIZE``
     - [number]

       Default: 1.0
     - Pixel size (X=Y) in map units. Minimum value: 0.01
   * - **Output raster**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specification of the output raster. One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output raster data type**
     - ``OUTPUT_TYPE``

       Default: 0
     - [enumeration]
     - Defines the data type of the output raster file. Options:

       * 0 --- Float32
       * 1 --- Float64
   * - **Mean of normal distribution**
     - ``MEAN``
     - [number]

       Default: 0.0
     -
   * - **Standard deviation of normal distribution**
     - ``STDDEV``
     - [number]

       Default: 1.0
     -

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output raster**
     - ``OUTPUT``
     - [raster]
     - Raster covering the desired extent with the cell
       size filled with randomly distributed values

Python code
...........

**Algorithm ID**: ``native:createrandomnormalrasterlayer``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgiscreaterandompoissonrasterlayer:

Create random raster layer (poisson distribution)
-------------------------------------------------

Generates a raster layer for given extent and cell size filled
with poisson distributed random values.

By default, the values will be chosen given a mean of 1.0.
This can be overridden by using the advanced parameter for mean value.
The raster data type is set to Integer types (Integer16 by default).
The poisson distribution random values are positive integer numbers.
A floating point raster will represent a cast of integer values to floating point.

Parameters
..........

Basic parameters
^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Desired extent**
     - ``EXTENT``
     - [extent]
     - Specify the spatial extent of the output raster layer.
       It will internally be extended to a multiple of the tile size.

       .. include:: ../algs_include.rst
          :start-after: **extent_options**
          :end-before: **end_extent_options**

   * - **Target CRS**
     - ``TARGET_CRS``
     - [crs]

       Default: Project CRS
     - CRS for the output raster layer
   * - **Pixel size**
     - ``PIXEL_SIZE``
     - [number]

       Default: 1.0
     - Pixel size (X=Y) in map units. Minimum value: 0.01
   * - **Output raster**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specification of the output raster. One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output raster data type**
     - ``OUTPUT_TYPE``

       Default: 0
     - [enumeration]
     - Defines the data type of the output raster file. Options:

       * 0 --- Integer16
       * 1 --- Unsigned Integer16
       * 2 --- Integer32
       * 3 --- Unsigned Integer32
       * 4 --- Float32
       * 5 --- Float64
   * - **Mean**
     - ``MEAN``
     - [number]

       Default: 1.0
     -

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output raster**
     - ``OUTPUT``
     - [raster]
     - Raster covering the desired extent with the cell
       size filled with randomly distributed values

Python code
...........

**Algorithm ID**: ``native:createrandompoissonrasterlayer``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgiscreaterandomuniformrasterlayer:

Create random raster layer (uniform distribution)
-------------------------------------------------

Generates a raster layer for given extent and cell size filled with random values.

By default, the values will range between the minimum and maximum value
of the specified output raster type. This can be overridden by using
the advanced parameters for lower and upper bound value.
If the bounds have the same value or both are zero (default) the algorithm
will create random values in the full value range of the chosen raster data type.
Choosing bounds outside the acceptable range of the output raster type
will abort the algorithm.

Parameters
..........

Basic parameters
^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Desired extent**
     - ``EXTENT``
     - [extent]
     - Specify the spatial extent of the output raster layer.
       It will internally be extended to a multiple of the tile size.

       .. include:: ../algs_include.rst
          :start-after: **extent_options**
          :end-before: **end_extent_options**

   * - **Target CRS**
     - ``TARGET_CRS``
     - [crs]

       Default: Project CRS
     - CRS for the output raster layer
   * - **Pixel size**
     - ``PIXEL_SIZE``
     - [number]

       Default: 1.0
     - Pixel size (X=Y) in map units. Minimum value: 0.01
   * - **Output raster**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specification of the output raster. One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output raster data type**
     - ``OUTPUT_TYPE``

       Default: 5
     - [enumeration]
     - Defines the data type of the output raster file. Options:

       * 0 --- Byte
       * 1 --- Integer16
       * 2 --- Unsigned Integer16
       * 3 --- Integer32
       * 4 --- Unsigned Integer32
       * 5 --- Float32
       * 6 --- Float64
   * - **Lower bound for random number range**
     - ``LOWER_BOUND``
     - [number]

       Default: 0.0
     -
   * - **Upper bound for random number range**
     - ``UPPER_BOUND``
     - [number]

       Default: 0.0
     -

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output raster**
     - ``OUTPUT``
     - [raster]
     - Raster covering the desired extent with the cell
       size filled with randomly distributed values

Python code
...........

**Algorithm ID**: ``native:createrandomuniformrasterlayer``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**

