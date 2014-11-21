Downslope distance gradient
===========================

Description
-----------

<put algortithm description here>

Parameters
----------

``Elevation`` [raster]
  <put parameter description here>

``Vertical Distance`` [number]
  <put parameter description here>

  Default: *10*

``Output`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] distance
  * 1 --- [1] gradient (tangens)
  * 2 --- [2] gradient (degree)

  Default: *0*

Outputs
-------

``Gradient`` [raster]
  <put output description here>

``Gradient Difference`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:downslopedistancegradient', dem, distance, output, gradient, difference)

See also
--------

