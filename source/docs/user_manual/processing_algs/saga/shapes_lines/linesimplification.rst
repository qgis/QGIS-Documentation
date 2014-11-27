Line simplification
===================

Description
-----------

Simplyfies the geometry of a lines layer.

Parameters
----------

``Lines`` [vector: line]
  Layer to process.

``Tolerance`` [number]
  Simplification tolerance.

  Default: *1.0*

Outputs
-------

``Simplified Lines`` [vector]
  The resulting layer.

Console usage
-------------

::

  processing.runalg('saga:linesimplification', lines, tolerance, output)

See also
--------

