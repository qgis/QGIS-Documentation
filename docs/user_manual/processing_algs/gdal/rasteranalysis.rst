Raster analysis
===============

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _gdalaspect:

Aspect
------

Generates an aspect map from any GDAL-supported elevation raster.
Aspect is the compass direction that a slope faces. The pixels will
have a value from 0-360° measured in degrees from north indicating the
azimuth.
On the northern hemisphere, the north side of slopes is often shaded
(small azimuth from 0°-90°), while the southern side receives more
solar radiation (higher azimuth from 180°-270°).

This algorithm is derived from the
`GDAL DEM utility <https://gdal.org/gdaldem.html>`_ .

**Default menu**: :menuselection:`Raster --> Analysis`

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
     - Input elevation raster layer
   * - **Band number**
     - ``BAND``
     - [raster band]

       Default: 1
     - The number of the band to use as elevation
   * - **Return trigonometric angle instead of azimuth**
     - ``TRIG_ANGLE``
     - [boolean]

       Default: False
     - Activating the trigonometric angle results in different
       categories: 0° (East), 90° (North), 180° (West), 270° (South).
   * - **Return 0 for flat instead of -9999**
     - ``ZERO_FLAT``
     - [boolean]

       Default: False
     - Activating this option will insert a 0-value for the value
       -9999 on flat areas.
   * - **Compute edges**
     - ``COMPUTE_EDGES``
     - [boolean]

       Default: False
     - Generates edges from the elevation raster
   * - **Use Zevenbergen&Thorne formula instead of the Horn's one**
     - ``ZEVENBERGEN``
     - [boolean]

       Default: False
     - Activates Zevenbergen&Thorne formula for smooth landscapes
   * - **Additional creation options**

       Optional
     - ``OPTIONS``
     - [string]

       Default: ''
     - For adding one or more creation options that control the
       raster to be created (colors, block size, file
       compression...).
       For convenience, you can rely on predefined profiles (see
       :ref:`GDAL driver options section <gdal_createoptions>`).
   * - **Additional command-line parameters**

       Optional
     - ``EXTRA``
     - [string]   

       Default: None
     - Add extra GDAL command line options
   * - **Aspect**
     - ``OUTPUT``
     - [raster]    

       Default: ``[Save to temporary file]``
     - Output raster layer. One of:

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
   * - **Aspect**
     - ``OUTPUT``
     - [raster]
     - Output raster with angle values in degrees

**Algorithm ID**: ``gdal:aspect``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalcolorrelief:

Color relief
------------
Generates a color relief map from any GDAL-supported elevation raster.
Color reliefs can particularly be used to depict elevations.
The Algorithm outputs a 4-band raster with values computed from the
elevation and a text-based color configuration file.
By default, the colors between the given elevation values are blended
smoothly and the result is a nice colorized elevation raster.

This algorithm is derived from the
`GDAL DEM utility <https://gdal.org/gdaldem.html>`_ .

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
     - Input elevation raster layer
   * - **Band number**
     - ``BAND``
     - [raster band]

       Default: 1
     - The number of the band to use as elevation
   * - **Compute edges**
     - ``COMPUTE_EDGES``
     - [boolean]

       Default: False
     - Generates edges from the elevation raster
   * - **Color configuration file**
     - ``COLOR_TABLE``
     - [file]
     - A text-based color configuration file
   * - **Matching mode**
     - ``MATCH_MODE``
     - [enumeration]

       Default: 2
     - One of:

       * 0 --- Use strict color matching
       * 1 --- Use closest RGBA quadruples
       * 2 --- Use smoothly blended colours

   * - **Additional creation options**

       Optional
     - ``OPTIONS``
     - [string]

       Default: ''
     - For adding one or more creation options that control the
       raster to be created (colors, block size, file
       compression...).
       For convenience, you can rely on predefined profiles (see
       :ref:`GDAL driver options section <gdal_createoptions>`).
   * - **Additional command-line parameters**

       Optional
     - ``EXTRA``
     - [string]   

       Default: None
     - Add extra GDAL command line options
   * - **Color relief**
     - ``OUTPUT``
     - [raster]    

       Default: ``[Save to temporary file]``
     - Output raster layer. One of:

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
   * - **Color relief**
     - ``OUTPUT``
     - [raster]
     - A 4-band output raster

**Algorithm ID**: ``gdal:colorrelief``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalfillnodata:

