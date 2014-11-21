Extract by attribute
====================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input Layer`` [vector: any]
  <put parameter description here>

``Selection attribute`` [tablefield: any]
  <put parameter description here>

``Operator`` [selection]
  <put parameter description here>

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
  <put parameter description here>

  Default: *(not set)*

Outputs
-------

``Output`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('qgis:extractbyattribute', input, field, operator, value, output)

See also
--------

