.. _vector:

*******************
Using Vector Layers
*******************

.. contents::
   :local:

This section summarizes various actions that can be done with vector layers.

Most work here is based on the methods of the :class:`QgsVectorLayer <qgis.core.QgsVectorLayer>` class.

.. index::
  single: PyQGIS; Vector layers

Retrieving information about attributes
========================================

You can retrieve information about the fields associated with a vector layer
by calling :meth:`fields() <qgis.core.QgsVectorLayer.fields>` on a :class:`QgsVectorLayer <qgis.core.QgsVectorLayer>` object:

.. code-block:: python

    # "layer" is a QgsVectorLayer instance
    for field in layer.fields():
        print(field.name(), field.typeName())


.. index:: Iterating features

Iterating over Vector Layer
===========================

Iterating over the features in a vector layer is one of the most common tasks.
Below is an example of the simple basic code to perform this task and showing
some information about each feature. The ``layer`` variable is assumed to have
a :class:`QgsVectorLayer <qgis.core.QgsVectorLayer>` object.

.. code-block:: python

 layer = iface.activeLayer()
 features = layer.getFeatures()

 for feature in features:
     # retrieve every feature with its geometry and attributes
     print("Feature ID: ", feature.id())
     # fetch geometry
     # show some information about the feature geometry
     geom = feature.geometry()
     geomSingleType = QgsWkbTypes.isSingleType(geom.wkbType())
     if geom.type() == QgsWkbTypes.PointGeometry:
         # the geometry type can be of single or multi type
         if geomSingleType:
             x = geom.asPoint()
             print("Point: ", x)
         else:
             x = geom.asMultiPoint()
             print("MultiPoint: ", x)
     elif geom.type() == QgsWkbTypes.LineGeometry:
         if geomSingleType:
             x = geom.asPolyline()
             print("Line: ", x, "length: ", geom.length())
         else:
             x = geom.asMultiPolyline()
             print("MultiLine: ", x, "length: ", geom.length())
     elif geom.type() == QgsWkbTypes.PolygonGeometry:
         if geomSingleType:
             x = geom.asPolygon()
             print("Polygon: ", x, "Area: ", geom.area())
         else:
             x = geom.asMultiPolygon()
             print("MultiPolygon: ", x, "Area: ", geom.area())
     else:
         print("Unknown or invalid geometry")
     # fetch attributes
     attrs = feature.attributes()
     # attrs is a list. It contains all the attribute values of this feature
     print(attrs)

.. index:: Selecting features

Selecting features
==================

In QGIS desktop, features can be selected in different ways: the user can click
on a feature, draw a rectangle on the map canvas or use an expression filter.
Selected features are normally highlighted in a different color (default
is yellow) to draw user's attention on the selection.

Sometimes it can be useful to programmatically select features or to change the
default color.

To select all the features, the :meth:`selectAll() <qgis.core.QgsVectorLayer.selectAll>` method can be used:

.. code-block:: python

 # Get the active layer (must be a vector layer)
 layer = iface.activeLayer()
 layer.selectAll()

To select using an expression, use the :meth:`selectByExpression() <qgis.core.QgsVectorLayer.selectByExpression>` method:

.. code-block:: python

 # Assumes that the active layer is points.shp file from the QGIS test suite
 # (Class (string) and Heading (number) are attributes in points.shp)
 layer = iface.activeLayer()
 layer.selectByExpression('"Class"=\'B52\' and "Heading" > 10 and "Heading" <70', QgsVectorLayer.SetSelection)

To change the selection color you can use :meth:`setSelectionColor()
<qgis.gui.QgsMapCanvas.setSelectionColor>` method of
:class:`QgsMapCanvas <qgis.gui.QgsMapCanvas>` as shown in the following example:

.. code-block:: python

    iface.mapCanvas().setSelectionColor( QColor("red") )

To add features to the selected features list for a given layer, you
can call :meth:`select() <qgis.core.QgsVectorLayer.select>` passing to it the list of features IDs:

.. code-block:: python

 selected_fid = []

 # Get the first feature id from the layer
 for feature in layer.getFeatures():
     selected_fid.append(feature.id())
     break

 # Add these features to the selected list
 layer.select(selected_fid)

To clear the selection:

.. code-block:: python

 layer.removeSelection()

Accessing attributes
--------------------

Attributes can be referred to by their name:

.. code-block:: python

  print(feature['name'])

Alternatively, attributes can be referred to by index.
This is a bit faster than using the name.
For example, to get the first attribute:

.. code-block:: python

 print(feature[0])

Iterating over selected features
--------------------------------

If you only need selected features, you can use the :meth:`selectedFeatures()
<qgis.core.QgsVectorLayer.selectedFeatures>` method from the vector layer:

.. code-block:: python

  selection = layer.selectedFeatures()
  print(len(selection))
  for feature in selection:
      # do whatever you need with the feature


Iterating over a subset of features
-----------------------------------

If you want to iterate over a given subset of features in a layer, such as
those within a given area, you have to add a :class:`QgsFeatureRequest <qgis.core.QgsFeatureRequest>` object
to the :meth:`getFeatures() <qgis.core.QgsVectorLayer.getFeatures>` call. Here's an example:

.. code-block:: python

 areaOfInterest = QgsRectangle(450290,400520, 450750,400780)

 request = QgsFeatureRequest().setFilterRect(areaOfInterest)

 for feature in layer.getFeatures(request):
     # do whatever you need with the feature

For the sake of speed, the intersection is often done only using feature’s
bounding box. There is however a flag ``ExactIntersect`` that makes sure that
only intersecting features will be returned:

.. code-block:: python

  request = QgsFeatureRequest().setFilterRect(areaOfInterest).setFlags(QgsFeatureRequest.ExactIntersect)

With :meth:`setLimit() <qgis.core.QgsFeatureRequest.setLimit>` you can limit the number of requested features.
Here's an example:

.. code-block:: python

  request = QgsFeatureRequest()
  request.setLimit(2)
  for feature in layer.getFeatures(request):
      # loop through only 2 features

If you need an attribute-based filter instead (or in addition) of a spatial
one like shown in the examples above, you can build a :class:`QgsExpression
<qgis.core.QgsExpression>` object and pass it to the :class:`QgsFeatureRequest
<qgis.core.QgsFeatureRequest>` constructor. Here's an example:

.. code-block:: python

  # The expression will filter the features where the field "location_name"
  # contains the word "Lake" (case insensitive)
  exp = QgsExpression('location_name ILIKE \'%Lake%\'')
  request = QgsFeatureRequest(exp)


