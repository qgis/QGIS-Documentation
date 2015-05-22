|updatedisclaimer|

Geometry
========

Image Envelope
--------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Sampling Rate`` [number]
  <put parameter description here>

  Default: *0*

``Projection`` [string]
  Optional.

  <put parameter description here>

  Default: *None*

Outputs
.......

``Output Vector Data`` [vector]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:imageenvelope', -in, -sr, -proj, -out)

See also
........

OrthoRectification (epsg)
-------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Output Cartographic Map Projection`` [selection]
  <put parameter description here>

  Options:

  * 0 --- epsg

  Default: *0*

``EPSG Code`` [number]
  <put parameter description here>

  Default: *4326*

``Parameters estimation modes`` [selection]
  <put parameter description here>

  Options:

  * 0 --- autosize
  * 1 --- autospacing

  Default: *0*

``Default pixel value`` [number]
  <put parameter description here>

  Default: *0*

``Default elevation`` [number]
  <put parameter description here>

  Default: *0*

``Interpolation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- bco
  * 1 --- nn
  * 2 --- linear

  Default: *0*

``Radius for bicubic interpolation`` [number]
  <put parameter description here>

  Default: *2*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Resampling grid spacing`` [number]
  <put parameter description here>

  Default: *4*

Outputs
.......

``Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:orthorectificationepsg', -io.in, -map, -map.epsg.code, -outputs.mode, -outputs.default, -elev.default, -interpolator, -interpolator.bco.radius, -opt.ram, -opt.gridspacing, -io.out)

See also
........

OrthoRectification (fit-to-ortho)
---------------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Parameters estimation modes`` [selection]
  <put parameter description here>

  Options:

  * 0 --- orthofit

  Default: *0*

``Model ortho-image`` [raster]
  Optional.

  <put parameter description here>

``Default pixel value`` [number]
  <put parameter description here>

  Default: *0*

``Default elevation`` [number]
  <put parameter description here>

  Default: *0*

``Interpolation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- bco
  * 1 --- nn
  * 2 --- linear

  Default: *0*

``Radius for bicubic interpolation`` [number]
  <put parameter description here>

  Default: *2*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Resampling grid spacing`` [number]
  <put parameter description here>

  Default: *4*

Outputs
.......

``Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:orthorectificationfittoortho', -io.in, -outputs.mode, -outputs.ortho, -outputs.default, -elev.default, -interpolator, -interpolator.bco.radius, -opt.ram, -opt.gridspacing, -io.out)

See also
........

OrthoRectification (lambert-WGS84)
----------------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Output Cartographic Map Projection`` [selection]
  <put parameter description here>

  Options:

  * 0 --- lambert2
  * 1 --- lambert93
  * 2 --- wgs

  Default: *0*

``Parameters estimation modes`` [selection]
  <put parameter description here>

  Options:

  * 0 --- autosize
  * 1 --- autospacing

  Default: *0*

``Default pixel value`` [number]
  <put parameter description here>

  Default: *0*

``Default elevation`` [number]
  <put parameter description here>

  Default: *0*

``Interpolation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- bco
  * 1 --- nn
  * 2 --- linear

  Default: *0*

``Radius for bicubic interpolation`` [number]
  <put parameter description here>

  Default: *2*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Resampling grid spacing`` [number]
  <put parameter description here>

  Default: *4*

Outputs
.......

``Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:orthorectificationlambertwgs84', -io.in, -map, -outputs.mode, -outputs.default, -elev.default, -interpolator, -interpolator.bco.radius, -opt.ram, -opt.gridspacing, -io.out)

See also
........

OrthoRectification (utm)
------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input Image`` [raster]
  <put parameter description here>

``Output Cartographic Map Projection`` [selection]
  <put parameter description here>

  Options:

  * 0 --- utm

  Default: *0*

``Zone number`` [number]
  <put parameter description here>

  Default: *31*

``Northern Hemisphere`` [boolean]
  <put parameter description here>

  Default: *True*

``Parameters estimation modes`` [selection]
  <put parameter description here>

  Options:

  * 0 --- autosize
  * 1 --- autospacing

  Default: *0*

