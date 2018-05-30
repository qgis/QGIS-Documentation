.. only:: html

   |updatedisclaimer|

Vector conversion
=================

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _gdalconvertformat:

Convert format
--------------
Converts any OGR-supported vector layer into another OGR-supported
format.
This algorithm is derived from the `ogr2ogr utility <http://www.gdal.org/ogr2ogr.html>`_ .

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer.

``Destination Format`` [selection]
  Defines the destination format. By default this is ESRI Shapefile.

  Options:

  * 0 --- ESRI Shapefile
  * 1 --- GeoJSON
  * 2 --- GeoRSS
  * 3 --- SQLite
  * 4 --- GMT
  * 5 --- MapInfo File
  * 6 --- INTERLIS 1
  * 7 --- INTERLIS 2
  * 8 --- GML
  * 9 --- Geoconcept
  * 10 --- DXF
  * 11 --- DGN
  * 12 --- CSV
  * 13 --- BNA
  * 14 --- S57
  * 15 --- KML
  * 16 --- GPX
  * 17 --- PGDump
  * 18 --- GPSTrackMaker
  * 19 --- ODS
  * 20 --- XLSX
  * 21 --- PDF

  Default: *0*

``Creation Options`` [string]
  Optional.

  <put parameter description here>

  Default: *(not set)*

Outputs
.......

``Output layer`` [vector]
  Output vector layer.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit http://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
