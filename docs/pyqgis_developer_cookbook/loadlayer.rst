
.. highlight:: python
   :linenothreshold: 5


.. testsetup:: loadlayer

    from qgis.core import (
        QgsDataProvider,
        QgsProject,
        QgsRasterLayer,
        QgsVectorLayer,
        QgsApplication,
        QgsDataSourceUri,
        QgsLayerTreeLayer,
    )

    iface = start_qgis()


.. _loadlayerpy:

**************
Loading Layers
**************

The code snippets on this page need the following imports:

.. testcode:: loadlayer

 import os # This is is needed in the pyqgis console also
 from qgis.core import (
     QgsVectorLayer
 )

.. contents::
   :local:

Let's open some layers with data. QGIS recognizes vector and raster layers.
Additionally, custom layer types are available, but we are not going to discuss
them here.

.. index::
  pair: Vector layers; Loading

Vector Layers
=============

To create and add a vector layer instance to the project, specify the layer's data source
identifier, name for the layer and provider's name:

.. testcode:: loadlayer

 # get the path to the shapefile e.g. /home/project/data/ports.shp
 path_to_airports_layer = "testdata/airports.shp"

 # The format is:
 # vlayer = QgsVectorLayer(data_source, layer_name, provider_name)

 vlayer = QgsVectorLayer(path_to_airports_layer, "Airports layer", "ogr")
 if not vlayer.isValid():
     print("Layer failed to load!")
 else:
     QgsProject.instance().addMapLayer(vlayer)

The data source identifier is a string and it is specific to each vector data
provider. Layer's name is used in the layer list widget. It is important to
check whether the layer has been loaded successfully. If it was not, an invalid
layer instance is returned.

For a geopackage vector layer:

.. testcode:: loadlayer

 # get the path to a geopackage  e.g. /usr/share/qgis/resources/data/world_map.gpkg
 path_to_gpkg = os.path.join(QgsApplication.pkgDataPath(), "resources", "data", "world_map.gpkg")
 # append the layername part
 gpkg_countries_layer = path_to_gpkg + "|layername=countries"
 # e.g. gpkg_places_layer = "/usr/share/qgis/resources/data/world_map.gpkg|layername=countries"
 vlayer = QgsVectorLayer(gpkg_countries_layer, "Countries layer", "ogr")
 if not vlayer.isValid():
     print("Layer failed to load!")
 else:
     QgsProject.instance().addMapLayer(vlayer)

The quickest way to open and display a vector layer in QGIS is the
:meth:`addVectorLayer() <qgis.gui.QgisInterface.addVectorLayer>`
method of the :class:`QgisInterface <qgis.gui.QgisInterface>`:

.. testcode:: loadlayer

    vlayer = iface.addVectorLayer(path_to_airports_layer, "Airports layer", "ogr")
    if not vlayer:
      print("Layer failed to load!")

This creates a new layer and adds it to the current QGIS project (making it appear
in the layer list) in one step. The function returns the layer instance or ``None``
if the layer couldn't be loaded.

The following list shows how to access various data sources using vector data
providers:

.. index::
   pair: Loading; OGR layers

* OGR library (Shapefile and many other file formats) --- data source is the
  path to the file:

  * for Shapefile:

    .. testcode:: loadlayer

       vlayer = QgsVectorLayer("testdata/airports.shp", "layer_name_you_like", "ogr")
       QgsProject.instance().addMapLayer(vlayer)

  * for dxf (note the internal options in data source uri):

    .. testcode:: loadlayer

       uri = "testdata/sample.dxf|layername=entities|geometrytype=Polygon"
       vlayer = QgsVectorLayer(uri, "layer_name_you_like", "ogr")
       QgsProject.instance().addMapLayer(vlayer)

.. index::
   pair: Loading; PostGIS layers

* PostGIS database - data source is a string with all information needed to
  create a connection to PostgreSQL database.

  :class:`QgsDataSourceUri <qgis.core.QgsDataSourceUri>` class
  can generate this string for you. Note that QGIS has to be compiled with
  Postgres support, otherwise this provider isn't available:

  .. code-block:: python

    uri = QgsDataSourceUri()
    # set host name, port, database name, username and password
    uri.setConnection("localhost", "5432", "dbname", "johny", "xxx")
    provider_options = QgsDataProvider.ProviderOptions()
    # Use project's transform context
    provider_options.transformContext = QgsProject.instance().transformContext()
    # set database schema, table name, geometry column and optionally
    # subset (WHERE clause)
    uri.setDataSource("public", "roads", "the_geom", "cityid = 2643", provider_options)

    vlayer = QgsVectorLayer(uri.uri(False), "layer name you like", "postgres")

  .. note:: The ``False`` argument passed to ``uri.uri(False)`` prevents the
     expansion of the authentication configuration parameters, if you are not using
     any authentication configuration this argument does not make any difference.

.. index::
  pair: Loading; Delimited text files

