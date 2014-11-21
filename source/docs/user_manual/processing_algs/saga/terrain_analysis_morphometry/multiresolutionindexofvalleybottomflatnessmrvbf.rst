Multiresolution index of valley bottom flatness (mrvbf)
=======================================================

Description
-----------

<put algortithm description here>

Parameters
----------

``Elevation`` [raster]
  <put parameter description here>

``Initial Threshold for Slope`` [number]
  <put parameter description here>

  Default: *16*

``Threshold for Elevation Percentile (Lowness)`` [number]
  <put parameter description here>

  Default: *0.4*

``Threshold for Elevation Percentile (Upness)`` [number]
  <put parameter description here>

  Default: *0.35*

``Shape Parameter for Slope`` [number]
  <put parameter description here>

  Default: *4.0*

``Shape Parameter for Elevation Percentile`` [number]
  <put parameter description here>

  Default: *3.0*

``Update Views`` [boolean]
  <put parameter description here>

  Default: *True*

``Classify`` [boolean]
  <put parameter description here>

  Default: *True*

``Maximum Resolution (Percentage)`` [number]
  <put parameter description here>

  Default: *100*

Outputs
-------

``MRVBF`` [raster]
  <put output description here>

``MRRTF`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:multiresolutionindexofvalleybottomflatnessmrvbf', dem, t_slope, t_pctl_v, t_pctl_r, p_slope, p_pctl, update, classify, max_res, mrvbf, mrrtf)

See also
--------

