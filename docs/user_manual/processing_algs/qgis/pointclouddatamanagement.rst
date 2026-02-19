Point Cloud Data Management
===========================

.. only:: html

   .. contents::
      :local:
      :depth: 1

.. attention:: Running these algorithms requires QGIS installed with PDAL_ >= 2.5.0
   (see :menuselection:`Help --> About` menu).

.. _pdalassignprojection:

Assign projection
-----------------

Assigns a Coordinate Reference System to a point cloud layer, if it is missing or wrong.
A new layer is created.

.. seealso:: :ref:`pdalreproject`

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
   * - **Input layer**
     - ``INPUT``
     - [point cloud]
     - Input point cloud layer to assign a CRS to
   * - **Desired CRS**
     - ``CRS``
     - [crs]
     - The CRS to apply to the layer
   * - **Output layer**
     - ``OUTPUT``
     - [point cloud]

       Default: ``[Save to temporary file]``
     - Specify the point cloud file to use as output. :ref:`One of <output_parameter_widget>`:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Converted**
     - ``OUTPUT``
     - [point cloud]
     - Output point cloud layer with a new CRS.
       Currently supported formats are :file:`.LAS`, :file:`.LAZ`, :file:`.COPC.LAZ` and :file:`.VPC`.

Python code
...........

**Algorithm ID**: ``pdal:assignprojection``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _pdalvirtualpointcloud:

Build virtual point cloud (VPC)
-------------------------------

Creates a :ref:`virtual point cloud (VPC) <virtual_point_cloud>` from input point cloud data.

If you leave the optional parameters unchecked, the VPC file will be built very quickly
as the algorithm will only read metadata of input files.
With any of the optional parameters set, the algorithm will read all points which can take some time.

.. figure:: img/point_cloud_buildvpc.png
   :align: center
   :width: 100%

   Generating Virtual Point Cloud with overview from a set of point cloud tiles

.. seealso:: :ref:`pdalmerge`

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
     - ``LAYERS``
     - [point cloud] [list]
     - Input point cloud layers to combine inside a virtual point cloud layer
   * - **Calculate boundary polygon**
     - ``BOUNDARY``
     - [boolean]

       Default: False
     - Set to True to show the exact boundaries of data (rather than just rectangular extent)
   * - **Calculate statistics**
     - ``STATISTICS``
     - [boolean]

       Default: False
     - Set to True to understand ranges of values of the various attributes
   * - **Build overview point cloud**
     - ``OVERVIEW``
     - [boolean]

       Default: False
     - Generates a single “thinned” point cloud of all the input data
       (using only every 1000th point from original data).

       The overview point cloud will be created next to the VPC file -
       for example, for :file:`mydata.vpc`, the overview point cloud would be named :file:`mydata-overview.copc.laz`.
   * - **Virtual point cloud**
     - ``OUTPUT``
     - [point cloud]

       Default: ``[Save to temporary file]``
     - Specify the point cloud file to build the data into. :ref:`One of <output_parameter_widget>`:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Virtual point cloud**
     - ``OUTPUT``
     - [raster]
     - Output point cloud layer combining all the input data, as a virtual file.

Python code
...........

**Algorithm ID**: ``pdal:virtualpointcloud``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**

.. _pdalclassifyground:

Classify ground points
------------------------
|400|

Classifies ground points using the
`Simple Morphological Filter (SMRF) <https://pdal.io/en/stable/stages/filters.smrf.html>`_ algorithm.
Analyses elevation differences and local surface structure to separate ground from non-ground points.
Morphological filtering is applied to identify iteratively,
considering various parameters such as cell size, slope, elevation threshold
and window size.

Parameters
..........

