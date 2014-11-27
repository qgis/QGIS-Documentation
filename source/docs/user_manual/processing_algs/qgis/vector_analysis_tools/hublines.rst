Hub lines
=========

Description
-----------

Creates hub and spoke diagrams with lines drawn from points on the ``Spoke Point``
layer to matching points in the ``Hub Point`` layer. Determination of which
hub goes with each point is based on a match between the ``Hub ID field``
on the hub points and the ``Spoke ID field`` on the spoke points.

Parameters
----------

``Hub point layer`` [vector: any]
  <put parameter description here>

``Hub ID field`` [tablefield: any]
  <put parameter description here>

``Spoke point layer`` [vector: any]
  <put parameter description here>

``Spoke ID field`` [tablefield: any]
  <put parameter description here>

Outputs
-------

``Output`` [vector]
  The resulting layer.

Console usage
-------------

::

  processing.runalg('qgis:hublines', hubs, hub_field, spokes, spoke_field, output)

See also
--------

