Build overviews (pyramids)
==========================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input layer`` [raster]
  <put parameter description here>

``Overview levels`` [string]
  <put parameter description here>

  Default: *2 4 8 16*

``Remove all existing overviews`` [boolean]
  <put parameter description here>

  Default: *False*

``Resampling method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- nearest
  * 1 --- average
  * 2 --- gauss
  * 3 --- cubic
  * 4 --- average_mp
  * 5 --- average_magphase
  * 6 --- mode

  Default: *0*

``Overview format`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Internal (if possible)
  * 1 --- External (GTiff .ovr)
  * 2 --- External (ERDAS Imagine .aux)

  Default: *0*

Outputs
-------

``Output layer`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('gdalogr:overviews', input, levels, clean, resampling_method, format)

See also
--------

