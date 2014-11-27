Select by attribute
===================

Description
-----------

Selects and saves as new layer all features from input layer that satisfy
condition.

*NOTE*: algorithm is case-sensitive ("qgis" is different from "Qgis" and "QGIS")

Parameters
----------

``Input Layer`` [vector: any]
  Layer to process.

``Selection attribute`` [tablefield: any]
  Field on which perform the selection.

``Operator`` [selection]
  Comparison operator.

  Options:

  * 0 --- =
  * 1 --- !=
  * 2 --- >
  * 3 --- >=
  * 4 --- <
  * 5 --- <=
  * 6 --- begins with
  * 7 --- contains

  Default: *0*

``Value`` [string]
  Value to compare.

  Default: *(not set)*

Outputs
-------

``Output`` [vector]
  The resulting layer.

Console usage
-------------

::

  processing.runalg('qgis:selectbyattribute', input, field, operator, value, output)

See also
--------

