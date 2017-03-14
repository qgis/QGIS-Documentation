|LS| Serving WMS
===============================================================================

Let's download the `demo data <https://github.com/tudorbarascu/qgis-server-tutorial-data/archive/master.zip>`_
and unzip the files to any directory, e.g. :file:`/home/qgis/projects`.

Let's make a WMS GetCapabilities request in the web browser or with curl::

 http://qgisplatform.demo/cgi-bin/qgis_mapserv.fcgi
 ?SERVICE=WMS
 &VERSION=1.3.0
 &REQUEST=GetCapabilities
 &map=/home/qgis/projects/world.qgs

.. warning::

 This module presents the URLs so that the audience can easily distinguish
 the parameters and parameters values. While the normal format is::

  ...&field1=value1&field2=value2&field3=value3

 this tutorial uses::

  &field1=value1
  &field2=value2
  &field3=value3

 Pasting them into Mozilla Firefox works properly but other web browsers
 like Chrome may add unwanted spaces between the `field:parameter` pairs.
 So, if you encounter this issue you can either use Firefox or modify
 the URLs so that they're in a one line format.

.. note::

 In the above configuration the `QGIS_PROJECT_FILE` variable sets the default
 project to :file:`/home/qgis/projects/world.qgs`. However, we made use of
 the **map** parameter to be explicit and to show it can be used to point at
 any project. In the above request, QGIS Server outputs the same response
 if you don't use the **map** parameter.

By pointing any WMS client to the GetCapabilities URL, the client gets in
response an XML document with metadata of the Web Map Server’s information,
e.g. what layers does it serve, the geographical coverage, in
what format, what version of WMS etc.

As QGIS is also a :ref:`ogc-wms` you can create a new WMS server connection
with the help of the above GetCapabilities url. See the :ref:`wms-services`
or the  :ref:`ogc-wms-servers` section on how to do it.

By adding the `countries` WMS layer to your QGIS project you should get an image
like the one below:

.. only:: html

  **Figure countries WMS layer from QGIS Desktop:**

.. figure:: /static/training_manual/qgis_server/qgis_getmap_request.png
   :align: center

   QGIS Desktop consuming the QGIS Server countries layer WMS service

.. note::

 QGIS Server serves layers that are defined in the :file:`world.qgs` project.
 By opening the project with QGIS you can see there are multiple styles for
 the countries layer. QGIS Server is also aware of this and you can choose
 the style you want in your request.  The `classified_by_population` style
 was chosen in the above image.

GetMap requests
-------------------------------------------------------------------------------

In order to display the `countries` layer, QGIS Desktop, like any other WMS client, is using
`GetMap` requests.

A simple request looks like::

 http://qgisplatform.demo/cgi-bin/qgis_mapserv.fcgi
 ?MAP=/home/qgis/projects/world.qgs
 &SERVICE=WMS
 &VERSION=1.3.0
 &REQUEST=GetMap
 &BBOX=-432786,4372992,3358959,7513746
 &SRS=EPSG:3857
 &WIDTH=665
 &HEIGHT=551
 &LAYERS=countries
 &FORMAT=image/jpg

The above request should output the following image:

.. only:: html

  **Figure: simple GetMap request to QGIS Server**

.. figure:: /static/training_manual/qgis_server/getmap_simple_request.jpg
   :align: center

   A simple GetMap WMS request for QGIS Server

|moderate| |TY| Change the Image and Layers parameters
-------------------------------------------------------------------------------

* Based on the request above, let's replace the `countries` layer with another.
* In order to see what other layers are available you could open up the
  :file:`world.qgs` project in QGIS and see. Keep in mind though that the WMS
  clients don't have access to the QGIS project, they just see the capabilities
  document. Also, there's a configuration option so that some of the layers
  existing in the QGIS project are ignored by QGIS when serving the WMS service.
* So, you could look at the layer list when you point QGIS Desktop to the
  `GetCapabilities` URL or you could try yourself finding other layer names
  in the GetCapabilities XML response.
