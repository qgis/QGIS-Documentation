******************************
Integration with third parties
******************************

.. only:: html

   .. contents::
      :local:
      :depth: 3

QGIS server provides standard OGC web services like `WMS, WFS, etc. <https://www.ogc.org/docs/is>`_ thus it can used by a wide variety of end user tools.

Integration with QGIS Desktop
=============================

QGIS Desktop is the map designer where QGIS Server is the map server. The maps or QGIS projects will be served by the QGIS Server to provide to OGC standards. These QGIS projects can either be files or entries in a database (by using `Project -> Save to -> PostgreSQL` in QGIS Desktop).

Furthermore, dedicated update processes must be established to refresh a project used by a QGIS Server. 


Integration with MapProxy
=========================

`MapProxy <https://mapproxy.org/>`_ is tile cache server and as it can read and serve any WMS/WMTS map server, it can be directly connected to QGIS server web services and improve end user experience.


Integration with QWC2
=====================

`QWC2 <https://github.com/qgis/qwc2>`_ is a responsive web application dedicated to QGIS Server. It helps you to build a highly customized map viewer with layer selection, feature info, etc.. Also many plugins are available like authentication or print service, the full list is available is this `repository <https://github.com/qwc-services>`_. 
