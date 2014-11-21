Exact Large-Scale Mean-Shift segmentation, step 2
=================================================

Description
-----------

<put algortithm description here>

Parameters
----------

``Filtered image`` [raster]
  <put parameter description here>

``Spatial image`` [raster]
  Optional.

  <put parameter description here>

``Range radius`` [number]
  <put parameter description here>

  Default: *15*

``Spatial radius`` [number]
  <put parameter description here>

  Default: *5*

``Minimum Region Size`` [number]
  <put parameter description here>

  Default: *0*

``Size of tiles in pixel (X-axis)`` [number]
  <put parameter description here>

  Default: *500*

``Size of tiles in pixel (Y-axis)`` [number]
  <put parameter description here>

  Default: *500*

``Directory where to write temporary files`` [file]
  Optional.

  <put parameter description here>

``Temporary files cleaning`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
-------

``Output Image`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:exactlargescalemeanshiftsegmentationstep2', -in, -inpos, -ranger, -spatialr, -minsize, -tilesizex, -tilesizey, -tmpdir, -cleanup, -out)

See also
--------

