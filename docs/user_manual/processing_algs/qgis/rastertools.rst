Raster tools
============

.. only:: html

   .. contents::
      :local:
      :depth: 1


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
       One of:
       
       * Use Canvas Extent
       * Select Extent on Canvas
       * Use Layer Extent...
       
       It will internally be extended to a multiple of the tile size.
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
       
       Default: Save to temporary file
     - Specification of the output raster. One of:
       
       * Save to a Temporary File
       * Save to File...
       
       The file encoding can also be changed here.

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
  
**Algorithm ID**: ``qgis:rasterize``

.. include:: qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgiscreateconstantrasterlayer:

Create constant raster layer
----------------------------
Generates a raster layer where all pixels have the same value.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Desired extent (xmin, xmax, ymin, ymax)**
     - ``EXTENT``
     - [extent]
     - Specify the extent of the output raster layer.
       One of:
       
       * Use Canvas Extent
       * Select Extent on Canvas
       * Use Layer Extent...
       
       It will internally be extended to a multiple of the tile size.
   * - **Target CRS**
     - ``TARGET_CRS``
     - [crs]
       
       Default: Project CRS
     - CRS for the output raster layer
   * - **Pixel size**
     - ``PIXEL_SIZE``
     - [number]
       
       Default: 0.1
     - Pixel size (X=Y) in map units. Minimum value: 0.01
   * - **Constant value**
     - ``NUMBER``
     - [number]
       
       Default: 1
     - Constant pixel value for the output raster layer.
   * - **Constant**
     - ``OUTPUT``
     - [raster]
     - Specification of the output raster. One of:
       
       * Save to a Temporary File
       * Save to File...
       
       The file encoding can also be changed here.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Constant**
     - ``OUTPUT``
     - [raster]
     - Raster covering the desired extent with the specified pixel
       size and value.

**Algorithm ID**: ``qgis:createconstantrasterlayer``

.. include:: qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgistilesxyzdirectory:

Generate XYZ tiles (Directory)
-----------------------------------

Generates raster “XYZ” tiles using the current QGIS project
as individual images to a directory structure.

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
       One of:

       * Use Canvas Extent
       * Select Extent on Canvas
       * Use Layer Extent...

       It will internally be extended to a multiple of the tile size.
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
     - ``OUTPUT_DIRECTORY``
     - [folder]

       Default: ``[Save to temporary folder]``
     - Specification of the output raster. One of:

       * Skip Output
       * Save to a Temporary Directory
       * Save to Directory...

       The file encoding can also be changed here.
   * - **Output html (Leaflet)**
     - ``OUTPUT_HTML``
     - [html]

       Default: ``[Save to temporary file]``
     - Specification of the output HTML file. One of:

       * Skip Output
       * Save to a Temporary File
       * Save to File...

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

**Algorithm ID**: ``qgis:tilesxyzdirectory``

.. include:: qgis_algs_include.rst
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
       One of:

       * Use Canvas Extent
       * Select Extent on Canvas
       * Use Layer Extent...

       It will internally be extended to a multiple of the tile size.
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

       * Skip Output
       * Save to a Temporary File
       * Save to File...

       The file encoding can also be changed here.

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

**Algorithm ID**: ``qgis:tilesxyzmbtiles``

.. include:: qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgissetstyleforrasterlayer:

Set style for raster layer
--------------------------
Sets the style of a raster layer. The style must be defined as a
``QML`` file.

No new output are created: the ``QML`` style is assigned to the raster
layer chosen.

.. seealso:: :ref:`qgissetstyleforvectorlayer`

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Raster layer**
     - ``INPUT``
     - [raster]
     - The raster layer
   * - **Style file**
     - ``STYLE``
     - [file]
     - Path to the ``QML`` style file.
  
Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Raster layer**
     - ``INPUT``
     - [raster]
     - The raster layer with the chosen style

**Algorithm ID**: ``qgis:setstyleforrasterlayer``

.. include:: qgis_algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**
