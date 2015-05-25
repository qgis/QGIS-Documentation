|updatedisclaimer|

Terrain morphometry
===================

Convergence index
-----------------

Description
...........

Calculates an index of convergence/divergence regarding to overland flow. By
its meaning it is similar to plan or horizontal curvature, but gives much
smoother results. The calculation uses the aspects of surrounding cells, i.e.
it looks to which degree surrounding cells point to the center cell. The result
is given as percentages, negative values correspond to convergent, positive to
divergent flow conditions. Minus 100 would be like a peak of a cone, plus
100 a pit, and 0 an even slope.

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Aspect
  * 1 --- [1] Gradient

  Default: *0*

``Gradient Calculation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] 2 x 2
  * 1 --- [1] 3 x 3

  Default: *0*

Outputs
.......

``Convergence Index`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:convergenceindex', elevation, method, neighbours, result)

See also
........

* Koethe, R. / Lehmeier, F. (1996): 'SARA, System zur Automatischen
  Relief-Analyse', Benutzerhandbuch, 2. Auflage [Geogr. Inst. Univ. Goettingen,
  unpublished]

Convergence index (search radius)
---------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Radius [Cells]`` [number]
  <put parameter description here>

  Default: *10*

``Distance Weighting`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] no distance weighting
  * 1 --- [1] inverse distance to a power
  * 2 --- [2] exponential
  * 3 --- [3] gaussian weighting

  Default: *0*

``Inverse Distance Weighting Power`` [number]
  <put parameter description here>

  Default: *1*

``Inverse Distance Offset`` [boolean]
  <put parameter description here>

  Default: *True*

``Gaussian and Exponential Weighting Bandwidth`` [number]
  <put parameter description here>

  Default: *1*

``Gradient`` [boolean]
  <put parameter description here>

  Default: *True*

``Difference`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] direction to the center cell
  * 1 --- [1] center cell's aspect direction

  Default: *0*

Outputs
.......

``Convergence Index`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:convergenceindexsearchradius', elevation, radius, distance_weighting_weighting, distance_weighting_idw_power, distance_weighting_idw_offset, distance_weighting_bandwidth, slope, difference, convergence)

See also
........

Curvature classification
------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Plan Curvature`` [raster]
  <put parameter description here>

``Profile Curvature`` [raster]
  <put parameter description here>

``Threshold for plane`` [number]
  <put parameter description here>

  Default: *0.001*

Outputs
.......

``Curvature Classification`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:curvatureclassification', cplan, cprof, threshold, class)

See also
........

Diurnal anisotropic heating
---------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Alpha Max (Degree)`` [number]
  <put parameter description here>

  Default: *202.5*

Outputs
.......

``Diurnal Anisotropic Heating`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:diurnalanisotropicheating', dem, alpha_max, dah)

See also
........

Downslope distance gradient
---------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Vertical Distance`` [number]
  <put parameter description here>

  Default: *10*

``Output`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] distance
  * 1 --- [1] gradient (tangens)
  * 2 --- [2] gradient (degree)

  Default: *0*

Outputs
.......

``Gradient`` [raster]
  <put output description here>

``Gradient Difference`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:downslopedistancegradient', dem, distance, output, gradient, difference)

See also
........

Effective air flow heights
--------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Wind Direction`` [raster]
  Optional.

  <put parameter description here>

``Wind Speed`` [raster]
  Optional.

  <put parameter description here>

``Constant Wind Direction [Degree]`` [number]
  <put parameter description here>

  Default: *135*

``Old Version`` [boolean]
  <put parameter description here>

  Default: *True*

``Search Distance [km]`` [number]
  <put parameter description here>

  Default: *300*

``Acceleration`` [number]
  <put parameter description here>

  Default: *1.5*

``Use Pyramids with New Version`` [boolean]
  <put parameter description here>

  Default: *True*

``Lee Factor`` [number]
  <put parameter description here>

  Default: *0.5*

``Luv Factor`` [number]
  <put parameter description here>

  Default: *1.0*

``Wind Direction Units`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] radians
  * 1 --- [1] degree

  Default: *0*

``Wind Speed Scale Factor`` [number]
  <put parameter description here>

  Default: *1.0*

Outputs
.......

``Effective Air Flow Heights`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:effectiveairflowheights', dem, dir, len, dir_const, oldver, maxdist, accel, pyramids, leefact, luvfact, dir_units, len_scale, afh)

See also
........

Hypsometry
----------

Description
...........

<put algorithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Number of Classes`` [number]
  <put parameter description here>

  Default: *100.0*

``Sort`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] up
  * 1 --- [1] down

  Default: *0*

``Classification Constant`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] height
  * 1 --- [1] area

  Default: *0*

``Use Z-Range`` [boolean]
  <put parameter description here>

  Default: *True*

``Z-Range Min`` [number]
  <put parameter description here>

  Default: *0.0*

``Z-Range Max`` [number]
  <put parameter description here>

  Default: *1000.0*

Outputs
.......

``Hypsometry`` [table]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:hypsometry', elevation, count, sorting, method, bzrange, zrange_min, zrange_max, table)

