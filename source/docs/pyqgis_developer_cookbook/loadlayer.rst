.. loadlayer:

**************
Loading Layers
**************

Let's open some layers with data. QGIS recognizes vector and raster layers.
Additionally, custom layer types are available, but we are not going to discuss
them here.

.. index::
  pair: vector layers; loading

Vector Layers
=============

To load a vector layer, specify layer's data source identifier, name for the
layer and provider's name::

  layer = QgsVectorLayer(data_source, layer_name, provider_name)
  if not layer.isValid():
    print "Layer failed to load!"

The data source identifier is a string and it is specific to each vector data
provider. Layer's name is used in the layer list widget. It is important to
check whether the layer has been loaded successfully. If it was not, an invalid
layer instance is returned.

The quickest way to open and display a vector layer in QGIS is the addVectorLayer function of the :class:`QgisInterface`:

  ::

    layer = iface.addVectorLayer("/path/to/shapefile/file.shp", "layer_name_you_like", "ogr")
    if not layer:
      print "Layer failed to load!"

This creates a new layer and adds it to the map layer registry (making it appear in the layer list) in one step. The function returns the layer instance or `None` if the layer couldn't be loaded.

The following list shows how to access various data sources using vector data
providers:

.. index::
  pair: loading; OGR layers

* OGR library (shapefiles and many other file formats) --- data source is the
  path to the file

  ::

    vlayer = QgsVectorLayer("/path/to/shapefile/file.shp", "layer_name_you_like", "ogr")

.. index::
  pair: loading; PostGIS layers

* PostGIS database --- data source is a string with all information needed to
  create a connection to PostgreSQL database. :class:`QgsDataSourceURI` class
  can generate this string for you. Note that QGIS has to be compiled with
  Postgres support, otherwise this provider isn't available.

  ::

    uri = QgsDataSourceURI()
    # set host name, port, database name, username and password
    uri.setConnection("localhost", "5432", "dbname", "johny", "xxx")
    # set database schema, table name, geometry column and optionally
    # subset (WHERE clause)
    uri.setDataSource("public", "roads", "the_geom", "cityid = 2643")

    vlayer = QgsVectorLayer(uri.uri(), "layer_name_you_like", "postgres")

.. index::
  pair: loading; delimited text layers

* CSV or other delimited text files --- to open a file with a semicolon as a
  delimiter, with field "x" for x-coordinate and field "y" with y-coordinate
  you would use something like this

  ::

    uri = "/some/path/file.csv?delimiter=%s&xField=%s&yField=%s" % (";", "x", "y")
    vlayer = QgsVectorLayer(uri, "layer_name_you_like", "delimitedtext")

  Note: from QGIS version 1.7 the provider string is structured as a URL, so
  the path must be prefixed with *file://*. Also it allows WKT (well known
  text) formatted geometries as an alternative to "x" and "y" fields, and allows
  the coordinate reference system to be specified. For example

  ::

    uri = "file:///some/path/file.csv?delimiter=%s&crs=epsg:4723&wktField=%s" % (";", "shape")

.. index::
  pair: loading; GPX files

* GPX files --- the "gpx" data provider reads tracks, routes and waypoints from
  gpx files. To open a file, the type (track/route/waypoint) needs to be
  specified as part of the url

  ::

    uri = "path/to/gpx/file.gpx?type=track"
    vlayer = QgsVectorLayer(uri, "layer_name_you_like", "gpx")

.. index::
  pair: loading; SpatiaLite layers

* SpatiaLite database --- supported from QGIS v1.1. Similarly to PostGIS
  databases, :class:`QgsDataSourceURI` can be used for generation of data
  source identifier

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
  pair: loading; MySQL geometries

* MySQL WKB-based geometries, through OGR --- data source is the connection
  string to the table

  ::

    uri = "MySQL:dbname,host=localhost,port=3306,user=root,password=xxx|layername=my_table"
    vlayer = QgsVectorLayer( uri, "my_table", "ogr" )

.. index::
  pair: raster layers; loading

* WFS connection:. the connection is defined with a URI and using the ``WFS`` provider

  ::

    uri = "http://localhost:8080/geoserver/wfs?srsname=EPSG:23030&typename=union&version=1.0.0&request=GetFeature&service=WFS",
    vlayer = QgsVectorLayer("my_wfs_layer", "WFS")

  The uri can be created using the standard ``urllib`` library.

  ::

    params = {
        'service': 'WFS',
        'version': '1.0.0',
        'request': 'GetFeature',
        'typename': 'union',
        'srsname': "EPSG:23030"
    }
    uri = 'http://localhost:8080/geoserver/wfs?' + urllib.unquote(urllib.urlencode(params))


Raster Layers
=============

For accessing raster files, GDAL library is used. It supports a wide range of
file formats. In case you have troubles with opening some files, check whether
your GDAL has support for the particular format (not all formats are available
by default). To load a raster from a file, specify its file name and base name

::

  fileName = "/path/to/raster/file.tif"
  fileInfo = QFileInfo(fileName)
  baseName = fileInfo.baseName()
  rlayer = QgsRasterLayer(fileName, baseName)
  if not rlayer.isValid():
    print "Layer failed to load!"

.. index::
  pair: loading; WMS raster

Similarly to vector layers, raster layers can be loaded using the addRasterLayer function of the :class:`QgisInterface`:

  ::

    iface.addRasterLayer("/path/to/raster/file.tif", "layer_name_you_like")

This creates a new layer and adds it to the map layer registry (making it appear in the layer list) in one step.

Raster layers can also be created from a WCS service.

::

    layer_name = 'modis'
    uri = QgsDataSourceURI()
    uri.setParam('url', 'http://demo.mapserver.org/cgi-bin/wcs')
    uri.setParam("identifier", layer_name)
    rlayer = QgsRasterLayer(str(uri.encodedUri()), 'my_wcs_layer', 'wcs')

detailed URI settings can be found in `provider
documentation <https://github.com/qgis/QGIS/blob/master/src/providers/wcs/URI>`_

Alternatively you can load a raster layer from WMS server. However currently
it's not possible to access GetCapabilities response from API --- you have to
know what layers you want

::

    urlWithParams = 'url=http://mesonet.agron.iastate.edu/cgi-bin/wms/nexrad/n0r-t.cgi?format=image/png&layers=nexrad-n0r-wmst&styles=&crs=EPSG:3857&'
    rlayer = QgsRasterLayer(urlWithParams,'nexrad-n0r-wmst', 'wms')
    if not rlayer.isValid():
      print "Layer failed to load!"

.. index:: map layer registry

Map Layer Registry
==================

If you would like to use the opened layers for rendering, do not forget to add
them to map layer registry. The map layer registry takes ownership of layers
and they can be later accessed from any part of the application by their unique
ID. When the layer is removed from map layer registry, it gets deleted, too.

.. index:: map layer registry; adding a layer

Adding a layer to the registry

::

  QgsMapLayerRegistry.instance().addMapLayer(layer)

Layers are destroyed automatically on exit, however if you want to delete the
layer explicitly, use

::

  QgsMapLayerRegistry.instance().removeMapLayer(layer_id)

For a list of loaded layers and layer ids, use

::

  QgsMapLayerRegistry.instance().mapLayers()

**TODO:**
   More about map layer registry?
