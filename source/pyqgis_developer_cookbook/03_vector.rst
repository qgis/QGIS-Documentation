
.. _vector:

Using Vector Layers
===================

This section summarizes various actions that can be done with vector layers.


.. index:: 
  triple: vector layers; iterating; features

Iterating over Vector Layer
---------------------------

Below is an example how to go through the features of the layer. To read features from layer, initialize the retieval with :func:`select` and then use :func:`nextFeature` calls::

  provider = vlayer.dataProvider()

  feat = QgsFeature()
  allAttrs = provider.attributeIndexes()

  # start data retreival: fetch geometry and all attributes for each feature
  provider.select(allAttrs)

  # retreive every feature with its geometry and attributes
  while provider.nextFeature(feat):

    # fetch geometry
    geom = feat.geometry()
    print "Feature ID %d: " % feat.id() ,

    # show some information about the feature
    if geom.vectorType() == QGis.Point:
      x = geom.asPoint()
      print "Point: " + str(x)
    elif geom.vectorType() == QGis.Line:
      x = geom.asPolyline()
      print "Line: %d points" % len(x)
    elif geom.vectorType() == QGis.Polygon:
      x = geom.asPolygon()
      numPts = 0
      for ring in x:
	numPts += len(ring)
      print "Polygon: %d rings with %d points" % (len(x), numPts)
    else:
      print "Unknown"

    # fetch map of attributes
    attrs = feat.attributeMap()
    
    # attrs is a dictionary: key = field index, value = QgsFeatureAttribute
    # show all attributes and their values
    for (k,attr) in attrs.iteritems():
      print "%d: %s" % (k, attr.toString())


:func:`select` gives you flexibility in what data will be fetched. It can get 4 arguments, all of them are optional:

1. fetchAttributes
	List of attributes which should be fetched. Default: empty list
2. rect
	Spatial filter. If empty rect is given (:obj:`QgsRectangle()`), all features are fetched. Default: empty rect
3. fetchGeometry
	Whether geometry of the feature should be fetched. Default: :const:`True`
4. useIntersect
	When using spatial filter, this argument says whether accurate test for intersection should be done or whether test on bounding box suffices.
	This is needed e.g. for feature identification or selection. Default: :const:`False`

Some examples::

  # fetch features with geometry and only first two fields
  provider.select([0,1])

  # fetch features with geometry which are in specified rect, attributes won't be retreived
  provider.select([], QgsRectangle(23.5, -10, 24.2, -7))

  # fetch features without geometry, with all attributes
  allAtt = provider.attributeIndexes()
  provider.select(allAtt, QgsRectangle(), False)

To obtain field index from its name, use provider's :func:`fieldNameIndex` function::

  fldDesc = provider.fieldNameIndex("DESCRIPTION")
  if fldDesc == -1:
    print "Field not found!"


.. index:: vector layers; editing

.. _editing:

Modifying Vector Layers
-----------------------

Most vector data providers support editing of layer data. Sometimes they support
just a subset of possible editing actions.
Use the :func:`capabilities` function to find out what set of functionality is supported::

  caps = layer.dataProvider().capabilities()

By using any of following methods for vector layer editing, the changes are directly committed to the underlying
data store (a file, database etc). In case you would like to do only temporary changes, skip to the next section
that explains how to do :ref:`modifications with editing buffer <editing-buffer>`.

Add Features
^^^^^^^^^^^^

Create some :class:`QgsFeature` instances and pass a list of them to provider's :func:`addFeatures` method.
It will return two values: result (true/false) and list of added features (their ID is set by the data store)::

  if caps & QgsVectorDataProvider.AddFeatures:
    feat = QgsFeature()
    feat.addAttribute(0,"hello")
    feat.setGeometry(QgsGeometry.fromPoint(QgsPoint(123,456)))
    (res, outFeats) = layer.dataProvider().addFeatures( [ feat ] )
    

Delete Features
^^^^^^^^^^^^^^^

To delete some features, just provide a list of their feature IDs::

  if caps & QgsVectorDataProvider.DeleteFeatures:
    res = layer.dataProvider().deleteFeatures([ 5, 10 ])

Modify Features
^^^^^^^^^^^^^^^

