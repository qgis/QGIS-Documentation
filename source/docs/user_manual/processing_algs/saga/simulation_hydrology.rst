|updatedisclaimer|

Simulation hydrology
====================

Overland flow - kinematic wave d8
---------------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Elevation`` [raster]
  <put parameter description here>

``Gauges`` [vector: any]
  Optional.

  <put parameter description here>

``Simulation Time [h]`` [number]
  <put parameter description here>

  Default: *24*

``Simulation Time Step [h]`` [number]
  <put parameter description here>

  Default: *0.1*

``Manning's Roughness`` [number]
  <put parameter description here>

  Default: *0.03*

``Max. Iterations`` [number]
  <put parameter description here>

  Default: *100*

``Epsilon`` [number]
  <put parameter description here>

  Default: *0.0001*

``Precipitation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Homogenous
  * 1 --- [1] Above Elevation
  * 2 --- [2] Left Half

  Default: *0*

``Threshold Elevation`` [number]
  <put parameter description here>

  Default: *0.0*

Outputs
.......

``Runoff`` [raster]
  <put output description here>

``Flow at Gauges`` [table]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:overlandflowkinematicwaved8', dem, gauges, time_span, time_step, roughness, newton_maxiter, newton_epsilon, precip, threshold, flow, gauges_flow)

See also
........

Water retention capacity
------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Plot Holes`` [vector: any]
  <put parameter description here>

``DEM`` [raster]
  <put parameter description here>

Outputs
.......

``Final Parameters`` [vector]
  <put output description here>

``Water Retention Capacity`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:waterretentioncapacity', shapes, dem, output, retention)

See also
........

