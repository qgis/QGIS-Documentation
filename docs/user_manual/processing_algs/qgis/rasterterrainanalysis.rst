Raster terrain analysis
=======================

.. only:: html

   .. contents::
      :local:
      :depth: 1
      :class: toc_columns


.. _qgisaspect:

Aspect
------
Calculates the aspect of the Digital Terrain Model in input.
The final aspect raster layer contains values from 0 to 360 that
express the slope direction, starting from north (0°) and continuing
clockwise.

.. figure:: img/aspect.png
   :align: center
   :scale: 50%

   Aspect values

The following picture shows the aspect layer reclassified with a color
ramp:

.. figure:: img/aspect_2.png
   :align: center

   Aspect layer reclassified

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
   * - **Elevation layer**
     - ``INPUT``
     - [raster]
     - Digital Terrain Model raster layer
   * - **Z factor**
     - ``Z_FACTOR``
     - [numeric: double]

       Default: 1.0
     - Vertical exaggeration.
       This parameter is useful when the Z units differ from
       the X and Y units, for example feet and meters.
       You can use this parameter to adjust for this.
       The default is 1 (no exaggeration).
   * - **Aspect**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specify the output aspect raster layer. :ref:`One of <output_parameter_widget>`:

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
   * - **Output NoData value**

       ``Added in 4.0``
     - ``NODATA``
     - [numeric: double]

       Default: -9999.0
     - Value to use for NoData cells in the output layer.
   * - **Creation options**

       Optional

       ``Added in 4.0``
     - ``CREATION_OPTIONS``
     - [string]

       Default: ''
     - For adding one or more creation options that control the raster
       to be created (colors, block size, file compression...).
       For convenience, you can rely on predefined profiles
       (see :ref:`GDAL driver options section <gdal_createoptions>`).

       Batch Process and Model Designer: separate multiple options
       with a pipe character (``|``).

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
   * - **Aspect**
     - ``OUTPUT``
     - [raster]
     - The output aspect raster layer

Python code
...........

**Algorithm ID**: ``native:aspect``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**

.. _qgischannelnetworkfromdem:

Channel network and drainage basins from DEM
---------------------------------------------
``Added in 4.4``

Extracts vector channel network lines, drainage basin polygons,
and topological junction node points directly from an elevation raster (DEM).

The analysis executes a 3-step pipeline:

#. D8 Flow Routing: Computes single-direction steepest descent flow directions
#. Strahler Stream Ordering: Calculates topological stream orders
#. Vector Network Extraction: Traces vector channels, delineates catchments,
   and identifies key topological junction nodes.

The output Junctions layer contains topological nodes from the channel network.
These are classified according to type:

* ``Spring``: Channel headwater initiation point matching the stream order threshold.
* ``Junction``: Tributary confluence point where two or more stream channels meet.
* ``Outlet``: Terminal discharge node exiting the raster boundary or draining into a terrain sink.
* ``Mouth``: Confluence pour point entering a higher-order stream segment (delineated when subbasins are enabled).

.. seealso:: This algorithm is a port of SAGA's `Channel Network and Drainage Basins`_ tool.

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
   * - **Elevation raster**
     - ``INPUT``
     - [raster]
     - Digital Terrain Model raster layer
   * - **Minimum stream order threshold**
     - ``THRESHOLD``
     - [numeric: integer]

       Default: 5
     - Strahler order to begin a channel. Minimum: 1
   * - **Delineate subbasins**
     - ``SUBBASINS``
     - [boolean]

       Default: True
     -
   * - **Channels**

       Optional
     - ``CHANNELS``
     - [vector: line]

       Default: ``[Save to temporary file]``
     - Specify the output line vector layer representing the extracted channels.
       :ref:`One of <output_parameter_widget>`:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types_skip**
          :end-before: **end_file_output_types_skip**
   * - **Drainage Basins**

       Optional
     - ``BASINS``
     - [vector: polygon]

       Default: ``[Save to temporary file]``
     - Specify the output polygon vector layer representing the extracted drainage basins.
       :ref:`One of <output_parameter_widget>`:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types_skip**
          :end-before: **end_file_output_types_skip**
   * - **Junctions**

       Optional
     - ``JUNCTIONS``
     - [vector: point]

       Default: ``[Save to temporary file]``
     - Specify the output point vector layer representing the extracted junctions.
       :ref:`One of <output_parameter_widget>`:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types_skip**
          :end-before: **end_file_output_types_skip**

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
   * - **Channels**
     - ``CHANNELS``
     - [vector: line]
     - The output line vector layer representing the extracted channels
   * - **Drainage Basins**
     - ``BASINS``
     - [vector: polygon]
     - The output polygon vector layer representing the extracted drainage basins
   * - **Junctions**
     - ``JUNCTIONS``
     - [vector: point]
     - The output point vector layer representing the extracted junctions

Python code
...........

**Algorithm ID**: ``native:channelnetworkfromdem``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgischannelnetworkfromflowdirandorder:

Channel network and drainage basins from multiple inputs
---------------------------------------------------------
``Added in 4.4``

Extracts vector channel network lines, drainage basin polygons,
and topological junction node points using pre-computed elevation (DEM),
D8 flow direction, and Strahler stream order rasters.

This algorithm bypasses internal raster flow routing and stream order generation,
making it ideal when flow direction and Strahler order rasters
have already been computed in prior processing steps.

