.. highlight:: python
   :linenothreshold: 5

.. testsetup:: cheat_sheet

    iface = start_qgis()

    # Mock toolbar

    from qgis.PyQt.QtWidgets import (
        QToolBar,
    )

    toolbar = QToolBar()
    for i in range(5):
        toolbar.addAction('action%s' % i)

    iface.attributesToolBar.return_value = toolbar

.. _cheat-sheet:

**********************
Cheat sheet for PyQGIS
**********************

.. hint:: The code snippets on this page need the following imports if you're outside the pyqgis console:

  .. testcode:: cheat_sheet

    from qgis.PyQt.QtCore import (
        QRectF,
    )

    from qgis.core import (
        Qgis,
        QgsProject,
        QgsLayerTreeModel,
    )

    from qgis.gui import (
        QgsLayerTreeView,
    )

.. only:: html

   .. contents::
      :local:


User Interface
==============


**Change Look & Feel**

.. testcode:: cheat_sheet

    from qgis.PyQt.QtWidgets import QApplication

    app = QApplication.instance()
    app.setStyleSheet(".QWidget {color: blue; background-color: yellow;}")
    # You can even read the stylesheet from a file
    with  open("testdata/file.qss") as qss_file_content:
        app.setStyleSheet(qss_file_content.read())

**Change icon and title**

.. testcode:: cheat_sheet

    from qgis.PyQt.QtGui import QIcon

    icon = QIcon("/path/to/logo/file.png")
    iface.mainWindow().setWindowIcon(icon)
    iface.mainWindow().setWindowTitle("My QGIS")

Settings
========

**Get QgsSettings list**

.. testcleanup:: cheat_sheet

    QgsSettings().clear()

.. testcode:: cheat_sheet

    from qgis.core import QgsSettings

    qs = QgsSettings()

    for k in sorted(qs.allKeys()):
        print (k)

.. testoutput:: cheat_sheet
  :hide:

  ...

Toolbars
========

**Remove toolbar**

.. testcode:: cheat_sheet

    toolbar = iface.helpToolBar()
    parent = toolbar.parentWidget()
    parent.removeToolBar(toolbar)

    # and add again
    parent.addToolBar(toolbar)

**Remove actions toolbar**


.. testcode:: cheat_sheet

    actions = iface.attributesToolBar().actions()
    iface.attributesToolBar().clear()
    iface.attributesToolBar().addAction(actions[4])
    iface.attributesToolBar().addAction(actions[3])

Menus
=====

**Remove menu**

.. testcode:: cheat_sheet

    # for example Help Menu
    menu = iface.helpMenu()
    menubar = menu.parentWidget()
    menubar.removeAction(menu.menuAction())

    # and add again
    menubar.addAction(menu.menuAction())

Canvas
======

**Access canvas**

.. testcode:: cheat_sheet

    canvas = iface.mapCanvas()

**Change canvas color**

.. testcode:: cheat_sheet

    from qgis.PyQt.QtCore import Qt

    iface.mapCanvas().setCanvasColor(Qt.black)
    iface.mapCanvas().refresh()

**Map Update interval**

.. testcode::

    from qgis.core import QgsSettings
    # Set milliseconds (150 milliseconds)
    QgsSettings().setValue("/qgis/map_update_interval", 150)

Layers
======

**Add vector layer**

.. testcode:: cheat_sheet

    layer = iface.addVectorLayer("testdata/airports.shp", "layer name you like", "ogr")
    if not layer or not layer.isValid():
        print("Layer failed to load!")

**Get active layer**

.. testcode:: cheat_sheet

    layer = iface.activeLayer()

**List all layers**

.. testcode::

    from qgis.core import QgsProject

    QgsProject.instance().mapLayers().values()

**Obtain layers name**

.. testcode:: cheat_sheet

    from qgis.core import QgsVectorLayer
    layer = QgsVectorLayer("Point?crs=EPSG:4326", "layer name you like", "memory")
    QgsProject.instance().addMapLayer(layer)

    layers_names = []
    for layer in QgsProject.instance().mapLayers().values():
        layers_names.append(layer.name())

    print("layers TOC = {}".format(layers_names))

.. testoutput:: cheat_sheet

   layers TOC = ['layer name you like']

Otherwise

.. testcode:: cheat_sheet

    layers_names = [layer.name() for layer in QgsProject.instance().mapLayers().values()]
    print("layers TOC = {}".format(layers_names))

.. testoutput:: cheat_sheet

   layers TOC = ['layer name you like']

**Find layer by name**

.. testcode:: cheat_sheet

    from qgis.core import QgsProject

    layer = QgsProject.instance().mapLayersByName("layer name you like")[0]
    print(layer.name())

