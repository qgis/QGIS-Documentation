Zonal grid statistics
=====================

Description
-----------

<put algortithm description here>

Parameters
----------

``Zone Grid`` [raster]
  <put parameter description here>

``Categorial Grids`` [multipleinput: rasters]
  Optional.

  <put parameter description here>

``Grids to analyse`` [multipleinput: rasters]
  Optional.

  <put parameter description here>

``Aspect`` [raster]
  Optional.

  <put parameter description here>

``Short Field Names`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
-------

``Zonal Statistics`` [table]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:zonalgridstatistics', zones, catlist, statlist, aspect, shortnames, outtab)

See also
--------

