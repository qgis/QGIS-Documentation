*******************************
LAStools algorithm provider
*******************************

`LAStools <https://rapidlasso.com/lastools/>`_ is a collection of highly
efficient, multicore command line tools for LiDAR data processing.

.. only:: html

   .. contents::
      :local:
      :depth: 1

blast2dem
---------

Description
...........

Turns points (up to billions) via seamless Delaunay triangulation
implemented using streaming into large elevation, intensity, or RGB rasters.

For more info see the `blast2dem <https://rapidlasso.com/blast/blast2dem>`_ page and 
its online `README <http://lastools.org/download/blast2dem_README.txt>`__ file.

Parameters
..........

``verbose`` [boolean]
  Generates more textual control output to the console.
  
  Default: *False*

``open LAStools GUI`` [boolean]
  Starts the GUI of LAStools with pre-populated input files.
  
  Default: *False*
  
``input LAS/LAZ file`` [points]
  The file containing the points to be rastered in LAS/LAZ format.

``filter`` [string]
  Specifies which points to use to construct the temporary TIN that is then rastered.

  Default: *---*

``step size / pixel size`` [number]
  Specifies the size of the cells of the grid the TIN is rastered onto.

  Default: *1.0*

``Attribute`` [string]
  Specifies the attribute that is to be rastered.

  Default: *elevation*

``Product`` [string]
  Specifies how the attribute is to be turned into raster values.

  Default: *actual values*

``use tile bounding box`` [boolean]
  Specifies to limit the rastered area to the tile bounding box (only meaningful
  for input LAS/LAZ tiles that were created with lastile).
  
  Default: *False*

``additional command line parameter(s)`` [string]
  Specifies other command-line switches not available via this menu but known to
  the (advanced) LAStools user.

  Default: *---*
  
Outputs
.......

``Output raster file`` [raster]
  Specifies where the output raster is stored. Use image rasters like TIF, PNG, 
  and JPG for false color, gray ramps, and hillshades. Use value rasters 
  like TIF, BIL, IMG, ASC, DTM, FLT, XYZ, and CSV for actual values.


blast2iso
---------

Description
...........

Turns points (up to billions) via seamless Delaunay triangulation
implemented using streaming into large iso-contour lines (optionally tiled).

For more info see the `blast2iso <https://rapidlasso.com/blast/blast2iso>`_ page and
its online `README <http://lastools.org/download/blast2iso_README.txt>`__ file.

Parameters
..........

``verbose`` [boolean]
  Generates more textual control output to the console.
  
  Default: *False*

``open LAStools GUI`` [boolean]
  Starts the GUI of LAStools with pre-populated input files.
  
  Default: *False*
  
``input LAS/LAZ file`` [points]
  The file containing the points to be rastered in LAS/LAZ format.

``smooth`` [integer]
  Specifies if and with how many passes the temporary TIN should be smoothed.

  Default: *0*

``extract isoline with spacing of`` [number]
  Specifies spacing at which iso-contour lines are getting extracted.

  Default: *10.0*

``clean isolines shorter than`` [number]
  Omits iso-contour lines that are shorter than the specified length.

  Default: *0.0*

``simplify segments shorter than`` [number]
  Rudimentary simplification of iso-contour line segments that are shorter than
  the specified length.

  Default: *0.0*

``simplify segment pairs with area less than`` [number]
  Rudimentary simplification of bumps formed by consecutive line segments whose
  area is smaller than the specified size.

  Default: *0.0*

``additional command line parameter(s)`` [string]
  Specifies other command-line switches not available via this menu but known
  to the (advanced) LAStools user.

  Default: *---*
  
Outputs
.......

``Output vector file`` [raster]
  Specifies where the output vector is stored. Use SHP or WKT output files.
  If your input LiDAR file is in geographic coordinates (long/lat) or has 
  geo-referencing information (but only then) you can also create a KML output file.


las2dem
-------

Description
...........

