|updatedisclaimer|

Terrain hydrology
=================

Burn stream network into dem
----------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``DEM`` [raster]
  <put parameter description here>

``Streams`` [raster]
  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] simply decrease cell's value by epsilon
  * 1 --- [1] lower cell's value to neighbours minimum value minus epsilon

  Default: *0*

``Epsilon`` [number]
  <put parameter description here>

  Default: *1.0*

Outputs
.......

``Processed DEM`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:burnstreamnetworkintodem', dem, stream, method, epsilon, burn)

See also
........

Catchment area (flow tracing)
-----------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Sink Routes`` [raster]
  Optional.

  <put parameter description here>

``Weight`` [raster]
  Optional.

  <put parameter description here>

``Material`` [raster]
  Optional.

  <put parameter description here>

``Target`` [raster]
  Optional.

  <put parameter description here>

``Step`` [number]
  <put parameter description here>

  Default: *1*

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Rho 8
  * 1 --- [1] Kinematic Routing Algorithm
  * 2 --- [2] DEMON

  Default: *0*

``DEMON - Min. DQV`` [number]
  <put parameter description here>

  Default: *0.0*

``Flow Correction`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
.......

``Catchment Area`` [raster]
  <put output description here>

``Catchment Height`` [raster]
  <put output description here>

``Catchment Slope`` [raster]
  <put output description here>

``Total accumulated Material`` [raster]
  <put output description here>

``Accumulated Material from _left_ side`` [raster]
  <put output description here>

``Accumulated Material from _right_ side`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:catchmentareaflowtracing', elevation, sinkroute, weight, material, target, step, method, mindqv, correct, carea, cheight, cslope, accu_tot, accu_left, accu_right)

See also
........

Catchment area (recursive)
--------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Sink Routes`` [raster]
  Optional.

  <put parameter description here>

``Weight`` [raster]
  Optional.

  <put parameter description here>

``Material`` [raster]
  Optional.

  <put parameter description here>

``Target`` [raster]
  Optional.

  <put parameter description here>

``Step`` [number]
  <put parameter description here>

  Default: *1*

``Target Areas`` [raster]
  Optional.

  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Deterministic 8
  * 1 --- [1] Rho 8
  * 2 --- [2] Deterministic Infinity
  * 3 --- [3] Multiple Flow Direction

  Default: *0*

``Convergence`` [number]
  <put parameter description here>

  Default: *1.1*

Outputs
.......

``Catchment Area`` [raster]
  <put output description here>

``Catchment Height`` [raster]
  <put output description here>

``Catchment Slope`` [raster]
  <put output description here>

``Total accumulated Material`` [raster]
  <put output description here>

``Accumulated Material from _left_ side`` [raster]
  <put output description here>

``Accumulated Material from _right_ side`` [raster]
  <put output description here>

``Flow Path Length`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:catchmentarearecursive', elevation, sinkroute, weight, material, target, step, targets, method, convergence, carea, cheight, cslope, accu_tot, accu_left, accu_right, flowlen)

See also
........

Catchment Area
--------------

Description
...........

<put algortithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Deterministic 8
  * 1 --- [1] Rho 8
  * 2 --- [2] Braunschweiger Reliefmodell
  * 3 --- [3] Deterministic Infinity
  * 4 --- [4] Multiple Flow Direction
  * 5 --- [5] Multiple Triangular Flow Direction

  Default: *0*

Outputs
.......

``Catchment Area`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:catchmentarea', elevation, method, carea)

See also
........

Cell balance
------------

Description
...........

<put algortithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Parameter`` [raster]
  Optional.

  <put parameter description here>

``Default Weight`` [number]
  <put parameter description here>

  Default: *1.0*

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Deterministic 8
  * 1 --- [1] Multiple Flow Direction

  Default: *0*

Outputs
.......

``Cell Balance`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:cellbalance', dem, weights, weight, method, balance)

See also
........

Edge contamination
------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

Outputs
.......

``Edge Contamination`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:edgecontamination', dem, contamination)

See also
........

Fill Sinks
----------

Description
...........

<put algortithm description here>

Parameters
..........

``DEM`` [raster]
  <put parameter description here>

``Minimum Slope [Degree]`` [number]
  <put parameter description here>

  Default: *0.01*

Outputs
.......

``Filled DEM`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:fillsinks', dem, minslope, result)

See also
........

Fill sinks (wang & liu)
-----------------------

Description
...........

<put algortithm description here>

Parameters
..........

``DEM`` [raster]
  <put parameter description here>

``Minimum Slope [Degree]`` [number]
  <put parameter description here>

  Default: *0.01*

Outputs
.......

``Filled DEM`` [raster]
  <put output description here>

``Flow Directions`` [raster]
  <put output description here>

``Watershed Basins`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:fillsinkswangliu', elev, minslope, filled, fdir, wshed)

See also
........

Fill sinks xxl (wang & liu)
---------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``DEM`` [raster]
  <put parameter description here>

``Minimum Slope [Degree]`` [number]
  <put parameter description here>

  Default: *0.01*

Outputs
.......

``Filled DEM`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:fillsinksxxlwangliu', elev, minslope, filled)

See also
........

Flat detection
--------------

Description
...........

<put algortithm description here>

Parameters
..........

``DEM`` [raster]
  <put parameter description here>

``Flat Area Values`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] elevation
  * 1 --- [1] enumeration

  Default: *0*

Outputs
.......

``No Flats`` [raster]
  <put output description here>

``Flat Areas`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:flatdetection', dem, flat_output, noflats, flats)

See also
........

Flow path length
----------------

Description
...........

