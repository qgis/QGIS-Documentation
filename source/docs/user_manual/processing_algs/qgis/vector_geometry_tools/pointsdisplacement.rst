Points displacement
===================

Description
-----------

Moves overlapped points at small distance, that they all become visible. The result
is very similar to the output of the "Point displacement" renderer but it is permanent.

Parameters
----------

``Input layer`` [vector: point]
  Layer with overlapped points.

``Displacement distance`` [number]
  Desired displacement distance **NOTE**: displacement distance should be in
  same units as layer.

  Default: *0.00015*

``Horizontal distribution for two point case`` [boolean]
  Controls distrobution direction in case of two overlapped points. If *True*
  points wwill be distributed horizontally, otherwise they will be distributed
  vertically.

  Default: *True*

Outputs
-------

``Output layer`` [vector]
  The resulting layer with shifted overlapped points.

Console usage
-------------

::

  processing.runalg('qgis:pointsdisplacement', input_layer, distance, horizontal, output_layer)

See also
--------

