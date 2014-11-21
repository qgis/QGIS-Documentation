Supervised classification
=========================

Description
-----------

<put algortithm description here>

Parameters
----------

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
-------

``Class Information`` [table]
  <put output description here>

``Classification`` [raster]
  <put output description here>

``Quality`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:supervisedclassification', grids, roi, roi_id, method, normalise, threshold_dist, threshold_prob, relative_prob, threshold_angle, class_info, classes, quality)

See also
--------

