Extract projection
==================

Description
-----------

Extracts the projection of a raster file and writes it into a 
world-file.

Parameters
----------

``Input file`` [raster]
  input raster file.

``Create also .prj file`` [boolean]
  If this is acivated also a *.prj-file containing the projection 
  information is created.

  Default: *False*

Outputs
-------

Console usage
-------------

::

  processing.runalg('gdalogr:extractprojection', input, prj_file)

See also
--------

