Aspect
======

Description
-----------

<put algortithm description here>

Parameters
----------

``Input layer`` [raster]
  <put parameter description here>

``Band number`` [number]
  <put parameter description here>

  Default: *1*

``Compute edges`` [boolean]
  <put parameter description here>

  Default: *False*

``Use Zevenbergen&Thorne formula (instead of the Horn's one)`` [boolean]
  <put parameter description here>

  Default: *False*

``Return trigonometric angle (instead of azimuth)`` [boolean]
  <put parameter description here>

  Default: *False*

``Return o for flat (instead of -9999)`` [boolean]
  <put parameter description here>

  Default: *False*

Outputs
-------

``Output file`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('gdalogr:aspect', input, band, compute_edges, zevenbergen, trig_angle, zero_flat, output)

See also
--------

