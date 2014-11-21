Change grid values
==================

Description
-----------

<put algortithm description here>

Parameters
----------

``Grid`` [raster]
  <put parameter description here>

``Replace Condition`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Grid value equals low value
  * 1 --- [1] Low value < grid value < high value
  * 2 --- [2] Low value <= grid value < high value

  Default: *0*

``Lookup Table`` [fixedtable]
  <put parameter description here>

Outputs
-------

``Changed Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:changegridvalues', grid_in, method, lookup, grid_out)

See also
--------

