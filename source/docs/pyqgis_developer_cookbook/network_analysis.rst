.. _network-analysis:

************************
Network analysis library
************************

Starting from revision `ee19294562 <https://github.com/qgis/Quantum-GIS/commit/ee19294562b00c6ce957945f14c1727210cffdf7>`_
(QGIS >= 1.8) the new network analysis library was added to the QGIS core
analysis library. The library:

* creates mathematical graph from geographical data (polyline vector layers)
* implements basic methods from graph theory (currently only Dijkstra's
  algorithm)

The network analysis library was created by exporting basic functions from the
RoadGraph core plugin and now you can use it's methods in plugins or
directly from the Python console.

General information
===================

Briefly, a typical use case can be described as:

#. create graph from geodata (usually polyline vector layer)
#. run graph analysis
#. use analysis results (for example, visualize them)

Building a graph
================

The first thing you need to do --- is to prepare input data, that is to
convert a vector layer into a graph. All further actions will use this graph,
not the layer.

As a source we can use any polyline vector layer. Nodes of the polylines
become graph vertexes, and segments of the polylines are graph edges.
If several nodes have the same coordinates then they are the same graph vertex.
So two lines that have a common node become connected to each other.

Additionally, during graph creation it is possible to "fix" ("tie") to the
input vector layer any number of additional points. For each additional
point a match will be found --- the closest graph vertex or closest graph edge.
In the latter case the edge will be split and a new vertex added.

Vector layer attributes and length of an edge can be used as the properties
of an edge.

Converting from a vector layer to the graph is done using the `Builder <http://en.wikipedia.org/wiki/Builder_pattern>`_
programming pattern. A graph is constructed using a so-called Director.
There is only one Director for now: `QgsLineVectorLayerDirector <http://qgis.org/api/api/classQgsLineVectorLayerDirector.html>`_.
The director sets the basic settings that will be used to construct a graph
from a line vector layer, used by the builder to create the graph. Currently, as
in the case with the director, only one builder exists: `QgsGraphBuilder <http://qgis.org/api/api/classQgsGraphBuilder.html>`_,
that creates `QgsGraph <http://qgis.org/api/api/classQgsGraph.html>`_ objects.
You may want to implement your own builders that will build a graphs compatible
with such libraries as `BGL <http://www.boost.org/doc/libs/1_48_0/libs/graph/doc/index.html>`_
or `NetworkX <http://networkx.lanl.gov/>`_.

To calculate edge properties the programming pattern `strategy <http://en.wikipedia.org/wiki/Strategy_pattern>`_
is used. For now only `QgsDistanceArcProperter <http://qgis.org/api/api/classQgsDistanceArcProperter.html>`_
strategy is available, that takes into account the length of the route. You
can implement your own strategy that will use all necessary parameters.
For example, RoadGraph plugin uses a strategy that computes travel time
using edge length and speed value from attributes.

It's time to dive into the process.

First of all, to use this library we should import the networkanalysis module

::

  from qgis.networkanalysis import *

Then some examples for creating a director

::

  # don't use information about road direction from layer attributes,
  # all roads are treated as two-way
  director = QgsLineVectorLayerDirector(vLayer, -1, '', '', '', 3)

  # use field with index 5 as source of information about road direction.
  # one-way roads with direct direction have attribute value "yes",
  # one-way roads with reverse direction have the value "1", and accordingly
  # bidirectional roads have "no". By default roads are treated as two-way.
  # This scheme can be used with OpenStreetMap data
  director = QgsLineVectorLayerDirector(vLayer, 5, 'yes', '1', 'no', 3)

To construct a director  we should pass a vector layer, that will be used
as the source for the graph structure and information about allowed movement on
each road segment (one-way or bidirectional movement, direct or reverse
direction). The call looks like this

::

  director = QgsLineVectorLayerDirector(vl, directionFieldId,
                                        directDirectionValue,
                                        reverseDirectionValue,
                                        bothDirectionValue,
                                        defaultDirection)

And here is full list of what these parameters mean:

* ``vl`` --- vector layer used to build the graph
* ``directionFieldId`` --- index of the attribute table field, where
  information about roads direction is stored. If ``-1``, then don't use this
  info at all. An integer.
* ``directDirectionValue`` --- field value for roads with direct direction
  (moving from first line point to last one). A string.
* ``reverseDirectionValue`` --- field value for roads with reverse direction
  (moving from last line point to first one). A string.
* ``bothDirectionValue`` --- field value for bidirectional roads (for such
  roads we can move from first point to last and from last to first). A string.
