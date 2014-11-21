Slope
=====

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

``Slope expressed as percent (instead of degrees)`` [boolean]
  <put parameter description here>

  Default: *False*

``Scale (ratio of vert. units to horiz.)`` [number]
  <put parameter description here>

  Default: *1.0*

Outputs
-------

``Output file`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('gdalogr:slope', input, band, compute_edges, zevenbergen, as_percent, scale, output)

See also
--------