The output Junctions layer contains topological nodes from the channel network.
These are classified according to type:

* ``Spring``: Channel headwater initiation point matching the stream order threshold.
* ``Junction``: Tributary confluence point where two or more stream channels meet.
* ``Outlet``: Terminal discharge node exiting the raster boundary or draining into a terrain sink.
* ``Mouth``: Confluence pour point entering a higher-order stream segment (delineated when subbasins are enabled).

.. seealso:: This algorithm is a port of SAGA's `Channel Network and Drainage Basins`_ tool.

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
   * - **Elevation raster**
     - ``INPUT_DEM``
     - [raster]
     - Digital Terrain Model raster layer
   * - **Flow direction raster**
     - ``INPUT_FLOW_DIR``
     - [raster]
     -
   * - **Strahler order raster**
     - ``INPUT_STRAHLER``
     - [raster]
     -
   * - **Minimum stream order threshold**
     - ``THRESHOLD``
     - [numeric: integer]

       Default: 5
     - Strahler order to begin a channel. Minimum: 1
   * - **Delineate subbasins**
     - ``SUBBASINS``
     - [boolean]

       Default: True
     -
   * - **Channels**

       Optional
     - ``CHANNELS``
     - [vector: line]

       Default: ``[Save to temporary file]``
     - Specify the output line vector layer representing the extracted channels.
       :ref:`One of <output_parameter_widget>`:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types_skip**
          :end-before: **end_file_output_types_skip**
   * - **Drainage Basins**

       Optional
     - ``BASINS``
     - [vector: polygon]

       Default: ``[Save to temporary file]``
     - Specify the output polygon vector layer representing the extracted drainage basins.
       :ref:`One of <output_parameter_widget>`:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types_skip**
          :end-before: **end_file_output_types_skip**
   * - **Junctions**

       Optional
     - ``JUNCTIONS``
     - [vector: point]

       Default: ``[Save to temporary file]``
     - Specify the output point vector layer representing the extracted junctions.
       :ref:`One of <output_parameter_widget>`:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types_skip**
          :end-before: **end_file_output_types_skip**

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
   * - **Channels**
     - ``CHANNELS``
     - [vector: line]
     - The output line vector layer representing the extracted channels
   * - **Drainage Basins**
     - ``BASINS``
     - [vector: polygon]
     - The output polygon vector layer representing the extracted drainage basins
   * - **Junctions**
     - ``JUNCTIONS``
     - [vector: point]
     - The output point vector layer representing the extracted junctions

Python code
...........

**Algorithm ID**: ``native:channelnetworkfromflowdirandorder``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisdtmslopebasedfilter:

DTM filter (slope-based)
------------------------
``Added in 3.34``

Can be used to filter a digital elevation model in order to classify its cells into ground and object (non-ground) cells.

The tool uses concepts as described by Vosselman (2000)
and is based on the assumption that a large height difference between two nearby cells is unlikely to be caused by a steep slope in the terrain.
The probability that the higher cell might be non-ground increases when the distance between the two cells decreases.
Therefore the filter defines a maximum height difference (``dz_max``) between two cells as a function of the distance (``d``) between the cells (``dz_max( d ) = d``).
A cell is classified as terrain if there is no cell within the kernel radius
to which the height difference is larger than the allowed maximum height difference at the distance between these two cells.

The approximate terrain slope (``s``) parameter is used to modify the filter function
to match the overall slope in the study area (``dz_max( d ) = d * s``).
A 5 % confidence interval (``ci = 1.65 * sqrt( 2 * stddev )``) may be used to modify the filter function even further
by either relaxing (``dz_max( d ) = d * s + ci``) or amplifying (``dz_max( d ) = d * s - ci``) the filter criterium.

*References: Vosselman, G. (2000): Slope based filtering of laser altimetry data.
IAPRS, Vol. XXXIII, Part B3, Amsterdam, The Netherlands, 935-942*

.. seealso:: This algorithm is a port of the SAGA `DTM Filter (slope-based)`_ tool.

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
     - [raster]
     - Digital Terrain Model raster layer
   * - **Band number**
     - ``BAND``
     - [raster band]
     - The band of the DEM to consider
   * - **Kernel radius (pixels)**
     - ``RADIUS``
     - [numeric: integer]

       Default: 5
     - The radius of the filter kernel (in pixels).
       Must be large enough to reach ground cells next to non-ground objects.
   * - **Terrain slope (%, pixel size/vertical units)**
     - ``TERRAIN_SLOPE``
     - [numeric: double]

       Default: 30.0
     - The approximate terrain slope in ``%``.
       The terrain slope must be adjusted to account for the ratio of height units vs raster pixel dimensions.
       Used to relax the filter criterium in steeper terrain.
   * - **Filter modification**
     - ``FILTER_MODIFICATION``
     - [list]

       Default: 0
     - Choose whether to apply the filter kernel without modification
       or to use a confidence interval to relax or amplify the height criterium.

       * 0 - None
       * 1 - Relax filter
       * 2 - Amplify
   * - **Standard deviation**
     - ``STANDARD_DEVIATION``
     - [numeric: double]

       Default: 0.1
     - The standard deviation used to calculate a 5% confidence interval applied to the height threshold.
   * - **Output layer (ground)**

       Optional
     - ``OUTPUT_GROUND``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specify the filtered DEM containing only cells classified as ground.
       :ref:`One of <output_parameter_widget>`:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types_skip**
          :end-before: **end_file_output_types_skip**

   * - **Output layer (non-ground objects)**

       Optional
     - ``OUTPUT_NONGROUND``
     - [raster]

       Default: ``[Skip output]``
     - Specify the non-ground objects removed by the filter.
       :ref:`One of <output_parameter_widget>`:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types_skip**
          :end-before: **end_file_output_types_skip**

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
   * - **Creation options**

       Optional

       ``Added in 3.40``
     - ``CREATION_OPTIONS`` (for QGIS <= 3.42, this was ``CREATE_OPTIONS``)
     - [string]

       Default: ''
     - For adding one or more creation options that control the
       raster to be created (colors, block size, file
       compression...).
       For convenience, you can rely on predefined profiles (see
       :ref:`GDAL driver options section <gdal_createoptions>`).

       Batch Process and Model Designer: separate multiple options with a pipe
       character (``|``).

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
   * - **Output layer (ground)**
     - ``OUTPUT_GROUND``
     - [raster]
     - The filtered DEM containing only cells classified as ground.
   * - **Output layer (non-ground objects)**
     - ``OUTPUT_NONGROUND``
     - [raster]
     - The non-ground objects removed by the filter.

