.. only:: html


.. index:: QGIS Server, WMS Server, WFS Server, WCS Server

.. _`label_qgisserver`:


***********************
QGIS as OGC Data Server
***********************

QGIS Server is an open source WMS 1.3, WFS 1.0.0, WFS 1.1.0 and WCS 1.1.1
implementation that, in addition, implements advanced cartographic features for
thematic mapping. QGIS Server is a FastCGI/CGI (Common Gateway Interface)
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

.. toctree::
  :maxdepth: 2

  getting_started
  services
  plugins
  config