* One of the layer names that you could find and works is ``countries_shapeburst``.
  You may find others but keep in mind some may not be visible at such a small
  scall so you yould get a blank image as response.
* You can also play around with others parameters from above, like changing the
  returned image type to `image/png`.

|moderate| |FA| Use Filter, Opacities and Filter parameters
-------------------------------------------------------------------------------

Let's do another request that adds another layer, some of the
:ref:`extra-getmap-parameters`, **FILTER** and **OPACITIES**, but also
uses the standard STYLES parameter.

::

 http://qgisplatform.demo/cgi-bin/qgis_mapserv.fcgi
 ?MAP=/home/qgis/projects/world.qgs
 &SERVICE=WMS
 &VERSION=1.3.0
 &REQUEST=GetMap
 &BBOX=-432786,4372992,3358959,7513746
 &SRS=EPSG:3857
 &WIDTH=665
 &HEIGHT=551
 &FORMAT=image/jpg
 &LAYERS=countries,countries_shapeburst
 &STYLES=classified_by_name,default
 &OPACITIES=255,30
 &FILTER=countries:"name" IN ( 'Germany' , 'Italy' )

The above request should output the following image:

.. only:: html

  **Figure: GetMap response to request with FILTER and OPACITIES parameters**

.. figure:: /static/training_manual/qgis_server/getmap_filter_opacities.jpg
   :align: center

   Response to a GetMap request with FILTER and OPACITIES parameters

As you can see from the above image, among other things, we told QGIS Server
to render only **Germany** and **Italy** from the countries layer.

|moderate| |FA| Use Redlining
-------------------------------------------------------------------------------

Let's do another GetMap request that makes use of the :ref:`qgisserver-redlining`
feature and of the **SELECTION** parameter detailed in the
:ref:`extra-getmap-parameters` section::

 http://qgisplatform.demo/cgi-bin/qgis_mapserv.fcgi
 ?MAP=/home/qgis/projects/world.qgs
 &SERVICE=WMS
 &VERSION=1.3.0
 &REQUEST=GetMap
 &BBOX=-432786,4372992,3358959,7513746
 &SRS=EPSG:3857
 &WIDTH=665
 &HEIGHT=551
 &LAYERS=countries,countries_shapeburst
 &FORMAT=image/jpg
 &HIGHLIGHT_GEOM=POLYGON((590000 6900000, 590000 7363000, 2500000 7363000, 2500000 6900000, 590000 6900000))
 &HIGHLIGHT_SYMBOL=<StyledLayerDescriptor><UserStyle><Name>Highlight</Name><FeatureTypeStyle><Rule><Name>Symbol</Name><LineSymbolizer><Stroke><SvgParameter name="stroke">%233a093a</SvgParameter><SvgParameter name="stroke-opacity">1</SvgParameter><SvgParameter name="stroke-width">1.6</SvgParameter></Stroke></LineSymbolizer></Rule></FeatureTypeStyle></UserStyle></StyledLayerDescriptor>
 &HIGHLIGHT_LABELSTRING=QGIS Tutorial
 &HIGHLIGHT_LABELSIZE=30
 &HIGHLIGHT_LABELCOLOR=%23000000
 &HIGHLIGHT_LABELBUFFERCOLOR=%23FFFFFF
 &HIGHLIGHT_LABELBUFFERSIZE=3
 &SELECTION=countries:171,6

Pasting the above request in your web browser should output the following image:

.. only:: html

  **Figure:  Response to a GetMap request with REDLINING and SELECTION**

.. figure:: /static/training_manual/qgis_server/getmap_redlining_selection.jpg
   :align: center

   Response to a request with the REDLINING feature and SELECTION parameter

You can see from the above image that the countries with the 171 and 65 ids were
highlighted in yellow (Romania and France) by using the **SELECTION** parameter
and we used the **REDLINING** feature to overlay a rectangle with the
**QGIS Tutorial** label.
