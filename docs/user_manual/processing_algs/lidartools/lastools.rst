*******************************
LAStools algorithm provider
*******************************

`LAStools <https://rapidlasso.com/lastools/>`_ is a collection of
highly efficient, multicore command line tools for LiDAR data
processing.

.. only:: html

   .. contents::
      :local:
      :depth: 1

.. _lastoolsblast2dem:

blast2dem
---------

Description
...........

Turns points (up to billions) via seamless Delaunay triangulation
implemented using streaming into large elevation, intensity, or RGB
rasters.

For more info see the
`blast2dem <https://rapidlasso.com/blast/blast2dem>`_ page and
its online
`README <http://lastools.org/download/blast2dem_README.txt>`__ file.

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
   * - **verbose**
     - ``VERBOSE``
     - [boolean]

       Default: False
     - Generates more textual control output to the console
   * - **open LAStools GUI**
     - ``GUI``
     - [boolean]

       Default: False
     - Starts the GUI of LAStools with pre-populated input files
   * - **input LAS/LAZ file**
     - ``INPUT_LASLAZ``
     - [file]
     - The file containing the points to be rastered in
       LAS/LAZ format.
   * - **filter (by return, classification, flag)**
     - ``FILTER_RETURN_CLASS_FLAGS1``
     - [enumeration]

       Default: 0
     - Specifies which points to use to construct the temporary
       TIN that is then rasterized.
       One of:
       
       * 0 --- ---
       * 1 --- keep_last
       * 2 --- keep_first
       * 3 --- keep_middle
       * 4 --- keep_single
       * 5 --- drop_single
       * 6 --- keep_double
       * 7 --- keep_class 2
       * 8 --- keep_class 2 8
       * 9 --- keep_class 8
       * 10 --- keep_class 6
       * 11 --- keep_class 9
       * 12 --- keep_class 3 4 5
       * 13 --- keep_class 2 6
       * 14 --- drop_class 7
       * 15 --- drop_withheld
       * 16 --- drop_synthetic
       * 17 --- drop_overlap
       * 18 --- keep_withheld
       * 19 --- keep_synthetic
       * 20 --- keep_keypoint
       * 21 --- keep_overlap

   * - **step size / pixel size**
     - ``STEP``
     - [number]

       Default: 1.0
     - Specifies the size of the cells of the grid
       the TIN is rasterized onto
   * - **Attribute**
     - ``ATTRIBUTE``
     - [enumeration]

       Default: 0
     - Specifies the attribute that is to be rastered.
       One of:

       * 0 --- elevation
       * 1 --- slope
       * 2 --- intensity
       * 3 --- rgb

   * - **Product**
     - ``PRODUCT``
     - [enumeration]

       Default: 0
     - Specifies how the attribute is to be turned
       into raster values.
       One of:

       * 0 --- actual values
       * 1 --- hillshade
       * 2 --- gray
       * 3 --- false

   * - **Use tile bounding box (after tiling with buffer)**
     - ``USE_TILE_BB``
     - [boolean]

       Default: False
     - Specifies to limit the rastered area to the tile
       bounding box (only meaningful for input LAS/LAZ
       tiles that were created with lastile).
   * - **additional command line parameter(s)**

       Optional
     - ``ADDITIONAL_OPTIONS``
     - [string]

       Default: ''
     - Specifies other command-line switches not available
       via this menu but known to the (advanced) LAStools user.
   * - **Output raster file**
     - ``OUTPUT_RASTER``
     - [raster]

       Default: ``[Skip output]``
     - Specifies where the output raster is stored.
       Use image rasters like TIF, PNG, and JPG for false color,
       gray ramps, and hillshades.
       Use value rasters like TIF, BIL, IMG, ASC, DTM, FLT, XYZ,
       and CSV for actual values.
       One of:

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
   * - **Output raster file**
     - ``OUTPUT_RASTER``
     - [raster]
     - The output raster

Python code
...........

**Algorithm ID**: ``lastools:blast2dem``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _lastoolsblast2iso:

blast2iso
---------

Description
...........

Turns points (up to billions) via seamless Delaunay triangulation
implemented using streaming into iso-contour lines.

For more info see the
`blast2iso <https://rapidlasso.com/blast/blast2iso>`_ page and
its online
`README <http://lastools.org/download/blast2iso_README.txt>`__ file.

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
   * - **verbose**
     - ``VERBOSE``
     - [boolean]

       Default: False
     - Generates more textual control output to the console
   * - **open LAStools GUI**
     - ``GUI``
     - [boolean]

       Default: False
     - Starts the GUI of LAStools with pre-populated input files
   * - **input LAS/LAZ file**
     - ``INPUT_LASLAZ``
     - [file]
     - The file containing the points to be used for creating
       iso-contour lines.
   * - **smooth underlying TIN**
     - ``SMOOTH``
     - [number]

       Default: 0
     - Specifies if and with how many passes the temporary
       TIN should be smoothed
   * - **extract isoline with a spacing of**
     - ``ISO_EVERY``
     - [number]

       Default: 10.0
     - Specifies spacing at which iso-contour lines are getting
       extracted (contour interval)
   * - **clean isolines shorter than (0 = do not clean)**
     - ``CLEAN``
     - [number]

       Default: 0.0
     - Omits iso-contour lines that are shorter than the specified
       length
   * - **simplify segments shorter than (0 = do not simplify)**
     - ``SIMPLIFY_LENGTH``
     - [number]

       Default: 0.0
     - Rudimentary simplification of iso-contour line segments
       that are shorter than the specified length.
   * - **simplify segment pairs with area less than (0 = do not simplify)**
     - ``SIMPLIFY_AREA``
     - [number]

       Default: 0.0
     - Rudimentary simplification of bumps formed by
       consecutive line segments whose area is smaller than the
       specified size.
   * - **additional command line parameter(s)**

       Optional
     - ``ADDITIONAL_OPTIONS``
     - [string]

       Default: ''
     - Specifies other command-line switches not available
       via this menu but known to the (advanced) LAStools user.
   * - **Output vector file**
     - ``OUTPUT_VECTOR``
     - [vector: line]

       Default: ``[Skip output]``
     - Specifies where the output vector is stored.
       Use SHP or WKT output files.
       If your input LiDAR file is in geographic coordinates
       (long/lat) or has geo-referencing information (but
       only then) you can also create a KML output file.
       One of:

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
   * - **Output vector file**
     - ``OUTPUT_VECTOR``
     - [vector: line]
     - The output line vector layer with contours

Python code
...........

**Algorithm ID**: ``lastools:blast2iso``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _lastoolslas2dem:

las2dem
-------

Description
...........

Turns points (up to 20 million) via a temporary Delaunay triangulation
that is rasterized with a user-defined step size into an elevation,
intensity, or RGB raster.

For more info see the
`las2dem <https://rapidlasso.com/lastools/las2dem>`_
page and its online
`README <http://lastools.org/download/las2dem_README.txt>`__ file.

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
   * - **verbose**
     - ``VERBOSE``
     - [boolean]

       Default: False
     - Generates more textual control output to the console
   * - **run new 64 bit executable**
     - ``CPU64``
     - [boolean]

       Default: False
     -
   * - **open LAStools GUI**
     - ``GUI``
     - [boolean]

       Default: False
     - Starts the GUI of LAStools with pre-populated input files
   * - **input LAS/LAZ file**
     - ``INPUT_LASLAZ``
     - [file]
     - The file containing the points to be rastered in
       LAS/LAZ format.
   * - **filter (by return, classification, flags)**
     - ``FILTER_RETURN_CLASS_FLAGS1``
     - [enumeration]

       Default: 0
     - Specifies which points to use to construct the temporary
       TIN that is then rasterized.
       One of:
       
       * 0 --- ---
       * 1 --- keep_last
       * 2 --- keep_first
       * 3 --- keep_middle
       * 4 --- keep_single
       * 5 --- drop_single
       * 6 --- keep_double
       * 7 --- keep_class 2
       * 8 --- keep_class 2 8
       * 9 --- keep_class 8
       * 10 --- keep_class 6
       * 11 --- keep_class 9
       * 12 --- keep_class 3 4 5
       * 13 --- keep_class 3
       * 14 --- keep_class 4
       * 15 --- keep_class 5
       * 16 --- keep_class 2 6
       * 17 --- drop_class 7
       * 18 --- drop_withheld
       * 19 --- drop_synthetic
       * 20 --- drop_overlap
       * 21 --- keep_withheld
       * 22 --- keep_synthetic
       * 23 --- keep_keypoint
       * 24 --- keep_overlap

   * - **step size / pixel size**
     - ``STEP``
     - [number]

       Default: 1.0
     - Specifies the size of the cells of the grid
       the TIN is rasterized onto
   * - **Attribute**
     - ``ATTRIBUTE``
     - [enumeration]

       Default: 0
     - Specifies the attribute to rasterise.
       One of:

       * 0 --- elevation
       * 1 --- slope
       * 2 --- intensity
       * 3 --- rgb
       * 4 --- edge_longest
       * 5 --- edge_shortest

   * - **Product**
     - ``PRODUCT``
     - [enumeration]

       Default: 0
     - Specifies how the attribute is to be turned
       into raster values.
       One of:

       * 0 --- actual values
       * 1 --- hillshade
       * 2 --- gray
       * 3 --- false

   * - **Use tile bounding box (after tiling with buffer)**
     - ``USE_TILE_BB``
     - [boolean]

       Default: False
     - Specifies to limit the rastered area to the tile
       bounding box (only meaningful for input LAS/LAZ
       tiles that were created with lastile).
   * - **additional command line parameter(s)**

       Optional
     - ``ADDITIONAL_OPTIONS``
     - [string]

       Default: ''
     - Specifies other command-line switches not available
       via this menu but known to the (advanced) LAStools user.
   * - **Output raster file**
     - ``OUTPUT_RASTER``
     - [raster]

       Default: ``[Skip output]``
     - Specifies where the output raster is stored.
       Use image rasters like TIF, PNG, and JPG for false color,
       gray ramps, and hillshades.
       Use value rasters like TIF, BIL, IMG, ASC, DTM, FLT, XYZ,
       and CSV for actual values.
       One of:

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
   * - **Output raster file**
     - ``OUTPUT_RASTER``
     - [raster]
     - The output raster

