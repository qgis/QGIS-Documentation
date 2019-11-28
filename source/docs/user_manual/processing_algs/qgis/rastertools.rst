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

A :ref:`map theme <map_themes>` can be selected to render a predetermined set of
layers with a defined style for each layer.

Alternatively, a single layer can be selected if no map theme is set.

If neither map theme nor layer is set, the current map content will be rendered.
The minimum extent entered will internally be extended to be a multiple of the
tile size.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

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
       
       It will internally be extended to be a multiple of the tile size.
   * - **Tile size**
     - ``TILE_SIZE``
     - [number]
       
       Default: 1024
     - Size of the tile of the output raster layer. Minimium value: 64.
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
     - If you have map themes set, you can choose one of them
       for the rendering.
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
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Output layer**
     - ``OUTPUT``
     - [raster]
     - Output raster layer
  

.. _qgiscreateconstantrasterlayer:

Create constant raster layer
----------------------------
Generates a raster layer where all pixels have the same value.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

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
       
       It will internally be extended to be a multiple of the tile size.
   * - **Target CRS**
     - ``TARGET_CRS``
     - [crs]
       
       Default: Project CRS
     - CRS for the output raster layer
   * - **Pixel size**
     - ``PIXEL_SIZE``
     - [number]
       
       Default: 0.1
     - Pixel size (X=Y) in map units). Minimum value: 0.01
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

  Default: *project CRS*



Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Constant**
     - ``OUTPUT``
     - [raster]
     - Raster covering the desired extent with the specified pixel
       size and value.


.. _qgissetstyleforrasterlayer:

Set style for raster layer
--------------------------
Sets the style of a raster layer. The style must be defined as a ``QML`` file.

No new output are created: the ``QML`` style is assigned to the raster layer chosen.

.. seealso:: :ref:`qgissetstyleforvectorlayer`

Parameters
..........

``Raster layer`` [raster]
  Raster layer.

``Style file`` [file]
  Path of the ``QML`` style file.