It is possible to either change feature's geometry or to change some attributes. The following example first changes
values of attributes with index 0 and 1, then it changes the feature's geometry::

  fid = 100   # ID of the feature we will modify
  
  if caps & QgsVectorDataProvider.ChangeAttributeValues:
    attrs = { 0 : QVariant("hello"), 1 : QVariant(123) }
    layer.dataProvider().changeAttributeValues({ fid : attrs })
  
  if caps & QgsVectorDataProvider.ChangeGeometries:
    geom = QgsGeometry.fromPoint(QgsPoint(111,222))
    layer.dataProvider().changeGeometryValues({ fid : geom })

Adding and Removing Fields
^^^^^^^^^^^^^^^^^^^^^^^^^^

To add fields (attributes), you need to specify a list of field defnitions.
For deletion of fields just provide a list of field indexes.
::

  if caps & QgsVectorDataProvider.AddAttributes:
    res = layer.dataProvider().addAttributes( [ QgsField("mytext", QVariant.String), QgsField("myint", QVariant.Int) ] )

  if caps & QgsVectorDataProvider.DeleteAttributes:
    res = layer.dataProvider().deleteAttributes( [ 0 ] )


.. _editing-buffer:

Modifying Vector Layers with an Editing Buffer
----------------------------------------------

When editing vectors within QGIS application, you have to first start editing mode for a particular layer,
then do some modifications and finally commit (or rollback) the changes. All the changes you do are
not written until you commit them - they stay in layer's in-memory editing buffer. It is possible to
use this functionality also programmatically - it is just another method for vector layer editing that
complements the direct usage of data providers. Use this option when providing some GUI tools for vector layer
editing, since this will allow user to decide whether to commit/rollback and allows the usage of undo/redo.
When committing changes, all changes from the editing buffer are saved to data provider.

To find out whether a layer is in editing mode, use :func:`isEditing` - the editing functions work only when
the editing mode is turned on. Usage of editing functions::

  # add two features (QgsFeature instances)
  layer.addFeatures([feat1,feat2])
  # delete a feature with specified ID
  layer.deleteFeature(fid)

  # set new geometry (QgsGeometry instance) for a feature
  layer.changeGeometry(fid, geometry)
  # update an attribute with given field index (int) to given value (QVariant)
  layer.changeAttributeValue(fid, fieldIndex, value)

  # add new field
  layer.addAttribute(QgsField("mytext", QVariant.String))
  # remove a field
  layer.deleteAttribute(fieldIndex)

In order to make undo/redo work properly, the above mentioned calls have to be wrapped into undo commands.
(If you do not care about undo/redo and want to have the changes stored immediately, then you will
have easier work by :ref:`editing with data provider <editing>`.) How to use the undo functionality::

  layer.beginEditCommand("Feature triangulation")
  
  # ... call layer's editing methods ...
  
  if problem_occurred:
    layer.destroyEditCommand()
    return
  
  # ... more editing ...
  
  layer.endEditCommand()

The :func:`beginEndCommand` will create an internal "active" command and will record subsequent changes
in vector layer. With the call to :func:`endEditCommand` the command is pushed onto the undo stack
and the user will be able to undo/redo it from GUI. In case something went wrong while doing the changes,
the :func:`destroyEditCommand` method will remove the command and rollback all changes done while this
command was active.


To start editing mode, there is :func:`startEditing`
method, to stop editing there are :func:`commitChanges` and :func:`rollback()` - however normally you should
not need these methods and leave this functionality to be triggered by the user.


.. index:: spatial index; using

Using Spatial Index
-------------------

**TODO:**
   Intro to spatial indexing

1. create spatial index - the following code creates an empty index::

    index = QgsSpatialIndex()

2. add features to index - index takes :class:`QgsFeature` object and adds it to the internal data structure.
   You can create the object manually or use one from previous call to provider's :func:`nextFeature()` ::

      index.insertFeature(feat)

3. once spatial index is filled with some values, you can do some queries::

    # returns array of feature IDs of five nearest features
    nearest = index.nearestNeighbor(QgsPoint(25.4, 12.7), 5)

    # returns array of IDs of features which intersect the rectangle
    intersect = index.intersects(QgsRectangle(22.5, 15.3, 23.1, 17.2))



.. index:: vector layers; writing

Writing Vector Layers
---------------------

You can write vector layer files using :class:`QgsVectorFileWriter` class. It supports any other kind of vector file that OGR supports (shapefiles, GeoJSON, KML and others).

There are two possibilities how to export a vector layer:

* from an instance of :class:`QgsVectorLayer`::

    error = QgsVectorFileWriter.writeAsVectorFormat(layer, "my_shapes.shp", "CP1250", None, "ESRI Shapefile")

    if error == QgsVectorFileWriter.NoError:
      print "success!"

    error = QgsVectorFileWriter.writeAsVectorFormat(layer, "my_json.json", "utf-8", None, "GeoJSON")
    if error == QgsVectorFileWriter.NoError:
      print "success again!"

  Third parameter specifies output text encoding. Only some drivers need this for correct operation - shapefiles are one of those - however in case you are
  not using international characters you do not have to care much about the encoding. The fourth parameter that we left as None may specify destination CRS - if
  a valid instance of :class:`QgsCoordinateReferenceSystem` is passed, the layer is transformed to that CRS.

  For valid driver names please consult the `supported formats by OGR`_ - you should pass the value in "Code" column as the driver name.
  Optionally you can set whether to export only selected features, pass further driver-specific options for creation or tell the writer not to create attributes
  - look into the documentation for full syntax.

.. _supported formats by OGR: http://www.gdal.org/ogr/ogr_formats.html


* directly from features::

    # define fields for feature attributes
    fields = { 0 : QgsField("first", QVariant.Int),
               1 : QgsField("second", QVariant.String) }

    # create an instance of vector file writer, it will create the vector file. Arguments:
    # 1. path to new file (will fail if exists already)
    # 2. encoding of the attributes
    # 3. field map
    # 4. geometry type - from WKBTYPE enum
    # 5. layer's spatial reference (instance of QgsCoordinateReferenceSystem) - optional
    # 6. driver name for the output file
    writer = QgsVectorFileWriter("my_shapes.shp", "CP1250", fields, QGis.WKBPoint, None, "ESRI Shapefile")

    if writer.hasError() != QgsVectorFileWriter.NoError:
      print "Error when creating shapefile: ", writer.hasError()

    # add some features
    fet = QgsFeature()
    fet.setGeometry(QgsGeometry.fromPoint(QgsPoint(10,10)))
    fet.addAttribute(0, QVariant(1))
    fet.addAttribute(1, QVariant("text")) 
    writer.addFeature(fet)

    # delete the writer to flush features to disk (optional)
    del writer

.. index:: memory provider

Memory Provider
---------------

Memory provider is intended to be used mainly by plugin or 3rd party app developers.
It does not store data on disk, allowing developers to use it as a fast backend for some temporary layers.

The provider supports string, int and double fields.