Python code
...........

**Algorithm ID**: ``lastools:las2dem``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _lastoolslas2iso:

las2iso
-------

Description
...........

Turns point clouds (up to 20 million per file) into iso-contour lines
by creating a temporary Delaunay triangulation on which the contours
are then traced.

For more info see the
`las2iso <https://rapidlasso.com/lastools/las2iso>`_ page and its
online `README <http://lastools.org/download/las2iso_README.txt>`__
file.

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
   * - **verbose**
     - ``VERBOSE``
     - [boolean]

       Default: False
     - Generates more textual control output to the console
   * - **run new 64 bit executable**
     - ``CPU64``
     - [boolean]

       Default: False
     -
   * - **open LAStools GUI**
     - ``GUI``
     - [boolean]

       Default: False
     - Starts the GUI of LAStools with pre-populated input files
   * - **input LAS/LAZ file**
     - ``INPUT_LASLAZ``
     - [file]
     - The file containing the points to be used for creating
       iso-contour lines.
   * - **smooth underlying TIN**
     - ``SMOOTH``
     - [number]

       Default: 0
     - Specifies if and with how many passes the temporary
       TIN should be smoothed
   * - **extract isoline with a spacing of**
     - ``ISO_EVERY``
     - [number]

       Default: 10.0
     - Specifies spacing at which iso-contour lines are getting
       extracted (contour interval)
   * - **clean isolines shorter than (0 = do not clean)**
     - ``CLEAN``
     - [number]

       Default: 0.0
     - Omits iso-contour lines that are shorter than the specified
       length
   * - **simplify segments shorter than (0 = do not simplify)**
     - ``SIMPLIFY_LENGTH``
     - [number]

       Default: 0.0
     - Rudimentary simplification of iso-contour line segments
       that are shorter than the specified length.
   * - **simplify segment pairs with area less than (0 = do not simplify)**
     - ``SIMPLIFY_AREA``
     - [number]

       Default: 0.0
     - Rudimentary simplification of bumps formed by
       consecutive line segments whose area is smaller than the
       specified size.
   * - **additional command line parameter(s)**

       Optional
     - ``ADDITIONAL_OPTIONS``
     - [string]

       Default: ''
     - Specifies other command-line switches not available
       via this menu but known to the (advanced) LAStools user.
   * - **Output vector file**
     - ``OUTPUT_VECTOR``
     - [vector: line]

       Default: ``[Skip output]``
     - Specifies where the output vector is stored.
       Use SHP or WKT output files.
       If your input LiDAR file is in geographic coordinates
       (long/lat) or has geo-referencing information (but
       only then) you can also create a KML output file.
       One of:

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
   * - **Output vector file**
     - ``OUTPUT_VECTOR``
     - [vector: line]
     - The output line vector layer with contours

Python code
...........

**Algorithm ID**: ``lastools:las2iso``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _lastoolslas2las_filter:

las2las_filter
--------------

Description
...........

Uses las2las to filter LiDAR points based on different attributes and
to write the surviving subset of points to a new LAZ or LAS file.

For more info see the
`las2las <https://rapidlasso.com/lastools/las2las>`_ page and its
online `README <http://lastools.org/download/las2las_README.txt>`__
file.

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
   * - **verbose**
     - ``VERBOSE``
     - [boolean]

       Default: False
     - Generates more textual control output to the console
   * - **run new 64 bit executable**
     - ``CPU64``
     - [boolean]

       Default: False
     -
   * - **open LAStools GUI**
     - ``GUI``
     - [boolean]

       Default: False
     - Starts the GUI of LAStools with pre-populated input files
   * - **input LAS/LAZ file**
     - ``INPUT_LASLAZ``
     - [file]
     - The file containing the points to be used for creating
       iso-contour lines.
   * - **filter (by return, classification, flags)**
     - ``FILTER_RETURN_CLASS_FLAGS1``
     - [enumeration]

       Default: 0
     - Filters points based on various options such as return,
       classification, or flags.
       One of:
       
       * 0 --- ---
       * 1 --- keep_last
       * 2 --- keep_first
       * 3 --- keep_middle
       * 4 --- keep_single
       * 5 --- drop_single
       * 6 --- keep_double
       * 7 --- keep_class 2
       * 8 --- keep_class 2 8
       * 9 --- keep_class 8
       * 10 --- keep_class 6
       * 11 --- keep_class 9
       * 12 --- keep_class 3 4 5
       * 13 --- keep_class 3
       * 14 --- keep_class 4
       * 15 --- keep_class 5
       * 16 --- keep_class 2 6
       * 17 --- drop_class 7
       * 18 --- drop_withheld
       * 19 --- drop_synthetic
       * 20 --- drop_overlap
       * 21 --- keep_withheld
       * 22 --- keep_synthetic
       * 23 --- keep_keypoint
       * 24 --- keep_overlap
   * - **second filter (by return, classification, flags)**
     - ``FILTER_RETURN_CLASS_FLAGS2``
     - [enumeration]

       Default: 0
     - Filters points based on various options such as return,
       classification, or flags.
       One of:
       
       * 0 --- ---
       * 1 --- keep_last
       * 2 --- keep_first
       * 3 --- keep_middle
       * 4 --- keep_single
       * 5 --- drop_single
       * 6 --- keep_double
       * 7 --- keep_class 2
       * 8 --- keep_class 2 8
       * 9 --- keep_class 8
       * 10 --- keep_class 6
       * 11 --- keep_class 9
       * 12 --- keep_class 3 4 5
       * 13 --- keep_class 3
       * 14 --- keep_class 4
       * 15 --- keep_class 5
       * 16 --- keep_class 2 6
       * 17 --- drop_class 7
       * 18 --- drop_withheld
       * 19 --- drop_synthetic
       * 20 --- drop_overlap
       * 21 --- keep_withheld
       * 22 --- keep_synthetic
       * 23 --- keep_keypoint
       * 24 --- keep_overlap

   * - **filter (by coordinate, intensity, GPS time, ...)**
     - ``FILTER_COORDS_INTENSITY1``
     - [enumeration]

       Default: 0
     - Filters points based on various other options (that require a
       value as argument).
       One of:
       
       * 0 --- ---
       * 1 --- drop_x_above
       * 2 --- drop_x_below
       * 3 --- drop_y_above
       * 4 --- drop_y_below
       * 5 --- drop_z_above
       * 6 --- drop_z_below
       * 7 --- drop_intensity_above
       * 8 --- drop_intensity_below
       * 9 --- drop_gps_time_above
       * 10 --- drop_gps_time_below
       * 11 --- drop_scan_angle_above
       * 12 --- drop_scan_angle_below
       * 13 --- keep_point_source
       * 14 --- drop_point_source
       * 15 --- drop_point_source_above
       * 16 --- drop_point_source_below
       * 17 --- keep_user_data
       * 18 --- drop_user_data
       * 19 --- drop_user_data_above
       * 20 --- drop_user_data_below
       * 21 --- keep_every_nth
       * 22 --- keep_random_fraction
       * 23 --- thin_with_grid

   * - **value for filter (by coordinate, intensity, GPS time, ...)**
     - ``FILTER_COORDS_INTENSITY1_ARG``
     - [number]

       Default: None
     - The value to use as the argument for the filter selected above
   * - **second filter (by coordinate, intensity, GPS time, ...)**
     - ``FILTER_COORDS_INTENSITY2``
     - [enumeration]

       Default: 0
     - Filters points based on various other options (that require a
       value as argument).
       One of:
       
       * 0 --- ---
       * 1 --- drop_x_above
       * 2 --- drop_x_below
       * 3 --- drop_y_above
       * 4 --- drop_y_below
       * 5 --- drop_z_above
       * 6 --- drop_z_below
       * 7 --- drop_intensity_above
       * 8 --- drop_intensity_below
       * 9 --- drop_gps_time_above
       * 10 --- drop_gps_time_below
       * 11 --- drop_scan_angle_above
       * 12 --- drop_scan_angle_below
       * 13 --- keep_point_source
       * 14 --- drop_point_source
       * 15 --- drop_point_source_above
       * 16 --- drop_point_source_below
       * 17 --- keep_user_data
       * 18 --- drop_user_data
       * 19 --- drop_user_data_above
       * 20 --- drop_user_data_below
       * 21 --- keep_every_nth
       * 22 --- keep_random_fraction
       * 23 --- thin_with_grid

   * - **value for second filter (by coordinate, intensity, GPS time, ...)**
     - ``FILTER_COORDS_INTENSITY2_ARG``
     - [number]

       Default: None
     - The value to use as the argument for the filter selected above
   * - **additional command line parameter(s)**

       Optional
     - ``ADDITIONAL_OPTIONS``
     - [string]

       Default: ''
     - Specifies other command-line switches not available
       via this menu but known to the (advanced) LAStools user.
   * - **Output LAS/LAZ file**
     - ``OUTPUT_LASLAZ``
     - [file]

       Default: ``[Skip output]``
     - Specifies where the output point cloud is stored. Use LAZ for
       compressed output,
       LAS for uncompressed output, and TXT for ASCII.
       One of:

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
   * - **Output LAS/LAZ file**
     - ``OUTPUT_LASLAZ``
     - [file]
     - The output LAS/LAZ format file

