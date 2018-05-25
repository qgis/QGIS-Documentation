.. only:: html

   |updatedisclaimer|

Calibration
===========

.. only:: html

   .. contents::
      :local:
      :depth: 1

Optical calibration
-------------------

Description
...........

<put algorithm description here>

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


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit http://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
