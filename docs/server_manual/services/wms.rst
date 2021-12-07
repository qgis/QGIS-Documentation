Web Map Service (WMS)
=====================

The **1.1.1** and **1.3.0** WMS standards implemented in QGIS Server provide
a HTTP interface to request map or legend images generated from a QGIS project.
A typical WMS request defines the QGIS project to use, the layers to render as
well as the image format to generate. Basic support is also available for
**Styled Layer Descriptor (SLD)**.

Specifications:

- `WMS 1.1.1 <https://portal.ogc.org/files/?artifact_id=1081&amp;version=1&amp;format=pdf>`_
- `WMS 1.3.0 <https://portal.opengeospatial.org/files/?artifact_id=14416&format=pdf>`_
- `SLD 1.1.0 WMS profile <http://portal.opengeospatial.org/files/?artifact_id=22364&format=pdf>`_

Standard requests provided by QGIS Server:

.. csv-table::
   :header: "Request", "Description"
   :widths: auto

   ":ref:`GetCapabilities <qgisserver_wms_getcapabilities>`", "Returns XML metadata with information about the server"
   ":ref:`GetMap <qgisserver-wms-getmap>`", "Returns a map"
   ":ref:`GetFeatureInfo <server_wms_getfeatureinfo>`", "Retrieves data (geometry and values) for a pixel location"
   ":ref:`GetLegendGraphics <server_wms_getlegendgraphics>`", "Returns legend symbols"
   ":ref:`GetStyle(s) <server_wms_getstyle>`", "Returns XML document with style description in SLD"
   ":ref:`DescribeLayer <server_wms_describelayer>`", "Returns information about WFS and WCS availability respectively for vector and raster layers"


Vendor requests provided by QGIS Server:

.. csv-table::
   :header: "Request", "Description"
   :widths: auto

   ":ref:`GetPrint <server_wms_getprint>`", "Returns a QGIS composition"
   ":ref:`GetProjectSettings <server_wms_getprojectsettings>`", "Returns specific information about QGIS Server"


.. _`qgisserver_wms_getcapabilities`:

GetCapabilities
---------------

Standard parameters for the **GetCapabilities** request according to the OGC
WMS 1.1.1 and 1.3.0 specifications:

.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   ":ref:`SERVICE <wms-service>`", "Yes", "Name of the service (**WMS**)"
   ":ref:`VERSION <wms-version>`", "No", "Version of the service"
   ":ref:`REQUEST <wms-getcapabilities-request>`", "Yes", "Name of the request (**GetCapabilities**)"

URL example:

.. code-block:: none

  http://localhost/qgis_server?
  SERVICE=WMS
  &VERSION=1.3.0
  &REQUEST=GetCapabilities


.. _`wms-getcapabilities-request`:

REQUEST
^^^^^^^

This parameter is ``GetCapabilities`` in case of the **GetCapabilities**
request.
.. _`qgisserver-wms-getmap`:

GetMap
------

Standard parameters for the **GetMap** request according to the OGC
WMS 1.1.1 and 1.3.0 specifications:

.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   ":ref:`SERVICE <wms-service>`", "Yes", "Name of the service (**WMS**)"
   ":ref:`VERSION <wms-version>`", "Yes", "Version of the service"
   ":ref:`REQUEST <wms-getmap-request>`", "Yes", "Name of the request (**GetMap**)"
   ":ref:`LAYERS <wms-layers>` ", "No", "Layers to display"
   ":ref:`STYLES <wms-styles>`", "No", "Layers' style"
   ":ref:`SRS / CRS <wms-srs>`", "Yes", "Coordinate reference system"
   ":ref:`BBOX <wms-bbox>`", "No", "Map extent"
   ":ref:`WIDTH <wms-width>`", "Yes", "Width of the image in pixels"
   ":ref:`HEIGHT <wms-height>`", "Yes", "Height of the image in pixels"
   ":ref:`FORMAT <wms-getmap-format>`", "No", "Image format"
   ":ref:`TRANSPARENT <wms-transparent>`", "No", "Transparent background"
   "SLD", "No", "URL of an SLD to be used for styling"
   "SLD_BODY", "No", "In-line SLD (XML) to be used for styling"


In addition to the standard ones, QGIS Server supports the following
extra parameters:


