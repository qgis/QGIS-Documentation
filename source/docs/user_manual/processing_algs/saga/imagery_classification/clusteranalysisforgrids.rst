Cluster analysis for grids
==========================

Description
-----------

<put algortithm description here>

Parameters
----------

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
-------

``Clusters`` [raster]
  <put output description here>

``Statistics`` [table]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:clusteranalysisforgrids', grids, method, ncluster, normalise, oldversion, cluster, statistics)

See also
--------

