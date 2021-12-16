Web Coverage Service (WCS)
==========================

The **1.1.1** WCS standards implemented in QGIS Server provides a HTTP
interface to access raster data coming from a QGIS project.

Specifications:

- `WCS 1.1.1 <http://docs.opengeospatial.org/is/09-146r8/09-146r8.html>`_

Standard requests provided by QGIS Server:

.. csv-table::
   :header: "Request", "Description"
   :widths: auto

   ":ref:`GetCapabilities <qgisserver_wcs_getcapabilities>`", "Returns XML metadata with information about the server"
   ":ref:`DescribeCoverage <qgisserver_wcs_describecoverage>`", ""
   ":ref:`GetCoverage <qgisserver_wcs_getcoverage>`", ""


.. _`qgisserver_wcs_getcapabilities`:

GetCapabilities
---------------

Standard parameters for the **GetCapabilities** request according to the OGC
WMS 1.1.1 and 1.3.0 specifications:

.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   ":ref:`SERVICE <wms-service>`", "Yes", "Name of the service (**WMS**)"
   ":ref:`VERSION <wms-version>`", "No", "Version of the service"
   ":ref:`REQUEST <wms-getcapabilities-request>`", "Yes", "Name of the request (**GetCapabilities**)"

URL example:

.. code-block:: none

  http://localhost/qgis_server?
  SERVICE=WMS
  &VERSION=1.3.0
  &REQUEST=GetCapabilities


REQUEST
^^^^^^^

This parameter is ``GetCapabilities`` in case of the **GetCapabilities**
request.


.. _`qgisserver_wcs_describecoverage`:

DescribeCoverage
----------------

TODO


.. _`qgisserver_wcs_getcoverage`:

GetCoverage
-----------

TODO