Basic parameters
^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [point cloud]
     - Input point cloud layer to classify.
   * - **Grid Cell Size**
     - ``CELL_SIZE``
     - [numeric: double]

       Default: 1.0
     - Cell size for processing grid (in map units).
       Smaller values gives finer detail but may increase noise.
   * - **Scalar**
     - ``SCALAR``
     - [numeric: double]

       Default: 1.25
     - Threshold for steeper slopes. Higher value if the terrain
       is rough, otherwise real ground might be misclassified.
   * - **Slope**
     - ``SLOPE``
     - [numeric: double]

       Default: 0.15
     - Slope threshold (rise over run). How much slope is tolerated
       as ground. Should be higher for steep terrain.
   * - **Threshold**
     - ``THRESHOLD``
     - [numeric: double]

       Default: 0.5
     - Elevation threshold for separating ground from objects.
       Higher values allow larger deviations from the ground.
   * - **Window Size**
     - ``WINDOW_SIZE``
     - [numeric: double]

       Default: 18.0
     - Maximum filter window size. Higher values better identify
       large buildings or objects, smaller values protect
       smaller features.
   * - **Classified Ground**
     - ``OUTPUT``
     - [point cloud]

       Default: ``[Save to temporary file]``
     - Specify the point cloud file to export the classified ground points to. :ref:`One of <output_parameter_widget>`:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **VPC Output Format**
     - ``VPC_OUTPUT_FORMAT``
     - [enumeration]

       Default: 0
     - Specify the underlying format in which data are stored
       for Virtual Point Cloud (:file:`.VPC`) output.
       Possible formats are:
       
       * 0 --- ``COPC``
       * 1 --- ``LAZ``
       * 2 --- ``LAS``
       
       LAZ/LAS may be faster to process, however only
       allow rendering of the point cloud extents.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Classified Ground**
     - ``OUTPUT``
     - [point cloud]
     - Output point cloud with ground classification applied.

Python code
...........

**Algorithm ID**: ``pdal:classifyground``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**

.. _pdalclip:

Clip point cloud
----------------

Clips a point cloud layer by a polygon layer
so that the resulting point cloud contains only points within the polygons.

.. figure:: img/point_cloud_clip.png
   :align: center

   Clipping an input point cloud layer with a polygon coverage

Parameters
..........

Basic parameters
^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [point cloud]
     - Input point cloud layer to clip
   * - **Clipping polygons**
     - ``OVERLAY``
     - [vector: polygon]
     - Polygon vector layer to use as coverage for clipping the points
   * - **Clipped**
     - ``OUTPUT``
     - [point cloud]

       Default: ``[Save to temporary file]``
     - Specify the point cloud file to export the clipped points to. :ref:`One of <output_parameter_widget>`:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Filter expression**

       Optional
     - ``FILTER_EXPRESSION``
     - [expression]
     - A :ref:`PDAL expression <pdal_expressions>` for selecting a subset of features in the point cloud data
   * - **Cropping extent**

       Optional
     - ``FILTER_EXTENT``
     - [extent]
     - A map extent for selecting a subset of features in the point cloud data

       .. include:: ../algs_include.rst
          :start-after: **extent_options**
          :end-before: **end_extent_options**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Clipped**
     - ``OUTPUT``
     - [point cloud]
     - Output point cloud whose features are the points within the coverage polygon layer.

Python code
...........

**Algorithm ID**: ``pdal:clip``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _pdalcompare:

Compare point clouds
--------------------

|400|

Compares two point clouds using an M3C2 (Multiscale Model-to-Model Cloud Comparison)
algorithm and outputs a subset (filtered using Poisson sampling, based on Subsampling
cell size parameter) of the original point cloud.

The M3C2 algorithm calculates the distance between two point clouds by considering
the local orientation of the surface. It estimates surface normals at a user-defined
scale and measures the average distance between clouds within a cylindrical
projection along those normals.

The approach is highly robust against sensor noise and surface roughness, making
it the standard for detecting change in complex natural environments. It also
provides a sign (indicating whether a surface has moved in or out) and
a statistically significant level of detection to distinguish real change from
measurement error.

The output point cloud will have several new dimensions: ``m3c2_distance``,
``m3c2_uncertainty``, ``m3c2_significant``, ``m3c2_std_dev1``, ``m3c2_std_dev2``,
``m3c2_count1`` and ``m3c2_count2``.

*References: Lague, Dimitri, Nicolas Brodu, and Jérôme Leroux. Accurate 3D Comparison
of Complex Topography with Terrestrial Laser Scanner: Application to the Rangitikei
Canyon (N-Z). arXiv, 2013, https://arxiv.org/abs/1302.1183.*

.. attention:: Running this algorithm requires QGIS installed with PDAL_ >= 2.10
   (see :menuselection:`Help --> About` menu).

Parameters
..........

