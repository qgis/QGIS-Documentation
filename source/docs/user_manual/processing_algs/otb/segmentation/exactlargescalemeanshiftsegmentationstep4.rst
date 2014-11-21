Exact Large-Scale Mean-Shift segmentation, step 4
=================================================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input Image`` [raster]
  <put parameter description here>

``Segmented image`` [raster]
  <put parameter description here>

``Size of tiles in pixel (X-axis)`` [number]
  <put parameter description here>

  Default: *500*

``Size of tiles in pixel (Y-axis)`` [number]
  <put parameter description here>

  Default: *500*

Outputs
-------

``Output GIS vector file`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:exactlargescalemeanshiftsegmentationstep4', -in, -inseg, -tilesizex, -tilesizey, -out)

See also
--------

