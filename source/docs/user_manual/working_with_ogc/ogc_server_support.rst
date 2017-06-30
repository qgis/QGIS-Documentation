.. only:: html

   |updatedisclaimer|

.. index:: QGIS Server, WMS Server, WFS Server, WCS Server

.. _`label_qgisserver`:


***********************
QGIS as OGC Data Server
***********************

.. only:: html

   .. contents::
      :local:

QGIS Server is an open source WMS 1.3, WFS 1.0.0 and WCS 1 1.1.1
implementation that, in addition, implements advanced cartographic features for
thematic mapping. The QGIS Server is a FastCGI/CGI (Common Gateway Interface)
application written in C++ that works together with a web server (e.g., Apache,
Lighttpd). It has Python plugin support allowing for fast and efficient
development and deployment of new features.
The original development of QGIS Server was funded by the EU projects Orchestra,
Sany and the city of Uster in Switzerland.

.. index:: SLD, SLD/SE
.. index:: FastCGI, CGI (Common Gateway Interface)

QGIS Server uses QGIS as back end for the GIS logic and for map rendering.
Furthermore, the Qt library is used for graphics and for platform-independent
C++ programming. In contrast to other WMS software, the QGIS Server uses
cartographic rules as a configuration language, both for the server
configuration and for the user-defined cartographic rules.

As QGIS desktop and QGIS Server use the same visualization libraries, the maps
that are published on the web look the same as in desktop GIS.

In the following sections, we will provide a sample configuration to set up
a QGIS Server on Debian/Ubuntu Linux. For more detailed installation
instructions on other platforms or distributions and more information on
working with QGIS Server, we recommend reading the :ref:`QGIS Server Training
Manual <training_qgis_server>` or :ref:`server_plugins`.

.. index:: Apache, Debian Squeeze

QGIS Server installation on Debian/Ubuntu
===========================================

At this point, we will give a short and simple sample installation how-to for
a minimal working configuration using Apache2 on Debian Squeeze (or with
negligible variations on Ubuntu 14.04).
Many other OSs provide packages for QGIS Server, too. If you have to build it
all from source, please refer to the URLs above.

Firstly, add the following debian GIS repository:

.. code-block:: bash

  $ cat /etc/apt/sources.list.d/debian-gis.list
  deb http://qgis.org/debian trusty main
  deb-src http://qgis.org/debian trusty main

  # Add keys
  $ sudo gpg --keyserver keyserver.ubuntu.com --recv-key 3FF5FFCAD71472C4
  $ sudo gpg --export --armor 3FF5FFCAD71472C4 | sudo apt-key add -

  # Update package list
  $ sudo apt-get update && sudo apt-get upgrade

Now, install QGIS Server:

.. code-block:: bash

  $ sudo apt-get install qgis-server python-qgis

Installation of a HelloWorld example plugin for testing the servers. You create
a directory to hold server plugins. This will be specified in the virtual host
configuration and passed on to the server through an environment variable:

.. code-block:: bash

  $ sudo mkdir -p /opt/qgis-server/plugins
  $ cd /opt/qgis-server/plugins
  $ sudo wget https://github.com/elpaso/qgis-helloserver/archive/master.zip
  # In case unzip was not installed before:
  $ sudo apt-get install unzip
  $ sudo unzip master.zip
  $ sudo mv qgis-helloserver-master HelloServer

Install the Apache server in a separate virtual host listening on port 80.
Enable the rewrite module to pass HTTP BASIC auth headers:

.. code-block:: bash

  $ sudo a2enmod rewrite
  $ cat /etc/apache2/conf-available/qgis-server-port.conf
  Listen 80
  $ sudo a2enconf qgis-server-port

This is the virtual host configuration, stored in
:file:`/etc/apache2/sites-available/001-qgis-server.conf`:

.. code-block:: apache

   <VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html

    ErrorLog ${APACHE_LOG_DIR}/qgis-server-error.log
    CustomLog ${APACHE_LOG_DIR}/qgis-server-access.log combined

    # Longer timeout for WPS... default = 40
    FcgidIOTimeout 120
    FcgidInitialEnv LC_ALL "en_US.UTF-8"
    FcgidInitialEnv PYTHONIOENCODING UTF-8
    FcgidInitialEnv LANG "en_US.UTF-8"
    FcgidInitialEnv QGIS_DEBUG 1
    FcgidInitialEnv QGIS_SERVER_LOG_FILE /tmp/qgis-000.log
    FcgidInitialEnv QGIS_SERVER_LOG_LEVEL 0
    FcgidInitialEnv QGIS_PLUGINPATH "/opt/qgis-server/plugins"

    # Needed for QGIS HelloServer plugin HTTP BASIC auth
    <IfModule mod_fcgid.c>
        RewriteEngine on
        RewriteCond %{HTTP:Authorization} .
        RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]
    </IfModule>

    ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/
    <Directory "/usr/lib/cgi-bin">
        AllowOverride All
        Options +ExecCGI -MultiViews +FollowSymLinks
	# for apache2 > 2.4
	Require all granted
        #Allow from all
    </Directory>
   </VirtualHost>