Turns points (up to 20 million) via a temporary Delaunay triangulation
that is rasterized with a user-defined step size into an elevation, intensity, or
RGB raster.

For more info see the `las2dem <https://rapidlasso.com/lastools/las2dem>`_ page
and its online `README <http://lastools.org/download/las2dem_README.txt>`__ file.

Parameters
..........

``verbose`` [boolean]
  Generates more textual control output to the console.
  
  Default: *False*

``open LAStools GUI`` [boolean]
  Starts the GUI of LAStools with pre-populated input files.
  
  Default: *False*
  
``input LAS/LAZ file`` [points]
  The file containing the points to be rastered in LAS/LAZ format.

``filter`` [enumeration]
  Specifies which points to use to construct the temporary TIN that is then rastered.

  Default: *---*

``step size / pixel size`` [number]
  Specifies the size of the cells of the grid the TIN is rastered onto.

  Default: *1.0*

``Attribute`` [enumeration]
  Specifies the attribute that is to be rastered.

  Default: *elevation*

``Product`` [enumeration]
  Specifies how the attribute is to be turned into raster values.

  Default: *actual values*

``use tile bounding box`` [boolean]
  Specifies to limit the rastered area to the tile bounding box (only meaningful
  for input LAS/LAZ tiles that were created with lastile).
  
  Default: *False*

``additional command line parameter(s)`` [string]
  Specifies other command-line switches not available via this menu but known to
  the (advanced) LAStools user.

  Default: *---*
  
Outputs
.......

``Output raster file`` [raster]
  Specifies where the output raster is stored. Use image rasters like TIF, PNG,
  and JPG for false color, gray ramps, and hillshades. Use value rasters like
  TIF, BIL, IMG, ASC, DTM, FLT, XYZ, and CSV for actual values.


las2iso
-------

Description
...........

Turns point clouds (up to 20 million per file) into iso-contour lines
by creating a temporary Delaunay triangulation on which the contours are then traced.

For more info see the `las2iso <https://rapidlasso.com/lastools/las2iso>`_ page and its
online `README <http://lastools.org/download/las2iso_README.txt>`__ file.

Parameters
..........

``verbose`` [boolean]
  Generates more textual control output to the console.
  
  Default: *False*

``open LAStools GUI`` [boolean]
  Starts the GUI of LAStools with pre-populated input files.
  
  Default: *False*
  
``input LAS/LAZ file`` [points]
  The file containing the points to be rastered in LAS/LAZ format.

``smooth`` [integer]
  Specifies if and with how many passes the temporary TIN should be smoothed.

  Default: *0*

``extract isoline with spacing of`` [number]
  Specifies spacing at which iso-contour lines are getting extracted.

  Default: *10.0*

``clean isolines shorter than`` [number]
  Omits iso-contour lines that are shorter than the specified length.

  Default: *0.0*

``simplify segments shorter than`` [number]
  Rudimentary simplification of iso-contour line segments that are shorter than
  the specified length.

  Default: *0.0*

``simplify segment pairs with area less than`` [number]
  Rudimentary simplification of bumps formed by consecutive line segments whose
  area is smaller than the specified size.

  Default: *0.0*

``additional command line parameter(s)`` [string]
  Specifies other command-line switches not available via this menu but known to
  the (advanced) LAStools user.

  Default: *---*
  
Outputs
.......

``Output vector file`` [raster]
  Specifies where the output vector is stored. Use SHP or WKT output files.
  If your input LiDAR file is in geographic coordinates (long/lat) or has geo-referencing
  information (but only then) you can also create a KML output file.


las2las_filter
--------------

Description
...........

Uses las2las to filter LiDAR points based on different attributes and
to write the surviving subset of points to a new LAZ or LAS file.

For more info see the `las2las <https://rapidlasso.com/lastools/las2las>`_ page and
its online `README <http://lastools.org/download/las2las_README.txt>`__ file.

Parameters
..........

``verbose`` [boolean]
  Generates more textual control output to the console.

  Default: *False*

