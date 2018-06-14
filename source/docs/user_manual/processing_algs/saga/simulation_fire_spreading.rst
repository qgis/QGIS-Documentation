.. only:: html

   |updatedisclaimer|

Simulation fire
===============

.. only:: html

   .. contents::
      :local:
      :depth: 1

Fire risk analysis
------------------

Description
...........

<put algorithm description here>

Parameters
..........

``DEM`` [raster]
  <put parameter description here>

``Fuel Model`` [raster]
  <put parameter description here>

``Wind Speed`` [raster]
  <put parameter description here>

``Wind Direction`` [raster]
  <put parameter description here>

``Dead Fuel Moisture 1H`` [raster]
  <put parameter description here>

``Dead Fuel Moisture 10H`` [raster]
  <put parameter description here>

``Dead Fuel Moisture 100H`` [raster]
  <put parameter description here>

``Herbaceous Fuel Moisture`` [raster]
  <put parameter description here>

``Wood Fuel Moisture`` [raster]
  <put parameter description here>

``Value`` [raster]
  Optional.

  <put parameter description here>

``Base Probability`` [raster]
  Optional.

  <put parameter description here>

``Number of Events`` [number]
  <put parameter description here>

  Default: *1000*

``Fire Length`` [number]
  <put parameter description here>

  Default: *100*

Outputs
.......

``Danger`` [raster]
  <put output description here>

``Compound Probability`` [raster]
  <put output description here>

``Priority Index`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:fireriskanalysis', dem, fuel, windspd, winddir, m1h, m10h, m100h, mherb, mwood, value, baseprob, montecarlo, interval, danger, compprob, priority)

See also
........

Simulation
----------

Description
...........

<put algorithm description here>

Parameters
..........

``DEM`` [raster]
  <put parameter description here>

``Fuel Model`` [raster]
  <put parameter description here>

``Wind Speed`` [raster]
  <put parameter description here>

``Wind Direction`` [raster]
  <put parameter description here>

``Dead Fuel Moisture 1H`` [raster]
  <put parameter description here>

``Dead Fuel Moisture 10H`` [raster]
  <put parameter description here>

``Dead Fuel Moisture 100H`` [raster]
  <put parameter description here>

``Herbaceous Fuel Moisture`` [raster]
  <put parameter description here>

``Wood Fuel Moisture`` [raster]
  <put parameter description here>

``Ignition Points`` [raster]
  <put parameter description here>

``Update View`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
.......

``Time`` [raster]
  <put output description here>

``Flame Length`` [raster]
  <put output description here>

``Intensity`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:simulation', dem, fuel, windspd, winddir, m1h, m10h, m100h, mherb, mwood, ignition, updateview, time, flame, intensity)

See also
........


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit http://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
