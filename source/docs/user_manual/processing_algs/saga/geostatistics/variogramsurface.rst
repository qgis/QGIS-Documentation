Variogram surface
=================

Description
-----------

<put algortithm description here>

Parameters
----------

``Points`` [vector: point]
  <put parameter description here>

``Attribute`` [tablefield: any]
  <put parameter description here>

``Number of Distance Classes`` [number]
  <put parameter description here>

  Default: *10*

``Skip Number`` [number]
  <put parameter description here>

  Default: *1*

Outputs
-------

``Number of Pairs`` [raster]
  <put output description here>

``Variogram Surface`` [raster]
  <put output description here>

``Covariance Surface`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:variogramsurface', points, field, distcount, nskip, count, variance, covariance)

See also
--------

