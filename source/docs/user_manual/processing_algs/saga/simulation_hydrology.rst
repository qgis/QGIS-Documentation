.. only:: html

   |updatedisclaimer|

Simulation hydrology
====================

.. only:: html

   .. contents::
      :local:
      :depth: 1

Overland flow - kinematic wave d8
---------------------------------

Description
...........

<put algorithm description here>

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

<put algorithm description here>

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


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs for 'QGIS testing'. Visit http://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`