Gradient vector from polar to cartesian coordinates
===================================================

Description
-----------

<put algortithm description here>

Parameters
----------

``Direction`` [raster]
  <put parameter description here>

``Length`` [raster]
  <put parameter description here>

``Polar Angle Units`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] radians
  * 1 --- [1] degree

  Default: *0*

``Polar Coordinate System`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] mathematical
  * 1 --- [1] geographical
  * 2 --- [2] user defined

  Default: *0*

``User defined Zero Direction`` [number]
  <put parameter description here>

  Default: *0.0*

``User defined Orientation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] clockwise
  * 1 --- [1] counterclockwise

  Default: *0*

Outputs
-------

``X Component`` [raster]
  <put output description here>

``Y Component`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:gradientvectorfrompolartocartesiancoordinates', dir, len, units, system, system_zero, system_orient, dx, dy)

See also
--------