``Default pixel value`` [number]
  <put parameter description here>

  Default: *0*

``Default elevation`` [number]
  <put parameter description here>

  Default: *0*

``Interpolation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- bco
  * 1 --- nn
  * 2 --- linear

  Default: *0*

``Radius for bicubic interpolation`` [number]
  <put parameter description here>

  Default: *2*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Resampling grid spacing`` [number]
  <put parameter description here>

  Default: *4*

Outputs
.......

``Output Image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:orthorectificationutm', -io.in, -map, -map.utm.zone, -map.utm.northhem, -outputs.mode, -outputs.default, -elev.default, -interpolator, -interpolator.bco.radius, -opt.ram, -opt.gridspacing, -io.out)

See also
........

Pansharpening (bayes)
---------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input PAN Image`` [raster]
  <put parameter description here>

``Input XS Image`` [raster]
  <put parameter description here>

``Algorithm`` [selection]
  <put parameter description here>

  Options:

  * 0 --- bayes

  Default: *0*

``Weight`` [number]
  <put parameter description here>

  Default: *0.9999*

``S coefficient`` [number]
  <put parameter description here>

  Default: *1*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

Outputs
.......

``Output image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:pansharpeningbayes', -inp, -inxs, -method, -method.bayes.lambda, -method.bayes.s, -ram, -out)

See also
........

Pansharpening (lmvm)
--------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input PAN Image`` [raster]
  <put parameter description here>

``Input XS Image`` [raster]
  <put parameter description here>

``Algorithm`` [selection]
  <put parameter description here>

  Options:

  * 0 --- lmvm

  Default: *0*

``X radius`` [number]
  <put parameter description here>

  Default: *3*

``Y radius`` [number]
  <put parameter description here>

  Default: *3*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

Outputs
.......

``Output image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:pansharpeninglmvm', -inp, -inxs, -method, -method.lmvm.radiusx, -method.lmvm.radiusy, -ram, -out)

See also
........

Pansharpening (rcs)
-------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input PAN Image`` [raster]
  <put parameter description here>

``Input XS Image`` [raster]
  <put parameter description here>

``Algorithm`` [selection]
  <put parameter description here>

  Options:

  * 0 --- rcs

  Default: *0*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

Outputs
.......

``Output image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:pansharpeningrcs', -inp, -inxs, -method, -ram, -out)

See also
........

RigidTransformResample (id)
---------------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input image`` [raster]
  <put parameter description here>

``Type of transformation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- id

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
.......

``Output image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:rigidtransformresampleid', -in, -transform.type, -transform.type.id.scalex, -transform.type.id.scaley, -interpolator, -interpolator.bco.radius, -ram, -out)

See also
........

RigidTransformResample (rotation)
---------------------------------

Description
...........

<put algortithm description here>

Parameters
..........

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
.......

``Output image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:rigidtransformresamplerotation', -in, -transform.type, -transform.type.rotation.angle, -transform.type.rotation.scalex, -transform.type.rotation.scaley, -interpolator, -interpolator.bco.radius, -ram, -out)

See also
........

RigidTransformResample (translation)
------------------------------------

Description
...........

<put algortithm description here>

Parameters
..........

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
.......

``Output image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:rigidtransformresampletranslation', -in, -transform.type, -transform.type.translation.tx, -transform.type.translation.ty, -transform.type.translation.scalex, -transform.type.translation.scaley, -interpolator, -interpolator.bco.radius, -ram, -out)

See also
........

Superimpose sensor
------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Reference input`` [raster]
  <put parameter description here>

``The image to reproject`` [raster]
  <put parameter description here>

``Default elevation`` [number]
  <put parameter description here>

  Default: *0*

``Spacing of the deformation field`` [number]
  <put parameter description here>

  Default: *4*

``Interpolation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- bco
  * 1 --- nn
  * 2 --- linear

  Default: *0*

``Radius for bicubic interpolation`` [number]
  <put parameter description here>

  Default: *2*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

Outputs
.......

``Output image`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:superimposesensor', -inr, -inm, -elev.default, -lms, -interpolator, -interpolator.bco.radius, -ram, -out)

See also
........

