Convergence index
=================

Description
-----------

<put algortithm description here>

Parameters
----------

``Elevation`` [raster]
  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Aspect
  * 1 --- [1] Gradient

  Default: *0*

``Gradient Calculation`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] 2 x 2
  * 1 --- [1] 3 x 3

  Default: *0*

Outputs
-------

``Convergence Index`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:convergenceindex', elevation, method, neighbours, result)

See also
--------

