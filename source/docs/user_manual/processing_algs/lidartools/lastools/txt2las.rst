txt2las
=======

Description
-----------

<put algortithm description here>

Parameters
----------

``verbose`` [boolean]
  <put parameter description here>

  Default: *False*

``Input ASCII file`` [file]
  Optional.

  <put parameter description here>

``parse lines as`` [string]
  <put parameter description here>

  Default: *xyz*

``skip the first n lines`` [number]
  <put parameter description here>

  Default: *0*

``resolution of x and y coordinate`` [number]
  <put parameter description here>

  Default: *0.01*

``resolution of z coordinate`` [number]
  <put parameter description here>

  Default: *0.01*

Outputs
-------

``output LAS/LAZ file`` [file]
  <put output description here>

Console usage
-------------

::

  processing.runalg('lidartools:txt2las', verbose, input, parse_string, skip, scale_factor_xy, scale_factor_z, output_laslaz)

See also
--------

