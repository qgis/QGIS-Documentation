.. comment out this disclaimer (by putting '.. ' in front of it) if file is uptodate with release
|updatedisclaimer|

.. index:: QGIS_Server, FastCGI, CGI, Common_Gateway_Interface

.. _`label_qgisserver`:

QGIS Server
============

QGIS Server is an open source WMS 1.3 implementation which, in addition, 
implements advanced cartographic features for thematic mapping. The QGIS
Server is a FastCGI/CGI (Common Gateway Interface) application written in 
C++ that works together with a webserver (e.g. Apache, Lighttpd). It is 
funded by the EU projects Orchestra, Sany and the city of Uster in Switzerland.

.. index:: SLD, SLD/SE

It uses QGIS as backend for the GIS logic and for map rendering. Furthermore the 
Qt library is used for graphics and for platform independent 
C++ programming. In contrast to other WMS software, the QGIS Server uses 
cartographic rules in as a configuration language, both for the server 
configuration and for the user-defined cartographic rules. 

.. index:: Publish_to_Web_plugin

Moreover, the QGIS Server project provides the 'Publish to Web' plugin, a 
plugin for QGIS desktop which exports the current layers and symbology as a 
web project for QGIS Server (containing cartographic visualization rules 
expressed in SLD).

As QGIS desktop and QGIS Server use the same visualization libraries, the
maps that are published on the web look the same as in desktop GIS. The 
Publish to Web plugin currently supports basic symbolization, with more complex 
cartographic visualization rules introduced manually. As the configuration is 
performed with the `SLD standard <http://www.opengeospatial.org/standards/sld>`_ 
and its documented extensions, there is only one standardised language to learn, 
which greatly simplifies the complexity of creating maps for the Web.

In one of the following manuals we will provide a sample configuration to 
set up a QGIS Server. But for now we recommend to read one of the following 
URLs to get more information:

*  http://karlinapp.ethz.ch/qgis_wms/
*  http://www.qgis.org/wiki/QGIS_mapserver_tutorial
*  http://linfiniti.com/2010/08/qgis-mapserver-a-wms-server-for-the-masses/

.. index:: apache, apache2, Debian_Squeeze

Sample installation on Debian Squeeze
--------------------------------------

At this point we will give a short and simple sample installation howto for 
Debian Squeeze. Many other OS provide packages for QGIS Server, too. If you 
have to build it all from source, please refer to the URLs above.

Apart from qgis and qgis-mapserver you need a webserver, in our case apache2. 
You can install all packages with aptitude or apt-get install together 
with other necessary dependency packages.

After installation you should test, if the webserver and qgis server works as 
expected. 

Make sure the apache server is running with ``/etc/init.d/apache2 start``. Open 
a web browser and type URL: ``http://localhost``. If apache is up, you should see 
the message 'It works!'.

Now we test the qgis server installation. The :file:`qgis_mapserv.fcgi` is available at 
``/usr/lib/cgi-bin/qgis_mapserv.fcgi`` and provides a standard wms that shows the 
state boundaries of the Unites States of America figure_server_1_. Add 
the WMS with the URL ``http://localhost/cgi-bin/qgis_mapserv.fcgi`` as described 
in :ref:`ogc-wms-servers`.

.. _figure_server_1:

.. only:: html

   **Figure Server 1:**

.. figure:: /static/user_manual/working_with_ogc/standard_wms_usa.png
   :align: center
   :width: 40 em

   Standard WMS with USA boundaries included in the qgis server (KDE) |nix|


.. _`Creating a WMS from a QGIS project`:

Creating a WMS from a QGIS project
-----------------------------------

To provide a new qgis wms server we have to create a qgis project file with some 
data. Here we use the 'regions' and the 'aiport' shapefiles from the 
qgis_sample_dataset. 

First load the shapefiles and define the colors and styles of the layers in 
QGIS and define the project CRS, if not already done. In a next step define the 
fields 'Service Capabilities', 'Coordinate System Restrictions' and 'Advertised 
Extend' under :menuselection:`Settings --> Project Properties --> WMS Server` 
and define the fields 'Service Capabilities', 'Coordinate System Restrictions' 
and 'Advertised Extend'. Additionally you can enable the checkbox 
|checkbox| :guilabel:`Add WKT geometry to feature into response` to make the layers 
queryable (see figure_server_2_). Now save the session in a 
project file :file:`alaska\_airports.qgs`. 

.. _figure_server_2:

.. only:: html

   **Figure Server 1:**

.. figure:: /static/user_manual/working_with_ogc/wms_server_definition.png
   :align: center
   :width: 40 em

   Definitions for a qgis project WMS server (KDE)

To provide the project as a WMS, we create a new folder ``/usr/lib/cgi-bin/project`` 
with admin privileges and add the project file :file:`alaska\_airports.qgs` and a copy 
of the :file:`qgis\_mapserv.fcgi` file - that's all.

Now we test our project WMS, add the WMS with the URL 
``http://localhost/cgi-bin/project/qgis_mapserv.fcgi`` as described in 
:ref:`Creating a WMS from a QGIS project` to QGIS and load the WMS, see figure_server_3_.

.. _figure_server_3:

.. only:: html

   **Figure Server 3:**

.. figure:: /static/user_manual/working_with_ogc/wms_server_project.png
   :align: center
   :width: 40 em

   QGIS WMS Server based on a qgis project (KDE)

