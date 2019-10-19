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

.. code-block:: python

    from qgis.PyQt.QtWidgets import QApplication

    app = QApplication.instance()
    qss_file = open(r"/path/to/style/file.qss").read()
    app.setStyleSheet(qss_file)

**Change icon and title**

.. code-block:: python

    from qgis.PyQt.QtGui import QIcon

    icon = QIcon(r"/path/to/logo/file.png")
    iface.mainWindow().setWindowIcon(icon)  
    iface.mainWindow().setWindowTitle("My QGIS")

Settings
========

**Get QSettings list**

.. testcleanup::
    
    QSettings().clear()
    
.. testcode::

    from qgis.PyQt.QtCore import QSettings

    qs = QSettings()

    for k in sorted(qs.allKeys()):
        print (k)

Toolbars
========

**Remove toolbar**

.. code-block:: python

    from qgis.utils import iface

    toolbar = iface.helpToolBar()   
    parent = toolbar.parentWidget()
    parent.removeToolBar(toolbar)

    # and add again
    parent.addToolBar(toolbar)

**Remove actions toolbar**

.. code-block:: python

    actions = iface.attributesToolBar().actions()
    iface.attributesToolBar().clear()
    iface.attributesToolBar().addAction(actions[4])
    iface.attributesToolBar().addAction(actions[3])

Menus
=====

**Remove menu**

.. code-block:: python

    from qgis.utils import iface

    # for example Help Menu
    menu = iface.helpMenu() 
    menubar = menu.parentWidget()
    menubar.removeAction(menu.menuAction())

    # and add again
    menubar.addAction(menu.menuAction())

Canvas
======

**Access canvas**

.. code-block:: python

    from qgis.utils import iface

    canvas = iface.mapCanvas()

**Change canvas color**

.. code-block:: python

    from qgis.PyQt.QtCore import Qt

    iface.mapCanvas().setCanvasColor(Qt.black)    
    iface.mapCanvas().refresh()

**Map Update interval**

.. testcode::

    from qgis.PyQt.QtCore import QSettings
    # Set milliseconds (150 milliseconds)
    QSettings().setValue("/qgis/map_update_interval", 150)

Layers
======

**Add vector layer**

.. code-block:: python

    from qgis.utils import iface

    layer = iface.addVectorLayer("/path/to/shapefile/file.shp", "layer name you like", "ogr")
    if not layer:
        print("Layer failed to load!")

**Get active layer**

.. code-block:: python

    layer = iface.activeLayer()

**List all layers**

.. testcode::

    from qgis.core import QgsProject

    QgsProject.instance().mapLayers().values()

**Obtain layers name**

.. testcode::

    layers_names = []
    for layer in QgsProject.instance().mapLayers().values():
        layers_names.append(layer.name())

    print("layers TOC = {}".format(layers_names))

.. testoutput::
   :hide:

   layers TOC = ['layer name you like']

Otherwise 

.. testcode::

    layers_names = [layer.name() for layer in QgsProject.instance().mapLayers().values()]
    print("layers TOC = {}".format(layers_names))

.. testoutput::
   :hide:

   layers TOC = ['layer name you like']

**Find layer by name**

.. testcode::

    from qgis.core import QgsProject

    layer = QgsProject.instance().mapLayersByName("layer name you like")[0]
    print(layer.name())

.. testoutput::
   :hide:

   layer name you like

**Set active layer**

.. code-block:: python

    from qgis.core import QgsProject

    layer = QgsProject.instance().mapLayersByName("layer name you like")[0]
    iface.setActiveLayer(layer)

**Refresh layer at interval**

.. testcode::

    from qgis.core import QgsProject

    layer = QgsProject.instance().mapLayersByName("layer name you like")[0]
    # Set seconds (5 seconds)
    layer.setAutoRefreshInterval(5000)
    # Enable auto refresh
    layer.setAutoRefreshEnabled(True)

**Show methods**

.. testcode::

    dir(layer)

**Adding new feature with feature form**