.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: 20, 10, 65

   ":ref:`MAP <wms-map>`", "Yes", "Specify the QGIS project file"
   ":ref:`BGCOLOR <wms-bgcolor>`", "No", "Specify the background color"
   ":ref:`DPI <wms-dpi>`", "No", "Specify the output resolution"
   ":ref:`IMAGE_QUALITY <wms-imagequality>`", "No", "JPEG compression"
   ":ref:`OPACITIES <wms-opacities>`", "No", "Opacity for layer or group"
   ":ref:`FILTER <wms-filter>`", "No", "Subset of features"
   ":ref:`SELECTION <wms-selection>`", "No", "Highlight features"
   "FILE_NAME", "No", "File name of the downloaded file

   Only for ``FORMAT=application/dxf``"
   ":ref:`FORMAT_OPTIONS <wms-formatoptions>`", "No", "Options of the specified file format

   Only for ``FORMAT=application/dxf``"
   ":ref:`TILED <wms-tiled>`", "No", "Working in *tiled mode*"

URL example:

.. code-block:: none

  http://localhost/qgis_server?
  SERVICE=WMS
  &VERSION=1.3.0
  &REQUEST=GetMap
  &MAP=/home/qgis/projects/world.qgs
  &LAYERS=mylayer1,mylayer2,mylayer3
  &STYLES=style1,default,style3
  &OPACITIES=125,200,125
  &CRS=EPSG:4326
  &WIDTH=400
  &HEIGHT=400
  &FORMAT=image/png
  &TRANSPARENT=TRUE
  &DPI=300
  &TILED=TRUE


.. _`wms-service`:

SERVICE
^^^^^^^

This parameter has to be ``WMS``.

For example:

.. code-block:: none

  http://localhost/qgisserver?
  SERVICE=WMS
  &...


.. _`wms-version`:

VERSION
^^^^^^^

This parameter allows to specify the version of the service to use.
Available values for the ``VERSION`` parameter are:

- ``1.1.1``
- ``1.3.0``

According to the version number, slight differences have to be expected
as explained later for the next parameters:

- ``CRS`` / ``SRS``
- ``BBOX``


.. _`wms-getmap-request`:

REQUEST
^^^^^^^

This parameter is ``GetMap`` in case of the **GetMap** request.


.. _`wms-layers`:

LAYERS
^^^^^^

This parameter allows to specify the layers to display on the map.
Names have to be separated by a comma.

In addition, QGIS Server introduced some options to select layers by:

* a short name
* the layer id

The short name of a layer may be configured through
:menuselection:`Properties --> Metadata` in layer menu.
If the short name is defined, then it's used by default instead of the
layer's name:

.. code-block:: none

  http://localhost/qgisserver?
  SERVICE=WMS
  &REQUEST=GetMap
  &LAYERS=mynickname1,mynickname2
  &...

Moreover, there's a project option allowing to select layers by their
id in :menuselection:`OWS Server --> WMS capabilities` menu of the
:menuselection:`Project --> Properties...` dialog.
To activate this option, the checkbox
:guilabel:`Use layer ids as names` has to be selected.

.. code-block:: none

  http://localhost/qgisserver?
  SERVICE=WMS
  &REQUEST=GetMap
  &LAYERS=mylayerid1,mylayerid2
  &...


.. _`wms-styles`:

STYLES
^^^^^^

This parameter can be used to specify a layer's style for the
rendering step.
Styles have to be separated by a comma. The name of the default style
is ``default``.


.. _`wms-srs`:

SRS / CRS
^^^^^^^^^

This parameter allows to indicate the map output Spatial Reference
System in WMS **1.1.1** and has to be formed like ``EPSG:XXXX``.
Note that ``CRS`` is also supported if current version is **1.1.1**.

For WMS **1.3.0**, ``CRS`` parameter is preferable but ``SRS`` is also
supported.

Note that if both ``CRS`` and ``SRS`` parameters are indicated in the
request, then it's the current version indicated in ``VERSION``
parameter which is decisive.

In the next case, the ``SRS`` parameter is kept whatever the
``VERSION`` parameter because ``CRS`` is not indicated:

.. code-block:: none

  http://localhost/qgisserver?
  SERVICE=WMS
  &REQUEST=GetMap
  &VERSION=1.3.0
  &SRS=EPSG:2854
  &...

In the next case, the ``SRS`` parameter is kept instead of ``CRS``
because of the ``VERSION`` parameter:

.. code-block:: none

  http://localhost/qgisserver?
  SERVICE=WMS
  &REQUEST=GetMap
  &VERSION=1.1.1
  &CRS=EPSG:4326
  &SRS=EPSG:2854
  &...

In the next case, the ``CRS`` parameter is kept instead of ``SRS``
because of the ``VERSION`` parameter:

.. code-block:: none

  http://localhost/qgisserver?
  SERVICE=WMS
  &REQUEST=GetMap
  &VERSION=1.3.0
  &CRS=EPSG:4326
  &SRS=EPSG:2854
  &...


