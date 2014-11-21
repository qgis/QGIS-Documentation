Hillshade
=========

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

``Z factor (vertical exaggeration)`` [number]
  <put parameter description here>

  Default: *1.0*

``Scale (ratio of vert. units to horiz.)`` [number]
  <put parameter description here>

  Default: *1.0*

``Azimuth of the light`` [number]
  <put parameter description here>

  Default: *315.0*

``Altitude of the light`` [number]
  <put parameter description here>

  Default: *45.0*

Outputs
-------

``Output file`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('gdalogr:hillshade', input, band, compute_edges, zevenbergen, z_factor, scale, azimuth, altitude, output)

See also
--------

