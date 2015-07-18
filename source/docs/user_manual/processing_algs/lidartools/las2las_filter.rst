las2las_filter
--------------

Description
...........

This tool uses las2las to filter LiDAR points based on different attributes and write the surviving subset of points into a new file. For more info see the `las2las <http://rapidlasso.com/las2las>`_ page and its online `README <http://lastools.org/download/las2las_README.txt>`_ file.

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

``filter (by return, classification, flags)`` [selection]
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

``second filter (by return, classification, flags)`` [selection]
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

``filter (by coordinate, intensity, GPS time, ...)`` [selection]
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

``second filter (by coordinate, intensity, GPS time, ...)`` [selection]
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

Outputs
.......

``output LAS/LAZ file`` [file]
  Specifies where the output point cloud is stored. Use LAZ for compressed output, LAS for uncompressed output, and TXT for ASCII.

Console usage
.............

::

  processing.runalg('lidartools:las2las_filter', verbose, input_laslaz, filter_return_class_flags1, filter_return_class_flags2, filter_coords_intensity1, filter_coords_intensity1_arg, filter_coords_intensity2, filter_coords_intensity2_arg, output_laslaz)

See also the `las2las <http://rapidlasso.com/las2las>`_ page and its online `README <http://lastools.org/download/las2las_README.txt>`_ file.
