Select by expression
====================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input Layer`` [vector: any]
  <put parameter description here>

``Expression`` [string]
  <put parameter description here>

  Default: *(not set)*

``Modify current selection by`` [selection]
  <put parameter description here>

  Options:

  * 0 --- creating new selection
  * 1 --- adding to current selection
  * 2 --- removing from current selection

  Default: *0*

Outputs
-------

``Output`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('qgis:selectbyexpression', layername, expression, method)

See also
--------

