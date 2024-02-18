Raster tools
============

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _qgisalignraster:

Align raster
------------

Aligns raster by resampling it to the same cell size
and reprojecting to the same CRS as a reference raster.

.. warning:: **This algorithm is ONLY available in the** :ref:`Model Designer <processing.modeler>` context.

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
     - [raster]
     - Input raster layer to align
   * - **Resampling method**
     - ``RESAMPLING_METHOD``
     - [enumeration]

       Default: 0
     - Method to use for input layer resampling.
       :class:`Available options <qgis.analysis.Qgis.GdalResampleAlgorithm>` are:

       .. include:: ../algs_include.rst
          :start-after: **raster_resampling_methods**
          :end-before: **end_raster_resampling_methods**

   * - **Rescale values according to the cell size**
     - ``RESCALE``
     - [boolean]

       Default: No
     -
   * - **Reference layer**
     - ``REFERENCE_LAYER``
     - [raster]
     - A raster layer that will be used to fetch extent, cell size and CRS
       that will be applied to input layers.
   * - **Override reference CRS**

       Optional
     - ``CRS``
     - [crs]
     - CRS to be used instead of the reference layer's
   * - **Override reference cell size X**

       Optional
     - ``CELL_SIZE_X``
     - [number]
     - Cell size in X direction to be used instead of the reference layer's
   * - **Override reference cell size Y**

       Optional
     - ``CELL_SIZE_Y``
     - [number]
     -  Cell size in Y direction to be used instead of the reference layer's
   * - **Override reference grid offset X**

       Optional
     - ``GRID_OFFSET_X``
     - [number]
     -  Offset in X direction to apply to cells grid
   * - **Override reference grid offset Y**

       Optional
     - ``GRID_OFFSET_Y``
     - [number]
     - Offset in Y direction to apply to cells grid
   * - **Clip to extent**

       Optional
     - ``EXTENT``
     - [extent]
     - Specify the extent of the output raster layer.
       It will internally be extended to a multiple of the tile size.

       .. include:: ../algs_include.rst
          :start-after: **extent_options**
          :end-before: **end_extent_options**
   * - **Aligned raster**
     - ``OUTPUT``
     - [raster]
     - output raster with pixels resampled

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Aligned raster**
     - ``OUTPUT``
     - [raster]
     - output raster with pixels resampled

Python code
...........

**Algorithm ID**: ``native:alignraster``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisalignrasters:

Align rasters
-------------

Aligns rasters by resampling them to the same cell size
and reprojecting to the same CRS as a reference raster.

.. warning:: **This algorithm is NOT available in the** :ref:`Model Designer <processing.modeler>` context.

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
     - ``INPUT``
     - [raster] [list]
     - List of input raster layers with resampling options associated
       (filled as a :class:`QgsProcessingParameterAlignRasterLayers
       <qgis.core.QgsProcessingParameterAlignRasterLayers>` item):

       **Input layer** [string] (``inputFile``)
         Full path of the input layer to align

       **Output file** [string] (``outputFile``)
         Full path of the corresponding aligned output layer

       **Resampling method** [enumeration] (``resampleMethod``)
         Method to use for input layer resampling.
         :class:`Available options <qgis.analysis.Qgis.GdalResampleAlgorithm>` are:

         .. include:: ../algs_include.rst
            :start-after: **raster_resampling_methods**
            :end-before: **end_raster_resampling_methods**

       **Rescale values according to the cell size** [boolean] (``rescale``)

   * - **Reference layer**
     - ``REFERENCE_LAYER``
     - [raster]
     - A raster layer that will be used to fetch extent, cell size and CRS
       that will be applied to input layers.
   * - **Override reference CRS**

       Optional
     - ``CRS``
     - [crs]
     - CRS to be used instead of the reference layer's
   * - **Override reference cell size X**

       Optional
     - ``CELL_SIZE_X``
     - [number]
     - Cell size in X direction to be used instead of the reference layer's
   * - **Override reference cell size Y**

       Optional
     - ``CELL_SIZE_Y``
     - [number]
     -  Cell size in Y direction to be used instead of the reference layer's
   * - **Override reference grid offset X**

       Optional
     - ``GRID_OFFSET_X``
     - [number]
     -  Offset in X direction to apply to cells grid
   * - **Override reference grid offset Y**

       Optional
     - ``GRID_OFFSET_Y``
     - [number]
     - Offset in Y direction to apply to cells grid
   * - **Clip to extent**

       Optional
     - ``EXTENT``
     - [extent]
     - Specify the extent of the output raster layer.
       It will internally be extended to a multiple of the tile size.

       .. include:: ../algs_include.rst
          :start-after: **extent_options**
          :end-before: **end_extent_options**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Aligned rasters**
     - ``OUTPUT_LAYERS``
     - [raster] [list]
     - output rasters with pixels resampled

