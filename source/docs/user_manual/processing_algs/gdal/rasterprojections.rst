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
  Input raster layer.

``Source SRS (EPSG Code)`` [crs]
  Defines the CRS of the input raster layer.

  Default: *EPSG:4326*

``Destination SRS (EPSG Code)`` [crs]
  Defines the target CRS of the raster layer.

  Default: *EPSG:4326*

``Output file resolution in target georeferenced units (leave 0 for no change)`` [number]
  Defines the output file resolution of reprojection result.

  Default: *0.0*

``Resampling method`` [enumeration]
  Several resampling methods can be chosen for the reprojection.
  By default a near resampling method is chosen.

  Options:

  * 0 --- near
  * 1 --- bilinear
  * 2 --- cubic
  * 3 --- cubicspline
  * 4 --- lanczos

  Default: *0*

``Additional creation parameters`` [string]
  Optional

  <put parameter description here>

  Default: *(not set)*

``Output data type`` [enumeration]
  Defines the format of the output raster file.

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

Outputs
.......

``Output layer`` [raster]
  <put output description here>


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/3.4 for QGIS 3.4 docs and translations.`
