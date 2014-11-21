Unsupervised KMeans image classification
========================================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input Image`` [raster]
  <put parameter description here>

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Validity Mask`` [raster]
  Optional.

  <put parameter description here>

``Training set size`` [number]
  <put parameter description here>

  Default: *100*

``Number of classes`` [number]
  <put parameter description here>

  Default: *5*

``Maximum number of iterations`` [number]
  <put parameter description here>

  Default: *1000*

``Convergence threshold`` [number]
  <put parameter description here>

  Default: *0.0001*

Outputs
-------

``Output Image`` [raster]
  <put output description here>

``Centroid filename`` [file]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:unsupervisedkmeansimageclassification', -in, -ram, -vm, -ts, -nc, -maxit, -ct, -out, -outmeans)

See also
--------