Python code
...........

**Algorithm ID**: ``native:dtmslopebasedfilter``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisfillsinkswangliu:

Fill sinks (Wang & Liu)
------------------------
``Added in 3.44``

Uses a method proposed by Wang & Liu to identify and fill surface depressions in digital elevation models.

The method was enhanced to allow the creation of hydrologically sound elevation models,
i.e. not only to fill the depression(s) but also to preserve a downward slope along the flow path.
If desired, this is accomplished by preserving a minimum slope gradient (and thus elevation difference) between cells.

*References: Wang, L. & H. Liu (2006): An efficient method for identifying and filling surface depressions
in digital elevation models for hydrologic analysis and modelling.
International Journal of Geographical Information Science, Vol. 20, No. 2: 193-213.*

.. seealso:: This algorithm is a port of the SAGA `Fill Sinks (Wang & Liu)`_ tool.

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
     - [raster]
     - Digital Terrain Model raster layer
   * - **Band number**
     - ``BAND``
     - [raster band]

       Default: 1
     - The band of the DEM to consider
   * - **Minimum slope (degrees)**
     - ``MIN_SLOPE``
     - [numeric: double]

       Default: 0.10
     - Minimum slope gradient to preserve from cell to cell;
       with a value of zero, sinks are filled up to the spill elevation
       (which results in flat areas).
   * - **Output layer (filled DEM)**

       Optional
     - ``OUTPUT_FILLED_DEM``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specify the output raster corresponding to the depression-free DEM.
       :ref:`One of <output_parameter_widget>`:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types_skip**
          :end-before: **end_file_output_types_skip**

   * - **Output layer (flow directions)**

       Optional
     - ``OUTPUT_FLOW_DIRECTIONS``
     - [raster]

       Default: ``[Skip output]``
     - Specify the output raster with computed flow directions.
       :ref:`One of <output_parameter_widget>`:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types_skip**
          :end-before: **end_file_output_types_skip**

   * - **Output layer (watershed basins)**

       Optional
     - ``OUTPUT_WATERSHED_BASINS``
     - [raster]

       Default: ``[Skip output]``
     - Specify the output raster corresponding to the delineated watershed basins.
       :ref:`One of <output_parameter_widget>`:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types_skip**
          :end-before: **end_file_output_types_skip**

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
   * - **Creation options**

       Optional
     - ``CREATION_OPTIONS``
     - [string]

       Default: ''
     - For adding one or more creation options that control the
       raster to be created (colors, block size, file
       compression...).
       For convenience, you can rely on predefined profiles (see
       :ref:`GDAL driver options section <gdal_createoptions>`).

       Batch Process and Model Designer: separate multiple options with a pipe
       character (``|``).

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
   * - **Output layer (filled DEM)**
     - ``OUTPUT_FILLED_DEM``
     - [raster]
     - Output raster corresponding to the depression-free digital elevation model.
   * - **Output layer (flow directions)**
     - ``OUTPUT_FLOW_DIRECTIONS``
     - [raster]
     - Output raster with computed flow directions; 0=N, 1=NE, 2=E, ... 7=NW.
   * - **Output layer (watershed basins)**
     - ``OUTPUT_WATERSHED_BASINS``
     - [raster]
     - Output raster corresponding to the delineated watershed basins.

Python code
...........

**Algorithm ID**: ``native:fillsinkswangliu``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisflowconnectivity:

Flow connectivity
------------------
``Added in 4.4``

Calculates deterministic 8 (D8) flow connectivity for each cell in an input elevation raster (DEM).

Output cell values represent the number of immediate 8-neighbor adjacent cells (0 to 8)
whose D8 steepest downslope flow direction points directly into the cell:

* 0 = Ridge, crest, or spring cell receiving no incoming surface flow.
* 1 = Channel segment cell receiving flow from a single upstream neighbor.
* 2+ = Stream junction or confluence cell receiving flow from multiple converging upstream paths.