The memory provider also supports spatial indexing, which is enabled by calling the provider's :func:`createSpatialIndex` function.
Once the spatial index is created you will be able to iterate over features within smaller regions faster
(since it's not necessary to traverse all the features, only those in specified rectangle). 

A memory provider is created by passing ``"memory"`` as the provider string to the :class:`QgsVectorLayer` constructor.

The constructor also takes a URI defining the geometry type of the layer, 
one of: ``"Point"``, ``"LineString"``, ``"Polygon"``, ``"MultiPoint"``, ``"MultiLineString"``, or ``"MultiPolygon"``.

From QGIS version 1.7 the URI can also specify the coordinate reference system,
fields, and indexing of the memory provider in the URI.
The syntax is:

crs=definition
    Specifies the coordinate reference system, where definition may be any
    of the forms accepted by :func:`QgsCoordinateReferenceSystem.createFromString`

index=yes
    Specifies that the provider will use a spatial index

field=name:type(length,precision)
    Specifies an attribute of the layer.  The attribute has a name, and 
    optionally a type (integer, double, or string), length, and precision.
    There may be multiple field definitions.

The following example of a URI incorporates all these options::

  "Point?crs=epsg:4326&field=id:integer&field=name:string(20)&index=yes"

The following example code illustrates creating and populating a memory provider::

  # create layer
  vl = QgsVectorLayer("Point", "temporary_points", "memory")
  pr = vl.dataProvider()

  # add fields 
  pr.addAttributes( [ QgsField("name", QVariant.String), 
                      QgsField("age",  QVariant.Int), 
                      QgsField("size", QVariant.Double) ] )

  # add a feature
  fet = QgsFeature()
  fet.setGeometry( QgsGeometry.fromPoint(QgsPoint(10,10)) )
  fet.setAttributeMap( { 0 : QVariant("Johny"), 
                         1 : QVariant(20), 
                         2 : QVariant(0.3) } )
  pr.addFeatures( [ fet ] )

  # update layer's extent when new features have been added
  # because change of extent in provider is not propagated to the layer
  vl.updateExtents()

Finally, let's check whether everything went well::

  # show some stats
  print "fields:", pr.fieldCount()
  print "features:", pr.featureCount()
  e = pr.extent()
  print "extent:", e.xMin(),e.yMin(),e.xMax(),e.yMax()

  # iterate over features
  f = QgsFeature()
  pr.select()
  while pr.nextFeature(f):
    print "F:",f.id(), f.attributeMap(), f.geometry().asPoint()

.. index:: vector layers; symbology

Appearance (Symbology) of Vector Layers
---------------------------------------

When a vector layer is being rendered, the appearance of the data is given by
**renderer** and **symbols** associated with the layer.  Symbols are classes
which take care of drawing of visual representation of features, while
renderers determine what symbol will be used for a particular feature.

In QGIS v1,4 a new vector rendering stack has been introduced in order to
overcome the limitations of the original implementation. We refer to it as new
symbology or symbology-ng (new generation), the original rendering stack is
also called old symbology. Each vector layer uses either new symbology or old
symbology, but never both at once or neither of them. It's not a global setting
for all layers, so some layers might use new symbology while others still use
old symbology. In QGIS options the user can specify what symbology should be
used by default when layers are loaded.  The old symbology will be kept in
further QGIS v1.x releases for compatibility and we plan to remove it in QGIS
v2.0.

How to find out which implementation is currently in use::

  if layer.isUsingRendererV2():
    # new symbology - subclass of QgsFeatureRendererV2 class
    rendererV2 = layer.rendererV2()
  else:
    # old symbology - subclass of QgsRenderer class
    renderer = layer.renderer()


Note: if you plan to support also earlier versions (i.e. QGIS < 1.4), you should first check whether the :func:`isUsingRendererV2` method exists
-- if not, only old symbology is available::

  if not hasattr(layer, 'isUsingRendererV2'):
    print "You have an old version of QGIS"

We are going to focus primarily on new symbology because it has better capabilities are more options for customization.

.. index:: symbology; new

New Symbology
^^^^^^^^^^^^^

Now that we have a reference to a renderer from the previous section, let us explore it a bit::

  print "Type:", rendererV2.type()

There are several known renderer types available in QGIS core library:

=================  =======================================  ===================================================================
Type               Class                                    Description
=================  =======================================  ===================================================================
singleSymbol       :class:`QgsSingleSymbolRendererV2`       Renders all features with the same symbol
categorizedSymbol  :class:`QgsCategorizedSymbolRendererV2`  Renders features using a different symbol for each category
graduatedSymbol    :class:`QgsGraduatedSymbolRendererV2`    Renders features using a different symbol for each range of values
=================  =======================================  ===================================================================

There might be also some custom renderer types, so never make an assumption there are just these types.
You can query :class:`QgsRendererV2Registry` singleton to find out currently available renderers.

It is possible to obtain a dump of a renderer contents in text form - can be useful for debugging::

  print rendererV2.dump()

.. index:: single symbol renderer, symbology; single symbol renderer

Single Symbol Renderer
......................

You can get the symbol used for rendering by calling :func:`symbol` method and change it with :func:`setSymbol` method
(note for C++ devs: the renderer takes ownership of the symbol.)

.. index:: categorized symbology renderer, symbology; categorized symbol renderer

Categorized Symbol Renderer
...........................

You can query and set attribute name which is used for classification: use :func:`classAttribute` and :func:`setClassAttribute` methods.

To get a list of categories::

  for cat in rendererV2.categories():
    print "%s: %s :: %s" % (cat.value().toString(), cat.label(), str(cat.symbol()))

Where :func:`value` is the value used for discrimination between categories, :func:`label` is a text
used for category description and :func:`symbol` method returns assigned symbol.

The renderer usually stores also original symbol and color ramp which were used for the classification:
:func:`sourceColorRamp` and :func:`sourceSymbol` methods.

.. index:: symbology; graduated symbol renderer, graduated symbol renderer

Graduated Symbol Renderer
.........................

This renderer is very similar to the categorized symbol renderer described
above, but instead of one attribute value per class it works with ranges of
values and thus can be used only with numerical attributes.

To find out more about ranges used in the renderer::

  for ran in rendererV2.ranges():
    print "%f - %f: %s %s" % (
        ran.lowerValue(), 
        ran.upperValue(), 
        ran.label(), 
        str(ran.symbol())
        )

you can again use :func:`classAttribute` to find out classification attribute
name, :func:`sourceSymbol` and :func:`sourceColorRamp` methods.  Additionally
there is :func:`mode` method which determines how the ranges were created:
using equal intervals, quantiles or some other method.

If you wish to create your own graduated symbol renderer you can do so as 
illustrated in the example snippet below (which creates a simple two class
arrangement)::

	from qgis.core import  (QgsVectorLayer,
                		QgsMapLayerRegistry,
				QgsGraduatedSymbolRendererV2,
		                QgsSymbolV2,
				QgsRendererRangeV2)

	myVectorLayer = QgsVectorLayer(myVectorPath, myName, 'ogr')
	myTargetField = 'target_field'
	myRangeList = []
	myOpacity = 1
	# Make our first symbol and range...
	myMin = 0.0
	myMax = 50.0
	myLabel = 'Group 1'
	myColour = QtGui.QColor('#ffee00')
	mySymbol1 = QgsSymbolV2.defaultSymbol(
		   myVectorLayer.geometryType())
	mySymbol1.setColor(myColour)
	mySymbol1.setAlpha(myOpacity)
	myRange1 = QgsRendererRangeV2(
		        myMin,
		        myMax,
		        mySymbol1,
		        myLabel)
	myRangeList.append(myRange1)
	#now make another symbol and range...
	myMin = 50.1
	myMax = 100
	myLabel = 'Group 2'
	myColour = QtGui.QColor('#00eeff')
	mySymbol2 = QgsSymbolV2.defaultSymbol(
		   myVectorLayer.geometryType())
	mySymbol2.setColor(myColour)
	mySymbol2.setAlpha(myOpacity)
	myRange2 = QgsRendererRangeV2(
		        myMin,
		        myMax,
		        mySymbol2
		        myLabel)
	myRangeList.append(myRange2)
	myRenderer = QgsGraduatedSymbolRendererV2(
		        '', myRangeList)
	myRenderer.setMode(
		QgsGraduatedSymbolRendererV2.EqualInterval)
	myRenderer.setClassAttribute(myTargetField)

	myVectorLayer.setRendererV2(myRenderer)
	QgsMapLayerRegistry.instance().addMapLayer(myVectorLayer)


.. index:: symbols; working with

Working with Symbols
....................

For representation of symbols, there is :class:`QgsSymbolV2` base class with three derived classes:

 * :class:`QgsMarkerSymbolV2` - for point features
 * :class:`QgsLineSymbolV2` - for line features
 * :class:`QgsFillSymbolV2` - for polygon features

**Every symbol consists of one or more symbol layers** (classes derived from :class:`QgsSymbolLayerV2`).
The symbol layers do the actual rendering, the symbol class itself serves only as a container for the symbol layers.

Having an instance of a symbol (e.g. from a renderer), it is possible to explore it: :func:`type` method says whether it is a marker, line or fill symbol.
There is a :func:`dump` method which returns a brief description of the symbol. To get a list of symbol layers::

  for i in xrange(symbol.symbolLayerCount()):
    lyr = symbol.symbolLayer(i)
    print "%d: %s" % (i, lyr.layerType())

To find out symbol's color use :func:`color` method and :func:`setColor` to change its color.
With marker symbols additionally you can query for the symbol size and rotation with :func:`size` and :func:`angle` methods,
for line symbols there is :func:`width` method returning line width.

Size and width are in millimeters by default, angles are in degrees.

.. index:: symbol layers; working with

Working with Symbol Layers
..........................

As said before, symbol layers (subclasses of :class:`QgsSymbolLayerV2`)
determine the appearance of the features.  There are several basic symbol layer
classes for general use. It is possible to implement new symbol layer types and
thus arbitrarily customize how features will be rendered.
The :func:`layerType` method uniquely identifies the symbol layer class --- the
basic and default ones are SimpleMarker, SimpleLine and SimpleFill symbol
layers types.

You can get a complete list of the types of symbol layers you can create for a
given symbol layer class like this::

  from qgis.core import QgsSymbolLayerV2Registry
  myRegistry = QgsSymbolLayerV2Registry.instance()
  myMetadata = myRegistry.symbolLayerMetadata("SimpleFill")
  for item in myRegistry.symbolLayersForType(QgsSymbolV2.Marker): 
    print item

Output::

  EllipseMarker
  FontMarker
  SimpleMarker
  SvgMarker
  VectorField

:class:`QgsSymbolLayerV2Registry` class manages a database of all available symbol layer types.

To access symbol layer data, use its :func:`properties` method that returns a key-value dictionary of properties which determine the appearance.
Each symbol layer type has a specific set of properties that it uses.
Additionally, there are generic methods :func:`color`, :func:`size`, :func:`angle`, :func:`width` with their setter counterparts.
Of course size and angle is available only for marker symbol layers and width for line symbol layers.

.. index:: symbol layers; creating custom types

Creating Custom Symbol Layer Types
..................................

Imagine you would like to customize the way how the data gets rendered. You can create your own symbol layer class
that will draw the features exactly as you wish. Here is an example of a marker that draws red circles with specified radius::

  class FooSymbolLayer(QgsMarkerSymbolLayerV2):
 
    def __init__(self, radius=4.0):
      QgsMarkerSymbolLayerV2.__init__(self)
      self.radius = radius
      self.color = QColor(255,0,0)
 
    def layerType(self):
      return "FooMarker"
 
    def properties(self):
      return { "radius" : str(self.radius) }
 
    def startRender(self, context):
      pass
 
    def stopRender(self, context):
      pass
 
    def renderPoint(self, point, context):
      # Rendering depends on whether the symbol is selected (Qgis >= 1.5)
      color = context.selectionColor() if context.selected() else self.color
      p = context.renderContext().painter()
      p.setPen(color)
      p.drawEllipse(point, self.radius, self.radius)
 
    def clone(self):
      return FooSymbolLayer(self.radius)


The :func:`layerType` method determines the name of the symbol layer, it has to be unique among all symbol layers.
Properties are used for persistence of attributes. :func:`clone` method must return a copy of the symbol layer with all attributes being exactly the same.
Finally there are rendering methods: :func:`startRender` is called before rendering first feature, :func:`stopRender` when rendering is done.
And :func:`renderPoint` method which does the rendering. The coordinates of the point(s) are already transformed to the output coordinates.

For polylines and polygons the only difference would be in the rendering method: you would use :func:`renderPolyline` which receives a list of lines,
resp. :func:`renderPolygon` which receives list of points on outer ring as a first parameter and a list of inner rings (or None) as a second parameter.

Usually it is convenient to add a GUI for setting attributes of the symbol layer type to allow users to customize the appearance:
in case of our example above we can let user set circle radius. The following code implements such widget::

  class FooSymbolLayerWidget(QgsSymbolLayerV2Widget):
    def __init__(self, parent=None):
      QgsSymbolLayerV2Widget.__init__(self, parent)
 
      self.layer = None
 
      # setup a simple UI
      self.label = QLabel("Radius:")
      self.spinRadius = QDoubleSpinBox()
      self.hbox = QHBoxLayout()
      self.hbox.addWidget(self.label)
      self.hbox.addWidget(self.spinRadius)
      self.setLayout(self.hbox)
      self.connect( self.spinRadius, SIGNAL("valueChanged(double)"), self.radiusChanged)
 
    def setSymbolLayer(self, layer):
      if layer.layerType() != "FooMarker":
        return
      self.layer = layer
      self.spinRadius.setValue(layer.radius)
    
    def symbolLayer(self):
      return self.layer
 
    def radiusChanged(self, value):
      self.layer.radius = value
      self.emit(SIGNAL("changed()"))

This widget can be embedded into the symbol properties dialog. When the symbol layer type is selected in symbol properties dialog,
it creates an instance of the symbol layer and an instance of the symbol layer widget. Then it calls :func:`setSymbolLayer` method
to assign the symbol layer to the widget. In that method the widget should update the UI to reflect the attributes of the symbol layer.
:func:`symbolLayer` function is used to retrieve the symbol layer again by the properties dialog to use it for the symbol.

On every change of attributes, the widget should emit :func:`changed()` signal to let the properties dialog update the symbol preview.

Now we are missing only the final glue: to make QGIS aware of these new classes. This is done by adding the symbol layer to registry.
It is possible to use the symbol layer also without adding it to the registry, but some functionality will not work:
e.g. loading of project files with the custom symbol layers or inability to edit the layer's attributes in GUI.

We will have to create metadata for the symbol layer::

  class FooSymbolLayerMetadata(QgsSymbolLayerV2AbstractMetadata):
 
    def __init__(self):
      QgsSymbolLayerV2AbstractMetadata.__init__(self, "FooMarker", QgsSymbolV2.Marker)
 
    def createSymbolLayer(self, props):
      radius = float(props[QString("radius")]) if QString("radius") in props else 4.0
      return FooSymbolLayer(radius)
 
    def createSymbolLayerWidget(self):
      return FooSymbolLayerWidget()
 
  QgsSymbolLayerV2Registry.instance().addSymbolLayerType( FooSymbolLayerMetadata() )

You should pass layer type (the same as returned by the layer) and symbol type (marker/line/fill) to the constructor of parent class.
:func:`createSymbolLayer` takes care of creating an instance of symbol layer with attributes specified in the `props` dictionary.
(Beware, the keys are QString instances, not "str" objects).
And there is :func:`createSymbolLayerWidget` method which returns settings widget for this symbol layer type.

The last step is to add this symbol layer to the registry --- and we are done.

.. index:: 
  pair: custom; renderers

Creating Custom Renderers
.........................

It might be useful to create a new renderer implementation if you would like to customize the rules how to select symbols for rendering of features.
Some use cases where you would want to do it: symbol is determined from a combination of fields, size of symbols changes depending on current scale etc.

The following code shows a simple custom renderer that creates two marker symbols and chooses randomly one of them for every feature::

  import random
 
  class RandomRenderer(QgsFeatureRendererV2):
    def __init__(self, syms=None):
      QgsFeatureRendererV2.__init__(self, "RandomRenderer")
      self.syms = syms if syms else [ QgsSymbolV2.defaultSymbol(QGis.Point), QgsSymbolV2.defaultSymbol(QGis.Point) ]
  
    def symbolForFeature(self, feature):
      return random.choice(self.syms)
 
    def startRender(self, context, vlayer):
      for s in self.syms:
        s.startRender(context)
 
    def stopRender(self, context):
      for s in self.syms:
        s.stopRender(context)
 
    def usedAttributes(self):
      return []
 
    def clone(self):
      return RandomRenderer(self.syms)

The constructor of parent :class:`QgsFeatureRendererV2` class needs renderer name (has to be unique among renderers).
:func:`symbolForFeature` method is the one that decides what symbol will be used for a particular feature.
:func:`startRender` and :func:`stopRender` take care of initialization/finalization of symbol rendering.
:func:`usedAttributes` method can return a list of field names that renderer expects to be present.
Finally :func:`clone` function should return a copy of the renderer.

Like with symbol layers, it is possible to attach a GUI for configuration of the renderer.
It has to be derived from :class:`QgsRendererV2Widget`. The following sample code creates a button that allows user to set symbol of the first symbol::

  class RandomRendererWidget(QgsRendererV2Widget):
    def __init__(self, layer, style, renderer):
      QgsRendererV2Widget.__init__(self, layer, style)
      if renderer is None or renderer.type() != "RandomRenderer":
        self.r = RandomRenderer()
      else:
        self.r = renderer
      # setup UI
      self.btn1 = QgsColorButtonV2("Color 1")
      self.btn1.setColor(self.r.syms[0].color())
      self.vbox = QVBoxLayout()
      self.vbox.addWidget(self.btn1)
      self.setLayout(self.vbox)
      self.connect(self.btn1, SIGNAL("clicked()"), self.setColor1)
 
    def setColor1(self):
      color = QColorDialog.getColor( self.r.syms[0].color(), self)
      if not color.isValid(): return
      self.r.syms[0].setColor( color );
      self.btn1.setColor(self.r.syms[0].color())
 
    def renderer(self):
      return self.r

The constructor receives instances of the active layer (:class:`QgsVectorLayer`), the global style (:class:`QgsStyleV2`) and current renderer.
If there is no renderer or the renderer has different type, it will be replaced with our new renderer, otherwise we will use the current renderer
(which has already the type we need). The widget contents should be updated to show current state of the renderer.
When the renderer dialog is accepted, widget's :func:`renderer` method is called to get the current renderer -- it will be assigned to the layer.

The last missing bit is the renderer metadata and registration in registry,
otherwise loading of layers with the renderer will not work and user will not be able to select it from the list of renderers.
Let us finish our RandomRenderer example::

  class RandomRendererMetadata(QgsRendererV2AbstractMetadata):
    def __init__(self):
      QgsRendererV2AbstractMetadata.__init__(self, "RandomRenderer", "Random renderer")
 
    def createRenderer(self, element):
      return RandomRenderer()
    def createRendererWidget(self, layer, style, renderer):
      return RandomRendererWidget(layer, style, renderer)
 
  QgsRendererV2Registry.instance().addRenderer(RandomRendererMetadata())

Similarly as with symbol layers, abstract metadata constructor awaits renderer name, name visible for users and optionally name of renderer's icon.
:func:`createRenderer` method passes :class:`QDomElement` instance that can be used to restore renderer's state from DOM tree.
:func:`createRendererWidget` method creates the configuration widget. It does not have to be present or can return `None` if the renderer does not come with GUI.

To associate an icon with the renderer you can assign it in :class:`QgsRendererV2AbstractMetadata` constructor as a third (optional) argument
-- the base class constructor in the RandomRendererMetadata __init__ function becomes::

     QgsRendererV2AbstractMetadata.__init__(self, 
         "RandomRenderer", 
         "Random renderer",
         QIcon(QPixmap("RandomRendererIcon.png", "png")) )

The icon can be associated also at any later time using :func:`setIcon` method of the metadata class.
The icon can be loaded from a file (as shown above) or can be loaded from a `Qt resource <http://qt.nokia.com/doc/4.5/resources.html>`_ (PyQt4 includes .qrc compiler for Python).

Further Topics
..............

**TODO:**
 * creating/modifying symbols
 * working with style (:class:`QgsStyleV2`)
 * working with color ramps (:class:`QgsVectorColorRampV2`)
 * rule-based renderer
 * exploring symbol layer and renderer registries

.. index:: symbology; old

Old Symbology
^^^^^^^^^^^^^

A symbol determines color, size and other properties of the feature.
Renderer associated with the layer decides what symbol will be used for particular feature. There are
four available renderers:

* single symbol renderer (:class:`QgsSingleSymbolRenderer`) --- all features are rendererd with the same symbol.
* unique value renderer (:class:`QgsUniqueValueRenderer`) --- symbol for each feature is choosen from attribute value.
* graduated symbol renderer (:class:`QgsGraduatedSymbolRenderer`) --- a symbol is applied to a subgroup (class) of features, which is calculated on a numeric field
* continuous color renderer (:class:`QgsContinuousSymbolRenderer`)

How to create a point symbol::

  sym = QgsSymbol(QGis.Point)
  sym.setColor(Qt.black)
  sym.setFillColor(Qt.green)
  sym.setFillStyle(Qt.SolidPattern)
  sym.setLineWidth(0.3)
  sym.setPointSize(3)
  sym.setNamedPointSymbol("hard:triangle")

The :func:`setNamedPointSymbol` method determines the shape of the symbol. There are two classes:
hardcoded symbols (prefixed ``hard:``) and SVG symbols (prefixed ``svg:``). The following hardcoded
symbols are available: ``circle``, ``rectangle``, ``diamond``, ``pentagon``, ``cross``, ``cross2``, ``triangle``,
``equilateral_triangle``, ``star``, ``regular_star``, ``arrow``.

How to create an SVG symbol::

  sym = QgsSymbol(QGis.Point)
  sym.setNamedPointSymbol("svg:Star1.svg")
  sym.setPointSize(3)

SVG symbols do not support setting colors, fill and line styles.

How to create a line symbol::

  TODO

How to create a fill symbol::

  TODO

Create a single symbol renderer::

  sr = QgsSingleSymbolRenderer(QGis.Point)
  sr.addSymbol(sym)

Assign the renderer to a layer::

  layer.setRenderer(sr)

Create unique value renderer::

  TODO

Create graduated symbol renderer::

    # Set the numeric field and the number of classes to be generated
    fieldName = "My_Field"
    numberOfClasses = 5
    
    # Get the field index based on the field name
    fieldIndex = layer.fieldNameIndex(fieldName)

    # Create the renderer object to be associated to the layer later
    renderer = QgsGraduatedSymbolRenderer( layer.geometryType() )

    # Here you may choose the renderer mode from EqualInterval/Quantile/Empty
    renderer.setMode( QgsGraduatedSymbolRenderer.EqualInterval ) 

    # Define classes (lower and upper value as well as a label for each class)
    provider = layer.dataProvider()
    minimum = provider.minimumValue( fieldIndex ).toDouble()[ 0 ]
    maximum = provider.maximumValue( fieldIndex ).toDouble()[ 0 ]

    for i in range( numberOfClasses ):
        # Switch if attribute is int or double
        lower = ('%.*f' % (2, minimum + ( maximum - minimum ) / numberOfClasses * i ) )
        upper = ('%.*f' % (2, minimum + ( maximum - minimum ) / numberOfClasses * ( i + 1 ) ) )
        label = "%s - %s" % (lower, upper)
        color = QColor(255*i/numberOfClasses, 0, 255-255*i/numberOfClasses)
        sym = QgsSymbol( layer.geometryType(), lower, upper, label, color )
        renderer.addSymbol( sym )

    # Set the field index to classify and set the created renderer object to the layer
    renderer.setClassificationField( fieldIndex )

    layer.setRenderer( renderer )

