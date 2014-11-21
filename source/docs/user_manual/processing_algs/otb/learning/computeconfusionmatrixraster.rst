ComputeConfusionMatrix (raster)
===============================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input Image`` [raster]
  <put parameter description here>

``Ground truth`` [selection]
  <put parameter description here>

  Options:

  * 0 --- raster

  Default: *0*

``Input reference image`` [raster]
  <put parameter description here>

``Value for nodata pixels`` [number]
  <put parameter description here>

  Default: *0*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

Outputs
-------

``Matrix output`` [file]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:computeconfusionmatrixraster', -in, -ref, -ref.raster.in, -nodatalabel, -ram, -out)

See also
--------