See also
........

Land surface temperature
------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Elevation [m]`` [raster]
  <put parameter description here>

``Short Wave Radiation [kW/m2]`` [raster]
  <put parameter description here>

``Leaf Area Index`` [raster]
  <put parameter description here>

``Elevation at Reference Station [m]`` [number]
  <put parameter description here>

  Default: *0.0*

``Temperature at Reference Station [Deg.Celsius]`` [number]
  <put parameter description here>

  Default: *0.0*

``Temperature Gradient [Deg.Celsius/km]`` [number]
  <put parameter description here>

  Default: *6.5*

``C Factor`` [number]
  <put parameter description here>

  Default: *1.0*

Outputs
.......

``Land Surface Temperature [Deg.Celsius]`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:landsurfacetemperature', dem, swr, lai, z_reference, t_reference, t_gradient, c_factor, lst)

See also
........

Mass balance index
------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Vertical Distance to Channel Network`` [raster]
  Optional.

  <put parameter description here>

``T Slope`` [number]
  <put parameter description here>

  Default: *15.0*

``T Curvature`` [number]
  <put parameter description here>

  Default: *0.01*

``T Vertical Distance to Channel Network`` [number]
  <put parameter description here>

  Default: *15.0*

Outputs
.......

``Mass Balance Index`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:massbalanceindex', dem, hrel, tslope, tcurve, threl, mbi)

See also
........

Morphometric protection index
-----------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Radius`` [number]
  <put parameter description here>

  Default: *2000.0*

Outputs
.......

``Protection Index`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:morphometricprotectionindex', dem, radius, protection)

See also
........

Multiresolution index of valley bottom flatness (mrvbf)
-------------------------------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Initial Threshold for Slope`` [number]
  <put parameter description here>

  Default: *16*

``Threshold for Elevation Percentile (Lowness)`` [number]
  <put parameter description here>

  Default: *0.4*

``Threshold for Elevation Percentile (Upness)`` [number]
  <put parameter description here>

  Default: *0.35*

``Shape Parameter for Slope`` [number]
  <put parameter description here>

  Default: *4.0*

``Shape Parameter for Elevation Percentile`` [number]
  <put parameter description here>

  Default: *3.0*

``Update Views`` [boolean]
  <put parameter description here>

  Default: *True*

``Classify`` [boolean]
  <put parameter description here>

  Default: *True*

``Maximum Resolution (Percentage)`` [number]
  <put parameter description here>

  Default: *100*

Outputs
.......

``MRVBF`` [raster]
  <put output description here>

``MRRTF`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:multiresolutionindexofvalleybottomflatnessmrvbf', dem, t_slope, t_pctl_v, t_pctl_r, p_slope, p_pctl, update, classify, max_res, mrvbf, mrrtf)

See also
........

Real area calculation
---------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

Outputs
.......

``Real Area Grid`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:realareacalculation', dem, area)

See also
........

Relative heights and slope positions
------------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``w`` [number]
  <put parameter description here>

  Default: *0.5*

``t`` [number]
  <put parameter description here>

  Default: *10.0*

``e`` [number]
  <put parameter description here>

  Default: *2.0*

Outputs
.......

``Slope Height`` [raster]
  <put output description here>

``Valley Depth`` [raster]
  <put output description here>

``Normalized Height`` [raster]
  <put output description here>

``Standardized Height`` [raster]
  <put output description here>

``Mid-Slope Positon`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:relativeheightsandslopepositions', dem, w, t, e, ho, hu, nh, sh, ms)

See also
........

Slope, aspect, curvature
------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Maximum Slope (Travis et al. 1975)
  * 1 --- [1] Maximum Triangle Slope (Tarboton 1997)
  * 2 --- [2] Least Squares Fitted Plane (Horn 1981, Costa-Cabral & Burgess 1996)
  * 3 --- [3] Fit 2.Degree Polynom (Bauer, Rohdenburg, Bork 1985)
  * 4 --- [4] Fit 2.Degree Polynom (Heerdegen & Beran 1982)
  * 5 --- [5] Fit 2.Degree Polynom (Zevenbergen & Thorne 1987)
  * 6 --- [6] Fit 3.Degree Polynom (Haralick 1983)

  Default: *5*

Outputs
.......

``Slope`` [raster]
  <put output description here>

``Aspect`` [raster]
  <put output description here>

``Curvature`` [raster]
  <put output description here>

``Plan Curvature`` [raster]
  <put output description here>

``Profile Curvature`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:slopeaspectcurvature', elevation, method, slope, aspect, curv, hcurv, vcurv)

See also
........

Surface specific points
-----------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Mark Highest Neighbour
  * 1 --- [1] Opposite Neighbours
  * 2 --- [2] Flow Direction
  * 3 --- [3] Flow Direction (up and down)
  * 4 --- [4] Peucker & Douglas

  Default: *0*

``Threshold`` [number]
  <put parameter description here>

  Default: *2.0*

Outputs
.......

``Result`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:surfacespecificpoints', elevation, method, threshold, result)

See also
........

