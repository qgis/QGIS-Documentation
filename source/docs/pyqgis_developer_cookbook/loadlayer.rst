.. _loadlayerpy:

**************
Loading Layers
**************

.. contents::
   :local:

Let's open some layers with data. QGIS recognizes vector and raster layers.
Additionally, custom layer types are available, but we are not going to discuss
them here.

.. index::
  pair: Vector layers; Loading

Vector Layers
=============

To load a vector layer, specify layer's data source identifier, name for the
layer and provider's name:

::

  layer = QgsVectorLayer(data_source, layer_name, provider_name)
  if not layer.isValid():
    print "Layer failed to load!"

The data source identifier is a string and it is specific to each vector data
provider. Layer's name is used in the layer list widget. It is important to
check whether the layer has been loaded successfully. If it was not, an invalid
layer instance is returned.

The quickest way to open and display a vector layer in QGIS is the addVectorLayer
function of the :class:`QgisInterface`:

::

  layer = iface.addVectorLayer("/path/to/shapefile/file.shp", "layer name you like", "ogr")
  if not layer:
    print "Layer failed to load!"

This creates a new layer and adds it to the map layer registry (making it appear
in the layer list) in one step. The function returns the layer instance or `None`
if the layer couldn't be loaded.

The following list shows how to access various data sources using vector data
providers:

.. index::
  pair: Loading; OGR layers

* OGR library (shapefiles and many other file formats) --- data source is the
  path to the file:

  * for shapefile::

     vlayer = QgsVectorLayer("/path/to/shapefile/file.shp", "layer_name_you_like", "ogr")


  * for dxf (note the internal options in data source uri)::

     uri = "/path/to/dxffile/file.dxf|layername=entities|geometrytype=Point"
     vlayer = QgsVectorLayer(uri, "layer_name_you_like", "ogr")


.. index::
  pair: Loading; PostGIS layers

* PostGIS database --- data source is a string with all information needed to
  create a connection to PostgreSQL database. :class:`QgsDataSourceURI` class
  can generate this string for you. Note that QGIS has to be compiled with
  Postgres support, otherwise this provider isn't available:

  ::

    uri = QgsDataSourceURI()
    # set host name, port, database name, username and password
    uri.setConnection("localhost", "5432", "dbname", "johny", "xxx")
    # set database schema, table name, geometry column and optionally
    # subset (WHERE clause)
    uri.setDataSource("public", "roads", "the_geom", "cityid = 2643")

    vlayer = QgsVectorLayer(uri.uri(False), "layer name you like", "postgres")

  .. note:: The ``False`` argument passed to ``uri.uri(False)`` prevents the
     expansion of the authentication configuration parameters, if you are not using
     any authentication configuration this argument does not make any difference.

.. index::
  pair: Loading; Delimited text files

* CSV or other delimited text files --- to open a file with a semicolon as a
  delimiter, with field "x" for x-coordinate and field "y" for y-coordinate
  you would use something like this:

  ::

    uri = "/some/path/file.csv?delimiter=%s&xField=%s&yField=%s" % (";", "x", "y")
    vlayer = QgsVectorLayer(uri, "layer name you like", "delimitedtext")

  .. note:: The provider string is structured as a URL, so
     the path must be prefixed with ``file://``. Also it allows WKT (well known
     text) formatted geometries as an alternative to ``x`` and ``y`` fields,
     and allows the coordinate reference system to be specified. For example:

  ::

    uri = "file:///some/path/file.csv?delimiter=%s&crs=epsg:4723&wktField=%s" % (";", "shape")

.. index::
  pair: Loading; GPX files

* GPX files --- the "gpx" data provider reads tracks, routes and waypoints from
  gpx files. To open a file, the type (track/route/waypoint) needs to be
  specified as part of the url:

  ::

    uri = "path/to/gpx/file.gpx?type=track"
    vlayer = QgsVectorLayer(uri, "layer name you like", "gpx")

.. index::
  pair: Loading; SpatiaLite layers

