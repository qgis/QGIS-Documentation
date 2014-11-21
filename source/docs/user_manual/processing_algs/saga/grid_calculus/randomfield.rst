Random field
============

Description
-----------

<put algortithm description here>

Parameters
----------

``Width (Cells)`` [number]
  <put parameter description here>

  Default: *100*

``Height (Cells)`` [number]
  <put parameter description here>

  Default: *100*

``Cellsize`` [number]
  <put parameter description here>

  Default: *100.0*

``West`` [number]
  <put parameter description here>

  Default: *0.0*

``South`` [number]
  <put parameter description here>

  Default: *0.0*

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Uniform
  * 1 --- [1] Gaussian

  Default: *0*

``Range Min`` [number]
  <put parameter description here>

  Default: *0.0*

``Range Max`` [number]
  <put parameter description here>

  Default: *1.0*

``Arithmetic Mean`` [number]
  <put parameter description here>

  Default: *0.0*

``Standard Deviation`` [number]
  <put parameter description here>

  Default: *1.0*

Outputs
-------

``Random Field`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:randomfield', nx, ny, cellsize, xmin, ymin, method, range_min, range_max, mean, stddev, output)

See also
--------

