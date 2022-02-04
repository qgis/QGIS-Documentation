Mesh
============

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _qgismeshcontours:

Export contours
----------------

Creates contours as a vector layer from a mesh scalar dataset.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input mesh layer**
     - ``INPUT``
     - [mesh]
     - The mesh layer to export data from
   * - **Dataset groups**
     - ``DATASET_GROUPS``
     - [layer][list]
     - The dataset groups 
   * - **Dataset time**
     - ``DATASET_TIME``
     - [datetime]
     - The time range to take into account

       * 0 --- Current canvas time
       * 1 --- Defined date/time
       * 2 --- Dataset group time step
   * - **Increment between contour levels**

       Optional
     - ``INCREMENT``
     - [number]

       Default: *Not set*
     - Interval between generated levels.
   * - **Minimum contour level**

       Optional
     - ``MINIMUM``
     - [number]

       Default: *Not set*
     - Starting level values of contours.
   * - **Maximum contour level**

       Optional
     - ``MAXIMUM``
     - [number]

       Default: *Not set*
     - Maximum values of contours, i.e. no generated levels will be greater than this value.
   * - **List of contours level**

       Optional
     - ``CONTOUR_LEVEL_LIST``
     - [number]

       Default: *Not set*
     - List of wanted levels of contours (separated by commas).
       If filled, the increment, minimum, and maximum fields will not be considered.
   * - **Output coordinate system**

       Optional
     - ``CRS_OUTPUT``
     - [crs]
     - Coordinate Reference System to assign to the output
   * - **Exported contour lines**
     - ``OUTPUT_LINES``
     - [vector: line]

       Default: ``[Create temporary layer]``
     - Specify the output line layer representing the contours
       of the mesh layer. One of:

       .. include:: ../algs_include.rst
          :start-after: **layer_output_types**
          :end-before: **end_layer_output_types**

   * - **Exported contour polygons**
     - ``OUTPUT_POLYGONS``
     - [vector: polygon]

       Default: ``[Create temporary layer]``
     - Specify the output polygon layer representing the contours
       of the mesh layer. One of:

       .. include:: ../algs_include.rst
          :start-after: **layer_output_types**
          :end-before: **end_layer_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Exported contour lines**
     - ``OUTPUT_LINES``
     - [vector: line]
     - Line layer representing the contours of the mesh layer.
   * - **Exported contour polygons**
     - ``OUTPUT_POLYGONS``
     - [vector: polygon]
     - Polygon layer representing the contours of the mesh layer.


Python code
...........

**Algorithm ID**: ``native:meshcontours``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgismeshexportcrosssection:

Export cross section dataset values on lines from mesh
------------------------------------------------------

Extracts a mesh dataset's values from lines contained in a vector layer.

Each line is discretized with a resolution distance parameter for extraction
of values on its vertices.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input mesh layer**
     - ``INPUT``
     - [mesh]
     - The mesh layer to export data from
   * - **Dataset groups**
     - ``DATASET_GROUPS``
     - [layer][list]
     - The dataset groups 
   * - **Dataset time**
     - ``DATASET_TIME``
     - [datetime]
     - The time range to take into account

       * 0 --- Current canvas time
       * 1 --- Defined date/time
       * 2 --- Dataset group time step
   * - **Lines for data export**
     - ``INPUT_LINES``
     - [vector: line]
     - Lines where the data will be extracted from the dataset mesh
   * - **Line segmentation resolution**
     - ``RESOLUTION``
     - [number]

       Default: 10.0
     - The distance between points on the lines where the data
       will be extracted from the dataset mesh.
   * - **Digits count for dataset value**
     - ``DATASET_DIGITS``
     - [number]

       Default: 2
     - Number of digits to round dataset values
   * - **Exported data CSV file**
     - ``OUTPUT``
     - [file]

       Default: ``[Save to temporary file]``
     - Specification of the output file. One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Exported data CSV file**
     - ``OUTPUT``
     - [file]
     -

Python code
...........