Basic parameters
^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [point cloud]
     - Input point cloud layer to compare
   * - **Compare layer**
     - ``INPUT_COMPARE``
     - [point cloud]
     - Point cloud to compare against
   * - **Subsampling cell size**
     - ``SUBSAMPLING_CELL_SIZE``
     - [numeric: double]

       Default: 0.0
     - Minimum spacing between points (in map units).
   * - **Normal radius**
     - ``NORMAL_RADIUS``
     - [numeric: double]

       Default: 2.0
     - Radius of the sphere around each core point that defines the neighbors from which normals are calculated.
   * - **Cylinder radius**
     - ``CYLINDER_RADIUS``
     - [numeric: double]

       Default: 2.0
     - Radius of the cylinder inside of which points are searched for when calculating change.
   * - **Cylinder half-length**
     - ``CYLINDER_HALF_LENGTH``
     - [numeric: double]

       Default: 2.0
     - The half-length of the cylinder of neighbors used for calculating change.
   * - **Registration error**
     - ``REGISTRATION_ERROR``
     - [numeric: double]

       Default: 0.0
     - The estimated registration error between the two point clouds.
   * - **Cylinder orientation**
     - ``CYLINDER_ORIENTATION``
     - [enumeration]

       Default: 0
     - Which direction to orient the cylinder/normal vector used for comparison between the two point clouds.

       * 0 --- Up
       * 1 --- Origin
       * 2 --- None

   * - **Comparison point cloud**
     - ``OUTPUT``
     - [point cloud]

       Default: ``[Save to temporary file]``
     - Specify the point cloud file to export the comparison point cloud to. :ref:`One of <output_parameter_widget>`:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Filter expression**

       Optional
     - ``FILTER_EXPRESSION``
     - [expression]
     - A :ref:`PDAL expression <pdal_expressions>` for selecting a subset of features in the point cloud data
   * - **Cropping extent**

       Optional
     - ``FILTER_EXTENT``
     - [extent]
     - A map extent for selecting a subset of features in the point cloud data

       .. include:: ../algs_include.rst
          :start-after: **extent_options**
          :end-before: **end_extent_options**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Comparison point cloud**
     - ``OUTPUT``
     - [point cloud]
     - Output comparison point cloud.
       The output point cloud contains the following additional dimensions:

       - ``m3c2_distance``
       - ``m3c2_uncertainty``
       - ``m3c2_significant``
       - ``m3c2_std_dev1``
       - ``m3c2_std_dev2``
       - ``m3c2_count1``
       - ``m3c2_count2``

Python code
...........

**Algorithm ID**: ``pdal:compare``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _pdalcreatecopc:

Create COPC
-----------

Creates the index for all the input point cloud files in a batch mode.

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
     - ``LAYERS``
     - [point cloud] [list]
     - Input point cloud layers to create an index for
   * - **Output directory**

       Optional
     - ``OUTPUT``
     - [folder]

       Default: ``[Skip output]``
     - Specify the folder to create the new files in. :ref:`One of <output_parameter_widget>`:

       .. include:: ../algs_include.rst
          :start-after: **directory_output_types_skip**
          :end-before: **end_directory_output_types_skip**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Output directory**
     - ``OUTPUT``
     - [folder]
     - Output folder containing point cloud layers with accompanying COPC index files.

Python code
...........

**Algorithm ID**: ``pdal:createcopc``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _pdalfilternoiseradius:

Filter noise (using radius)
-----------------------------
|400|

Filters noise in a point cloud using radius algorithm.
Points are marked as noise if they have fewer than the
minimum number of neighbors within the specified radius.

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
   * - **Input layer**
     - ``INPUT``
     - [point cloud]
     - Input point cloud layer to be filtered for noise.
   * - **Remove noise points**
     - ``REMOVE_NOISE_POINTS``
     - [boolean]

       Default: False
     - Set to True to remove points classified as noise from the output point cloud.
       If False, noise points are kept in the output but remain classified as noise.
   * - **Minimum number of neighbors in radius**
     - ``MIN_K``
     - [numeric: integer]
    
       Default: 2
     - Minimum number of neighboring points within the search radius.
   * - **Radius**
     - ``RADIUS``
     - [numeric: double]

       Default: 1.0
     - Search radius for counting neighboring points.
   * - **Filtered (radius algorithm)**
     - ``OUTPUT``
     - [point cloud]

       Default: ``[Save to temporary file]``
     - Specify the point cloud file to export the filtered point cloud to. :ref:`One of <output_parameter_widget>`:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **VPC Output Format**

       |400|
     - ``VPC_OUTPUT_FORMAT``
     - [enumeration]

       Default: 0
     - Specify the underlying format in which data are stored
       for Virtual Point Cloud (:file:`.vpc`) output.
       Possible formats are:

       * 0 --- ``COPC``
       * 1 --- ``LAZ``
       * 2 --- ``LAS``

       LAZ/LAS may be faster to process, however they only
       allow rendering of the point cloud extents.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Filtered (radius algorithm)**
     - ``OUTPUT``
     - [point cloud]
     - Output point cloud layer where points are classified as noise based on the statistical filter.
       If ``REMOVE_NOISE_POINTS`` is set to True, noise-classified points are removed from the output.
       Otherwise, they remain in the layer and can be identified by their classification value (typically LAS class 7).

