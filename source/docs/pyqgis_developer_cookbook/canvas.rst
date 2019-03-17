.. only:: html

   |updatedisclaimer|

.. index:: Map canvas

.. _canvas:

********************
Using the Map Canvas
********************

.. warning:: |outofdate|

.. contents::
   :local:

The Map canvas widget is probably the most important widget within QGIS because
it shows the map composed from overlaid map layers and allows interaction with
the map and layers. The canvas always shows a part of the map defined by the
current canvas extent. The interaction is done through the use of **map tools**:
there are tools for panning, zooming, identifying layers, measuring, vector
editing and others. Similar to other graphics programs, there is always one
tool active and the user can switch between the available tools.

The map canvas is implemented with the :class:`QgsMapCanvas <qgis.gui.QgsMapCanvas>` class in the :mod:`qgis.gui`
module. The implementation is based on the Qt Graphics View framework.
This framework generally provides a surface and a view where custom graphics
items are placed and user can interact with them.  We will assume that you are
familiar enough with Qt to understand the concepts of the graphics scene, view
and items. If not, please read the `overview of the framework
<https://doc.qt.io/archives/qt-4.8/graphicsview.html>`_.

Whenever the map has been panned, zoomed in/out (or some other action that triggers
a refresh), the map is rendered again within the current extent. The layers are
rendered to an image (using the :class:`QgsMapRendererJob <qgis.core.QgsMapRendererJob>` class) and that image is
displayed on the canvas. The :class:`QgsMapCanvas <qgis.gui.QgsMapCanvas>` class also controls refreshing
of the rendered map. Besides this item which acts as a background, there may be more **map canvas items**.

Typical map canvas items are rubber bands (used for measuring, vector editing
etc.) or vertex markers. The canvas items are usually used to give visual
feedback for map tools, for example, when creating a new polygon, the map tool
creates a rubber band canvas item that shows the current shape of the polygon.
All map canvas items are subclasses of :class:`QgsMapCanvasItem <qgis.gui.QgsMapCanvasItem>`  which adds
some more functionality to the basic ``QGraphicsItem`` objects.

.. index:: map canvas; architecture

To summarize, the map canvas architecture consists of three concepts:

* map canvas --- for viewing of the map
* map canvas items --- additional items that can be displayed on the map canvas
* map tools --- for interaction with the map canvas

.. index:: Map canvas; Embedding

Embedding Map Canvas
====================

Map canvas is a widget like any other Qt widget, so using it is as simple as
creating and showing it

.. code-block:: python

  canvas = QgsMapCanvas()
  canvas.show()

This produces a standalone window with map canvas. It can be also embedded into
an existing widget or window. When using .ui files and Qt Designer, place a
``QWidget`` on the form and promote it to a new class: set ``QgsMapCanvas`` as
class name and set ``qgis.gui`` as header file. The ``pyuic5`` utility will
take care of it. This is a very convenient way of embedding the canvas. The
other possibility is to manually write the code to construct map canvas and
other widgets (as children of a main window or dialog) and create a layout.

By default, map canvas has black background and does not use anti-aliasing. To
set white background and enable anti-aliasing for smooth rendering

.. code-block:: python

  canvas.setCanvasColor(Qt.white)
  canvas.enableAntiAliasing(True)

(In case you are wondering, ``Qt`` comes from ``PyQt5.QtCore`` module and
``Qt.white`` is one of the predefined ``QColor`` instances.)

Now it is time to add some map layers. We will first open a layer and add it to
the current project. Then we will set the canvas extent and set the list of
layers for canvas

.. code-block:: python

 path_to_ports_layer = os.path.join(QgsProject.instance().homePath(), "data", "ports", "ports.shp")

 vlayer = QgsVectorLayer(path_to_ports_layer, "Ports layer", "ogr")
 if not vlayer.isValid():
     print("Layer failed to load!")

 # add layer to the registry
 QgsProject.instance().addMapLayer(vlayer)

 # set extent to the extent of our layer
 canvas.setExtent(vlayer.extent())

 # set the map canvas layer set
 canvas.setLayers([vlayer])

After executing these commands, the canvas should show the layer you have
loaded.

.. index:: Map canvas; Rubber bands, Map canvas; Vertex markers

Rubber Bands and Vertex Markers
===============================

To show some additional data on top of the map in canvas, use map canvas items.
It is possible to create custom canvas item classes (covered below), however
there are two useful canvas item classes for convenience:
:class:`QgsRubberBand <qgis.gui.QgsRubberBand>` for drawing polylines or polygons, and
:class:`QgsVertexMarker <qgis.gui.QgsVertexMarker>` for drawing points. They both work with map
coordinates, so the shape is moved/scaled automatically when the canvas is
being panned or zoomed.

