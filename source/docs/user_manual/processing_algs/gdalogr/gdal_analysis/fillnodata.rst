Fill nodata
===========

Description
-----------

<put algortithm description here>

Parameters
----------

``Input layer`` [raster]
  <put parameter description here>

``Search distance`` [number]
  <put parameter description here>

  Default: *100*

``Smooth iterations`` [number]
  <put parameter description here>

  Default: *0*

``Band to operate on`` [number]
  <put parameter description here>

  Default: *1*

``Validity mask`` [raster]
  Optional.

  <put parameter description here>

``Do not use default validity mask`` [boolean]
  <put parameter description here>

  Default: *False*

Outputs
-------

``Output layer`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('gdalogr:fillnodata', input, distance, iterations, band, mask, no_default_mask, output)

See also
--------

