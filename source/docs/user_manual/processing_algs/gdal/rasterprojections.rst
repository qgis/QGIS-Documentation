.. only:: html

   |updatedisclaimer|

Raster projections
==================

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _gdalassignprojection:

Assign projection
-----------------
Applies a coordinate system to a raster dataset.

This algorithm is derived from the the `GDAL edit utility <https://www.gdal.org/gdal_edit.html>`_ .

``Default menu``: :menuselection:`Raster --> Projections`

Parameters
..........

``Input layer`` [raster]
  Input raster layer.

``Desired CRS`` [CRS]
  Defines the coordinate system to apply to the input raster layer.


.. _gdalextractprojection:

Extract projection
------------------
Extracts the projection of a raster file and writes it into a *world*
file with extension :file:`.wld`.

This algorithm is derived from the `GDAL srsinfo utility <https://www.gdal.org/gdalsrsinfo.html>`_ .

``Default menu``: :menuselection:`Raster --> Projections`

Parameters
..........

``Input file`` [raster]
  Input raster.
  The raster layer has to be file based, as the algorithm uses the path
  to the raster file as the location of the generated :file:`.wld` file.
  Using a non-file raster layer will lead to an error.

``Create also .prj file`` [boolean]
  If this is activated a :file:`.prj` file containing the projection
  information is also created.

  Default: *False*

Outputs
.......

``World file`` [file]
  Text file with extension :file:`.wld` containing transformation parameters
  for  the raster file.

``ESRI Shapefile prj file`` [file]
  Text file with :file:`.prj` extension that describes the CRS.
  Will be None if ``Create also .prj file`` is False.

.. _gdalwarpreproject:

Warp (reproject)
----------------
Transfers a raster layer into another Coordinate Reference System (CRS).
The output file resolution and the resampling method can be chosen.

This algorithm is derived from the `GDAL warp utility <https://www.gdal.org/gdalwarp.html>`_ .

``Default menu``: :menuselection:`Raster --> Projections`

Parameters
..........

``Input layer`` [raster]
  Input raster layer to reproject.

``Source CRS`` [crs]
  Optional

  Defines the CRS of the input raster layer.

``Target CRS`` [crs]
  Defines the CRS of the output raster layer.

  Default: *EPSG:4326*

``Resampling method to use`` [enumeration]
  Pixel value resampling method to use.

  Options:

  * 0 --- Nearest neighbour
  * 1 --- Bilinear
  * 2 --- Cubic
  * 3 --- Cubic spline
  * 4 --- Lanczos windowed sinc
  * 5 --- Average
  * 6 --- Mode
  * 7 --- Maximum
  * 8 --- Minimum
  * 9 --- Median
  * 10 --- First quartile
  * 11 --- Third quartile

  Default: *0*

``Nodata value for output bands`` [number]
  Sets nodata value for output bands. If not provided, then nodata values will
  be copied from the source dataset.

``Output file resolution in target georeferenced units`` [number]
  Defines the output file resolution of reprojection result.

``Additional creation options``
  Optional

  Allows to add one or more creation options that can be used to control
  particulars (colorimetry, block size, file compression...) about the file to be
  created. For convenience, you can rely on predefined profiles (see
  :ref:`GDAL driver options section <gdal_createoptions>`).

``Output data type`` [enumeration]
  Defines the data type of the output bands.

  Options:

  * 0 --- Use input layer data type
  * 1 --- Byte
  * 2 --- Int16
  * 3 --- UInt16
  * 4 --- UInt32
  * 5 --- Int32
  * 6 --- Float32
  * 7 --- Float64
  * 8 --- CInt16
  * 9 --- CInt32
  * 10 --- CFloat32
  * 11 --- CFloat64

  Default: *0*

``Georeferenced extents of output file to be created (xmin, xmax, ymin, ymax)`` [extent]
  Optional

  Sets the georeferenced extent of the output file to be created (in the ``target CRS``
  by default. In the ``CRS of the target raster extent``, if specified).

``CRS of the target raster extent`` [crs]
  Optional

  Specifies the CRS in which to interpret the coordinates given for the extent
  of the output file. This must not be confused with the target CRS of the output
  dataset. It is instead a convenience e.g. when knowing the output coordinates
  in a geodetic long/lat CRS, but wanting a result in a projected coordinate system.

``Use multithreaded warping implementation`` [boolean]
  Two threads will be used to process chunks of the image and perform input/output
  operations simultaneously. Note that the computation itself is not multithreaded.

  Default: *False*

``Additional command line parameters`` [string]
  Optional

  Allows adding more advanced reprojection parameters.


Outputs
.......

``Reprojected`` [raster]
  Reprojected output raster layer.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/3.4 for QGIS 3.4 docs and translations.`
