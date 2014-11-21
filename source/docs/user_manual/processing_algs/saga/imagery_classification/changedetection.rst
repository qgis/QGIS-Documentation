Change detection
================

Description
-----------

<put algortithm description here>

Parameters
----------

``Initial State`` [raster]
  <put parameter description here>

``Look-up Table`` [table]
  Optional.

  <put parameter description here>

``Value`` [tablefield: any]
  <put parameter description here>

``Value (Maximum)`` [tablefield: any]
  <put parameter description here>

``Name`` [tablefield: any]
  <put parameter description here>

``Final State`` [raster]
  <put parameter description here>

``Look-up Table`` [table]
  Optional.

  <put parameter description here>

``Value`` [tablefield: any]
  <put parameter description here>

``Value (Maximum)`` [tablefield: any]
  <put parameter description here>

``Name`` [tablefield: any]
  <put parameter description here>

``Report Unchanged Classes`` [boolean]
  <put parameter description here>

  Default: *True*

``Output as...`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] cells
  * 1 --- [1] percent
  * 2 --- [2] area

  Default: *0*

Outputs
-------

``Changes`` [raster]
  <put output description here>

``Changes`` [table]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:changedetection', initial, ini_lut, ini_lut_min, ini_lut_max, ini_lut_nam, final, fin_lut, fin_lut_min, fin_lut_max, fin_lut_nam, nochange, output, change, changes)

See also
--------

