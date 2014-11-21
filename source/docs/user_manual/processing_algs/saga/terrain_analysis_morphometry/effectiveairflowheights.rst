Effective air flow heights
==========================

Description
-----------

<put algortithm description here>

Parameters
----------

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
-------

``Effective Air Flow Heights`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:effectiveairflowheights', dem, dir, len, dir_const, oldver, maxdist, accel, pyramids, leefact, luvfact, dir_units, len_scale, afh)

See also
--------