* CSV or other delimited text files --- to open a file with a semicolon as a
  delimiter, with field "x" for X coordinate and field "y" for Y coordinate
  you would use something like this:

  .. testcode:: loadlayer

      uri = "file://{}/testdata/delimited_xy.csv?delimiter={}&xField={}&yField={}".format(os.getcwd(), ";", "x", "y")
      vlayer = QgsVectorLayer(uri, "layer name you like", "delimitedtext")
      QgsProject.instance().addMapLayer(vlayer)

  .. note:: The provider string is structured as a URL, so
     the path must be prefixed with ``file://``. Also it allows WKT (well known
     text) formatted geometries as an alternative to ``x`` and ``y`` fields,
     and allows the coordinate reference system to be specified. For example:

     .. testcode:: loadlayer

        uri = "file:///some/path/file.csv?delimiter={}&crs=epsg:4723&wktField={}".format(";", "shape")

.. index::
  pair: Loading; GPX files

* GPX files --- the "gpx" data provider reads tracks, routes and waypoints from
  gpx files. To open a file, the type (track/route/waypoint) needs to be
  specified as part of the url:

  .. testcode:: loadlayer

      uri = "testdata/layers.gpx?type=track"
      vlayer = QgsVectorLayer(uri, "layer name you like", "gpx")
      QgsProject.instance().addMapLayer(vlayer)

.. index::
  pair: Loading; SpatiaLite layers

* SpatiaLite database --- Similarly to PostGIS databases,
  :class:`QgsDataSourceUri <qgis.core.QgsDataSourceUri>` can be used for generation of data
  source identifier:

  .. testcode:: loadlayer

      uri = QgsDataSourceUri()
      uri.setDatabase('/home/martin/test-2.3.sqlite')
      schema = ''
      table = 'Towns'
      geom_column = 'Geometry'
      uri.setDataSource(schema, table, geom_column)

      display_name = 'Towns'
      vlayer = QgsVectorLayer(uri.uri(), display_name, 'spatialite')
      QgsProject.instance().addMapLayer(vlayer)

.. index::
  pair: Loading; MySQL geometries

* MySQL WKB-based geometries, through OGR --- data source is the connection
  string to the table:

  .. code-block:: python

      uri = "MySQL:dbname,host=localhost,port=3306,user=root,password=xxx|layername=my_table"
      vlayer = QgsVectorLayer( uri, "my table", "ogr" )
      QgsProject.instance().addMapLayer(vlayer)

.. index::
  pair: WFS vector; Loading

* WFS connection:. the connection is defined with a URI and using the ``WFS`` provider:

  .. testcode:: loadlayer

        uri = "https://demo.geo-solutions.it/geoserver/ows?service=WFS&request=GetFature&typename=topp:tasmania_water_bodies"
        vlayer = QgsVectorLayer(uri, "my wfs layer", "WFS")
        QgsProject.instance().addMapLayer(vlayer)

  The uri can be created using the standard ``urllib`` library:

  .. testcode:: loadlayer

      import urllib

      params = {
          'service': 'WFS',
          'version': '1.0.0',
          'request': 'GetFeature',
          'typename': 'topp:tasmania_water_bodies',
          'srsname': "EPSG:4326"
      }
      uri2 = 'http://localhost:8080/geoserver/wfs?' + urllib.parse.unquote(urllib.parse.urlencode(params))


.. note:: You can change the data source of an existing layer by calling
   :meth:`setDataSource() <qgis.core.QgsVectorLayer.setDataSource>`
   on a :class:`QgsVectorLayer <qgis.core.QgsVectorLayer>` instance, as in the following example:

   .. testcode:: loadlayer

      uri = "https://demo.geo-solutions.it/geoserver/ows?service=WFS&request=GetFature&typename=topp:tasmania_water_bodies"
      provider_options = QgsDataProvider.ProviderOptions()
      # Use project's transform context
      provider_options.transformContext = QgsProject.instance().transformContext()
      vlayer.setDataSource(uri, "layer name you like", "WFS", provider_options)
      QgsProject.instance().addMapLayer(vlayer)


.. index::
  pair: Raster layers; Loading


Raster Layers
=============

For accessing raster files, GDAL library is used. It supports a wide range of
file formats. In case you have troubles with opening some files, check whether
your GDAL has support for the particular format (not all formats are available
by default). To load a raster from a file, specify its filename and display name:

.. testcode:: loadlayer

 # get the path to a tif file  e.g. /home/project/data/srtm.tif
 path_to_tif = "qgis-projects/python_cookbook/data/srtm.tif"
 rlayer = QgsRasterLayer(path_to_tif, "SRTM layer name")
 if not rlayer.isValid():
     print("Layer failed to load!")

To load a raster from a geopackage:

.. testcode:: loadlayer

 # get the path to a geopackage  e.g. /home/project/data/data.gpkg
 path_to_gpkg = os.path.join(os.getcwd(), "testdata", "sublayers.gpkg")
 # gpkg_raster_layer = "GPKG:/home/project/data/data.gpkg:srtm"
 gpkg_raster_layer = "GPKG:" + path_to_gpkg + ":srtm"

 rlayer = QgsRasterLayer(gpkg_raster_layer, "layer name you like", "gdal")

 if not rlayer.isValid():
     print("Layer failed to load!")