See :ref:`expressions` for the details about the syntax supported by :class:`QgsExpression <qgis.core.QgsExpression>`.

The request can be used to define the data retrieved for each feature, so the
iterator returns all features, but returns partial data for each of them.

.. code-block:: python

  # Only return selected fields to increase the "speed" of the request
  request.setSubsetOfAttributes([0,2])

  # More user friendly version
  request.setSubsetOfAttributes(['name','id'],layer.fields())

  # Don't return geometry objects to increase the "speed" of the request
  request.setFlags(QgsFeatureRequest.NoGeometry)

  # Fetch only the feature with id 45
  request.setFilterFid(45)

  # The options may be chained
  request.setFilterRect(areaOfInterest).setFlags(QgsFeatureRequest.NoGeometry).setFilterFid(45).setSubsetOfAttributes([0,2])


.. index:: Vector layers; Editing
.. _editing:

Modifying Vector Layers
=======================

Most vector data providers support editing of layer data. Sometimes they support
just a subset of possible editing actions. Use the :meth:`capabilities()
<qgis.core.QgsVectorDataProvider.capabilities>` function
to find out what set of functionality is supported.

.. code-block:: python

  caps = layer.dataProvider().capabilities()
  # Check if a particular capability is supported:
  if caps & QgsVectorDataProvider.DeleteFeatures:
      print('The layer supports DeleteFeatures')

For a list of all available capabilities, please refer to the
:class:`API Documentation of QgsVectorDataProvider
<qgis.core.QgsVectorDataProvider>`.

To print layer's capabilities textual description in a comma separated list you
can use :meth:`capabilitiesString() <qgis.core.QgsVectorDataProvider.capabilitiesString>`
as in the following example:

.. code-block:: python

  caps_string = layer.dataProvider().capabilitiesString()
  # Print:
  # 'Add Features, Delete Features, Change Attribute Values, Add Attributes,
  # Delete Attributes, Rename Attributes, Fast Access to Features at ID,
  # Presimplify Geometries, Presimplify Geometries with Validity Check,
  # Transactions, Curved Geometries'

By using any of the following methods for vector layer editing, the changes are
directly committed to the underlying data store (a file, database etc). In case
you would like to do only temporary changes, skip to the next section that
explains how to do :ref:`modifications with editing buffer <editing-buffer>`.


.. note::

 If you are working inside QGIS (either from the console or from a plugin),
 it might be necessary to force a redraw of the map canvas in order to see
 the changes you've done to the geometry, to the style or to the attributes:

 .. code-block:: python

  # If caching is enabled, a simple canvas refresh might not be sufficient
  # to trigger a redraw and you must clear the cached image for the layer
  if iface.mapCanvas().isCachingEnabled():
      layer.triggerRepaint()
  else:
      iface.mapCanvas().refresh()


Add Features
------------

Create some :class:`QgsFeature <qgis.core.QgsFeature>` instances and pass a list of them to provider's
:meth:`addFeatures() <qgis.core.QgsVectorDataProvider.addFeatures>` method. It will return two values: result (true/false) and
list of added features (their ID is set by the data store).

To set up the attributes of the feature, you can either initialize the feature passing a
:class:`QgsFields <qgis.core.QgsFields>` object (you can obtain that from the
:meth:`fields() <qgis.core.QgsVectorLayer.fields>` method of the vector layer)
or call :meth:`initAttributes() <qgis.core.QgsFeature.initAttributes>` passing
the number of fields you want to be added.

.. code-block:: python

  if caps & QgsVectorDataProvider.AddFeatures:
      feat = QgsFeature(layer.fields())
      feat.setAttributes([0, 'hello'])
      # Or set a single attribute by key or by index:
      feat.setAttribute('name', 'hello')
      feat.setAttribute(0, 'hello')
      feat.setGeometry(QgsGeometry.fromPointXY(QgsPointXY(123, 456)))
      (res, outFeats) = layer.dataProvider().addFeatures([feat])


Delete Features
---------------

To delete some features, just provide a list of their feature IDs.

.. code-block:: python

  if caps & QgsVectorDataProvider.DeleteFeatures:
      res = layer.dataProvider().deleteFeatures([5, 10])

Modify Features
---------------

It is possible to either change feature's geometry or to change some attributes.
The following example first changes values of attributes with index 0 and 1,
then it changes the feature's geometry.

.. code-block:: python

  fid = 100   # ID of the feature we will modify

  if caps & QgsVectorDataProvider.ChangeAttributeValues:
      attrs = { 0 : "hello", 1 : 123 }
      layer.dataProvider().changeAttributeValues({ fid : attrs })

  if caps & QgsVectorDataProvider.ChangeGeometries:
      geom = QgsGeometry.fromPointXY(QgsPointXY(111,222))
      layer.dataProvider().changeGeometryValues({ fid : geom })


.. tip:: **Favor QgsVectorLayerEditUtils class for geometry-only edits**

    If you only need to change geometries, you might consider using
    the :class:`QgsVectorLayerEditUtils <qgis.core.QgsVectorLayerEditUtils>` which provides some useful
    methods to edit geometries (translate, insert or move vertex, etc.).

.. _editing-buffer:

Modifying Vector Layers with an Editing Buffer
----------------------------------------------

When editing vectors within QGIS application, you have to first start editing
mode for a particular layer, then do some modifications and finally commit (or
rollback) the changes. All the changes you make are not written until you commit
them --- they stay in layer's in-memory editing buffer. It is possible to use
this functionality also programmatically --- it is just another method for
vector layer editing that complements the direct usage of data providers. Use
this option when providing some GUI tools for vector layer editing, since this
will allow user to decide whether to commit/rollback and allows the usage of
undo/redo. When changes are commited, all changes from the editing buffer are
saved to data provider.

The methods are similar to the ones we have seen in the provider, but they are
called on the :class:`QgsVectorLayer <qgis.core.QgsVectorLayer>`
object instead.

For these methods to work, the layer must be in editing mode. To start the editing mode,
use the :meth:`startEditing() <qgis.core.QgsVectorLayer.startEditing>` method.
To stop editing, use the :meth:`commitChanges() <qgis.core.QgsVectorLayer.commitChanges>`
or :meth:`rollBack() <qgis.core.QgsVectorLayer.rollBack>` methods.
The first one will commit all your changes to the data source, while the second
one will discard them and will not modify the data source at all.

To find out whether a layer is in editing mode, use the :meth:`isEditable()
<qgis.core.QgsVectorLayer.isEditable>` method.

Here you have some examples that demonstrate how to use these editing methods.

