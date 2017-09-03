.. only:: html

   |updatedisclaimer|

********
Services
********

.. only:: html

   .. contents::
      :local:

QGIS Server supports some vendor parameters and requests that greatly enhance the
possibilities of customising its behavior. The following paragraphs list the vendor
parameters and the environment variables supported by the server.

Web Map Service (WMS)
=====================

GetMap
------

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


GetFeatureInfo
--------------

QGIS Server WMS GetFeatureInfo requests supports the following extra optional parameters to
define the tolerance for point, line and polygon layers:

* **FI_POINT_TOLERANCE** parameter: Tolerance for point layers
  *GetFeatureInfo* request, in pixels.
* **FI_LINE_TOLERANCE** parameter: Tolerance for linestring layers
  *GetFeatureInfo* request, in pixels.
* **FI_POLYGON_TOLERANCE** parameter: Tolerance for polygon layers
  *GetFeatureInfo* request, in pixels.


.. _server_getprint:

GetPrint
--------

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
* **<map_id>:LAYERS**, **<map_id>:STYLES** possibility to give layer and styles
  list for composer map (useful in case of overview maps which should have only
  a subset of layers)


GetLegendGraphics
-----------------

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

GetProjectSettings
------------------

This request type works similar to **GetCapabilities**, but it is more specific
to QGIS Server and allows a client to read additional information which is
not available in the GetCapabilities output:

* initial visibility of layers
* information about vector attributes and their edit types
* information about layer order and drawing order
* list of layers published in WFS


Web Feature Service (WFS)
=========================

GetFeature
----------

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


.. _`extra-getmap-parameters`:

Extra parameters supported by all request types
===============================================

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

  the first feature, skipping none.

.. _`qgisserver-redlining`:

REDLINING
=========

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
