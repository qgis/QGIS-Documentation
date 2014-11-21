DimensionalityReduction (pca)
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

  * 0 --- pca

  Default: *0*

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

  processing.runalg('otb:dimensionalityreductionpca', -in, -method, -nbcomp, -normalize, -out, -outinv, -outmatrix)

See also
--------