Now enable the virtual host and restart Apache:

.. code-block:: bash

  $ sudo a2ensite 001-qgis-server
  $ sudo service apache2 restart

Test the server with the HelloWorld plugin:

.. code-block:: bash

  $ wget -q -O - "http://localhost/cgi-bin/qgis_mapserv.fcgi?SERVICE=HELLO"
  HelloServer!


You can have a look at the default GetCapabilities of the QGIS server at:
:file:`http://localhost/cgi-bin/qgis_mapserv.fcgi?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetCapabilities`

.. tip::

   If you work with a feature that has many nodes then modifying and adding a
   new feature will fail. In this case it is possible to insert the following
   code into the :file:`001-qgis-server.conf` file:
   
   .. code-block:: apache

     <IfModule mod_fcgid.c>
     FcgidMaxRequestLen 26214400
     FcgidConnectTimeout 60
     </IfModule>

.. _`Creatingwmsfromproject`:

Creating a WMS/WFS/WCS server from a QGIS project
===================================================

To provide a new QGIS Server WMS, WFS or WCS, we have to create a QGIS project
file with some data. Here, we use the 'Alaska' shapefile from the QGIS sample
dataset. Define the colors and styles of the layers in QGIS and the project CRS,
if not already defined.

.. _figure_server_definitions:

.. figure:: /static/user_manual/working_with_ogc/ows_server_definition.png
   :align: center

   Definitions for a QGIS Server WMS/WFS/WCS project

Then, go to the :guilabel:`OWS Server` menu of the
:menuselection:`Project --> Project Properties` dialog and provide
some information about the OWS in the fields under
:guilabel:`Service Capabilities`.
This will appear in the GetCapabilities response of the WMS, WFS or WCS.
If you don't check |checkbox| :guilabel:`Service capabilities`,
QGIS Server will use the information given in the :file:`wms_metadata.xml` file
located in the :file:`cgi-bin` folder.

.. warning::

 If you're using the QGIS project with styling based on SVG files using
 relative paths then you should know that the server considers the path
 relative to its `qgis_mapserv.fcgi` file (not to the `qgs` file).
 So, if you deploy a project on the server and the SVG files are not placed
 accordingly, the output images may not respect the Desktop styling.
 To ensure this doesn't happen, you can simply copy the SVG files relative
 to the `qgis_mapserv.fcgi`. You can also create a symbolic link in the
 directory where the fcgi file resides that points to the directory containing
 the SVG files (on Linux/Unix).

WMS capabilities
-------------------

In the :guilabel:`WMS capabilities` section, you can define
the extent advertised in the WMS GetCapabilities response by entering
the minimum and maximum X and Y values in the fields under
:guilabel:`Advertised extent`.
Clicking :guilabel:`Use Current Canvas Extent` sets these values to the
extent currently displayed in the QGIS map canvas.
By checking |checkbox| :guilabel:`CRS restrictions`, you can restrict
in which coordinate reference systems (CRS) QGIS Server will offer
to render maps.
Use the |signPlus| button below to select those CRSs
from the Coordinate Reference System Selector, or click :guilabel:`Used`
to add the CRSs used in the QGIS project to the list.

If you have print composers defined in your project, they will be listed in the
`GetProjectSettings` response, and they can be used by the GetPrint request to
create prints, using one of the print composer layouts as a template.
This is a QGIS-specific extension to the WMS 1.3.0 specification.
If you want to exclude any print composer from being published by the WMS,
check |checkbox| :guilabel:`Exclude composers` and click the
|signPlus| button below.
Then, select a print composer from the :guilabel:`Select print composer` dialog
in order to add it to the excluded composers list.

If you want to exclude any layer or layer group from being published by the
WMS, check |checkbox| :guilabel:`Exclude Layers` and click the
|signPlus| button below.
This opens the :guilabel:`Select restricted layers and groups` dialog, which
allows you to choose the layers and groups that you don't want to be published.
Use the :kbd:`Shift` or :kbd:`Ctrl` key if you want to select multiple entries.

You can receive requested GetFeatureInfo as plain text, XML and GML. Default is XML,
text or GML format depends the output format chosen for the GetFeatureInfo request.

