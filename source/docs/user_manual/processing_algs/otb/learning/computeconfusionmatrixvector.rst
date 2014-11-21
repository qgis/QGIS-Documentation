ComputeConfusionMatrix (vector)
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

  * 0 --- vector

  Default: *0*

``Input reference vector data`` [file]
  <put parameter description here>

``Field name`` [string]
  Optional.

  <put parameter description here>

  Default: *Class*

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

  processing.runalg('otb:computeconfusionmatrixvector', -in, -ref, -ref.vector.in, -ref.vector.field, -nodatalabel, -ram, -out)

See also
--------

