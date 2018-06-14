.. only:: html

   |updatedisclaimer|

Raster projections
==================

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _gdalassignprojection:

Extract projection
------------------
Extracts the projection of a raster file and writes it into a
world-file.
The algorithm is derived from the the `GDAL srsinfo utility <http://www.gdal.org/gdalsrsinfo.html>`_ .

``Default menu``: :menuselection:`Raster --> Projections`

Parameters
..........

``Input file`` [raster]
  input raster file.

``Create also .prj file`` [boolean]
  If this is activated also a \*.prj-file containing the projection
  information is created.

  Default: *False*

Outputs
.......


.. _gdalwarpreproject:

Warp (reproject)
----------------
Transfers a raster layer into another Coordinate Reference System (CRS).
The output file resolution and the resampling method can be chosen.
The algorithm is derived from the `GDAL warp utility <http://www.gdal.org/gdalwarp.html>`_ .

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

``Resampling method`` [selection]
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
  Optional.

  <put parameter description here>

  Default: *(not set)*

``Output raster type`` [selection]
  Defines the format of the output raster file.
  By default this is Float32.

  Options:

  * 0 --- Byte
  * 1 --- Int16
  * 2 --- UInt16
  * 3 --- UInt32
  * 4 --- Int32
  * 5 --- Float32
  * 6 --- Float64
  * 7 --- CInt16
  * 8 --- CInt32
  * 9 --- CFloat32
  * 10 --- CFloat64

  Default: *5*

Outputs
.......

``Output layer`` [raster]
  <put output description here>


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit http://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
