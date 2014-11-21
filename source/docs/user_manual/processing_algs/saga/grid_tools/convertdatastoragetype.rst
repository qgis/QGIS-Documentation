Convert data storage type
=========================

Description
-----------

<put algortithm description here>

Parameters
----------

``Grid`` [raster]
  <put parameter description here>

``Data storage type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] bit
  * 1 --- [1] unsigned 1 byte integer
  * 2 --- [2] signed 1 byte integer
  * 3 --- [3] unsigned 2 byte integer
  * 4 --- [4] signed 2 byte integer
  * 5 --- [5] unsigned 4 byte integer
  * 6 --- [6] signed 4 byte integer
  * 7 --- [7] 4 byte floating point number
  * 8 --- [8] 8 byte floating point number

  Default: *0*

Outputs
-------

``Converted Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:convertdatastoragetype', input, type, output)

See also
--------

