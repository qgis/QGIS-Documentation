Seed generation
===============

Description
-----------

<put algortithm description here>

Parameters
----------

``Features`` [multipleinput: rasters]
  <put parameter description here>

``Bandwidth (Cells)`` [number]
  <put parameter description here>

  Default: *2*

``Type of Surface`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] smoothed surface
  * 1 --- [1] variance (a)
  * 2 --- [2] variance (b)

  Default: *0*

``Extraction of...`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] minima
  * 1 --- [1] maxima
  * 2 --- [2] minima and maxima

  Default: *0*

``Feature Aggregation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] additive
  * 1 --- [1] multiplicative

  Default: *0*

``Normalized`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
-------

``Surface`` [raster]
  <put output description here>

``Seeds Grid`` [raster]
  <put output description here>

``Seeds`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:seedgeneration', grids, factor, type_surface, type_seeds, type_merge, normalize, surface, seeds_grid, seeds)

See also
--------