Similarly to vector layers, raster layers can be loaded using the addRasterLayer
function of the :class:`QgisInterface <qgis.gui.QgisInterface>` object:

.. testcode:: loadlayer

    iface.addRasterLayer(path_to_tif, "layer name you like")

This creates a new layer and adds it to the current project (making it appear
in the layer list) in one step.

Raster layers can also be created from a WCS service:

.. code-block:: python

 layer_name = 'nurc:mosaic'
 uri = "https://demo.geo-solutions.it/geoserver/ows?identifier={}".format(layer_name)
 rlayer = QgsRasterLayer(uri, 'my wcs layer', 'wcs')

Here is a description of the parameters that the WCS URI can contain:

WCS URI is composed of **key=value** pairs separated by ``&``. It is the same
format like query string in URL, encoded the same way. :class:`QgsDataSourceUri <qgis.core.QgsDataSourceUri>`
should be used to construct the URI to ensure that special characters are
encoded properly.


* **url** (required) : WCS Server URL. Do not use VERSION in URL, because each
  version of WCS is using different parameter name for **GetCapabilities**
  version, see param version.
* **identifier** (required) : Coverage name
* **time** (optional) : time position or time period
  (beginPosition/endPosition[/timeResolution])
* **format** (optional) : Supported format name. Default is the first supported
  format with tif in name or the first supported format.
* **crs** (optional) : CRS in form AUTHORITY:ID, e.g. EPSG:4326. Default is
  EPSG:4326 if supported or the first supported CRS.
* **username** (optional) : Username for basic authentication.
* **password** (optional) : Password for basic authentication.
* **IgnoreGetMapUrl** (optional, hack) : If specified (set to 1), ignore
  GetCoverage URL advertised by GetCapabilities. May be necessary if a server is
  not configured properly.
* **InvertAxisOrientation** (optional, hack) : If specified (set to 1), switch
  axis in GetCoverage request. May be necessary for geographic CRS if a server
  is using wrong axis order.
* **IgnoreAxisOrientation** (optional, hack) : If specified (set to 1), do not
  invert axis orientation according to WCS standard for geographic CRS.
* **cache** (optional) : cache load control, as described in
  QNetworkRequest::CacheLoadControl, but request is resend as PreferCache if
  failed with AlwaysCache. Allowed values: AlwaysCache, PreferCache,
  PreferNetwork, AlwaysNetwork. Default is AlwaysCache.

.. index::
  pair: Loading; WMS raster

Alternatively you can load a raster layer from WMS server. However currently
it's not possible to access GetCapabilities response from API --- you have to
know what layers you want:

.. testcode:: loadlayer

      urlWithParams = "crs=EPSG:4326&format=image/png&layers=tasmania&styles&url=https://demo.geo-solutions.it/geoserver/ows"
      rlayer = QgsRasterLayer(urlWithParams, 'some layer name', 'wms')
      if not rlayer.isValid():
        print("Layer failed to load!")

.. index:: Map layer registry

QgsProject instance
===================

If you would like to use the opened layers for rendering, do not forget to add
them to the :class:`QgsProject <qgis.core.QgsProject>` instance.
The :class:`QgsProject <qgis.core.QgsProject>` instance takes ownership of layers
and they can be later accessed from any part of the application by their unique
ID. When the layer is removed from the project, it gets deleted, too. Layers can
be removed by the user in the QGIS interface, or via Python using the :meth:`removeMapLayer() <qgis.core.QgsProject.removeMapLayer>` method.

.. index:: Qgis project; Adding a layer

Adding a layer to the current project is done using the :meth:`addMapLayer() <qgis.core.QgsProject.addMapLayer>` method:

.. testcode:: loadlayer

    QgsProject.instance().addMapLayer(rlayer)

To add a layer at an absolute position:

.. testcode:: loadlayer

    # first add the layer without showing it
    QgsProject.instance().addMapLayer(rlayer, False)
    # obtain the layer tree of the top-level group in the project
    layerTree = iface.layerTreeCanvasBridge().rootGroup()
    # the position is a number starting from 0, with -1 an alias for the end
    layerTree.insertChildNode(-1, QgsLayerTreeLayer(rlayer))

If you want to delete the layer use the :meth:`removeMapLayer() <qgis.core.QgsProject.removeMapLayer>` method:

.. testcode:: loadlayer

    # QgsProject.instance().removeMapLayer(layer_id)
    QgsProject.instance().removeMapLayer(rlayer.id())

In the above code, the layer id is passed (you can get it calling the :meth:`id() <qgis.core.QgsMapLayer.id>` method of the layer),
but you can also pass the layer object itself.

For a list of loaded layers and layer ids, use the :meth:`mapLayers() <qgis.core.QgsProject.mapLayers>` method:

.. testcode:: loadlayer

    QgsProject.instance().mapLayers()
