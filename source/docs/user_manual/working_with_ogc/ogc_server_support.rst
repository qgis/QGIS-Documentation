|updatedisclaimer|

.. comment out this Section (by putting '|updatedisclaimer|' on top) if file is not uptodate with release

.. index:: QGIS_Server, FastCGI, CGI, Common_Gateway_Interface

.. _`label_qgisserver`:

QGIS Server
===========

QGIS Server is an open source WMS 1.3 and WFS 1.0.0 implementation which, in addition,
implements advanced cartographic features for thematic mapping. The QGIS Server
is a FastCGI/CGI (Common Gateway Interface) application written in C++ that works
together with a webserver (e.g. Apache, Lighttpd). It is funded by the EU projects
Orchestra, Sany and the city of Uster in Switzerland.

.. index:: SLD, SLD/SE

It uses QGIS as backend for the GIS logic and for map rendering. Furthermore the
Qt library is used for graphics and for platform independent C++ programming. In
contrast to other WMS software, the QGIS Server uses cartographic rules as a
configuration language, both for the server configuration and for the user-defined
cartographic rules.

.. index:: Publish_to_Web_plugin

Moreover, the QGIS Server project provides the 'Publish to Web' plugin, a plugin
for QGIS desktop which exports the current layers and symbology as a web project
for QGIS Server (containing cartographic visualization rules expressed in SLD).

As QGIS desktop and QGIS Server use the same visualization libraries, the maps
that are published on the web look the same as in desktop GIS. The 'Publish to Web'
plugin currently supports basic symbolization, with more complex cartographic
visualization rules introduced manually. As the configuration is performed with
the `SLD standard <http://www.opengeospatial.org/standards/sld>`_ and its
documented extensions, there is only one standardised language to learn, which
greatly simplifies the complexity of creating maps for the Web.

In one of the following manuals we will provide a sample configuration to set up
a QGIS Server. But for now we recommend to read one of the following URLs to get
more information:

* http://karlinapp.ethz.ch/qgis_wms/
* http://hub.qgis.org/projects/quantum-gis/wiki/QGIS_Server_Tutorial
* http://linfiniti.com/2010/08/qgis-mapserver-a-wms-server-for-the-masses/

.. index:: apache, apache2, Debian_Squeeze

Sample installation on Debian Squeeze
-------------------------------------

At this point we will give a short and simple sample installation howto for
Debian Squeeze. Many other OS provide packages for QGIS Server, too. If you
have to build it all from source, please refer to the URLs above.

Apart from qgis and qgis-mapserver you need a webserver, in our case apache2.
You can install all packages with aptitude or apt-get install together with other
necessary dependency packages. After installation you should test, if the webserver
and qgis server works as expected. Make sure the apache server is running with
``/etc/init.d/apache2 start``. Open a web browser and type URL: ``http://localhost``.
If apache is up, you should see the message 'It works!'.

Now we test the qgis server installation. The :file:`qgis_mapserv.fcgi` is available
at ``/usr/lib/cgi-bin/qgis_mapserv.fcgi`` and provides a standard wms that shows
the state boundaries of Alaska. Add the WMS with the URL
``http://localhost/cgi-bin/qgis_mapserv.fcgi`` as described in :ref:`ogc-wms-servers`.

.. _figure_server_1:

.. only:: html

   **Figure Server 1:**

.. figure:: /static/user_manual/working_with_ogc/standard_wms_usa.png
   :align: center
   :width: 25 em

   Standard WMS with USA boundaries included in the qgis server (KDE) |nix|


.. _`Creating a WMS from a QGIS project`:

Creating a WMS/WFS from a QGIS project
--------------------------------------

To provide a new QGIS Server WMS or WFS we have to create a QGIS project file with
some data. Here we use the 'alaska' shapefile from the QGIS Sample Dataset. 
Define the colors and styles of the layers in QGIS and define the project CRS, 
if not already done.

.. _figure_server_2:

.. only:: html

   **Figure Server 2:**

.. figure:: /static/user_manual/working_with_ogc/ows_server_definition.png
   :align: center
   :width: 20 em

   Definitions for a QGIS Server WMS/WFS project (KDE)

Then go to the :guilabel:`OWS Server` menu of the 
:menuselection:`Project --> Project Properties` dialog and give 
some information about the OWS in the fields under 
:guilabel:`Service Capabilities`.
This will appear in the GetCapabilities response of the WMS or WFS.
If you don't check |checkbox| :guilabel:`Service capabilities` 
QGIS Server will use the information given in the :file:`wms_metadata.xml` file 
located in the :file:`cgi-bin` folder.

In the :guilabel:`WMS capabilities` section you can define 
the extent advertised in the WMS GetCapabilities response by entering 
the minimum and maximum X and Y values in the fields under 
:guilabel:`Advertised extent`.
Clicking :guilabel:`Use Current Canvas Extent` sets these values to the 
extent currently displayed in the QGIS map canvas.
By checking |checkbox| :guilabel:`CRS restrictions` you can restrict 
in which coordinate reference systems (CRS) QGIS Server will offer 
to render maps.
Use the |mActionSignPlus| button below to select those CRS 
from the Coordinate Reference System Selector, or click :guilabel:`Used` 
to add the CRS used in the QGIS project to the list.

