Gradient vector from cartesian to polar coordinates
===================================================

Description
-----------

<put algortithm description here>

Parameters
----------

``X Component`` [raster]
  <put parameter description here>

``Y Component`` [raster]
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

``Direction`` [raster]
  <put output description here>

``Length`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:gradientvectorfromcartesiantopolarcoordinates', dx, dy, units, system, system_zero, system_orient, dir, len)

See also
--------