Python code
...........

**Algorithm ID**: ``lastools:las2las_filter``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _lastoolslas2las_project:

las2las_project
---------------
Transform LAS/LAZ files in a folder to another CRS.

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
   * - **verbose**
     - ``VERBOSE``
     - [boolean]

       Default: False
     - Generates more textual control output to the console
   * - **run new 64 bit executable**
     - ``CPU64``
     - [boolean]

       Default: False
     -
   * - **open LAStools GUI**
     - ``GUI``
     - [boolean]

       Default: False
     - Starts the GUI of LAStools with pre-populated input files
   * - **input LAS/LAZ file**
     - ``INPUT_LASLAZ``
     - [file]
     - Input LAS/LAZ file
   * - **source projection**
     - ``SOURCE_PROJECTION``
     - [enumeration]

       Default: 0
     - One of:

       * 0 --- ---
       * 1 --- epsg
       * 2 --- utm
       * 3 --- sp83
       * 4 --- sp27
       * 5 --- longlat
       * 6 --- latlong
       * 7 --- ecef

   * - **source utm zone**
     - ``SOURCE_UTM``
     - [enumeration]

       Default: 0
     - One of:

       * 0 --- ---
       * 1 --- 1 (north)
       * 2 --- 2 (north)
       * 3 --- 3 (north)
       * 4 --- 4 (north)
       * 5 --- 5 (north)
       * 6 --- 6 (north)
       * 7 --- 7 (north)
       * 8 --- 8 (north)
       * 9 --- 9 (north)
       * 10 --- 10 (north)
       * 11 --- 11 (north)
       * 12 --- 12 (north)
       * 13 --- 13 (north)
       * 14 --- 14 (north)
       * 15 --- 15 (north)
       * 16 --- 16 (north)
       * 17 --- 17 (north)
       * 18 --- 18 (north)
       * 19 --- 19 (north)
       * 20 --- 20 (north)
       * 21 --- 21 (north)
       * 22 --- 22 (north)
       * 23 --- 23 (north)
       * 24 --- 24 (north)
       * 25 --- 25 (north)
       * 26 --- 26 (north)
       * 27 --- 27 (north)
       * 28 --- 28 (north)
       * 29 --- 29 (north)
       * 30 --- 30 (north)
       * 31 --- 31 (north)
       * 32 --- 32 (north)
       * 33 --- 33 (north)
       * 34 --- 34 (north)
       * 35 --- 35 (north)
       * 36 --- 36 (north)
       * 37 --- 37 (north)
       * 38 --- 38 (north)
       * 39 --- 39 (north)
       * 40 --- 40 (north)
       * 41 --- 41 (north)
       * 42 --- 42 (north)
       * 43 --- 43 (north)
       * 44 --- 44 (north)
       * 45 --- 45 (north)
       * 46 --- 46 (north)
       * 47 --- 47 (north)
       * 48 --- 48 (north)
       * 49 --- 49 (north)
       * 50 --- 50 (north)
       * 51 --- 51 (north)
       * 52 --- 52 (north)
       * 53 --- 53 (north)
       * 54 --- 54 (north)
       * 55 --- 55 (north)
       * 56 --- 56 (north)
       * 57 --- 57 (north)
       * 58 --- 58 (north)
       * 59 --- 59 (north)
       * 60 --- 60 (north)
       * 61 --- 1 (south)
       * 62 --- 2 (south)
       * 63 --- 3 (south)
       * 64 --- 4 (south)
       * 65 --- 5 (south)
       * 66 --- 6 (south)
       * 67 --- 7 (south)
       * 68 --- 8 (south)
       * 69 --- 9 (south)
       * 70 --- 10 (south)
       * 71 --- 11 (south)
       * 72 --- 12 (south)
       * 73 --- 13 (south)
       * 74 --- 14 (south)
       * 75 --- 15 (south)
       * 76 --- 16 (south)
       * 77 --- 17 (south)
       * 78 --- 18 (south)
       * 79 --- 19 (south)
       * 80 --- 20 (south)
       * 81 --- 21 (south)
       * 82 --- 22 (south)
       * 83 --- 23 (south)
       * 84 --- 24 (south)
       * 85 --- 25 (south)
       * 86 --- 26 (south)
       * 87 --- 27 (south)
       * 88 --- 28 (south)
       * 89 --- 29 (south)
       * 90 --- 30 (south)
       * 91 --- 31 (south)
       * 92 --- 32 (south)
       * 93 --- 33 (south)
       * 94 --- 34 (south)
       * 95 --- 35 (south)
       * 96 --- 36 (south)
       * 97 --- 37 (south)
       * 98 --- 38 (south)
       * 99 --- 39 (south)
       * 100 --- 40 (south)
       * 101 --- 41 (south)
       * 102 --- 42 (south)
       * 103 --- 43 (south)
       * 104 --- 44 (south)
       * 105 --- 45 (south)
       * 106 --- 46 (south)
       * 107 --- 47 (south)
       * 108 --- 48 (south)
       * 109 --- 49 (south)
       * 110 --- 50 (south)
       * 111 --- 51 (south)
       * 112 --- 52 (south)
       * 113 --- 53 (south)
       * 114 --- 54 (south)
       * 115 --- 55 (south)
       * 116 --- 56 (south)
       * 117 --- 57 (south)
       * 118 --- 58 (south)
       * 119 --- 59 (south)
       * 120 --- 60 (south)

   * - **source state plane code**
     - ``SOURCE_SP``
     - [enumeration]

       Default: 0
     - One of:

       * 0 --- ---
       * 1 --- AK_10
       * 2 --- AK_2
       * 3 --- AK_3
       * 4 --- AK_4
       * 5 --- AK_5
       * 6 --- AK_6
       * 7 --- AK_7
       * 8 --- AK_8
       * 9 --- AK_9
       * 10 --- AL_E
       * 11 --- AL_W
       * 12 --- AR_N
       * 13 --- AR_S
       * 14 --- AZ_C
       * 15 --- AZ_E
       * 16 --- AZ_W
       * 17 --- CA_I
       * 18 --- CA_II
       * 19 --- CA_III
       * 20 --- CA_IV
       * 21 --- CA_V
       * 22 --- CA_VI
       * 23 --- CA_VII
       * 24 --- CO_C
       * 25 --- CO_N
       * 26 --- CO_S
       * 27 --- CT
       * 28 --- DE
       * 29 --- FL_E
       * 30 --- FL_N
       * 31 --- FL_W
       * 32 --- GA_E
       * 33 --- GA_W
       * 34 --- HI_1
       * 35 --- HI_2
       * 36 --- HI_3
       * 37 --- HI_4
       * 38 --- HI_5
       * 39 --- IA_N
       * 40 --- IA_S
       * 41 --- ID_C
       * 42 --- ID_E
       * 43 --- ID_W
       * 44 --- IL_E
       * 45 --- IL_W
       * 46 --- IN_E
       * 47 --- IN_W
       * 48 --- KS_N
       * 49 --- KS_S
       * 50 --- KY_N
       * 51 --- KY_S
       * 52 --- LA_N
       * 53 --- LA_S
       * 54 --- MA_I
       * 55 --- MA_M
       * 56 --- MD
       * 57 --- ME_E
       * 58 --- ME_W
       * 59 --- MI_C
       * 60 --- MI_N
       * 61 --- MI_S
       * 62 --- MN_C
       * 63 --- MN_N
       * 64 --- MN_S
       * 65 --- MO_C
       * 66 --- MO_E
       * 67 --- MO_W
       * 68 --- MS_E
       * 69 --- MS_W
       * 70 --- MT_C
       * 71 --- MT_N
       * 72 --- MT_S
       * 73 --- NC
       * 74 --- ND_N
       * 75 --- ND_S
       * 76 --- NE_N
       * 77 --- NE_S
       * 78 --- NH
       * 79 --- NJ
       * 80 --- NM_C
       * 81 --- NM_E
       * 82 --- NM_W
       * 83 --- NV_C
       * 84 --- NV_E
       * 85 --- NV_W
       * 86 --- NY_C
       * 87 --- NY_E
       * 88 --- NY_LI
       * 89 --- NY_W
       * 90 --- OH_N
       * 91 --- OH_S
       * 92 --- OK_N
       * 93 --- OK_S
       * 94 --- OR_N
       * 95 --- OR_S
       * 96 --- PA_N
       * 97 --- PA_S
       * 98 --- PR
       * 99 --- RI
       * 100 --- SC_N
       * 101 --- SC_S
       * 102 --- SD_N
       * 103 --- SD_S
       * 104 --- St.Croix
       * 105 --- TN
       * 106 --- TX_C
       * 107 --- TX_N
       * 108 --- TX_NC
       * 109 --- TX_S
       * 110 --- TX_SC
       * 111 --- UT_C
       * 112 --- UT_N
       * 113 --- UT_S
       * 114 --- VA_N
       * 115 --- VA_S
       * 116 --- VT
       * 117 --- WA_N
       * 118 --- WA_S
       * 119 --- WI_C
       * 120 --- WI_N
       * 121 --- WI_S
       * 122 --- WV_N
       * 123 --- WV_S
       * 124 --- WY_E
       * 125 --- WY_EC
       * 126 --- WY_W
       * 127 --- WY_WC

   * - **target projection**
     - ``TARGET_PROJECTION``
     - [enumeration]

       Default: 0
     - One of:

       * 0 --- ---
       * 1 --- epsg
       * 2 --- utm
       * 3 --- sp83
       * 4 --- sp27
       * 5 --- longlat
       * 6 --- latlong
       * 7 --- ecef

   * - **target utm zone**
     - ``TARGET_UTM``
     - [enumeration]

       Default: 0
     - One of:

       * 0 --- ---
       * 1 --- 1 (north)
       * 2 --- 2 (north)
       * 3 --- 3 (north)
       * 4 --- 4 (north)
       * 5 --- 5 (north)
       * 6 --- 6 (north)
       * 7 --- 7 (north)
       * 8 --- 8 (north)
       * 9 --- 9 (north)
       * 10 --- 10 (north)
       * 11 --- 11 (north)
       * 12 --- 12 (north)
       * 13 --- 13 (north)
       * 14 --- 14 (north)
       * 15 --- 15 (north)
       * 16 --- 16 (north)
       * 17 --- 17 (north)
       * 18 --- 18 (north)
       * 19 --- 19 (north)
       * 20 --- 20 (north)
       * 21 --- 21 (north)
       * 22 --- 22 (north)
       * 23 --- 23 (north)
       * 24 --- 24 (north)
       * 25 --- 25 (north)
       * 26 --- 26 (north)
       * 27 --- 27 (north)
       * 28 --- 28 (north)
       * 29 --- 29 (north)
       * 30 --- 30 (north)
       * 31 --- 31 (north)
       * 32 --- 32 (north)
       * 33 --- 33 (north)
       * 34 --- 34 (north)
       * 35 --- 35 (north)
       * 36 --- 36 (north)
       * 37 --- 37 (north)
       * 38 --- 38 (north)
       * 39 --- 39 (north)
       * 40 --- 40 (north)
       * 41 --- 41 (north)
       * 42 --- 42 (north)
       * 43 --- 43 (north)
       * 44 --- 44 (north)
       * 45 --- 45 (north)
       * 46 --- 46 (north)
       * 47 --- 47 (north)
       * 48 --- 48 (north)
       * 49 --- 49 (north)
       * 50 --- 50 (north)
       * 51 --- 51 (north)
       * 52 --- 52 (north)
       * 53 --- 53 (north)
       * 54 --- 54 (north)
       * 55 --- 55 (north)
       * 56 --- 56 (north)
       * 57 --- 57 (north)
       * 58 --- 58 (north)
       * 59 --- 59 (north)
       * 60 --- 60 (north)
       * 61 --- 1 (south)
       * 62 --- 2 (south)
       * 63 --- 3 (south)
       * 64 --- 4 (south)
       * 65 --- 5 (south)
       * 66 --- 6 (south)
       * 67 --- 7 (south)
       * 68 --- 8 (south)
       * 69 --- 9 (south)
       * 70 --- 10 (south)
       * 71 --- 11 (south)
       * 72 --- 12 (south)
       * 73 --- 13 (south)
       * 74 --- 14 (south)
       * 75 --- 15 (south)
       * 76 --- 16 (south)
       * 77 --- 17 (south)
       * 78 --- 18 (south)
       * 79 --- 19 (south)
       * 80 --- 20 (south)
       * 81 --- 21 (south)
       * 82 --- 22 (south)
       * 83 --- 23 (south)
       * 84 --- 24 (south)
       * 85 --- 25 (south)
       * 86 --- 26 (south)
       * 87 --- 27 (south)
       * 88 --- 28 (south)
       * 89 --- 29 (south)
       * 90 --- 30 (south)
       * 91 --- 31 (south)
       * 92 --- 32 (south)
       * 93 --- 33 (south)
       * 94 --- 34 (south)
       * 95 --- 35 (south)
       * 96 --- 36 (south)
       * 97 --- 37 (south)
       * 98 --- 38 (south)
       * 99 --- 39 (south)
       * 100 --- 40 (south)
       * 101 --- 41 (south)
       * 102 --- 42 (south)
       * 103 --- 43 (south)
       * 104 --- 44 (south)
       * 105 --- 45 (south)
       * 106 --- 46 (south)
       * 107 --- 47 (south)
       * 108 --- 48 (south)
       * 109 --- 49 (south)
       * 110 --- 50 (south)
       * 111 --- 51 (south)
       * 112 --- 52 (south)
       * 113 --- 53 (south)
       * 114 --- 54 (south)
       * 115 --- 55 (south)
       * 116 --- 56 (south)
       * 117 --- 57 (south)
       * 118 --- 58 (south)
       * 119 --- 59 (south)
       * 120 --- 60 (south)

   * - **target state plane code**
     - ``TARGET_SP``
     - [enumeration]

       Default: 0
     - One of:

       * 0 --- ---
       * 1 --- AK_10
       * 2 --- AK_2
       * 3 --- AK_3
       * 4 --- AK_4
       * 5 --- AK_5
       * 6 --- AK_6
       * 7 --- AK_7
       * 8 --- AK_8
       * 9 --- AK_9
       * 10 --- AL_E
       * 11 --- AL_W
       * 12 --- AR_N
       * 13 --- AR_S
       * 14 --- AZ_C
       * 15 --- AZ_E
       * 16 --- AZ_W
       * 17 --- CA_I
       * 18 --- CA_II
       * 19 --- CA_III
       * 20 --- CA_IV
       * 21 --- CA_V
       * 22 --- CA_VI
       * 23 --- CA_VII
       * 24 --- CO_C
       * 25 --- CO_N
       * 26 --- CO_S
       * 27 --- CT
       * 28 --- DE
       * 29 --- FL_E
       * 30 --- FL_N
       * 31 --- FL_W
       * 32 --- GA_E
       * 33 --- GA_W
       * 34 --- HI_1
       * 35 --- HI_2
       * 36 --- HI_3
       * 37 --- HI_4
       * 38 --- HI_5
       * 39 --- IA_N
       * 40 --- IA_S
       * 41 --- ID_C
       * 42 --- ID_E
       * 43 --- ID_W
       * 44 --- IL_E
       * 45 --- IL_W
       * 46 --- IN_E
       * 47 --- IN_W
       * 48 --- KS_N
       * 49 --- KS_S
       * 50 --- KY_N
       * 51 --- KY_S
       * 52 --- LA_N
       * 53 --- LA_S
       * 54 --- MA_I
       * 55 --- MA_M
       * 56 --- MD
       * 57 --- ME_E
       * 58 --- ME_W
       * 59 --- MI_C
       * 60 --- MI_N
       * 61 --- MI_S
       * 62 --- MN_C
       * 63 --- MN_N
       * 64 --- MN_S
       * 65 --- MO_C
       * 66 --- MO_E
       * 67 --- MO_W
       * 68 --- MS_E
       * 69 --- MS_W
       * 70 --- MT_C
       * 71 --- MT_N
       * 72 --- MT_S
       * 73 --- NC
       * 74 --- ND_N
       * 75 --- ND_S
       * 76 --- NE_N
       * 77 --- NE_S
       * 78 --- NH
       * 79 --- NJ
       * 80 --- NM_C
       * 81 --- NM_E
       * 82 --- NM_W
       * 83 --- NV_C
       * 84 --- NV_E
       * 85 --- NV_W
       * 86 --- NY_C
       * 87 --- NY_E
       * 88 --- NY_LI
       * 89 --- NY_W
       * 90 --- OH_N
       * 91 --- OH_S
       * 92 --- OK_N
       * 93 --- OK_S
       * 94 --- OR_N
       * 95 --- OR_S
       * 96 --- PA_N
       * 97 --- PA_S
       * 98 --- PR
       * 99 --- RI
       * 100 --- SC_N
       * 101 --- SC_S
       * 102 --- SD_N
       * 103 --- SD_S
       * 104 --- St.Croix
       * 105 --- TN
       * 106 --- TX_C
       * 107 --- TX_N
       * 108 --- TX_NC
       * 109 --- TX_S
       * 110 --- TX_SC
       * 111 --- UT_C
       * 112 --- UT_N
       * 113 --- UT_S
       * 114 --- VA_N
       * 115 --- VA_S
       * 116 --- VT
       * 117 --- WA_N
       * 118 --- WA_S
       * 119 --- WI_C
       * 120 --- WI_N
       * 121 --- WI_S
       * 122 --- WV_N
       * 123 --- WV_S
       * 124 --- WY_E
       * 125 --- WY_EC
       * 126 --- WY_W
       * 127 --- WY_WC

   * - **additional command line parameter(s)**

       Optional
     - ``ADDITIONAL_OPTIONS``
     - [string]

       Default: ''
     - Specifies other command-line switches not available
       via this menu but known to the (advanced) LAStools user.
   * - **Output LAS/LAZ file**
     - ``OUTPUT_LASLAZ``
     - [folder]

       Default: ``[Save to temporary folder]``
     - Specifies where the folder for the output point clouds.
       One of:

       * Skip Output
       * Save to a Temporary Directory
       * Save to Directory...

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
   * - **Output LAS/LAZ file**
     - ``OUTPUT_LASLAZ``
     - [file]
     - The output LAS/LAZ format file