Python code
...........

**Algorithm ID**: ``pdal:filternoiseradius``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**

.. _pdalmerge:

Merge point cloud
-----------------

Merges multiple point cloud files into a single one.

.. seealso:: :ref:`pdalvirtualpointcloud`

Parameters
..........

Basic parameters
^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input layers**
     - ``LAYERS``
     - [point cloud] [list]
     - Input point cloud layers to merge into a single one
   * - **Merged**
     - ``OUTPUT``
     - [point cloud]

       Default: ``[Save to temporary file]``
     - Specify the output point cloud merging input files. :ref:`One of <output_parameter_widget>`:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Filter expression**

       Optional
     - ``FILTER_EXPRESSION``
     - [expression]
     - A :ref:`PDAL expression <pdal_expressions>` for selecting a subset of features in the point cloud data
   * - **Cropping extent**

       Optional
     - ``FILTER_EXTENT``
     - [extent]
     - A map extent for selecting a subset of features in the point cloud data

       .. include:: ../algs_include.rst
          :start-after: **extent_options**
          :end-before: **end_extent_options**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Merged**
     - ``OUTPUT``
     - [point cloud]
     - Output point cloud layer merging all the input files.

Python code
...........

**Algorithm ID**: ``pdal:merge``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _pdalinfo:

Point cloud information
-----------------------

Outputs basic metadata from an input point cloud file.

Example of output information::

    LAS           1.4
    point format  6
    count         56736130
    scale         0.001 0.001 0.001
    offset        431749.999 5440919.999 968.898
    extent        431250 5440420 424.266
                  432249.999 5441419.999 1513.531
    crs           ETRS89 / UTM zone 34N (N-E) (EPSG:3046)  (vertical CRS missing!)
    units         horizontal=metre  vertical=unknown

    Attributes:
    - X floating 8
    - Y floating 8
    - Z floating 8
    - Intensity unsigned 2
    - ReturnNumber unsigned 1
    - NumberOfReturns unsigned 1
    - ScanDirectionFlag unsigned 1
    - EdgeOfFlightLine unsigned 1
    - Classification unsigned 1
    - ScanAngleRank floating 4
    - UserData unsigned 1
    - PointSourceId unsigned 2
    - GpsTime floating 8
    - ScanChannel unsigned 1
    - ClassFlags unsigned 1

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
   * - **Input layer**
     - ``INPUT``
     - [point cloud]
     - Input point cloud layer to extract metadata information from
   * - **Layer information**
     - ``OUTPUT``
     - [file]

       Default: ``[Save to temporary file]``
     - Specify the file to store the metadata information. :ref:`One of <output_parameter_widget>`:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Layer information**
     - ``OUTPUT``
     - [html]
     - :file:`HTML` file to store the metadata information.

Python code
...........

**Algorithm ID**: ``pdal:info``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _pdalreproject:

Reproject point cloud
---------------------

Reprojects a point cloud to a different Coordinate Reference System (CRS).

.. seealso:: :ref:`pdalassignprojection`

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
   * - **Input layer**
     - ``INPUT``
     - [point cloud]
     - Input point cloud layer to reproject to a different CRS
   * - **Target CRS**
     - ``CRS``
     - [crs]
     - The CRS to apply to the layer
   * - **Reprojected**
     - ``OUTPUT``
     - [point cloud]

       Default: ``[Save to temporary file]``
     - Specify the reprojected point cloud file. :ref:`One of <output_parameter_widget>`:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Coordinate operation**

       Optional
     - ``OPERATION``
     - [datum]
     - The :ref:`datum transformation <datum_transformation>` to use to reproject the data
       between the origin and target systems.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Reprojected**
     - ``OUTPUT``
     - [point cloud]
     - Output point cloud layer in the target CRS.