.. seealso:: This algorithm is a port of the flow connectivity calculation
    from SAGA `Channel Network and Drainage Basins`_ tool.

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
     - [raster]
     - Digital Terrain Model raster layer
   * - **Flow connectivity**
     - ``OUTPUT``
     - [raster]

       Default: ``Save to temporary file``
     - Specify the output flow connectivity raster layer.
       :ref:`One of <output_parameter_widget>`:

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
   * - **Output NoData value**
     - ``NODATA``
     - [numeric: integer]

       Default: -9999
     - Value to use for NoData cells in the output layer.
   * - **Creation options**

       Optional
     - ``CREATION_OPTIONS``
     - [string]

       Default: ''
     - For adding one or more creation options that control the raster
       to be created (colors, block size, file compression...).
       For convenience, you can rely on predefined profiles
       (see :ref:`GDAL driver options section <gdal_createoptions>`).

       Batch Process and Model Designer: separate multiple options
       with a pipe character (``|``).

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
   * - **Flow connectivity**
     - ``OUTPUT``
     - [raster]
     - The output flow connectivity raster layer.

Python code
...........

**Algorithm ID**: ``native:flowconnectivity``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisflowdirection:

Flow direction
------------------
``Added in 4.4``

Calculates deterministic 8 (D8) flow directions for each cell in an input elevation raster (DEM).

Flow direction values are output as 8-neighbor directional indices numbered clockwise starting from North:
0 = North, 1 = North-East, 2 = East, 3 = South-East, 4 = South, 5 = South-West, 6 = West, 7 = North-West.
Sink/pit cells are assigned a value of -1 in the output, and flat areas are assigned -2.
Cells with no downslope neighbor or NoData elevation values are assigned nodata in the output.

.. seealso:: This algorithm is a port of the flow direction calculation
    from SAGA `Channel Network and Drainage Basins`_ tool.

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
     - [raster]
     - Digital Terrain Model raster layer
   * - **Flow direction**
     - ``OUTPUT``
     - [raster]

       Default: ``Save to temporary file``
     - Specify the output flow direction raster layer.
       :ref:`One of <output_parameter_widget>`:

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
   * - **Output NoData value**
     - ``NODATA``
     - [numeric: integer]

       Default: -9999
     - Value to use for NoData cells in the output layer.
   * - **Creation options**

       Optional
     - ``CREATION_OPTIONS``
     - [string]

       Default: ''
     - For adding one or more creation options that control the raster
       to be created (colors, block size, file compression...).
       For convenience, you can rely on predefined profiles
       (see :ref:`GDAL driver options section <gdal_createoptions>`).

       Batch Process and Model Designer: separate multiple options
       with a pipe character (``|``).

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
   * - **Flow direction**
     - ``OUTPUT``
     - [raster]
     - The output flow direction raster layer.

Python code
...........

**Algorithm ID**: ``native:flowdirection``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgishillshade:

Hillshade
---------
Calculates the hillshade raster layer given an input Digital Terrain
Model.

The shading of the layer is calculated according to the sun position:
you have the options to change both the horizontal angle (azimuth) and
the vertical angle (sun elevation) of the sun.

.. figure:: img/azimuth.png
   :align: center
   :scale: 50%

   Azimuth and vertical angle

The hillshade layer contains values from 0 (complete shadow) to 255
(complete sun).
Hillshade is used usually to better understand the relief of the area.

.. figure:: img/hillshade.png
   :align: center

   Hillshade layer with azimuth 300 and vertical angle 45

Particularly interesting is to give the hillshade layer a transparency
value and overlap it with the elevation raster:

.. figure:: img/hillshade_2.png
   :align: center

   Overlapping the hillshade with the elevation layer

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
   * - **Elevation layer**
     - ``INPUT``
     - [raster]
     - Digital Terrain Model raster layer
   * - **Z factor**
     - ``Z_FACTOR``
     - [numeric: double]

       Default: 1.0
     - Vertical exaggeration.
       This parameter is useful when the Z units differ from
       the X and Y units, for example feet and meters.
       You can use this parameter to adjust for this.
       Increasing the value of this parameter will
       exaggerate the final result (making it look more "hilly").
       The default is 1 (no exaggeration).
   * - **Azimuth (horizontal angle)**
     - ``AZIMUTH``
     - [numeric: double]

       Default: 300.0
     - Set the horizontal angle (in degrees) of the sun (clockwise
       direction). Range: 0 to 360. 0 is north.
   * - **Vertical angle**
     - ``V_ANGLE``
     - [numeric: double]

       Default: 40.0
     - Set the vertical angle (in degrees) of the sun, that is the
       height of the sun.
       Values can go from 0 (minimum elevation) to 90 (maximum
       elevation).
   * - **Hillshade**
     - ``OUTPUT``
     - [raster]

       Default: ``Save to temporary file``
     - Specify the output hillshade raster layer. :ref:`One of <output_parameter_widget>`:

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
   * - **Output NoData value**

       ``Added in 4.0``
     - ``NODATA``
     - [numeric: double]

       Default: -9999.0
     - Value to use for NoData cells in the output layer.
   * - **Creation options**

       Optional

       ``Added in 4.0``
     - ``CREATION_OPTIONS``
     - [string]

       Default: ''
     - For adding one or more creation options that control the raster
       to be created (colors, block size, file compression...).
       For convenience, you can rely on predefined profiles
       (see :ref:`GDAL driver options section <gdal_createoptions>`).

       Batch Process and Model Designer: separate multiple options
       with a pipe character (``|``).

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
   * - **Hillshade**
     - ``OUTPUT``
     - [raster]
     - The output hillshade raster layer

