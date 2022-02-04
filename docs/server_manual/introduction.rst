************
Introduction
************

QGIS Server is an open source WMS, WFS, OGC API for Features 1.0 (WFS3) and WCS
implementation that, in addition, implements advanced cartographic features for
thematic mapping. QGIS Server is a FastCGI/CGI (Common Gateway Interface)
application written in C++ that works together with a web server (e.g., Apache,
Nginx). It has Python plugin support allowing for fast and efficient
development and deployment of new features.

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


Permission is granted to copy, distribute and/or modify this document under the
terms of the GNU Free Documentation License, Version 1.3 or any later version
published by the Free Software Foundation; with no Invariant Sections, no
Front-Cover Texts, and no Back-Cover Texts.

A copy of the license is included in the section :ref:`gnu_fdl`.
