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
        QgsProviderRegistry
    )

    iface = start_qgis()


.. _loadlayerpy:

**************
Loading Layers
**************

.. hint:: The code snippets on this page need the following imports:

 .. testcode:: loadlayer

  import os # This is is needed in the pyqgis console also
  from qgis.core import (
      QgsVectorLayer
  )

.. only:: html

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

.. .. testoutput:: loadlayer
   :hide:

   (2): Using non-preferred coordinate operation between EPSG:2964 and EPSG:4326. Using +proj=pipeline +step +proj=unitconvert +xy_in=us-ft +xy_out=m +step +inv +proj=aea +lat_0=50 +lon_0=-154 +lat_1=55 +lat_2=65 +x_0=0 +y_0=0 +ellps=clrk66 +step +proj=push +v_3 +step +proj=cart +ellps=clrk66 +step +proj=helmert +x=-5 +y=135 +z=172 +step +inv +proj=cart +ellps=WGS84 +step +proj=pop +v_3 +step +proj=unitconvert +xy_in=rad +xy_out=deg, preferred +proj=pipeline +step +proj=unitconvert +xy_in=us-ft +xy_out=m +step +inv +proj=aea +lat_0=50 +lon_0=-154 +lat_1=55 +lat_2=65 +x_0=0 +y_0=0 +ellps=clrk66 +step +proj=hgridshift +grids=us_noaa_alaska.tif +step +proj=unitconvert +xy_in=rad +xy_out=deg.

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
   pair: Loading; GDAL layers

* GDAL library (Shapefile and many other file formats) --- data source is the
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
    # set database schema, table name, geometry column and optionally
    # subset (WHERE clause)
    uri.setDataSource("public", "roads", "the_geom", "cityid = 2643", "primary_key_field")

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

* MySQL WKB-based geometries, through GDAL --- data source is the connection
  string to the table:

  .. code-block:: python

      uri = "MySQL:dbname,host=localhost,port=3306,user=root,password=xxx|layername=my_table"
      vlayer = QgsVectorLayer( uri, "my table", "ogr" )
      QgsProject.instance().addMapLayer(vlayer)

.. index::
  pair: WFS; Loading

* WFS connection: the connection is defined with a URI and using the ``WFS`` provider:

  .. testcode:: loadlayer

      uri = "https://demo.mapserver.org/cgi-bin/wfs?service=WFS&version=2.0.0&request=GetFeature&typename=ms:cities"
      vlayer = QgsVectorLayer(uri, "my wfs layer", "WFS")

  .. .. testoutput:: loadlayer
     :hide:

     (2): Using non-preferred coordinate operation between EPSG:2964 and EPSG:4326. Using +proj=pipeline +step +proj=unitconvert +xy_in=us-ft +xy_out=m +step +inv +proj=aea +lat_0=50 +lon_0=-154 +lat_1=55 +lat_2=65 +x_0=0 +y_0=0 +ellps=clrk66 +step +proj=push +v_3 +step +proj=cart +ellps=clrk66 +step +proj=helmert +x=-5 +y=135 +z=172 +step +inv +proj=cart +ellps=WGS84 +step +proj=pop +v_3 +step +proj=unitconvert +xy_in=rad +xy_out=deg, preferred +proj=pipeline +step +proj=unitconvert +xy_in=us-ft +xy_out=m +step +inv +proj=aea +lat_0=50 +lon_0=-154 +lat_1=55 +lat_2=65 +x_0=0 +y_0=0 +ellps=clrk66 +step +proj=hgridshift +grids=us_noaa_alaska.tif +step +proj=unitconvert +xy_in=rad +xy_out=deg.

  The uri can be created using the standard ``urllib`` library:

  .. testcode:: loadlayer

      import urllib

      params = {
          'service': 'WFS',
          'version': '2.0.0',
          'request': 'GetFeature',
          'typename': 'ms:cities',
          'srsname': "EPSG:4326"
      }
      uri2 = 'https://demo.mapserver.org/cgi-bin/wfs?' + urllib.parse.unquote(urllib.parse.urlencode(params))