Python code
...........

**Algorithm ID**: ``lastools:las2las_project``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _lastoolslas2las_transform:

las2las_transform
------------------

Description
...........

Uses las2las to filter LiDAR points based on different attributes and
to write the surviving subset of points to a new LAZ or LAS file.

For more info see the
`las2las <https://rapidlasso.com/lastools/las2las>`_ page and its
online `README <http://lastools.org/download/las2las_README.txt>`__
file.

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
   * - **verbose**
     - ``VERBOSE``
     - [boolean]

       Default: False
     - Generates more textual control output to the console
   * - **run new 64 bit executable**
     - ``CPU64``
     - [boolean]

       Default: False
     -
   * - **open LAStools GUI**
     - ``GUI``
     - [boolean]

       Default: False
     - Starts the GUI of LAStools with pre-populated input files
   * - **input LAS/LAZ file**
     - ``INPUT_LASLAZ``
     - [file]
     - The first file containing points to be merged
   * - **transform (coordinates)**
     - ``TRANSFORM_COORDINATE1``
     - [enumeration]

       Default: 0
     - Either translate, scale, or clamp the X, Y, or Z coordinate by
       the value specified below. One of:

       * 0 --- ---
       * 1 --- translate_x
       * 2 --- translate_y
       * 3 --- translate_z
       * 4 --- scale_x
       * 5 --- scale_y
       * 6 --- scale_z
       * 7 --- clamp_z_above
       * 8 --- clamp_z_below

   * - **value for transform (coordinates)**
     - ``TRANSFORM_COORDINATE1_ARG``
     - [string]

       Default: ''
     - The value that specifies the amount of translating, scaling, or
       clamping done by the transform selected above.
   * - **second transform (coordinates)**
     - ``TRANSFORM_COORDINATE2``
     - [enumeration]

       Default: 0
     - Either translate, scale, or clamp the X, Y, or Z coordinate by
       the value specified below. One of:

       * 0 --- ---
       * 1 --- translate_x
       * 2 --- translate_y
       * 3 --- translate_z
       * 4 --- scale_x
       * 5 --- scale_y
       * 6 --- scale_z
       * 7 --- clamp_z_above
       * 8 --- clamp_z_below

   * - **value for second transform (coordinates)**
     - ``TRANSFORM_COORDINATE2_ARG``
     - [string]

       Default: ''
     - The value that specifies the amount of translating, scaling, or
       clamping done by the transform selected above.
   * - **transform (intensities, scan angles, GPS times, ...)**
     - ``TRANSFORM_OTHER1``
     - [enumeration]

       Default: 0
     - Either translate, scale, or clamp the X, Y, or Z coordinate by
       the value specified below. One of:

       * 0 --- ---
       * 1 --- scale_intensity
       * 2 --- translate_intensity
       * 3 --- clamp_intensity_above
       * 4 --- clamp_intensity_below
       * 5 --- scale_scan_angle
       * 6 --- translate_scan_angle
       * 7 --- translate_gps_time
       * 8 --- set_classification
       * 9 --- set_user_data
       * 10 --- set_point_source
       * 11 --- scale_rgb_up
       * 12 --- scale_rgb_down
       * 13 --- repair_zero_returns

   * - **value for transform (intensities, scan angles, GPS times, ...)**
     - ``TRANSFORM_OTHER1_ARG``
     - [string]

       Default: ''
     - The value that specifies the amount of scaling, translating,
       clamping or setting that is done by the transform selected
       above.
   * - **second transform (intensities, scan angles, GPS times, ...)**
     - ``TRANSFORM_OTHER2``
     - [enumeration]

       Default: 0
     - Either translate, scale, or clamp the X, Y, or Z coordinate by
       the value specified below. One of:

       * 0 --- ---
       * 1 --- scale_intensity
       * 2 --- translate_intensity
       * 3 --- clamp_intensity_above
       * 4 --- clamp_intensity_below
       * 5 --- scale_scan_angle
       * 6 --- translate_scan_angle
       * 7 --- translate_gps_time
       * 8 --- set_classification
       * 9 --- set_user_data
       * 10 --- set_point_source
       * 11 --- scale_rgb_up
       * 12 --- scale_rgb_down
       * 13 --- repair_zero_returns

   * - **value for second transform (intensities, scan angles, GPS times, ...)**
     - ``TRANSFORM_OTHER2_ARG``
     - [string]

       Default: ''
     - The value that specifies the amount of scaling, translating,
       clamping or setting that is done by the transform selected
       above.
   * - **operations (first 7 need an argument)**
     - ``OPERATION``
     - [enumeration]

       Default: 0
     - One of:

       * 0 --- ---
       * 1 --- set_point_type
       * 2 --- set_point_size
       * 3 --- set_version_minor
       * 4 --- set_version_major
       * 5 --- start_at_point
       * 6 --- stop_at_point
       * 7 --- remove_vlr
       * 8 --- auto_reoffset
       * 9 --- week_to_adjusted
       * 10 --- adjusted_to_week
       * 11 --- auto reoffset
       * 12 --- scale_rgb_up
       * 13 --- scale_rgb_down
       * 14 --- remove_all_vlrs
       * 15 --- remove_extra
       * 16 --- clip_to_bounding_box

   * - **argument for operation**
     - ``OPERATIONARG``
     - [string]

       Default: ''
     - The value to use as the argument for the operation selected
       above
   * - **additional command line parameter(s)**

       Optional
     - ``ADDITIONAL_OPTIONS``
     - [string]

       Default: ''
     - Specifies other command-line switches not available
       via this menu but known to the (advanced) LAStools user.
   * - **Output LAS/LAZ file**
     - ``OUTPUT_LASLAZ``
     - [file]

       Default: ``[Skip output]``
     - Specifies where the output point cloud is stored.
       Use LAZ for compressed output, LAS for uncompressed output,
       and TXT for ASCII.
       One of:

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
   * - **Output LAS/LAZ file**
     - ``OUTPUT_LASLAZ``
     - [file]
     - The output (merged) LAS/LAZ format file

