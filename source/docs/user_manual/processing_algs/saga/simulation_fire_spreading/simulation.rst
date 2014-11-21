Simulation
==========

Description
-----------

<put algortithm description here>

Parameters
----------

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
-------

``Time`` [raster]
  <put output description here>

``Flame Length`` [raster]
  <put output description here>

``Intensity`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:simulation', dem, fuel, windspd, winddir, m1h, m10h, m100h, mherb, mwood, ignition, updateview, time, flame, intensity)

See also
--------