Fill nodata
-----------
Fill raster regions with no data values by interpolation from edges.
The values for the no-data regions are calculated by the sourrounding
pixel values using inverse distance weighting.
After the interpolation a smoothing of the results takes placce.
Input can be any GDAL-supported raster layer. This algorithm is
generally suitable for interpolating missing regions of fairly
continuously varying rasters (such as elevation models for instance).
It is also suitable for filling small holes and cracks in more
irregularly varying images (like airphotos).
It is generally not so great for interpolating a raster from sparse
point data.

This algorithm is derived from the
`GDAL fillnodata utility <https://gdal.org/gdal_fillnodata.html>`_ .

**Default menu**: :menuselection:`Raster --> Analysis`

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

       Default: 1
     - The band to operate on. Nodata values must be
       represented by the value 0.
   * - **Maximum distance (in pixels) to search out for values to interpolate**
     - ``DISTANCE``
     - [number]

       Default: 10
     - The number of pixels to search in all directions to find values
       to interpolate from
   * - **Number of smoothing iterations to run after the interpolation**
     - ``ITERATIONS``
     - [number]

       Default: 0
     - The number of 3x3 filter passes to run (0 or more) to smoothen
       the results of the interpolation.
   * - **Do not use default validity mask for the input band**
     - ``NO_MASK``
     - [boolean]

       Default: False
     - Activates the user-defined validity mask
   * - **Validity mask**
     - ``MASK_LAYER``
     - [raster]
     - A raster layer that defines the areas to fill.
   * - **Additional creation options**

       Optional
     - ``OPTIONS``
     - [string]

       Default: ''
     - For adding one or more creation options that control the
       raster to be created (colors, block size, file
       compression...).
       For convenience, you can rely on predefined profiles (see
       :ref:`GDAL driver options section <gdal_createoptions>`).
   * - **Additional command-line parameters**

       Optional
     - ``EXTRA``
     - [string]   

       Default: None
     - Add extra GDAL command line options
   * - **Filled**
     - ``OUTPUT``
     - [raster]    

       Default: ``[Save to temporary file]``
     - Specification of the output raster layer. One of:

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
   * - **Filled**
     - ``OUTPUT``
     - [raster]
     - Output raster

**Algorithm ID**: ``gdal:fillnodata``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalgriddatametrics:

Grid (Data metrics)
-------------------
Computes some data metrics using the specified window and output grid
geometry.

This algorithm is derived from the
`GDAL grid utility <https://gdal.org/gdal_grid.html>`_ .

**Default menu**: :menuselection:`Raster --> Analysis`

.. seealso:: `GDAL grid tutorial <https://gdal.org/tutorials/gdal_grid_tut.html>`_

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
   * - **Point layer**
     - ``INPUT``
     - [vector: point]
     - Input point vector layer
   * - **Data metric to use**
     - ``METRIC``
     - [enumeration]

       Default: 0
     - One of:

       * 0 --- Minimum, minimum value found in grid node search
         ellipse
       * 1 --- Maximum, maximum value found in grid node search
         ellipse
       * 2 --- Range, a difference between the minimum and maximum
         values found in grid node search ellipse
       * 3 --- Count, a number of data points found in grid node
         search ellipse
       * 4 --- Average distance, an average distance between the grid
         node (center of the search ellipse) and all of the data
         points found in grid node search ellipse
       * 5 --- Average distance between points, an average distance
         between the data points found in grid node search ellipse.
         The distance between each pair of points within ellipse
         is calculated and average of all distances is set as a
         grid node value

   * - **The first radius of search ellipse**
     - ``RADIUS_1``
     - [number]

       Default: 0.0
     - The first radius (X axis if rotation angle is 0) of
       the search ellipse
   * - **The second radius of search ellipse**
     - ``RADIUS_2``
     - [number]

       Default: 0.0
     - The second radius (Y axis if rotation angle is 0)
       of the search ellipse
   * - **Angle of search ellipse rotation in degrees (counter clockwise)**
     - ``ANGLE``
     - [number]

       Default: 0.0
     - Angle of ellipse rotation in degrees.
       Ellipse rotated counter clockwise.
   * - **Minimum number of data points to use**
     - ``MIN_POINTS``
     - [number]

       Default: 0.0
     - Minimum number of data points to average.
       If less amount of points found the grid node
       considered empty and will be filled with
       NODATA marker.
   * - **Nodata**
     - ``NODATA``
     - [number]

       Default: 0.0
     - No data marker to fill empty points
   * - **Z value from field**

       Optional
     - ``Z_FIELD``
     - [tablefield: numeric]
     - Field for the interpolation
   * - **Additional creation options**

       Optional
     - ``OPTIONS``
     - [string]

       Default: ''
     - For adding one or more creation options that control the
       raster to be created (colors, block size, file
       compression...).
       For convenience, you can rely on predefined profiles (see
       :ref:`GDAL driver options section <gdal_createoptions>`).
   * - **Additional command-line parameters**

       Optional
     - ``EXTRA``
     - [string]   

       Default: None
     - Add extra GDAL command line options
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

   * - **Interpolated (data metrics)**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specify the output raster layer with interpolated values.
       One of:

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
   * - **Interpolated (data metrics)**
     - ``OUTPUT``
     - [raster]
     - Output raster with interpolated values