.. testoutput:: cheat_sheet

   layer name you like

**Set active layer**

.. testcode:: cheat_sheet

    from qgis.core import QgsProject

    layer = QgsProject.instance().mapLayersByName("layer name you like")[0]
    iface.setActiveLayer(layer)

**Refresh layer at interval**

.. testcode:: cheat_sheet

    from qgis.core import QgsProject

    layer = QgsProject.instance().mapLayersByName("layer name you like")[0]
    # Set seconds (5 seconds)
    layer.setAutoRefreshInterval(5000)
    # Enable data reloading
    layer.setAutoRefreshMode(Qgis.AutoRefreshMode.ReloadData)

**Show methods**

.. testcode:: cheat_sheet

    dir(layer)

**Adding new feature with feature form**

.. testcode:: cheat_sheet

    from qgis.core import QgsFeature, QgsGeometry

    feat = QgsFeature()
    geom = QgsGeometry()
    feat.setGeometry(geom)
    feat.setFields(layer.fields())

    iface.openFeatureForm(layer, feat, False)

**Adding new feature without feature form**


.. testcode:: cheat_sheet

    from qgis.core import QgsGeometry, QgsPointXY, QgsFeature

    pr = layer.dataProvider()
    feat = QgsFeature()
    feat.setGeometry(QgsGeometry.fromPointXY(QgsPointXY(10,10)))
    pr.addFeatures([feat])

**Get features**

.. testcode:: cheat_sheet

    for f in layer.getFeatures():
        print (f)

.. testoutput:: cheat_sheet

    <qgis._core.QgsFeature object at 0x7f45cc64b678>

**Get selected features**

.. testcode:: cheat_sheet

    for f in layer.selectedFeatures():
        print (f)

**Get selected features Ids**

.. testcode:: cheat_sheet

    selected_ids = layer.selectedFeatureIds()
    print(selected_ids)

.. testoutput:: cheat_sheet
   :hide:

   []

**Create a memory layer from selected features Ids**

.. testcode:: cheat_sheet

    from qgis.core import QgsFeatureRequest

    memory_layer = layer.materialize(QgsFeatureRequest().setFilterFids(layer.selectedFeatureIds()))
    QgsProject.instance().addMapLayer(memory_layer)

**Get geometry**

.. testcode:: cheat_sheet

    # Point layer
    for f in layer.getFeatures():
        geom = f.geometry()
        print ('%f, %f' % (geom.asPoint().y(), geom.asPoint().x()))

.. testoutput:: cheat_sheet

    10.000000, 10.000000

**Move geometry**


.. testcode:: cheat_sheet

    from qgis.core import QgsFeature, QgsGeometry
    poly = QgsFeature()
    geom = QgsGeometry.fromWkt("POINT(7 45)")
    geom.translate(1, 1)
    poly.setGeometry(geom)
    print(poly.geometry())

.. testoutput:: cheat_sheet

    <QgsGeometry: Point (8 46)>

**Set the CRS**

.. testcode:: cheat_sheet

    from qgis.core import QgsProject, QgsCoordinateReferenceSystem

    for layer in QgsProject.instance().mapLayers().values():
        layer.setCrs(QgsCoordinateReferenceSystem('EPSG:4326'))

**See the CRS**

.. testcode:: cheat_sheet

    from qgis.core import QgsProject

    for layer in QgsProject.instance().mapLayers().values():
        crs = layer.crs().authid()
        layer.setName('{} ({})'.format(layer.name(), crs))

**Hide a field column**

.. testcode:: cheat_sheet

    from qgis.core import QgsEditorWidgetSetup

    def fieldVisibility (layer,fname):
        setup = QgsEditorWidgetSetup('Hidden', {})
        for i, column in enumerate(layer.fields()):
            if column.name()==fname:
                layer.setEditorWidgetSetup(idx, setup)
                break
            else:
                continue

**Layer from WKT**

.. testcode:: cheat_sheet

    from qgis.core import QgsVectorLayer, QgsFeature, QgsGeometry, QgsProject

    layer = QgsVectorLayer('Polygon?crs=epsg:4326', 'Mississippi', 'memory')
    pr = layer.dataProvider()
    poly = QgsFeature()
    geom = QgsGeometry.fromWkt("POLYGON ((-88.82 34.99,-88.09 34.89,-88.39 30.34,-89.57 30.18,-89.73 31,-91.63 30.99,-90.87 32.37,-91.23 33.44,-90.93 34.23,-90.30 34.99,-88.82 34.99))")
    poly.setGeometry(geom)
    pr.addFeatures([poly])
    layer.updateExtents()
    QgsProject.instance().addMapLayers([layer])

