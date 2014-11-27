Convergence index
=================

Description
-----------

Calculates an index of convergence/divergence regarding to overland flow. By
its meaning it is similar to plan or horizontal curvature, but gives much
smoother results. The calculation uses the aspects of surrounding cells, i.e.
it looks to which degree surrounding cells point to the center cell. The result
is given as percentages, negative values correspond to convergent, positive to
divergent flow conditions. Minus 100 would be like a peak of a cone, plus
100 a pit, and 0 an even slope.

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

* Koethe, R. / Lehmeier, F. (1996): 'SARA, System zur Automatischen
  Relief-Analyse', Benutzerhandbuch, 2. Auflage [Geogr. Inst. Univ. Goettingen,
  unpublished]
