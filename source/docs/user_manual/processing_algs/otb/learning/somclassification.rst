SOM Classification
==================

Description
-----------

<put algortithm description here>

Parameters
----------

``InputImage`` [raster]
  <put parameter description here>

``ValidityMask`` [raster]
  Optional.

  <put parameter description here>

``TrainingProbability`` [number]
  <put parameter description here>

  Default: *1*

``TrainingSetSize`` [number]
  <put parameter description here>

  Default: *0*

``StreamingLines`` [number]
  <put parameter description here>

  Default: *0*

``SizeX`` [number]
  <put parameter description here>

  Default: *32*

``SizeY`` [number]
  <put parameter description here>

  Default: *32*

``NeighborhoodX`` [number]
  <put parameter description here>

  Default: *10*

``NeighborhoodY`` [number]
  <put parameter description here>

  Default: *10*

``NumberIteration`` [number]
  <put parameter description here>

  Default: *5*

``BetaInit`` [number]
  <put parameter description here>

  Default: *1*

``BetaFinal`` [number]
  <put parameter description here>

  Default: *0.1*

``InitialValue`` [number]
  <put parameter description here>

  Default: *0*

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``set user defined seed`` [number]
  <put parameter description here>

  Default: *0*

Outputs
-------

``OutputImage`` [raster]
  <put output description here>

``SOM Map`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:somclassification', -in, -vm, -tp, -ts, -sl, -sx, -sy, -nx, -ny, -ni, -bi, -bf, -iv, -ram, -rand, -out, -som)

See also
--------

