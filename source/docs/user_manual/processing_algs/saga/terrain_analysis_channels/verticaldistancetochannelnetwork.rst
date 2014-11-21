Vertical distance to channel network
====================================

Description
-----------

<put algortithm description here>

Parameters
----------

``Elevation`` [raster]
  <put parameter description here>

``Channel Network`` [raster]
  <put parameter description here>

``Tension Threshold [Percentage of Cell Size]`` [number]
  <put parameter description here>

  Default: *1*

``Keep Base Level below Surface`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
-------

``Vertical Distance to Channel Network`` [raster]
  <put output description here>

``Channel Network Base Level`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:verticaldistancetochannelnetwork', elevation, channels, threshold, nounderground, distance, baselevel)

See also
--------

