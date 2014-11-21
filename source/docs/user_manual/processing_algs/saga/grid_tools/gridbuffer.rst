Grid buffer
===========

Description
-----------

<put algortithm description here>

Parameters
----------

``Features Grid`` [raster]
  <put parameter description here>

``Distance`` [number]
  <put parameter description here>

  Default: *1000*

``Buffer Distance`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Fixed
  * 1 --- [1] Cell value

  Default: *0*

Outputs
-------

``Buffer Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:gridbuffer', features, dist, buffertype, buffer)

See also
--------

