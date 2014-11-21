Reclassify grid values
======================

Description
-----------

<put algortithm description here>

Parameters
----------

``Grid`` [raster]
  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] single
  * 1 --- [1] range
  * 2 --- [2] simple table

  Default: *0*

``old value (for single value change)`` [number]
  <put parameter description here>

  Default: *0.0*

``new value (for single value change)`` [number]
  <put parameter description here>

  Default: *1.0*

``operator (for single value change)`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] =
  * 1 --- [1] <
  * 2 --- [2] <=
  * 3 --- [3] >=
  * 4 --- [4] >

  Default: *0*

``minimum value (for range)`` [number]
  <put parameter description here>

  Default: *0.0*

``maximum value (for range)`` [number]
  <put parameter description here>

  Default: *1.0*

``new value(for range)`` [number]
  <put parameter description here>

  Default: *2.0*

``operator (for range)`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] <=
  * 1 --- [1] <

  Default: *0*

``Lookup Table`` [fixedtable]
  <put parameter description here>

``operator (for table)`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] min <= value < max
  * 1 --- [1] min <= value <= max
  * 2 --- [2] min < value <= max
  * 3 --- [3] min < value < max

  Default: *0*

``replace no data values`` [boolean]
  <put parameter description here>

  Default: *True*

``new value for no data values`` [number]
  <put parameter description here>

  Default: *0.0*

``replace other values`` [boolean]
  <put parameter description here>

  Default: *True*

``new value for other values`` [number]
  <put parameter description here>

  Default: *0.0*

Outputs
-------

``Reclassified Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:reclassifygridvalues', input, method, old, new, soperator, min, max, rnew, roperator, retab, toperator, nodataopt, nodata, otheropt, others, result)

See also
--------

