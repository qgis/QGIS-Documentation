RGB to PCT
==========

Description
-----------

Converts a 24bit RGB image into a 8bit paletted. Computes an optimal pseudo-color
table for the given RGB-image using a median cut algorithm on a downsampled RGB
histogram. Then it converts the image into a pseudo-colored image using the color
table. This conversion utilizes Floyd-Steinberg dithering (error diffusion) to
maximize output image visual quality.
If you want to classify a raster map and want to reduce the number of classes it
can be helpful to downsample your image with this algorithm before.

Parameters
----------

``Input layer`` [raster]
  Input RGB image raster.

``Number of colors`` [number]
  The number of colors the resulting image will contain. A value from 2-256 is possible.

  Default: *2*

Outputs
-------

``Output layer`` [raster]
  8-bit output raster.

Console usage
-------------

::

  processing.runalg('gdalogr:rgbtopct', input, ncolors, output)

See also
--------