<put algortithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Seeds`` [raster]
  Optional.

  <put parameter description here>

``Seeds Only`` [boolean]
  <put parameter description here>

  Default: *True*

``Flow Routing Algorithm`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Deterministic 8 (D8)
  * 1 --- [1] Multiple Flow Direction (FD8)

  Default: *0*

``Convergence (FD8)`` [number]
  <put parameter description here>

  Default: *1.1*

Outputs
.......

``Flow Path Length`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:flowpathlength', elevation, seed, seeds_only, method, convergence, length)

See also
........

Flow width and specific catchment area
--------------------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Total Catchment Area (TCA)`` [raster]
  Optional.

  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Deterministic 8
  * 1 --- [1] Multiple Flow Direction (Quinn et al. 1991)
  * 2 --- [2] Aspect

  Default: *0*

Outputs
.......

``Flow Width`` [raster]
  <put output description here>

``Specific Catchment Area (SCA)`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:flowwidthandspecificcatchmentarea', dem, tca, method, width, sca)

See also
........

Lake flood
----------

Description
...........

<put algortithm description here>

Parameters
..........

``DEM`` [raster]
  <put parameter description here>

``Seeds`` [raster]
  <put parameter description here>

``Absolute Water Levels`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
.......

``Lake`` [raster]
  <put output description here>

``Surface`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:lakeflood', elev, seeds, level, outdepth, outlevel)

See also
........

Ls factor
---------

Description
...........

<put algortithm description here>

Parameters
..........

``Slope`` [raster]
  <put parameter description here>

``Catchment Area`` [raster]
  <put parameter description here>

``Area to Length Conversion`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] no conversion (areas already given as specific catchment area)
  * 1 --- [1] 1 / cell size (specific catchment area)
  * 2 --- [2] square root (catchment length)

  Default: *0*

``Method (LS)`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Moore et al. 1991
  * 1 --- [1] Desmet & Govers 1996
  * 2 --- [2] Boehner & Selige 2006

  Default: *0*

``Rill/Interrill Erosivity`` [number]
  <put parameter description here>

  Default: *0.0*

``Stability`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] stable
  * 1 --- [1] instable (thawing)

  Default: *0*

Outputs
.......

``LS Factor`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:lsfactor', slope, area, conv, method, erosivity, stability, ls)

See also
........

Saga wetness index
------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``t`` [number]
  <put parameter description here>

  Default: *10*

Outputs
.......

``Catchment area`` [raster]
  <put output description here>

``Catchment slope`` [raster]
  <put output description here>

``Modified catchment area`` [raster]
  <put output description here>

``Wetness index`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:sagawetnessindex', dem, t, c, gn, cs, sb)

See also
........

Sink drainage route detection
-----------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Threshold`` [boolean]
  <put parameter description here>

  Default: *True*

``Threshold Height`` [number]
  <put parameter description here>

  Default: *100.0*

Outputs
.......

``Sink Route`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:sinkdrainageroutedetection', elevation, threshold, thrsheight, sinkroute)

See also
........

Sink removal
------------

Description
...........

<put algortithm description here>

Parameters
..........

``DEM`` [raster]
  <put parameter description here>

``Sink Route`` [raster]
  Optional.

  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Deepen Drainage Routes
  * 1 --- [1] Fill Sinks

  Default: *0*

``Threshold`` [boolean]
  <put parameter description here>

  Default: *True*

``Threshold Height`` [number]
  <put parameter description here>

  Default: *100.0*

Outputs
.......

``Preprocessed DEM`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:sinkremoval', dem, sinkroute, method, threshold, thrsheight, dem_preproc)

See also
........

Slope length
------------

Description
...........

<put algortithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

Outputs
.......

``Slope Length`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:slopelength', dem, length)

See also
........

Stream power index
------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Slope`` [raster]
  <put parameter description here>

``Catchment Area`` [raster]
  <put parameter description here>

``Area Conversion`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] no conversion (areas already given as specific catchment area)
  * 1 --- [1] 1 / cell size (pseudo specific catchment area)

  Default: *0*

Outputs
.......

``Stream Power Index`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:streampowerindex', slope, area, conv, spi)

See also
........

Topographic wetness index (twi)
-------------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Slope`` [raster]
  <put parameter description here>

``Catchment Area`` [raster]
  <put parameter description here>

``Transmissivity`` [raster]
  Optional.

  <put parameter description here>

``Area Conversion`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] no conversion (areas already given as specific catchment area)
  * 1 --- [1] 1 / cell size (pseudo specific catchment area)

  Default: *0*

``Method (TWI)`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Standard
  * 1 --- [1] TOPMODEL

  Default: *0*

Outputs
.......

``Topographic Wetness Index`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:topographicwetnessindextwi', slope, area, trans, conv, method, twi)

See also
........

Upslope Area
------------

Description
...........

<put algortithm description here>

Parameters
..........

``Target Area`` [raster]
  Optional.

  <put parameter description here>

``Target X coordinate`` [number]
  <put parameter description here>

  Default: *0.0*

``Target Y coordinate`` [number]
  <put parameter description here>

  Default: *0.0*

``Elevation`` [raster]
  <put parameter description here>

``Sink Routes`` [raster]
  Optional.

  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Deterministic 8
  * 1 --- [1] Deterministic Infinity
  * 2 --- [2] Multiple Flow Direction

  Default: *0*

``Convergence`` [number]
  <put parameter description here>

  Default: *1.1*

Outputs
.......

``Upslope Area`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:upslopearea', target, target_pt_x, target_pt_y, elevation, sinkroute, method, converge, area)

See also
........

