|updatedisclaimer|

Raster general
==============

Set style for raster layer
--------------------------

Description
...........

This algorithm applies the style defined in a QGIS layer style to a raster layer.

Parameters
..........

``Raster layer`` [raster]
  The raster layer to which the style should be applied.

``Style file`` [file]
  A QGIS layer style file (*.qml) containing the style to apply to the raster layer.

Outputs
.......

``Styled layer`` [raster]
  The raster layer with the style set to the style in the QGIS layer style file.

Console usage
.............

::

  processing.runalg('qgis:setstyleforrasterlayer', input, style)

See also
........