Python code
...........

**Algorithm ID**: ``native:hillshade``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgishypsometriccurves:

Hypsometric curves
------------------
Calculates hypsometric curves for an input Digital Elevation Model.
Curves are produced as CSV files in an output folder specified by the
user.

A hypsometric curve is a cumulative histogram of elevation values in
a geographical area.

You can use hypsometric curves to detect differences in the landscape
due to the geomorphology of the territory.

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
   * - **DEM to analyze**
     - ``INPUT_DEM``
     - [raster]
     - Digital Terrain Model raster layer to use for
       calculating altitudes
   * - **Boundary layer**
     - ``BOUNDARY_LAYER``
     - [vector: polygon]
     - Polygon vector layer with boundaries of areas used
       to calculate hypsometric curves
   * - **Step**
     - ``STEP``
     - [numeric: double]

       Default: 100.0
     - Vertical distance between curves
   * - **Use % of area instead of absolute value**
     - ``USE_PERCENTAGE``
     - [boolean]

       Default: False
     - Write area percentage to “Area” field of the CSV file
       instead of the absolute area
   * - **Hypsometric curves**
     - ``OUTPUT_DIRECTORY``
     - [folder]
     - Specify the output folder for the hypsometric curves.
       :ref:`One of <output_parameter_widget>`:

       .. include:: ../algs_include.rst
          :start-after: **directory_output_types**
          :end-before: **end_directory_output_types**

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
   * - **Hypsometric curves**
     - ``OUTPUT_DIRECTORY``
     - [folder]
     - Directory containing the files with the hypsometric
       curves.
       For each feature from the input vector layer, a CSV file
       with area and altitude values will be created.

       The file names start with ``histogram_``, followed by
       layer name and feature ID.

.. figure:: img/hypsometric.png
   :align: center
   :scale: 50%

Python code
...........

**Algorithm ID**: ``qgis:hypsometriccurves``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisrelief:

Relief
------
Creates a shaded relief layer from digital elevation data.
You can specify the relief color manually, or you can let the
algorithm choose automatically all the relief classes.

.. figure:: img/relief.png
   :align: center

   Relief layer

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
   * - **Elevation layer**
     - ``INPUT``
     - [raster]
     - Digital Terrain Model raster layer
   * - **Z factor**
     - ``Z_FACTOR``
     - [numeric: double]

       Default: 1.0
     - Vertical exaggeration.
       This parameter is useful when the Z units differ from
       the X and Y units, for example feet and meters.
       You can use this parameter to adjust for this.
       Increasing the value of this parameter will
       exaggerate the final result (making it look more "hilly").
       The default is 1 (no exaggeration).
   * - **Generate relief classes automatically**
     - ``AUTO_COLORS``
     - [boolean]

       Default: False
     - If you check this option the algorithm will create all
       the relief color classes automatically
   * - **Relief colors**

       Optional
     - ``COLORS``
     - [table widget]
     - Use the table widget if you want to choose the relief
       colors manually.
       You can add as many color classes as you want: for each
       class you can choose the lower and upper bound and
       finally by clicking on the color row you can choose the
       color thanks to the color widget.

       .. figure:: img/relief_table.png
          :align: center

          Manually setting of relief color classes

       The buttons in the right side panel give you the
       chance to: add or remove color classes, change the
       order of the color classes already defined, open an
       existing file with color classes and save the current
       classes as file.
   * - **Relief**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specify the output relief raster layer. :ref:`One of <output_parameter_widget>`:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types**
          :end-before: **end_file_output_types**

   * - **Frequency distribution**

       Optional
     - ``FREQUENCY_DISTRIBUTION``
     - [vector: table]

       Default: ``[Skip output]``
     - Specify the CSV table for the output frequency distribution.
       :ref:`One of <output_parameter_widget>`:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types_skip**
          :end-before: **end_file_output_types_skip**

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
   * - **Output NoData value**

       ``Added in 4.4``
     - ``NODATA``
     - [numeric: double]

       Default: -9999.0
     - Value to use for NoData cells in the output layer.
   * - **Creation options**

       Optional

       ``Added in 4.4``
     - ``CREATION_OPTIONS``
     - [string]

       Default: ''
     - For adding one or more creation options that control the raster
       to be created (colors, block size, file compression...).
       For convenience, you can rely on predefined profiles
       (see :ref:`GDAL driver options section <gdal_createoptions>`).

       Batch Process and Model Designer: separate multiple options
       with a pipe character (``|``).

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
   * - **Relief**
     - ``OUTPUT``
     - [raster]
     - The output relief raster layer
   * - **Frequency distribution**
     - ``OUTPUT``
     - [vector: table]
     - The output frequency distribution

Python code
...........

**Algorithm ID**: ``native:relief``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisruggednessindex:

Ruggedness index
----------------
Calculates the quantitative measurement of terrain heterogeneity
described by Riley et al. (1999).
It is calculated for every location, by summarizing the change in
elevation within the 3x3 pixel grid.

Each pixel contains the difference in elevation from a center cell and
the 8 cells surrounding it.

