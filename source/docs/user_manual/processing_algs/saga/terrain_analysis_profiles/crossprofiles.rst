Cross profiles
==============

Description
-----------

<put algortithm description here>

Parameters
----------

``DEM`` [raster]
  <put parameter description here>

``Lines`` [vector: line]
  <put parameter description here>

``Profile Distance`` [number]
  <put parameter description here>

  Default: *10.0*

``Profile Length`` [number]
  <put parameter description here>

  Default: *10.0*

``Profile Samples`` [number]
  <put parameter description here>

  Default: *10.0*

Outputs
-------

``Cross Profiles`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:crossprofiles', dem, lines, dist_line, dist_profile, num_profile, profiles)

See also
--------

