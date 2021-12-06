External WMS layers
===================

QGIS Server allows including layers from external WMS servers in WMS GetMap
and WMS GetPrint requests. This is especially useful if a web client uses an
external background layer in the web map.
For performance reasons, such layers should be directly requested by the web
client (not cascaded via QGIS server). For printing however, these layers
should be cascaded via QGIS server in order to appear in the printed map.

External layers can be added to the LAYERS parameter as
EXTERNAL_WMS:<layername>.
The parameters for the external WMS layers (e.g. url, format,
dpiMode, crs, layers, styles) can later be given as service
parameters <layername>:<parameter>.
In a GetMap request, this might look like this:

.. code-block:: none

   http://localhost/qgisserver?
   SERVICE=WMS&REQUEST=GetMap
   ...
   &LAYERS=EXTERNAL_WMS:basemap,layer1,layer2
   &STYLES=,,
   &basemap:url=http://externalserver.com/wms.fcgi
   &basemap:format=image/jpeg
   &basemap:dpiMode=7
   &basemap:crs=EPSG:2056
   &basemap:layers=orthofoto
   &basemap:styles=default

Similarly, external layers can be used in GetPrint requests:

.. code-block:: none

   http://localhost/qgisserver?
   SERVICE=WMS
   ...
   &REQUEST=GetPrint&TEMPLATE=A4
   &map0:layers=EXTERNAL_WMS:basemap,layer1,layer2
   &map0:EXTENT=<minx,miny,maxx,maxy>
   &basemap:url=http://externalserver.com/wms.fcgi
   &basemap:format=image/jpeg
   &basemap:dpiMode=7
   &basemap:crs=EPSG:2056
   &basemap:layers=orthofoto
   &basemap:styles=default