.. _`wms-bbox`:

BBOX
^^^^

This parameter allows to specify the map extent with units according
to the current CRS. Coordinates have to be separated by a comma.

The ``BBOX`` parameter is formed like ``min_a,min_b,max_a,max_b`` but ``a`` and
``b`` axis definition is different according to the current ``VERSION``
parameter:

* in WMS **1.1.1**, the axis ordering is always east/north
* in WMS **1.3.0**, the axis ordering depends on the CRS authority

For example in case of ``EPSG:4326`` and WMS **1.1.1**, ``a`` is the longitude
(east) and ``b`` the latitude (north), leading to a request like:

.. code-block:: none

  http://localhost/qgisserver?
  SERVICE=WMS
  &REQUEST=GetMap
  &VERSION=1.1.1
  &SRS=epsg:4326
  &BBOX=-180,-90,180,90
  &...

But in case of WMS **1.3.0**, the axis ordering defined in the EPSG database is
north/east so ``a`` is the latitude and ``b`` the longitude:

.. code-block:: none

  http://localhost/qgisserver?
  SERVICE=WMS
  &REQUEST=GetMap
  &VERSION=1.3.0
  &CRS=epsg:4326
  &BBOX=-90,-180,90,180
  &...


.. _`wms-width`:

WIDTH
^^^^^

This parameter allows to specify the width in pixels of the output
image.


.. _`wms-height`:

HEIGHT
^^^^^^

This parameter allows to specify the height in pixels of the output
image.


.. _`wms-getmap-format`:

FORMAT
^^^^^^

This parameter may be used to specify the format of map image.
Available values are:

* ``jpg``
* ``jpeg``
* ``image/jpeg``
* ``image/png``
* ``image/png; mode=1bit``
* ``image/png; mode=8bit``
* ``image/png; mode=16bit``
* ``application/dxf``
  Only layers that have read access in the WFS service are exported in
  the DXF format.

  URL example:

  .. code-block:: none

   http://localhost/qgisserver?
   SERVICE=WMS&VERSION=1.3.0
   &REQUEST=GetMap
   &FORMAT=application/dxf
   &LAYERS=Haltungen,Normschacht,Spezialbauwerke
   &STYLES=
   &CRS=EPSG%3A21781&BBOX=696136.28844801,245797.12108743,696318.91114315,245939.25832905
   &WIDTH=1042
   &HEIGHT=811
   &FORMAT_OPTIONS=MODE:SYMBOLLAYERSYMBOLOGY;SCALE:250&FILE_NAME=plan.dxf

.. _`wms-transparent`:

TRANSPARENT
^^^^^^^^^^^

This boolean parameter can be used to specify the background
transparency.
Available values are (not case sensitive):

- ``TRUE``
- ``FALSE``

However, this parameter is ignored if the format of the map image
indicated with ``FORMAT`` is different from PNG.


.. _`wms-map`:

MAP
^^^

This parameter allows to define the QGIS project file to use.

As mentioned in :ref:`GetMap parameters table <qgisserver-wms-getmap>`,
``MAP`` is mandatory because a request needs a QGIS project to
actually work.
However, the ``QGIS_PROJECT_FILE`` environment variable may be used to
define a default QGIS project.
In this specific case, ``MAP`` is not longer a required parameter.
For further information you may refer to :ref:`server_env_variables`.


.. _`wms-bgcolor`:

BGCOLOR
^^^^^^^

This parameter allows to indicate a background color for the map image.
However it cannot be combined with ``TRANSPARENT`` parameter in case of
PNG images (transparency takes priority). The colour may be literal or
in hexadecimal notation.

URL example with the literal notation:

.. code-block:: none

  http://localhost/qgisserver?
  SERVICE=WMS
  &REQUEST=GetMap
  &VERSION=1.3.0
  &BGCOLOR=green
  &...

URL example with the hexadecimal notation:

.. code-block:: none

  http://localhost/qgisserver?
  SERVICE=WMS
  &REQUEST=GetMap
  &VERSION=1.3.0
  &BGCOLOR=0x00FF00
  &...


.. _`wms-dpi`:

DPI
^^^

This parameter can be used to specify the requested output resolution.


.. _`wms-imagequality`:

IMAGE_QUALITY
^^^^^^^^^^^^^

This parameter is only used for JPEG images. By default, the JPEG
compression is ``-1``.

You can change the default per QGIS project in the
:menuselection:`OWS Server --> WMS capabilities` menu of the
:menuselection:`Project --> Properties...` dialog.
If you want to override it in a ``GetMap`` request you can do it using
the ``IMAGE_QUALITY`` parameter.


