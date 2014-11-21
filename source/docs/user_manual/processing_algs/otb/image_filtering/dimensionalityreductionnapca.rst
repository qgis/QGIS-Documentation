DimensionalityReduction (napca)
===============================

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

  * 0 --- napca

  Default: *0*

``Set the x radius of the sliding window.`` [number]
  <put parameter description here>

  Default: *1*

``Set the y radius of the sliding window.`` [number]
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

  processing.runalg('otb:dimensionalityreductionnapca', -in, -method, -method.napca.radiusx, -method.napca.radiusy, -nbcomp, -normalize, -out, -outinv, -outmatrix)

See also
--------