* SpatiaLite database --- Similarly to PostGIS databases,
  :class:`QgsDataSourceURI` can be used for generation of data
  source identifier:

  ::

    uri = QgsDataSourceURI()
    uri.setDatabase('/home/martin/test-2.3.sqlite')
    schema = ''
    table = 'Towns'
    geom_column = 'Geometry'
    uri.setDataSource(schema, table, geom_column)

    display_name = 'Towns'
    vlayer = QgsVectorLayer(uri.uri(), display_name, 'spatialite')

.. index::
  pair: Loading; MySQL geometries

* MySQL WKB-based geometries, through OGR --- data source is the connection
  string to the table:

  ::

    uri = "MySQL:dbname,host=localhost,port=3306,user=root,password=xxx|layername=my_table"
    vlayer = QgsVectorLayer( uri, "my table", "ogr" )

.. index::
  pair: WFS vector; Loading

* WFS connection:. the connection is defined with a URI and using the ``WFS`` provider:

  ::

    uri = "http://localhost:8080/geoserver/wfs?srsname=EPSG:23030&typename=union&version=1.0.0&request=GetFeature&service=WFS",
    vlayer = QgsVectorLayer(uri, "my wfs layer", "WFS")

  The uri can be created using the standard ``urllib`` library:

  ::

    params = {
        'service': 'WFS',
        'version': '1.0.0',
        'request': 'GetFeature',
        'typename': 'union',
        'srsname': "EPSG:23030"
    }
    uri = 'http://localhost:8080/geoserver/wfs?' + urllib.unquote(urllib.urlencode(params))


.. note::

   You can change the data source of an existing layer by calling :func:`setDataSource()`
   on a :class:`QgsVectorLayer` instance, as in the following example::

    # layer is a vector layer, uri is a QgsDataSourceURI instance
    layer.setDataSource(uri.uri(), "layer name you like", "postgres")


.. index::
  pair: Raster layers; Loading


Raster Layers
=============

For accessing raster files, GDAL library is used. It supports a wide range of
file formats. In case you have troubles with opening some files, check whether
your GDAL has support for the particular format (not all formats are available
by default). To load a raster from a file, specify its file name and base name:

::

  fileName = "/path/to/raster/file.tif"
  fileInfo = QFileInfo(fileName)
  baseName = fileInfo.baseName()
  rlayer = QgsRasterLayer(fileName, baseName)
  if not rlayer.isValid():
    print "Layer failed to load!"


Similarly to vector layers, raster layers can be loaded using the addRasterLayer
function of the :class:`QgisInterface`:

::

  iface.addRasterLayer("/path/to/raster/file.tif", "layer name you like")

This creates a new layer and adds it to the map layer registry (making it appear
in the layer list) in one step.

Raster layers can also be created from a WCS service:

::

    layer_name = 'modis'
    uri = QgsDataSourceURI()
    uri.setParam('url', 'http://demo.mapserver.org/cgi-bin/wcs')
    uri.setParam("identifier", layer_name)
    rlayer = QgsRasterLayer(str(uri.encodedUri()), 'my wcs layer', 'wcs')

detailed URI settings can be found in `provider
documentation <https://github.com/qgis/QGIS/blob/master/src/providers/wcs/URI>`_

.. index::
  pair: Loading; WMS raster

Alternatively you can load a raster layer from WMS server. However currently
it's not possible to access GetCapabilities response from API --- you have to
know what layers you want:

::

    urlWithParams = 'url=http://irs.gis-lab.info/?layers=landsat&styles=&format=image/jpeg&crs=EPSG:4326'
    rlayer = QgsRasterLayer(urlWithParams, 'some layer name', 'wms')
    if not rlayer.isValid():
      print "Layer failed to load!"

.. index:: Map layer registry

Map Layer Registry
==================

If you would like to use the opened layers for rendering, do not forget to add
them to map layer registry. The map layer registry takes ownership of layers
and they can be later accessed from any part of the application by their unique
ID. When the layer is removed from map layer registry, it gets deleted, too.

.. index:: Map layer registry; Adding a layer

Adding a layer to the registry:

::

  QgsMapLayerRegistry.instance().addMapLayer(layer)

Layers are destroyed automatically on exit, however if you want to delete the
layer explicitly, use:

::

  QgsMapLayerRegistry.instance().removeMapLayer(layer_id)

For a list of loaded layers and layer ids, use:

::

  QgsMapLayerRegistry.instance().mapLayers()
