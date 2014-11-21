Clip vectors by extent
======================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input layer`` [vector: any]
  <put parameter description here>

``Clip extent`` [extent]
  <put parameter description here>

  Default: *0,1,0,1*

``Additional creation Options`` [string]
  Optional.

  <put parameter description here>

  Default: *(not set)*

Outputs
-------

``Output layer`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('gdalogr:clipvectorsbyextent', input_layer, clip_extent, options, output_layer)

See also
--------

