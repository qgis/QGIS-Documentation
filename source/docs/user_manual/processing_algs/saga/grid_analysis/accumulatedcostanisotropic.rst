Accumulated cost (anisotropic)
==============================

Description
-----------

<put algortithm description here>

Parameters
----------

``Cost Grid`` [raster]
  <put parameter description here>

``Direction of max cost`` [raster]
  <put parameter description here>

``Destination Points`` [raster]
  <put parameter description here>

``k factor`` [number]
  <put parameter description here>

  Default: *1*

``Threshold for different route`` [number]
  <put parameter description here>

  Default: *0*

Outputs
-------

``Accumulated Cost`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:accumulatedcostanisotropic', cost, direction, points, k, threshold, acccost)

See also
--------