**Load all vector layers from GeoPackage**

.. testcode:: cheat_sheet

    from qgis.core import QgsDataProvider

    fileName = "testdata/sublayers.gpkg"
    layer = QgsVectorLayer(fileName, "test", "ogr")
    subLayers = layer.dataProvider().subLayers()

    for subLayer in subLayers:
        name = subLayer.split(QgsDataProvider.SUBLAYER_SEPARATOR)[1]
        uri = "%s|layername=%s" % (fileName, name,)
        # Create layer
        sub_vlayer = QgsVectorLayer(uri, name, 'ogr')
        # Add layer to map
        QgsProject.instance().addMapLayer(sub_vlayer)

**Load tile layer (XYZ-Layer)**

.. testcode:: cheat_sheet

    from qgis.core import QgsRasterLayer, QgsProject

    def loadXYZ(url, name):
        rasterLyr = QgsRasterLayer("type=xyz&url=" + url, name, "wms")
        QgsProject.instance().addMapLayer(rasterLyr)

    urlWithParams = 'https://tile.openstreetmap.org/%7Bz%7D/%7Bx%7D/%7By%7D.png&zmax=19&zmin=0&crs=EPSG3857'
    loadXYZ(urlWithParams, 'OpenStreetMap')

**Remove all layers**

.. testcode:: cheat_sheet

    QgsProject.instance().removeAllMapLayers()

**Remove all**

.. testcode:: cheat_sheet

    QgsProject.instance().clear()

Table of contents
=================

**Access checked layers**

.. testcode:: cheat_sheet

    iface.mapCanvas().layers()

**Remove contextual menu**

.. testcode:: cheat_sheet

    ltv = iface.layerTreeView()
    mp = ltv.menuProvider()
    ltv.setMenuProvider(None)
    # Restore
    ltv.setMenuProvider(mp)

Advanced TOC
============

**Root node**

.. testcode:: cheat_sheet

    from qgis.core import QgsVectorLayer, QgsProject, QgsLayerTreeLayer

    root = QgsProject.instance().layerTreeRoot()
    node_group = root.addGroup("My Group")

    layer = QgsVectorLayer("Point?crs=EPSG:4326", "layer name you like", "memory")
    QgsProject.instance().addMapLayer(layer, False)

    node_group.addLayer(layer)

    print(root)
    print(root.children())

.. testoutput:: cheat_sheet
   :hide:

   <qgis._core.QgsLayerTree object at 0x7f068bbc0c18>
   [<QgsLayerTreeGroup: My Group>]

**Access the first child node**

.. testcode:: cheat_sheet

    from qgis.core import QgsLayerTreeGroup, QgsLayerTreeLayer, QgsLayerTree

    child0 = root.children()[0]
    print (child0.name())
    print (type(child0))
    print (isinstance(child0, QgsLayerTreeLayer))
    print (isinstance(child0.parent(), QgsLayerTree))

.. testoutput:: cheat_sheet

   My Group
   <class 'qgis._core.QgsLayerTreeGroup'>
   False
   True

**Find groups and nodes**

.. testcode:: cheat_sheet

   from qgis.core import QgsLayerTreeGroup, QgsLayerTreeLayer

   def get_group_layers(group):
      print('- group: ' + group.name())
      for child in group.children():
         if isinstance(child, QgsLayerTreeGroup):
            # Recursive call to get nested groups
            get_group_layers(child)
         else:
            print('  - layer: ' + child.name())


   root = QgsProject.instance().layerTreeRoot()
   for child in root.children():
      if isinstance(child, QgsLayerTreeGroup):
         get_group_layers(child)
      elif isinstance(child, QgsLayerTreeLayer):
         print ('- layer: ' + child.name())

.. testoutput:: cheat_sheet

    - group: My Group
      - layer: layer name you like


**Find group by name**

.. testcode:: cheat_sheet

    print (root.findGroup("My Group"))

.. testoutput:: cheat_sheet

    <QgsLayerTreeGroup: My Group>

**Find layer by id**

.. testcode:: cheat_sheet

    print(root.findLayer(layer.id()))

.. testoutput:: cheat_sheet

    <QgsLayerTreeLayer: layer name you like>

**Add layer**

.. testcode:: cheat_sheet

    from qgis.core import QgsVectorLayer, QgsProject

    layer1 = QgsVectorLayer("Point?crs=EPSG:4326", "layer name you like 2", "memory")
    QgsProject.instance().addMapLayer(layer1, False)
    node_layer1 = root.addLayer(layer1)
    # Remove it
    QgsProject.instance().removeMapLayer(layer1)