.. figure:: img/ruggedness.png
   :align: center

   Ruggedness layer from low (red) to high values (green)

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
   * - **Elevation layer**
     - ``INPUT``
     - [raster]
     - Digital Terrain Model raster layer
   * - **Z factor**
     - ``Z_FACTOR``
     - [numeric: double]

       Default: 1.0
     - Vertical exaggeration.
       This parameter is useful when the Z units differ from
       the X and Y units, for example feet and meters.
       You can use this parameter to adjust for this.
       Increasing the value of this parameter will
       exaggerate the final result (making it look more rugged).
       The default is 1 (no exaggeration).
   * - **Ruggedness**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specify the output ruggedness raster layer. :ref:`One of <output_parameter_widget>`:

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
   * - **Output NoData value**

       ``Added in 4.0``
     - ``NODATA``
     - [numeric: double]

       Default: -9999.0
     - Value to use for NoData cells in the output layer.
   * - **Creation options**

       Optional

       ``Added in 4.0``
     - ``CREATION_OPTIONS``
     - [string]

       Default: ''
     - For adding one or more creation options that control the raster
       to be created (colors, block size, file compression...).
       For convenience, you can rely on predefined profiles
       (see :ref:`GDAL driver options section <gdal_createoptions>`).

       Batch Process and Model Designer: separate multiple options
       with a pipe character (``|``).

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
   * - **Ruggedness**
     - ``OUTPUT``
     - [raster]
     - The output ruggedness raster layer

Python code
...........

**Algorithm ID**: ``native:ruggednessindex``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisslope:

Slope
-----
Calculates the slope from an input raster layer. The slope is the
angle of inclination of the terrain and is expressed in **degrees**.

.. figure:: img/slope.png
   :align: center

   Flat areas in red, steep areas in blue

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
   * - **Elevation layer**
     - ``INPUT``
     - [raster]
     - Digital Terrain Model raster layer
   * - **Z factor**
     - ``Z_FACTOR``
     - [numeric: double]

       Default: 1.0
     - Vertical exaggeration.
       This parameter is useful when the Z units differ from
       the X and Y units, for example feet and meters.
       You can use this parameter to adjust for this.
       Increasing the value of this parameter will
       exaggerate the final result (making it steeper).
       The default is 1 (no exaggeration).
   * - **Slope**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specify the output slope raster layer. :ref:`One of <output_parameter_widget>`:

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
   * - **Output NoData value**

       ``Added in 4.0``
     - ``NODATA``
     - [numeric: double]

       Default: -9999.0
     - Value to use for NoData cells in the output layer.
   * - **Creation options**

       Optional

       ``Added in 4.0``
     - ``CREATION_OPTIONS``
     - [string]

       Default: ''
     - For adding one or more creation options that control the raster
       to be created (colors, block size, file compression...).
       For convenience, you can rely on predefined profiles
       (see :ref:`GDAL driver options section <gdal_createoptions>`).

       Batch Process and Model Designer: separate multiple options
       with a pipe character (``|``).

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
   * - **Slope**
     - ``OUTPUT``
     - [raster]
     - The output slope raster layer

Python code
...........

**Algorithm ID**: ``native:slope``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisstrahlerorderfromdem:

Strahler order from DEM
------------------------
``Added in 4.4``

Calculates Strahler stream order from an input elevation raster (DEM).

D8 flow directions are computed internally to traverse channel trees topographically.
Confluences of two stream channels of order N produce a downstream channel of order N + 1.
When the threshold is set to 1, raw stream orders (1, 2, 3...) are calculated.
Higher threshold values mask non-stream cells as NoData and offset stream orders.

.. seealso:: This algorithm is a port of the Strahler stream order calculation from SAGA
    `Channel Network and Drainage Basins`_ tool.

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
   * - **Elevation raster**
     - ``INPUT``
     - [raster]
     - Digital Terrain Model raster layer
   * - **Minimum stream order threshold**
     - ``THRESHOLD``
     - [numeric: integer]

       Default: 1
     - Minimum stream order threshold
   * - **Strahler order**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specify the output Strahler order raster layer. :ref:`One of <output_parameter_widget>`:

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
   * - **Output NoData value**
     - ``NODATA``
     - [numeric: double]

       Default: -9999.0
     - Value to use for NoData cells in the output raster.
   * - **Creation options**

       Optional
     - ``CREATION_OPTIONS``
     - [string]

       Default: ''
     - For adding one or more creation options that control the raster
       to be created (colors, block size, file compression...).
       For convenience, you can rely on predefined profiles
       (see :ref:`GDAL driver options section <gdal_createoptions>`).

       Batch Process and Model Designer: separate multiple options
       with a pipe character (``|``).

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
   * - **Strahler order**
     - ``OUTPUT``
     - [raster]
     - The output Strahler order raster layer

Python code
...........

**Algorithm ID**: ``native:strahlerorderfromdem``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisstrahlerorderfromflowdirection:

Strahler order from DEM and flow direction
-------------------------------------------
``Added in 4.4``

Calculates Strahler stream order from an input elevation raster (DEM)
and a pre-computed D8 flow direction raster.

Confluences of two stream channels of order N produce a downstream channel of order N + 1.
When the threshold is set to 1, raw stream orders (1, 2, 3...) are calculated.
Higher threshold values mask non-stream cells as NoData and offset stream orders.

