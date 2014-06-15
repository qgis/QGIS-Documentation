.. index:: map canvas

.. _canvas:

****************
Using Map Canvas
****************

The Map canvas widget is probably the most important widget within QGIS because
it shows the map composed from overlaid map layers and allows interaction with
the map and layers. The canvas shows always a part of the map defined by the
current canvas extent. The interaction is done through the use of **map tools**:
there are tools for panning, zooming, identifying layers, measuring, vector
editing and others. Similar to other graphics programs, there is always one
tool active and the user can switch between the available tools.


Map canvas is implemented as :class:`QgsMapCanvas` class in :mod:`qgis.gui`
module.  The implementation is based on the Qt Graphics View framework.
This framework generally provides a surface and a view where custom graphics
items are placed and user can interact with them.  We will assume that you are
familiar enough with Qt to understand the concepts of the graphics scene, view
and items. If not, please make sure to read the `overview of the framework
<http://doc.qt.nokia.com/graphicsview.html>`_.

Whenever the map has been panned, zoomed in/out (or some other action triggers
a refresh), the map is rendered again within the current extent. The layers are
rendered to an image (using :class:`QgsMapRenderer` class) and that image is
then displayed in the canvas. The graphics item (in terms of the Qt graphics
view framework) responsible for showing the map is :class:`QgsMapCanvasMap`
class. This class also controls refreshing of the rendered map. Besides this
item which acts as a background, there may be more **map canvas items**.
Typical map canvas items are rubber bands (used for measuring, vector editing
etc.) or vertex markers. The canvas items are usually used to give some visual
feedback for map tools, for example, when creating a new polygon, the map tool
creates a rubber band canvas item that shows the current shape of the polygon.
All map canvas items are subclasses of :class:`QgsMapCanvasItem` which adds
some more functionality to the basic ``QGraphicsItem`` objects.

.. index:: map canvas; architecture

To summarize, the map canvas architecture consists of three concepts:

* map canvas --- for viewing of the map
* map canvas items --- additional items that can be displayed in map canvas
* map tools --- for interaction with map canvas

.. index:: map canvas; embedding

Embedding Map Canvas
====================

Map canvas is a widget like any other Qt widget, so using it is as simple as
creating and showing it::

  canvas = QgsMapCanvas()
  canvas.show()

This produces a standalone window with map canvas. It can be also embedded into
an existing widget or window. When using .ui files and Qt Designer, place a
``QWidget`` on the form and promote it to a new class: set ``QgsMapCanvas`` as
class name and set ``qgis.gui`` as header file. The ``pyuic4`` utility will
take care of it. This is a very convenient way of embedding the canvas. The
other possibility is to manually write the code to construct map canvas and
other widgets (as children of a main window or dialog) and create a layout.

By default, map canvas has black background and does not use anti-aliasing. To
set white background and enable anti-aliasing for smooth rendering::

  canvas.setCanvasColor(Qt.white)
  canvas.enableAntiAliasing(True)

(In case you are wondering, ``Qt`` comes from ``PyQt4.QtCore`` module and
``Qt.white`` is one of the predefined ``QColor`` instances.)

Now it is time to add some map layers. We will first open a layer and add it to
the map layer registry.  Then we will set the canvas extent and set the list of
layers for canvas::

  layer = QgsVectorLayer(path, name, provider)
  if not layer.isValid():
    raise IOError, "Failed to open the layer"

  # add layer to the registry
  QgsMapLayerRegistry.instance().addMapLayer(layer)

  # set extent to the extent of our layer
  canvas.setExtent(layer.extent())

  # set the map canvas layer set
  canvas.setLayerSet( [ QgsMapCanvasLayer(layer) ] )

After executing these commands, the canvas should show the layer you have loaded.

.. index:: map canvas; map tools

Using Map Tools with Canvas
===========================

The following example constructs a window that contains a map canvas and basic
map tools for map panning and zooming.  Actions are created for activation of
each tool: panning is done with :class:`QgsMapToolPan`, zooming in/out with a
pair of :class:`QgsMapToolZoom` instances. The actions are set as checkable and
later assigned to the tools to allow automatic handling of checked/unchecked
state of the actions -- when a map tool gets activated, its action is marked as
selected and the action of the previous map tool is deselected. The map tools
are activated using :func:`setMapTool` method.