**Algorithm ID**: ``native:meshexportcrosssection``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisexportmeshedges:

Export mesh edges
-----------------

Exports a mesh layer's edges to a line vector layer,
with the dataset values on edges as attribute values.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input mesh layer**
     - ``INPUT``
     - [mesh]
     - The mesh layer to export data from
   * - **Dataset groups**
     - ``DATASET_GROUPS``
     - [layer][list]
     - The dataset groups 
   * - **Dataset time**
     - ``DATASET_TIME``
     - [datetime]
     - The time range to take into account

       * 0 --- Current canvas time
       * 1 --- Defined date/time
       * 2 --- Dataset group time step
   * - **Output coordinate system**

       Optional
     - ``CRS_OUTPUT``
     - [crs]
     - Coordinate Reference System to assign to the output
   * - **Export vector option**
     - ``VECTOR_OPTION``
     - [enumeration]
     - Coordinate type of vector value exportation.

       * 0 --- Cartesian (x,y)
       * 1 --- Polar (magnitude, degree)
       * 2 --- Cartesian and polar
   * - **Output vector layer**
     - ``OUTPUT``
     - [vector: line]

       Default: ``[Create temporary layer]``
     - Specification of the output file. One of:

       .. include:: ../algs_include.rst
          :start-after: **layer_output_types**
          :end-before: **end_layer_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output vector layer**
     - ``OUTPUT``
     - [vector: line]
     - Output vector line layer containing the edges of the input mesh
       layer with associated dataset values

Python code
...........

**Algorithm ID**: ``native:exportmeshedges``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisexportmeshfaces:

Export mesh faces
-----------------

Exports a mesh layer's faces to a polygon vector layer,
with the dataset values on faces as attribute values.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input mesh layer**
     - ``INPUT``
     - [mesh]
     - The mesh layer to export data from
   * - **Dataset groups**
     - ``DATASET_GROUPS``
     - [layer][list]
     - The dataset groups 
   * - **Dataset time**
     - ``DATASET_TIME``
     - [datetime]
     - The time range to take into account

       * 0 --- Current canvas time
       * 1 --- Defined date/time
       * 2 --- Dataset group time step
   * - **Output coordinate system**

       Optional
     - ``CRS_OUTPUT``
     - [crs]
     - Coordinate Reference System to assign to the output
   * - **Export vector option**
     - ``VECTOR_OPTION``
     - [enumeration]
     - Coordinate type of vector value exportation.

       * 0 --- Cartesian (x,y)
       * 1 --- Polar (magnitude, degree)
       * 2 --- Cartesian and polar
   * - **Output vector layer**
     - ``OUTPUT``
     - [vector: polygon]

       Default: ``[Create temporary layer]``
     - Specification of the output file. One of:

       .. include:: ../algs_include.rst
          :start-after: **layer_output_types**
          :end-before: **end_layer_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output vector layer**
     - ``OUTPUT``
     - [vector: polygon]
     - Output vector polygon layer containing the faces of the input mesh
       layer with associated dataset values

Python code
...........

**Algorithm ID**: ``native:exportmeshfaces``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisexportmeshongrid:

Export mesh on grid
-------------------

Exports a mesh layer's dataset values to a gridded point vector layer,
with the dataset values on this point as attribute values.

