Principle components analysis
=============================

Description
-----------

<put algortithm description here>

Parameters
----------

``Table`` [table]
  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] correlation matrix
  * 1 --- [1] variance-covariance matrix
  * 2 --- [2] sums-of-squares-and-cross-products matrix

  Default: *0*

``Number of Components`` [number]
  <put parameter description here>

  Default: *3*

Outputs
-------

``Principle Components`` [table]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:principlecomponentsanalysis', table, method, nfirst, pca)

See also
--------

