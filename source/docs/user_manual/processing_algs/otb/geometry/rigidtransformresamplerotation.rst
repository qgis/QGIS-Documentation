RigidTransformResample (rotation)
=================================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input image`` [raster]
  <put parameter description here>

``Type of transformation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- rotation

  Default: *0*

``Rotation angle`` [number]
  <put parameter description here>

  Default: *0*

``X scaling`` [number]
  <put parameter description here>

  Default: *1*

``Y scaling`` [number]
  <put parameter description here>

  Default: *1*

``Interpolation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- nn
  * 1 --- linear
  * 2 --- bco

  Default: *2*

``Radius for bicubic interpolation`` [number]
  <put parameter description here>

  Default: *2*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

Outputs
-------

``Output image`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:rigidtransformresamplerotation', -in, -transform.type, -transform.type.rotation.angle, -transform.type.rotation.scalex, -transform.type.rotation.scaley, -interpolator, -interpolator.bco.radius, -ram, -out)

See also
--------