::


  from qgis.gui import *
  from PyQt4.QtGui import QAction, QMainWindow
  from PyQt4.QtCore import SIGNAL, Qt, QString

  class MyWnd(QMainWindow):
    def __init__(self, layer):
      QMainWindow.__init__(self)

      self.canvas = QgsMapCanvas()
      self.canvas.setCanvasColor(Qt.white)

      self.canvas.setExtent(layer.extent())
      self.canvas.setLayerSet( [ QgsMapCanvasLayer(layer) ] )

      self.setCentralWidget(self.canvas)
      
      actionZoomIn = QAction(QString("Zoom in"), self)
      actionZoomOut = QAction(QString("Zoom out"), self)
      actionPan = QAction(QString("Pan"), self)
      
      actionZoomIn.setCheckable(True)
      actionZoomOut.setCheckable(True)
      actionPan.setCheckable(True)
      
      self.connect(actionZoomIn, SIGNAL("triggered()"), self.zoomIn)
      self.connect(actionZoomOut, SIGNAL("triggered()"), self.zoomOut)
      self.connect(actionPan, SIGNAL("triggered()"), self.pan)

      self.toolbar = self.addToolBar("Canvas actions")
      self.toolbar.addAction(actionZoomIn)
      self.toolbar.addAction(actionZoomOut)
      self.toolbar.addAction(actionPan)

      # create the map tools
      self.toolPan = QgsMapToolPan(self.canvas)
      self.toolPan.setAction(actionPan)
      self.toolZoomIn = QgsMapToolZoom(self.canvas, False) # false = in
      self.toolZoomIn.setAction(actionZoomIn)
      self.toolZoomOut = QgsMapToolZoom(self.canvas, True) # true = out
      self.toolZoomOut.setAction(actionZoomOut)
      
      self.pan()

    def zoomIn(self):
      self.canvas.setMapTool(self.toolZoomIn)

    def zoomOut(self):
      self.canvas.setMapTool(self.toolZoomOut)

    def pan(self):
      self.canvas.setMapTool(self.toolPan)


You can put the above code to a file, e.g. ``mywnd.py`` and try it out in
Python console within QGIS.  This code will put the currently selected layer
into newly created canvas::

  import mywnd
  w = mywnd.MyWnd(qgis.utils.iface.activeLayer())
  w.show()

Just make sure that the ``mywnd.py`` file is located within Python search path
(``sys.path``). If it isn't, you can simply add it: ``sys.path.insert(0,
'/my/path')`` --- otherwise the import statement will fail, not finding the
module.

.. index:: map canvas; rubber bands, map canvas; vertex markers

Rubber Bands and Vertex Markers
===============================

To show some additional data on top of the map in canvas, use map canvas items.
It is possible to create custom canvas item classes (covered below), however
there are two useful canvas item classes for convenience:
:class:`QgsRubberBand` for drawing polylines or polygons, and
:class:`QgsVertexMarker` for drawing points.  They both work with map
coordinates, so the shape is moved/scaled automatically when the canvas is
being panned or zoomed.

To show a polyline::

  r = QgsRubberBand(canvas, False)  # False = not a polygon
  points = [ QgsPoint(-1,-1), QgsPoint(0,1), QgsPoint(1,-1) ]
  r.setToGeometry(QgsGeometry.fromPolyline(points), None)

To show a polygon::

  r = QgsRubberBand(canvas, True)  # True = a polygon
  points = [ [ QgsPoint(-1,-1), QgsPoint(0,1), QgsPoint(1,-1) ] ]
  r.setToGeometry(QgsGeometry.fromPolygon(points), None)

Note that points for polygon is not a plain list: in fact, it is a list of
rings containing linear rings of the polygon: first ring is the outer border,
further (optional) rings correspond to holes in the polygon.

Rubber bands allow some customization, namely to change their color and line
width::

  r.setColor(QColor(0,0,255))
  r.setWidth(3)

