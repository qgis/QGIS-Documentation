Information
===========

Description
-----------
The gdalinfo program lists various information about a GDAL supported raster dataset.

<put algortithm description here>

Parameters
----------

``Input layer`` [raster]
  Raster layer in input

``Suppress GCP info`` [boolean]
  Suppress ground control points list printing. It may be useful for datasets with huge amount of GCPs, such as L1B AVHRR or HDF4 MODIS which contain thousands of them. 
  Default: *False*

``Suppress metadata info`` [boolean]
  Suppress metadata printing. Some datasets may contain a lot of metadata strings. 
  Default: *False*

Outputs
-------

``Layer information`` [html]
  Raster information in output

Console usage
-------------

::

  processing.runalg('gdalorg:rasterinfo', input, nogcp, nometadata, output)

See also
--------
`GDAL info <http://www.gdal.org/gdalinfo.html>`_

