.. only:: html

   |updatedisclaimer|

Vector geoprocessing
====================

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _gdalclipvectorbyextent:

Clip vector by extent
----------------------
Clips any OGR-supported vector file to a given extent.

This algorithm is derived from the `ogr2ogr utility <https://www.gdal.org/ogr2ogr.html>`_ .

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer.

``Clip extent`` [extent]
  Defines the bounding box that should be used for the output vector file.
  It has to be defined in target CRS units.

``Additional creation Options`` [string]
  Optional

  <put parameter description here>

  Default: *(not set)*

Outputs
.......

``Output layer`` [vector: any]
  Output vector layer.


.. _gdalclipvectorbypolygon:

Clip vector by polygon
-----------------------
Clips any OGR-supported vector layer by a polygon.

This algorithm is derived from the `ogr2ogr utility <https://www.gdal.org/ogr2ogr.html>`_ .

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer.

``Clip layer`` [vector: polygon]
  Layer to be used as clipping extent for the input vector layer.

``Additional creation Options`` [string]
  Optional

  <put parameter description here>

  Default: *(not set)*

Outputs
.......

``Output layer`` [vector: any]
  Output vector layer. By default this is an ESRI Shapefile.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/3.4 for QGIS 3.4 docs and translations.`
