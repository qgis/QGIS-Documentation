.. only:: html

   |updatedisclaimer|

.. _cheat-sheet:

**********************
Cheat sheet for PyQGIS
**********************

.. only:: html

   .. contents::
      :local:

User Interface
==============

**Change Look & Feel**

.. testcode::

    from qgis.PyQt.QtWidgets import QApplication

    app = QApplication.instance()
    qss_file = open(r"/path/to/style/file.qss").read()
    app.setStyleSheet(qss_file)

**Change icon and title**

.. testcode::

    from qgis.PyQt.QtGui import QIcon

    icon = QIcon(r"/path/to/logo/file.png")
    iface.mainWindow().setWindowIcon(icon)  
    iface.mainWindow().setWindowTitle("My QGIS")

Canvas
======

**Access canvas**

.. testcode::

    from qgis.utils import iface

    canvas = iface.mapCanvas()

**Change canvas color**

.. testcode::

    from qgis.PyQt.QtCore import Qt

    iface.mapCanvas().setCanvasColor(Qt.black)    
    iface.mapCanvas().refresh()

Decorators
==========

**CopyRight**

.. testcode::

    from qgis.PyQt.Qt import QTextDocument
    from qgis.PyQt.QtGui import QFont

    mQFont = "Sans Serif"
    mQFontsize = 9
    mLabelQString = "© QGIS 2019"
    mMarginHorizontal = 0
    mMarginVertical = 0
    mLabelQColor = "#FF0000"

    INCHES_TO_MM = 0.0393700787402
    case = 2

   def add_copyright(p, text, x_offset, y_offset):
        p.translate( xOffset , yOffset  )
        text.drawContents(p)
        p.setWorldTransform( p.worldTransform() )

    def _on_render_complete(p):
        deviceHeight = p.device().height()
        deviceWidth  = p.device().width()
        text = QTextDocument()
        font = QFont()
        font.setFamily(mQFont)
        font.setPointSize(int(mQFontsize))
        text.setDefaultFont(font)
        style = "<style type=\"text/css\"> p {color: " + mLabelQColor + "}</style>"
        text.setHtml( style + "<p>" + mLabelQString + "</p>" )
        size = text.size()

        # RenderMillimeters
        pixelsInchX  = p.device().logicalDpiX()
        pixelsInchY  = p.device().logicalDpiY()
        xOffset  = pixelsInchX  * INCHES_TO_MM * int(mMarginHorizontal)
        yOffset  = pixelsInchY  * INCHES_TO_MM * int(mMarginVertical)

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


    iface.mapCanvas().renderComplete.connect(_on_render_complete)
    iface.mapCanvas().refresh()

Processing algorithms
=====================

**Get algorithms list**

.. testcode::

    from qgis.core import QgsApplication

    for alg in QgsApplication.processingRegistry().algorithms():
        print("{}:{} --> {}".format(alg.provider().name(), alg.name(), alg.displayName()))

    # or 

    def alglist():
        s = ''
        for i in QgsApplication.processingRegistry().algorithms():
            l = i.displayName().ljust(50, "-")
            r = i.id()
            s += '{}--->{}\n'.format(l, r)
        print(s)

    alglist()

**Get algorithms help**

Random selection

.. testcode::

    import processing

    processing.algorithmHelp("qgis:randomselection")

**How many algorithms are there?**

.. testcode::

    from qgis.core import QgsApplication

    len(QgsApplication.processingRegistry().algorithms())

**How many providers are there?**

.. testcode::

    from qgis.core import QgsApplication

    len(QgsApplication.processingRegistry().providers())

**How many expressions are there?**

.. testcode::

    from qgis.core import QgsExpression

    len(QgsExpression.Functions()) 

Table of contents
=================

**Access checked layers**

.. testcode::

    from qgis.utils import iface

    iface.mapCanvas().layers()

**Obtain layers name**

.. testcode::

    canvas = iface.mapCanvas()
    layers = [canvas.layer(i) for i in range(canvas.layerCount())]
    layers_names = [ layer.name() for layer in layers ]
    print("layers TOC = ", layers_names)

    # or

    layers = [layer for layer in QgsProject.instance().mapLayers().values()]

**Add vector layer**

.. testcode::

    layer = iface.addVectorLayer("/path/to/shapefile/file.shp", "layer name you like", "ogr")
    if not layer:
        print("Layer failed to load!")

**Find layer by name**

.. testcode::

    from qgis.core import QgsProject

    layer = QgsProject.instance().mapLayersByName("layer name you like")[0]
    print(layer.name())

**Set active layer**