``open LAStools GUI`` [boolean]
  Starts the GUI of LAStools with pre-populated input files.
  
  Default: *False*
  
``input LAS/LAZ file`` [file]
  The file containing the points to be processed.

``filter (by return, classification, flags)`` [enumeration]
  Filters points based on various options such as return, classification, or flags.

  Options:

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

  Default: *0*

``second filter (by return, classification, flags)`` [enumeration]
  Also filters points based on various options such as return, classification, or flags.

  Options:

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

  Default: *0*

``filter (by coordinate, intensity, GPS time, ...)`` [enumeration]
  Filters points based on various other options (that require a value as argument).

  Options:

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

  Default: *0*

``value for filter (by coordinate, intensity, GPS time, ...)`` [string]
  The value that is the argument for the filter selected above.

  Default: *(not set)*

``second filter (by coordinate, intensity, GPS time, ...)`` [enumeration]
  Also filters points based on various other options (that require a value as argument).

  Options:

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

  Default: *0*

``value for second filter (by coordinate, intensity, GPS time, ...)`` [string]
  The value that is the argument for the filter selected above.

  Default: *(not set)*

``additional command line parameter(s)`` [string]
  Specifies other command-line switches not available via this menu but known to
  the (advanced) LAStools user.

  Default: *---*

Outputs
.......

``output LAS/LAZ file`` [file]
  Specifies where the output point cloud is stored. Use LAZ for compressed output,
  LAS for uncompressed output, and TXT for ASCII.


las2las_project
---------------

Description
...........

<put algorithm description here>

Parameters
..........

``verbose`` [boolean]
  <put parameter description here>

  Default: *False*

``input LAS/LAZ file`` [file]
  Optional

  <put parameter description here>

``source projection`` [enumeration]
  <put parameter description here>

  Options:

  * 0 --- ---
  * 1 --- utm
  * 2 --- sp83
  * 3 --- sp27
  * 4 --- longlat
  * 5 --- latlong

  Default: *0*

``source utm zone`` [enumeration]
  <put parameter description here>

  Options:

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

  Default: *0*

``source state plane code`` [enumeration]
  <put parameter description here>

  Options:

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

  Default: *0*

``target projection`` [enumeration]
  <put parameter description here>

  Options:

  * 0 --- ---
  * 1 --- utm
  * 2 --- sp83
  * 3 --- sp27
  * 4 --- longlat
  * 5 --- latlong

  Default: *0*

``target utm zone`` [enumeration]
  <put parameter description here>

  Options:

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

  Default: *0*

``target state plane code`` [enumeration]
  <put parameter description here>

  Options:

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

  Default: *0*

Outputs
.......

``output LAS/LAZ file`` [file]
  <put output description here>


las2las_transform
------------------

Description
...........

Uses las2las to filter LiDAR points based on different attributes and
to write the surviving subset of points to a new LAZ or LAS file.

For more info see the `las2las <https://rapidlasso.com/lastools/las2las>`_ page and
its online `README <http://lastools.org/download/las2las_README.txt>`__ file.

Parameters
..........

``verbose`` [boolean]
  Generates more textual control output to the console.

  Default: *False*

``open LAStools GUI`` [boolean]
  Starts the GUI of LAStools with pre-populated input files.
  
  Default: *False*
  
``input LAS/LAZ file`` [file]
  The file containing the points to be processed.

``transform (coordinates)`` [enumeration]
  Either translate, scale, or clamp the X, Y, or Z coordinate by the value specified below.

  Options:

  * 0 --- ---
  * 1 --- translate_x
  * 2 --- translate_y
  * 3 --- translate_z
  * 4 --- scale_x
  * 5 --- scale_y
  * 6 --- scale_z
  * 7 --- clamp_z_above
  * 8 --- clamp_z_below

  Default: *0*

``value for transform (coordinates)`` [string]
  The value that specifies the amount of translating, scaling, or clamping done
  by the transform selected above.

  Default: *(not set)*

