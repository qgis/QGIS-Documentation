Hypsometry
==========

Description
-----------

<put algortithm description here>

Parameters
----------

``Elevation`` [raster]
  <put parameter description here>

``Number of Classes`` [number]
  <put parameter description here>

  Default: *100.0*

``Sort`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] up
  * 1 --- [1] down

  Default: *0*

``Classification Constant`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] height
  * 1 --- [1] area

  Default: *0*

``Use Z-Range`` [boolean]
  <put parameter description here>

  Default: *True*

``Z-Range Min`` [number]
  <put parameter description here>

  Default: *0.0*

``Z-Range Max`` [number]
  <put parameter description here>

  Default: *1000.0*

Outputs
-------

``Hypsometry`` [table]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:hypsometry', elevation, count, sorting, method, bzrange, zrange_min, zrange_max, table)

See also
--------

