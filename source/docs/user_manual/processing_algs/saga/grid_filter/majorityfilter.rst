Majority filter
===============

Description
-----------

<put algortithm description here>

Parameters
----------

``Grid`` [raster]
  <put parameter description here>

``Search Mode`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Square
  * 1 --- [1] Circle

  Default: *0*

``Radius`` [number]
  <put parameter description here>

  Default: *1*

``Threshold [Percent]`` [number]
  <put parameter description here>

  Default: *0*

Outputs
-------

``Filtered Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:majorityfilter', input, mode, radius, threshold, result)

See also
--------