``second transform (coordinates)`` [enumeration]
  Also either translate, scale, or clamp the X, Y, or Z coordinate by the value
  specified below.

  Options:

  * 0 --- ---
  * 1 --- translate_x
  * 2 --- translate_y
  * 3 --- translate_z
  * 4 --- scale_x
  * 5 --- scale_y
  * 6 --- scale_z
  * 7 --- clamp_z_above
  * 8 --- clamp_z_below

  Default: *0*

``value for second transform (coordinates)`` [string]
  The value that specifies the amount of translating, scaling, or clamping done
  by the transform selected above.

  Default: *(not set)*

``transform (intensities, scan angles, GPS times, ...)`` [enumeration]
  <put parameter description here>

  Options:

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

  Default: *0*

``value for transform (intensities, scan angles, GPS times, ...)`` [string]
  The value that specifies the amount of scaling, translating, clamping or setting
  that is done by the transform selected above.

  Default: *(not set)*

``second transform (intensities, scan angles, GPS times, ...)`` [enumeration]
  <put parameter description here>

  Options:

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

  Default: *0*

``value for second transform (intensities, scan angles, GPS times, ...)`` [string]
  The value that specifies the amount of scaling, translating, clamping or setting
  that is done by the transform selected above.

  Default: *(not set)*

``operations (first 7 need an argument)`` [enumeration]
  <put parameter description here>

  Options:

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
  * 11 --- scale_rgb_up
  * 12 --- scale_rgb_down
  * 13 --- remove_all_vlrs
  * 14 --- remove_extra
  * 15 --- clip_to_bounding_box

  Default: *0*

``argument for operation`` [string]
  The value that is the argument for the operation selected above.

  Default: *(not set)*

``additional command line parameter(s)`` [string]
  Specifies other command-line switches not available via this menu but known to
  the (advanced) LAStools user.

  Default: *---*

Outputs
.......

``output LAS/LAZ file`` [file]
  Specifies where the output point cloud is stored. Use LAZ for compressed output,
  LAS for uncompressed output, and TXT for ASCII.


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
   * - **additional command line paramters**
       
       Optional
     - ``ADDITIONAL OPTIONS``
     - [string]
     
       Default: None
     -
   * - **Output ASCII file**
     - ``OUTPUT``
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
     - ``OUTPUT``
     - [file]
     - The output file


lasindex
--------

Description
...........

<put algorithm description here>

Parameters
..........

``verbose`` [boolean]
  <put parameter description here>

  Default: *False*

``input LAS/LAZ file`` [file]
  Optional

  <put parameter description here>

``is mobile or terrestrial LiDAR (not airborne)`` [boolean]
  <put parameter description here>

  Default: *False*

Outputs
.......
<put output description here>


lasgrid
-------

Description
...........

Grids a selected attribute (e.g. elevation, intensity, classification,
scan angle, ...) of a large point clouds with a user-defined step size onto raster
using a particular method (e.g. min, max, average).

For more info see the `lasgrid <https://rapidlasso.com/lastools/lasgrid>`_ page and
its online `README <http://lastools.org/download/lasgrid_README.txt>`__ file.

Parameters
..........

``verbose`` [boolean]
  Generates more textual control output to the console.
  
  Default: *False*

``open LAStools GUI`` [boolean]
  Starts the GUI of LAStools with pre-populated input files.
  
  Default: *False*
  
``input LAS/LAZ file`` [points]
  The file containing the points to be rastered in LAS/LAZ format.

``filter`` [string]
  Specifies which subset of points to use for subsequent gridding.

  Default: *---*

``step size / pixel size`` [number]
  Specifies the size of the grid cells the points are binned into.

  Default: *1.0*

``Attribute`` [string]
  Specifies the attribute that is to be gridded into each cell.

  Default: *elevation*

``Method`` [string]
  Specifies how the attributes falling into one cell are turned into a raster value.

  Default: *lowest*

