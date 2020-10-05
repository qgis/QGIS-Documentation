************
Introduction
************

QGIS Server is an open source WMS 1.3, WFS 1.0.0, WFS 1.1.0, OGC API for Features 1.0 (WFS3) and WCS 1.1.1
implementation that, in addition, implements advanced cartographic features for
thematic mapping. QGIS Server is a FastCGI/CGI (Common Gateway Interface)
application written in C++ that works together with a web server (e.g., Apache,
Nginx). It has Python plugin support allowing for fast and efficient
development and deployment of new features.

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
a QGIS Server on Linux (Debian, Ubuntu and derivatives) and on Windows.
For more information about server plugin development, please read :ref:`server_plugins`.