.. testcode::

    from qgis.core import QgsProject

    layer = QgsProject.instance().mapLayersByName("layer name you like")[0]
    iface.setActiveLayer(layer)

**Remove all layers**

.. testcode::

    from qgis.core import QgsProject

    QgsProject.instance().removeAllMapLayers()

**Remove contextual menu**

.. testcode::

    ltv = iface.layerTreeView()
    ltv.setMenuProvider( None ) 

**See the CRS**

.. testcode::

    from qgis.core import QgsProject

    for layer in QgsProject().instance().mapLayers().values():   
        crs = layer.crs().authid()
        layer.setName('{} ({})'.format(layer.name(), crs))

**Set the CRS**

.. testcode::

    from qgis.core import QgsProject, QgsCoordinateReferenceSystem

    for layer in QgsProject().instance().mapLayers().values():
        layer.setCrs(QgsCoordinateReferenceSystem(4326, QgsCoordinateReferenceSystem.EpsgCrsId))

**Load all Layers from GeoPackage**

.. testcode::

    from qgis.core import QgsVectorLayer, QgsProject

    fileName = "/path/to/gpkg/file.gpkg"
    layer = QgsVectorLayer(fileName,"test","ogr")
    subLayers =layer.dataProvider().subLayers()

    for subLayer in subLayers:
        name = subLayer.split('!!::!!')[1]
        uri = "%s|layername=%s" % (fileName, name,)
        # Create layer
        sub_vlayer = QgsVectorLayer(uri, name, 'ogr')
        # Add layer to map
        QgsProject.instance().addMapLayer(sub_vlayer)

**Load tile layer (XYZ-Layer)**

.. testcode::

    from qgis.core import QgsRasterLayer, QgsProject

    def loadXYZ(url, name):
        rasterLyr = QgsRasterLayer("type=xyz&url=" + url, name, "wms")
        QgsProject.instance().addMapLayer(rasterLyr)

    urlWithParams = 'type=xyz&url=https://a.tile.openstreetmap.org/%7Bz%7D/%7Bx%7D/%7By%7D.png&zmax=19&zmin=0&crs=EPSG3857'
    loadXYZ(urlWithParams, 'OpenStreetMap')

Advanced TOC
============

**Root node**

.. testcode::

    from qgis.core import QgsProject

    root = QgsProject.instance().layerTreeRoot()
    print (root)
    print (root.children())

**Access the first child node**

.. testcode::

    child0 = root.children()[0]
    print (child0)
    print (type(child0))
    print (isinstance(child0, QgsLayerTreeLayer))
    print (child0.parent())

**Find groups and nodes**

.. testcode::

    from qgis.core import QgsLayerTreeGroup, QgsLayerTreeLayer

    for child in root.children():
        if isinstance(child, QgsLayerTreeGroup):
            print ("- group: " + child.name())
        elif isinstance(child, QgsLayerTreeLayer):
            print ("- layer: " + child.name() + "  ID: " + child.layerId())

**Find group by name**

.. testcode::

    print (root.findGroup("Name"))

**Add layer**

.. testcode::

    from qgis.core import QgsVectorLayer, QgsProject

    layer1 = QgsVectorLayer("Point?crs=EPSG:4326", "layer name you like", "memory")
    QgsProject.instance().addMapLayer(layer1, False)
    node_layer1 = root.addLayer(layer1)

**Add group**

.. testcode::

    from qgis.core import QgsLayerTreeGroup

    node_group2 = QgsLayerTreeGroup("Group 2")
    root.addChildNode(node_group2)

**Add node**

.. testcode::

    root.removeChildNode(node_group2) root.removeLayer(layer1)

**Move node**

.. testcode::

    cloned_group1 = node_group1.clone()
    root.insertChildNode(0, cloned_group1)
    root.removeChildNode(node_group1)

**Rename none**

.. testcode::

    node_group1.setName("Group X")
    node_layer2.setName("Layer X")

**Changing visibility**

.. testcode::

    print (node_group1.isVisible())
    node_group1.setItemVisibilityChecked(False)
    node_layer2.setItemVisibilityChecked(False)

**Expand node**

.. testcode::

    print (node_group1.isExpanded())
    node_group1.setExpanded(False)

**Hidden node trick**

.. testcode::

    from qgis.core import QgsProject

    model = iface.layerTreeView().layerTreeModel()
    ltv = iface.layerTreeView()
    root = QgsProject.instance().layerTreeRoot()

    layer = QgsProject.instance().mapLayersByName('layer name you like')[0]
    node=root.findLayer( layer.id())

    index = model.node2index( node )
    ltv.setRowHidden( index.row(), index.parent(), True )
    node.setCustomProperty( 'nodeHidden', 'true')
    ltv.setCurrentIndex(model.node2index(root))  

