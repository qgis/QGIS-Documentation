Polygons to edges and nodes
===========================

Description
-----------

Extracts boundaries and nodes of polygons in separate files.

Parameters
----------

``Polygons`` [vector: polygon]
  Input layer.

Outputs
-------

``Edges`` [vector]
  Resulting line layer with polygons boundaries.

``Nodes`` [vector]
  Resulting line layer with polygons nodes.

Console usage
-------------

::

  processing.runalg('saga:polygonstoedgesandnodes', polygons, edges, nodes)

See also
--------