Python code
...........

**Algorithm ID**: ``pdal:reproject``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _pdalthinbyradius:

Thin (by sampling radius)
-------------------------

Creates a thinned version of the point cloud by performing sampling by distance point
(reduces the number of points within a certain radius).

.. only:: html

  .. figure:: img/point_cloud_thin.gif
     :align: center

     Thining point cloud (by sampling radius)

.. seealso:: :ref:`pdalthinbydecimate`

Parameters
..........

Basic parameters
^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [point cloud]
     - Input point cloud layer to create a thinned version from
   * - **Sampling radius (in map units)**
     - ``SAMPLING_RADIUS``
     - [numeric: double]

       Default: 1.0
     - Distance within which points are sampled to a unique point
   * - **Thinned (by radius)**
     - ``OUTPUT``
     - [point cloud]

       Default: ``[Save to temporary file]``
     - Specify the output point cloud with reduced points. :ref:`One of <output_parameter_widget>`:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Filter expression**

       Optional
     - ``FILTER_EXPRESSION``
     - [expression]
     - A :ref:`PDAL expression <pdal_expressions>` for selecting a subset of features in the point cloud data
   * - **Cropping extent**

       Optional
     - ``FILTER_EXTENT``
     - [extent]
     - A map extent for selecting a subset of features in the point cloud data

       .. include:: ../algs_include.rst
          :start-after: **extent_options**
          :end-before: **end_extent_options**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Thinned (by radius)**
     - ``OUTPUT``
     - [point cloud]
     - Output point cloud layer with reduced points.

Python code
...........

**Algorithm ID**: ``pdal:thinbyradius``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _pdalthinbydecimate:

Thin (by skipping points)
-------------------------

Creates a thinned version of the point cloud by keeping only every N-th point
(reduces the number of points by skipping nearby points).

.. seealso:: :ref:`pdalthinbyradius`

Parameters
..........

Basic parameters
^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [point cloud]
     - Input point cloud layer to create a thinned version from
   * - **Number of points to skip**
     - ``POINTS_NUMBER``
     - [numeric: integer]

       Default: 1
     - Keep only every N-th point in the input layer
   * - **Thinned (by decimation)**
     - ``OUTPUT``
     - [point cloud]

       Default: ``[Save to temporary file]``
     - Specify the output point cloud with reduced points. :ref:`One of <output_parameter_widget>`:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Filter expression**

       Optional
     - ``FILTER_EXPRESSION``
     - [expression]
     - A :ref:`PDAL expression <pdal_expressions>` for selecting a subset of features in the point cloud data
   * - **Cropping extent**

       Optional
     - ``FILTER_EXTENT``
     - [extent]
     - A map extent for selecting a subset of features in the point cloud data

       .. include:: ../algs_include.rst
          :start-after: **extent_options**
          :end-before: **end_extent_options**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Thinned (by decimation)**
     - ``OUTPUT``
     - [point cloud]
     - Output point cloud layer with reduced points.

Python code
...........

**Algorithm ID**: ``pdal:thinbydecimate``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _pdaltile:

Create tiles from point cloud
-----------------------------

Creates tiles from input point cloud files,
recommended for best performance (in display or analysis) with such datasets in QGIS.

.. seealso:: :ref:`pdalvirtualpointcloud`, :ref:`pdalcreatecopc`

Parameters
..........

Basic parameters
^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input layers**
     - ``LAYERS``
     - [point cloud] [list]
     - Input point cloud layers to create tiles from
   * - **Tile length**
     - ``LENGTH``
     - [numeric: double]

       Default: 1000.0
     - Size of the edge of each generated tile
   * - **Output directory**
     - ``OUTPUT``
     - [folder]

       Default: ``[Save to temporary folder]``
     - Specify the folder to store the generated tiles. :ref:`One of <output_parameter_widget>`:

       .. include:: ../algs_include.rst
          :start-after: **directory_output_types**
          :end-before: **end_directory_output_types**

Advanced parameters
^^^^^^^^^^^^^^^^^^^

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Assign CRS**

       Optional
     - ``CRS``
     - [crs]
     - The CRS to apply to the layer

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Output directory**
     - ``OUTPUT``
     - [folder]
     - Output folder containing the tiles generated from input files.

Python code
...........

**Algorithm ID**: ``pdal:tile``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _PDAL: https://pdal.io/en/stable/


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |400| replace:: ``NEW in 4.0``
