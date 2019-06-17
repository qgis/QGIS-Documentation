.. only:: html


Vector conversion
=================

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _gdalconvertformat:

Convert format
--------------
Converts any OGR-supported vector layer into another OGR-supported format.

This algorithm is derived from the `ogr2ogr utility <https://www.gdal.org/ogr2ogr.html>`_ .

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer.

``Destination Format`` [enumeration]
  Defines the destination format. By default this is ESRI Shapefile.

  Options:

  * 0 --- ESRI Shapefile
  * 1 --- GeoJSON
  * 2 --- GeoRSS
  * 3 --- SQLite
  * 4 --- GMT
  * 5 --- MapInfo File
  * 6 --- INTERLIS 1
  * 7 --- INTERLIS 2
  * 8 --- GML
  * 9 --- Geoconcept
  * 10 --- DXF
  * 11 --- DGN
  * 12 --- CSV
  * 13 --- BNA
  * 14 --- S57
  * 15 --- KML
  * 16 --- GPX
  * 17 --- PGDump
  * 18 --- GPSTrackMaker
  * 19 --- ODS
  * 20 --- XLSX
  * 21 --- PDF

  Default: *0*

``Creation Options`` [string]
  Optional

  <put parameter description here>

  Default: *(not set)*

Outputs
.......

``Output layer`` [vector: any]
  Output vector layer.


.. _gdalrasterize:

Rasterize (vector to raster)
----------------------------
Converts vector geometries (points, lines and polygons) into a raster image.

This algorithm is derived from the `GDAL rasterize utility <https://www.gdal.org/gdal_rasterize.html>`_ .

``Default menu``: :menuselection:`Raster --> Conversion`

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer with point, line or polygon geometries.

``Field to use for a burn-in value`` [tablefield: numeric]
  Optional

  Defines the attribute field from which the attributes for the pixels
  should be chosen.

``A fixed value to burn`` [number]
  Optional

  A fixed value to burn into a band for all features.

  Default: *0.0*

``Output raster size units`` [enumeration]
  Units to use when defining the output raster size/resolution.

  Options:

  * 0 --- Pixels
  * 1 --- Georeferenced units

  Default: *0*

``Width/Horizontal resolution`` [number]
  Sets the width (if size units is "Pixels") or horizontal resolution
  (if size units is "Georeferenced units") of the output raster.

  Default: *0.0*

``Height/Vertical resolution`` [number]
  Sets the height (if size units is "Pixels") or vertical resolution
  (if size units is "Georeferenced units") of the output raster.

  Default: *0.0*

``Output extent (xmin, xmax, ymin, ymax)`` [extent]
  Extent of the output raster layer. If the extent is not specified, the minimum
  extent that covers the selected reference layer(s) will be used.

``Assign a specified nodata value to output bands`` [number]
  Optional

  Assigns a specified nodata value to output bands

  Default: *0.0*

``Additional creation options``
  Optional

  Allows to add one or more creation options that can be used to control
  particulars (colorimetry, block size, file compression...) about the file to be
  created. For convenience, you can rely on predefined profiles (see
  :ref:`GDAL driver options section <gdal_createoptions>`).

``Output data type`` [enumeration]
  Defines the type of the resulting raster image.

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

``Pre-initialize the output image with value`` [number]
  Optional

  Pre-initializes the output image bands with this value.
  Not marked as the nodata value in the output file.
  The same value is used in all the bands.

``Invert rasterization`` [boolean]
  Burns the fixed burn value, or the burn value associated with the first feature
  into all parts of the image not inside the provided polygon.

  Default: *False*

Outputs
.......

``Rasterized`` [raster]
  Output raster layer.
