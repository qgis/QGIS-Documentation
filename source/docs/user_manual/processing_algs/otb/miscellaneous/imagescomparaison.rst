Images comparaison
==================

Description
-----------

<put algortithm description here>

Parameters
----------

``Reference image`` [raster]
  <put parameter description here>

``Reference image channel`` [number]
  <put parameter description here>

  Default: *1*

``Measured image`` [raster]
  <put parameter description here>

``Measured image channel`` [number]
  <put parameter description here>

  Default: *1*

``Start X`` [number]
  <put parameter description here>

  Default: *0*

``Start Y`` [number]
  <put parameter description here>

  Default: *0*

``Size X`` [number]
  <put parameter description here>

  Default: *0*

``Size Y`` [number]
  <put parameter description here>

  Default: *0*

Outputs
-------

Console usage
-------------

::

  processing.runalg('otb:imagescomparaison', -ref.in, -ref.channel, -meas.in, -meas.channel, -roi.startx, -roi.starty, -roi.sizex, -roi.sizey)

See also
--------

