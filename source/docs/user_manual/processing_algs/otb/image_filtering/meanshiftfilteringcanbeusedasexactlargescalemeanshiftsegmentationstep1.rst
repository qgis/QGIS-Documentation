Mean Shift filtering (can be used as Exact Large-Scale Mean-Shift segmentation, step 1)
=======================================================================================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input Image`` [raster]
  <put parameter description here>

``Spatial radius`` [number]
  <put parameter description here>

  Default: *5*

``Range radius`` [number]
  <put parameter description here>

  Default: *15*

``Mode convergence threshold`` [number]
  <put parameter description here>

  Default: *0.1*

``Maximum number of iterations`` [number]
  <put parameter description here>

  Default: *100*

``Range radius coefficient`` [number]
  <put parameter description here>

  Default: *0*

``Mode search.`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
-------

``Filtered output`` [raster]
  <put output description here>

``Spatial image`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:meanshiftfilteringcanbeusedasexactlargescalemeanshiftsegmentationstep1', -in, -spatialr, -ranger, -thres, -maxiter, -rangeramp, -modesearch, -fout, -foutpos)

See also
--------

