Threshold buffer
================

Description
-----------

<put algortithm description here>

Parameters
----------

``Features Grid`` [raster]
  <put parameter description here>

``Value Grid`` [raster]
  <put parameter description here>

``Threshold Grid`` [raster]
  Optional.

  <put parameter description here>

``Threshold`` [number]
  <put parameter description here>

  Default: *0.0*

``Threshold Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Absolute
  * 1 --- [1] Relative from cell value

  Default: *0*

Outputs
-------

``Buffer Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:thresholdbuffer', features, value, thresholdgrid, threshold, thresholdtype, buffer)

See also
--------