.. _`wms-opacities`:

OPACITIES
^^^^^^^^^

Comma separated list of opacity values.
Opacity can be set on layer or group level. Allowed values range from
0 (fully transparent) to 255 (fully opaque).


.. _`wms-filter`:

FILTER
^^^^^^

A subset of layers can be selected with the ``FILTER`` parameter.
The syntax is basically the same as for the QGIS subset string.
However, there are some restrictions to avoid SQL injections into
databases via QGIS Server.
If a dangerous string is found in the parameter, QGIS Server will
return the next error:

.. code-block:: none

  <ServiceExceptionReport>
    <ServiceException code="Security">The filter string XXXXXXXXX has been rejected because of security reasons.
    Note: Text strings have to be enclosed in single or double quotes. A space between each word / special character is mandatory.
    Allowed Keywords and special characters are IS,NOT,NULL,AND,OR,IN,=,<,=<,>,>=,!=,',',(,),DMETAPHONE,SOUNDEX.
    Not allowed are semicolons in the filter expression.</ServiceException>
  </ServiceExceptionReport>


URL example:

.. code-block:: none

  http://localhost/qgisserver?
  SERVICE=WMS
  &REQUEST=GetMap
  &LAYERS=mylayer1,mylayer2,mylayer3
  &FILTER=mylayer1:"col1";mylayer1,mylayer2:"col2" = 'blabla'
  &...

In this example, the same filter (field ``col2`` equals the string
``blabla``) is applied to layers ``mylayer1`` and ``mylayer2``, while
the filter on ``col1`` is only applied to ``mylayer1``.

.. note::

  It is possible to make attribute searches via GetFeatureInfo and omit
  the X/Y parameter if a FILTER is there. QGIS Server then returns info
  about the matching features and generates a combined bounding box in
  the XML output.


.. _`wms-selection`:

SELECTION
^^^^^^^^^

The ``SELECTION`` parameter can highlight features from one or more
layers.
Vector features can be selected by passing comma separated lists with
feature ids.

.. code-block:: none

  http://localhost/qgisserver?
  SERVICE=WMS
  &REQUEST=GetMap
  &LAYERS=mylayer1,mylayer2
  &SELECTION=mylayer1:3,6,9;mylayer2:1,5,6
  &...

The following image presents the response from a GetMap request using
the ``SELECTION`` option e.g.
``http://myserver.com/...&SELECTION=countries:171,65``.

As those features id's correspond in the source dataset to **France**
and **Romania** they're highlighted in yellow.

.. _figure_server_selection:

.. figure:: ../img/server_selection_parameter.png
  :align: center

  Server response to a GetMap request with SELECTION parameter

.. _`wms-formatoptions`:

FORMAT-OPTIONS
^^^^^^^^^^^^^^

This parameter can be used to specify options for the selected format.
Only for ``FORMAT=application/dxf``.
A list of key:value pairs separated by semicolon:

* SCALE: to be used for symbology rules, filters and styles (not
  actual scaling of the data - data remains in the original scale).
* MODE: corresponds to the export options offered in the QGIS
  Desktop DXF export dialog. Possible values are ``NOSYMBOLOGY``,
  ``FEATURESYMBOLOGY`` and ``SYMBOLLAYERSYMBOLOGY``.
* LAYERSATTRIBUTES: specify a field that contains values for DXF
  layer names - if not specified, the original QGIS layer names are used.
* USE_TITLE_AS_LAYERNAME: if enabled, the title of the layer will
  be used as layer name.
* CODEC: specify a codec to be used for encoding. Default is ``ISO-8859-1``
  check the QGIS desktop DXF export dialog for valid values.
* NO_MTEXT: Use TEXT instead of MTEXT for labels.
* FORCE_2D: Force 2D output. This is required for polyline width.

.. _`wms-tiled`:

TILED
^^^^^

For performance reasons, QGIS Server can be used in tiled mode.
In this mode, the client requests several small fixed size tiles, and assembles
them to form the whole map. Doing this, symbols at or near the
boundary between two tiles may appeared cut, because they are only present in
one of the tile.

Set the ``TILED`` parameter to ``TRUE`` to tell QGIS Server to work in
*tiled* mode, and to apply the *Tile buffer* configured in the QGIS
project (see :ref:`Creatingwmsfromproject`).

When ``TILED`` is ``TRUE`` and when a non-zero Tile buffer is
configured in the QGIS project, features outside the tile extent are
drawn to avoid cut symbols at tile boundaries.

