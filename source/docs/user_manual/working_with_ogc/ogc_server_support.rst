|updatedisclaimer|

.. _`label_qgisserver`:

|qg| as OGC Data Server
=======================

|qg| Server is an open source WMS 1.3, WFS 1.0.0 and WCS 1 1.1.1 implementation that, 
in addition, implements advanced cartographic features for thematic mapping. The |qg| Server
is a FastCGI/CGI (Common Gateway Interface) application written in C++ that works
together with a web server (e.g., Apache, Lighttpd). It is funded by the EU projects
Orchestra, Sany and the city of Uster in Switzerland.

.. index:: SLD, SLD/SE
.. index:: QGIS_Server, FastCGI, CGI, Common_Gateway_Interface

|qg| Server uses |qg| as back end for the GIS logic and for map rendering. Furthermore, the
Qt library is used for graphics and for platform-independent C++ programming. In
contrast to other WMS software, the |qg| Server uses cartographic rules as a
configuration language, both for the server configuration and for the user-defined
cartographic rules.

.. index:: Publish_to_Web_plugin

Moreover, the |qg| Server project provides the 'Publish to Web' plugin, a plugin
for |qg| desktop that exports the current layers and symbology as a web project
for |qg| Server (containing cartographic visualization rules expressed in SLD).

As |qg| desktop and |qg| Server use the same visualization libraries, the maps
that are published on the web look the same as in desktop GIS. The 'Publish to Web'
plugin currently supports basic symbolization, with the option to introduce more complex 
cartographic visualization rules manually. As the configuration is performed with
the `SLD standard <http://www.opengeospatial.org/standards/sld>`_ and its
documented extensions, there is only one standardised language to learn, which
greatly simplifies the complexity of creating maps for the Web.

In one of the following manuals, we will provide a sample configuration to set up
a |qg| Server. For now, we recommend to read one of the following URLs to get
more information:

* http://karlinapp.ethz.ch/qgis_wms/
* http://hub.qgis.org/projects/quantum-gis/wiki/QGIS_Server_Tutorial
* http://linfiniti.com/2010/08/qgis-mapserver-a-wms-server-for-the-masses/

.. index:: apache, apache2, Debian_Squeeze

Sample installation on Debian Squeeze
-------------------------------------

At this point, we will give a short and simple sample installation how-to for
Debian Squeeze. Many other OSs provide packages for |qg| Server, too. If you
have to build it all from source, please refer to the URLs above.

Apart from |qg| and |qg| Server, you need a web server, in our case apache2.
You can install all packages with ``aptitude`` or ``apt-get install`` together with other
necessary dependency packages. After installation, you should test to confirm that the web server
and |qg| Server work as expected. Make sure the apache server is running with
``/etc/init.d/apache2 start``. Open a web browser and type URL: ``http://localhost``.
If apache is up, you should see the message 'It works!'.

Now we test the |qg| Server installation. The :file:`qgis_mapserv.fcgi` is available
at ``/usr/lib/cgi-bin/qgis_mapserv.fcgi`` and provides a standard WMS that shows
the state boundaries of Alaska. Add the WMS with the URL
``http://localhost/cgi-bin/qgis_mapserv.fcgi`` as described in :ref:`ogc-wms-servers`.

.. _figure_server_1:

.. only:: html

   **Figure Server 1:**

.. figure:: /static/user_manual/working_with_ogc/standard_wms_usa.png
   :align: center

   Standard WMS with USA boundaries included in the |qg| Server (KDE) |nix|


.. _`Creating a WMS from a QGIS project`:

Creating a WMS/WFS/WCS from a |qg| project
------------------------------------------

To provide a new |qg| Server WMS, WFS or WCS, we have to create a |qg| project 
file with some data. Here, we use the 'Alaska' shapefile from the |qg| sample 
dataset. Define the colors and styles of the layers in |qg| and the project CRS,
if not already defined.

.. _figure_server_2:

.. only:: html

   **Figure Server 2:**

.. figure:: /static/user_manual/working_with_ogc/ows_server_definition.png
   :align: center

   Definitions for a |qg| Server WMS/WFS/WCS project (KDE)

Then, go to the :guilabel:`OWS Server` menu of the
:menuselection:`Project --> Project Properties` dialog and provide
some information about the OWS in the fields under
:guilabel:`Service Capabilities`.
This will appear in the GetCapabilities response of the WMS, WFS or WCS.
If you don't check |checkbox| :guilabel:`Service capabilities`,
|qg| Server will use the information given in the :file:`wms_metadata.xml` file
located in the :file:`cgi-bin` folder.

**WMS capabilities**

In the :guilabel:`WMS capabilities` section, you can define
the extent advertised in the WMS GetCapabilities response by entering
the minimum and maximum X and Y values in the fields under
:guilabel:`Advertised extent`.
Clicking :guilabel:`Use Current Canvas Extent` sets these values to the
extent currently displayed in the |qg| map canvas.
By checking |checkbox| :guilabel:`CRS restrictions`, you can restrict
in which coordinate reference systems (CRS) |qg| Server will offer
to render maps.
Use the |mActionSignPlus| button below to select those CRS
from the Coordinate Reference System Selector, or click :guilabel:`Used`
to add the CRS used in the |qg| project to the list.

If you have print composers defined in your project, they will be listed in the
GetCapabilities response, and they can be used by the GetPrint request to
create prints, using one of the print composer layouts as a template.
This is a |qg|-specific extension to the WMS 1.3.0 specification.
If you want to exclude any print composer from being published by the WMS,
check |checkbox| :guilabel:`Exclude composers` and click the
|mActionSignPlus| button below.
Then, select a print composer from the :guilabel:`Select print composer` dialog
in order to add it to the excluded composers list.

