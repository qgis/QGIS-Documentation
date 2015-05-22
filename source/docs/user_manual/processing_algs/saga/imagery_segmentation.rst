|updatedisclaimer|

Imagery segmentation
====================

Grid skeletonization
--------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Standard
  * 1 --- [1] Hilditch's Algorithm
  * 2 --- [2] Channel Skeleton

  Default: *0*

``Initialisation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Less than
  * 1 --- [1] Greater than

  Default: *0*

``Threshold (Init.)`` [number]
  <put parameter description here>

  Default: *0.0*

``Convergence`` [number]
  <put parameter description here>

  Default: *3.0*

Outputs
.......

``Skeleton`` [raster]
  <put output description here>

``Skeleton`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:gridskeletonization', input, method, init_method, init_threshold, convergence, result, vector)

See also
........

Seed generation
---------------

Description
...........

<put algortithm description here>

Parameters
..........

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
.......

``Surface`` [raster]
  <put output description here>

``Seeds Grid`` [raster]
  <put output description here>

``Seeds`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:seedgeneration', grids, factor, type_surface, type_seeds, type_merge, normalize, surface, seeds_grid, seeds)

See also
........

Simple region growing
---------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Seeds`` [raster]
  <put parameter description here>

``Features`` [multipleinput: rasters]
  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] feature space and position
  * 1 --- [1] feature space

  Default: *0*

``Neighbourhood`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] 4 (von Neumann)
  * 1 --- [1] 8 (Moore)

  Default: *0*

``Variance in Feature Space`` [number]
  <put parameter description here>

  Default: *1.0*

``Variance in Position Space`` [number]
  <put parameter description here>

  Default: *1.0*

``Threshold - Similarity`` [number]
  <put parameter description here>

  Default: *0.0*

``Refresh`` [boolean]
  <put parameter description here>

  Default: *True*

``Leaf Size (for Speed Optimisation)`` [number]
  <put parameter description here>

  Default: *256*

Outputs
.......

``Segments`` [raster]
  <put output description here>

``Similarity`` [raster]
  <put output description here>

``Seeds`` [table]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:simpleregiongrowing', seeds, features, method, neighbour, sig_1, sig_2, threshold, refresh, leafsize, segments, similarity, table)

See also
........

Watershed segmentation
----------------------

Description
...........

<put algortithm description here>

Parameters
..........

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
.......

``Segments`` [raster]
  <put output description here>

``Seed Points`` [vector]
  <put output description here>

``Borders`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:watershedsegmentation', grid, output, down, join, threshold, edge, bborders, segments, seeds, borders)

See also
........