**Node signals**

.. testcode::

    def onWillAddChildren(node, indexFrom, indexTo):
        print ("WILL ADD", node, indexFrom, indexTo)

    def onAddedChildren(node, indexFrom, indexTo):
        print ("ADDED", node, indexFrom, indexTo)

    root.willAddChildren.connect(onWillAddChildren)
    root.addedChildren.connect(onAddedChildren)

**Create new table of contents (TOC)**

.. testcode::

    from qgis.core import QgsProject, QgsLayerTreeModel
    from qgis.gui import QgsLayerTreeView 
    
    root = QgsProject.instance().layerTreeRoot()
    model = QgsLayerTreeModel(root)
    view = QgsLayerTreeView()
    view.setModel(model)
    view.show()

Layers
======

**Add vector layer**

.. testcode::

    from qgis.utils import iface

    layer = iface.addVectorLayer("/path/to/shapefile/file.shp", "layer name you like", "ogr")

**Get active Layer**

.. testcode::

    layer = iface.activeLayer()

**List all layers**

.. testcode::

    from qgis.core import QgsProject

    names = [layer.name() for layer in QgsProject.instance().mapLayers().values()]

**Show methods**

.. testcode::

    dir(layer)

**Get features**

.. testcode::

    for f in layer.getFeatures():
        print (f)

**Get geometry**

.. testcode::

    # Point layer
    for f in layer.getFeatures():
        geom = f.geometry()
        print ('%s, %s, %f, %f' % (f['Column X'], f['Column Y'],geom.asPoint().y(), geom.asPoint().x()))

**Hide a field column**

.. testcode::

    from qgis.core import QgsEditorWidgetSetup

    def fieldVisibility (layer,fname):
        setup = QgsEditorWidgetSetup('Hidden', {})
        for i, column in enumerate(layer.fields()):
            if column.name()==fname:
                layer.setEditorWidgetSetup(idx, setup)
                break
            else:
                continue
          

**Move geometry**

.. testcode::

    geom = feat.geometry()
    geom.translate(100, 100)
    feat.setGeometry(geom)

**Adding new feature**

.. testcode::

    from qgis.core import QgsFeature

    iface.openFeatureForm(iface.activeLayer(), QgsFeature(), False)

**Layer from WKT**

.. testcode::

    from qgis.core import QgsVectorLayer, QgsFeature, QgsGeometry, QgsProject

    layer = QgsVectorLayer('Polygon?crs=epsg:4326', 'Mississippi', 'memory')
    pr = layer.dataProvider()
    poly = QgsFeature()
    geom = QgsGeometry.fromWkt("POLYGON ((-88.82 34.99,-88.0934.89,-88.39 30.34,-89.57 30.18,-89.73 31,-91.63 30.99,-90.8732.37,-91.23 33.44,-90.93 34.23,-90.30 34.99,-88.82 34.99))")
    poly.setGeometry(geom)
    pr.addFeatures([poly])
    layer.updateExtents()
    QgsProject.instance().addMapLayers([layer])

Settings
========

**Get QSettings list**

.. testcode::

    from qgis.PyQt.QtCore import QgsSettings

    qs = QgsSettings()

    for k in sorted(qs.allKeys()):
        print (k)

Toolbars
========

**Remove toolbar**

.. testcode::

    from qgis.utils import iface

    toolbar = iface.helpToolBar()   
    parent = toolbar.parentWidget()
    parent.removeToolBar(toolbar)

    # and add again
    parent.addToolBar(toolbar)

**Remove actions toolbar**

.. testcode::

    actions = iface.attributesToolBar().actions()
    iface.attributesToolBar().clear()
    iface.attributesToolBar().addAction(actions[4])
    iface.attributesToolBar().addAction(actions[3])

Menus
=====

**Remove menu**

.. testcode::

    from qgis.utils import iface

    # for example Help Menu
    menu = iface.helpMenu() 
    menubar = menu.parentWidget()
    menubar.removeAction(menu.menuAction())

    # and add again
    menubar.addAction(menu.menuAction())

Sources
=======

https://github.com/boundlessgeo/lib-qgis-commons

https://raw.githubusercontent.com/klakar/QGIS_resources/master/collections/Geosupportsystem/python/qgis_basemaps.py

https://docs.qgis.org/testing/en/docs/pyqgis_developer_cookbook/

https://qgis.org/api/

https://qgis.org/pyqgis/

https://stackoverflow.com/questions/tagged/qgis



.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/3.4 for QGIS 3.4 docs and translations.`

