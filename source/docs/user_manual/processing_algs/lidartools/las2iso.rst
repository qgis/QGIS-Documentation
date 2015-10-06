las2iso
-------

Description
...........

This tool turns point clouds (up to 20 million per file) into iso-contour lines by creating a temporary Delaunay triangulation on which the contours are then traced. For more info see the `las2iso <http://rapidlasso.com/las2iso>`_ page and its online `README <http://lastools.org/download/las2iso_README.txt>`_ file.

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
  Rudimentary simplification of iso-contour line segments that are shorter than the specified length.

  Default: *0.0*

``simplify segment pairs with area less than`` [number]
  Rudimentary simplification of bumps formed by consecutive line segments whose area is smaller than the specified size.

  Default: *0.0*

``additional command line parameter(s)`` [string]
  Specifies other command-line switches not available via this menu but known to the (advanced) LAStools user.

  Default: *---*
  
Outputs
.......

``Output vector file`` [raster]
  Specifies where the output vector is stored. Use SHP or WKT output files. If your input LiDAR file is in geographic coordinates (long/lat) or has geo-referencing information (but only then) you can also create a KML output file.

Console usage
.............

::

  processing.runalg('las2iso', verbose, gui, input, smooth, isoline_spacing, clean, simplify, simplify_area, additional, output)

See also the `las2iso <http://rapidlasso.com/las2iso>`_ page and its online `README <http://lastools.org/download/las2iso_README.txt>`_ file.
