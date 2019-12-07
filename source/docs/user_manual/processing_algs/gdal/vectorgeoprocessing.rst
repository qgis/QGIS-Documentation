Vector geoprocessing
====================

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _gdalclipvectorbyextent:

Clip vector by extent
----------------------
Clips any OGR-supported vector file to a given extent.

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
        
        Default: "" (no additional options)
      - Additional GDAL creation options.
   *  - **Clipped (extent)**
      - ``OUTPUT``
      - [same as input]
      - The output (clipped) layer

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
   *  - **Output layer**
      - ``OUTPUT``
      - [same as input]
      - The output (clipped) layer.
        The default format is "ESRI Shapefile".


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
      - Layer to be used as clipping extent for the input vector layer.
   *  - **Additional creation options**
        
        (optional)
      - ``OPTIONS``
      - [string]
        
        Default: "" (no additional options)
      - Additional GDAL creation options.
   *  - **Clipped (mask)**
      - ``OUTPUT``
      - [same as input]
      - The output (masked) layer

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
   *  - **Output layer**
      - ``OUTPUT``
      - [same as input]
      - The output (masked) layer.
        The default format is "ESRI Shapefile".


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
        
        Default: "geometry"
      - The name of the geometry column of the input layer to use
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
      - Compute the area and perimeter of dissolved features and include
        them in the output layer
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
        
        Default: ""
      - Additional GDAL creation options.
   *  - **Dissolved**
      - ``OUTPUT``
      -  [same as input]
      - The output layer

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
      - The output multipart geometry layer (with dissolved geometries)