``TILED`` defaults to ``FALSE``.


.. _server_wms_getfeatureinfo:

GetFeatureInfo
--------------

Standard parameters for the **GetFeatureInfo** request according to
the OGC WMS 1.1.1 and 1.3.0 specifications:

.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   ":ref:`SERVICE <wms-service>`", "Yes", "Name of the service (**WMS**)"
   ":ref:`VERSION <wms-version>`", "No", "Version of the service"
   ":ref:`REQUEST <wms-getfeatureinfo-request>`", "Yes", "Name of the request (**GetFeatureInfo**)"
   ":ref:`QUERY_LAYERS <wms-querylayers>`", "Yes", "Layers to query"
   ":ref:`LAYERS <wms-layers>`", "Yes", "Layers to display (identical to `QUERY_LAYERS`)"
   ":ref:`STYLES <wms-styles>`", "No", "Layers' style"
   ":ref:`SRS / CRS <wms-srs>`", "Yes", "Coordinate reference system"
   ":ref:`BBOX <wms-bbox>`", "No", "Map extent"
   ":ref:`WIDTH <wms-width>`", "Yes", "Width of the image in pixels"
   ":ref:`HEIGHT <wms-height>`", "Yes", "Height of the image in pixels"
   ":ref:`TRANSPARENT <wms-transparent>`", "No", "Transparent background"
   ":ref:`INFO_FORMAT <wms-infoformat>`", "No", "Output format"
   ":ref:`FEATURE_COUNT <wms-featurecount>`", "No", "Maximum number of features to return"
   ":ref:`I <wms-i>`", "No", "Pixel column of the point to query"
   ":ref:`X <wms-x>`", "No", "Same as `I` parameter, but in WMS 1.1.1"
   ":ref:`J <wms-j>`", "No", "Pixel row of the point to query"
   ":ref:`Y <wms-y>`", "No", "Same as `J` parameter, but in WMS 1.1.1"
   "WMS_PRECISION", "No", "The precision (number of digits) to be used
   when returning geometry (see :ref:`how to add geometry to feature response <addGeometryToFeatureResponse>`).
   The default value is ``-1`` meaning that the precision defined in the project is used."


In addition to the standard ones, QGIS Server supports the following
extra parameters:


.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   ":ref:`MAP <wms-map>`", "Yes", "Specify the QGIS project file"
   ":ref:`FILTER <wms-filter>`", "No", "Subset of features"
   ":ref:`FI_POINT_TOLERANCE <wms-fipointtolerance>`", "No", "Tolerance in pixels for point layers"
   ":ref:`FI_LINE_TOLERANCE <wms-filinetolerance>`", "No", "Tolerance in pixels for line layers"
   ":ref:`FI_POLYGON_TOLERANCE <wms-fipolygontolerance>`", "No", "Tolerance in pixels for polygon layers"
   ":ref:`FILTER_GEOM <wms-filtergeom>`", "No", "Geometry filtering"
   ":ref:`WITH_MAPTIP <wms-withmaptip>`", "No", "Add map tips to the output"
   ":ref:`WITH_GEOMETRY <wms-withgeometry>`", "No", "Add geometry to the output"


URL example:

.. code-block:: none

  http://localhost/qgisserver?
  SERVICE=WMS
  &VERSION=1.3.0
  &REQUEST=GetMap
  &MAP=/home/qgis/projects/world.qgs
  &LAYERS=mylayer1,mylayer2,mylayer3
  &CRS=EPSG:4326
  &WIDTH=400
  &HEIGHT=400
  &INFO_FORMAT=text/xml
  &TRANSPARENT=TRUE
  &QUERY_LAYERS=mylayer1
  &FEATURE_COUNT=3
  &I=250
  &J=250


.. _`wms-getfeatureinfo-request`:

REQUEST
^^^^^^^

This parameter is ``GetFeatureInfo`` in case of the **GetFeatureInfo** request.

.. _`wms-infoformat`:

INFO_FORMAT
^^^^^^^^^^^

This parameter may be used to specify the format of the result.
Available values are:

- ``text/xml``
- ``text/html``
- ``text/plain``
- ``application/vnd.ogc.gml``
- ``application/json``

.. _`wms-querylayers`:

QUERY_LAYERS
^^^^^^^^^^^^

This parameter specifies the layers to display on the map.
Names are separated by a comma.

In addition, QGIS Server introduces options to select layers by:

* short name
* layer id

See the ``LAYERS`` parameter defined in
:ref:`GetMap <wms-layers>` for more information.

.. _`wms-featurecount`:

FEATURE_COUNT
^^^^^^^^^^^^^

This parameter specifies the maximum number of features per layer to
return.
For example if ``QUERY_LAYERS`` is set to ``layer1,layer2`` and
``FEATURE_COUNT`` is set to ``3`` then a maximum of 3 features from
layer1 will be returned.
Likewise a maximun of 3 features from layer2 will be returned.

By default, only 1 feature per layer is returned.

.. _`wms-i`:

I
^

This parameter, defined in WMS 1.3.0, allows you to specify the pixel
column of the query point.

.. _`wms-x`:

X
^

Same parameter as ``I``, but defined in WMS 1.1.1.

.. _`wms-j`:

J
^

This parameter, defined in WMS 1.3.0, allows you to specify the pixel
row of the query point.

.. _`wms-y`:

Y
^

Same parameter as ``J``, but defined in WMS 1.1.1.

.. _`wms-fipointtolerance`:

FI_POINT_TOLERANCE
^^^^^^^^^^^^^^^^^^

This parameter specifies the tolerance in pixels for point layers.

.. _`wms-filinetolerance`:

FI_LINE_TOLERANCE
^^^^^^^^^^^^^^^^^

This parameter specifies the tolerance in pixels for line layers.

.. _`wms-fipolygontolerance`:

FI_POLYGON_TOLERANCE
^^^^^^^^^^^^^^^^^^^^

This parameter specifies the tolerance in pixels for polygon layers.

.. _`wms-filtergeom`:

FILTER_GEOM
^^^^^^^^^^^

This parameter specifies a WKT geometry with which features have to
intersect.

.. _`wms-withmaptip`:

WITH_MAPTIP
^^^^^^^^^^^

This parameter specifies whether to add map tips to the output.

Available values are (not case sensitive):

- ``TRUE``
- ``FALSE``

.. _`wms-withgeometry`:

WITH_GEOMETRY
^^^^^^^^^^^^^

This parameter specifies whether to add geometries to the output. To use
this feature you must first enable the :guilabel:`Add geometry to feature response`
option in the QGIS project. See :ref:`Configure your project <Creatingwmsfromproject>`.

Available values are (not case sensitive):

- ``TRUE``
- ``FALSE``



.. _server_wms_getlegendgraphics:

GetLegendGraphics
-----------------

Several additional parameters are available to change the size of the
legend elements:

* **BOXSPACE** space between legend frame and content (mm)
* **FORMAT**, ``image/jpeg``, ``image/png`` or ``application/json``.
  For JSON, symbols are encoded with Base64 and most other options related to
  layout or fonts are not taken into account because the legend must be built
  on the client side.
* **LAYERSPACE** vertical space between layers (mm)
* **LAYERTITLESPACE** vertical space between layer title and items
  following (mm)
* **SYMBOLSPACE** vertical space between symbol and item following
  (mm)
* **ICONLABELSPACE** horizontal space between symbol and label text
  (mm)
* **SYMBOLWIDTH** width of the symbol preview (mm)
* **SYMBOLHEIGHT** height of the symbol preview (mm)

These parameters change the font properties for layer titles and item
labels:

* **LAYERFONTFAMILY / ITEMFONTFAMILY** font family for layer
  title / item text
* **LAYERFONTBOLD / ITEMFONTBOLD** ``TRUE`` to use a bold font
* **LAYERFONTSIZE / ITEMFONTSIZE** Font size in point
* **LAYERFONTITALIC / ITEMFONTITALIC** ``TRUE`` to use italic font
* **LAYERFONTCOLOR / ITEMFONTCOLOR** Hex color code (e.g. ``#FF0000``
  for red)
* **LAYERTITLE** ``FALSE`` to get only the legend graphics without layer title
* **RULELABEL**:

  * ``FALSE`` legend graphics without item labels
  * ``AUTO`` hide item label for layers with :guilabel:`Single symbol` rendering

Content based legend. These parameters let the client request a legend
showing only the symbols for the features falling into the requested
area:

* **BBOX** the geographical area for which the legend should be built
* **CRS / SRS** the coordinate reference system adopted to define the
  BBOX coordinates
* **SRCWIDTH / SRCHEIGHT** if set these should match the WIDTH and HEIGHT
  parameters of the GetMap request, to let QGIS Server scale symbols according
  to the map view image size.

Content based legend features are based on the `UMN MapServer
implementation:
<https://www.mapserver.org/development/rfc/ms-rfc-101.html>`_

* **SHOWFEATURECOUNT** if set to ``TRUE`` adds in the legend the
  feature count of the features like in the following image:

  .. figure:: ../img/getfeaturecount_legend.png
    :align: center