.. code-block:: python

  from qgis.PyQt.QtCore import QVariant

  # add two features (QgsFeature instances)
  layer.addFeatures([feat1,feat2])
  # delete a feature with specified ID
  layer.deleteFeature(fid)

  # set new geometry (QgsGeometry instance) for a feature
  layer.changeGeometry(fid, geometry)
  # update an attribute with given field index (int) to a given value
  layer.changeAttributeValue(fid, fieldIndex, value)

  # add new field
  layer.addAttribute(QgsField("mytext", QVariant.String))
  # remove a field
  layer.deleteAttribute(fieldIndex)

In order to make undo/redo work properly, the above mentioned calls have to be
wrapped into undo commands. (If you do not care about undo/redo and want to
have the changes stored immediately, then you will have easier work by
:ref:`editing with data provider <editing>`.)

Here is how you can use the undo functionality:

.. code-block:: python

  layer.beginEditCommand("Feature triangulation")

  # ... call layer's editing methods ...

  if problem_occurred:
    layer.destroyEditCommand()
    return

  # ... more editing ...

  layer.endEditCommand()

The :meth:`beginEditCommand() <qgis.core.QgsVectorLayer.beginEditCommand>` method will create an internal "active" command and will
record subsequent changes in vector layer. With the call to :meth:`endEditCommand() <qgis.core.QgsVectorLayer.endEditCommand>`
the command is pushed onto the undo stack and the user will be able to undo/redo
it from GUI. In case something went wrong while doing the changes, the
:meth:`destroyEditCommand() <qgis.core.QgsVectorLayer.destroyEditCommand>` method will remove the command and rollback all
changes done while this command was active.

You can also use the :code:`with edit(layer)`-statement to wrap commit and rollback into
a more semantic code block as shown in the example below:

.. code-block:: python

  with edit(layer):
    feat = next(layer.getFeatures())
    feat[0] = 5
    layer.updateFeature(feat)


This will automatically call :meth:`commitChanges() <qgis.core.QgsVectorLayer.commitChanges>` in the end.
If any exception occurs, it will :meth:`rollBack() <qgis.core.QgsVectorLayer.rollBack>` all the changes.
In case a problem is encountered within :meth:`commitChanges() <qgis.core.QgsVectorLayer.commitChanges>` (when the method
returns False) a :class:`QgsEditError <qgis.core.QgsEditError>` exception will be raised.

Adding and Removing Fields
--------------------------

To add fields (attributes), you need to specify a list of field definitions.
For deletion of fields just provide a list of field indexes.

.. code-block:: python

 from qgis.PyQt.QtCore import QVariant

 if caps & QgsVectorDataProvider.AddAttributes:
     res = layer.dataProvider().addAttributes(
         [QgsField("mytext", QVariant.String),
         QgsField("myint", QVariant.Int)])

 if caps & QgsVectorDataProvider.DeleteAttributes:
     res = layer.dataProvider().deleteAttributes([0])

After adding or removing fields in the data provider the layer's fields need
to be updated because the changes are not automatically propagated.

.. code-block:: python

 layer.updateFields()

.. tip:: **Directly save changes using** ``with`` **based command**

    Using ``with edit(layer):`` the changes will be commited automatically
    calling :meth:`commitChanges() <qgis.core.QgsVectorLayer.commitChanges>` at the end. If any exception occurs, it will
    :meth:`rollBack() <qgis.core.QgsVectorLayer.rollBack>` all the changes. See :ref:`editing-buffer`.


.. index:: Spatial index

Using Spatial Index
===================

Spatial indexes can dramatically improve the performance of your code if you
need to do frequent queries to a vector layer. Imagine, for instance, that you
are writing an interpolation algorithm, and that for a given location you need
to know the 10 closest points from a points layer, in order to use those point
for calculating the interpolated value. Without a spatial index, the only way
for QGIS to find those 10 points is to compute the distance from each and every
point to the specified location and then compare those distances. This can be a
very time consuming task, especially if it needs to be repeated for several
locations. If a spatial index exists for the layer, the operation is much more
effective.

Think of a layer without a spatial index as a telephone book in which telephone
numbers are not ordered or indexed. The only way to find the telephone number
of a given person is to read from the beginning until you find it.

Spatial indexes are not created by default for a QGIS vector layer, but you can
create them easily. This is what you have to do:

* create spatial index using the :class:`QgsSpatialIndex() <qgis.core.QgsSpatialIndex>`
  class:

  .. code-block:: python

     index = QgsSpatialIndex()

* add features to index --- index takes :class:`QgsFeature <qgis.core.QgsFeature>` object and adds it
  to the internal data structure. You can create the object manually or use
  one from a previous call to the provider's
  :meth:`getFeatures() <qgis.core.QgsVectorDataProvider.getFeatures>` method.

  .. code-block:: python

     index.insertFeature(feat)

* alternatively, you can load all features of a layer at once using bulk loading

  .. code-block:: python

     index = QgsSpatialIndex(layer.getFeatures())

* once spatial index is filled with some values, you can do some queries

  .. code-block:: python

    # returns array of feature IDs of five nearest features
    nearest = index.nearestNeighbor(QgsPointXY(25.4, 12.7), 5)

    # returns array of IDs of features which intersect the rectangle
    intersect = index.intersects(QgsRectangle(22.5, 15.3, 23.1, 17.2))


.. index:: Vector layers; Creating

Creating Vector Layers
======================

There are several ways to generate a vector layer dataset:

* the :class:`QgsVectorFileWriter <qgis.core.QgsVectorFileWriter>` class:
  A convenient class for writing vector files to disk, using either a static
  call to :meth:`writeAsVectorFormat()
  <qgis.core.QgsVectorFileWriter.writeAsVectorFormat>` which saves the whole
  vector layer or creating an instance of the class and issue calls to
  :meth:`addFeature() <qgis.core.QgsVectorFileWriter.addFeature>`. This class
  supports all the vector formats that OGR supports (GeoPackage, Shapefile,
  GeoJSON, KML and others).
* the :class:`QgsVectorLayer <qgis.core.QgsVectorLayer>` class: instantiates
  a data provider that interprets the supplied path (url) of the data source
  to connect to and access the data. It can be used to create temporary,
  memory-based layers (``memory``) and connect to OGR datasets (``ogr``),
  databases (``postgres``, ``spatialite``, ``mysql``, ``mssql``) and
  more (``wfs``, ``gpx``, ``delimitedtext``...).


From an instance of :class:`QgsVectorFileWriter <qgis.core.QgsVectorFileWriter>`
--------------------------------------------------------------------------------

