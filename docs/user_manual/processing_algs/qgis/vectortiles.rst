Vector Tiles
============

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _qgisdownloadvectortiles:

Download vector tiles
---------------------

Downloads vector tiles of an input vector tile layer and saves them in a local vector tile file.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [vector tiles]
     - A vector tile layer to extract some tiles from
   * - **Extent**
     - ``EXTENT``
     - [extent]
     - Specify the spatial extent of the downloaded area.
       It will internally be extended to a multiple of the tile size.

       .. include:: ../algs_include.rst
          :start-after: **extent_options**
          :end-before: **end_extent_options**

   * - **Maximum zoom level to download**
     - ``MAX_ZOOM``
     - [number]

       Default: 10
     - Defines how far to zoom in and fetch data from the tiles
   * - **Tile limit**
     - ``TILE_LIMIT``
     - [number]

       Default: 100
     - Maximum number of tiles to download, considering the zoom levels and the extent.
   * - **Output**
     - ``OUTPUT``
     - [vector tiles]

       Default: [Save to temporary file]
     - Specification of the output vector tile file. One of:

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
   * - **Output**
     - ``OUTPUT``
     - [vector tiles]
     - A local vector tile file storing the downloaded tiles.

Python code
...........

**Algorithm ID**: ``native:downloadvectortiles``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgiswritevectortiles_mbtiles:

Write vector tiles (MBTiles)
----------------------------

Exports one or more vector layers to vector tiles, a data format
optimized for fast map rendering and small data size.

MBTiles is a specification for storing tiled map data in SQLite databases
for immediate usage and for transfer. MBTiles files are known as tilesets.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Input layers**
     - ``INPUT``
     - [vector: any] [list]
     - A list of layers to combine to generate the vector tiles
   * - **Minimum zoom level**
     - ``MIN_ZOOM``
     - [number]

       Default: 0
     - The lowest zoom level for which the tileset provides data.
       Set between 0 and 24.
   * - **Maximum zoom level**
     - ``MAX_ZOOM``
     - [number]

       Default: 3
     - The highest zoom level for which the tileset provides data.
       Set between 0 and 24.
   * - **Extent**

       Optional
     - ``EXTENT``
     - [extent]

       Default: Not set
     - The maximum extent of the rendered map area.
       Bounds must define an area covered by all zoom levels.
   * - **Metadata: Name**

       Optional
     - ``META_NAME``
     - [string]
     - Name of the tileset
   * - **Metadata: Description**

       Optional
     - ``META_DESCRIPTION``
     - [string]
     - A description of the tileset's contents
   * - **Metadata: Attribution**

       Optional
     - ``META_ATTRIBUTION``
     - [string]
     - An attribution string, which explains the sources of data and/or style for the map.
   * - **Metadata: Version**

       Optional
     - ``META_VERSION``
     - [string]
     - The version of the tileset.
       This refers to a revision of the tileset itself, not of the MBTiles specification.
   * - **Metadata: Type**

       Optional
     - ``META_TYPE``
     - [string]
     - Type of tileset. Possible values are ``overlay`` or ``baselayer``.
   * - **Metadata: Center**

       Optional
     - ``META_CENTER``
     - [string]
     - The center (string of comma-separated numbers: the longitude, latitude, and zoom level)
       of the default view of the map. Example: ``-122.1906,37.7599,11``
   * - **Destination MBTiles**
     - ``OUTPUT``
     - [vector tiles]

       Default: [Save to temporary file]
     - Specification of the output MBTiles file. One of:

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
   * - **Destination MBTiles**
     - ``OUTPUT``
     - [file]
     - Output vector tiles :file:`.mbtiles` file.

Python code
...........

**Algorithm ID**: ``native:writevectortiles_mbtiles``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgiswritevectortiles_xyz:

Write vector tiles (XYZ)
------------------------

Exports one or more vector layers to vector tiles, a data format
optimized for fast map rendering and small data size.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **File template**
     - ``XYZ_TEMPLATE``
     - [string]

       Default: '{z}/{x}/{y}.pbf'
     - Template to generate the vector tiles url
   * - **Input layers**
     - ``INPUT``
     - [vector: any] [list]
     - A list of layers to combine to generate the vector tiles
   * - **Minimum zoom level**
     - ``MIN_ZOOM``
     - [number]

       Default: 0
     - The lowest zoom level for which the tileset provides data.
       Set between 0 and 24.
   * - **Maximum zoom level**
     - ``MAX_ZOOM``
     - [number]

       Default: 3
     - The highest zoom level for which the tileset provides data.
       Set between 0 and 24.
   * - **Extent**

       Optional
     - ``EXTENT``
     - [extent]

       Default: Not set
     - The maximum extent of the rendered map area.
       Bounds must define an area covered by all zoom levels.
   * - **Output directory**
     - ``OUTPUT_DIRECTORY``
     - [folder]

       Default: [Save to temporary folder]
     - Specification of the output vector tiles folder. One of:

       .. include:: ../algs_include.rst
          :start-after: **directory_output_types**
          :end-before: **end_directory_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output directory**
     - ``OUTPUT_DIRECTORY``
     - [folder]
     - A folder containing different subsets of the vector tiles files
       (:file:`.pbf`) stored in subfolders corresponding to the zoom levels.

Python code
...........

**Algorithm ID**: ``native:writevectortiles_xyz``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**