* ``defaultDirection`` --- default road direction. This value will be used for
  those roads where field ``directionFieldId`` is not set or has some value
  different from any of the three values specified above. An integer. ``1``
  indicates direct direction, ``2`` indicates reverse direction, and ``3``
  indicates both directions.

It is necessary then to create a strategy for calculating edge properties

::

  properter = QgsDistanceArcProperter()

And tell the director about this strategy

::

  director.addProperter(properter)

Now we can use the builder, which will create the graph. The QgsGraphBuilder
class constructor takes several arguments:

* crs --- coordinate reference system to use. Mandatory argument.
* otfEnabled --- use "on the fly" reprojection or no. By default const:`True`
  (use OTF).
* topologyTolerance --- topological tolerance. Default value is 0.
* ellipsoidID --- ellipsoid to use. By default "WGS84".

::

  # only CRS is set, all other values are defaults
  builder = QgsGraphBuilder(myCRS)

Also we can define several points, which will be used in the analysis. For
example

::

  startPoint = QgsPoint(82.7112, 55.1672)
  endPoint = QgsPoint(83.1879, 54.7079)

Now all is in place so we can build the graph and "tie" these points to it

::

  tiedPoints = director.makeGraph(builder, [startPoint, endPoint])

Building the graph can take some time (which depends on the number of features
in a layer and layer size). ``tiedPoints`` is a list with coordinates of "tied"
points. When the build operation is finished we can get the graph and use it
for the analysis

::

  graph = builder.graph()

With the next code we can get the vertex indexes of our points

::

  startId = graph.findVertex(tiedPoints[0])
  endId = graph.findVertex(tiedPoints[1])


Graph analysis
==============

Networks analysis is used to find answers to two questions: which vertexes
are connected and how to find a shortest path. To solve these problems the
network analysis library provides Dijkstra's algorithm.

Dijkstra's algorithm finds the shortest route from one of the vertexes of the
graph to all the others and the values of the optimization parameters.
The results can be represented as a shortest path tree.

The shortest path tree is a directed weighted graph (or more precisely --- tree)
with the following properties:

* only one vertex has no incoming edges — the root of the tree
* all other vertexes have only one incoming edge
* if vertex B is reachable from vertex A, then the path from A to B is the
  single available path and it is optimal (shortest) on this graph

To get the shortest path tree use the methods :func:`shortestTree` and
:func:`dijkstra` of `QgsGraphAnalyzer <http://qgis.org/api/api/classQgsGraphAnalyzer.html>`_
class. It is recommended to use method :func:`dijkstra` because it works
faster and uses memory more efficiently.

The :func:`shortestTree` method is useful when you want to walk around the
shortest path tree. It always creates a new graph object (QgsGraph) and accepts
three variables:

* source --- input graph
* startVertexIdx --- index of the point on the tree (the root of the tree)
* criterionNum --- number of edge property to use (started from 0).

::

  tree = QgsGraphAnalyzer.shortestTree(graph, startId, 0)

The :func:`dijkstra` method has the same arguments, but returns two arrays.
In the first array element i contains index of the incoming edge or -1 if there
are no incoming edges. In the second array element i contains distance from
the root of the tree to vertex i or DOUBLE_MAX if vertex i is unreachable
from the root.

::

  (tree, cost) = QgsGraphAnalyzer.dijkstra(graph, startId, 0)

Here is some very simple code to display the shortest path tree using the graph
created with the :func:`shortestTree` method (select linestring layer in TOC
and replace coordinates with your own). **Warning**: use this code only as an
example, it creates a lots of `QgsRubberBand <http://qgis.org/api/api/classQgsRubberBand.html>`_
objects and may be slow on large data-sets.

::

  from PyQt4.QtCore import *
  from PyQt4.QtGui import *

  from qgis.core import *
  from qgis.gui import *
  from qgis.networkanalysis import *

  vl = qgis.utils.iface.mapCanvas().currentLayer()
  director = QgsLineVectorLayerDirector(vl, -1, '', '', '', 3)
  properter = QgsDistanceArcProperter()
  director.addProperter(properter)
  crs = qgis.utils.iface.mapCanvas().mapRenderer().destinationCrs()
  builder = QgsGraphBuilder(crs)

  pStart = QgsPoint(-0.743804, 0.22954)
  tiedPoint = director.makeGraph(builder, [pStart])
  pStart = tiedPoint[0]

  graph = builder.graph()

  idStart = graph.findVertex(pStart)

  tree = QgsGraphAnalyzer.shortestTree(graph, idStart, 0)

  i = 0;
  while (i < tree.arcCount()):
    rb = QgsRubberBand(qgis.utils.iface.mapCanvas())
    rb.setColor (Qt.red)
    rb.addPoint (tree.vertex(tree.arc(i).inVertex()).point())
    rb.addPoint (tree.vertex(tree.arc(i).outVertex()).point())
    i = i + 1

