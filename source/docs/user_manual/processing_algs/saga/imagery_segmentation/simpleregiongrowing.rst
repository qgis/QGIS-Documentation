Simple region growing
=====================

Description
-----------

<put algortithm description here>

Parameters
----------

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
-------

``Segments`` [raster]
  <put output description here>

``Similarity`` [raster]
  <put output description here>

``Seeds`` [table]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:simpleregiongrowing', seeds, features, method, neighbour, sig_1, sig_2, threshold, refresh, leafsize, segments, similarity, table)

See also
--------