For data on volume (3D stacked dataset values), the exported dataset
values are averaged on faces using the method defined in :ref:`the mesh layer
properties <mesh_stacked_averaging>` (default is Multi level averaging method).
1D meshes are not supported.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input mesh layer**
     - ``INPUT``
     - [mesh]
     - The mesh layer to export data from
   * - **Dataset groups**
     - ``DATASET_GROUPS``
     - [layer][list]
     - The dataset groups 
   * - **Dataset time**
     - ``DATASET_TIME``
     - [datetime]
     - The time range to take into account

       * 0 --- Current canvas time
       * 1 --- Defined date/time
       * 2 --- Dataset group time step
   * - **Extent**

       Optional
     - ``EXTENT``
     - [extent]
     - Specify the spatial extent on which to process the data.

       .. include:: ../algs_include.rst
          :start-after: **extent_options**
          :end-before: **end_extent_options**

   * - **Grid spacing**

       Optional
     - ``GRID_SPACING``
     - [number]

       Default: 10.0
     - Spacing between the sample points to use
   * - **Output coordinate system**

       Optional
     - ``CRS_OUTPUT``
     - [crs]
     - Coordinate Reference System to assign to the output
   * - **Export vector option**
     - ``VECTOR_OPTION``
     - [enumeration]
     - Coordinate type of vector value exportation.

       * 0 --- Cartesian (x,y)
       * 1 --- Polar (magnitude, degree)
       * 2 --- Cartesian and polar
   * - **Output vector layer**
     - ``OUTPUT``
     - [vector: point]

       Default: ``[Create temporary layer]``
     - Specification of the output file. One of:

       .. include:: ../algs_include.rst
          :start-after: **layer_output_types**
          :end-before: **end_layer_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output vector layer**
     - ``OUTPUT``
     - [vector: point]
     - Output vector point layer with dataset values computed
       from the overlaid face.

Python code
...........

**Algorithm ID**: ``native:exportmeshongrid``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisexportmeshvertices:

Export mesh vertices
--------------------

Exports a mesh layer's vertices to a point vector layer,
with the dataset values on vertices as attribute values.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input mesh layer**
     - ``INPUT``
     - [mesh]
     - The mesh layer to export data from
   * - **Dataset groups**
     - ``DATASET_GROUPS``
     - [layer][list]
     - The dataset groups 
   * - **Dataset time**
     - ``DATASET_TIME``
     - [datetime]
     - The time range to take into account

       * 0 --- Current canvas time
       * 1 --- Defined date/time
       * 2 --- Dataset group time step
   * - **Output coordinate system**

       Optional
     - ``CRS_OUTPUT``
     - [crs]
     - Coordinate Reference System to assign to the output
   * - **Export vector option**
     - ``VECTOR_OPTION``
     - [enumeration]
     - Coordinate type of vector value exportation.

       * 0 --- Cartesian (x,y)
       * 1 --- Polar (magnitude, degree)
       * 2 --- Cartesian and polar
   * - **Output vector layer**
     - ``OUTPUT``
     - [vector: point]

       Default: ``[Create temporary layer]``
     - Specification of the output file. One of:

       .. include:: ../algs_include.rst
          :start-after: **layer_output_types**
          :end-before: **end_layer_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output vector layer**
     - ``OUTPUT``
     - [vector: point]
     - Output vector point layer containing the vertices of the input mesh
       layer with associated dataset values

Python code
...........

**Algorithm ID**: ``native:exportmeshvertices``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgismeshexporttimeseries:

Export time series values from points of a mesh dataset
-------------------------------------------------------

Extracts a mesh dataset's time series values from points contained in a vector layer.

If the time step is kept to its default value (0 hours), the time step used
is the one of the two first datasets of the first selected dataset group.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input mesh layer**
     - ``INPUT``
     - [mesh]
     - The mesh layer to extract data from
   * - **Dataset groups**
     - ``DATASET_GROUPS``
     - [layer][list]
     - The dataset groups 
   * - **Starting time**
     - ``STARTING_TIME``
     - [datetime]
     - The start of the time range to take into account

       * 0 --- Current canvas time
       * 1 --- Defined date/time
       * 2 --- Dataset group time step
   * - **Finishing time**
     - ``FINISHING_TIME``
     - [datetime]
     - The end of the time range to take into account

       * 0 --- Current canvas time
       * 1 --- Defined date/time
       * 2 --- Dataset group time step
   * - **Time step (hours)**

       Optional
     - ``TIME_STEP``
     - [number]

       Default: 0
     - Time between two consecutive steps to extract.
       Keep ``0`` to use time step of the first selected dataset group.
   * - **Points for data export**
     - ``INPUT_POINTS``
     - [vector: point]

     - Vector layer containing points where the data will be extracted from the dataset mesh
   * - **Digits count for coordinates**
     - ``COORDINATES_DIGITS``
     - [number]
     - Number of digits to round coordinate values

       Default: 2
   * - **Digits count for dataset value**
     - ``DATASET_DIGITS``
     - [number]

       Default: 2
     - Number of digits to round dataset values
   * - **Exported data CSV file**
     - ``OUTPUT``
     - [file]

       Default: ``[Save to temporary file]``
     - Specification of the output file. One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Exported data CSV file**
     - ``OUTPUT``
     - [file]
     - :file:`.CSV` file containing the mesh dataset time series values
       at the overlaying point features