Python code
...........

**Algorithm ID**: ``lastools:las2las_transform``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _lastoolslas2txt:

las2txt
-------

Description
...........

Translates a LAS/LAZ file to a text file.

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
   * - **verbose**
     - ``VERBOSE``
     - [boolean]

       Default: False
     -
   * - **run new 64 bit executable**
     - ``CPU64``
     - [boolean]

       Default: False
     -
   * - **open LAStools GUI**
     - ``GUI``
     - [boolean]

       Default: False
     -
   * - **input LAS/LAZ file**
     - ``INPUT_LASLAZ``
     - [file]

       Default: None
     -
   * - **parse_string**
     - ``PARSE``
     - [string]

       Default: 'xyz'
     -
   * - **additional command line parameters**

       Optional
     - ``ADDITIONAL_OPTIONS``
     - [string]

       Default: ''
     - Specifies other command-line switches not available
       via this menu but known to the (advanced) LAStools user.
   * - **Output ASCII file**
     - ``OUTPUT_GENERIC``
     - [file]

       Default: ``[Create temporary layer]``
     - Specify the output file.  One of:

       * Create Temporary Layer (``TEMPORARY_OUTPUT``)
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
   * - **Output ASCII file**
     - ``OUTPUT_GENERIC``
     - [file]
     - The output file