.. seealso:: This algorithm is a port of the Strahler stream order calculation from SAGA
    `Channel Network and Drainage Basins`_ tool.

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
   * - **Elevation raster**
     - ``INPUT``
     - [raster]
     - Digital Terrain Model raster layer
   * - **Flow direction raster**
     - ``INPUT_FLOW_DIRECTION``
     - [raster]
     - raster layer representing flow directions
   * - **Minimum stream order threshold**
     - ``THRESHOLD``
     - [numeric: integer]

       Default: 1
     - Minimum stream order threshold
   * - **Strahler order**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specify the output Strahler order raster layer. :ref:`One of <output_parameter_widget>`:

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
   * - **Output NoData value**
     - ``NODATA``
     - [numeric: double]

       Default: -9999.0
     - Value to use for NoData cells in the output raster.
   * - **Creation options**

       Optional
     - ``CREATION_OPTIONS``
     - [string]

       Default: ''
     - For adding one or more creation options that control the raster
       to be created (colors, block size, file compression...).
       For convenience, you can rely on predefined profiles
       (see :ref:`GDAL driver options section <gdal_createoptions>`).

       Batch Process and Model Designer: separate multiple options
       with a pipe character (``|``).

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
   * - **Strahler order**
     - ``OUTPUT``
     - [raster]
     - The output Strahler order raster layer

Python code
...........

**Algorithm ID**: ``native:strahlerorderfromflowdirection``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgistotalcurvature:

Total curvature
---------------
``Added in 4.0``

Calculates the total curvature from an input raster layer. The curvature is the second
derivative of the surface, revealing terrain features like ridges (positive curvature,
convex) and valleys (negative, concave), with zero indicating flat or saddle points.

.. figure:: img/total_curvature.png
   :align: center

   Total curvature layer, showing concave (negative) surfaces in white, convex (positive) surfaces in blue, and near-flat areas in red

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
   * - **Elevation layer**
     - ``INPUT``
     - [raster]
     - Digital Terrain Model raster layer
   * - **Z factor**
     - ``Z_FACTOR``
     - [numeric: double]

       Default: 1.0
     - Vertical exaggeration.
       This parameter is useful when the Z units differ from
       the X and Y units, for example feet and meters.
       You can use this parameter to adjust for this.
       Increasing the value of this parameter will
       exaggerate the final result (making it steeper).
       The default is 1 (no exaggeration).
   * - **Total curvature**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specify the output total curvature raster layer. :ref:`One of <output_parameter_widget>`:

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
   * - **Output NoData value**
     - ``NODATA``
     - [numeric: double]

       Default: -9999.0
     - Value to use for NoData cells in the output layer.
   * - **Creation options**

       Optional
     - ``CREATION_OPTIONS``
     - [string]

       Default: ''
     - For adding one or more creation options that control the raster
       to be created (colors, block size, file compression...).
       For convenience, you can rely on predefined profiles
       (see :ref:`GDAL driver options section <gdal_createoptions>`).

       Batch Process and Model Designer: separate multiple options
       with a pipe character (``|``).

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
   * - **Total curvature**
     - ``OUTPUT``
     - [raster]
     - The output total curvature raster layer

Python code
...........

**Algorithm ID**: ``native:totalcurvature``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisupslopeareafromlayer:

Upslope area (from layer)
-------------------------
``Added in 4.4``

Calculates the combined upslope contributing area (catchments)
for all target point locations provided in an input vector layer.

Each output raster cell value represents the percentage (0% to 100%)
of surface flow originating at that cell that reaches at least one of the target points
in the input vector layer. Various flow routing methods are supported.
An optional sink routes raster layer can be provided to explicitly override topographic flow
and direct water through karst features, culverts, or artificial depressions.