If you have print composers defined in your project they will be listed in the 
GetCapabilities response, and they can be used by the GetPrint request to 
create prints, using one of the print composer layouts as a template.
This is a QGIS specific extension to the WMS 1.3.0 specification.
If you want to exclude any print composer from being published by the WMS, 
check |checkbox| :guilabel:`Exclude composers` and click the 
|mActionSignPlus| button below.
Then select a print composer from the :guilabel:`Select print composer` dialog 
in order to add it to the excluded composers list.

If you want to exclude any layer or layer group from being published by the 
WMS, check |checkbox| :guilabel:`Exclude Layers` and click the 
|mActionSignPlus| button below.
This opens the :guilabel:`Select restricted layers and groups` dialog which 
allows you to choose the layers and groups that you don't want to be published.
Use the shift or control key if you want to select multiple entries at once.

.. FIXME QGIS 2.1: From |qg| 2.1 you can requested GetFeatureInfo in different outputformat: plain text, XML and GML.
.. FIXME QGIS 2.1: guilabel has been changed to `Add geometry to feature response`
.. FIXME QGIS 2.1: text or GML format depending the outpurformat choosen for the GetFeatureInfo request.

If you wish you can check |checkbox| :guilabel:`Add WKT geometry to feature 
info response`.
This will include in the GetFeatureInfo response the geometries of the features 
in a text format. 
If you want QGIS Server to advertise specific request URLs in the WMS 
GetCapabilities response, enter the corresponding URL in the 
:guilabel:`Advertised URL` field.
Furthermore you can restrict the maximum size of the maps returned by the 
GetMap request by entering the maximum width and height into the respective 
fields under :guilabel:`Maximums for GetMap request`.

In the :guilabel:`WFS capabilities` area you can select the layers that you 
want to provide as WFS, and specify if they will allow the update, insert and 
delete operations.
If you enter a URL in the :guilabel:`Advertised URL` field of the 
:guilabel:`WFS capabilities` section, QGIS Server will advertise this specific 
URL in the WFS GetCapabilities response.

Now save the
session in a project file :file:`alaska.qgs`. To provide the project as a WMS/WFS,
we create a new folder ``/usr/lib/cgi-bin/project`` with admin privileges and
add the project file :file:`alaska.qgs` and a copy of the :file:`qgis_mapserv.fcgi`
file - that's all.

Now we test our project WMS and WFS, add the WMS and WFS as described in
:ref:`ogc-wms-layers` and :ref:`ogc-wfs` to QGIS and load the WMS. The URL is:

::

 http://localhost/cgi-bin/project/qgis_mapserv.fcgi
 
Fine tuning your OWS
.....................

For vector layers, the :guilabel:`Fields` menu of the 
:menuselection:`Layer --> Properties` dialog allows you to define for each 
attribute if it will be published or not.
By default all the attributes are published by your WMS and WFS.
If you want a specific attribute not to be published, uncheck the corresponding 
check box in the :guilabel:`WMS` or :guilabel:`WFS` column.

You can overlay watermarks over the maps produced by your WMS by adding text 
annotations or SVG annotations to the project file.
See :ref:`sec_annotations` for instructions on creating annotations.
For annotations to be displayed as watermarks on the WMS output, the 
:guilabel:`Fixed map position` check box in the :guilabel:`Annotation text` 
dialog must be unchecked.
This can be accessed by double clicking the annotation while one of the 
annotation tools is active.
For SVG annotations you will either need to set the project to save absolute 
paths (in the :guilabel:`General` menu of the 
:menuselection:`Project --> Project Properties` dialog) or to manually modify 
the path to the SVG image in a way that it represents a valid relative path.

Extra parameters supported by the WMS GetMap request
....................................................

In the WMS GetMap request QGIS Server accepts a couple of extra 
parameters in addition to the standard parameters according to the 
OCG WMS 1.3.0 specification:

.. FIXME QGIS 2.1: You can define a QGIS_PROJECT_FILE as an environment variable to tell 
    server executable where to find the |qg| project file. This variable will 
	be the location where |qg| will look for the project file. If not defined 
	it will use the MAP parameter in the request and finally look at the server 
	executable directory.

* **MAP** parameter: Similar to MapServer, the ``MAP`` parameter can be used to 
  specify the path to the QGIS project file. You can specify an absolute path 
  or a path relative to the location of the server executable 
  (:file:`qgis_mapserv.fcgi`).
  If not specified, QGIS Server searches for .qgs files in the directory where 
  the server executable is located.

  Example::
    http://localhost/cgi-bin/qgis_mapserv.fcgi?REQUEST=GetMap&MAP=/home/qgis/mymap.qgs&...
* **DPI** parameter: The ``DPI`` parameter can be used to specify the requested 
  output resolution. 
  Example::
    http://localhost/cgi-bin/qgis_mapserv.fcgi?REQUEST=GetMap&DPI=300&...
* **OPACITIES** parameter: Opacity can be set on layer or group level. 
  Allowed values range from 0 (fully transparent) to 255 (fully opaque). 
  Example::
    http://localhost/cgi-bin/qgis_mapserv.fcgi?REQUEST=GetMap&LAYERS=mylayer1,mylayer2&OPACITIES=125,200&...

