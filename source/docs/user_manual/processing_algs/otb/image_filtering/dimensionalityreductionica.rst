DimensionalityReduction (ica)
=============================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input Image`` [raster]
  <put parameter description here>

``Algorithm`` [selection]
  <put parameter description here>

  Options:

  * 0 --- ica

  Default: *0*

``number of iterations `` [number]
  <put parameter description here>

  Default: *20*

``Give the increment weight of W in [0, 1]`` [number]
  <put parameter description here>

  Default: *1*

``Number of Components.`` [number]
  <put parameter description here>

  Default: *0*

``Normalize.`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
-------

``Output Image`` [raster]
  <put output description here>

`` Inverse Output Image`` [raster]
  <put output description here>

``Transformation matrix output`` [file]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:dimensionalityreductionica', -in, -method, -method.ica.iter, -method.ica.mu, -nbcomp, -normalize, -out, -outinv, -outmatrix)

See also
--------

