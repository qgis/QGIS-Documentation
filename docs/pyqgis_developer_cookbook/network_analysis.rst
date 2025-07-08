.. highlight:: python
   :linenothreshold: 5

.. testsetup:: network_analysis

    from qgis.core import (
      QgsVectorLayer,
    )

    iface = start_qgis()

    vectorLayer = QgsVectorLayer('testdata/network.gpkg|layername=network_lines', 'lines')

.. _network-analysis:

************************
Network analysis library
************************

.. hint:: The code snippets on this page need the following imports if you're outside the pyqgis console:

  .. testcode:: network_analysis

    from qgis.core import (
      QgsVectorLayer,
      QgsPointXY,
    )

.. only:: html

   .. contents::
      :local:

The network analysis library can be used to:

* create mathematical graph from geographical data (polyline vector layers)
* implement basic methods from graph theory (currently only Dijkstra's
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

Converting from a vector layer to the graph is done using the
`Builder <https://en.wikipedia.org/wiki/Builder_pattern>`_
programming pattern. A graph is constructed using a so-called Director.
There is only one Director for now: :class:`QgsVectorLayerDirector
<qgis.analysis.QgsVectorLayerDirector>`.
The director sets the basic settings that will be used to construct a graph
from a line vector layer, used by the builder to create the graph. Currently, as
in the case with the director, only one builder exists: :class:`QgsGraphBuilder <qgis.analysis.QgsGraphBuilder>`,
that creates :class:`QgsGraph <qgis.analysis.QgsGraph>` objects.
You may want to implement your own builders that will build a graph compatible
with such libraries as `BGL <https://www.boost.org/doc/libs/1_48_0/libs/graph/doc/index.html>`_
or `NetworkX <https://networkx.org/>`_.

To calculate edge properties the programming pattern `strategy <https://en.wikipedia.org/wiki/Strategy_pattern>`_
is used. For now only :class:`QgsNetworkDistanceStrategy <qgis.analysis.QgsNetworkDistanceStrategy>`
strategy (that takes into account the length of the route) and
:class:`QgsNetworkSpeedStrategy <qgis.analysis.QgsNetworkSpeedStrategy>` (that also considers
the speed) are availabile. You can implement your own strategy that will use all
necessary parameters.
For example, RoadGraph plugin uses a strategy that computes travel time
using edge length and speed value from attributes.

It's time to dive into the process.

First of all, to use this library we should import the analysis module

.. testcode:: network_analysis

  from qgis.analysis import *

Then some examples for creating a director


.. testcode:: network_analysis

  # don't use information about road direction from layer attributes,
  # all roads are treated as two-way
  director = QgsVectorLayerDirector(vectorLayer, -1, '', '', '', QgsVectorLayerDirector.DirectionBoth)

  # use field with index 5 as source of information about road direction.
  # one-way roads with direct direction have attribute value "yes",
  # one-way roads with reverse direction have the value "1", and accordingly
  # bidirectional roads have "no". By default roads are treated as two-way.
  # This scheme can be used with OpenStreetMap data
  director = QgsVectorLayerDirector(vectorLayer, 5, 'yes', '1', 'no', QgsVectorLayerDirector.DirectionBoth)

To construct a director, we should pass a vector layer that will be used
as the source for the graph structure and information about allowed movement on
each road segment (one-way or bidirectional movement, direct or reverse
direction). The call looks like this

.. code-block:: python

  director = QgsVectorLayerDirector(vectorLayer,
                                    directionFieldId,
                                    directDirectionValue,
                                    reverseDirectionValue,
                                    bothDirectionValue,
                                    defaultDirection)

And here is full list of what these parameters mean:

* ``vectorLayer`` --- vector layer used to build the graph
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
  different from any of the three values specified above. Possible values are:

  * :attr:`QgsVectorLayerDirector.DirectionForward <qgis.analysis.QgsVectorLayerDirector.DirectionForward>` --- One-way direct
  * :attr:`QgsVectorLayerDirector.DirectionBackward <qgis.analysis.QgsVectorLayerDirector.DirectionBackward>` --- One-way reverse
  * :attr:`QgsVectorLayerDirector.DirectionBoth <qgis.analysis.QgsVectorLayerDirector.DirectionBoth>` --- Two-way


It is necessary then to create a strategy for calculating edge properties

.. testcode:: network_analysis

  # The index of the field that contains information about the edge speed
  attributeId = 1
  # Default speed value
  defaultValue = 50
  # Conversion from speed to metric units ('1' means no conversion)
  toMetricFactor = 1
  strategy = QgsNetworkSpeedStrategy(attributeId, defaultValue, toMetricFactor)

And tell the director about this strategy

.. testcode:: network_analysis

  director = QgsVectorLayerDirector(vectorLayer, -1, '', '', '', 3)
  director.addStrategy(strategy)

Now we can use the builder, which will create the graph. The :class:`QgsGraphBuilder
<qgis.analysis.QgsGraphBuilder>` class constructor takes several arguments:

* ``crs`` --- coordinate reference system to use. Mandatory argument.
* ``otfEnabled`` --- use "on the fly" reprojection or no. By default :const:`True`
  (use OTF).
* ``topologyTolerance`` --- topological tolerance. Default value is 0.
* ``ellipsoidID`` --- ellipsoid to use. By default "WGS84".

.. testcode:: network_analysis

  # only CRS is set, all other values are defaults
  builder = QgsGraphBuilder(vectorLayer.crs())

Also we can define several points, which will be used in the analysis. For
example

.. testcode:: network_analysis

  startPoint = QgsPointXY(1179720.1871, 5419067.3507)
  endPoint = QgsPointXY(1180616.0205, 5419745.7839)

Now all is in place so we can build the graph and "tie" these points to it

.. testcode:: network_analysis

  tiedPoints = director.makeGraph(builder, [startPoint, endPoint])

Building the graph can take some time (which depends on the number of features
in a layer and layer size). ``tiedPoints`` is a list with coordinates of "tied"
points. When the build operation is finished we can get the graph and use it
for the analysis

.. testcode:: network_analysis

  graph = builder.graph()

With the next code we can get the vertex indexes of our points

.. testcode:: network_analysis

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

The shortest path tree is a directed weighted graph (or more precisely a tree)
with the following properties:

* only one vertex has no incoming edges — the root of the tree
* all other vertexes have only one incoming edge
* if vertex B is reachable from vertex A, then the path from A to B is the
  single available path and it is optimal (shortest) on this graph

To get the shortest path tree use the methods :meth:`shortestTree()
<qgis.analysis.QgsGraphAnalyzer.shortestTree>` and :meth:`dijkstra()
<qgis.analysis.QgsGraphAnalyzer.dijkstra>` of the :class:`QgsGraphAnalyzer
<qgis.analysis.QgsGraphAnalyzer>` class. It is recommended to use the
:meth:`dijkstra() <qgis.analysis.QgsGraphAnalyzer.dijkstra>` method because it works
faster and uses memory more efficiently.

The :meth:`shortestTree() <qgis.analysis.QgsGraphAnalyzer.shortestTree>` method
is useful when you want to walk around the
shortest path tree. It always creates a new graph object (QgsGraph) and accepts
three variables:

* ``source`` --- input graph
* ``startVertexIdx`` --- index of the point on the tree (the root of the tree)
* ``criterionNum`` --- number of edge property to use (started from 0).

.. testcode:: network_analysis

  tree = QgsGraphAnalyzer.shortestTree(graph, startId, 0)

The :meth:`dijkstra() <qgis.analysis.QgsGraphAnalyzer.dijkstra>` method has the
same arguments, but returns a tuple of arrays:

* In the first array, element `n` contains index of the incoming edge or -1 if there
  are no incoming edges.
* In the second array, element `n` contains the distance from the root of the tree
  to vertex `n` or DOUBLE_MAX if vertex `n` is unreachable from the root.

.. testcode:: network_analysis

  (tree, cost) = QgsGraphAnalyzer.dijkstra(graph, startId, 0)

Here is some very simple code to display the shortest path tree using the graph
created with the :meth:`shortestTree() <qgis.analysis.QgsGraphAnalyzer.shortestTree>`
method (select linestring layer in :guilabel:`Layers` panel
and replace coordinates with your own).

.. warning:: Use this code only as an example, it creates a lot of
  :class:`QgsRubberBand <qgis.gui.QgsRubberBand>` objects and may be slow on
  large datasets.

.. testcode:: network_analysis

  from qgis.core import *
  from qgis.gui import *
  from qgis.analysis import *
  from qgis.PyQt.QtCore import *
  from qgis.PyQt.QtGui import *

  vectorLayer = QgsVectorLayer('testdata/network.gpkg|layername=network_lines', 'lines')
  director = QgsVectorLayerDirector(vectorLayer, -1, '', '', '', QgsVectorLayerDirector.DirectionBoth)
  strategy = QgsNetworkDistanceStrategy()
  director.addStrategy(strategy)
  builder = QgsGraphBuilder(vectorLayer.crs())

  pStart = QgsPointXY(1179661.925139,5419188.074362)
  tiedPoint = director.makeGraph(builder, [pStart])
  pStart = tiedPoint[0]

  graph = builder.graph()

  idStart = graph.findVertex(pStart)

  tree = QgsGraphAnalyzer.shortestTree(graph, idStart, 0)

  i = 0
  while (i < tree.edgeCount()):
    rb = QgsRubberBand(iface.mapCanvas())
    rb.setColor (Qt.red)
    rb.addPoint (tree.vertex(tree.edge(i).fromVertex()).point())
    rb.addPoint (tree.vertex(tree.edge(i).toVertex()).point())
    i = i + 1

Same thing but using the :meth:`dijkstra() <qgis.analysis.QgsGraphAnalyzer.dijkstra>`
method

.. testcode:: network_analysis

  from qgis.core import *
  from qgis.gui import *
  from qgis.analysis import *
  from qgis.PyQt.QtCore import *
  from qgis.PyQt.QtGui import *

  vectorLayer = QgsVectorLayer('testdata/network.gpkg|layername=network_lines', 'lines')

  director = QgsVectorLayerDirector(vectorLayer, -1, '', '', '', QgsVectorLayerDirector.DirectionBoth)
  strategy = QgsNetworkDistanceStrategy()
  director.addStrategy(strategy)
  builder = QgsGraphBuilder(vectorLayer.crs())

  pStart = QgsPointXY(1179661.925139,5419188.074362)
  tiedPoint = director.makeGraph(builder, [pStart])
  pStart = tiedPoint[0]

  graph = builder.graph()

  idStart = graph.findVertex(pStart)

  (tree, costs) = QgsGraphAnalyzer.dijkstra(graph, idStart, 0)

  for edgeId in tree:
    if edgeId == -1:
      continue
    rb = QgsRubberBand(iface.mapCanvas())
    rb.setColor (Qt.red)
    rb.addPoint (graph.vertex(graph.edge(edgeId).fromVertex()).point())
    rb.addPoint (graph.vertex(graph.edge(edgeId).toVertex()).point())

.. testcode:: network_analysis
   :hide:

   # For showcasing the output
   print(QgsGraphAnalyzer.dijkstra(graph, idStart, 0))

.. testoutput:: network_analysis
   :hide:

   ([218, 0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62, 64, 66, 68, 70, 72, 74, 76, 78, 80, 82, 84, 86, 88, 90, 92, 94, 96, 98, 344, 100, 102, 104, 106, 108, 110, 115, 117, 119, 121, 122, 124, 126, 128, 130, 132, 134, 136, 138, 140, 142, 144, 146, 148, 150, 152, 154, 156, 158, 160, 162, 164, 169, 171, 173, 175, 177, 179, 181, 183, 352, 184, 186, 188, 190, 192, 362, 197, 199, 201, 203, 205, 207, 209, 210, 212, 214, 216, 220, 222, 224, 226, 228, 230, 232, 234, 236, 238, 240, 242, 244, 246, 248, 250, 252, 254, 256, 258, 260, 262, 264, 266, 268, 270, 272, 274, 276, 278, 280, 282, 284, 286, 288, 290, 293, 295, 297, 299, 301, 303, 305, 307, 309, 311, 313, 315, 317, 319, 321, 323, 325, 327, 329, 331, 333, 335, 337, 339, 340, 342, 346, 348, 350, 354, 356, 358, 360, 364, 366, 368, 370, 375, 376, 378, 380, 382, 384, 386, 388, 390, 392, 394, 396, 398, 400, 402, 404, 406, 408, 410, 412, 414, 416, 418, 420, 422, 424, -1], [124.39476998411804, 138.66283208835412, 150.53555438466447, 164.57912573171023, 179.23924247463415, 194.75089614422194, 209.70179736302126, 225.1525056126771, 240.26884816536185, 255.39749527397734, 270.2127940770836, 284.0768478719096, 296.0661313166693, 311.9024860352499, 320.9982594394772, 333.87974932697006, 347.55694848041776, 361.19153886320015, 374.238561090788, 406.1447581615532, 420.7452155746581, 436.88841089368225, 462.9245591085956, 481.6768148529036, 500.22755406350177, 526.9670056261002, 545.8837041315487, 564.7055275001591, 581.123172651614, 597.7765781646524, 614.7664921059105, 632.3171128069039, 649.112819279056, 665.8085578712089, 683.1258331431469, 698.947214187171, 715.7436891011973, 732.6029061901793, 748.8376517437865, 773.2059660922841, 789.285924659235, 812.670343788429, 827.6727457892537, 842.8291666261852, 858.0399094531315, 872.0065153695274, 884.5922163147906, 895.9787905248039, 905.740056356045, 914.8811146761717, 930.2904478906241, 263.5642185058698, 280.91367500423036, 295.88931132369913, 325.4427558340858, 351.1971364671005, 370.7635052432715, 401.5739235216575, 418.76342964903347, 389.3073559393387, 369.2907064374772, 350.9383267526058, 410.1270216357348, 432.2207796508284, 454.43010214928324, 469.83787510656435, 484.60565391630325, 499.7948616035947, 514.7849607999499, 530.2753687263233, 545.6938062145243, 561.6268044701642, 577.6737490718033, 593.3566158046335, 609.1193367894333, 625.9052613878233, 642.6348359173521, 667.9492491133608, 685.3969510298026, 701.9481001036452, 717.690276328542, 733.9466256302471, 748.89229523709, 762.4295645616686, 770.0877406826243, 759.7972749882956, 751.3649617777684, 744.0297693259965, 734.9864061627233, 725.1668978617652, 714.9410945445027, 705.685217922547, 459.3557375047614, 531.7790703734424, 583.5158205256097, 608.5508218388547, 634.5542950038802, 685.861711620616, 652.8781093781579, 174.5362859592864, 149.94655454878404, 134.22949468621675, 105.2671567086403, 75.96352787879698, 42.55266676376518, 12.101528126935051, 16.862672623158062, 39.78735765293871, 75.97170342559173, 108.84655564437509, 145.6971578521245, 179.28459470705133, 207.30963572436323, 235.3350533778044, 266.86605614352834, 297.53754150703804, 327.389206886471, 364.26749589855774, 393.08540659103846, 425.39453942004496, 458.32280511763065, 486.5242493560801, 513.6859348502998, 550.2189659724384, 577.3098336948775, 602.1490961341706, 621.5067289765117, 632.6009876280282, 661.3793749008854, 683.1986690821279, 710.9176996006332, 727.764259242836, 747.9562088794273, 769.8750058916835, 794.314860200602, 816.7538030624698, 841.1951215912138, 864.3293946725588, 890.5058710591255, 918.3796471710864, 936.9164504182097, 961.2681858358704, 979.5405359067414, 1001.4489587394864, 1019.0637467867341, 1037.1323442276394, 658.0289783323283, 645.3793406097774, 613.9252812692224, 576.275160239617, 535.7153931211087, 497.18354290981, 463.37963115880956, 429.7044747983485, 386.8434854669309, 352.089179729275, 319.06022531645624, 293.15384518374407, 267.7063557777086, 244.17867432629765, 218.56399913901117, 193.36629646532356, 551.6863510489152, 527.2322622744515, 469.08607006385427, 423.3749051921875, 371.4531490654931, 311.2966085359991, 259.3751984298705, 199.21250643334238, 206.1805242030041, 254.05395486961962, 322.85903259662535, 379.2364803148052, 439.3851913108914, 489.1810988127273, 545.4712386216252, 595.9173199954405, 640.7008592759236, 699.7446277709514, 810.8413862395954, 856.9631316105888, 906.7885486163724, 946.3132663810233, 960.9337004531008, 1010.1286077898911, 1067.0322752729885, 1114.73892592156, 1151.9975245554094, 1154.3536248569667, 1211.888417118187, 1294.255155397609, 1348.8626517014445, 1405.150729444048, 1459.2498106492133, 1503.1339507975044, 1535.6585655564475, 1598.1550299298801, 1650.4890799685336, 1686.100890461004, 1736.7895771628066, 1785.237467588979, 1825.2208316900173, 1880.9173362976153, 1899.3151871589664, 1919.7247927365333, 1940.5621349605865, 2220.270896210744, 2240.3446478085707, 0.0])

Finding shortest paths
----------------------

To find the optimal path between two points the following approach is used.
Both points (start A and end B) are "tied" to the graph when it is built. Then
using the :meth:`shortestTree() <qgis.analysis.QgsGraphAnalyzer.shortestTree>`
or :meth:`dijkstra() <qgis.analysis.QgsGraphAnalyzer.dijkstra>` method we build the
shortest path tree with root in the start point A. In the same tree we also
find the end point B and start to walk through the tree from point B to point
A. The whole algorithm can be written as:

.. code-block:: python

    assign T = B
    while T != B
        add point T to path
        get incoming edge for point T
        look for point TT, that is start point of this edge
        assign T = TT
    add point A to path

At this point we have the path, in the form of the inverted list of vertexes
(vertexes are listed in reversed order from end point to start point) that will
be visited during traveling by this path.

Here is the sample code for QGIS Python Console (you may need to load and
select a linestring layer in TOC and replace coordinates in the code with yours) that
uses the :meth:`shortestTree() <qgis.analysis.QgsGraphAnalyzer.shortestTree>` method

.. testcode:: network_analysis

    from qgis.core import *
    from qgis.gui import *
    from qgis.analysis import *

    from qgis.PyQt.QtCore import *
    from qgis.PyQt.QtGui import *

    vectorLayer = QgsVectorLayer('testdata/network.gpkg|layername=network_lines', 'lines')
    builder = QgsGraphBuilder(vectorLayer.sourceCrs())
    director = QgsVectorLayerDirector(vectorLayer, -1, '', '', '', QgsVectorLayerDirector.DirectionBoth)
    strategy = QgsNetworkDistanceStrategy()
    director.addStrategy(strategy)

    startPoint = QgsPointXY(1179661.925139,5419188.074362)
    endPoint = QgsPointXY(1180942.970617,5420040.097560)

    tiedPoints = director.makeGraph(builder, [startPoint, endPoint])
    tStart, tStop = tiedPoints

    graph = builder.graph()
    idxStart = graph.findVertex(tStart)

    tree = QgsGraphAnalyzer.shortestTree(graph, idxStart, 0)

    idxStart = tree.findVertex(tStart)
    idxEnd = tree.findVertex(tStop)

    if idxEnd == -1:
        raise Exception('No route!')

    # Add last point
    route = [tree.vertex(idxEnd).point()]

    # Iterate the graph
    while idxEnd != idxStart:
        edgeIds = tree.vertex(idxEnd).incomingEdges()
        if len(edgeIds) == 0:
            break
        edge = tree.edge(edgeIds[0])
        route.insert(0, tree.vertex(edge.fromVertex()).point())
        idxEnd = edge.fromVertex()

    # Display
    rb = QgsRubberBand(iface.mapCanvas())
    rb.setColor(Qt.green)

    # This may require coordinate transformation if project's CRS
    # is different than layer's CRS
    for p in route:
        rb.addPoint(p)


And here is the same sample but using the :meth:`dijkstra()
<qgis.analysis.QgsGraphAnalyzer.dijkstra>` method

.. testcode:: network_analysis

    from qgis.core import *
    from qgis.gui import *
    from qgis.analysis import *

    from qgis.PyQt.QtCore import *
    from qgis.PyQt.QtGui import *

    vectorLayer = QgsVectorLayer('testdata/network.gpkg|layername=network_lines', 'lines')
    director = QgsVectorLayerDirector(vectorLayer, -1, '', '', '', QgsVectorLayerDirector.DirectionBoth)
    strategy = QgsNetworkDistanceStrategy()
    director.addStrategy(strategy)

    builder = QgsGraphBuilder(vectorLayer.sourceCrs())

    startPoint = QgsPointXY(1179661.925139,5419188.074362)
    endPoint = QgsPointXY(1180942.970617,5420040.097560)

    tiedPoints = director.makeGraph(builder, [startPoint, endPoint])
    tStart, tStop = tiedPoints

    graph = builder.graph()
    idxStart = graph.findVertex(tStart)
    idxEnd = graph.findVertex(tStop)

    (tree, costs) = QgsGraphAnalyzer.dijkstra(graph, idxStart, 0)

    if tree[idxEnd] == -1:
        raise Exception('No route!')

    # Total cost
    cost = costs[idxEnd]

    # Add last point
    route = [graph.vertex(idxEnd).point()]

    # Iterate the graph
    while idxEnd != idxStart:
        idxEnd = graph.edge(tree[idxEnd]).fromVertex()
        route.insert(0, graph.vertex(idxEnd).point())

    # Display
    rb = QgsRubberBand(iface.mapCanvas())
    rb.setColor(Qt.red)

    # This may require coordinate transformation if project's CRS
    # is different than layer's CRS
    for p in route:
        rb.addPoint(p)


Areas of availability
---------------------

The area of availability for vertex A is the subset of graph vertexes that are
accessible from vertex A and the cost of the paths from A to these vertexes are
not greater that some value.

More clearly this can be shown with the following example: "There is a fire
station. Which parts of city can a fire truck reach in 5 minutes? 10 minutes?
15 minutes?". Answers to these questions are fire station's areas of
availability.

To find the areas of availability we can use the :meth:`dijkstra()
<qgis.analysis.QgsGraphAnalyzer.dijkstra>` method of the :class:`QgsGraphAnalyzer
<qgis.analysis.QgsGraphAnalyzer>` class. It is enough to compare the elements of
the cost array with a predefined value. If cost[i] is less than or equal to a
predefined value, then vertex i is inside the area of availability, otherwise
it is outside.

A more difficult problem is to get the borders of the area of availability.
The bottom border is the set of vertexes that are still accessible, and the top
border is the set of vertexes that are not accessible. In fact this is simple:
it is the availability border based on the edges of the shortest path tree for
which the source vertex of the edge is accessible and the target vertex of the
edge is not.

Here is an example

.. testcode:: network_analysis

    director = QgsVectorLayerDirector(vectorLayer, -1, '', '', '', QgsVectorLayerDirector.DirectionBoth)
    strategy = QgsNetworkDistanceStrategy()
    director.addStrategy(strategy)
    builder = QgsGraphBuilder(vectorLayer.crs())


    pStart = QgsPointXY(1179661.925139, 5419188.074362)
    delta = iface.mapCanvas().getCoordinateTransform().mapUnitsPerPixel() * 1

    rb = QgsRubberBand(iface.mapCanvas())
    rb.setColor(Qt.green)
    rb.addPoint(QgsPointXY(pStart.x() - delta, pStart.y() - delta))
    rb.addPoint(QgsPointXY(pStart.x() + delta, pStart.y() - delta))
    rb.addPoint(QgsPointXY(pStart.x() + delta, pStart.y() + delta))
    rb.addPoint(QgsPointXY(pStart.x() - delta, pStart.y() + delta))

    tiedPoints = director.makeGraph(builder, [pStart])
    graph = builder.graph()
    tStart = tiedPoints[0]

    idStart = graph.findVertex(tStart)

    (tree, cost) = QgsGraphAnalyzer.dijkstra(graph, idStart, 0)

    upperBound = []
    r = 1500.0
    i = 0
    tree.reverse()

    while i < len(cost):
        if cost[i] > r and tree[i] != -1:
            outVertexId = graph.edge(tree [i]).toVertex()
            if cost[outVertexId] < r:
                upperBound.append(i)
        i = i + 1

    for i in upperBound:
        centerPoint = graph.vertex(i).point()
        rb = QgsRubberBand(iface.mapCanvas())
        rb.setColor(Qt.red)
        rb.addPoint(QgsPointXY(centerPoint.x() - delta, centerPoint.y() - delta))
        rb.addPoint(QgsPointXY(centerPoint.x() + delta, centerPoint.y() - delta))
        rb.addPoint(QgsPointXY(centerPoint.x() + delta, centerPoint.y() + delta))
        rb.addPoint(QgsPointXY(centerPoint.x() - delta, centerPoint.y() + delta))
