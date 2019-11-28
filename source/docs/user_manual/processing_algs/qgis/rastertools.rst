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
Given an extent and a value, generates a raster layer with all the pixels having
the same value chosen.

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
   * - **Constant**
     - ``OUTPUT``
     - [raster]
     - Raster covering the desired extent with pixel size and value chosen``Desired extent (xmin, xmax, ymin, ymax)`` [extent]
  Extent for the raster layer.

``Target CRS`` [crs]
  CRS for the output raster layer.

  Default: *project CRS*

``Pixel size`` [number]
  Pixel size (X=Y) in map units.

  Default: *0.1*

``Constant value`` [number]
  Constant pixel value for the raster layer.

  Default: *1*

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
     - Raster covering the desired extent with pixel size and value chosen


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