**Add group**

.. testcode:: cheat_sheet

    from qgis.core import QgsLayerTreeGroup

    node_group2 = QgsLayerTreeGroup("Group 2")
    root.addChildNode(node_group2)
    QgsProject.instance().mapLayersByName("layer name you like")[0]


**Move loaded layer**

.. testcode:: cheat_sheet

    layer = QgsProject.instance().mapLayersByName("layer name you like")[0]
    root = QgsProject.instance().layerTreeRoot()

    myLayer = root.findLayer(layer.id())
    myClone = myLayer.clone()
    parent = myLayer.parent()

    myGroup = root.findGroup("My Group")
    # Insert in first position
    myGroup.insertChildNode(0, myClone)

    parent.removeChildNode(myLayer)


**Move loaded layer to a specific group**

.. testcode:: cheat_sheet

    QgsProject.instance().addMapLayer(layer, False)

    root = QgsProject.instance().layerTreeRoot()
    myGroup = root.findGroup("My Group")
    myOriginalLayer = root.findLayer(layer.id())
    myLayer = myOriginalLayer.clone()
    myGroup.insertChildNode(0, myLayer)
    parent.removeChildNode(myOriginalLayer)

.. index:: Toggle layers

**Toggling active layer visibility**

.. testcode:: cheat_sheet

  root = QgsProject.instance().layerTreeRoot()
  node = root.findLayer(layer.id())
  new_state = Qt.Checked if node.isVisible() == Qt.Unchecked else Qt.Unchecked
  node.setItemVisibilityChecked(new_state)


**Is group selected**

.. testcode:: cheat_sheet

    def isMyGroupSelected( groupName ):
        myGroup = QgsProject.instance().layerTreeRoot().findGroup( groupName )
        return myGroup in iface.layerTreeView().selectedNodes()

    print(isMyGroupSelected( 'my group name' ))

.. testoutput:: cheat_sheet

    False


**Expand node**

.. testcode:: cheat_sheet

    print(myGroup.isExpanded())
    myGroup.setExpanded(False)

.. testoutput:: cheat_sheet
   :hide:

   True

**Hidden node trick**

.. testcode:: cheat_sheet

    from qgis.core import QgsProject

    model = iface.layerTreeView().layerTreeModel()
    ltv = iface.layerTreeView()
    root = QgsProject.instance().layerTreeRoot()

    layer = QgsProject.instance().mapLayersByName('layer name you like')[0]
    node = root.findLayer(layer.id())

    index = model.node2index( node )
    ltv.setRowHidden( index.row(), index.parent(), True )
    node.setCustomProperty( 'nodeHidden', 'true')
    ltv.setCurrentIndex(model.node2index(root))

**Node signals**

.. testcode:: cheat_sheet

    def onWillAddChildren(node, indexFrom, indexTo):
        print ("WILL ADD", node, indexFrom, indexTo)

    def onAddedChildren(node, indexFrom, indexTo):
        print ("ADDED", node, indexFrom, indexTo)

    root.willAddChildren.connect(onWillAddChildren)
    root.addedChildren.connect(onAddedChildren)

.. testcode:: cheat_sheet
    :hide:

    root.willAddChildren.disconnect(onWillAddChildren)
    root.addedChildren.disconnect(onAddedChildren)

**Remove layer**

.. testcode:: cheat_sheet

    root.removeLayer(layer)

**Remove group**

.. testcode:: cheat_sheet

    root.removeChildNode(node_group2)

**Create new table of contents (TOC)**

.. testcode:: cheat_sheet

    root = QgsProject.instance().layerTreeRoot()
    model = QgsLayerTreeModel(root)
    view = QgsLayerTreeView()
    view.setModel(model)
    view.show()


**Move node**

.. testcode:: cheat_sheet

    cloned_group1 = node_group.clone()
    root.insertChildNode(0, cloned_group1)
    root.removeChildNode(node_group)


**Rename node**

.. testcode:: cheat_sheet
    :hide:

    node_layer1 = cloned_group1.children()[0]

.. testcode:: cheat_sheet

    cloned_group1.setName("Group X")
    node_layer1.setName("Layer X")


Processing algorithms
=====================

**Get algorithms list**

.. testcode:: cheat_sheet

    from qgis.core import QgsApplication

    for alg in QgsApplication.processingRegistry().algorithms():
        if 'buffer' == alg.name():
            print("{}:{} --> {}".format(alg.provider().name(), alg.name(), alg.displayName()))

.. testoutput:: cheat_sheet

    QGIS (native c++):buffer --> Buffer


