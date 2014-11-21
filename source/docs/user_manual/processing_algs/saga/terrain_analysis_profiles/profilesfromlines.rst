Profiles from lines
===================

Description
-----------

<put algortithm description here>

Parameters
----------

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
-------

``Profiles`` [vector]
  <put output description here>

``Profiles`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:profilesfromlines', dem, values, lines, name, split, profile, profiles)

See also
--------