``use tile bounding box`` [boolean]
  Specifies to limit the rastered area to the tile bounding box (only meaningful
  for input LAS/LAZ tiles that were created with lastile).
  
  Default: *False*

``additional command line parameter(s)`` [string]
  Specifies other command-line switches not available via this menu but known to
  the (advanced) LAStools user. A common thing to add here would be '-false or
  '-gray' to map all values to a color or a gray value (optionally with a specified
  range of '-set_min_max 40 90' and produce an image.

  Default: *---*
  
``additional command line parameter(s)`` [string]
  Specifies other command-line switches not available via this menu but known to
  the (advanced) LAStools user.

  Default: *---*
  
Outputs
.......

``Output raster file`` [raster]
  Specifies where the output raster is stored. Use image rasters like TIF, PNG,
  and JPG for false color or gray ramps. Use value rasters like TIF, BIL, IMG,
  ASC, DTM, FLT, XYZ, and CSV for actual values.


lasinfo
-------

Description
...........

<put algorithm description here>

Parameters
..........

``verbose`` [boolean]
  <put parameter description here>

  Default: *False*

``input LAS/LAZ file`` [file]
  Optional

  <put parameter description here>

Outputs
.......

``Output ASCII file`` [file]
  <put output description here>


lasmerge
--------

Description
...........

<put algorithm description here>

Parameters
..........

``verbose`` [boolean]
  <put parameter description here>

  Default: *False*

``files are flightlines`` [boolean]
  <put parameter description here>

  Default: *True*

``input LAS/LAZ file`` [file]
  Optional

  <put parameter description here>

``2nd file`` [file]
  Optional

  <put parameter description here>

``3rd file`` [file]
  Optional

  <put parameter description here>

``4th file`` [file]
  Optional

  <put parameter description here>

``5th file`` [file]
  Optional

  <put parameter description here>

``6th file`` [file]
  Optional

  <put parameter description here>

``7th file`` [file]
  Optional

  <put parameter description here>

Outputs
.......

``output LAS/LAZ file`` [file]
  <put output description here>


lasprecision
------------

Description
...........

<put algorithm description here>

Parameters
..........

``verbose`` [boolean]
  <put parameter description here>

  Default: *False*

``input LAS/LAZ file`` [file]
  Optional

  <put parameter description here>

Outputs
.......

``Output ASCII file`` [file]
  <put output description here>


lasquery
--------

Description
...........

<put algorithm description here>

Parameters
..........

``verbose`` [boolean]
  <put parameter description here>

  Default: *False*

``area of interest`` [extent]
  <put parameter description here>

  Default: *0,1,0,1*

Outputs
.......
<put output description here>


lasvalidate
-----------

Description
...........

<put algorithm description here>

Parameters
..........

``verbose`` [boolean]
  <put parameter description here>

  Default: *False*

``input LAS/LAZ file`` [file]
  Optional

  <put parameter description here>

Outputs
.......

``Output XML file`` [file]
  <put output description here>


laszip
------

Description
...........

<put algorithm description here>

Parameters
..........

``verbose`` [boolean]
  <put parameter description here>

  Default: *False*

``input LAS/LAZ file`` [file]
  Optional

  <put parameter description here>

``only report size`` [boolean]
  <put parameter description here>

  Default: *False*

Outputs
.......

``output LAS/LAZ file`` [file]
  <put output description here>


txt2las
-------

Description
...........

<put algorithm description here>

Parameters
..........

``verbose`` [boolean]
  <put parameter description here>

  Default: *False*

``Input ASCII file`` [file]
  Optional

  <put parameter description here>

``parse lines as`` [string]
  <put parameter description here>

  Default: *xyz*

``skip the first n lines`` [number]
  <put parameter description here>

  Default: *0*

``resolution of x and y coordinate`` [number]
  <put parameter description here>

  Default: *0.01*

``resolution of z coordinate`` [number]
  <put parameter description here>

  Default: *0.01*

Outputs
.......

``output LAS/LAZ file`` [file]
  <put output description here>
