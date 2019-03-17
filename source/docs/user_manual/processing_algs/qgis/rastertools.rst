.. only:: html

   |updatedisclaimer|

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

``Minimum extent to render (xmin, xmax, ymin, ymax)`` [extent]
  Extent of the output raster layer. It will internally be extended to be a multiple
  of the tile size.

``Tile size`` [number]
  Size of the tile of the output raster layer.

  Default: *1024*

``Map units per pixel`` [number]
  Pixel size (in map units).

  Default: *100*

``Make background transparent`` [boolean]
  Allows to export the map with a transparent background, i.e. outputs a RGBA
  image if set to ``True`` instead of RGB.

  Default: *False*

``Map theme to render`` [enumeration]
  Optional

  If you have some map theme set, you can choose one of them for the final raster
  layer.

``Single layer to render`` [enumeration]
  Optional

  Choose a single layer for the output raster layer.

Outputs
.......

``Output layer`` [raster]
  Output raster layer.

.. _qgiscreateconstantrasterlayer:

Create constant raster layer
----------------------------
Given an extent and a value, generates a raster layer with all the pixels having
the same value chosen.

Parameters
..........

``Desired extent (xmin, xmax, ymin, ymax)`` [extent]
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

``Constant`` [raster]
  Raster covering the desired extent with pixel size and value chosen.


.. _qgissetstyleforrasterlayer:

Set style for raster layer
--------------------------
Sets the style of a raster layer. The style must be defined as a ``QML`` file.

No new output are created: the ``QML`` style is assigned to the raster layer chosen.

Parameters
..........

``Raster layer`` [raster]
  Raster layer.

``Style file`` [file]
  Path of the ``QML`` style file.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/3.4 for QGIS 3.4 docs and translations.`
