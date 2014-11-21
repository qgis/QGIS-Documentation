Rank filter
===========

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

``Rank [Percent]`` [number]
  <put parameter description here>

  Default: *50*

Outputs
-------

``Filtered Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:rankfilter', input, mode, radius, rank, result)

See also
--------