**Get algorithms help**

Random selection

.. testcode:: cheat_sheet

    from qgis import processing
    processing.algorithmHelp("native:buffer")

.. testoutput:: cheat_sheet

    ...

**Run the algorithm**

For this example, the result is stored in a temporary memory layer
which is added to the project.

.. testcode:: cheat_sheet

    from qgis import processing
    result = processing.run("native:buffer", {'INPUT': layer, 'OUTPUT': 'memory:'})
    QgsProject.instance().addMapLayer(result['OUTPUT'])

.. testoutput:: cheat_sheet

    Processing(0): Results: {'OUTPUT': 'output_d27a2008_970c_4687_b025_f057abbd7319'}

**How many algorithms are there?**

.. testcode:: cheat_sheet

    len(QgsApplication.processingRegistry().algorithms())

**How many providers are there?**

.. testcode:: cheat_sheet

    from qgis.core import QgsApplication

    len(QgsApplication.processingRegistry().providers())

**How many expressions are there?**

.. testcode:: cheat_sheet

    from qgis.core import QgsExpression

    len(QgsExpression.Functions())

Decorators
==========

**CopyRight**

.. testcode:: cheat_sheet

    from qgis.PyQt.Qt import QTextDocument
    from qgis.PyQt.QtGui import QFont

    mQFont = "Sans Serif"
    mQFontsize = 9
    mLabelQString = "© QGIS 2019"
    mMarginHorizontal = 0
    mMarginVertical = 0
    mLabelQColor = "#FF0000"

    INCHES_TO_MM = 0.0393700787402 # 1 millimeter = 0.0393700787402 inches
    case = 2

    def add_copyright(p, text, xOffset, yOffset):
        p.translate( xOffset , yOffset  )
        text.drawContents(p)
        p.setWorldTransform( p.worldTransform() )

    def _on_render_complete(p):
        deviceHeight = p.device().height() # Get paint device height on which this painter is currently painting
        deviceWidth  = p.device().width() # Get paint device width on which this painter is currently painting
        # Create new container for structured rich text
        text = QTextDocument()
        font = QFont()
        font.setFamily(mQFont)
        font.setPointSize(int(mQFontsize))
        text.setDefaultFont(font)
        style = "<style type=\"text/css\"> p {color: " + mLabelQColor + "}</style>"
        text.setHtml( style + "<p>" + mLabelQString + "</p>" )
        # Text Size
        size = text.size()

        # RenderMillimeters
        pixelsInchX  = p.device().logicalDpiX()
        pixelsInchY  = p.device().logicalDpiY()
        xOffset  = pixelsInchX  * INCHES_TO_MM * int(mMarginHorizontal)
        yOffset  = pixelsInchY  * INCHES_TO_MM * int(mMarginVertical)

        # Calculate positions
        if case == 0:
            # Top Left
            add_copyright(p, text, xOffset, yOffset)

        elif case == 1:
            # Bottom Left
            yOffset = deviceHeight - yOffset - size.height()
            add_copyright(p, text, xOffset, yOffset)

        elif case == 2:
            # Top Right
            xOffset  = deviceWidth  - xOffset - size.width()
            add_copyright(p, text, xOffset, yOffset)

        elif case == 3:
            # Bottom Right
            yOffset  = deviceHeight - yOffset - size.height()
            xOffset  = deviceWidth  - xOffset - size.width()
            add_copyright(p, text, xOffset, yOffset)

        elif case == 4:
            # Top Center
            xOffset = deviceWidth / 2
            add_copyright(p, text, xOffset, yOffset)

        else:
            # Bottom Center
            yOffset = deviceHeight - yOffset - size.height()
            xOffset = deviceWidth / 2
            add_copyright(p, text, xOffset, yOffset)

    # Emitted when the canvas has rendered
    iface.mapCanvas().renderComplete.connect(_on_render_complete)
    # Repaint the canvas map
    iface.mapCanvas().refresh()

Composer
==========

**Get print layout by name**

.. testcode:: cheat_sheet

    composerTitle = 'MyComposer' # Name of the composer

    project = QgsProject.instance()
    projectLayoutManager = project.layoutManager()
    layout = projectLayoutManager.layoutByName(composerTitle)

Sources
=======

* :pyqgis:`QGIS Python (PyQGIS) API <>`
* :api:`QGIS C++ API <>`
* `StackOverFlow QGIS questions <https://stackoverflow.com/questions/tagged/qgis>`_
* `Script by Klas Karlsson <https://raw.githubusercontent.com/klakar/QGIS_resources/master/collections/Geosupportsystem/python/qgis_basemaps.py>`_