Python code
...........

**Algorithm ID**: ``lastools:las2txt``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _lastoolslasindex:

lasindex
--------

Description
...........

<put algorithm description here>

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
   * - **verbose**
     - ``VERBOSE``
     - [boolean]

       Default: False
     -
   * - **run new 64 bit executable**
     - ``CPU64``
     - [boolean]

       Default: False
     -
   * - **open LAStools GUI**
     - ``GUI``
     - [boolean]

       Default: False
     -
   * - **input LAS/LAZ file**
     - ``INPUT_LASLAZ``
     - [file]

       Default: None
     -
   * - **append \*.lax file to \*.laz file**
     - ``APPEND_LAX``
     - [boolean]

       Default: False
     -
   * - **is mobile or terrestrial LiDAR (not airborne)**
     - ``MOBILE_OR_TERRESTRIAL``
     - [boolean]

       Default: False
     -
   * - **additional command line parameters**

       Optional
     - ``ADDITIONAL_OPTIONS``
     - [string]

       Default: ''
     - Specifies other command-line switches not available
       via this menu but known to the (advanced) LAStools user.

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
   * - 
     - 
     - 
     - No output

Python code
...........

**Algorithm ID**: ``lastools:lasindex``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _lastoolslasgrid:

lasgrid
-------
Grids a selected attribute (e.g. elevation, intensity, classification,
scan angle, ...) of a large point clouds with a user-defined step size
onto raster using a particular method (e.g. min, max, average).

For more info see the
`lasgrid <https://rapidlasso.com/lastools/lasgrid>`_ page and its
online `README <http://lastools.org/download/lasgrid_README.txt>`__
file.

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
   * - **verbose**
     - ``VERBOSE``
     - [boolean]

       Default: False
     - Generates more textual control output to the console
   * - **run new 64 bit executable**
     - ``CPU64``
     - [boolean]

       Default: False
     -
   * - **open LAStools GUI**
     - ``GUI``
     - [boolean]

       Default: False
     - Starts the GUI of LAStools with pre-populated input files
   * - **input LAS/LAZ file**
     - ``INPUT_LASLAZ``
     - [file]
     - The file containing the points to be rastered in
       LAS/LAZ format.
   * - **filter (by return, classification, flags)**
     - ``FILTER_RETURN_CLASS_FLAGS1``
     - [enumeration]

       Default: 0
     - Specifies the subset of points to use for the gridding.
       One of:
       
       * 0 --- ---
       * 1 --- keep_last
       * 2 --- keep_first
       * 3 --- keep_middle
       * 4 --- keep_single
       * 5 --- drop_single
       * 6 --- keep_double
       * 7 --- keep_class 2
       * 8 --- keep_class 2 8
       * 9 --- keep_class 8
       * 10 --- keep_class 6
       * 11 --- keep_class 9
       * 12 --- keep_class 3 4 5
       * 13 --- keep_class 3
       * 14 --- keep_class 4
       * 15 --- keep_class 5
       * 16 --- keep_class 2 6
       * 17 --- drop_class 7
       * 18 --- drop_withheld
       * 19 --- drop_synthetic
       * 20 --- drop_overlap
       * 21 --- keep_withheld
       * 22 --- keep_synthetic
       * 23 --- keep_keypoint
       * 24 --- keep_overlap

   * - **step size / pixel size**
     - ``STEP``
     - [number]

       Default: 1.0
     - Specifies the size of the cells of the grid
       the TIN is rasterized onto
   * - **Attribute**
     - ``ATTRIBUTE``
     - [enumeration]

       Default: 0
     - Specifies the attribute to rasterise.
       One of:

       * 0 --- elevation
       * 1 --- intensity
       * 2 --- rgb
       * 3 --- classification

   * - **Method**
     - ``METHOD``
     - [enumeration]

       Default: 0
     - Specifies how the attributes falling into one cell are turned
       into a raster value.
       One of:

       * 0 --- lowest
       * 1 --- heighest
       * 2 --- average
       * 3 --- stddev

   * - **use tile bounding box (after tiling with buffer)**
     - ``USE_TILE_BB``
     - [boolean]

       Default: False
     - Specifies to limit the rastered area to the tile
       bounding box (only meaningful for input LAS/LAZ
       tiles that were created with lastile).
   * - **additional command line parameter(s)**

       Optional
     - ``ADDITIONAL_OPTIONS``
     - [string]

       Default: ''
     - Specifies other command-line switches not available
       via this menu but known to the (advanced) LAStools user.
   * - **Output raster file**
     - ``OUTPUT_RASTER``
     - [raster]

       Default: ``[Skip output]``
     - Specifies where the output raster is stored.
       Use image rasters like TIF, PNG, and JPG for false color,
       gray ramps, and hillshades.
       Use value rasters like TIF, BIL, IMG, ASC, DTM, FLT, XYZ,
       and CSV for actual values.
       One of:

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
   * - **Output raster file**
     - ``OUTPUT_RASTER``
     - [raster]
     - The output raster

Python code
...........

**Algorithm ID**: ``lastools:lasgrid``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _lastoolslasinfo:

lasinfo
-------

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
   * - **verbose**
     - ``VERBOSE``
     - [boolean]

       Default: False
     - Generates more textual control output to the console
   * - **run new 64 bit executable**
     - ``CPU64``
     - [boolean]

       Default: False
     -
   * - **open LAStools GUI**
     - ``GUI``
     - [boolean]

       Default: False
     - Starts the GUI of LAStools with pre-populated input files
   * - **input LAS/LAZ file**
     - ``INPUT_LASLAZ``
     - [file]
     - The file to get information about.
   * - **compute density**
     - ``COMPUTE_DENSITY``
     - [boolean]

       Default: False
     - 
   * - **repair bounding box**
     - ``REPAIR_BB``
     - [boolean]

       Default: False
     - 
   * - **repair counters**
     - ``REPAIR_COUNTERS``
     - [boolean]

       Default: False
     - 
   * - **histogram**
     - ``HISTO1``
     - [enumeration]

       Default: 0
     - First histogram.
       One of:

       * 0 --- ---
       * 1 --- x
       * 2 --- y
       * 3 --- z
       * 4 --- intensity
       * 5 --- classification
       * 6 --- scan_angle
       * 7 --- user_data
       * 8 --- point_source
       * 9 --- gps_time
       * 10 --- X
       * 11 --- Y
       * 12 --- Z
       * 13 --- attribute0
       * 14 --- attribute1
       * 15 --- attribute2

   * - **bin size**
     - ``HISTO1_BIN``
     - [number]

       Default: 1.0
     - 
   * - **histogram**
     - ``HISTO2``
     - [enumeration]

       Default: 0
     - Second histogram.
       One of:

       * 0 --- ---
       * 1 --- x
       * 2 --- y
       * 3 --- z
       * 4 --- intensity
       * 5 --- classification
       * 6 --- scan_angle
       * 7 --- user_data
       * 8 --- point_source
       * 9 --- gps_time
       * 10 --- X
       * 11 --- Y
       * 12 --- Z
       * 13 --- attribute0
       * 14 --- attribute1
       * 15 --- attribute2

   * - **bin size**
     - ``HISTO2_BIN``
     - [number]

       Default: 1.0
     - 
   * - **histogram**
     - ``HISTO3``
     - [enumeration]

       Default: 0
     - Third histogram.
       One of:

       * 0 --- ---
       * 1 --- x
       * 2 --- y
       * 3 --- z
       * 4 --- intensity
       * 5 --- classification
       * 6 --- scan_angle
       * 7 --- user_data
       * 8 --- point_source
       * 9 --- gps_time
       * 10 --- X
       * 11 --- Y
       * 12 --- Z
       * 13 --- attribute0
       * 14 --- attribute1
       * 15 --- attribute2

   * - **bin size**
     - ``HISTO3_BIN``
     - [number]

       Default: 1.0
     - 
   * - **additional command line parameter(s)**

       Optional
     - ``ADDITIONAL_OPTIONS``
     - [string]

       Default: ''
     - Specifies other command-line switches not available
       via this menu but known to the (advanced) LAStools user.
   * - **Output ASCII file**
     - ``OUTPUT_GENERIC``
     - [file]

       Default: ``[Skip output]``
     - Specifies where the output is stored.
       One of:

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
   * - **Output ASCII file**
     - ``OUTPUT_GENERIC``
     - [file]
     - The file with the output