Python code
...........

**Algorithm ID**: ``native:meshexporttimeseries``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgismeshrasterize:

Rasterize mesh dataset
----------------------

Creates a raster layer from a mesh dataset.

For data on volume (3D stacked dataset values), the exported dataset
values are averaged on faces using the method defined in :ref:`the mesh layer
properties <mesh_stacked_averaging>` (default is Multi level averaging method).
1D meshes are not supported.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input mesh layer**
     - ``INPUT``
     - [mesh]
     - The mesh layer to export data from
   * - **Dataset groups**
     - ``DATASET_GROUPS``
     - [layer][list]
     - The dataset groups 
   * - **Dataset time**
     - ``DATASET_TIME``
     - [datetime]
     - The time range to take into account

       * 0 --- Current canvas time
       * 1 --- Defined date/time
       * 2 --- Dataset group time step
   * - **Extent**

       Optional
     - ``EXTENT``
     - [extent]
     - Specify the spatial extent on which to process the data.

       .. include:: ../algs_include.rst
          :start-after: **extent_options**
          :end-before: **end_extent_options**

   * - **Pixel size**
     - ``PIXEL_SIZE``
     - [number]

       Default: 1.0
     - Pixel size of the output raster layer.
   * - **Output coordinate system**

       Optional
     - ``CRS_OUTPUT``
     - [crs]
     - Coordinate Reference System to assign to the output
   * - **Output raster layer**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specification of the output file. One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output raster layer**
     - ``OUTPUT``
     - [raster]
     - Output raster layer with dataset values computed
       from the mesh layer.

Python code
...........

**Algorithm ID**: ``native:meshrasterize``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgistinmeshcreation:

TIN mesh creation
-----------------

Creates a TIN mesh layer from vector layers.
The TIN mesh is created using a Delaunay triangulation.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input layers**
     - ``SOURCE_DATA``
     - [vector: any][list]
     - Vector layers to combine to generate the mesh layer 
   * - **Vector layer**
     - GUI ONLY
     - [vector: any][list]
     - A selector for the vector layers to combine to generate the mesh layer
   * - **Value on vertex**
     - GUI ONLY
     - [tablefield: any]
     - A selector of the field to use from the selected layer.
       Each vertex is assigned the corresponding value of its original feature.
   * - **Use Z-coordinate for value on vertex**
     - GUI ONLY
     - [boolean]

       Default: False
     - If checked, the Z value of vector layer points or polygons/lines vertices
       will be used to assign the Z value of the vertex mesh layer.
       Only available if the input layers are 3D.
   * - **Output format**
     - ``MESH_FORMAT``
     - [enumeration]

       Default: 2DM
     - Output format of the generated layer

       * 0 --- 2DM
       * 1 --- SELAFIN
       * 2 --- PLY
       * 3 --- Ugrid
   * - **Output coordinate system**

       Optional
     - ``CRS_OUTPUT``
     - [crs]
     - Coordinate Reference System to assign to the output
   * - **Output file**
     - ``OUTPUT_MESH``
     - [mesh]

       Default: ``[Save to temporary file]``
     - Specification of the output file. One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output file**
     - ``OUTPUT_MESH``
     - [mesh]
     - Output mesh layer with dataset values computed
       from the vector layers.

Python code
...........

**Algorithm ID**: ``native:tinmeshcreation``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**

