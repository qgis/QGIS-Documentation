Aggregate
=========

Description
-----------

<put algortithm description here>

Parameters
----------

``Grid`` [raster]
  <put parameter description here>

``Aggregation Size`` [number]
  <put parameter description here>

  Default: *3*

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Sum
  * 1 --- [1] Min
  * 2 --- [2] Max

  Default: *0*

Outputs
-------

Console usage
-------------

::

  processing.runalg('saga:aggregate', input, size, method)

See also
--------