The canvas items are bound to the canvas scene. To temporarily hide them (and
show again, use the :func:`hide` and :func:`show` combo. To completely remove
the item, you have to remove it from the scene of the canvas::

  canvas.scene().removeItem(r)

(in C++ it's possible to just delete the item, however in Python ``del r``
would just delete the reference and the object will still exist as it is owned
by the canvas)

Rubber band can be also used for drawing points, however
:class:`QgsVertexMarker` class is better suited for this
(:class:`QgsRubberBand` would only draw a rectangle around the desired point).
How to use the vertex marker::

  m = QgsVertexMarker(canvas)
  m.setCenter(QgsPoint(0,0))

This will draw a red cross on position [0,0]. It is possible to customize the
icon type, size, color and pen width::

  m.setColor(QColor(0,255,0))
  m.setIconSize(5)
  m.setIconType(QgsVertexMarker.ICON_BOX) # or ICON_CROSS, ICON_X
  m.setPenWidth(3)

For temporary hiding of vertex markers and removing them from canvas, the same
applies as for the rubber bands.

.. index:: map canvas; writing custom map tools

Writing Custom Map Tools
========================

You can write your custom tools, to implement a custom behaviour to actions perfored by users on the canvas.

Map tools should inherit from the :class:`QgsMapTool` class or any derived class, and selected as active tools in the canvas using the :func:`setMapTool` method as we have already seen.

Here is an example of a map tool that allows to define a rectangular extent by clicking and draggin on the canvas. When the rectangle is defined, it prints its boundary coordinates in the console. It uses the rubber band elements described before to show the selected rectangle as it is being defined.

::

  class RectangleMapTool(QgsMapToolEmitPoint):
    def __init__(self, canvas):
        self.canvas = canvas
        QgsMapToolEmitPoint.__init__(self, self.canvas)
        self.rubberBand = QgsRubberBand(self.canvas, QGis.Polygon)
        self.rubberBand.setColor(Qt.red)
        self.rubberBand.setWidth(1)
        self.reset()

    def reset(self):
        self.startPoint = self.endPoint = None
        self.isEmittingPoint = False
        self.rubberBand.reset(QGis.Polygon)

    def canvasPressEvent(self, e):
        self.startPoint = self.toMapCoordinates(e.pos())
        self.endPoint = self.startPoint
        self.isEmittingPoint = True
        self.showRect(self.startPoint, self.endPoint)

    def canvasReleaseEvent(self, e):
        self.isEmittingPoint = False
        r = self.rectangle()
        if r is not None:
          print "Rectangle:", r.xMin(), r.yMin(), r.xMax(), r.yMax()
          
    def canvasMoveEvent(self, e):
        if not self.isEmittingPoint:
          return

        self.endPoint = self.toMapCoordinates( e.pos() )
        self.showRect(self.startPoint, self.endPoint)

    def showRect(self, startPoint, endPoint):
        self.rubberBand.reset(QGis.Polygon)
        if startPoint.x() == endPoint.x() or startPoint.y() == endPoint.y():
          return

        point1 = QgsPoint(startPoint.x(), startPoint.y())
        point2 = QgsPoint(startPoint.x(), endPoint.y())
        point3 = QgsPoint(endPoint.x(), endPoint.y())
        point4 = QgsPoint(endPoint.x(), startPoint.y())

        self.rubberBand.addPoint( point1, False )
        self.rubberBand.addPoint( point2, False )
        self.rubberBand.addPoint( point3, False )
        self.rubberBand.addPoint( point4, True )    # true to update canvas
        self.rubberBand.show()

    def rectangle(self):
        if self.startPoint is None or self.endPoint is None:
          return None
        elif self.startPoint.x() == self.endPoint.x() or self.startPoint.y() == \
          self.endPoint.y():
          return None

        return QgsRectangle(self.startPoint, self.endPoint)

    def deactivate(self):
        QgsMapTool.deactivate(self)
        self.emit(SIGNAL("deactivated()"))

.. index:: map canvas; writing custom canvas items

Writing Custom Map Canvas Items
===============================

**TODO:** how to create a map canvas item



.. TODO - custom application example?
  from qgis.core import QgsApplication
  from qgis.gui import QgsMapCanvas
  import sys
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