.. code-block:: python

    from qgis.core import QgsFeature, QgsGeometry

    feat = QgsFeature()
    geom = QgsGeometry() 
    feat.setGeometry(geom)
    feat.setFields(layer.fields())

    iface.openFeatureForm(layer, feat, False)

**Adding new feature without feature form**

.. testsetup::

    from qgis.core import QgsFeature, QgsGeometry, QgsProject

.. testcode::

    from qgis.core import QgsPointXY

    pr = layer.dataProvider()
    feat = QgsFeature()
    feat.setGeometry(QgsGeometry.fromPointXY(QgsPointXY(10,10)))
    pr.addFeatures([feat])

**Get features**

.. code-block:: python

    for f in layer.getFeatures():
        print (f)

**Get selected features**

.. code-block:: python

    for f in layer.selectedFeatures():
        print (f)

**Get selected features Ids**

.. testcode::

    selected_ids = layer.selectedFeatureIds()
    print(selected_ids)

.. testoutput::
   :hide:

   []

**Create a memory layer from selected features Ids**

.. testcode::

    from qgis.core import QgsFeatureRequest

    memory_layer = layer.materialize(QgsFeatureRequest().setFilterFids(layer.selectedFeatureIds()))
    QgsProject.instance().addMapLayer(memory_layer)

**Get geometry**

.. code-block:: python

    # Point layer
    for f in layer.getFeatures():
        geom = f.geometry()
        print ('%f, %f' % (geom.asPoint().y(), geom.asPoint().x()))

**Move geometry**

.. code-block:: python

    geom.translate(100, 100)
    poly.setGeometry(geom)

**Set the CRS**

.. testcode::

    from qgis.core import QgsProject, QgsCoordinateReferenceSystem

    for layer in QgsProject.instance().mapLayers().values():
        layer.setCrs(QgsCoordinateReferenceSystem(4326, QgsCoordinateReferenceSystem.EpsgCrsId))

**See the CRS**

.. testcode::

    from qgis.core import QgsProject

    for layer in QgsProject.instance().mapLayers().values():   
        crs = layer.crs().authid()
        layer.setName('{} ({})'.format(layer.name(), crs))
        
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

**Load all layers from GeoPackage**

.. code-block:: python

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

**Remove all layers**

.. testsetup::

    from qgis.core import QgsProject

.. testcode::

    QgsProject.instance().removeAllMapLayers()

**Remove all**

.. code-block:: python

    QgsProject.instance().clear()

Table of contents
=================

**Access checked layers**

.. code-block:: python

    from qgis.utils import iface

    iface.mapCanvas().layers()

**Remove contextual menu**

.. code-block:: python

    ltv = iface.layerTreeView()
    mp = ltv.menuProvider()
    ltv.setMenuProvider(None) 
    # Restore
    ltv.setMenuProvider(mp) 

Advanced TOC
============

.. testsetup::
    
    from qgis.core import QgsVectorLayer, QgsProject, QgsLayerTreeLayer

    layer = QgsVectorLayer("Point?crs=EPSG:4326", "layer name you like", "memory")
    QgsProject.instance().addMapLayer(layer)

    root = QgsProject.instance().layerTreeRoot()
    node_group = root.addGroup("My Group")

**Root node**

.. code-block:: python

    from qgis.core import QgsProject

    root = QgsProject.instance().layerTreeRoot()
    print (root)
    print (root.children())

**Access the first child node**

.. testcode::

    from qgis.core import QgsLayerTreeGroup, QgsLayerTreeLayer, QgsLayerTree

    child0 = root.children()[0]
    print (child0.name())
    print (type(child0))
    print (isinstance(child0, QgsLayerTreeLayer))
    print (isinstance(child0.parent(), QgsLayerTree))

.. testoutput::
   :hide:

   My Group
   <class 'qgis._core.QgsLayerTreeGroup'>
   False
   True

**Find groups and nodes**

.. testcode::

    from qgis.core import QgsLayerTreeGroup, QgsLayerTreeLayer

    for child in root.children():
        if isinstance(child, QgsLayerTreeGroup):
            print ("- group: " + child.name())
        elif isinstance(child, QgsLayerTreeLayer):
            print ("- layer: " + child.name())

