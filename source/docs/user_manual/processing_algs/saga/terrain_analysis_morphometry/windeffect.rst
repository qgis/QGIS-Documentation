Wind effect
===========

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

  Default: *300.0*

``Acceleration`` [number]
  <put parameter description here>

  Default: *1.5*

``Use Pyramids`` [boolean]
  <put parameter description here>

  Default: *True*

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

``Wind Effect`` [raster]
  <put output description here>

``Windward Effect`` [raster]
  <put output description here>

``Leeward Effect`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:windeffect', dem, dir, len, dir_const, oldver, maxdist, accel, pyramids, dir_units, len_scale, effect, luv, lee)

See also
--------