If you wish, you can check |checkbox| :guilabel:`Add geometry to feature response`.
This will include in the GetFeatureInfo response the geometries of the
features in a text format. If you want QGIS Server to advertise specific request URLs
in the WMS GetCapabilities response, enter the corresponding URL in the
:guilabel:`Advertised URL` field.
Furthermore, you can restrict the maximum size of the maps returned by the
GetMap request by entering the maximum width and height into the respective
fields under :guilabel:`Maximums for GetMap request`.

If one of your layers uses the Map Tip display (i.e. to show text using
expressions) this will be listed inside the GetFeatureInfo output. If the
layer uses a Value Map for one of its attributes, this information will also
be shown in the GetFeatureInfo output.

QGIS supports the following requests for WMS service:

* GetCapabilities
* GetMap
* GetFeatureInfo
* GetLegendGraphic (SLD profile)
* DescribeLayer (SLD profile)
* GetStyles (custom QGIS profile)

WFS capabilities
------------------

In the :guilabel:`WFS capabilities` area you can select the layers you
want to publish as WFS, and specify if they will allow update, insert and
delete operations.
If you enter a URL in the :guilabel:`Advertised URL` field of the
:guilabel:`WFS capabilities` section, QGIS Server will advertise this specific
URL in the WFS GetCapabilities response.

QGIS supports the following requests for WFS service:

* GetCapabilities
* DescribeFeatureType
* GetFeature
* Transaction

WCS capabilities
------------------

In the :guilabel:`WCS capabilities` area, you can select the layers that you
want to publish as WCS. If you enter a URL in the :guilabel:`Advertised URL`
field of the :guilabel:`WCS capabilities` section, QGIS Server will advertise
this specific URL in the WCS GetCapabilities response.

Now, save the session in a project file :file:`alaska.qgs`. To provide the
project as a WMS/WFS, we create a new folder ``/usr/lib/cgi-bin/project`` with
admin privileges and add the project file :file:`alaska.qgs` and a copy of the
:file:`qgis_mapserv.fcgi` file - that's all.

Now we test our project WMS, WFS and WCS. Add the WMS, WFS and WCS as described
in :ref:`ogc-wms-layers`, :ref:`ogc-wfs` and :ref:`ogc-wcs` to QGIS and load
the data. The URL is:

::

 http://localhost/cgi-bin/project/qgis_mapserv.fcgi

QGIS supports the following requests for WCS service:

* GetCapabilities
* DescribeCoverage
* GetCoverage

GetCapabilities Caching
-----------------------

In order to improve response time, QGIS Server caches the responses to the
``GetCapabilities`` requests. When such a request comes, QGIS Server is caching
the response and marking the cache valid.
At the same time, it watches if the project file changes.
If the project is changed then the cache is marked as invalid and QGIS Server
waits for a new request in order to recreate the cache.


Fine tuning your OWS
----------------------

For vector layers, the :guilabel:`Fields` menu of the
:menuselection:`Layer --> Properties` dialog allows you to define for each
attribute if it will be published or not.
By default, all the attributes are published by your WMS and WFS.
If you don't want a specific attribute to be published, uncheck the corresponding
checkbox in the :guilabel:`WMS` or :guilabel:`WFS` column.

You can overlay watermarks over the maps produced by your WMS by adding text
annotations or SVG annotations to the project file.
See the :ref:`sec_annotations` section for instructions on
creating annotations. For annotations to be displayed as watermarks on the WMS
output, the :guilabel:`Fixed map position` checkbox in the
:guilabel:`Annotation text` dialog must be unchecked.
This can be accessed by double clicking the annotation while one of the
annotation tools is active.
For SVG annotations, you will need either to set the project to save absolute
paths (in the :guilabel:`General` menu of the
:menuselection:`Project --> Project Properties` dialog) or to manually modify
the path to the SVG image so that it represents a valid relative path.



Server configuration and supported parameters
===============================================

QGIS Server supports some vendor parameters and requests that greatly enhance the
possibilities of customising its behavior. The following paragraphs list the vendor
parameters and the environment variables supported by the server.


Extra parameters supported by all request types
-------------------------------------------------

* **FILE_NAME** parameter: if set, the server response will be sent to the
  client as a file attachment with the specified file name.

* **MAP** parameter: Similar to MapServer, the ``MAP`` parameter can be used to
  specify the path to the QGIS project file. You can specify an absolute path
  or a path relative to the location of the server executable
  (:file:`qgis_mapserv.fcgi`).
  If not specified, QGIS Server searches for .qgs files in the directory where
  the server executable is located.

  Example::

    http://localhost/cgi-bin/qgis_mapserv.fcgi?\
      REQUEST=GetMap&MAP=/home/qgis/mymap.qgs&...