.. code-block:: python

  # Write to a GeoPackage (default)
  error = QgsVectorFileWriter.writeAsVectorFormat(layer,
                                                  "/path/to/folder/my_data",
                                                  "")
  if error[0] == QgsVectorFileWriter.NoError:
      print("success!")

.. code-block:: python

  # Write to an ESRI Shapefile format dataset using UTF-8 text encoding
  error = QgsVectorFileWriter.writeAsVectorFormat(layer,
                                                  "/path/to/folder/my_esridata",
                                                  "UTF-8",
                                                  driverName="ESRI Shapefile")
  if error[0] == QgsVectorFileWriter.NoError:
      print("success again!")

The third (mandatory) parameter specifies output text encoding.
Only some drivers need this for correct operation - Shapefile is one of them
(other drivers will ignore this parameter).
Specifying the correct encoding is important if you are using international
(non US-ASCII) characters.

.. code-block:: python

  # Write to an ESRI GDB file
  opts = QgsVectorFileWriter.SaveVectorOptions()
  opts.driverName = "FileGDB"
  # if no geometry
  opts.overrideGeometryType = QgsWkbTypes.NullGeometry
  opts.actionOnExistingFile = QgsVectorFileWriter.ActionOnExistingFile.CreateOrOverwriteLayer
  opts.layerName = 'my_new_layer_name'
  error = QgsVectorFileWriter.writeAsVectorFormat(layer=vlayer,
                                                  fileName=gdb_path,
                                                  options=opts) 
  if error[0] == QgsVectorFileWriter.NoError: 
    print("success!")
  else:
    print(error)

You can also convert fields to make them compatible with different formats by
using the  :class:`FieldValueConverter <qgis.core.QgsVectorFileWriter.FieldValueConverter>`.
For example, to convert array variable types (e.g. in Postgres) to a text type,
you can do the following:

.. code-block:: python

  LIST_FIELD_NAME = 'xxxx'

  class ESRIValueConverter(QgsVectorFileWriter.FieldValueConverter):

    def __init__(self, layer, list_field):
      QgsVectorFileWriter.FieldValueConverter.__init__(self)
        self.layer = layer
        self.list_field_idx = self.layer.fields().indexFromName(list_field) 

    def convert(self, fieldIdxInLayer, value):
      if fieldIdxInLayer == self.list_field_idx:
        return QgsListFieldFormatter().representValue(layer=vlayer,
                                                      fieldIndex=self.list_field_idx,
                                                      config={},
                                                      cache=None,
                                                      value=value)
      else:
        return value

    def fieldDefinition(self, field):
      idx = self.layer.fields().indexFromName(field.name())
      if idx == self.list_field_idx:
        return QgsField(LIST_FIELD_NAME, QVariant.String)
      else:
        return self.layer.fields()[idx]

  converter = ESRIValueConverter(vlayer, LIST_FIELD_NAME)
  #opts is a QgsVectorFileWriter.SaveVectorOptions as above
  opts.fieldValueConverter = converter

A destination CRS may also be specified --- if a valid instance of
:class:`QgsCoordinateReferenceSystem <qgis.core.QgsCoordinateReferenceSystem>`
is passed as the fourth parameter, the layer is transformed to that CRS.

For valid driver names please call the :meth:`supportedFiltersAndFormats
<qgis.core.QgsVectorFileWriter.supportedFiltersAndFormats>` method
or consult the `supported formats by OGR`_ --- you
should pass the value in the "Code" column as the driver name.

Optionally you can set whether to export only selected features, pass further
driver-specific options for creation or tell the writer not to create attributes...
There are a number of other (optional) parameters; see the :class:`QgsVectorFileWriter
<qgis.core.QgsVectorFileWriter>` documentation for details.


Directly from features
----------------------

.. code-block:: python

  from qgis.PyQt.QtCore import QVariant

  # define fields for feature attributes. A QgsFields object is needed
  fields = QgsFields()
  fields.append(QgsField("first", QVariant.Int))
  fields.append(QgsField("second", QVariant.String))

  """ create an instance of vector file writer, which will create the vector file.
  Arguments:
  1. path to new file (will fail if exists already)
  2. encoding of the attributes
  3. field map
  4. geometry type - from WKBTYPE enum
  5. layer's spatial reference (instance of
     QgsCoordinateReferenceSystem) - optional
  6. driver name for the output file """

  writer = QgsVectorFileWriter("my_shapes.shp", "UTF-8", fields, QgsWkbTypes.Point, driverName="ESRI Shapefile")

  if writer.hasError() != QgsVectorFileWriter.NoError:
      print("Error when creating shapefile: ",  w.errorMessage())

  # add a feature
  fet = QgsFeature()

  fet.setGeometry(QgsGeometry.fromPointXY(QgsPointXY(10,10)))
  fet.setAttributes([1, "text"])
  writer.addFeature(fet)

  # delete the writer to flush features to disk
  del writer

.. index:: Memory layer

From an instance of :class:`QgsVectorLayer <qgis.core.QgsVectorLayer>`
----------------------------------------------------------------------

Among all the data providers supported by the :class:`QgsVectorLayer
<qgis.core.QgsVectorLayer>` class, let's focus on the memory-based layers.
Memory provider is intended to be used mainly by plugin or 3rd party app
developers. It does not store data on disk, allowing developers to use it as a
fast backend for some temporary layers.

The provider supports string, int and double fields.

