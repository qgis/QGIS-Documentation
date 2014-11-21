Accumulated cost (isotropic)
============================

Description
-----------

<put algortithm description here>

Parameters
----------

``Cost Grid`` [raster]
  <put parameter description here>

``Destination Points`` [raster]
  <put parameter description here>

``Threshold for different route`` [number]
  <put parameter description here>

  Default: *0.0*

Outputs
-------

``Accumulated Cost`` [raster]
  <put output description here>

``Closest Point`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:accumulatedcostisotropic', cost, points, threshold, acccost, closestpt)

See also
--------

