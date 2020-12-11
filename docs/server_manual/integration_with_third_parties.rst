******************************
Integration with third parties
******************************

.. only:: html

   .. contents::
      :local:
      :depth: 3

QGis server provides standard OGC streams like `WMS, WFS, etc. <https://www.ogc.org/docs/is>`_ thus it can used by a wide variety of end user tools.

Integration with QGis Desktop
=============================

QGis Desktop is the map builder where QGis Server is the map streamer. The maps or QGis projects will be served by the QGis Server to provide to standard OGC streams. These QGis projects can either be files or entries in a database (by using `Project -> Save to -> PostgreSQL` in QGis Desktop).

Furthermore, dedicated update processes must be established to refresh a project used by a QGis Server. 


Integration with MapProxy
=========================

`MapProxy <https://mapproxy.org/>`_ is tile cache server and as it can read and serve any WMS/WMTS map server, it can be directly connected to QGis server streams and improve end user experience.


Integration with QWC2
=====================

`QWC2 <https://github.com/qgis/qwc2>`_ is a responsive web application dedicated to QGis Server. It helps you to build a highly customized map viewer with layer selection, feature info, etc.. Also many plugins are available like authentication or print service, the full list is available is this `repository <https://github.com/qwc-services>`_. 
