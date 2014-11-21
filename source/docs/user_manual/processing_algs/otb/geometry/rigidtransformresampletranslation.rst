RigidTransformResample (translation)
====================================

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

  * 0 --- translation

  Default: *0*

``The X translation (in physical units)`` [number]
  <put parameter description here>

  Default: *0*

``The Y translation (in physical units)`` [number]
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

  processing.runalg('otb:rigidtransformresampletranslation', -in, -transform.type, -transform.type.translation.tx, -transform.type.translation.ty, -transform.type.translation.scalex, -transform.type.translation.scaley, -interpolator, -interpolator.bco.radius, -ram, -out)

See also
--------