Same thing but using :func:`dijkstra` method::

  from PyQt4.QtCore import *
  from PyQt4.QtGui import *

  from qgis.core import *
  from qgis.gui import *
  from qgis.networkanalysis import *

  vl = qgis.utils.iface.mapCanvas().currentLayer()
  director = QgsLineVectorLayerDirector(vl, -1, '', '', '', 3)
  properter = QgsDistanceArcProperter()
  director.addProperter(properter)
  crs = qgis.utils.iface.mapCanvas().mapRenderer().destinationCrs()
  builder = QgsGraphBuilder(crs)

  pStart = QgsPoint(-1.37144, 0.543836)
  tiedPoint = director.makeGraph(builder, [pStart])
  pStart = tiedPoint[0]

  graph = builder.graph()

  idStart = graph.findVertex(pStart)

  (tree, costs) = QgsGraphAnalyzer.dijkstra(graph, idStart, 0)

  for edgeId in tree:
    if edgeId == -1:
      continue
    rb = QgsRubberBand(qgis.utils.iface.mapCanvas())
    rb.setColor (Qt.red)
    rb.addPoint (graph.vertex(graph.arc(edgeId).inVertex()).point())
    rb.addPoint (graph.vertex(graph.arc(edgeId).outVertex()).point())

Finding shortest paths
----------------------

To find the optimal path between two points the following approach is used.
Both points (start A and end B) are "tied" to the graph when it is built. Then
using the methods :func:`shortestTree` or :func:`dijkstra` we build the
shortest path tree with root in the start point A. In the same tree we also
find the end point B and start to walk through the tree from point B to point
A. The Whole algorithm can be written as

::

    assign Т = B
    while Т != A
        add point Т to path
        get incoming edge for point Т
        look for point ТТ, that is start point of this edge
        assign Т = ТТ
    add point А to path

At this point we have the path, in the form of the inverted list of vertexes
(vertexes are listed in reversed order from end point to start point) that will
be visited during traveling by this path.

Here is the sample code for QGIS Python Console (you will need to select
linestring layer in TOC and replace coordinates in the code with yours) that
uses method :func:`shortestTree`

::

  from PyQt4.QtCore import *
  from PyQt4.QtGui import *

  from qgis.core import *
  from qgis.gui import *
  from qgis.networkanalysis import *

  vl = qgis.utils.iface.mapCanvas().currentLayer()
  director = QgsLineVectorLayerDirector(vl, -1, '', '', '', 3)
  properter = QgsDistanceArcProperter()
  director.addProperter(properter)
  crs = qgis.utils.iface.mapCanvas().mapRenderer().destinationCrs()
  builder = QgsGraphBuilder(crs)

  pStart = QgsPoint(-0.835953, 0.15679)
  pStop = QgsPoint(-1.1027, 0.699986)

  tiedPoints = director.makeGraph(builder, [pStart, pStop])
  graph = builder.graph()

  tStart = tiedPoints[0]
  tStop = tiedPoints[1]

  idStart = graph.findVertex(tStart)
  tree = QgsGraphAnalyzer.shortestTree(graph, idStart, 0)

  idStart = tree.findVertex(tStart)
  idStop = tree.findVertex(tStop)

  if idStop == -1:
    print "Path not found"
  else:
    p = []
    while (idStart != idStop):
      l = tree.vertex(idStop).inArc()
      if len(l) == 0:
        break
      e = tree.arc(l[0])
      p.insert(0, tree.vertex(e.inVertex()).point())
      idStop = e.outVertex()

    p.insert(0, tStart)
    rb = QgsRubberBand(qgis.utils.iface.mapCanvas())
    rb.setColor(Qt.red)

    for pnt in p:
      rb.addPoint(pnt)

And here is the same sample but using :func:`dikstra` method

