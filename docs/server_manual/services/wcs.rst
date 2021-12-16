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
WCS 1.1.1 specifications:

.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   ":ref:`SERVICE <wcs-service>`", "Yes", "Name of the service (**WCS**)"
   ":ref:`VERSION <wcs-version>`", "No", "Version of the service"
   ":ref:`REQUEST <wcs-getcapabilities-request>`", "Yes", "Name of the request (**GetCapabilities**)"

URL example:

.. code-block:: bash

  http://localhost/qgis_server?
  SERVICE=WCS
  &VERSION=1.1.1
  &REQUEST=GetCapabilities

XML document example when a single raster layer (named
``T20QPD_20171123T144719_TCI``) is published in the QGIS project for the WCS
service:

.. code-block:: xml

  <WCS_Capabilities xmlns="http://www.opengis.net/wcs" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:gml="http://www.opengis.net/gml" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.0.0" updateSequence="0" xsi:schemaLocation="http://www.opengis.net/wcs http://schemas.opengis.net/wcs/1.0.0/wcsCapabilities.xsd">
    <Service>
      ...
    </Service>
    <Capability>
      ...
    </Capability>
    <ContentMetadata>
      <CoverageOfferingBrief>
        <name>T20QPD_20171123T144719_TCI</name>
        <label>T20QPD_20171123T144719_TCI</label>
        <lonLatEnvelope srsName="urn:ogc:def:crs:OGC:1.3:CRS84">
          <gml:pos>-61.585973 16.331189</gml:pos>
          <gml:pos>-61.52537 16.400376</gml:pos>
        </lonLatEnvelope>
      </CoverageOfferingBrief>
    </ContentMetadata>
  </WCS_Capabilities>


.. _`wcs-service`:

SERVICE
^^^^^^^

This parameter has to be ``WCS``.


.. _`wcs-getcapabilities-request`:

REQUEST
^^^^^^^

This parameter is ``GetCapabilities`` in case of the **GetCapabilities**
request.


.. _`wcs-version`:

VERSION
^^^^^^^

This parameter allows to specify the version of the service to use. Currently,
only the ``1.1.1`` value is supported.


.. _`qgisserver_wcs_describecoverage`:

DescribeCoverage
----------------

TODO


.. _`qgisserver_wcs_getcoverage`:

GetCoverage
-----------

TODO
