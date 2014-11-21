las2las_filter
==============

Description
-----------

<put algortithm description here>

Parameters
----------

``verbose`` [boolean]
  <put parameter description here>

  Default: *False*

``input LAS/LAZ file`` [file]
  Optional.

  <put parameter description here>

``filter (by return, classification, flags)`` [selection]
  <put parameter description here>

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
  <put parameter description here>

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
  <put parameter description here>

  Options:

  * 0 --- ---
  * 1 --- clip_x_above
  * 2 --- clip_x_below
  * 3 --- clip_y_above
  * 4 --- clip_y_below
  * 5 --- clip_z_above
  * 6 --- clip_z_below
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
  <put parameter description here>

  Default: *(not set)*

``second filter (by coordinate, intensity, GPS time, ...)`` [selection]
  <put parameter description here>

  Options:

  * 0 --- ---
  * 1 --- clip_x_above
  * 2 --- clip_x_below
  * 3 --- clip_y_above
  * 4 --- clip_y_below
  * 5 --- clip_z_above
  * 6 --- clip_z_below
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
  <put parameter description here>

  Default: *(not set)*

Outputs
-------

``output LAS/LAZ file`` [file]
  <put output description here>

Console usage
-------------

::

  processing.runalg('lidartools:las2lasfilter', verbose, input_laslaz, filter_return_class_flags1, filter_return_class_flags2, filter_coords_intensity1, filter_coords_intensity1_arg, filter_coords_intensity2, filter_coords_intensity2_arg, output_laslaz)

See also
--------