If you want to exclude any layer or layer group from being published by the
WMS, check |checkbox| :guilabel:`Exclude Layers` and click the
|mActionSignPlus| button below.
This opens the :guilabel:`Select restricted layers and groups` dialog, which
allows you to choose the layers and groups that you don't want to be published.
Use the :kbd:`Shift` or :kbd:`Ctrl` key if you want to select multiple entries at once.

You can receive requested GetFeatureInfo as plain text, XML and GML. Default is XML, 
text or GML format depends the output format choosen for the GetFeatureInfo request.

If you wish, you can check |checkbox| :guilabel:`Add geometry to feature response`. 
This will include in the GetFeatureInfo response the geometries of the 
features in a text format. If you want |qg| Server to advertise specific request URLs 
in the WMS GetCapabilities response, enter the corresponding URL in the
:guilabel:`Advertised URL` field.
Furthermore, you can restrict the maximum size of the maps returned by the
GetMap request by entering the maximum width and height into the respective
fields under :guilabel:`Maximums for GetMap request`.

**WFS capabilities**

In the :guilabel:`WFS capabilities` area, you can select the layers that you
want to publish as WFS, and specify if they will allow the update, insert and
delete operations.
If you enter a URL in the :guilabel:`Advertised URL` field of the
:guilabel:`WFS capabilities` section, |qg| Server will advertise this specific
URL in the WFS GetCapabilities response.

**WCS capabilities**

In the :guilabel:`WCS capabilities` area, you can select the layers that you
want to publish as WCS. If you enter a URL in the :guilabel:`Advertised URL` field of the
:guilabel:`WCS capabilities` section, |qg| Server will advertise this specific
URL in the WCS GetCapabilities response.

Now, save the session in a project file :file:`alaska.qgs`. To provide the project 
as a WMS/WFS, we create a new folder ``/usr/lib/cgi-bin/project`` with admin privileges 
and add the project file :file:`alaska.qgs` and a copy of the :file:`qgis_mapserv.fcgi`
file - that's all.

Now we test our project WMS, WFS and WCS. Add the WMS, WFS and WCS as described in
:ref:`ogc-wms-layers`, :ref:`ogc-wfs` and :ref:`ogc-wcs` to |qg| and load the data. 
The URL is:

::

 http://localhost/cgi-bin/project/qgis_mapserv.fcgi

Fine tuning your OWS
.....................

For vector layers, the :guilabel:`Fields` menu of the
:menuselection:`Layer --> Properties` dialog allows you to define for each
attribute if it will be published or not.
By default, all the attributes are published by your WMS and WFS.
If you want a specific attribute not to be published, uncheck the corresponding
checkbox in the :guilabel:`WMS` or :guilabel:`WFS` column.

You can overlay watermarks over the maps produced by your WMS by adding text
annotations or SVG annotations to the project file.
See section Annotation Tools in :ref:`general_tools` for instructions on creating annotations.
For annotations to be displayed as watermarks on the WMS output, the
:guilabel:`Fixed map position` check box in the :guilabel:`Annotation text`
dialog must be unchecked.
This can be accessed by double clicking the annotation while one of the
annotation tools is active.
For SVG annotations, you will need either to set the project to save absolute
paths (in the :guilabel:`General` menu of the
:menuselection:`Project --> Project Properties` dialog) or to manually modify
the path to the SVG image in a way that it represents a valid relative path.

Extra parameters supported by the WMS GetMap request
....................................................

In the WMS GetMap request, |qg| Server accepts a couple of extra
parameters in addition to the standard parameters according to the
OCG WMS 1.3.0 specification:

.. FIXME QGIS 2.1: You can define a QGIS_PROJECT_FILE as an environment variable to tell
    server executable where to find the |qg| project file. This variable will
    be the location where |qg| will look for the project file. If not defined
    it will use the MAP parameter in the request and finally look at the server
    executable directory.

* **MAP** parameter: Similar to MapServer, the ``MAP`` parameter can be used to
  specify the path to the |qg| project file. You can specify an absolute path
  or a path relative to the location of the server executable
  (:file:`qgis_mapserv.fcgi`).
  If not specified, |qg| Server searches for .qgs files in the directory where
  the server executable is located.

  Example::

    http://localhost/cgi-bin/qgis_mapserv.fcgi?\
      REQUEST=GetMap&MAP=/home/qgis/mymap.qgs&...

* **DPI** parameter: The ``DPI`` parameter can be used to specify the requested
  output resolution.

  Example::

    http://localhost/cgi-bin/qgis_mapserv.fcgi?REQUEST=GetMap&DPI=300&...

* **OPACITIES** parameter: Opacity can be set on layer or group level.
  Allowed values range from 0 (fully transparent) to 255 (fully opaque).

  Example::

    http://localhost/cgi-bin/qgis_mapserv.fcgi?\
      REQUEST=GetMap&LAYERS=mylayer1,mylayer2&OPACITIES=125,200&...


Environment variables
.....................

* **QGIS_OPTIONS_PATH**: The variable specifies path to directory with settings. 
  It works the same ways as QGIS application --optionspath option. It is looking 
  for settings file in <QGIS_OPTIONS_PATH>/QGIS/QGIS2.ini. For exaple, to set 
  QGIS server on Apache to use /path/to/config/QGIS/QGIS2.ini settings file, 
  add to Apache config:

  ::

    SetEnv QGIS_OPTIONS_PATH "/path/to/config/"
