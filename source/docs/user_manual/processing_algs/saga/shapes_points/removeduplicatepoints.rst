Remove duplicate points
=======================

Description
-----------

<put algortithm description here>

Parameters
----------

``Points`` [vector: any]
  <put parameter description here>

``Attribute`` [tablefield: any]
  <put parameter description here>

``Point to Keep`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] first point
  * 1 --- [1] last point
  * 2 --- [2] point with minimum attribute value
  * 3 --- [3] point with maximum attribute value

  Default: *0*

``Numeric Attribute Values`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] take value from the point to be kept
  * 1 --- [1] minimum value of all duplicates
  * 2 --- [2] maximum value of all duplicates
  * 3 --- [3] mean value of all duplicates

  Default: *0*

Outputs
-------

``Result`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:removeduplicatepoints', points, field, method, numeric, result)

See also
--------

