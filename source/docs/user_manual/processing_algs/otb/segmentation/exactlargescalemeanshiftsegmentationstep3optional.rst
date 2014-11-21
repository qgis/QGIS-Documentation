Exact Large-Scale Mean-Shift segmentation, step 3 (optional)
============================================================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input image`` [raster]
  <put parameter description here>

``Segmented image`` [raster]
  <put parameter description here>

``Minimum Region Size`` [number]
  <put parameter description here>

  Default: *50*

``Size of tiles in pixel (X-axis)`` [number]
  <put parameter description here>

  Default: *500*

``Size of tiles in pixel (Y-axis)`` [number]
  <put parameter description here>

  Default: *500*

Outputs
-------

``Output Image`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:exactlargescalemeanshiftsegmentationstep3optional', -in, -inseg, -minsize, -tilesizex, -tilesizey, -out)

See also
--------

