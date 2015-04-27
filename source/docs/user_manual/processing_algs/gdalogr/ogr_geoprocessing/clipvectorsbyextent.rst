Clip vectors by extent
======================

Description
-----------

Clips any OGR-supported vector file to a given extent.

Parameters
----------

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
-------

``Output layer`` [vector]
  Output vector layer.

Console usage
-------------

::

  processing.runalg('gdalogr:clipvectorsbyextent', input_layer, clip_extent, options, output_layer)

See also
--------