* **RULE** set it to a given rule name to get only the named rule symbol
* **WIDTH/HEIGHT** the generated legend image size if the **RULE** parameter is set


.. _server_wms_getstyle:

GetStyle(s)
-----------

Standard parameters for the **GetStyle** (or **GetStyles**) request according
to the OGC WMS 1.1.1 specifications:

.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   ":ref:`SERVICE <wms-service>`", "Yes", "Name of the service (**WMS**)"
   ":ref:`REQUEST <wms-getstyle-request>`", "Yes", "Name of the request (**GetStyle** or **GetStyles**)"
   ":ref:`LAYERS <wms-layers>`", "Yes", "Layers to query"


URL example:

.. code-block:: none

  http://localhost/qgisserver?
  SERVICE=WMS
  &REQUEST=GetStyles
  &LAYERS=mylayer1,mylayer2

.. _`wms-getstyle-request`:

REQUEST
^^^^^^^

This parameter is ``GetStyle`` or ``GetStyles``.


.. _server_wms_describelayer:

DescribeLayer
-------------

Standard parameters for the **DescribeLayer** request according to the OGC WMS
1.1.1 and 1.3.0 specifications:

.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   ":ref:`SERVICE <wms-service>`", "Yes", "Name of the service (**WMS**)"
   ":ref:`REQUEST <wms-describelayer-request>`", "Yes", "Name of the request (**DescribeLayer**)"
   ":ref:`LAYERS <wms-layers>`", "Yes", "Layers to describe"
   ":ref:`SLD_VERSION <wms-describelayer-sldversion>`", "Yes", "SLD version"

URL example:

.. code-block:: none

  http://localhost/qgisserver?
  SERVICE=WMS
  &REQUEST=DescribeLayer
  &SLD_VERSION=1.1.0
  &LAYERS=mylayer1

The XML document looks like:

.. code-block:: xml

   <DescribeLayerResponse xmlns="http://www.opengis.net/sld" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ows="http://www.opengis.net/ows" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:se="http://www.opengis.net/se" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/DescribeLayer.xsd">
       <Version>1.1.0</Version>
       <LayerDescription>
           <owsType>wfs</owsType>
           <se:OnlineResource xlink:href="http://localhost/qgis_server" xlink:type="simple"/>
           <TypeName>
               <se:FeatureTypeName>my_vector_layer</se:FeatureTypeName>
           </TypeName>
       </LayerDescription>
       <LayerDescription>
           <owsType>wcs</owsType>
           <se:OnlineResource xlink:href="http://localhost/qgis_server" xlink:type="simple"/>
           <TypeName>
               <se:FeatureTypeName>my_raster_layer</se:FeatureTypeName>
           </TypeName>
       </LayerDescription>
   </DescribeLayerResponse>

.. _`wms-describelayer-request`:

REQUEST
^^^^^^^

This parameter is ``DescribeLayer`` in case of the **DescribeLayer** request.


.. _`wms-describelayer-sldversion`:

SLD_VERSION
^^^^^^^^^^^

This parameter allows to specify the version of SLD. Only the value ``1.1.0``
is available.


.. _server_wms_getprint:

GetPrint
--------

QGIS Server has the capability to create print layout output in pdf or
pixel format.
Print layout windows in the published project are used as templates.
In the **GetPrint** request, the client has the possibility to specify
parameters of the contained layout maps and labels.

Parameters for the **GetPrint** request:

.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   ":ref:`MAP <wms-map>`", "Yes", "Specify the QGIS project file"
   ":ref:`SERVICE <wms-service>`", "Yes", "Name of the service (**WMS**)"
   ":ref:`VERSION <wms-version>`", "No", "Version of the service"
   ":ref:`REQUEST <wms-getprint-request>`", "Yes", "Name of the request (**GetPrint**)"
   ":ref:`LAYERS <wms-layers>`", "No", "Layers to display"
   ":ref:`TEMPLATE <wms-template>`", "Yes", "Layout template to use"
   ":ref:`SRS / CRS <wms-srs>`", "Yes", "Coordinate reference system"
   ":ref:`FORMAT <wms-getprint-format>`", "No", "Output format"
   ":ref:`ATLAS_PK <wms-atlaspk>`", "No", "Atlas features"
   ":ref:`STYLES <wms-styles>`", "No", "Layers' style"
   ":ref:`TRANSPARENT <wms-transparent>`", "No", "Transparent background"
   ":ref:`OPACITIES <wms-opacities>`", "No", "Opacity for layer or group"
   ":ref:`SELECTION <wms-selection>`", "No", "Highlight features"
   ":ref:`mapX:EXTENT <wms-mapextent>`", "No", "Extent of the map 'X'"
   ":ref:`mapX:LAYERS <wms-maplayers>`", "No", "Layers of the map 'X'"
   ":ref:`mapX:STYLES <wms-mapstyles>`", "No", "Layers' style of the map 'X'"
   ":ref:`mapX:SCALE <wms-mapscale>`", "No", "Layers' scale of the map 'X'"
   ":ref:`mapX:ROTATION <wms-maprotation>`", "No", "Rotation  of the map 'X'"
   ":ref:`mapX:GRID_INTERVAL_X <wms-mapgridintervalx>`", "No", "Grid interval on x axis of the map 'X'"
   ":ref:`mapX:GRID_INTERVAL_Y <wms-mapgridintervaly>`", "No", "Grid interval on y axis of the map 'X'"