.. note:: You can change the data source of an existing layer by calling
   :meth:`setDataSource() <qgis.core.QgsMapLayer.setDataSource>`
   on a :class:`QgsVectorLayer <qgis.core.QgsVectorLayer>` instance, as
   in the following example:

   .. testcode:: loadlayer

      uri = "https://demo.mapserver.org/cgi-bin/wfs?service=WFS&version=2.0.0&request=GetFeature&typename=ms:cities"
      provider_options = QgsDataProvider.ProviderOptions()
      # Use project's transform context
      provider_options.transformContext = QgsProject.instance().transformContext()
      vlayer.setDataSource(uri, "layer name you like", "WFS", provider_options)

      del(vlayer)


.. index::
  pair: Raster layers; Loading


Raster Layers
======================================================================

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


To load a PostGIS raster:

PostGIS rasters, similar to PostGIS vectors, can be added to a project using a URI string.
It is efficient to keep a reusable dictionary of strings for the database connection parameters.
This makes it easy to edit the dictionary for the applicable connection.
The dictionary is then encoded into a URI using the 'postgresraster' provider metadata object.
After that the raster can be added to the project.

.. testcode:: loadlayer

 uri_config = {
     # database parameters
     'dbname':'gis_db',      # The PostgreSQL database to connect to.
     'host':'localhost',     # The host IP address or localhost.
     'port':'5432',          # The port to connect on.
     'sslmode':QgsDataSourceUri.SslDisable, # SslAllow, SslPrefer, SslRequire, SslVerifyCa, SslVerifyFull
     # user and password are not needed if stored in the authcfg or service
     'authcfg':'QconfigId',  # The QGIS athentication database ID holding connection details.
     'service': None,         # The PostgreSQL service to be used for connection to the database.
     'username':None,        # The PostgreSQL user name.
     'password':None,        # The PostgreSQL password for the user.
     # table and raster column details
     'schema':'public',      # The database schema that the table is located in.
     'table':'my_rasters',   # The database table to be loaded.
     'geometrycolumn':'rast',# raster column in PostGIS table
     'sql':None,             # An SQL WHERE clause. It should be placed at the end of the string.
     'key':None,             # A key column from the table.
     'srid':None,            # A string designating the SRID of the coordinate reference system.
     'estimatedmetadata':'False', # A boolean value telling if the metadata is estimated.
     'type':None,            # A WKT string designating the WKB Type.
     'selectatid':None,      # Set to True to disable selection by feature ID.
     'options':None,         # other PostgreSQL connection options not in this list.
     'enableTime': None,
     'temporalDefaultTime': None,
     'temporalFieldIndex': None,
     'mode':'2',             # GDAL 'mode' parameter, 2 unions raster tiles, 1 adds tiles separately (may require user input)
 }
 # remove any NULL parameters
 uri_config = {key:val for key, val in uri_config.items() if val is not None}
 # get the metadata for the raster provider and configure the URI
 md = QgsProviderRegistry.instance().providerMetadata('postgresraster')
 uri = QgsDataSourceUri(md.encodeUri(uri_config))

 # the raster can then be loaded into the project
 rlayer = iface.addRasterLayer(uri.uri(False), "raster layer name", "postgresraster")



Raster layers can also be created from a WCS service:

.. code-block:: python

 layer_name = 'modis'
 url = "https://demo.mapserver.org/cgi-bin/wcs?identifier={}".format(layer_name)
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

      urlWithParams = "crs=EPSG:4326&format=image/png&layers=continents&styles&url=https://demo.mapserver.org/cgi-bin/wms"
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
be removed by the user in the QGIS interface, or via Python using the
:meth:`removeMapLayer() <qgis.core.QgsProject.removeMapLayer>` method.

.. index:: Qgis project; Adding a layer

Adding a layer to the current project is done using the
:meth:`addMapLayer() <qgis.core.QgsProject.addMapLayer>` method:

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