.. testoutput::
   :hide:

   - group: My Group


**Find group by name**

.. code-block:: python

    print (root.findGroup("My Group"))

**Find layer by id**

.. code-block:: python

    print (root.findLayer(layer.layerId()))

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

**Remove layer**

.. testcode::

    root.removeLayer(layer1)

**Remove group**

.. testcode::

    root.removeChildNode(node_group2)

**Move node**

.. testcode::

    cloned_group1 = node_group.clone()
    root.insertChildNode(0, cloned_group1)
    root.removeChildNode(node_group)

**Rename node**

.. code-block:: python

    cloned_group1.setName("Group X")
    node_layer1.setName("Layer X")

**Move loaded layer**

.. code-block:: python

    layer = QgsProject.instance().mapLayersByName("layer name you like")[0]
    root = QgsProject.instance().layerTreeRoot()

    mylayer = root.findLayer(layer.id())
    myClone = mylayer.clone()
    parent = mylayer.parent()

    group = root.findGroup("My Group")
    # Insert in first position
    group.insertChildNode(0, myClone)

    parent.removeChildNode(mylayer)

**Load layer in a specific group**

.. code-block:: python

    QgsProject.instance().addMapLayer(layer, False)

    root = QgsProject.instance().layerTreeRoot()
    g = root.findGroup("My Group")
    g.insertChildNode(0, QgsLayerTreeLayer(layer))

**Changing visibility**

.. code-block:: python

    print (cloned_group1.isVisible())
    cloned_group1.setItemVisibilityChecked(False)
    node_layer1.setItemVisibilityChecked(False)

**Is group selected**

.. code-block:: python

    def isMyGroupSelected( groupName ):
        myGroup = QgsProject.instance().layerTreeRoot().findGroup( groupName )        
        return myGroup in iface.layerTreeView().selectedNodes()

    print (isMyGroupSelected( 'my group name' ))

**Expand node**

.. testcode::

    print (cloned_group1.isExpanded())
    cloned_group1.setExpanded(False)

.. testoutput::
   :hide:
   
   True

**Hidden node trick**

.. code-block:: python

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

.. code-block:: python

    def onWillAddChildren(node, indexFrom, indexTo):
        print ("WILL ADD", node, indexFrom, indexTo)

    def onAddedChildren(node, indexFrom, indexTo):
        print ("ADDED", node, indexFrom, indexTo)

    root.willAddChildren.connect(onWillAddChildren)
    root.addedChildren.connect(onAddedChildren)

**Create new table of contents (TOC)**

.. code-block:: python

    from qgis.core import QgsProject, QgsLayerTreeModel
    from qgis.gui import QgsLayerTreeView 
    
    root = QgsProject.instance().layerTreeRoot()
    model = QgsLayerTreeModel(root)
    view = QgsLayerTreeView()
    view.setModel(model)
    view.show()

Processing algorithms
=====================

**Get algorithms list**

.. testcode::

    from qgis.core import QgsApplication

    for alg in QgsApplication.processingRegistry().algorithms():
        print("{}:{} --> {}".format(alg.provider().name(), alg.name(), alg.displayName()))

Otherwise 

.. testcode::

    def alglist():
        s = ''
        for i in QgsApplication.processingRegistry().algorithms():
            l = i.displayName().ljust(50, "-")
            r = i.id()
            s += '{}--->{}\n'.format(l, r)
        print(s)

**Get algorithms help**

Random selection

.. code-block:: python

    from qgis import processing

    processing.algorithmHelp("qgis:randomselection")

**Run the algorithm**

For this example, the result is stored in a temporary memory layer
which is added to the project.

.. code-block:: python

    from qgis import processing
    result = processing.run("native:buffer", {'INPUT': layer, 'OUTPUT': 'memory:'})
    QgsProject.instance().addMapLayer(result['OUTPUT'])


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

Decorators
==========

**CopyRight**

.. code-block:: python

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

    def add_copyright(p, text, x_offset, y_offset):
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

.. testcode::

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
* `Boundless lib-qgis-common repository <https://github.com/boundlessgeo/lib-qgis-commons>`_
