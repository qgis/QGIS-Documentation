Contour lines from grid
=======================

Description
-----------

<put algortithm description here>

Parameters
----------

``Grid`` [raster]
  <put parameter description here>

``Minimum Contour Value`` [number]
  <put parameter description here>

  Default: *0.0*

``Maximum Contour Value`` [number]
  <put parameter description here>

  Default: *10000.0*

``Equidistance`` [number]
  <put parameter description here>

  Default: *100.0*

Outputs
-------

``Contour Lines`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:contourlinesfromgrid', input, zmin, zmax, zstep, contour)

See also
--------

