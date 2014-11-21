Clip raster by mask layer
=========================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input layer`` [raster]
  <put parameter description here>

``Mask layer`` [vector: polygon]
  <put parameter description here>

``Nodata value, leave as none to take the nodata value from input`` [string]
  <put parameter description here>

  Default: *none*

``Create and output alpha band`` [boolean]
  <put parameter description here>

  Default: *False*

``Keep resolution of output raster`` [boolean]
  <put parameter description here>

  Default: *False*

``Additional creation parameters`` [string]
  Optional.

  <put parameter description here>

  Default: *(not set)*

Outputs
-------

``Output layer`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('gdalogr:cliprasterbymasklayer', input, mask, no_data, alpha_band, keep_resolution, extra, output)

See also
--------

