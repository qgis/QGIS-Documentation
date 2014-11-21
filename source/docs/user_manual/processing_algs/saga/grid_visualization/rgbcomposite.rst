Rgb composite
=============

Description
-----------

<put algortithm description here>

Parameters
----------

``R`` [raster]
  <put parameter description here>

``G`` [raster]
  <put parameter description here>

``B`` [raster]
  <put parameter description here>

``Method for R value`` [selection]
  <put parameter description here>

  Options:

  * 0 --- 0 - 255
  * 1 --- Rescale to 0 - 255
  * 2 --- User defined rescale
  * 3 --- Percentiles
  * 4 --- Percentage of standard deviation

  Default: *0*

``Method for G value`` [selection]
  <put parameter description here>

  Options:

  * 0 --- 0 - 255
  * 1 --- Rescale to 0 - 255
  * 2 --- User defined rescale
  * 3 --- Percentiles
  * 4 --- Percentage of standard deviation

  Default: *0*

``Method for B value`` [selection]
  <put parameter description here>

  Options:

  * 0 --- 0 - 255
  * 1 --- Rescale to 0 - 255
  * 2 --- User defined rescale
  * 3 --- Percentiles
  * 4 --- Percentage of standard deviation

  Default: *0*

``Rescale Range for RED min`` [number]
  <put parameter description here>

  Default: *0*

``Rescale Range for RED max`` [number]
  <put parameter description here>

  Default: *255*

``Percentiles Range for RED max`` [number]
  <put parameter description here>

  Default: *1*

``Percentiles Range for RED max`` [number]
  <put parameter description here>

  Default: *99*

``Percentage of standard deviation for RED`` [number]
  <put parameter description here>

  Default: *150.0*

``Rescale Range for GREEN min`` [number]
  <put parameter description here>

  Default: *0*

``Rescale Range for GREEN max`` [number]
  <put parameter description here>

  Default: *255*

``Percentiles Range for GREEN max`` [number]
  <put parameter description here>

  Default: *1*

``Percentiles Range for GREEN max`` [number]
  <put parameter description here>

  Default: *99*

``Percentage of standard deviation for GREEN`` [number]
  <put parameter description here>

  Default: *150.0*

``Rescale Range for BLUE min`` [number]
  <put parameter description here>

  Default: *0*

``Rescale Range for BLUE max`` [number]
  <put parameter description here>

  Default: *255*

``Percentiles Range for BLUE max`` [number]
  <put parameter description here>

  Default: *1*

``Percentiles Range for BLUE max`` [number]
  <put parameter description here>

  Default: *99*

``Percentage of standard deviation for BLUE`` [number]
  <put parameter description here>

  Default: *150.0*

Outputs
-------

``Output RGB`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:rgbcomposite', grid_r, grid_g, grid_b, r_method, g_method, b_method, r_range_min, r_range_max, r_perctl_min, r_perctl_max, r_percent, g_range_min, g_range_max, g_perctl_min, g_perctl_max, g_percent, b_range_min, b_range_max, b_perctl_min, b_perctl_max, b_percent, grid_rgb)

See also
--------

