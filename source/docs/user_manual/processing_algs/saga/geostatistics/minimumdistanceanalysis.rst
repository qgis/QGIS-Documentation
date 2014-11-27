Minimum distance analysis
=========================

Description
-----------

Performs a complete distance analysis of a point layer:

* minimum distance of points
* maximum distance of points
* average distance of all the points
* standard deviation of the distance
* duplicated points

Parameters
----------

``Points`` [vector: point]
  Layer to analyze.

Outputs
-------

``Minimum Distance Analysis`` [table]
  The resulting table.

Console usage
-------------

::

  processing.runalg('saga:minimumdistanceanalysis', points, table)

See also
--------