Python code
...........

**Algorithm ID**: ``lastools:lasinfo``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _lastoolslasmerge:

lasmerge
--------
Merge up to seven LAS/LAZ files into one.

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
   * - **verbose**
     - ``VERBOSE``
     - [boolean]

       Default: False
     - Generates more textual control output to the console
   * - **run new 64 bit executable**
     - ``CPU64``
     - [boolean]

       Default: False
     -
   * - **open LAStools GUI**
     - ``GUI``
     - [boolean]

       Default: False
     - Starts the GUI of LAStools with pre-populated input files
   * - **files are flightlines**
     - ``FILES_ARE_FLIGHTLINES``
     - [boolean]

       Default: False
     - 
   * - **apply file source ID**
     - ``APPLY_FILE_SOURCE_ID``
     - [boolean]

       Default: False
     - 
   * - **input LAS/LAZ file**
     - ``INPUT_LASLAZ``
     - [file]
     - The first file containing points to be merged
   * - **2nd file**

       Optional
     - ``FILE2``
     - [file]
     - The second file to merge
   * - **3rd file**

       Optional
     - ``FILE3``
     - [file]
     - The third file to merge
   * - **4th file**

       Optional
     - ``FILE4``
     - [file]
     - The fourth file to merge
   * - **5th file**

       Optional
     - ``FILE5``
     - [file]
     - The fifth file to merge
   * - **6th file**

       Optional
     - ``FILE6``
     - [file]
     - The sixth file to merge
   * - **7th file**

       Optional
     - ``FILE7``
     - [file]
     - The seventh file to merge
   * - **additional command line parameter(s)**

       Optional
     - ``ADDITIONAL_OPTIONS``
     - [string]

       Default: ''
     - Specifies other command-line switches not available
       via this menu but known to the (advanced) LAStools user.
   * - **Output LAS/LAZ file**
     - ``OUTPUT_LASLAZ``
     - [file]

       Default: ``[Skip output]``
     - Specifies where the output point cloud is stored.
       Use LAZ for compressed output, LAS for uncompressed output,
       and TXT for ASCII.
       One of:

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
   * - **Output LAS/LAZ file**
     - ``OUTPUT_LASLAZ``
     - [file]
     - The output (merged) LAS/LAZ format file

Python code
...........

**Algorithm ID**: ``lastools:lasmerge``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _lastoolslasprecision:

lasprecision
------------

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
   * - **verbose**
     - ``VERBOSE``
     - [boolean]

       Default: False
     - Generates more textual control output to the console
   * - **open LAStools GUI**
     - ``GUI``
     - [boolean]

       Default: False
     - Starts the GUI of LAStools with pre-populated input files
   * - **input LAS/LAZ file**
     - ``INPUT_LASLAZ``
     - [file]
     - The file the input point cloud
   * - **additional command line parameter(s)**

       Optional
     - ``ADDITIONAL_OPTIONS``
     - [string]

       Default: ''
     - Specifies other command-line switches not available
       via this menu but known to the (advanced) LAStools user.
   * - **Output ASCII file**
     - ``OUTPUT_GENERIC``
     - [file]

       Default: ``[Skip output]``
     - Specifies where the output ASCII file is stored.
       One of:

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
   * - **Output ASCII file**
     - ``OUTPUT_GENERIC``
     - [file]
     - The output ASCII file

Python code
...........

**Algorithm ID**: ``lastools:lasprecision``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _lastoolslasquery:

lasquery
--------

Description
...........

<put algorithm description here>

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
   * - **verbose**
     - ``VERBOSE``
     - [boolean]

       Default: False
     - Generates more textual control output to the console
   * - **open LAStools GUI**
     - ``GUI``
     - [boolean]

       Default: False
     - Starts the GUI of LAStools with pre-populated input files
   * - **input LAS/LAZ file**
     - ``INPUT_LASLAZ``
     - [file]
     - The file the input point cloud
   * - **area of interest**
     - ``AOI``
     - [extent]
     - The extent
   * - **additional command line parameter(s)**

       Optional
     - ``ADDITIONAL_OPTIONS``
     - [string]

       Default: ''
     - Specifies other command-line switches not available
       via this menu but known to the (advanced) LAStools user.

Outputs
.......

Python code
...........

**Algorithm ID**: ``lastools:lasquery``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _lastoolslasvalidate:

lasvalidate
-----------

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
   * - **input LAS/LAZ file**
     - ``INPUT_LASLAZ``
     - [file]
     - The file the input point cloud
   * - **save report to '\*_LVS.xml'**
     - ``ONE_REPORT_PER_FILE``
     - [boolean]
     - 
   * - **additional command line parameter(s)**

       Optional
     - ``ADDITIONAL_OPTIONS``
     - [string]

       Default: ''
     - Specifies other command-line switches not available
       via this menu but known to the (advanced) LAStools user.
   * - **Output XML file**
     - ``OUTPUT_GENERIC``
     - [file]

       Default: ``[Skip output]``
     - Specifies where the output XML file is stored.
       One of:

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
   * - **Output XML file**
     - ``OUTPUT_GENERIC``
     - [file]
     - The output XML file

Python code
...........

**Algorithm ID**: ``lastools:lasvalidate``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _lastoolslaszip:

laszip
------

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
   * - **verbose**
     - ``VERBOSE``
     - [boolean]

       Default: False
     - Generates more textual control output to the console
   * - **run new 64 bit executable**
     - ``CPU64``
     - [boolean]

       Default: False
     -
   * - **open LAStools GUI**
     - ``GUI``
     - [boolean]

       Default: False
     - Starts the GUI of LAStools with pre-populated input files
   * - **input LAS/LAZ file**
     - ``INPUT_LASLAZ``
     - [file]
     - The file to be zipped
   * - **only report size**
     - ``REPORT_SIZE``
     - [boolean]

       Default: False
     - 
   * - **create spatial indexing file (\*.lax)**
     - ``CREATE_LAX``
     - [boolean]

       Default: False
     - 
   * - **append \*.lax into \*.laz file**
     - ``APPEND_LAX``
     - [boolean]

       Default: False
     - 
   * - **additional command line parameter(s)**

       Optional
     - ``ADDITIONAL_OPTIONS``
     - [string]

       Default: ''
     - Specifies other command-line switches not available
       via this menu but known to the (advanced) LAStools user.
   * - **Output LAS/LAZ file**
     - ``OUTPUT_LASLAZ``
     - [file]

       Default: ``[Skip output]``
     - Specifies where the output point cloud is stored. Use LAZ for
       compressed output,
       LAS for uncompressed output, and TXT for ASCII.
       One of:

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
   * - **Output LAS/LAZ file**
     - ``OUTPUT_LASLAZ``
     - [file]
     - The output file

Python code
...........

**Algorithm ID**: ``lastools:laszip``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _lastoolstxt2las:

