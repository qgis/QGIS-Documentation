Distance to nearest hub
=======================

Description
-----------

<put algortithm description here>

Parameters
----------

``Source points layer`` [vector: any]
  <put parameter description here>

``Destination hubs layer`` [vector: any]
  <put parameter description here>

``Hub layer name attribute`` [tablefield: any]
  <put parameter description here>

``Output shape type`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Point
  * 1 --- Line to hub

  Default: *0*

``Measurement unit`` [selection]
  <put parameter description here>

  Options:

  * 0 --- Meters
  * 1 --- Feet
  * 2 --- Miles
  * 3 --- Kilometers
  * 4 --- Layer units

  Default: *0*

Outputs
-------

``Output`` [vector]
  <put output description here>

Console usage
-------------

::

  processing.runalg('qgis:distancetonearesthub', points, hubs, field, geometry, unit, output)

See also
--------

