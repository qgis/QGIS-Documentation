Watershed segmentation
======================

Description
-----------

<put algortithm description here>

Parameters
----------

``Grid`` [raster]
  <put parameter description here>

``Output`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Seed Value
  * 1 --- [1] Segment ID

  Default: *0*

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Minima
  * 1 --- [1] Maxima

  Default: *0*

``Join Segments based on Threshold Value`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] do not join
  * 1 --- [1] seed to saddle difference
  * 2 --- [2] seeds difference

  Default: *0*

``Threshold`` [number]
  <put parameter description here>

  Default: *0*

``Allow Edge Pixels to be Seeds`` [boolean]
  <put parameter description here>

  Default: *True*

``Borders`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
-------

``Segments`` [raster]
  <put output description here>

``Seed Points`` [vector]
  <put output description here>

``Borders`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:watershedsegmentation', grid, output, down, join, threshold, edge, bborders, segments, seeds, borders)

See also
--------

