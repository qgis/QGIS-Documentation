Fuzzify
=======

Description
-----------

<put algortithm description here>

Parameters
----------

``Grid`` [raster]
  <put parameter description here>

``A`` [number]
  <put parameter description here>

  Default: *0.0*

``B`` [number]
  <put parameter description here>

  Default: *0.0*

``C`` [number]
  <put parameter description here>

  Default: *0.0*

``D`` [number]
  <put parameter description here>

  Default: *0.0*

``Membership Function Type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] linear
  * 1 --- [1] sigmoidal
  * 2 --- [2] j-shaped

  Default: *0*

``Adjust to Grid`` [boolean]
  <put parameter description here>

  Default: *True*

Outputs
-------

``Fuzzified Grid`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:fuzzify', input, a, b, c, d, type, autofit, output)

See also
--------

