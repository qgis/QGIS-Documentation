Image to KMZ Export
===================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input image`` [raster]
  <put parameter description here>

``Tile Size`` [number]
  <put parameter description here>

  Default: *512*

``Image logo`` [raster]
  Optional.

  <put parameter description here>

``Image legend`` [raster]
  Optional.

  <put parameter description here>

``Default elevation`` [number]
  <put parameter description here>

  Default: *0*

Outputs
-------

``Output .kmz product`` [file]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:imagetokmzexport', -in, -tilesize, -logo, -legend, -elev.default, -out)

See also
--------