To show a polyline

.. code-block:: python

  r = QgsRubberBand(canvas, False)  # False = not a polygon
  points = [QgsPoint(-100, 45), QgsPoint(10, 60), QgsPoint(120, 45)]
  r.setToGeometry(QgsGeometry.fromPolyline(points), None)

To show a polygon

.. code-block:: python

  r = QgsRubberBand(canvas, True)  # True = a polygon
  points = [[QgsPointXY(-100, 35), QgsPointXY(10, 50), QgsPointXY(120, 35)]]
  r.setToGeometry(QgsGeometry.fromPolygonXY(points), None)

Note that points for polygon is not a plain list: in fact, it is a list of
rings containing linear rings of the polygon: first ring is the outer border,
further (optional) rings correspond to holes in the polygon.

Rubber bands allow some customization, namely to change their color and line
width

.. code-block:: python

  r.setColor(QColor(0, 0, 255))
  r.setWidth(3)

The canvas items are bound to the canvas scene. To temporarily hide them (and
show them again), use the :func:`hide` and :func:`show` combo. To completely remove
the item, you have to remove it from the scene of the canvas

.. code-block:: python

  canvas.scene().removeItem(r)

(in C++ it's possible to just delete the item, however in Python ``del r``
would just delete the reference and the object will still exist as it is owned
by the canvas)

Rubber band can be also used for drawing points, but the
:class:`QgsVertexMarker <qgis.gui.QgsVertexMarker>` class is better suited for this
(:class:`QgsRubberBand <qgis.gui.QgsRubberBand>` would only draw a rectangle around the desired point).

You can use the vertex marker like this:

.. code-block:: python

  m = QgsVertexMarker(canvas)
  m.setCenter(QgsPointXY(10,40))

This will draw a red cross on position **[10,45]**. It is possible to customize the
icon type, size, color and pen width

.. code-block:: python

  m.setColor(QColor(0, 255, 0))
  m.setIconSize(5)
  m.setIconType(QgsVertexMarker.ICON_BOX) # or ICON_CROSS, ICON_X
  m.setPenWidth(3)

For temporary hiding of vertex markers and removing them from canvas, use the same methods
as for rubber bands.

.. index:: Map canvas; Map tools

Using Map Tools with Canvas
===========================

The following example constructs a window that contains a map canvas and basic
map tools for map panning and zooming. Actions are created for activation of
each tool: panning is done with :class:`QgsMapToolPan <qgis.gui.QgsMapToolPan>`, zooming in/out with a
pair of :class:`QgsMapToolZoom <qgis.gui.QgsMapToolZoom>` instances. The actions are set as checkable and
later assigned to the tools to allow automatic handling of checked/unchecked
state of the actions -- when a map tool gets activated, its action is marked as
selected and the action of the previous map tool is deselected. The map tools
are activated using :meth:`setMapTool() <qgis.gui.QgsMapCanvas.setMapTool>` method.

.. code-block:: python

  from qgis.gui import *
  from PyQt5.QtWidgets import QAction, QMainWindow
  from qgis.PyQt.QtCore import Qt

  class MyWnd(QMainWindow):
      def __init__(self, layer):
          QMainWindow.__init__(self)

          self.canvas = QgsMapCanvas()
          self.canvas.setCanvasColor(Qt.white)

          self.canvas.setExtent(layer.extent())
          self.canvas.setLayers([layer])

          self.setCentralWidget(self.canvas)

          self.actionZoomIn = QAction("Zoom in", self)
          self.actionZoomOut = QAction("Zoom out", self)
          self.actionPan = QAction("Pan", self)

          self.actionZoomIn.setCheckable(True)
          self.actionZoomOut.setCheckable(True)
          self.actionPan.setCheckable(True)

          self.actionZoomIn.triggered.connect(self.zoomIn)
          self.actionZoomOut.triggered.connect(self.zoomOut)
          self.actionPan.triggered.connect(self.pan)

          self.toolbar = self.addToolBar("Canvas actions")
          self.toolbar.addAction(self.actionZoomIn)
          self.toolbar.addAction(self.actionZoomOut)
          self.toolbar.addAction(self.actionPan)

          # create the map tools
          self.toolPan = QgsMapToolPan(self.canvas)
          self.toolPan.setAction(self.actionPan)
          self.toolZoomIn = QgsMapToolZoom(self.canvas, False) # false = in
          self.toolZoomIn.setAction(self.actionZoomIn)
          self.toolZoomOut = QgsMapToolZoom(self.canvas, True) # true = out
          self.toolZoomOut.setAction(self.actionZoomOut)

          self.pan()

      def zoomIn(self):
          self.canvas.setMapTool(self.toolZoomIn)

      def zoomOut(self):
          self.canvas.setMapTool(self.toolZoomOut)

      def pan(self):
          self.canvas.setMapTool(self.toolPan)


