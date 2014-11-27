Convert points to line(s)
=========================

Description
-----------

Converts points to lines.

Parameters
----------

``Points`` [vector: point]
  Points to convert.

``Order by...`` [tablefield: any]
  Lines will be ordered following this field.

``Separate by...`` [tablefield: any]
  Lines will be grouped according to this field.

Outputs
-------

``Lines`` [vector]
  The resulting layer.

Console usage
-------------

::

  processing.runalg('saga:convertpointstolines', points, order, separate, lines)

See also
--------

