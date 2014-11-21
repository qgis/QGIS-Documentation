Close gaps with spline
======================

Description
-----------

<put algortithm description here>

Parameters
----------

``Grid`` [raster]
  <put parameter description here>

``Mask`` [raster]
  Optional.

  <put parameter description here>

``Only Process Gaps with Less Cells`` [number]
  <put parameter description here>

  Default: *0*

``Maximum Points`` [number]
  <put parameter description here>

  Default: *1000*

``Number of Points for Local Interpolation`` [number]
  <put parameter description here>

  Default: *10*

``Extended Neighourhood`` [boolean]
  <put parameter description here>

  Default: *True*

``Neighbourhood`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Neumann
  * 1 --- [1] Moore

  Default: *0*

``Radius (Cells)`` [number]
  <put parameter description here>

  Default: *0*

``Relaxation`` [number]
  <put parameter description here>

  Default: *0.0*

Outputs
-------

``Closed Gaps Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:closegapswithspline', grid, mask, maxgapcells, maxpoints, localpoints, extended, neighbours, radius, relaxation, closed)

See also
--------

