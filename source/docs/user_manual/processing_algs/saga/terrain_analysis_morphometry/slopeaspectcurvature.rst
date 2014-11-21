Slope, aspect, curvature
========================

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

  * 0 --- [0] Maximum Slope (Travis et al. 1975)
  * 1 --- [1] Maximum Triangle Slope (Tarboton 1997)
  * 2 --- [2] Least Squares Fitted Plane (Horn 1981, Costa-Cabral & Burgess 1996)
  * 3 --- [3] Fit 2.Degree Polynom (Bauer, Rohdenburg, Bork 1985)
  * 4 --- [4] Fit 2.Degree Polynom (Heerdegen & Beran 1982)
  * 5 --- [5] Fit 2.Degree Polynom (Zevenbergen & Thorne 1987)
  * 6 --- [6] Fit 3.Degree Polynom (Haralick 1983)

  Default: *5*

Outputs
-------

``Slope`` [raster]
  <put output description here>

``Aspect`` [raster]
  <put output description here>

``Curvature`` [raster]
  <put output description here>

``Plan Curvature`` [raster]
  <put output description here>

``Profile Curvature`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:slopeaspectcurvature', elevation, method, slope, aspect, curv, hcurv, vcurv)

See also
--------

