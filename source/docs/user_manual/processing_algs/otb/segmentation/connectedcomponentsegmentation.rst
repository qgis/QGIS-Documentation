Connected Component Segmentation
================================

Description
-----------

<put algortithm description here>

Parameters
----------

``Input Image`` [raster]
  <put parameter description here>

``Mask expression`` [string]
  Optional.

  <put parameter description here>

  Default: *None*

``Connected Component Expression`` [string]
  <put parameter description here>

  Default: *None*

``Minimum Object Size`` [number]
  <put parameter description here>

  Default: *2*

``OBIA Expression`` [string]
  Optional.

  <put parameter description here>

  Default: *None*

``Default elevation`` [number]
  <put parameter description here>

  Default: *0*

Outputs
-------

``Output Shape`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('otb:connectedcomponentsegmentation', -in, -mask, -expr, -minsize, -obia, -elev.default, -out)

See also
--------

