Pattern analysis
================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input Grid`` [raster]
  <put parameter description here>

``Size of Analysis Window`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] 3 X 3
  * 1 --- [1] 5 X 5
  * 2 --- [2] 7 X 7

  Default: *0*

``Max. Number of Classes`` [number]
  <put parameter description here>

  Default: *0*

Outputs
-------

``Relative Richness`` [raster]
  <put output description here>

``Diversity`` [raster]
  <put output description here>

``Dominance`` [raster]
  <put output description here>

``Fragmentation`` [raster]
  <put output description here>

``Number of Different Classes`` [raster]
  <put output description here>

``Center Versus Neighbours`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:patternanalysis', input, winsize, maxnumclass, relative, diversity, dominance, fragmentation, ndc, cvn)

See also
--------

