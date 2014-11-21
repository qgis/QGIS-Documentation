Line dissolve
=============

Description
-----------

<put algortithm description here>

Parameters
----------

``Lines`` [vector: any]
  <put parameter description here>

``1. Attribute`` [tablefield: any]
  <put parameter description here>

``2. Attribute`` [tablefield: any]
  <put parameter description here>

``3. Attribute`` [tablefield: any]
  <put parameter description here>

``Dissolve...`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] lines with same attribute value(s)
  * 1 --- [1] all lines

  Default: *0*

Outputs
-------

``Dissolved Lines`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:linedissolve', lines, field_1, field_2, field_3, all, dissolved)

See also
--------