**Algorithm ID**: ``gdal:griddatametrics``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalgridinversedistancenearestneighbor:

Grid (IDW with nearest neighbor searching)
------------------------------------------

Computes the Inverse Distance to a Power gridding combined to the
nearest neighbor method.
Ideal when a maximum number of data points to use is required.

This algorithm is derived from the
`GDAL grid utility <https://gdal.org/gdal_grid.html>`_ .

.. seealso:: `GDAL grid tutorial <https://gdal.org/tutorials/gdal_grid_tut.html>`_

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
   * - **Point layer**
     - ``INPUT``
     - [vector: point]
     - Input point vector layer
   * - **Weighting power**
     - ``POWER``
     - [number]

       Default: 2.0
     - Weighting power
   * - **Smoothing**
     - ``SMOOTHING``
     - [number]

       Default: 0.0
     - Smoothing parameter
   * - **The radius of the search circle**
     - ``RADIUS``
     - [number]

       Default: 1.0
     - The radius of the search circle
   * - **Maximum number of data points to use**
     - ``MAX_POINTS``
     - [number]

       Default: 12
     - Do not search for more points than this number.
   * - **Minimum number of data points to use**
     - ``MIN_POINTS``
     - [number]

       Default: 0
     - Minimum number of data points to average.
       If less amount of points found the grid node
       considered empty and will be filled with
       NODATA marker.
   * - **Nodata**
     - ``NODATA``
     - [number]

       Default: 0.0
     - No data marker to fill empty points
   * - **Z value from field**

       Optional
     - ``Z_FIELD``
     - [tablefield: numeric]
     - Field for the interpolation
   * - **Additional creation options**

       Optional
     - ``OPTIONS``
     - [string]

       Default: ''
     - For adding one or more creation options that control the
       raster to be created (colors, block size, file
       compression...).
       For convenience, you can rely on predefined profiles (see
       :ref:`GDAL driver options section <gdal_createoptions>`).
   * - **Additional command-line parameters**

       Optional
     - ``EXTRA``
     - [string]   

       Default: None
     - Add extra GDAL command line options
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

   * - **Interpolated (IDW with NN search)**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specify the output raster layer with interpolated values.
       One of:

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
   * - **Interpolated (IDW with NN search)**
     - ``OUTPUT``
     - [raster]
     - Output raster with interpolated values

**Algorithm ID**: ``gdal:gridinversedistancenearestneighbor``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalgridinversedistance:

Grid (Inverse distance to a power)
----------------------------------
The Inverse Distance to a Power gridding method is a weighted average
interpolator.

You should supply the input arrays with the scattered data values
including coordinates of every data point and output grid geometry.
The function will compute interpolated value for the given position in output grid.

This algorithm is derived from the
`GDAL grid utility <https://gdal.org/gdal_grid.html>`_ .

**Default menu**: :menuselection:`Raster --> Analysis`

.. seealso:: `GDAL grid tutorial <https://gdal.org/tutorials/gdal_grid_tut.html>`_


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
   * - **Point layer**
     - ``INPUT``
     - [vector: point]
     - Input point vector layer
   * - **Weighting power**
     - ``POWER``
     - [number]

       Default: 2.0
     - Weighting power
   * - **Smothing**
     - ``SMOOTHING``
     - [number]

       Default: 0.0
     - Smoothing parameter
   * - **The first radius of search ellipse**
     - ``RADIUS_1``
     - [number]

       Default: 0.0
     - The first radius (X axis if rotation angle is 0) of
       the search ellipse
   * - **The second radius of search ellipse**
     - ``RADIUS_2``
     - [number]

       Default: 0.0
     - The second radius (Y axis if rotation angle is 0)
       of the search ellipse
   * - **Angle of search ellipse rotation in degrees (counter clockwise)**
     - ``ANGLE``
     - [number]

       Default: 0.0
     - Angle of ellipse rotation in degrees.
       Ellipse rotated counter clockwise.
   * - **Maximum number of data points to use**
     - ``MAX_POINTS``
     - [number]

       Default: 0
     - Do not search for more points than this number.
   * - **Minimum number of data points to use**
     - ``MIN_POINTS``
     - [number]

       Default: 0
     - Minimum number of data points to average.
       If less amount of points found the grid node
       considered empty and will be filled with
       NODATA marker.
   * - **Nodata**
     - ``NODATA``
     - [number]

       Default: 0.0
     - No data marker to fill empty points
   * - **Z value from field**

       Optional
     - ``Z_FIELD``
     - [tablefield: numeric]
     - Field for the interpolation
   * - **Additional creation options**

       Optional
     - ``OPTIONS``
     - [string]

       Default: ''
     - For adding one or more creation options that control the
       raster to be created (colors, block size, file
       compression...).
       For convenience, you can rely on predefined profiles (see
       :ref:`GDAL driver options section <gdal_createoptions>`).
   * - **Additional command-line parameters**

       Optional
     - ``EXTRA``
     - [string]   

       Default: None
     - Add extra GDAL command line options
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

   * - **Interpolated (IDW)**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specify the output raster layer with interpolated values.
       One of:

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
   * - **Interpolated (IDW)**
     - ``OUTPUT``
     - [raster]
     - Output raster with interpolated values