.. seealso:: This algorithm is a port of the SAGA `Upslope Area`_ tool.

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
   * - **Elevation**
     - ``INPUT``
     - [raster]
     - Input digital elevation model (DEM) raster layer.
   * - **Sink routes**

       Optional
     - ``SINK_ROUTES``
     - [raster]
     - Optional raster layer specifying explicit flow routes through sinks/depressions.
   * - **Method**
     - ``METHOD``
     - [enumeration]

       Default: 2
     - Flow routing methods:

       * 0 --- ``Deterministic 8``: Single-flow direction algorithm, routing 100% of flow
         to the steepest downslope neighbor (O'Callaghan & Mark 1984).
       * 1 --- ``Deterministic Infinity``: Continuous single-facet flow direction algorithm,
         routing flow along triangular facets using a 3×3 finite-difference aspect calculation (Tarboton 1997).
       * 2 --- ``Multiple Flow Direction``: Divergent flow distribution to all lower-elevation neighbors,
         weighted by slope and a configurable convergence exponent (Freeman 1991, Quinn et al. 1991).
       * 3 --- ``Multiple Triangular Flow Direction``: Advanced divergent routing utilizing 3D vector normal cross-products
         across triangular facets to distribute flow smoothly across complex terrain (Seibert & McGlynn 2007).
       * 4 --- ``Multiple Maximum Downslope Gradient Based Flow Direction``: Adaptive MFD variant scaling exponent weights
         dynamically based on the local maximum gradient (Qin et al. 2011).
   * - **Convergence**
     - ``CONVERGENCE``
     - [numeric: double]

       Default: 1.1
     - Convergence factor for Multiple Flow Direction algorithms.
   * - **Use contour length weighting**
     - ``MFD_CONTOUR``
     - [boolean]

       Default: False
     - Include pseudo contour length weighting factor in multiple flow routing.
       Reduces flow to diagonal neighbour cells by a factor of 0.71 (see Quinn et al. 1991 for details).
   * - **Target point layer**
     - ``INPUT``
     - [vector: point]
     - Vector point layer containing target locations.
   * - **Upslope area**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specify the output upslope area raster layer.
       :ref:`One of <output_parameter_widget>`:

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
   * - **Output NoData value**
     - ``NODATA``
     - [numeric: integer]

       Default: -9999
     - Value to use for NoData cells in the output layer.
   * - **Creation options**

       Optional
     - ``CREATION_OPTIONS``
     - [string]

       Default: ''
     - For adding one or more creation options that control the raster
       to be created (colors, block size, file compression...).
       For convenience, you can rely on predefined profiles
       (see :ref:`GDAL driver options section <gdal_createoptions>`).

       Batch Process and Model Designer: separate multiple options
       with a pipe character (``|``).

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
   * - **Upslope area**
     - ``OUTPUT``
     - [raster]
     - The output upslope area raster layer.

Python code
...........

**Algorithm ID**: ``native:upslopeareafromlayer``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisupslopeareafrompoint:

Upslope area (from point)
-------------------------
``Added in 4.4``

Calculates the upslope contributing area (catchment)
for a single target coordinate point on a Digital Elevation Model (DEM).

Each output raster cell value represents the percentage (0% to 100%)
of surface flow originating at that cell that drains to or passes through the target point.
Various flow routing methods are supported.
An optional sink routes raster layer can be provided to explicitly override topographic flow
and direct water through karst features, culverts, or artificial depressions.

.. seealso:: This algorithm is a port of the SAGA `Upslope Area`_ tool.

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
   * - **Elevation**
     - ``INPUT``
     - [raster]
     - Input digital elevation model (DEM) raster layer.
   * - **Sink routes**

       Optional
     - ``SINK_ROUTES``
     - [raster]
     - Optional raster layer specifying explicit flow routes through sinks/depressions.
   * - **Method**
     - ``METHOD``
     - [enumeration]

       Default: 2
     - Flow routing methods:

       * 0 --- ``Deterministic 8``: Single-flow direction algorithm, routing 100% of flow
         to the steepest downslope neighbor (O'Callaghan & Mark 1984).
       * 1 --- ``Deterministic Infinity``: Continuous single-facet flow direction algorithm,
         routing flow along triangular facets using a 3×3 finite-difference aspect calculation (Tarboton 1997).
       * 2 --- ``Multiple Flow Direction``: Divergent flow distribution to all lower-elevation neighbors,
         weighted by slope and a configurable convergence exponent (Freeman 1991, Quinn et al. 1991).
       * 3 --- ``Multiple Triangular Flow Direction``: Advanced divergent routing utilizing 3D vector normal cross-products
         across triangular facets to distribute flow smoothly across complex terrain (Seibert & McGlynn 2007).
       * 4 --- ``Multiple Maximum Downslope Gradient Based Flow Direction``: Adaptive MFD variant scaling exponent weights
         dynamically based on the local maximum gradient (Qin et al. 2011).

   * - **Convergence**
     - ``CONVERGENCE``
     - [numeric: double]

       Default: 1.1
     - Convergence factor for Multiple Flow Direction algorithms.
   * - **Use contour length weighting**
     - ``MFD_CONTOUR``
     - [boolean]

       Default: False
     - Include pseudo contour length weighting factor in multiple flow routing.
       Reduces flow to diagonal neighbour cells by a factor of 0.71 (see Quinn et al. 1991 for details).
   * - **Target point**
     - ``INPUT``
     - [coordinate]
     - World coordinate point defining the target cell.
   * - **Upslope area**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specify the output upslope area raster layer.
       :ref:`One of <output_parameter_widget>`:

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
   * - **Output NoData value**
     - ``NODATA``
     - [numeric: integer]

       Default: -9999
     - Value to use for NoData cells in the output layer.
   * - **Creation options**

       Optional
     - ``CREATION_OPTIONS``
     - [string]

       Default: ''
     - For adding one or more creation options that control the raster
       to be created (colors, block size, file compression...).
       For convenience, you can rely on predefined profiles
       (see :ref:`GDAL driver options section <gdal_createoptions>`).

       Batch Process and Model Designer: separate multiple options
       with a pipe character (``|``).

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
   * - **Upslope area**
     - ``OUTPUT``
     - [raster]
     - The output upslope area raster layer.

Python code
...........

**Algorithm ID**: ``native:upslopeareafrompoint``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _`Channel Network and Drainage Basins`: https://saga-gis.sourceforge.io/saga_tool_doc/9.13.0/ta_channels_5.html
.. _`DTM Filter (slope-based)`: https://saga-gis.sourceforge.io/saga_tool_doc/9.9.1/grid_filter_7.html
.. _`Fill Sinks (Wang & Liu)`: https://saga-gis.sourceforge.io/saga_tool_doc/9.9.1/ta_preprocessor_4.html
.. _`Upslope area`: https://saga-gis.sourceforge.io/saga_tool_doc/9.13.0/ta_hydrology_4.html
