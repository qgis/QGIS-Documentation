Stream Reach and Watershed
==========================

Description
-----------

<put algortithm description here>

Parameters
----------

``Pit Filled Elevation Grid`` [raster]
  <put parameter description here>

``D8 Flow Direction Grid`` [raster]
  <put parameter description here>

``D8 Drainage Area`` [raster]
  <put parameter description here>

``Stream Raster Grid`` [raster]
  <put parameter description here>

``Outlets Shapefile as Network Nodes`` [vector: point]
  Optional.

  <put parameter description here>

``Delineate Single Watershed`` [boolean]
  <put parameter description here>

  Default: *False*

Outputs
-------

``Stream Order Grid`` [raster]
  <put output description here>

``Watershed Grid`` [raster]
  <put output description here>

``Stream Reach Shapefile`` [vector]
  <put output description here>

``Network Connectivity Tree`` [file]
  <put output description here>

``Network Coordinates`` [file]
  <put output description here>

Console usage
-------------

::

  processing.runalg('taudem:streamreachandwatershed', -fel, -p, -ad8, -src, -o, -sw, -ord, -w, -net, -tree, -coord)

See also
--------