**Algorithm ID**: ``gdal:gridinversedistance``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalgridlinear:

Grid (Linear)
-------------
The Linear method perform linear interpolation by computing a Delaunay
triangulation of the point cloud, finding in which triangle of the
triangulation the point is, and by doing linear interpolation from its
barycentric coordinates within the triangle.
If the point is not in any triangle, depending on the radius, the
algorithm will use the value of the nearest point or the NODATA value.

This algorithm is derived from the
`GDAL grid utility <https://gdal.org/gdal_grid.html>`_ .

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
   * - **Point layer**
     - ``INPUT``
     - [vector: point]
     - Input point vector layer
   * - **Search distance**
     - ``RADIUS``
     - [number]

       Default: -1.0
     - In case the point to be interpolated does not fit into a 
       triangle of the Delaunay triangulation, use that maximum
       distance to search a nearest neighbour, or use nodata
       otherwise.
       If set to ``-1``, the search distance is infinite.
       If set to ``0``, no data value will be used.
   * - **Nodata**
     - ``NODATA``
     - [number]

       Default: 0.0
     - No data marker to fill empty points
   * - **Z value from field**

       Optional
     - ``Z_FIELD``
     - [tablefield: numeric]
     - Field for the interpolation
   * - **Additional creation options**

       Optional
     - ``OPTIONS``
     - [string]

       Default: ''
     - For adding one or more creation options that control the
       raster to be created (colors, block size, file
       compression...).
       For convenience, you can rely on predefined profiles (see
       :ref:`GDAL driver options section <gdal_createoptions>`).
   * - **Additional command-line parameters**

       Optional
     - ``EXTRA``
     - [string]   

       Default: None
     - Add extra GDAL command line options
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

   * - **Interpolated (Linear)**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specify the output raster layer with interpolated values.
       One of:

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
   * - **Interpolated (Linear)**
     - ``OUTPUT``
     - [raster]
     - Output raster with interpolated values

**Algorithm ID**: ``gdal:gridlinear``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalgridaverage:

Grid (Moving average)
---------------------
The Moving Average is a simple data averaging algorithm.
It uses a moving window of elliptic form to search values and averages
all data points within the window.
Search ellipse can be rotated by specified angle, the center of
ellipse located at the grid node.
Also the minimum number of data points to average can be set, if there
are not enough points in window, the grid node considered empty and
will be filled with specified NODATA value.

This algorithm is derived from the
`GDAL grid utility <https://gdal.org/gdal_grid.html>`_ .

**Default menu**: :menuselection:`Raster --> Analysis`

