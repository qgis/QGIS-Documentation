Metric conversions
==================

Description
-----------

<put algortithm description here>

Parameters
----------

``Grid`` [raster]
  <put parameter description here>

``Conversion`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] radians to degree
  * 1 --- [1] degree to radians
  * 2 --- [2] Celsius to Fahrenheit
  * 3 --- [3] Fahrenheit to Celsius

  Default: *0*

Outputs
-------

``Converted Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:metricconversions', grid, conversion, conv)

See also
--------