Python code
...........

**Algorithm ID**: ``native:alignrasters``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisrasterize:

Convert map to raster
---------------------
Creates a raster image of map canvas content.

A :ref:`map theme <map_themes>` can be selected to render a
predetermined set of layers with a defined style for each layer.

Alternatively, a single layer can be selected if no map theme is set.

If neither map theme nor layer is set, the current map content will be
rendered.
The minimum extent entered will internally be extended to be a
multiple of the tile size.

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
   * - **Minimum extent to render (xmin, xmax, ymin, ymax)**
     - ``EXTENT``
     - [extent]
     - Specify the extent of the output raster layer.
       It will internally be extended to a multiple of the tile size.

       .. include:: ../algs_include.rst
          :start-after: **extent_options**
          :end-before: **end_extent_options**

   * - **Tile size**
     - ``TILE_SIZE``
     - [number]
       
       Default: 1024
     - Size of the tile of the output raster layer. Minimum value: 64.
   * - **Map units per pixel**
     - ``MAP_UNITS_PER_PIXEL``
     - [number]
       
       Default: 100.0
     - Pixel size (in map units). Minimum value: 0.0
   * - **Make background transparent**
     - ``MAKE_BACKGROUND_TRANSPARENT``
     - [boolean]
        
       Default: False
     - Allows exporting the map with a transparent background.
       Outputs an RGBA (instead of RGB) image if set to ``True``.
   * - **Map theme to render**
       
       Optional
     - ``MAP_THEME``
     - [enumeration]
     - Use an existing :ref:`map theme <map_themes>` for the
       rendering.
   * - **Single layer to render**
       
       Optional
     - ``LAYER``
     - [enumeration]
     - Choose a single layer for the rendering
   * - **Output layer**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specification of the output raster. One of:

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
   * - **Output layer**
     - ``OUTPUT``
     - [raster]
     - Output raster layer
  
Python code
...........

**Algorithm ID**: ``native:rasterize``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisfillnodata:

Fill NoData cells
-----------------

Resets the NoData values in the input raster to a chosen value, resulting in
raster dataset with no NoData pixels.

The algorithm respects the input raster data type, e.g. a floating point
fill value will be truncated when applied to an integer raster.

.. figure:: img/fill_nodata.png
  :align: center

  Filling NoData values (in grey) of a raster

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Input raster**
     - ``INPUT``
     - [raster]
     - The raster to process.
   * - **Band number**
     - ``BAND``
     - [number]

       Default: 1
     - The band of the raster
   * - **Fill value**
     - ``FILL_VALUE``
     - [number]

       Default: 1.0
     - Set the value to use for the NoData pixels
   * - **Output raster**
     - ``OUTPUT``
     - [raster]

       Default: ``[Save to temporary file]``
     - Specification of the output raster. One of:

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
   * - **Output raster**
     - ``OUTPUT``
     - [raster]
     - The output raster layer with filled data cells.

Python code
...........

**Algorithm ID**: ``native:fillnodata``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgistilesxyzdirectory:

Generate XYZ tiles (Directory)
-----------------------------------

Generates raster “XYZ” tiles using the current QGIS project
as individual images to a directory structure.