.. seealso:: `GDAL grid tutorial <https://gdal.org/tutorials/gdal_grid_tut.html>`_

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
   * - **Point layer**
     - ``INPUT``
     - [vector: point]
     - Input point vector layer
   * - **The first radius of search ellipse**
     - ``RADIUS_1``
     - [number]

       Default: 0.0
     - The first radius (X axis if rotation angle is 0) of
       the search ellipse
   * - **The second radius of search ellipse**
     - ``RADIUS_2``
     - [number]

       Default: 0.0
     - The second radius (Y axis if rotation angle is 0)
       of the search ellipse
   * - **Angle of search ellipse rotation in degrees (counter clockwise)**
     - ``ANGLE``
     - [number]

       Default: 0.0
     - Angle of ellipse rotation in degrees.
       Ellipse rotated counter clockwise.
   * - **Minimum number of data points to use**
     - ``MIN_POINTS``
     - [number]

       Default: 0.0
     - Minimum number of data points to average.
       If less amount of points found the grid node
       considered empty and will be filled with
       NODATA marker.
   * - **Nodata**
     - ``NODATA``
     - [number]

       Default: 0.0
     - No data marker to fill empty points
   * - **Z value from field**

       Optional
     - ``Z_FIELD``
     - [tablefield: numeric]
     - Field for the interpolation
   * - **Additional creation options**

       Optional
     - ``OPTIONS``
     - [string]

       Default: ''
     - For adding one or more creation options that control the
       raster to be created (colors, block size, file
       compression...).
       For convenience, you can rely on predefined profiles (see
       :ref:`GDAL driver options section <gdal_createoptions>`).
   * - **Additional command-line parameters**

       Optional
     - ``EXTRA``
     - [string]   

       Default: None
     - Add extra GDAL command line options
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

   * - **Interpolated (moving average)**
     - ``OUTPUT``
     - [raster] 

       Default: ``[Save to temporary file]``
     - Specify the output raster layer. One of:

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
   * - **Interpolated (moving average)**
     - ``OUTPUT``
     - [raster]
     - Output raster with interpolated values

**Algorithm ID**: ``gdal:gridaverage``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalgridnearestneighbor:

Grid (Nearest neighbor)
-----------------------
The Nearest Neighbor method doesn't perform any interpolation or
smoothing, it just takes the value of nearest point found in grid node
search ellipse and returns it as a result.
If there are no points found, the specified NODATA value will be
returned.

This algorithm is derived from the
`GDAL grid utility <https://gdal.org/gdal_grid.html>`_ .

**Default menu**: :menuselection:`Raster --> Analysis`

.. seealso:: `GDAL grid tutorial <https://gdal.org/tutorials/gdal_grid_tut.html>`_

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
   * - **Point layer**
     - ``INPUT``
     - [vector: point]
     - Input point vector layer
   * - **The first radius of search ellipse**
     - ``RADIUS_1``
     - [number]

       Default: 0.0
     - The first radius (X axis if rotation angle is 0) of
       the search ellipse
   * - **The second radius of search ellipse**
     - ``RADIUS_2``
     - [number]

       Default: 0.0
     - The second radius (Y axis if rotation angle is 0)
       of the search ellipse
   * - **Angle of search ellipse rotation in degrees (counter clockwise)**
     - ``ANGLE``
     - [number]

       Default: 0.0
     - Angle of ellipse rotation in degrees.
       Ellipse rotated counter clockwise.
   * - **Nodata**
     - ``NODATA``
     - [number]

       Default: 0.0
     - No data marker to fill empty points
   * - **Z value from field**

       Optional
     - ``Z_FIELD``
     - [tablefield: numeric]
     - Field for the interpolation
   * - **Additional creation options**

       Optional
     - ``OPTIONS``
     - [string]

       Default: ''
     - For adding one or more creation options that control the
       raster to be created (colors, block size, file
       compression...).
       For convenience, you can rely on predefined profiles (see
       :ref:`GDAL driver options section <gdal_createoptions>`).
   * - **Additional command-line parameters**

       Optional
     - ``EXTRA``
     - [string]   

       Default: None
     - Add extra GDAL command line options
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

   * - **Interpolated (Nearest neighbour)**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specify the output raster layer with interpolated values.
       One of:

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
   * - **Interpolated (Nearest neighbour)**
     - ``OUTPUT``
     - [raster]
     - Output raster with interpolated values

**Algorithm ID**: ``gdal:gridnearestneighbor``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalhillshade:

Hillshade
---------
Outputs a raster with a nice shaded relief effect.
It’s very useful for visualizing the terrain.
You can optionally specify the azimuth and altitude of the light
source, a vertical exaggeration factor and a scaling factor to account
for differences between vertical and horizontal units.

This algorithm is derived from the
`GDAL DEM utility <https://gdal.org/gdaldem.html>`__ .

