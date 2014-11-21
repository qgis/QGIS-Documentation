Simple filter
=============

Description
-----------

<put algortithm description here>

Parameters
----------

``Grid`` [raster]
  <put parameter description here>

``Search Mode`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Square
  * 1 --- [1] Circle

  Default: *0*

``Filter`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Smooth
  * 1 --- [1] Sharpen
  * 2 --- [2] Edge

  Default: *0*

``Radius`` [number]
  <put parameter description here>

  Default: *2*

Outputs
-------

``Filtered Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:simplefilter', input, mode, method, radius, result)

See also
--------