Optionally, a Leaflet HTML output file using the generated
tiles as a map layer could be created.

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
   * - **Extent (xmin, xmax, ymin, ymax)**
     - ``EXTENT``
     - [extent]
     - Specify the extent of the tiles.
       It will internally be extended to a multiple of the tile size.

       .. include:: ../algs_include.rst
          :start-after: **extent_options**
          :end-before: **end_extent_options**

   * - **Minimum zoom**
     - ``ZOOM_MIN``
     - [number]

       Default: 12
     - Minimum 0, maximum 25.
   * - **Maximum zoom**
     - ``ZOOM_MAX``
     - [number]

       Default: 12
     - Minimum 0, maximum 25.
   * - **DPI**
     - ``DPI``
     - [number]

       Default: 96
     - Minimum 48, maximum 600.
   * - **Background color**

       Optional
     - ``BACKGROUND_COLOR``
     - [color]

       Default: QColor(0, 0, 0, 0)
     - Choose the background color for the tiles
   * - **Enable antialiasing**
     - ``ANTIALIAS``
     - [boolean]

       Default: True
     - Determines if antialiasing should be enabled
   * - **Tile format**
     - ``TILE_FORMAT``
     - [enumeration]

       Default: 0
     - One of:

       * 0 --- PNG
       * 1 --- JPG

   * - **Quality (JPG only)**

       Optional
     - ``QUALITY``
     - [number]

       Default: 75
     - Minimum 1, maximum 100.
   * - **Metatile size**

       Optional
     - ``METATILESIZE``
     - [number]

       Default: 4
     - Specify a custom metatile size when generating XYZ tiles.
       Larger values may speed up the rendering of tiles and provide
       better labelling (fewer gaps without labels) at the expense of
       using more memory.
       Minimum 1, maximum 20.
   * - **Tile width**

       Optional
     - ``TILE_WIDTH``
     - [number]

       Default: 256
     - Minimum 1, maximum 4096.
   * - **Tile height**

       Optional
     - ``TILE_HEIGHT``
     - [number]

       Default: 256
     - Minimum 1, maximum 4096.
   * - **Use inverted tile Y axis (TMS conventions)**

       Optional
     - ``TMS_CONVENTION``
     - [boolean]

       Default: False
     - 
   * - **Output directory**

       Optional
     - ``OUTPUT_DIRECTORY``
     - [folder]

       Default: ``[Save to temporary folder]``
     - Specification of the output directory (for the tiles). One of:

       .. include:: ../algs_include.rst
          :start-after: **directory_output_types_skip**
          :end-before: **end_directory_output_types_skip**

   * - **Output html (Leaflet)**

       Optional
     - ``OUTPUT_HTML``
     - [html]

       Default: ``[Save to temporary file]``
     - Specification of the output HTML file. One of:

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
   * - **Leaflet HTML output title**

       Optional
     - ``HTML_TITLE``
     - [string]

       Default: Not set
     - HTML <title>-tag used for the Leaflet HTML output file.
   * - **Leaflet HTML output attribution**

       Optional
     - ``HTML_ATTRIBUTION``
     - [string]

       Default: Not set
     - Custom map attribution used for the Leaflet HTML output file.
       HTML links are possible.
   * - **Include OpenStreetMap basemap in Leaflet HTML output**

       Optional
     - ``HTML_OSM``
     - [boolean]

       Default: False
     - An OpenStreetMap basemap layer (source: https://tile.openstreetmap.org)
       is included in the Leaflet HTML output file. Proper map attribution is
       added automatically.

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
     - Output directory (for the tiles)
   * - **Output html (Leaflet)**
     - ``OUTPUT_HTML``
     - [html]
     - The output HTML (Leaflet) file

Python code
...........

**Algorithm ID**: ``native:tilesxyzdirectory``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgistilesxyzmbtiles:

Generate XYZ tiles (MBTiles)
---------------------------------

Generates raster “XYZ” tiles using the current QGIS project
as a single file in the “MBTiles” format.

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
   * - **Extent (xmin, xmax, ymin, ymax)**
     - ``EXTENT``
     - [extent]
     - Specify the extent of the tiles.
       It will internally be extended to a multiple of the tile size.

       .. include:: ../algs_include.rst
          :start-after: **extent_options**
          :end-before: **end_extent_options**

   * - **Minimum zoom**
     - ``ZOOM_MIN``
     - [number]

       Default: 12
     - Minimum 0, maximum 25.
   * - **Maximum zoom**
     - ``ZOOM_MAX``
     - [number]

       Default: 12
     - Minimum 0, maximum 25.
   * - **DPI**
     - ``DPI``
     - [number]

       Default: 96
     - Minimum 48, maximum 600.
   * - **Background color**

       Optional
     - ``BACKGROUND_COLOR``
     - [color]

       Default: QColor(0, 0, 0, 0)
     - Choose the background color for the tiles
   * - **Enable antialiasing**
     - ``ANTIALIAS``
     - [boolean]

       Default: True
     - Determines if antialiasing should be enabled
   * - **Tile format**
     - ``TILE_FORMAT``
     - [enumeration]

       Default: 0
     - One of:

       * 0 --- PNG
       * 1 --- JPG

   * - **Quality (JPG only)**

       Optional
     - ``QUALITY``
     - [number]

       Default: 75
     - Minimum 1, maximum 100.
   * - **Metatile size**

       Optional
     - ``METATILESIZE``
     - [number]

       Default: 4
     - Specify a custom metatile size when generating XYZ tiles.
       Larger values may speed up the rendering of tiles and provide
       better labelling (fewer gaps without labels) at the expense of
       using more memory.
       Minimum 1, maximum 20.
   * - **Output file (for MBTiles)**
     - ``OUTPUT_FILE``
     - [file]

       Default: ``[Save to temporary file]``
     - Specification of the output file. One of:

       .. include:: ../algs_include.rst
          :start-after: **file_output_types_skip**
          :end-before: **end_file_output_types_skip**


Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Output file (for MBTiles)**
     - ``OUTPUT_FILE``
     - [file]
     - The output file.

Python code
...........

**Algorithm ID**: ``native:tilesxyzmbtiles``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**
