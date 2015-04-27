Contour
=======

Description
-----------

Extracts contour lines from any GDAL-supported elevation raster.

Parameters
----------

``Input layer`` [raster]
  Input elevation raster.

``Interval between contour lines`` [number]
  Defines the interval between the contour lines in the given units of the
  elevation raster. 

  Default: *10.0*

``Attribute name (if not set, no elevation attribute is attached)`` [string]
  Optional.

  Defines the attribute name for the field containing the values of the 
  contour lines. If nothing is defines the default name will be 'ELEV'.

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

