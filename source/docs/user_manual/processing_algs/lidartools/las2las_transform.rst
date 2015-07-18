las2las_transform
--------------

Description
...........

This tool uses las2las to filter LiDAR points based on different attributes and to write the surviving subset of points to a new LAZ or LAS file. For more info see the `las2las <http://rapidlasso.com/las2las>`_ page and its online `README <http://lastools.org/download/las2las_README.txt>`_ file.

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

``transform (coordinates)`` [selection]
  Either translate, scale, or clamp the x, y, or z coordinate by the value specified below.

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
  The value that specifies the amount of translating, scaling, or clamping done by the transform selected above.

  Default: *(not set)*

``second transform (coordinates)`` [selection]
  Also either translate, scale, or clamp the x, y, or z coordinate by the value specified below.

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
  The value that specifies the amount of translating, scaling, or clamping done by the transform selected above.

  Default: *(not set)*

``transform (intensities, scan angles, GPS times, ...)`` [selection]
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
  The value that specifies the amount of scaling, translating, clamping or setting that is done by the transform selected above.

  Default: *(not set)*

``second transform (intensities, scan angles, GPS times, ...)`` [selection]
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
  The value that specifies the amount of scaling, translating, clamping or setting that is done by the transform selected above.

  Default: *(not set)*

``operations (first 7 need an argument)`` [selection]
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
  Specifies other command-line switches not available via this menu but known to the (advanced) LAStools user.

  Default: *---*

Outputs
.......

``output LAS/LAZ file`` [file]
  Specifies where the output point cloud is stored. Use LAZ for compressed output, LAS for uncompressed output, and TXT for ASCII.

Console usage
.............

::

  processing.runalg('lidartools:las2las_transform', verbose, input_laslaz, filter_return_class_flags1, filter_return_class_flags2, filter_coords_intensity1, filter_coords_intensity1_arg, filter_coords_intensity2, filter_coords_intensity2_arg, output_laslaz)

See also the `las2las <http://rapidlasso.com/las2las>`_ page and its online `README <http://lastools.org/download/las2las_README.txt>`_ file.
