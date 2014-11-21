Smoothing (anidif)
==================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input Image`` [raster]
  <put parameter description here>

``Available RAM (Mb)`` [number]
  <put parameter description here>

  Default: *128*

``Smoothing Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- anidif

  Default: *2*

``Time Step`` [number]
  <put parameter description here>

  Default: *0.125*

``Nb Iterations`` [number]
  <put parameter description here>

  Default: *10*

Outputs
-------

``Output Image`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:smoothinganidif', -in, -ram, -type, -type.anidif.timestep, -type.anidif.nbiter, -out)

See also
--------