The memory provider also supports spatial indexing, which is enabled by calling
the provider's :meth:`createSpatialIndex()
<qgis.core.QgsVectorDataProvider.createSpatialIndex>` function. Once the spatial index is
created you will be able to iterate over features within smaller regions faster
(since it's not necessary to traverse all the features, only those in specified
rectangle).

A memory provider is created by passing ``"memory"`` as the provider string to
the :class:`QgsVectorLayer <qgis.core.QgsVectorLayer>` constructor.

The constructor also takes a URI defining the geometry type of the layer,
one of: ``"Point"``, ``"LineString"``, ``"Polygon"``, ``"MultiPoint"``,
``"MultiLineString"``, ``"MultiPolygon"`` or ``"None"``.

The URI can also specify the coordinate reference system, fields, and indexing
of the memory provider in the URI. The syntax is:

crs=definition
    Specifies the coordinate reference system, where definition may be any
    of the forms accepted by :meth:`QgsCoordinateReferenceSystem.createFromString
    <qgis.core.QgsCoordinateReferenceSystem.createFromString>`

index=yes
    Specifies that the provider will use a spatial index

field=name:type(length,precision)
    Specifies an attribute of the layer.  The attribute has a name, and
    optionally a type (integer, double, or string), length, and precision.
    There may be multiple field definitions.

The following example of a URI incorporates all these options

::

  "Point?crs=epsg:4326&field=id:integer&field=name:string(20)&index=yes"

The following example code illustrates creating and populating a memory provider

.. code-block:: python

  from qgis.PyQt.QtCore import QVariant

  # create layer
  vl = QgsVectorLayer("Point", "temporary_points", "memory")
  pr = vl.dataProvider()

  # add fields
  pr.addAttributes([QgsField("name", QVariant.String),
                      QgsField("age",  QVariant.Int),
                      QgsField("size", QVariant.Double)])
  vl.updateFields() # tell the vector layer to fetch changes from the provider

  # add a feature
  fet = QgsFeature()
  fet.setGeometry(QgsGeometry.fromPointXY(QgsPointXY(10,10)))
  fet.setAttributes(["Johny", 2, 0.3])
  pr.addFeatures([fet])

  # update layer's extent when new features have been added
  # because change of extent in provider is not propagated to the layer
  vl.updateExtents()

Finally, let's check whether everything went well

.. code-block:: python

  # show some stats
  print("fields:", len(pr.fields()))
  print("features:", pr.featureCount())
  e = vl.extent()
  print("extent:", e.xMinimum(), e.yMinimum(), e.xMaximum(), e.yMaximum())

  # iterate over features
  features = vl.getFeatures()
  for fet in features:
      print("F:", fet.id(), fet.attributes(), fet.geometry().asPoint())

.. index:: Vector layers; Symbology

Appearance (Symbology) of Vector Layers
=======================================

When a vector layer is being rendered, the appearance of the data is given by
**renderer** and **symbols** associated with the layer.  Symbols are classes
which take care of drawing of visual representation of features, while
renderers determine what symbol will be used for a particular feature.

The renderer for a given layer can be obtained as shown below:

.. code-block:: python

  renderer = layer.renderer()

And with that reference, let us explore it a bit

.. code-block:: python

  print("Type:", renderer.type())

There are several known renderer types available in the QGIS core library:

=================  ============================================================================== ===================================================================
Type               Class                                                                           Description
=================  ============================================================================== ===================================================================
singleSymbol       :class:`QgsSingleSymbolRenderer <qgis.core.QgsSingleSymbolRenderer>`           Renders all features with the same symbol
categorizedSymbol  :class:`QgsCategorizedSymbolRenderer <qgis.core.QgsCategorizedSymbolRenderer>` Renders features using a different symbol for each category
graduatedSymbol    :class:`QgsGraduatedSymbolRenderer  <qgis.core.QgsGraduatedSymbolRenderer>`    Renders features using a different symbol for each range of values
=================  ============================================================================== ===================================================================

|

There might be also some custom renderer types, so never make an assumption
there are just these types. You can query the application's :class:`QgsRendererRegistry <qgis.core.QgsRendererRegistry>`
to find out currently available renderers:

.. code-block:: python

    print(QgsApplication.rendererRegistry().renderersList())
    # Print:
    ['nullSymbol',
    'singleSymbol',
    'categorizedSymbol',
    'graduatedSymbol',
    'RuleRenderer',
    'pointDisplacement',
    'pointCluster',
    'invertedPolygonRenderer',
    'heatmapRenderer',
    '25dRenderer']

It is possible to obtain a dump of a renderer contents in text form --- can be
useful for debugging

.. code-block:: python

  print(renderer.dump())

.. index:: Single symbol renderer, Symbology; Single symbol renderer

Single Symbol Renderer
----------------------

You can get the symbol used for rendering by calling :meth:`symbol() <qgis.core.QgsSingleSymbolRenderer.symbol>` method and
change it with :meth:`setSymbol() <qgis.core.QgsSingleSymbolRenderer.setSymbol>` method (note for C++ devs: the renderer takes
ownership of the symbol.)

You can change the symbol used by a particular vector layer by calling
:meth:`setSymbol() <qgis.core.QgsSingleSymbolRenderer.setSymbol>` passing an instance of the appropriate symbol instance.
Symbols for *point*, *line* and *polygon* layers can be created by calling
the :meth:`createSimple() <qgis.core.QgsMarkerSymbol.createSimple>` function of the corresponding classes
:class:`QgsMarkerSymbol <qgis.core.QgsMarkerSymbol>`, :class:`QgsLineSymbol <qgis.core.QgsLineSymbol>` and
:class:`QgsFillSymbol <qgis.core.QgsFillSymbol>`.

The dictionary passed to :meth:`createSimple() <qgis.core.QgsMarkerSymbol.createSimple>` sets the style properties of the
symbol.

For example you can replace the symbol used by a particular **point** layer
by calling :meth:`setSymbol() <qgis.core.QgsSingleSymbolRenderer.setSymbol>` passing an instance of a :class:`QgsMarkerSymbol <qgis.core.QgsMarkerSymbol>`,
as in the following code example:

.. code-block:: python

    symbol = QgsMarkerSymbol.createSimple({'name': 'square', 'color': 'red'})
    layer.renderer().setSymbol(symbol)
    # show the change
    layer.triggerRepaint()

``name`` indicates the shape of the marker, and can be any of the following:

* ``circle``
* ``square``
* ``cross``
* ``rectangle``
* ``diamond``
* ``pentagon``
* ``triangle``
* ``equilateral_triangle``
* ``star``
* ``regular_star``
* ``arrow``
* ``filled_arrowhead``
* ``x``


To get the full list of properties for the first symbol layer of a symbol
instance you can follow the example code:

.. code-block:: python

    print(layer.renderer().symbol().symbolLayers()[0].properties())
    # Prints
    {'angle': '0',
    'color': '0,128,0,255',
    'horizontal_anchor_point': '1',
    'joinstyle': 'bevel',
    'name': 'circle',
    'offset': '0,0',
    'offset_map_unit_scale': '0,0',
    'offset_unit': 'MM',
    'outline_color': '0,0,0,255',
    'outline_style': 'solid',
    'outline_width': '0',
    'outline_width_map_unit_scale': '0,0',
    'outline_width_unit': 'MM',
    'scale_method': 'area',
    'size': '2',
    'size_map_unit_scale': '0,0',
    'size_unit': 'MM',
    'vertical_anchor_point': '1'}

This can be useful if you want to alter some properties:

.. code-block:: python

    # You can alter a single property...
    layer.renderer().symbol().symbolLayer(0).setSize(3)
    # ... but not all properties are accessible from methods,
    # you can also replace the symbol completely:
    props = layer.renderer().symbol().symbolLayer(0).properties()
    props['color'] = 'yellow'
    props['name'] = 'square'
    layer.renderer().setSymbol(QgsMarkerSymbol.createSimple(props))
    # show the changes
    layer.triggerRepaint()


.. index:: Categorized symbology renderer, Symbology; Categorized symbol renderer

Categorized Symbol Renderer
---------------------------

When using a categorized renderer, you can query and set the attribute that is used for classification: use the
:meth:`classAttribute() <qgis.core.QgsCategorizedSymbolRenderer.classAttribute>` and :meth:`setClassAttribute() <qgis.core.QgsCategorizedSymbolRenderer.setClassAttribute>` methods.

To get a list of categories

.. code-block:: python

  for cat in renderer.categories():
      print("{}: {} :: {}".format(cat.value(), cat.label(), cat.symbol()))

Where :meth:`value() <qgis.core.QgsRendererCategory.value>` is the value used for discrimination between categories,
:meth:`label() <qgis.core.QgsRendererCategory.label>` is a text used for category description and :meth:`symbol() <qgis.core.QgsRendererCategory.symbol>` method
returns the assigned symbol.

The renderer usually stores also original symbol and color ramp which were used
for the classification: :meth:`sourceColorRamp() <qgis.core.QgsCategorizedSymbolRenderer.sourceColorRamp>` and :meth:`sourceSymbol() <qgis.core.QgsCategorizedSymbolRenderer.sourceSymbol>` methods.

.. index:: Symbology; Graduated symbol renderer, Graduated symbol renderer

Graduated Symbol Renderer
-------------------------

This renderer is very similar to the categorized symbol renderer described
above, but instead of one attribute value per class it works with ranges of
values and thus can be used only with numerical attributes.

To find out more about ranges used in the renderer

.. code-block:: python

  for ran in renderer.ranges():
      print("{} - {}: {} {}".format(
          ran.lowerValue(),
          ran.upperValue(),
          ran.label(),
          ran.symbol()
        ))

you can again use the
:meth:`classAttribute <qgis.core.QgsGraduatedSymbolRenderer.classAttribute>`
(to find the classification attribute name),
:meth:`sourceSymbol <qgis.core.QgsGraduatedSymbolRenderer.sourceSymbol>`
and :meth:`sourceColorRamp <qgis.core.QgsGraduatedSymbolRenderer.sourceColorRamp>` methods.
Additionally there is the :meth:`mode <qgis.core.QgsGraduatedSymbolRenderer.mode>`
method which determines how the ranges were created:
using equal intervals, quantiles or some other method.

If you wish to create your own graduated symbol renderer you can do so as
illustrated in the example snippet below (which creates a simple two class
arrangement)

.. code-block:: python

  from qgis.PyQt import QtGui

  myVectorLayer = QgsVectorLayer(myVectorPath, myName, 'ogr')
  myTargetField = 'target_field'
  myRangeList = []
  myOpacity = 1
  # Make our first symbol and range...
  myMin = 0.0
  myMax = 50.0
  myLabel = 'Group 1'
  myColour = QtGui.QColor('#ffee00')
  mySymbol1 = QgsSymbol.defaultSymbol(myVectorLayer.geometryType())
  mySymbol1.setColor(myColour)
  mySymbol1.setOpacity(myOpacity)
  myRange1 = QgsRendererRange(myMin, myMax, mySymbol1, myLabel)
  myRangeList.append(myRange1)
  #now make another symbol and range...
  myMin = 50.1
  myMax = 100
  myLabel = 'Group 2'
  myColour = QtGui.QColor('#00eeff')
  mySymbol2 = QgsSymbol.defaultSymbol(
       myVectorLayer.geometryType())
  mySymbol2.setColor(myColour)
  mySymbol2.setOpacity(myOpacity)
  myRange2 = QgsRendererRange(myMin, myMax, mySymbol2, myLabel)
  myRangeList.append(myRange2)
  myRenderer = QgsGraduatedSymbolRenderer('', myRangeList)
  myRenderer.setMode(QgsGraduatedSymbolRenderer.EqualInterval)
  myRenderer.setClassAttribute(myTargetField)

  myVectorLayer.setRenderer(myRenderer)
  QgsProject.instance().addMapLayer(myVectorLayer)


.. index:: Symbols; Working with

Working with Symbols
--------------------

For representation of symbols, there is :class:`QgsSymbol <qgis.core.QgsSymbol>` base class with
three derived classes:

* :class:`QgsMarkerSymbol <qgis.core.QgsMarkerSymbol>` --- for point features
* :class:`QgsLineSymbol <qgis.core.QgsLineSymbol>` --- for line features
* :class:`QgsFillSymbol <qgis.core.QgsFillSymbol>` --- for polygon features

**Every symbol consists of one or more symbol layers** (classes derived from
:class:`QgsSymbolLayer <qgis.core.QgsSymbolLayer>`). The symbol layers do the actual rendering, the
symbol class itself serves only as a container for the symbol layers.

Having an instance of a symbol (e.g. from a renderer), it is possible to
explore it: the :meth:`type <qgis.core.QgsSymbol.type>` method says whether it is a
marker, line or fill symbol. There is a :meth:`dump <qgis.core.QgsSymbol.dump>`
method which returns a brief description of the symbol. To get a list of symbol
layers:

.. code-block:: python

  for i in range(symbol.symbolLayerCount()):
      lyr = symbol.symbolLayer(i)
      print("{}: {}".format(i, lyr.layerType()))

To find out symbol's color use :meth:`color <qgis.core.QgsSymbol.color>` method and :meth:`setColor <qgis.core.QgsSymbol.setColor>` to
change its color. With marker symbols additionally you can query for the symbol
size and rotation with the :meth:`size <qgis.core.QgsMarkerSymbol.size>` and :meth:`angle <qgis.core.QgsMarkerSymbol.angle>` methods. For line symbols
the :meth:`width <qgis.core.QgsLineSymbol.width>` method returns the line width.

Size and width are in millimeters by default, angles are in degrees.

.. index:: Symbol layers; Working with

Working with Symbol Layers
..........................

As said before, symbol layers (subclasses of :class:`QgsSymbolLayer <qgis.core.QgsSymbolLayer>`)
determine the appearance of the features.  There are several basic symbol layer
classes for general use. It is possible to implement new symbol layer types and
thus arbitrarily customize how features will be rendered. The :meth:`layerType() <qgis.core.QgsSymbolLayer.layerType>`
method uniquely identifies the symbol layer class --- the basic and default
ones are ``SimpleMarker``, ``SimpleLine`` and ``SimpleFill`` symbol layers types.

You can get a complete list of the types of symbol layers you can create for a
given symbol layer class with the following code:

.. code-block:: python

  from qgis.core import QgsSymbolLayerRegistry
  myRegistry = QgsApplication.symbolLayerRegistry()
  myMetadata = myRegistry.symbolLayerMetadata("SimpleFill")
  for item in myRegistry.symbolLayersForType(QgsSymbol.Marker):
      print(item)

Output:

::

  EllipseMarker
  FilledMarker
  FontMarker
  GeometryGenerator
  SimpleMarker
  SvgMarker
  VectorField

The :class:`QgsSymbolLayerRegistry <qgis.core.QgsSymbolLayerRegistry>` class manages
a database of all available symbol layer types.

To access symbol layer data, use its :meth:`properties() <qgis.core.QgsSymbolLayer.properties>` method that returns a
key-value dictionary of properties which determine the appearance. Each symbol
layer type has a specific set of properties that it uses. Additionally, there
are the generic methods :meth:`color <qgis.core.QgsSymbol.color>`, :meth:`size
<qgis.core.QgsMarkerSymbol.size>`, :meth:`angle <qgis.core.QgsMarkerSymbol.angle>` and
:meth:`width <qgis.core.QgsLineSymbol.width>`,
with their setter counterparts. Of course size and angle are available only for
marker symbol layers and width for line symbol layers.

.. index:: Symbol layers; Creating custom types

Creating Custom Symbol Layer Types
..................................

Imagine you would like to customize the way how the data gets rendered. You can
create your own symbol layer class that will draw the features exactly as you
wish. Here is an example of a marker that draws red circles with specified
radius

.. code-block:: python

  from qgis.core import QgsMarkerSymbolLayer
  from qgis.PyQt.QtGui import QColor

  class FooSymbolLayer(QgsMarkerSymbolLayer):

    def __init__(self, radius=4.0):
        QgsMarkerSymbolLayer.__init__(self)
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
        # Rendering depends on whether the symbol is selected (QGIS >= 1.5)
        color = context.selectionColor() if context.selected() else self.color
        p = context.renderContext().painter()
        p.setPen(color)
        p.drawEllipse(point, self.radius, self.radius)

    def clone(self):
        return FooSymbolLayer(self.radius)


The :meth:`layerType <qgis.core.QgsSymbolLayer.layerType>` method determines
the name of the symbol layer; it has to be unique among all symbol layers.
The :meth:`properties <qgis.core.QgsSymbolLayer.properties>` method is used
for persistence of attributes. The :meth:`clone <qgis.core.QgsSymbolLayer.clone>`
method must return a copy of the symbol layer with
all attributes being exactly the same. Finally there are rendering methods:
:meth:`startRender <qgis.core.QgsSymbolLayer.startRender>` is called before
rendering the first feature, :meth:`stopRender <qgis.core.QgsSymbolLayer.stopRender>`
when the rendering is done, and :meth:`renderPoint
<qgis.core.QgsMarkerSymbolLayer.renderPoint>` is called to do the rendering.
The coordinates of the point(s) are already transformed to the output coordinates.

For polylines and polygons the only difference would be in the rendering
method: you would use
:meth:`renderPolyline <qgis.core.QgsLineSymbolLayer.renderPolyline>`
which receives a list of lines,
while :meth:`renderPolygon <qgis.core.QgsFillSymbolLayer.renderPolygon>`
receives a list of points on the outer ring as the
first parameter and a list of inner rings (or None) as a second parameter.

Usually it is convenient to add a GUI for setting attributes of the symbol
layer type to allow users to customize the appearance: in case of our example
above we can let user set circle radius. The following code implements such
widget

.. code-block:: python

    from qgis.gui import QgsSymbolLayerWidget

    class FooSymbolLayerWidget(QgsSymbolLayerWidget):
        def __init__(self, parent=None):
            QgsSymbolLayerWidget.__init__(self, parent)

            self.layer = None

            # setup a simple UI
            self.label = QLabel("Radius:")
            self.spinRadius = QDoubleSpinBox()
            self.hbox = QHBoxLayout()
            self.hbox.addWidget(self.label)
            self.hbox.addWidget(self.spinRadius)
            self.setLayout(self.hbox)
            self.connect(self.spinRadius, SIGNAL("valueChanged(double)"), \
                self.radiusChanged)

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

This widget can be embedded into the symbol properties dialog. When the symbol
layer type is selected in symbol properties dialog, it creates an instance of
the symbol layer and an instance of the symbol layer widget. Then it calls
the :meth:`setSymbolLayer <qgis.gui.QgsSymbolLayerWidget.setSymbolLayer>` method to
assign the symbol layer to the widget. In that
method the widget should update the UI to reflect the attributes of the symbol
layer. The :meth:`symbolLayer <qgis.gui.QgsSymbolLayerWidget.symbolLayer>` method
is used to retrieve the symbol layer again
by the properties dialog to use it for the symbol.

On every change of attributes, the widget should emit the :any:`changed()
<qgis.gui.QgsSymbolLayerWidget.changed>` signal
to let the properties dialog update the symbol preview.

Now we are missing only the final glue: to make QGIS aware of these new classes.
This is done by adding the symbol layer to registry. It is possible to use the
symbol layer also without adding it to the registry, but some functionality
will not work: e.g. loading of project files with the custom symbol layers or
inability to edit the layer's attributes in GUI.

We will have to create metadata for the symbol layer

.. code-block:: python

  from qgis.core import QgsSymbol, QgsSymbolLayerAbstractMetadata, QgsSymbolLayerRegistry

  class FooSymbolLayerMetadata(QgsSymbolLayerAbstractMetadata):

    def __init__(self):
      QgsSymbolLayerAbstractMetadata.__init__(self, "FooMarker", QgsSymbol.Marker)

    def createSymbolLayer(self, props):
      radius = float(props["radius"]) if "radius" in props else 4.0
      return FooSymbolLayer(radius)

        def createSymbolLayer(self, props):
          radius = float(props["radius"]) if "radius" in props else 4.0
          return FooSymbolLayer(radius)

  QgsApplication.symbolLayerRegistry().addSymbolLayerType(FooSymbolLayerMetadata())

You should pass layer type (the same as returned by the layer) and symbol type
(marker/line/fill) to the constructor of the parent class. The :meth:`createSymbolLayer()
<qgis.core.QgsSymbolLayerAbstractMetadata.createSymbolLayer>` method
takes care of creating an instance of symbol layer with attributes specified in
the `props` dictionary. And there is the :meth:`createSymbolLayerWidget()
<qgis.core.QgsSymbolLayerAbstractMetadata.createSymbolLayerWidget>` method which
returns the settings widget for this symbol layer type.

The last step is to add this symbol layer to the registry --- and we are done.

.. index::
  pair: Custom; Renderer

Creating Custom Renderers
-------------------------

It might be useful to create a new renderer implementation if you would like to
customize the rules how to select symbols for rendering of features. Some use
cases where you would want to do it: symbol is determined from a combination of
fields, size of symbols changes depending on current scale etc.

The following code shows a simple custom renderer that creates two marker
symbols and chooses randomly one of them for every feature

.. code-block:: python

  import random
  from qgis.core import QgsWkbTypes, QgsSymbol, QgsFeatureRenderer


  class RandomRenderer(QgsFeatureRenderer):
    def __init__(self, syms=None):
      QgsFeatureRenderer.__init__(self, "RandomRenderer")
      self.syms = syms if syms else [
        QgsSymbol.defaultSymbol(QgsWkbTypes.geometryType(QgsWkbTypes.Point)),
        QgsSymbol.defaultSymbol(QgsWkbTypes.geometryType(QgsWkbTypes.Point))
      ]

    def symbolForFeature(self, feature, context):
      return random.choice(self.syms)

    def startRender(self, context, fields):
      super().startRender(context, fields)
      for s in self.syms:
        s.startRender(context, fields)

    def stopRender(self, context):
      super().stopRender(context)
      for s in self.syms:
        s.stopRender(context)

    def usedAttributes(self, context):
      return []

    def clone(self):
      return RandomRenderer(self.syms)

The constructor of the parent :class:`QgsFeatureRenderer <qgis.core.QgsFeatureRenderer>`
class needs a renderer name (which has to be unique among renderers). The
:meth:`symbolForFeature <qgis.core.QgsFeatureRenderer.symbolForFeature>` method
is the one that decides what symbol will be used for a particular feature.
:meth:`startRender <qgis.core.QgsFeatureRenderer.startRender>` and :meth:`stopRender
<qgis.core.QgsFeatureRenderer.stopRender>` take care of initialization/finalization
of symbol rendering. The :meth:`usedAttributes <qgis.core.QgsFeatureRenderer.usedAttributes>`
method can return a list of field names that the renderer expects to be present.
Finally, the :meth:`clone <qgis.core.QgsFeatureRenderer.clone>` method
should return a copy of the renderer.

Like with symbol layers, it is possible to attach a GUI for configuration of
the renderer. It has to be derived from :class:`QgsRendererWidget <qgis.gui.QgsRendererWidget>`.
The following sample code creates a button that allows the user to set the
first symbol

.. code-block:: python


  from qgis.gui import QgsRendererWidget, QgsColorButton


  class RandomRendererWidget(QgsRendererWidget):
    def __init__(self, layer, style, renderer):
      QgsRendererWidget.__init__(self, layer, style)
      if renderer is None or renderer.type() != "RandomRenderer":
        self.r = RandomRenderer()
      else:
        self.r = renderer
      # setup UI
      self.btn1 = QgsColorButton()
      self.btn1.setColor(self.r.syms[0].color())
      self.vbox = QVBoxLayout()
      self.vbox.addWidget(self.btn1)
      self.setLayout(self.vbox)
      self.btn1.colorChanged.connect(self.setColor1)

    def setColor1(self):
      color = self.btn1.color()
      if not color.isValid(): return
      self.r.syms[0].setColor(color)

    def renderer(self):
      return self.r

The constructor receives instances of the active layer (:class:`QgsVectorLayer
<qgis.core.QgsVectorLayer>`), the global style (:class:`QgsStyle
<qgis.core.QgsStyle>`) and the current renderer. If there is no
renderer or the renderer has different type, it will be replaced with our new
renderer, otherwise we will use the current renderer (which has already the
type we need). The widget contents should be updated to show current state of
the renderer. When the renderer dialog is accepted, the widget's :meth:`renderer
<qgis.gui.QgsRendererWidget.renderer>` method is called to get the current
renderer --- it will be assigned to the layer.

The last missing bit is the renderer metadata and registration in registry,
otherwise loading of layers with the renderer will not work and user will not
be able to select it from the list of renderers. Let us finish our
RandomRenderer example

.. code-block:: python

  from qgis.core import QgsRendererAbstractMetadata,QgsRendererRegistry,QgsApplication

  class RandomRendererMetadata(QgsRendererAbstractMetadata):
    def __init__(self):
      QgsRendererAbstractMetadata.__init__(self, "RandomRenderer", "Random renderer")

    def createRenderer(self, element):
      return RandomRenderer()
    def createRendererWidget(self, layer, style, renderer):
      return RandomRendererWidget(layer, style, renderer)

  QgsApplication.rendererRegistry().addRenderer(RandomRendererMetadata())

Similarly as with symbol layers, abstract metadata constructor awaits renderer
name, name visible for users and optionally name of renderer's icon.
The :meth:`createRenderer <qgis.core.QgsRendererAbstractMetadata.createRenderer>`
method passes a :class:`QDomElement` instance that can be
used to restore the renderer's state from the DOM tree. The :meth:`createRendererWidget
<qgis.core.QgsRendererAbstractMetadata.createRendererWidget>`
method creates the configuration widget. It does not have to be present or can
return ``None`` if the renderer does not come with GUI.

To associate an icon with the renderer you can assign it in
the :class:`QgsRendererAbstractMetadata <qgis.core.QgsRendererAbstractMetadata>`
constructor as a third (optional)
argument --- the base class constructor in the RandomRendererMetadata :func:`__init__`
function becomes

.. code-block:: python

  QgsRendererAbstractMetadata.__init__(self,
         "RandomRenderer",
         "Random renderer",
         QIcon(QPixmap("RandomRendererIcon.png", "png")))

The icon can also be associated at any later time using the :meth:`setIcon
<qgis.core.QgsRendererAbstractMetadata.setIcon>` method
of the metadata class. The icon can be loaded from a file (as shown above) or
can be loaded from a `Qt resource <https://doc.qt.io/qt-5/resources.html>`_
(PyQt5 includes .qrc compiler for Python).


Further Topics
==============


**TODO:**

* creating/modifying symbols
* working with style (:class:`QgsStyle <qgis.core.QgsStyle>`)
* working with color ramps (:class:`QgsColorRamp <qgis.core.QgsColorRamp>`)
* exploring symbol layer and renderer registries


.. _supported formats by OGR: https://gdal.org/ogr_formats.html
