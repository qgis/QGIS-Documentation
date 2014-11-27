Convert lines to points
=======================

Description
-----------

Converts lines layer into a points.

Parameters
----------

``Lines`` [vector: line]
  Lines layer to convert.

``Insert Additional Points`` [boolean]
  Determines whether to add additional nodes or not.

  Default: *True*

``Insert Distance`` [number]
  Distance between the additional points.

  Default: *1.0*

Outputs
-------

``Points`` [vector]
  The resulting layer.

Console usage
-------------

::

  processing.runalg('saga:convertlinestopoints', lines, add, dist, points)

See also
--------

