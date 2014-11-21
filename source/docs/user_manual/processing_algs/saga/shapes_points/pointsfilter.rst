Points filter
=============

Description
-----------

<put algortithm description here>

Parameters
----------

``Points`` [vector: point]
  <put parameter description here>

``Attribute`` [tablefield: any]
  <put parameter description here>

``Radius`` [number]
  <put parameter description here>

  Default: *1*

``Minimum Number of Points`` [number]
  <put parameter description here>

  Default: *0*

``Maximum Number of Points`` [number]
  <put parameter description here>

  Default: *0*

``Quadrants`` [boolean]
  <put parameter description here>

  Default: *True*

``Filter Criterion`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] keep maxima (with tolerance)
  * 1 --- [1] keep minima (with tolerance)
  * 2 --- [2] remove maxima (with tolerance)
  * 3 --- [3] remove minima (with tolerance)
  * 4 --- [4] remove below percentile
  * 5 --- [5] remove above percentile

  Default: *0*

``Tolerance`` [number]
  <put parameter description here>

  Default: *0.0*

``Percentile`` [number]
  <put parameter description here>

  Default: *50*

Outputs
-------

``Filtered Points`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:pointsfilter', points, field, radius, minnum, maxnum, quadrants, method, tolerance, percent, filter)

See also
--------

