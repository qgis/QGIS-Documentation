Split shapes layer randomly
===========================

Description
-----------

Splits the input layer randomly in two parts.

Parameters
----------

``Shapes`` [vector: any]
  Layer to split.

``Split ratio (%)`` [number]
  Split ratio between the resulting layers.

  Default: *50*

Outputs
-------

``Group A`` [vector]
  First resulting layer.

``Group B`` [vector]
  Second resulting layer.

Console usage
-------------

::

  processing.runalg('saga:splitshapeslayerrandomly', shapes, percent, a, b)

See also
--------

