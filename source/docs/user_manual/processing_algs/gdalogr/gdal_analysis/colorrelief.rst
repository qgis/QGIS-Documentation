Color relief
============

Description
-----------

<put algortithm description here>

Parameters
----------

``Input layer`` [raster]
  <put parameter description here>

``Band number`` [number]
  <put parameter description here>

  Default: *1*

``Compute edges`` [boolean]
  <put parameter description here>

  Default: *False*

``Color configuration file`` [file]
  <put parameter description here>

``Matching mode`` [selection]
  <put parameter description here>

  Options:

  * 0 --- "0,0,0,0" RGBA
  * 1 --- Exact color
  * 2 --- Nearest color

  Default: *0*

Outputs
-------

``Output file`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('gdalogr:colorrelief', input, band, compute_edges, color_table, match_mode, output)

See also
--------

