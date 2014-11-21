Land surface temperature
========================

Description
-----------

<put algortithm description here>

Parameters
----------

``Elevation [m]`` [raster]
  <put parameter description here>

``Short Wave Radiation [kW/m2]`` [raster]
  <put parameter description here>

``Leaf Area Index`` [raster]
  <put parameter description here>

``Elevation at Reference Station [m]`` [number]
  <put parameter description here>

  Default: *0.0*

``Temperature at Reference Station [Deg.Celsius]`` [number]
  <put parameter description here>

  Default: *0.0*

``Temperature Gradient [Deg.Celsius/km]`` [number]
  <put parameter description here>

  Default: *6.5*

``C Factor`` [number]
  <put parameter description here>

  Default: *1.0*

Outputs
-------

``Land Surface Temperature [Deg.Celsius]`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:landsurfacetemperature', dem, swr, lai, z_reference, t_reference, t_gradient, c_factor, lst)

See also
--------

