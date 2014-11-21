Near black
==========

Description
-----------

<put algortithm description here>

Parameters
----------

``Input layer`` [raster]
  <put parameter description here>

``How far from black (white)`` [number]
  <put parameter description here>

  Default: *15*

``Search for nearly white pixels instead of nearly black`` [boolean]
  <put parameter description here>

  Default: *False*

Outputs
-------

``Output layer`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('gdalogr:nearblack', input, near, white, output)

See also
--------

