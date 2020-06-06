Vector geoprocessing
====================

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _gdalbuffervectors:

Buffer vectors
--------------
Create buffers around the features of a vector layer.

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
      - The input vector layer
   *  - **Geometry column name**
      - ``GEOMETRY``
      - [string]

        Default: 'geometry'
      - The name of the input layer geometry column to use
   *  - **Buffer distance**
      - ``DISTANCE``
      - [number]

        Default: 10.0
      - Minimum: 0.0
   *  - **Dissolve by attribute**

        Optional
      - ``FIELD``
      - [tablefield: any]

        Default: None
      - Field to use for dissolving
   *  - **Dissolve results**
      - ``DISSOLVE``
      - [boolean]

        Default: False
      - If set, the result is dissolved.
	If no field is set for dissolving, all the buffers are
	dissolved into one feature.
   *  - **Produce one feature for each geometry in any kind of
        geometry collection in the source file**
      - ``EXPLODE_COLLECTIONS``
      - [boolean]

        Default: False
      - 
   *  - **Additional creation options**

        (optional)
      - ``OPTIONS``
      - [string]

        Default: '' (no additional options)
      - Additional GDAL creation options.
   *  - **Buffer**
      - ``OUTPUT``
      - [vector: polygon]

        Default: ``[Save to temporary file]``
      - Specify the output buffer layer. One of:

        * Save to a Temporary File
        * Save to File...

        The file encoding can also be changed here.

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
   *  - **Buffer**
      - ``OUTPUT``
      - [vector: polygon]
      - The output buffer layer

**Algorithm ID**: ``gdal:buffervectors``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalclipvectorbyextent:

Clip vector by extent
----------------------
Clips any OGR-supported vector file to a given extent.

This algorithm is derived from the
`ogr2ogr utility <https://gdal.org/ogr2ogr.html>`_ .

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
      - The input vector layer
   *  - **Clip extent**
      - ``EXTENT``
      - [extent]
      - Defines the bounding box that should be used for the
        output vector file.
        It has to be defined in target CRS coordinates.
   *  - **Additional creation options**

        (optional)
      - ``OPTIONS``
      - [string]

        Default: '' (no additional options)
      - Additional GDAL creation options.
   *  - **Clipped (extent)**
      - ``OUTPUT``
      - [same as input]

        Default: ``[Save to temporary file]``
      - Specify the output (clipped) layer. One of:

        * Save to a Temporary File
        * Save to File...

        The file encoding can also be changed here.

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
   *  - **Clipped (extent)**
      - ``OUTPUT``
      - [same as input]
      - The output (clipped) layer.
        The default format is "ESRI Shapefile".

**Algorithm ID**: ``gdal:clipvectorbyextent``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalclipvectorbymasklayer:

Clip vector by mask layer
-------------------------
Clips any OGR-supported vector layer by a mask polygon layer.

This algorithm is derived from the `ogr2ogr utility
<https://gdal.org/ogr2ogr.html>`_ .

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
      - The input vector layer
   *  - **Mask layer**
      - ``MASK``
      - [vector: polygon]
      - Layer to be used as clipping extent for the input vector
	layer.
   *  - **Additional creation options**

        (optional)
      - ``OPTIONS``
      - [string]

        Default: '' (no additional options)
      - Additional GDAL creation options.
   *  - **Clipped (mask)**
      - ``OUTPUT``
      - [same as input]

        Default: ``[Save to temporary file]``
      - The output (masked) layer. One of:

        * Save to a Temporary File
        * Save to File...

        The file encoding can also be changed here.

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
   *  - **Clipped (mask)**
      - ``OUTPUT``
      - [same as input]
      - The output (masked) layer.
        The default format is "ESRI Shapefile".

**Algorithm ID**: ``gdal:clipvectorbymasklayer``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdaldissolve:

Dissolve
--------
Dissolve (combine) geometries that have the same value for
a given attribute / field.
The output geometries are multipart.


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
      - The input layer to dissolve
   *  - **Dissolve field**

        (optional)
      - ``FIELD``
      - [tablefield: any]
      - The field of the input layer to use for dissolving
   *  - **Geometry column name**
      - ``GEOMETRY``
      - [string]

        Default: 'geometry'
      - The name of the input layer geometry column to use
        for dissolving.
   *  - **Produce one feature for each geometry in any kind of
        geometry collection in the source file**
      - ``EXPLODE_COLLECTIONS``
      - [boolean]

        Default: False
      - Produce one feature for each geometry in any kind of geometry
        collection in the source file
   *  - **Keep input attributes**
      - ``KEEP_ATTRIBUTES``
      - [boolean]

        Default: False
      - Keep all attributes from the input layer
   *  - **Count dissolved features**
      - ``COUNT_FEATURES``
      - [boolean]

        Default: False
      - Count the dissolved features and include it in the output
        layer.
   *  - **Compute area and perimeter of dissolved features**
      - ``COMPUTE_AREA``
      - [boolean]

        Default: False
      - Compute the area and perimeter of dissolved features and
	include them in the output layer
   *  - **Compute min/max/sum/mean for attribute**
      - ``COMPUTE_STATISTICS``
      - [boolean]

        Default: False
      - Calculate statistics (min, max, sum and mean) for the numeric
        attribute specified and include them in the output layer
   *  - **Numeric attribute to calculate statistics on**

        (optional)
      - ``STATISTICS_ATTRIBUTE``
      - [tablefield: numeric]
      - The numeric attribute to calculate statistics on
   *  - **Additional creation options**

        (optional)
      - ``OPTIONS``
      - [string]

        Default: '' (no additional options)
      - Additional GDAL creation options.
   *  - **Dissolved**
      - ``OUTPUT``
      - [same as input]

        Default: ``[Save to temporary file]``
      - Specify the output layer. One of:

        * Save to a Temporary File
        * Save to File...

        The file encoding can also be changed here.

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
   *  - **Dissolved**
      - ``OUTPUT``
      - [same as input]
      - The output multipart geometry layer (with dissolved
	geometries)

