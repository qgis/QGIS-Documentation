Sink removal
============

Description
-----------

<put algortithm description here>

Parameters
----------

``DEM`` [raster]
  <put parameter description here>

``Sink Route`` [raster]
  Optional.

  <put parameter description here>

``Method`` [selection]
  <put parameter description here>

  Options:

  * 0 --- [0] Deepen Drainage Routes
  * 1 --- [1] Fill Sinks

  Default: *0*

``Threshold`` [boolean]
  <put parameter description here>

  Default: *True*

``Threshold Height`` [number]
  <put parameter description here>

  Default: *100.0*

Outputs
-------

``Preprocessed DEM`` [raster]
  <put output description here>

Console usage
-------------

::

  processing.runalg('saga:sinkremoval', dem, sinkroute, method, threshold, thrsheight, dem_preproc)

See also
--------

