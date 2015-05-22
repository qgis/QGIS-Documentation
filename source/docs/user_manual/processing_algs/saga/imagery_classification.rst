|updatedisclaimer|

Imagery classification
======================

Change detection
----------------

Description
...........

<put algortithm description here>

Parameters
..........

``Initial State`` [raster]
  <put parameter description here>

``Look-up Table`` [table]
  Optional.

  <put parameter description here>

``Value`` [tablefield: any]
  <put parameter description here>

``Value (Maximum)`` [tablefield: any]
  <put parameter description here>

``Name`` [tablefield: any]
  <put parameter description here>

``Final State`` [raster]
  <put parameter description here>

``Look-up Table`` [table]
  Optional.

  <put parameter description here>

``Value`` [tablefield: any]
  <put parameter description here>

``Value (Maximum)`` [tablefield: any]
  <put parameter description here>

``Name`` [tablefield: any]
  <put parameter description here>

``Report Unchanged Classes`` [boolean]
  <put parameter description here>

  Default: *True*

``Output as...`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] cells
  * 1 --- [1] percent
  * 2 --- [2] area

  Default: *0*

Outputs
.......

``Changes`` [raster]
  <put output description here>

``Changes`` [table]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:changedetection', initial, ini_lut, ini_lut_min, ini_lut_max, ini_lut_nam, final, fin_lut, fin_lut_min, fin_lut_max, fin_lut_nam, nochange, output, change, changes)

See also
........

Cluster analysis for grids
--------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Grids`` [multipleinput: rasters]
  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Iterative Minimum Distance (Forgy 1965)
  * 1 --- [1] Hill-Climbing (Rubin 1967)
  * 2 --- [2] Combined Minimum Distance / Hillclimbing

  Default: *0*

``Clusters`` [number]
  <put parameter description here>

  Default: *5*

``Normalise`` [boolean]
  <put parameter description here>

  Default: *True*

``Old Version`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
.......

``Clusters`` [raster]
  <put output description here>

``Statistics`` [table]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:clusteranalysisforgrids', grids, method, ncluster, normalise, oldversion, cluster, statistics)

See also
........

Supervised classification
-------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Grids`` [multipleinput: rasters]
  <put parameter description here>

``Training Areas`` [vector: polygon]
  <put parameter description here>

``Class Identifier`` [tablefield: any]
  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Binary Encoding
  * 1 --- [1] Parallelepiped
  * 2 --- [2] Minimum Distance
  * 3 --- [3] Mahalanobis Distance
  * 4 --- [4] Maximum Likelihood
  * 5 --- [5] Spectral Angle Mapping
  * 6 ---  [6] Winner Takes All

  Default: *0*

``Normalise`` [boolean]
  <put parameter description here>

  Default: *True*

``Distance Threshold`` [number]
  <put parameter description here>

  Default: *0.0*

``Probability Threshold (Percent)`` [number]
  <put parameter description here>

  Default: *0.0*

``Probability Reference`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] absolute
  * 1 --- [1] relative

  Default: *0*

``Spectral Angle Threshold (Degree)`` [number]
  <put parameter description here>

  Default: *0.0*

Outputs
.......

``Class Information`` [table]
  <put output description here>

``Classification`` [raster]
  <put output description here>

``Quality`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:supervisedclassification', grids, roi, roi_id, method, normalise, threshold_dist, threshold_prob, relative_prob, threshold_angle, class_info, classes, quality)

See also
........

