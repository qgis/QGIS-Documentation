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

This algorithm is derived from the `ogr2ogr utility <https://gdal.org/ogr2ogr.html>`_ .

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   *  - Label
      - Name
      - Type
      - Description
   *  - **Input layer**
      - ``INPUT``
      - [vector: any]
      - Input vector layer
   *  - **Additional creation options**
        
        (optional)
      - ``OPTIONS``
      - [string]
        
        Default: '' (no additional options)
      - Additional GDAL creation options.
   *  - **Converted**
      - ``OUTPUT``
      - [vector: any]
      - Specification of the output vector layer.
        One of 
        * Save to a Temporary File
        * Save to File...
        
        The file encoding can also be changed here.

        For ``Save to File``, the output format has to be specified.
        All GDAL vector formats are supported.
        For ``Save to a Temporary File`` the QGIS default vector format
        will be used.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   *  - Label
      - Name
      - Type
      - Description
   *  - **Converted**
      - ``OUTPUT``
      - [vector: any]
      - The output vector layer


.. _gdalrasterize:

Rasterize (vector to raster)
----------------------------
Converts vector geometries (points, lines and polygons) into a raster image.

This algorithm is derived from the `GDAL rasterize utility <https://gdal.org/gdal_rasterize.html>`_ .

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
