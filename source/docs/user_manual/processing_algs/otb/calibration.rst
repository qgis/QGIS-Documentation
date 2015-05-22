|updatedisclaimer|

Calibration
===========

Optical calibration
-------------------

Description
...........

<put algortithm description here>

Parameters
..........

``Input`` [raster]
  <put parameter description here>

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Calibration Level`` [selection]
  <put parameter description here>

  Options:

  * 0 --- toa

  Default: *0*

``Convert to milli reflectance`` [boolean]
  <put parameter description here>

  Default: *True*

``Clamp of reflectivity values between [0, 100]`` [boolean]
  <put parameter description here>

  Default: *True*

``Relative Spectral Response File`` [file]
  Optional.

  <put parameter description here>

Outputs
.......

``Output`` [raster]
  <put output description here>

Console usage
.............

::

  processing.runalg('otb:opticalcalibration', -in, -ram, -level, -milli, -clamp, -rsr, -out)

See also
........

