Fill gaps in records
====================

Description
-----------

<put algortithm description here>

Parameters
----------

``Table`` [table]
  <put parameter description here>

``Order`` [tablefield: any]
  <put parameter description here>

``Interpolation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Nearest Neighbour
  * 1 --- [1] Linear
  * 2 --- [2] Spline

  Default: *0*

Outputs
-------

``Table without Gaps`` [table]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:fillgapsinrecords', table, order, method, nogaps)

See also
--------

