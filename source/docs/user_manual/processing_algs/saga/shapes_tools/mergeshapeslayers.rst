Merge shapes layers
===================

Description
-----------

Merges two or more input layer into a unique resulting layer. You can merge
together only layer of the same type (polygons with polygons, lines with lines,
points with points).

The attribute table of the resulting layer will include only the attributes of
the first input layer. Two additional columns will be added: one corresponding
to the ID of every merged layer and the other one corresponding to the original
name of the merged layer.

Parameters
----------

``Main Layer`` [vector: any]
  Initial layer.

``Additional Layers`` [multipleinput: any vectors]
  Optional.

  Layer(s) to merge with.

Outputs
-------

``Merged Layer`` [vector]
  The resulting layer.

Console usage
-------------

::

  processing.runalg('saga:mergeshapeslayers', main, layers, out)

See also
--------