::

  from PyQt4.QtCore import *
  from PyQt4.QtGui import *

  from qgis.core import *
  from qgis.gui import *
  from qgis.networkanalysis import *

  vl = qgis.utils.iface.mapCanvas().currentLayer()
  director = QgsLineVectorLayerDirector(vl, -1, '', '', '', 3)
  properter = QgsDistanceArcProperter()
  director.addProperter(properter)
  crs = qgis.utils.iface.mapCanvas().mapRenderer().destinationCrs()
  builder = QgsGraphBuilder(crs)

  pStart = QgsPoint(-0.835953, 0.15679)
  pStop = QgsPoint(-1.1027, 0.699986)

  tiedPoints = director.makeGraph(builder, [pStart, pStop])
  graph = builder.graph()

  tStart = tiedPoints[0]
  tStop = tiedPoints[1]

  idStart = graph.findVertex(tStart)
  idStop = graph.findVertex(tStop)

  (tree, cost) = QgsGraphAnalyzer.dijkstra(graph, idStart, 0)

  if tree[idStop] == -1:
    print "Path not found"
  else:
    p = []
    curPos = idStop
    while curPos != idStart:
      p.append(graph.vertex(graph.arc(tree[curPos]).inVertex()).point())
      curPos = graph.arc(tree[curPos]).outVertex();

    p.append(tStart)

    rb = QgsRubberBand(qgis.utils.iface.mapCanvas())
    rb.setColor(Qt.red)

    for pnt in p:
      rb.addPoint(pnt)

Areas of availability
---------------------

The area of availability for vertex A is the subset of graph vertexes that are
accessible from vertex A and the cost of the paths from A to these vertexes are
not greater that some value.

More clearly this can be shown with the following example: "There is a fire
station. Which parts of city can a fire truck reach in 5 minutes? 10 minutes?
15 minutes?". Answers to these questions are fire station's areas of
availability.

To find the areas of availability we can use method :func:`dijkstra` of the
:class:`QgsGraphAnalyzer` class. It is enough to compare the elements of the
cost array with a predefined value. If cost[i] is less than or equal to a
predefined value, then vertex i is inside the area of availability, otherwise
it is outside.

A more difficult problem is to get the borders of the area of availability.
The bottom border is the set of vertexes that are still accessible, and the top
border is the set of vertexes that are not accessible. In fact this is simple:
it is the availability border based on the edges of the shortest path tree for
which the source vertex of the edge is accessible and the target vertex of the
edge is not.

Here is an example

::

  from PyQt4.QtCore import *
  from PyQt4.QtGui import *

  from qgis.core import *
  from qgis.gui import *
  from qgis.networkanalysis import *

  vl = qgis.utils.iface.mapCanvas().currentLayer()
  director = QgsLineVectorLayerDirector(vl, -1, '', '', '', 3)
  properter = QgsDistanceArcProperter()
  director.addProperter(properter)
  crs = qgis.utils.iface.mapCanvas().mapRenderer().destinationCrs()
  builder = QgsGraphBuilder(crs)

  pStart = QgsPoint(65.5462, 57.1509)
  delta = qgis.utils.iface.mapCanvas().getCoordinateTransform().mapUnitsPerPixel() * 1

  rb = QgsRubberBand(qgis.utils.iface.mapCanvas(), True)
  rb.setColor(Qt.green)
  rb.addPoint(QgsPoint(pStart.x() - delta, pStart.y() - delta))
  rb.addPoint(QgsPoint(pStart.x() + delta, pStart.y() - delta))
  rb.addPoint(QgsPoint(pStart.x() + delta, pStart.y() + delta))
  rb.addPoint(QgsPoint(pStart.x() - delta, pStart.y() + delta))

  tiedPoints = director.makeGraph(builder, [pStart])
  graph = builder.graph()
  tStart = tiedPoints[0]

  idStart = graph.findVertex(tStart)

  (tree, cost) = QgsGraphAnalyzer.dijkstra(graph, idStart, 0)

  upperBound = []
  r = 2000.0
  i = 0
  while i < len(cost):
    if cost[i] > r and tree[i] != -1:
      outVertexId = graph.arc(tree [i]).outVertex()
      if cost[outVertexId] < r:
        upperBound.append(i)
    i = i + 1

  for i in upperBound:
    centerPoint = graph.vertex(i).point()
    rb = QgsRubberBand(qgis.utils.iface.mapCanvas(), True)
    rb.setColor(Qt.red)
    rb.addPoint(QgsPoint(centerPoint.x() - delta, centerPoint.y() - delta))
    rb.addPoint(QgsPoint(centerPoint.x() + delta, centerPoint.y() - delta))
    rb.addPoint(QgsPoint(centerPoint.x() + delta, centerPoint.y() + delta))
    rb.addPoint(QgsPoint(centerPoint.x() - delta, centerPoint.y() + delta))