..  note::

    You can define a **QGIS_PROJECT_FILE** as an environment variable to tell
    the server executable where to find the QGIS project file. This variable
    will be the location where QGIS will look for the project file. If not
    defined it will use the MAP parameter in the request and finally look at
    the server executable directory.

.. _`extra-getmap-parameters`:

Extra parameters supported by the WMS GetMap request
-----------------------------------------------------

In the WMS GetMap request, QGIS Server accepts a couple of extra
parameters in addition to the standard parameters according to the
OGC WMS 1.3.0 specification:


* **DPI** parameter: The ``DPI`` parameter can be used to specify the requested
  output resolution.

  Example::

    http://localhost/cgi-bin/qgis_mapserv.fcgi?REQUEST=GetMap&DPI=300&...

* **IMAGE_QUALITY** parameter is only used for JPEG images. By default, the
  JPEG compression is ``-1``. You can change the default per QGIS project in
  the :menuselection:`OWS Server --> WMS capabilities` menu of the
  :menuselection:`Project --> Project Properties` dialog.
  If you want to override it in a ``GetMap`` request you can do it using the
  ``IMAGE_QUALITY`` parameter:

  .. code-block:: guess

   http://localhost/cgi-bin/qgis_mapserv.fcgi?\
    REQUEST=GetMap&FORMAT=image/jpeg&IMAGE_QUALITY=65&...

* **image/png; mode=** can be used to override the png format.
  You can choose between ``image/png; mode=16bit``, ``image/png; mode=8bit``
  and ``image/png; mode=1bit``. This can shrink the output image size quite
  a bit. Example:

  .. code-block:: guess

   http://localhost/cgi-bin/qgis_mapserv.fcgi?\
    REQUEST=GetMap&FORMAT=image/png; mode=8bit&...

* **OPACITIES** parameter: Opacity can be set on layer or group level.
  Allowed values range from 0 (fully transparent) to 255 (fully opaque).

  Example::

    http://localhost/cgi-bin/qgis_mapserv.fcgi?\
      REQUEST=GetMap&LAYERS=mylayer1,mylayer2&OPACITIES=125,200&...


* **FILTER** parameter: Subsets of layers can be selected with the ``FILTER``
  parameter. Syntax is basically the same as for the QGIS subset string. However,
  there are some restrictions to avoid SQL injections into databases via QGIS server:

  Text strings need to be enclosed with quotes (single quotes for strings,
  double quotes for attributes)
  A space between each word / special character is mandatory.
  Allowed Keywords and special characters are 'AND','OR','IN','=','<','>=',
  '>','>=','!=*,'(',')'.
  Semicolons in string expressions are not allowed

  Example::

      http://myserver.com/cgi/qgis_mapserv.fcgi?REQUEST=GetMap&LAYERS=mylayer1,mylayer2&FILTER=mylayer1:"OBJECTID" = 3;mylayer2:'text' = 'blabla'&....

.. note::

  It is possible to make attribute searches via GetFeatureInfo and omit
  the X/Y parameter if a FILTER is there. QGIS server then returns info
  about the matching features and generates a combined bounding box in the
  xml output.

* **SELECTION** parameter: The ``SELECTION`` parameter can highlight features
  from one or more layers. Vector features can be selected by passing comma
  separated lists with feature ids in ``GetMap`` and ``GetPrint``.

  Example::

    http://myserver.com/cgi/qgis_mapserv.fcgi?REQUEST=GetMap&LAYERS=mylayer1,mylayer2&SELECTION=mylayer1:3,6,9;mylayer2:1,5,6&...

  The following image presents the response from a GetMap request using the **SELECTION** option e.g.
  ``http://myserver.com/...&SELECTION=countries:171,65``.
  As those features id's correspond in the source dataset to **France** and **Romania** they're highlighted in yellow.

  .. _figure_server_selection:
  
  .. figure:: /static/user_manual/working_with_ogc/server_selection_parameter.png
     :align: center

     Server response to a GetMap request with SELECTION parameter

.. _`qgisserver-redlining`:

REDLINING
---------

This feature is available and can be used with ``GetMap`` and ``GetPrint`` requests.

The redlining feature can be used to pass geometries and labels in the request which are
overlapped by the server over the standard returned image (map).
This permits the user to put emphasis or maybe add some comments (labels) to some areas,
locations etc. that are not in the standard map.

