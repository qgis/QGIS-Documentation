Contour
=======

Description
-----------

<put algortithm description here>

Parameters
----------

``Input layer`` [raster]
  <put parameter description here>

``Interval between contour lines`` [number]
  <put parameter description here>

  Default: *10.0*

``Attribute name (if not set, no elevation attribute is attached)`` [string]
  Optional.

  <put parameter description here>

  Default: *ELEV*

``Additional creation parameters`` [string]
  Optional.

  <put parameter description here>

  Default: *(not set)*

Outputs
-------

``Output file for contour lines (vector)`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('gdalogr:contour', input_raster, interval, field_name, extra, output_vector)

See also
--------

