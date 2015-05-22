|updatedisclaimer|

Grid analysis
=============

Accumulated cost (anisotropic)
------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Cost Grid`` [raster]
  <put parameter description here>

``Direction of max cost`` [raster]
  <put parameter description here>

``Destination Points`` [raster]
  <put parameter description here>

``k factor`` [number]
  <put parameter description here>

  Default: *1*

``Threshold for different route`` [number]
  <put parameter description here>

  Default: *0*

Outputs
.......

``Accumulated Cost`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:accumulatedcostanisotropic', cost, direction, points, k, threshold, acccost)

See also
........

Accumulated cost (isotropic)
----------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Cost Grid`` [raster]
  <put parameter description here>

``Destination Points`` [raster]
  <put parameter description here>

``Threshold for different route`` [number]
  <put parameter description here>

  Default: *0.0*

Outputs
.......

``Accumulated Cost`` [raster]
  <put output description here>

``Closest Point`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:accumulatedcostisotropic', cost, points, threshold, acccost, closestpt)

See also
........

Aggregation index
-----------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input Grid`` [raster]
  <put parameter description here>

``Max. Number of Classes`` [number]
  <put parameter description here>

  Default: *5*

Outputs
.......

``Result`` [table]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:aggregationindex', input, maxnumclass, result)

See also
........

Analytical hierarchy process
----------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input Grids`` [multipleinput: rasters]
  <put parameter description here>

``Pairwise Comparisons Table`` [table]
  <put parameter description here>

Outputs
.......

``Output Grid`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:analyticalhierarchyprocess', grids, table, output)

See also
........

Cross-classification and tabulation
-----------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input Grid 1`` [raster]
  <put parameter description here>

``Input Grid 2`` [raster]
  <put parameter description here>

``Max. Number of Classes`` [number]
  <put parameter description here>

  Default: *5*

Outputs
.......

``Cross-Classification Grid`` [raster]
  <put output description here>

``Cross-Tabulation Table`` [table]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:crossclassificationandtabulation', input, input2, maxnumclass, resultgrid, resulttable)

See also
........

Fragmentation (alternative)
---------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Classification`` [raster]
  <put parameter description here>

``Class Identifier`` [number]
  <put parameter description here>

  Default: *1*

``Neighborhood Min`` [number]
  <put parameter description here>

  Default: *1*

``Neighborhood Max`` [number]
  <put parameter description here>

  Default: *1*

``Level Aggregation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] average
  * 1 --- [1] multiplicative

  Default: *0*

``Add Border`` [boolean]
  <put parameter description here>

  Default: *True*

``Connectivity Weighting`` [number]
  <put parameter description here>

  Default: *1.1*

``Minimum Density [Percent]`` [number]
  <put parameter description here>

  Default: *10*

``Minimum Density for Interior Forest [Percent]`` [number]
  <put parameter description here>

  Default: *99*

``Search Distance Increment`` [number]
  <put parameter description here>

  Default: *0.0*

``Density from Neighbourhood`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
.......

``Density [Percent]`` [raster]
  <put output description here>

``Connectivity [Percent]`` [raster]
  <put output description here>

``Fragmentation`` [raster]
  <put output description here>

``Summary`` [table]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:fragmentationalternative', classes, class, neighborhood_min, neighborhood_max, aggregation, border, weight, density_min, density_int, level_grow, density_mean, density, connectivity, fragmentation, fragstats)

See also
........

Fragmentation classes from density and connectivity
---------------------------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Density [Percent]`` [raster]
  <put parameter description here>

``Connectivity [Percent]`` [raster]
  <put parameter description here>

``Add Border`` [boolean]
  <put parameter description here>

  Default: *True*

``Connectivity Weighting`` [number]
  <put parameter description here>

  Default: *0*

``Minimum Density [Percent]`` [number]
  <put parameter description here>

  Default: *10*

``Minimum Density for Interior Forest [Percent]`` [number]
  <put parameter description here>

  Default: *99*

Outputs
.......

``Fragmentation`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:fragmentationclassesfromdensityandconnectivity', density, connectivity, border, weight, density_min, density_int, fragmentation)

See also
........

Fragmentation (standard)
------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Classification`` [raster]
  <put parameter description here>

``Class Identifier`` [number]
  <put parameter description here>

  Default: *1*

``Neighborhood Min`` [number]
  <put parameter description here>

  Default: *1*

``Neighborhood Max`` [number]
  <put parameter description here>

  Default: *3*

``Level Aggregation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] average
  * 1 --- [1] multiplicative

  Default: *0*

``Add Border`` [boolean]
  <put parameter description here>

  Default: *True*

``Connectivity Weighting`` [number]
  <put parameter description here>

  Default: *1.1*

``Minimum Density [Percent]`` [number]
  <put parameter description here>

  Default: *10*

``Minimum Density for Interior Forest [Percent]`` [number]
  <put parameter description here>

  Default: *99*

``Neighborhood Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] square
  * 1 --- [1] circle

  Default: *0*

``Include diagonal neighbour relations`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
.......

``Density [Percent]`` [raster]
  <put output description here>

``Connectivity [Percent]`` [raster]
  <put output description here>

``Fragmentation`` [raster]
  <put output description here>

``Summary`` [table]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:fragmentationstandard', classes, class, neighborhood_min, neighborhood_max, aggregation, border, weight, density_min, density_int, circular, diagonal, density, connectivity, fragmentation, fragstats)

See also
........

Layer of extreme value
----------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grids`` [multipleinput: rasters]
  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Maximum
  * 1 --- [1] Minimum

  Default: *0*

Outputs
.......

``Result`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:layerofextremevalue', grids, criteria, result)

See also
........

Least cost paths
----------------

Description
...........

<put algorithm description here>

Parameters
..........

``Source Point(s)`` [vector: point]
  <put parameter description here>

``Accumulated cost`` [raster]
  <put parameter description here>

``Values`` [multipleinput: rasters]
  Optional.

  <put parameter description here>

Outputs
.......

``Profile (points)`` [vector]
  <put output description here>

``Profile (lines)`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:leastcostpaths', source, dem, values, points, line)

See also
........

Ordered Weighted Averaging
--------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Input Grids`` [multipleinput: rasters]
  <put parameter description here>

``Weights`` [fixedtable]
  <put parameter description here>

Outputs
.......

``Output Grid`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:orderedweightedaveraging', grids, weights, output)

See also
........

Pattern analysis
----------------

Description
...........

<put algorithm description here>

Parameters
..........

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
.......

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
.............

::

  processing.runalg('saga:patternanalysis', input, winsize, maxnumclass, relative, diversity, dominance, fragmentation, ndc, cvn)

See also
........

Soil texture classification
---------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Sand`` [raster]
  Optional.

  <put parameter description here>

``Silt`` [raster]
  Optional.

  <put parameter description here>

``Clay`` [raster]
  Optional.

  <put parameter description here>

Outputs
.......

``Soil Texture`` [raster]
  <put output description here>

``Sum`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:soiltextureclassification', sand, silt, clay, texture, sum)

See also
........

