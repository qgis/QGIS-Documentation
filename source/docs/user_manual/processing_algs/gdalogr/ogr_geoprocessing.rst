|updatedisclaimer|

OGR geoprocessing
=================

Clip vectors by extent
----------------------

Description
...........

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

Console usage
.............

::

  processing.runalg('gdalogr:clipvectorsbyextent', input_layer, clip_extent, options, output_layer)

See also
........

Clip vectors by polygon
-----------------------

Description
...........

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

Console usage
.............

::

  processing.runalg('gdalogr:clipvectorsbypolygon', input_layer, clip_layer, options, output_layer)

See also
........