**Algorithm ID**: ``gdal:dissolve``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdaloffsetcurve:

Offset curve
------------
Offsets lines by a specified distance.
Positive distances will offset lines to the left, and negative
distances will offset them to the right.

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
      - [vector: line]
      - The input line layer
   *  - **Geometry column name**
      - ``GEOMETRY``
      - [string]

        Default: 'geometry'
      - The name of the input layer geometry column to use
   *  - **Offset distance (left-sided: positive, right-sided: negative)**
      - ``DISTANCE``
      - [number]

        Default: 10.0
      - 
   *  - **Additional creation options**

        (optional)
      - ``OPTIONS``
      - [string]

        Default: '' (no additional options)
      - Additional GDAL creation options.
   *  - **Offset curve**
      - ``OUTPUT``
      - [vector: line]

        Default: ``[Save to temporary file]``
      - Specify the output line layer. One of:

        * Save to a Temporary File
        * Save to File...

        The file encoding can also be changed here.

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
   *  - **Offset curve**
      - ``OUTPUT``
      - [vector: line]
      - The output offset curve layer

**Algorithm ID**: ``gdal:offsetcurve``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalonesidebuffer:

One side buffer
---------------
Creates a buffer on one side (right or left) of the lines in a line
vector layer.

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
      - [vector: line]
      - The input line layer
   *  - **Geometry column name**
      - ``GEOMETRY``
      - [string]

        Default: 'geometry'
      - The name of the input layer geometry column to use
   *  - **Buffer distance**
      - ``DISTANCE``
      - [number]

        Default: 10.0
      - 
   *  - **Buffer side**
      - ``BUFFER_SIDE``
      - [enumeration]

        Default: 0
      - One of:

        * 0 --- Right
        * 1 --- Left

   *  - **Dissolve by attribute**

        Optional
      - ``FIELD``
      - [tablefield: any]

        Default: None
      - Field to use for dissolving
   *  - **Dissolve all results**
      - ``DISSOLVE``
      - [boolean]

        Default: False
      - If set, the result is dissolved.
	If no field is set for dissolving, all the buffers are
	dissolved into one feature.
   *  - **Produce one feature for each geometry in any kind of
        geometry collection in the source file**
      - ``EXPLODE_COLLECTIONS``
      - [boolean]

        Default: False
      - 
   *  - **Additional creation options**

        (optional)
      - ``OPTIONS``
      - [string]

        Default: '' (no additional options)
      - Additional GDAL creation options.
   *  - **One-sided buffer**
      - ``OUTPUT``
      - [vector: polygon]

        Default: ``[Save to temporary file]``
      - Specify the output buffer layer. One of:

        * Save to a Temporary File
        * Save to File...

        The file encoding can also be changed here.

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
   *  - **One-sided buffer**
      - ``OUTPUT``
      - [vector: polygon]
      - The output buffer layer

**Algorithm ID**: ``gdal:onesidebuffer``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _gdalpointsalonglines:

Points along lines
------------------
Generates a point on each line of a line vector layer at a distance
from start.
The distance is provided as a fraction of the line length.

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
      - [vector: line]
      - The input line layer
   *  - **Geometry column name**
      - ``GEOMETRY``
      - [string]

        Default: 'geometry'
      - The name of the input layer geometry column to use
   *  - **Distance from line start represented as a fraction of line
        length**
      - ``DISTANCE``
      - [number]

        Default: 0.5 (middle of the line)
      - 
   *  - **Additional creation options**

        (optional)
      - ``OPTIONS``
      - [string]

        Default: '' (no additional options)
      - Additional GDAL creation options.
   *  - **Points along line**
      - ``OUTPUT``
      - [vector: point]

        Default: ``[Save to temporary file]``
      - Specify the output point layer.
        One of:

        * Save to a Temporary File
        * Save to File...

        The file encoding can also be changed here.

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
   *  - **Points along line**
      - ``OUTPUT``
      - [vector: point]
      - The output point layer

**Algorithm ID**: ``gdal:pointsalonglines``

.. include:: ../qgis/qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**