You can try the above code in the Python console editor. To invoke the canvas window,
add the following lines to instantiate the ``MyWnd`` class. They will render the currently
selected layer on the newly created canvas

.. code-block:: python

 w = MyWnd(iface.activeLayer())
 w.show()

.. index:: Map canvas; Custom map tools

Writing Custom Map Tools
========================

You can write your custom tools, to implement a custom behavior to actions
performed by users on the canvas.

Map tools should inherit from the :class:`QgsMapTool <qgis.gui.QgsMapTool>`, class or any derived
class, and selected as active tools in the canvas using the :meth:`setMapTool() <qgis.gui.QgsMapCanvas.setMapTool>`
method as we have already seen.

Here is an example of a map tool that allows to define a rectangular extent by
clicking and dragging on the canvas. When the rectangle is defined, it prints
its boundary coordinates in the console. It uses the rubber band elements
described before to show the selected rectangle as it is being defined.

.. code-block:: python

  class RectangleMapTool(QgsMapToolEmitPoint):
    def __init__(self, canvas):
        self.canvas = canvas
        QgsMapToolEmitPoint.__init__(self, self.canvas)
        self.rubberBand = QgsRubberBand(self.canvas, True)
        self.rubberBand.setColor(Qt.red)
        self.rubberBand.setWidth(1)
        self.reset()

    def reset(self):
        self.startPoint = self.endPoint = None
        self.isEmittingPoint = False
        self.rubberBand.reset(True)

    def canvasPressEvent(self, e):
        self.startPoint = self.toMapCoordinates(e.pos())
        self.endPoint = self.startPoint
        self.isEmittingPoint = True
        self.showRect(self.startPoint, self.endPoint)

    def canvasReleaseEvent(self, e):
        self.isEmittingPoint = False
        r = self.rectangle()
        if r is not None:
          print("Rectangle:", r.xMinimum(), r.yMinimum(), r.xMaximum(), r.yMaximum())

    def canvasMoveEvent(self, e):
        if not self.isEmittingPoint:
          return

        self.endPoint = self.toMapCoordinates(e.pos())
        self.showRect(self.startPoint, self.endPoint)

    def showRect(self, startPoint, endPoint):
        self.rubberBand.reset(QGis.Polygon)
        if startPoint.x() == endPoint.x() or startPoint.y() == endPoint.y():
          return

        point1 = QgsPoint(startPoint.x(), startPoint.y())
        point2 = QgsPoint(startPoint.x(), endPoint.y())
        point3 = QgsPoint(endPoint.x(), endPoint.y())
        point4 = QgsPoint(endPoint.x(), startPoint.y())

        self.rubberBand.addPoint(point1, False)
        self.rubberBand.addPoint(point2, False)
        self.rubberBand.addPoint(point3, False)
        self.rubberBand.addPoint(point4, True)    # true to update canvas
        self.rubberBand.show()

    def rectangle(self):
        if self.startPoint is None or self.endPoint is None:
          return None
        elif self.startPoint.x() == self.endPoint.x() or self.startPoint.y() == self.endPoint.y():
          return None

        return QgsRectangle(self.startPoint, self.endPoint)

    def deactivate(self):
        QgsMapTool.deactivate(self)
        self.deactivated.emit()

.. index:: Map canvas; Custom canvas items

Writing Custom Map Canvas Items
===============================

**TODO:**
   how to create a map canvas item


.. TODO - custom application example?

.. code-block:: python

  import sys
  from qgis.core import QgsApplication
  from qgis.gui import QgsMapCanvas

  def init():
    a = QgsApplication(sys.argv, True)
    QgsApplication.setPrefixPath('/home/martin/qgis/inst', True)
    QgsApplication.initQgis()
    return a

  def show_canvas(app):
    canvas = QgsMapCanvas()
    canvas.show()
    app.exec_()
  app = init()
  show_canvas(app)


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |outofdate| replace:: `Despite our constant efforts, information beyond this line may not be updated for QGIS 3. Refer to https://qgis.org/pyqgis/master for the python API documentation or, give a hand to update the chapters you know about. Thanks.`
.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/3.4 for QGIS 3.4 docs and translations.`
