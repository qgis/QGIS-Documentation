|updatedisclaimer|

Terrain profiles
================

Cross profiles
--------------

Description
...........

<put algorithm description here>

Parameters
..........

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
.......

``Cross Profiles`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:crossprofiles', dem, lines, dist_line, dist_profile, num_profile, profiles)

See also
........

Profile from points table
-------------------------

Description
...........

<put algorithm description here>

Parameters
..........

``Grid`` [raster]
  <put parameter description here>

``Input`` [table]
  <put parameter description here>

``X`` [tablefield: any]
  <put parameter description here>

``Y`` [tablefield: any]
  <put parameter description here>

Outputs
.......

``Result`` [table]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:profilefrompointstable', grid, table, x, y, result)

See also
........

Profiles from lines
-------------------

Description
...........

<put algorithm description here>

Parameters
..........

``DEM`` [raster]
  <put parameter description here>

``Values`` [multipleinput: rasters]
  Optional.

  <put parameter description here>

``Lines`` [vector: line]
  <put parameter description here>

``Name`` [tablefield: any]
  <put parameter description here>

``Each Line as new Profile`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
.......

``Profiles`` [vector]
  <put output description here>

``Profiles`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('saga:profilesfromlines', dem, values, lines, name, split, profile, profiles)

See also
........

