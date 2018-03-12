.. only:: html

   |updatedisclaimer|

Vector geoprocessing
====================

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _gdalclipvectorbyextent:

Clip vectors by extent
----------------------
Clips any OGR-supported vector file to a given extent.
The algorithm is derived from the `ogr2ogr utility <http://www.gdal.org/ogr2ogr.html>`_ .

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer.

``Clip extent`` [extent]
  Defines the bounding box that should be used for the output vector file.
  It has to be defined in target CRS units.

  Default: *0,1,0,1*

``Additional creation Options`` [string]
  Optional.

  <put parameter description here>

  Default: *(not set)*

Outputs
.......

``Output layer`` [vector]
  Output vector layer.


.. _gdalclipvectorbypolygon:

Clip vectors by polygon
-----------------------
Clips any OGR-supported vector layer by a polygon.
The algorithm is derived from the `ogr2ogr utility <http://www.gdal.org/ogr2ogr.html>`_ .

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer.

``Clip layer`` [vector: polygon]
  Layer to be used as clipping extent for the input vector layer.

``Additional creation Options`` [string]
  Optional.

  <put parameter description here>

  Default: *(not set)*

Outputs
.......

``Output layer`` [vector]
  Output vector layer. By default this is an ESRI Shapefile.

.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs for 'QGIS testing'. Visit http://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`