The request is in the format::

 http://qgisplatform.demo/cgi-bin/qgis_mapserv.fcgi?map=/world.qgs&SERVICE=WMS&VERSION=1.3.0&
 REQUEST=GetMap
 ...
 &HIGHLIGHT_GEOM=POLYGON((590000 5647000, 590000 6110620, 2500000 6110620, 2500000 5647000, 590000 5647000))
 &HIGHLIGHT_SYMBOL=<StyledLayerDescriptor><UserStyle><Name>Highlight</Name><FeatureTypeStyle><Rule><Name>Symbol</Name><LineSymbolizer><Stroke><SvgParameter name="stroke">%23ea1173</SvgParameter><SvgParameter name="stroke-opacity">1</SvgParameter><SvgParameter name="stroke-width">1.6</SvgParameter></Stroke></LineSymbolizer></Rule></FeatureTypeStyle></UserStyle></StyledLayerDescriptor>
 &HIGHLIGHT_LABELSTRING=Write label here
 &HIGHLIGHT_LABELSIZE=16
 &HIGHLIGHT_LABELCOLOR=%23000000
 &HIGHLIGHT_LABELBUFFERCOLOR=%23FFFFFF
 &HIGHLIGHT_LABELBUFFERSIZE=1.5

Here is the image outputed by the above request in which a polygon and a label
are drawn on top of the normal map:

.. _figure_server_redlining:

.. figure:: /static/user_manual/working_with_ogc/server_redlining.png
   :align: center

   Server response to a GetMap request with redlining parameters

You can see there are several parameters in this request:

* **HIGHLIGHT_GEOM**: You can add POINT, MULTILINESTRING, POLYGON etc. It supports multipart
  geometries. Here is an example:  ``HIGHLIGHT_GEOM=MULTILINESTRING((0 0, 0 1, 1 1))``.
  The coordinates should be in the CRS of the GetMap/GetPrint request.

* **HIGHLIGHT_SYMBOL**: This controls how the geometry is outlined and you can change
  the stroke width, color and opacity.

* **HIGHLIGHT_LABELSTRING**: You can pass your labeling text to this parameter.

* **HIGHLIGHT_LABELSIZE**: This parameter controls the size of the label.

* **HIGHLIGHT_LABELCOLOR**: This parameter controls the label color.

* **HIGHLIGHT_LABELBUFFERCOLOR**: This parameter controls the label buffer color.

* **HIGHLIGHT_LABELBUFFERSIZE**: This parameter controls the label buffer size.

Extra parameters supported by the WMS GetFeatureInfo request
------------------------------------------------------------

QGIS Server WMS GetFeatureInfo requests supports the following extra optional parameters to
define the tolerance for point, line and polygon layers:

* **FI_POINT_TOLERANCE** parameter: Tolerance for point layers
  *GetFeatureInfo* request, in pixels.
* **FI_LINE_TOLERANCE** parameter: Tolerance for linestring layers
  *GetFeatureInfo* request, in pixels.
* **FI_POLYGON_TOLERANCE** parameter: Tolerance for polygon layers
  *GetFeatureInfo* request, in pixels.

.. _server_getprint:

GetPrint request
-----------------


QGIS server has the capability to create print composer output in pdf or pixel
format. Print composer windows in the published project are used as templates.
In the GetPrint request, the client has the possibility to specify parameters
of the contained composer maps and labels.

Example:

The published project has two composer maps. In the `GetProjectSettings` response,
they are listed as possible print templates:

.. code-block:: xml

    <WMS_Capabilities>
    ...
    <ComposerTemplates xsi:type="wms:_ExtendedCapabilities">
    <ComposerTemplate width="297" height="210" name="Druckzusammenstellung 1">
    <ComposerMap width="171" height="133" name="map0"/>
    <ComposerMap width="49" height="46" name="map1"/></ComposerTemplate>
    </ComposerTemplates>
    ...
    </WMS_Capabilities>

The client has now the information to request a print output::

    http://myserver.com/cgi/qgis_mapserv.fcgi?...&REQUEST=GetPrint&TEMPLATE=Druckzusammenstellung 1&map0:EXTENT=xmin,ymin,xmax,ymax&map0:ROTATION=45&FORMAT=pdf&DPI=300

Parameters in the GetPrint request are:

* **<map_id>:EXTENT** gives the extent for a composer map as xmin,ymin,xmax,ymax.
* **<map_id>:ROTATION** map rotation in degrees
* **<map_id>:GRID_INTERVAL_X**, **<map_id>:GRID_INTERVAL_Y** Grid line density for a
  composer map in x- and y-direction
* **<map_id>:SCALE** Sets a mapscale to a composer map. This is useful to ensure
  scale based visibility of layers and labels even if client and server may
  have different algorithms to calculate the scale denominator