txt2las
-------

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
   * - **verbose**
     - ``VERBOSE``
     - [boolean]

       Default: False
     - Generates more textual control output to the console
   * - **run new 64 bit executable**
     - ``CPU64``
     - [boolean]

       Default: False
     -
   * - **open LAStools GUI**
     - ``GUI``
     - [boolean]

       Default: False
     - Starts the GUI of LAStools with pre-populated input files
   * - **input LAS/LAZ file**
     - ``INPUT_LASLAZ``
     - [file]
     - The file to be zipped
   * - **parse lines as**
     - ``PARSE``
     - [string]

       Default: 'xyz'
     - 
   * - **skip the first n lines**
     - ``SKIP``
     - [number]

       Default: 0
     - 
   * - **resolution of x and y coordinate**
     - ``SCALE_FACTOR_XY``
     - [number]

       Default: 0.01
     - 
   * - **resolution of z coordinate**
     - ``SCALE_FACTOR_Z``
     - [number]

       Default: 0.01
     - 
   * - **resolution of z coordinate**
     - ``SCALE_FACTOR_Z``
     - [number]

       Default: 0.01
     - 
   * - **source projection**
     - ``PROJECTION``
     - [enumeration]

       Default: 0
     - One of:

       * 0 --- ---
       * 1 --- epsg
       * 2 --- utm
       * 3 --- sp83
       * 4 --- sp27
       * 5 --- longlat
       * 6 --- latlong
       * 7 --- ecef

   * - **source epsg code**
     - ``EPSG_CODE``
     - [number]
     - 
   * - **utm zone**
     - ``UTM``
     - [enumeration]

       Default: 0
     - One of:

       * 0 --- ---
       * 1 --- 1 (north)
       * 2 --- 2 (north)
       * 3 --- 3 (north)
       * 4 --- 4 (north)
       * 5 --- 5 (north)
       * 6 --- 6 (north)
       * 7 --- 7 (north)
       * 8 --- 8 (north)
       * 9 --- 9 (north)
       * 10 --- 10 (north)
       * 11 --- 11 (north)
       * 12 --- 12 (north)
       * 13 --- 13 (north)
       * 14 --- 14 (north)
       * 15 --- 15 (north)
       * 16 --- 16 (north)
       * 17 --- 17 (north)
       * 18 --- 18 (north)
       * 19 --- 19 (north)
       * 20 --- 20 (north)
       * 21 --- 21 (north)
       * 22 --- 22 (north)
       * 23 --- 23 (north)
       * 24 --- 24 (north)
       * 25 --- 25 (north)
       * 26 --- 26 (north)
       * 27 --- 27 (north)
       * 28 --- 28 (north)
       * 29 --- 29 (north)
       * 30 --- 30 (north)
       * 31 --- 31 (north)
       * 32 --- 32 (north)
       * 33 --- 33 (north)
       * 34 --- 34 (north)
       * 35 --- 35 (north)
       * 36 --- 36 (north)
       * 37 --- 37 (north)
       * 38 --- 38 (north)
       * 39 --- 39 (north)
       * 40 --- 40 (north)
       * 41 --- 41 (north)
       * 42 --- 42 (north)
       * 43 --- 43 (north)
       * 44 --- 44 (north)
       * 45 --- 45 (north)
       * 46 --- 46 (north)
       * 47 --- 47 (north)
       * 48 --- 48 (north)
       * 49 --- 49 (north)
       * 50 --- 50 (north)
       * 51 --- 51 (north)
       * 52 --- 52 (north)
       * 53 --- 53 (north)
       * 54 --- 54 (north)
       * 55 --- 55 (north)
       * 56 --- 56 (north)
       * 57 --- 57 (north)
       * 58 --- 58 (north)
       * 59 --- 59 (north)
       * 60 --- 60 (north)
       * 61 --- 1 (south)
       * 62 --- 2 (south)
       * 63 --- 3 (south)
       * 64 --- 4 (south)
       * 65 --- 5 (south)
       * 66 --- 6 (south)
       * 67 --- 7 (south)
       * 68 --- 8 (south)
       * 69 --- 9 (south)
       * 70 --- 10 (south)
       * 71 --- 11 (south)
       * 72 --- 12 (south)
       * 73 --- 13 (south)
       * 74 --- 14 (south)
       * 75 --- 15 (south)
       * 76 --- 16 (south)
       * 77 --- 17 (south)
       * 78 --- 18 (south)
       * 79 --- 19 (south)
       * 80 --- 20 (south)
       * 81 --- 21 (south)
       * 82 --- 22 (south)
       * 83 --- 23 (south)
       * 84 --- 24 (south)
       * 85 --- 25 (south)
       * 86 --- 26 (south)
       * 87 --- 27 (south)
       * 88 --- 28 (south)
       * 89 --- 29 (south)
       * 90 --- 30 (south)
       * 91 --- 31 (south)
       * 92 --- 32 (south)
       * 93 --- 33 (south)
       * 94 --- 34 (south)
       * 95 --- 35 (south)
       * 96 --- 36 (south)
       * 97 --- 37 (south)
       * 98 --- 38 (south)
       * 99 --- 39 (south)
       * 100 --- 40 (south)
       * 101 --- 41 (south)
       * 102 --- 42 (south)
       * 103 --- 43 (south)
       * 104 --- 44 (south)
       * 105 --- 45 (south)
       * 106 --- 46 (south)
       * 107 --- 47 (south)
       * 108 --- 48 (south)
       * 109 --- 49 (south)
       * 110 --- 50 (south)
       * 111 --- 51 (south)
       * 112 --- 52 (south)
       * 113 --- 53 (south)
       * 114 --- 54 (south)
       * 115 --- 55 (south)
       * 116 --- 56 (south)
       * 117 --- 57 (south)
       * 118 --- 58 (south)
       * 119 --- 59 (south)
       * 120 --- 60 (south)

   * - **state plane code**
     - ``SP``
     - [enumeration]

       Default: 0
     - One of:

       * 0 --- ---
       * 1 --- AK_10
       * 2 --- AK_2
       * 3 --- AK_3
       * 4 --- AK_4
       * 5 --- AK_5
       * 6 --- AK_6
       * 7 --- AK_7
       * 8 --- AK_8
       * 9 --- AK_9
       * 10 --- AL_E
       * 11 --- AL_W
       * 12 --- AR_N
       * 13 --- AR_S
       * 14 --- AZ_C
       * 15 --- AZ_E
       * 16 --- AZ_W
       * 17 --- CA_I
       * 18 --- CA_II
       * 19 --- CA_III
       * 20 --- CA_IV
       * 21 --- CA_V
       * 22 --- CA_VI
       * 23 --- CA_VII
       * 24 --- CO_C
       * 25 --- CO_N
       * 26 --- CO_S
       * 27 --- CT
       * 28 --- DE
       * 29 --- FL_E
       * 30 --- FL_N
       * 31 --- FL_W
       * 32 --- GA_E
       * 33 --- GA_W
       * 34 --- HI_1
       * 35 --- HI_2
       * 36 --- HI_3
       * 37 --- HI_4
       * 38 --- HI_5
       * 39 --- IA_N
       * 40 --- IA_S
       * 41 --- ID_C
       * 42 --- ID_E
       * 43 --- ID_W
       * 44 --- IL_E
       * 45 --- IL_W
       * 46 --- IN_E
       * 47 --- IN_W
       * 48 --- KS_N
       * 49 --- KS_S
       * 50 --- KY_N
       * 51 --- KY_S
       * 52 --- LA_N
       * 53 --- LA_S
       * 54 --- MA_I
       * 55 --- MA_M
       * 56 --- MD
       * 57 --- ME_E
       * 58 --- ME_W
       * 59 --- MI_C
       * 60 --- MI_N
       * 61 --- MI_S
       * 62 --- MN_C
       * 63 --- MN_N
       * 64 --- MN_S
       * 65 --- MO_C
       * 66 --- MO_E
       * 67 --- MO_W
       * 68 --- MS_E
       * 69 --- MS_W
       * 70 --- MT_C
       * 71 --- MT_N
       * 72 --- MT_S
       * 73 --- NC
       * 74 --- ND_N
       * 75 --- ND_S
       * 76 --- NE_N
       * 77 --- NE_S
       * 78 --- NH
       * 79 --- NJ
       * 80 --- NM_C
       * 81 --- NM_E
       * 82 --- NM_W
       * 83 --- NV_C
       * 84 --- NV_E
       * 85 --- NV_W
       * 86 --- NY_C
       * 87 --- NY_E
       * 88 --- NY_LI
       * 89 --- NY_W
       * 90 --- OH_N
       * 91 --- OH_S
       * 92 --- OK_N
       * 93 --- OK_S
       * 94 --- OR_N
       * 95 --- OR_S
       * 96 --- PA_N
       * 97 --- PA_S
       * 98 --- PR
       * 99 --- RI
       * 100 --- SC_N
       * 101 --- SC_S
       * 102 --- SD_N
       * 103 --- SD_S
       * 104 --- St.Croix
       * 105 --- TN
       * 106 --- TX_C
       * 107 --- TX_N
       * 108 --- TX_NC
       * 109 --- TX_S
       * 110 --- TX_SC
       * 111 --- UT_C
       * 112 --- UT_N
       * 113 --- UT_S
       * 114 --- VA_N
       * 115 --- VA_S
       * 116 --- VT
       * 117 --- WA_N
       * 118 --- WA_S
       * 119 --- WI_C
       * 120 --- WI_N
       * 121 --- WI_S
       * 122 --- WV_N
       * 123 --- WV_S
       * 124 --- WY_E
       * 125 --- WY_EC
       * 126 --- WY_W
       * 127 --- WY_WC

   * - **additional command line parameter(s)**

       Optional
     - ``ADDITIONAL_OPTIONS``
     - [string]

       Default: ''
     - Specifies other command-line switches not available
       via this menu but known to the (advanced) LAStools user.
   * - **Output LAS/LAZ file**
     - ``OUTPUT_LASLAZ``
     - [file]

       Default: ``[Skip output]``
     - Specifies where the output point cloud is stored. Use LAZ for
       compressed output,
       LAS for uncompressed output, and TXT for ASCII.
       One of:

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
   * - **output LAS/LAZ file**
     - ``OUTPUT_LASLAZ``
     - [file]
     - The output file

Python code
...........

**Algorithm ID**: ``lastools:txt2las``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**