**Default menu**: :menuselection:`Raster --> Analysis`

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
     - Input Elevation raster layer
   * - **Band number**
     - ``BAND``
     - [raster band]

       Default: 1
     - Band containing the elevation information
   * - **Z factor (vertical exaggeration)**
     - ``Z_FACTOR``
     - [number]

       Default: 1.0
     - The factor exaggerates the height of the output elevation
       raster
   * - **Scale (ratio of vert. units to horiz.)**
     - ``SCALE``
     - [number]

       Default: 1.0
     - The ratio of vertical units to horizontal units
   * - **Azimuth of the light**
     - ``AZIMUTH``
     - [number]

       Default: 315.0
     - Defines the azimuth of the light shining on the elevation
       raster in degrees.
       If it comes from the top of the raster the value is 0, if it
       comes from the east it is 90 a.s.o.
   * - **Altitude of the light**
     - ``ALTITUDE``
     - [number]

       Default: 45.0
     - Defines the altitude of the light, in degrees.
       90 if the light comes from above the elevation raster, 0 if it
       is raking light.
   * - **Compute edges**
     - ``COMPUTE_EDGES``
     - [boolean]

       Default: False
     - Generates edges from the elevation raster
   * - **Use Zevenbergen&Thorne formula (instead of the Horn's one)**
     - ``ZEVENBERGEN``
     - [boolean]

       Default: False
     - Activates Zevenbergen&Thorne formula for smooth landscapes
   * - **Combined shading**
     - ``COMBINED``
     - [boolean]

       Default: False
     - 
   * - **Multidirectional shading**
     - ``MULTIDIRECTIONAL``
     - [boolean]

       Default: False
     - 
   * - **Additional creation options**

       Optional
     - ``OPTIONS``
     - [string]

       Default: ''
     - For adding one or more creation options that control the
       raster to be created (colors, block size, file
       compression...).
       For convenience, you can rely on predefined profiles (see
       :ref:`GDAL driver options section <gdal_createoptions>`).
   * - **Additional command-line parameters**

       Optional
     - ``EXTRA``
     - [string]   

       Default: None
     - Add extra GDAL command line options
   * - **Hillshade**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specify the output raster layer with interpolated values.
       One of:

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
   * - **Hillshade**
     - ``OUTPUT``
     - [raster]
     - Output raster with interpolated values

**Algorithm ID**: ``gdal:hillshade``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalnearblack:

Near black
----------
Converts nearly black/white borders to black.

This algorithm will scan an image and try to set all pixels that are
nearly or exactly black, white or one or more custom colors around the
collar to black or white.
This is often used to "fix up" lossy compressed airphotos so that
color pixels can be treated as transparent when mosaicking.

This algorithm is derived from the
`GDAL nearblack utility <https://gdal.org/nearblack.html>`_ .

**Default menu**: :menuselection:`Raster --> Analysis`

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
     - Input Elevation raster layer
   * - **How far from black (white)**
     - ``NEAR``
     - [number]

       Default: 15
     - Select how far from black, white or custom colors the pixel
       values can be and still considered near black, white or custom
       color.
   * - **Search for nearly white pixels instead of nearly black**
     - ``WHITE``
     - [boolean]

       Default: False
     - Search for nearly white (255) pixels instead of nearly black
       pixels
   * - **Additional creation options**

       Optional
     - ``OPTIONS``
     - [string]

       Default: ''
     - For adding one or more creation options that control the
       raster to be created (colors, block size, file
       compression...).
       For convenience, you can rely on predefined profiles (see
       :ref:`GDAL driver options section <gdal_createoptions>`).
   * - **Additional command-line parameters**

       Optional
     - ``EXTRA``
     - [string]   

       Default: None
     - Add extra GDAL command line options
   * - **Nearblack**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specify the output raster layer. One of:

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
   * - **Nearblack**
     - ``OUTPUT``
     - [raster]
     - Output raster

**Algorithm ID**: ``gdal:nearblack``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalproximity:

Proximity (raster distance)
---------------------------
Generates a raster proximity map indicating the distance from the
center of each pixel to the center of the nearest pixel identified as
a target pixel.
Target pixels are those in the source raster for which the raster
pixel value is in the set of target pixel values.

This algorithm is derived from the
`GDAL proximity utility <https://gdal.org/gdal_proximity.html>`_ .

**Default menu**: :menuselection:`Raster --> Analysis`

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
     - Input Elevation raster layer
   * - **Band number**
     - ``BAND``
     - [raster band]

       Default: 1
     - Band containing the elevation information
   * - **A list of pixel values in the source image to be considered target pixels**

       Optional
     - ``VALUES``
     - [string]

       Default: ''
     - A list of target pixel values in the source image
       to be considered target pixels.
       If not specified, all non-zero pixels will be
       considered target pixels.
   * - **Distance units**
     - ``UNITS``
     - [enumeration]

       Default: 1
     - Indicate whether distances generated should be in pixel
       or georeferenced coordinates. One of:

       * 0 --- Georeferenced coordinates
       * 1 --- Pixel coordinates

   * - **The maximum distance to be generated**

       Optional
     - ``MAX_DISTANCE``
     - [number]

       Default: 0.0
     - The maximum distance to be generated.
       The nodata value will be used for pixels beyond
       this distance.
       If a nodata value is not provided, the output
       band will be queried for its nodata value.
       If the output band does not have a nodata value,
       then the value 65535 will be used.
       Distance is interpreted according to the value of
       *Distance units*.
   * - **Value to be applied to all pixels that are within the maxdist of target pixels**

       Optional
     - ``REPLACE``
     - [number]

       Default: 0.0
     - Specify a value to be applied to all pixels that
       are closer than the maximum distance from target
       pixels (including the target pixels) instead of
       a distance value.
   * - **Nodata value to use for the destination proximity raster**

       Optional
     - ``NODATA``
     - [number]

       Default: 0.0
     - Specify the nodata value to use for the output raster
   * - **Additional creation options**

       Optional
     - ``OPTIONS``
     - [string]

       Default: ''
     - For adding one or more creation options that control the
       raster to be created (colors, block size, file
       compression...).
       For convenience, you can rely on predefined profiles (see
       :ref:`GDAL driver options section <gdal_createoptions>`).
   * - **Additional command-line parameters**

       Optional
     - ``EXTRA``
     - [string]   

       Default: None
     - Add extra GDAL command line options
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

   * - **Proximity map**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specify the output raster layer. One of:

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
   * - **Proximity map**
     - ``OUTPUT``
     - [raster]
     - Output raster

**Algorithm ID**: ``gdal:proximity``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalroughness:

Roughness
---------
Outputs a single-band raster with values computed from the elevation.
Roughness is the degree of irregularity of the surface.
It's calculated by the largest inter-cell difference of a central
pixel and its surrounding cell.
The determination of the roughness plays a role in the analysis of
terrain elevation data, it's useful for calculations of the river
morphology, in climatology and physical geography in general.

This algorithm is derived from the
`GDAL DEM utility <https://gdal.org/gdaldem.html>`_ .

**Default menu**: :menuselection:`Raster --> Analysis`

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
     - Input elevation raster layer
   * - **Band number**
     - ``BAND``
     - [raster band]

       Default: 1
     - The number of the band to use as elevation
   * - **Compute edges**
     - ``COMPUTE_EDGES``
     - [boolean]

       Default: False
     - Generates edges from the elevation raster
   * - **Additional creation options**

       Optional
     - ``OPTIONS``
     - [string]

       Default: ''
     - For adding one or more creation options that control the
       raster to be created (colors, block size, file
       compression...).
       For convenience, you can rely on predefined profiles (see
       :ref:`GDAL driver options section <gdal_createoptions>`).
   * - **Roughness**
     - ``OUTPUT``
     - [raster]    

       Default: ``[Save to temporary file]``
     - Specify the output raster layer. One of:

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
   * - **Roughness**
     - ``OUTPUT``
     - [raster]
     - Single-band output roughness raster.
       The value -9999 is used as nodata value.

**Algorithm ID**: ``gdal:roughness``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalsieve:

Sieve
-----
Removes raster polygons smaller than a provided threshold size (in
pixels) and replaces them with the pixel value of the largest
neighbour polygon.
It is useful if you have a large amount of small areas on your raster
map.

This algorithm is derived from the
`GDAL sieve utility <https://gdal.org/gdal_sieve.html>`_ .

**Default menu**: :menuselection:`Raster --> Analysis`

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
     - Input elevation raster layer
   * - **Threshold**
     - ``THRESHOLD``
     - [number]

       Default: 10
     - Only raster polygons smaller than this size
       will be removed
   * - **Use 8-connectedness**
     - ``EIGHT_CONNECTEDNESS``
     - [boolean]

       Default: False
     - Use eight connectedness instead of four connectedness
   * - **Do not use the default validity mask for the input band**
     - ``NO_MASK``
     - [boolean]

       Default: False
     - 
   * - **Validity mask**

       Optional
     - ``MASK_LAYER``
     - [raster]
     - Validity mask to use instead of the default
   * - **Additional command-line parameters**

       Optional
     - ``EXTRA``
     - [string]   

       Default: None
     - Add extra GDAL command line options
   * - **Sieved**
     - ``OUTPUT``
     - [raster]    

       Default: ``[Save to temporary file]``
     - Specify the output raster layer. One of:

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
   * - **Sieved**
     - ``OUTPUT``
     - [raster]
     - Output raster layer.

**Algorithm ID**: ``gdal:sieve``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalslope:

Slope
-----
Generates a slope map from any GDAL-supported elevation raster.
Slope is the angle of inclination to the horizontal. 
You have the option of specifying the type of slope value you want:
degrees or percent slope.

This algorithm is derived from the
`GDAL DEM utility <https://gdal.org/gdaldem.html>`_ .

**Default menu**: :menuselection:`Raster --> Analysis`

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
     - Input Elevation raster layer
   * - **Band number**
     - ``BAND``
     - [raster band]

       Default: 1
     - Band containing the elevation information
   * - **Ratio of vertical units to horizontal**
     - ``SCALE``
     - [number]

       Default: 1.0
     - The ratio of vertical units to horizontal units
   * - **Slope expressed as percent (instead of degrees)**
     - ``AS_PERCENT``
     - [boolean]

       Default: False
     - Express slope as percent instead of degrees
   * - **Compute edges**
     - ``COMPUTE_EDGES``
     - [boolean]

       Default: False
     - Generates edges from the elevation raster
   * - **Use Zevenbergen&Thorne formula (instead of the Horn's one)**
     - ``ZEVENBERGEN``
     - [boolean]

       Default: False
     - Activates Zevenbergen&Thorne formula for smooth landscapes
   * - **Additional creation options**

       Optional
     - ``OPTIONS``
     - [string]

       Default: ''
     - For adding one or more creation options that control the
       raster to be created (colors, block size, file
       compression...).
       For convenience, you can rely on predefined profiles (see
       :ref:`GDAL driver options section <gdal_createoptions>`).
   * - **Additional command-line parameters**

       Optional
     - ``EXTRA``
     - [string]   

       Default: None
     - Add extra GDAL command line options
   * - **Slope**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specify the output raster layer. One of:

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
   * - **Slope**
     - ``OUTPUT``
     - [raster]
     - Output raster

**Algorithm ID**: ``gdal:slope``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdaltriterrainruggednessindex:

Terrain Ruggedness Index (TRI)
------------------------------
Outputs a single-band raster with values computed from the
elevation.
TRI stands for Terrain Ruggedness Index, which is defined
as the mean difference between a central pixel and its
surrounding cells.

This algorithm is derived from the
`GDAL DEM utility <https://gdal.org/gdaldem.html>`_ .

**Default menu**: :menuselection:`Raster --> Analysis`

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
     - Input elevation raster layer
   * - **Band number**
     - ``BAND``
     - [raster band]

       Default: 1
     - The number of the band to use as elevation
   * - **Compute edges**
     - ``COMPUTE_EDGES``
     - [boolean]

       Default: False
     - Generates edges from the elevation raster
   * - **Additional creation options**

       Optional
     - ``OPTIONS``
     - [string]

       Default: ''
     - For adding one or more creation options that control the
       raster to be created (colors, block size, file
       compression...).
       For convenience, you can rely on predefined profiles (see
       :ref:`GDAL driver options section <gdal_createoptions>`).
   * - **Terrain Ruggedness Index**
     - ``OUTPUT``
     - [raster]    

       Default: ``[Save to temporary file]``
     - Specify the output raster layer. One of:

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
   * - **Terrain Ruggedness Index**
     - ``OUTPUT``
     - [raster]
     - Output ruggedness raster.
       The value -9999 is used as nodata value.

**Algorithm ID**: ``gdal:triterrainruggednessindex``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdaltpitopographicpositionindex:

Topographic Position Index (TPI)
--------------------------------
Outputs a single-band raster with values computed from the elevation.
TPI stands for Topographic Position Index, which is defined as the
difference between a central pixel and the mean of its surrounding
cells.

This algorithm is derived from the
`GDAL DEM utility <https://gdal.org/gdaldem.html>`_ .

**Default menu**: :menuselection:`Raster --> Analysis`

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
     - Input elevation raster layer
   * - **Band number**
     - ``BAND``
     - [raster band]

       Default: 1
     - The number of the band to use for elevation values
   * - **Compute edges**
     - ``COMPUTE_EDGES``
     - [boolean]

       Default: False
     - Generates edges from the elevation raster
   * - **Additional creation options**

       Optional
     - ``OPTIONS``
     - [string]

       Default: ''
     - For adding one or more creation options that control the
       raster to be created (colors, block size, file
       compression...).
       For convenience, you can rely on predefined profiles (see
       :ref:`GDAL driver options section <gdal_createoptions>`).
   * - **Terrain Ruggedness Index**
     - ``OUTPUT``
     - [raster]    

       Default: ``[Save to temporary file]``
     - Specify the output raster layer. One of:

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
   * - **Terrain Ruggedness Index**
     - ``OUTPUT``
     - [raster]
     - Output raster.

**Algorithm ID**: ``gdal:tpitopographicpositionindex``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**