* **<map_id>:LAYERS**, **<map_id>:STYLES** possibility to give layer and styles list
  for composer map (useful in case of overview maps which should have only a
  subset of layers)


GetLegendGraphics request
---------------------------


Several additional parameters are available to change the size of the legend
elements:

* **BOXSPACE** space between legend frame and content (mm)
* **LAYERSPACE** versical space between layers (mm)
* **LAYERTITLESPACE** vertical space between layer title and items following
  (mm)
* **SYMBOLSPACE** vertical space between symbol and item following (mm)
* **ICONLABELSPACE** horizontal space between symbol and label text (mm)
* **SYMBOLWIDTH** width of the symbol preview (mm)
* **SYMBOLHEIGHT** height of the symbol preview (mm)

These parameters change the font properties for layer titles and item labels:

* **LAYERFONTFAMILY / ITEMFONTFAMILY** font family for layer title / item text
* **LAYERFONTBOLD / ITEMFONTBOLD** 'TRUE' to use a bold font
* **LAYERFONTSIZE / ITEMFONTSIZE** Font size in point
* **LAYERFONTITALIC / ITEMFONTITALIC** 'TRUE' to use italic font
* **LAYERFONTCOLOR / ITEMFONTCOLOR** Hex color code (e.g. #FF0000 for red)
* **LAYERTITLE / RULELABEL** (from QGIS 2.4) set them to 'FALSE' to get only
  the legend graphics without labels

Contest based legend. These parameters let the client request a legend showing
only the symbols for the features falling into the requested area:

* **BBOX** the geographical area for which the legend should be built
* **CRS / SRS** the coordinate reference system adopted to define the BBOX
  coordinates
* **WIDTH / HEIGHT** if set these should match those defined for the GetMap
  request, to let QGIS Server scale symbols according to the map view image
  size.

Contest based legend features are based on the
`UMN MapServer implementation: <http://www.mapserver.org/development/rfc/ms-rfc-101.html>`_

GetProjectSettings request
-----------------------------

This request type works similar to **GetCapabilities**, but it is more specific
to QGIS Server and allows a client to read additional information which is
not available in the GetCapabilities output:

* initial visibility of layers
* information about vector attributes and their edit types
* information about layer order and drawing order
* list of layers published in WFS


DXF Export
------------

It is possible to export layers in the DXF format using the GetMap Request. Only
layers that have read access in the WFS service are exported in the DXF format.
Here is a valid REQUEST and a documentation of the available parameters::

    http://your.server.address/wms/liegenschaftsentwaesserung/abwasser_werkplan?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetMap&LAYERS=Haltungen,Normschacht,Spezialbauwerke&STYLES=&CRS=EPSG%3A21781&BBOX=696136.28844801,245797.12108743,696318.91114315,245939.25832905&WIDTH=1042&HEIGHT=811&FORMAT=application/dxf&FORMAT_OPTIONS=MODE:SYMBOLLAYERSYMBOLOGY;SCALE:250&FILE_NAME=werkplan_abwasser.dxf

Parameters:

* FORMAT=application/dxf
* FILE_NAME=yoursuggested_file_name_for_download.dxf
* FORMAT_OPTIONS=see options below, key:value pairs separated by Semicolon

FORMAT_OPTIONS Parameters:

* **SCALE:scale** to be used for symbology rules, filters and styles (not an
  actual scaling of the data - data remains in the original scale).
* **MODE:NOSYMBOLOGY|FEATURESYMBOLOGY|SYMBOLLAYERSYMBOLOGY** corresponds to the
  three export options offered in the QGIS Desktop DXF export dialog.
* **LAYERSATTRIBUTES:yourcolumn_with_values_to_be_used_for_dxf_layernames** - if
  not specified, the original QGIS layer names are used.
* **USE_TITLE_AS_LAYERNAME** if enabled, the title of the layer will be used as
  layer name.

Extra parameters supported by the WFS GetFeature request
---------------------------------------------------------

In the WFS GetFeature request, QGIS Server accepts two extra parameters in
addition to the standard parameters according to the OGC WFS 1.0.0
specification:

* **GeometryName** parameter: this parameter can be used to get the *extent*
  or the *centroid* as the geometry or no geometry if *none* if used (ie
  attribute only). Allowed values are *extent*, *centroid* or *none*.
* **StartIndex** parameter: STARTINDEX is standard in WFS 2.0, but it's an
  extension for WFS 1.0.0 which is the only version implemented in QGIS Server.
  STARTINDEX can be used to skip some features in the result set and in
  combination with MAXFEATURES will provide for the ability to use WFS
  GetFeature to page through results. Note that STARTINDEX=0 means start with
  the first feature, skipping none.

.. index::
    pair: Logging; QGIS Server

.. _qgis-server-logging:

QGIS Server logging
---------------------

To log requests sent to the server, set the following environment variables:

* **QGIS_SERVER_LOG_FILE**: Specify path and filename. Make sure that the
  server has proper permissions for writing to file. File should be created
  automatically, just send some requests to server. If it's not there, check
  permissions.
* **QGIS_SERVER_LOG_LEVEL**: Specify desired log level. Available values are:

  * 0 INFO (log all requests),
  * 1 WARNING,
  * 2 CRITICAL (log just critical errors, suitable for production purposes).

  Example:
  
  .. code-block:: apache

    SetEnv QGIS_SERVER_LOG_FILE /var/tmp/qgislog.txt
    SetEnv QGIS_SERVER_LOG_LEVEL 0

.. note::

    * When using Fcgid module use ``FcgidInitialEnv`` instead of ``SetEnv``!
    * Server logging is also enabled if executable is compiled in release mode.


.. index::
    pair: Environment; QGIS Server

Short name for layers, groups and project
-----------------------------------------

A number of elements have both a ``<Name>`` and a ``<Title>``.
The **Name** is a text string used for machine-to-machine
communication while the **Title** is for the benefit of humans.

For example, a dataset might have the descriptive Title
“Maximum Atmospheric Temperature” and be requested using the abbreviated
Name “ATMAX”. User can already set title for layers, groups and project.

OWS name is based on the name used in layer tree. This name is more a label
for humans than a name for machine-to-machine communication.

QGIS Server supports:

* short name line edits to layers properties
  You can change this by right clicking on a layer, choose
  :menuselection:`Properties --> Metadata tab --> Description --> Short name`.

* WMS data dialog to layer tree group (short name, title, abstract)

  By right clicking on a layer group and selecting the :guilabel:`Set Group WMS data` option you will get:

  .. _figure_group_wms_data:

  .. figure:: /static/user_manual/working_with_ogc/set_group_wms_data.png
     :align: center

     Set group WMS data dialog

* short name line edits to project properties - add a regexp validator
  ``"^[A-Za-z][A-Za-z0-9\._-]*"`` to short name line edit accessible through a
  static method
* add a regexp validator ``"^[A-Za-z][A-Za-z0-9\._-]*"`` to short name line
  edit accessible through a static method

  You can choose a short name for the project root by going to :menuselection:`Project properties -->
  OWS Server --> Service capabilities --> Short name`.

* add a ``TreeName`` element in the ``fullProjectSettings``

If a short name has been set for layers, groups or project it is used by
QGIS Sever as the layer name.

Connection to service file
--------------------------

In order to make apache aware of the PostgreSQL service file (see the
:ref:`pg-service-file` section) you need to make
your :file:`*.conf` file look like:

.. code-block:: apache

   SetEnv PGSERVICEFILE /home/web/.pg_service.conf

   <Directory "/home/web/apps2/bin/">
     AllowOverride None
   .....

.. _add_fonts:

Add fonts to your linux server
------------------------------

Keep in mind that you may use QGIS projects that point to fonts that
may not exist by default on other machines. This means that if you share the project,
it may look different on other machines (if the fonts don't exist on the target machine).

In order to ensure this does not happen you just need to install the missing fonts on the target machine.
Doing this on desktop systems is usually trivial (double clicking the fonts).

For linux, if you don't have a desktop environment installed (or you prefer the command line) you need to:

* On Debian based systems:

  .. code-block:: bash

   $ sudo su
   $ mkdir -p /usr/local/share/fonts/truetype/myfonts && cd /usr/local/share/fonts/truetype/myfonts

   # copy the fonts from their location
   $ cp /fonts_location/* .

   $ chown root *
   $ cd .. && fc-cache -f -v

* On Fedora based systems:

  .. code-block:: bash

   $ sudo su
   $ mkdir /usr/share/fonts/myfonts && cd /usr/share/fonts/myfonts

   # copy the fonts from their location
   $ cp /fonts_location/* .

   $ chown root *
   $ cd .. && fc-cache -f -v

.. _server_env_variables:

Environment variables
---------------------

You can configure some aspects of QGIS server by setting **environment
variables**. For example, to set QGIS server on Apache to use
/path/to/config/QGIS/QGIS2.ini settings file, add to Apache config:

.. code-block:: apache

  SetEnv QGIS_OPTIONS_PATH "/path/to/config/"

or, if using fcgi:

.. code-block:: apache

  FcgidInitialEnv QGIS_OPTIONS_PATH "/path/to/config/"


This is a list of the variables supported by QGIS server:

* **QGIS_OPTIONS_PATH**: Specifies the path to the directory with settings.
  It works the same way as QGIS application --optionspath option. It is looking
  for settings file in <QGIS_OPTIONS_PATH>/QGIS/QGIS2.ini.
* **QUERY_STRING**: The query string, normally passed by the web server. This
  variable can be useful while testing QGIS server binary from the command line.
* **QGIS_PROJECT_FILE**: the `.qgs` project file, normally passed as a parameter
  in the query string, you can also set it as an environment variable (for
  example by using `mod_rewrite` Apache module).
* **QGIS_SERVER_LOG_FILE**: Specify path and filename. Make sure that server
  has proper permissions for writing to file. File should be created
  automatically, just send some requests to server. If it's not there, check
  permissions.
* **QGIS_SERVER_LOG_LEVEL**: Specify desired log level. See :ref:`qgis-server-logging`
* **MAX_CACHE_LAYERS**: Specify the maximum number of cached layers (default:
  100).
* **DISPLAY**: This is used to pass (fake) X server display number (needed on
  Unix-like systems).
* **QGIS_PLUGINPATH**: Useful if you are using Python plugins for the server,
  this sets the folder that is searched for Python plugins.
* **DEFAULT_DATUM_TRANSFORM**: Define datum transformations between two projections,
  e.g. ``EPSG:21781/EPSG:2056/100001/-1;EPSG:2056/EPSG:21781/-1/100001`` sets the
  transformation between CH1903 LV03 (EPSG:21781) and CH1903 LV95 (EPSG:2056) and
  vice versa. You also need to place grid shift :file:`.gsb` files in the
  directory where proj4 stores the grid shift files, e.g. in :file:`/usr/share/proj`.
  You need to run ``crssync`` after you added new :file:`.gsb` files and look up
  the ID in the :file:`srs.db`. Look at attribute **coord_op_code** of table
  **tbl_datum_transform** in :file:`srs.db` to find the correct entry.

.. index:: nginx

QGIS Server with NGINX
======================

You can use QGIS Server with `nginx <http://nginx.org/>`_.

On Debian based systems:

.. code-block:: bash

 apt-get install nginx fcgiwrap

Introduce the following in your nginx server block configuration:

.. code-block:: nginx
   :linenos:

     location ~ ^/cgi-bin/.*\.fcgi$ {
         gzip           off;
         include fastcgi_params;
         fastcgi_pass   unix:/var/run/fcgiwrap.socket;/
         fastcgi_param SCRIPT_FILENAME /usr/lib/cgi-bin/qgis_mapserv.fcgi;

         fastcgi_param  QGIS_SERVER_LOG_FILE /logs/qgisserver.log;
         fastcgi_param  QGIS_SERVER_LOG_LEVEL 0;
         fastcgi_param  QGIS_DEBUG 1;
     }

As you can see from lines ``7-9`` you can add parameters in your location block
in the form of ``fastcgi_param param_name param_value``,
e.g. ``fastcgi_param  DISPLAY ":99";``.

The ``include fastcgi_params;`` is important as it adds the parameters from
:file:`/etc/nginx/fastcgi_params`:

.. code-block:: nginx

 fastcgi_param  QUERY_STRING       $query_string;
 fastcgi_param  REQUEST_METHOD     $request_method;
 fastcgi_param  CONTENT_TYPE       $content_type;
 fastcgi_param  CONTENT_LENGTH     $content_length;

 fastcgi_param  SCRIPT_NAME        $fastcgi_script_name;
 fastcgi_param  REQUEST_URI        $request_uri;
 fastcgi_param  DOCUMENT_URI       $document_uri;
 fastcgi_param  DOCUMENT_ROOT      $document_root;
 fastcgi_param  SERVER_PROTOCOL    $server_protocol;
 fastcgi_param  REQUEST_SCHEME     $scheme;
 fastcgi_param  HTTPS              $https if_not_empty;

 fastcgi_param  GATEWAY_INTERFACE  CGI/1.1;
 fastcgi_param  SERVER_SOFTWARE    nginx/$nginx_version;

 fastcgi_param  REMOTE_ADDR        $remote_addr;
 fastcgi_param  REMOTE_PORT        $remote_port;
 fastcgi_param  SERVER_ADDR        $server_addr;
 fastcgi_param  SERVER_PORT        $server_port;
 fastcgi_param  SERVER_NAME        $server_name;

 # PHP only, required if PHP was built with --enable-force-cgi-redirect
 fastcgi_param  REDIRECT_STATUS    200;
