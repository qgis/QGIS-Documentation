Metric conversions
==================

Description
-----------

Performs numerical conversions of the grid values.

Parameters
----------

``Grid`` [raster]
  Grid to process.

``Conversion`` [selection]
  Conversion type.

  Options:

  * 0 --- [0] radians to degree
  * 1 --- [1] degree to radians
  * 2 --- [2] Celsius to Fahrenheit
  * 3 --- [3] Fahrenheit to Celsius

  Default: *0*

Outputs
-------

``Converted Grid`` [raster]
  The resulting layer.

Console usage
-------------

::

  processing.runalg('saga:metricconversions', grid, conversion, conv)

See also
--------