URL example:

.. code-block:: none

  http://localhost/qgisserver?
  SERVICE=WMS
  &VERSION=1.3.0
  &REQUEST=GetPrint
  &MAP=/home/qgis/projects/world.qgs
  &CRS=EPSG:4326
  &FORMAT=png
  &TEMPLATE=Layout%201
  &map0:EXTENT=-180,-90,180,90
  &map0:LAYERS=mylayer1,mylayer2,mylayer3
  &map0:OPACITIES=125,200,125
  &map0:ROTATION=45

Note that the layout template may contain more than one map.
In this way, if you want to configure a specific map, you have to use
``mapX:`` parameters where ``X`` is a positive number that you can
retrieve thanks to the **GetProjectSettings** request.

For example:

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


.. _`wms-getprint-request`:

REQUEST
^^^^^^^

This parameter has to be ``GetPrint`` for the **GetPrint** request.

.. _`wms-template`:

TEMPLATE
^^^^^^^^

This parameter can be used to specify the name of a layout template
to use for printing.

.. _`wms-getprint-format`:

FORMAT
^^^^^^

This parameter specifies the format of map image. Available values are:

- ``png`` (default value)
- ``image/png``
- ``jpg``
- ``jpeg``
- ``image/jpeg``
- ``svg``
- ``image/svg``
- ``image/svg+xml``
- ``pdf``
- ``application/pdf``

If the ``FORMAT`` parameter is different from one of these values,
then an exception is returned.

.. _`wms-atlaspk`:

ATLAS_PK
^^^^^^^^

This parameter allows activation of Atlas rendering by indicating
which features we want to print.
In order to retrieve an atlas with all features, the ``*`` symbol may
be used (according to the maximum number of features allowed in the
project configuration).

When ``FORMAT`` is ``pdf``, a single PDF document combining the feature
pages is returned.
For all other formats, a single page is returned.

.. _`wms-mapextent`:

mapX:EXTENT
^^^^^^^^^^^

This parameter specifies the extent for a layout map item as
xmin,ymin,xmax,ymax.

.. _`wms-maprotation`:

mapX:ROTATION
^^^^^^^^^^^^^

This parameter specifies the map rotation in degrees.

.. _`wms-mapgridintervalx`:

mapX:GRID_INTERVAL_X
^^^^^^^^^^^^^^^^^^^^

This parameter specifies the grid line density in the X direction.

.. _`wms-mapgridintervaly`:

mapX:GRID_INTERVAL_Y
^^^^^^^^^^^^^^^^^^^^

This parameter specifies the grid line density in the Y direction.

.. _`wms-mapscale`:

mapX:SCALE
^^^^^^^^^^

This parameter specifies the map scale for a layout map item.
This is useful to ensure scale based visibility of layers and
labels even if client and server may have different algorithms to
calculate the scale denominator.

.. _`wms-maplayers`:

mapX:LAYERS
^^^^^^^^^^^

This parameter specifies the layers for a layout map item. See
:ref:`GetMap Layers <wms-layers>` for more information on
this parameter.

.. _`wms-mapstyles`:

mapX:STYLES
^^^^^^^^^^^

This parameter specifies the layers' styles defined in a specific
layout map item.
See :ref:`GetMap Styles <wms-styles>` for more information on
this parameter.


.. _server_wms_getprojectsettings:

GetProjectSettings
------------------

This request type works similar to **GetCapabilities**, but it is more
specific to QGIS Server and allows a client to read additional
information which is not available in the GetCapabilities output:

* initial visibility of layers
* information about vector attributes and their edit types
* information about layer order and drawing order
* list of layers published in WFS
* show if a group in the layer tree is :ref:`mutually exclusive <group_layers_interact>`