Terrain ruggedness index (tri)
------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Radius (Cells)`` [number]
  <put parameter description here>

  Default: *1*

``Distance Weighting`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] no distance weighting
  * 1 --- [1] inverse distance to a power
  * 2 --- [2] exponential
  * 3 --- [3] gaussian weighting

  Default: *0*

``Inverse Distance Weighting Power`` [number]
  <put parameter description here>

  Default: *1*

``Inverse Distance Offset`` [boolean]
  <put parameter description here>

  Default: *True*

``Gaussian and Exponential Weighting Bandwidth`` [number]
  <put parameter description here>

  Default: *1.0*

Outputs
.......

``Terrain Ruggedness Index (TRI)`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:terrainruggednessindextri', dem, radius, distance_weighting_weighting, distance_weighting_idw_power, distance_weighting_idw_offset, distance_weighting_bandwidth, tri)

See also
........

Topographic position index (tpi)
--------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Standardize`` [boolean]
  <put parameter description here>

  Default: *True*

``Min Radius`` [number]
  <put parameter description here>

  Default: *0.0*

``Max Radius`` [number]
  <put parameter description here>

  Default: *100.0*

``Distance Weighting`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] no distance weighting
  * 1 --- [1] inverse distance to a power
  * 2 --- [2] exponential
  * 3 --- [3] gaussian weighting

  Default: *0*

``Inverse Distance Weighting Power`` [number]
  <put parameter description here>

  Default: *1*

``Inverse Distance Offset`` [boolean]
  <put parameter description here>

  Default: *True*

``Gaussian and Exponential Weighting Bandwidth`` [number]
  <put parameter description here>

  Default: *75.0*

Outputs
.......

``Topographic Position Index`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:topographicpositionindextpi', dem, standard, radius_min, radius_max, distance_weighting_weighting, distance_weighting_idw_power, distance_weighting_idw_offset, distance_weighting_bandwidth, tpi)

See also
........

Tpi based landform classification
---------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Min Radius A`` [number]
  <put parameter description here>

  Default: *0*

``Max Radius A`` [number]
  <put parameter description here>

  Default: *100*

``Min Radius B`` [number]
  <put parameter description here>

  Default: *0*

``Max Radius B`` [number]
  <put parameter description here>

  Default: *1000*

``Distance Weighting`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] no distance weighting
  * 1 --- [1] inverse distance to a power
  * 2 --- [2] exponential
  * 3 --- [3] gaussian weighting

  Default: *0*

``Inverse Distance Weighting Power`` [number]
  <put parameter description here>

  Default: *1*

``Inverse Distance Offset`` [boolean]
  <put parameter description here>

  Default: *True*

``Gaussian and Exponential Weighting Bandwidth`` [number]
  <put parameter description here>

  Default: *75.0*

Outputs
.......

``Landforms`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:tpibasedlandformclassification', dem, radius_a_min, radius_a_max, radius_b_min, radius_b_max, distance_weighting_weighting, distance_weighting_idw_power, distance_weighting_idw_offset, distance_weighting_bandwidth, landforms)

See also
........

Vector ruggedness measure (vrm)
-------------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Radius (Cells)`` [number]
  <put parameter description here>

  Default: *1*

``Distance Weighting`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] no distance weighting
  * 1 --- [1] inverse distance to a power
  * 2 --- [2] exponential
  * 3 --- [3] gaussian weighting

  Default: *0*

``Inverse Distance Weighting Power`` [number]
  <put parameter description here>

  Default: *1*

``Inverse Distance Offset`` [boolean]
  <put parameter description here>

  Default: *True*

``Gaussian and Exponential Weighting Bandwidth`` [number]
  <put parameter description here>

  Default: *1*

Outputs
.......

``Vector Terrain Ruggedness (VRM)`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:vectorruggednessmeasurevrm', dem, radius, distance_weighting_weighting, distance_weighting_idw_power, distance_weighting_idw_offset, distance_weighting_bandwidth, vrm)

See also
........

Wind effect
-----------

Description
...........

<put algorithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Wind Direction`` [raster]
  Optional.

  <put parameter description here>

``Wind Speed`` [raster]
  Optional.

  <put parameter description here>

``Constant Wind Direction [Degree]`` [number]
  <put parameter description here>

  Default: *135*

``Old Version`` [boolean]
  <put parameter description here>

  Default: *True*

``Search Distance [km]`` [number]
  <put parameter description here>

  Default: *300.0*

``Acceleration`` [number]
  <put parameter description here>

  Default: *1.5*

``Use Pyramids`` [boolean]
  <put parameter description here>

  Default: *True*

``Wind Direction Units`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] radians
  * 1 --- [1] degree

  Default: *0*

``Wind Speed Scale Factor`` [number]
  <put parameter description here>

  Default: *1.0*

Outputs
.......

``Wind Effect`` [raster]
  <put output description here>

``Windward Effect`` [raster]
  <put output description here>

``Leeward Effect`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:windeffect', dem, dir, len, dir_const, oldver, maxdist, accel, pyramids, dir_units, len_scale, effect, luv, lee)

See also
........

