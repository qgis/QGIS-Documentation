Fill nodata
===========

Description
-----------

Fill raster regions with no data values by interpolation from edges. The values for
the no-data regions are calculated by the sourrounding pixel values using inverse distance
weighting. After the interpolation a smoothing of the results takes placce.
Input can be any GDAL-supported raster layer. This algorithm is generally suitable for
interpolating missing regions of fairly continuously varying rasters (such as elevation
models for instance). It is also suitable for filling small holes and cracks in more irregularly
varying images (like airphotos). It is generally not so great for interpolating a raster 
from sparse point data.

Parameters
----------

``Input layer`` [raster]
  Raster layer.

``Search distance`` [number]
  The number of pixels to search in all directions to interpolate from.

  Default: *100*

``Smooth iterations`` [number]
  The number of 3x3 filter passes to run (0 or more) to smoothen the results
  of the interpolation.

  Default: *0*

``Band to operate on`` [number]
  The band to operate on. Nodata values must be represented by the value 0.

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
  Output raster in any GDAL-supported format.

Console usage
-------------

::

  processing.runalg('gdalogr:fillnodata', input, distance, iterations, band, mask, no_default_mask, output)

See also
--------

