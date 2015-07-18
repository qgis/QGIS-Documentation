lasgrid
-------

Description
...........

This tool grids a selected attribute (e.g. elevation, intensity, classification, scan angle, ...) of a large point clouds with a user-defined step size onto raster using a particular method (e.g. min, max, average). For more info see the `lasgrid <http://rapidlasso.com/lasgrid>`_ page and its online `README <http://lastools.org/download/lasgrid_README.txt>`_ file.

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
  Specifies to limit the rastered area to the tile bounding box (only meaningful for input LAS/LAZ tiles that were created with lastile).
  
  Default: *False*

``additional command line parameter(s)`` [string]
  Specifies other command-line switches not available via this menu but known to the (advanced) LAStools user. A common thing to add here would be '-false or '-gray' to map all values to a color or a gray value (optionally with a specified range of '-set_min_max 40 90' and produce an image.

  Default: *---*
  
Outputs
.......

``Output raster file`` [raster]
  Specifies where the output raster is stored. Use image rasters like TIF, PNG, and JPG for false color or gray ramps. Use value rasters like TIF, BIL, IMG, ASC, DTM, FLT, XYZ, and CSV for actual values.

Console usage
.............

::

  processing.runalg('lasgrid', verbose, gui, input, filter, step, attribute, method, use_tile_bb, additional, output)

See also the `lasgrid <http://rapidlasso.com/lasgrid>`_ page and its online `README <http://lastools.org/download/lasgrid_README.txt>`_ file.
