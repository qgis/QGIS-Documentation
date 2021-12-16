Web Coverage Service (WCS)
==========================

The **1.0.0** and **1.1.1** WCS standards implemented in QGIS Server provides a
HTTP interface to access raster data, referred to as *coverage*, coming from a
QGIS project.

Specifications:

- `WCS 1.0.0 <http://docs.opengeospatial.org/is/16-083r2/16-083r2.html>`_
- `WCS 1.1.1 <http://docs.opengeospatial.org/is/09-146r8/09-146r8.html>`_

Standard requests provided by QGIS Server:

.. csv-table::
   :header: "Request", "Description"
   :widths: auto

   ":ref:`GetCapabilities <qgisserver_wcs_getcapabilities>`", "Returns XML metadata with information about the server"
   ":ref:`DescribeCoverage <qgisserver_wcs_describecoverage>`", "Retrieves XML document about additional information about coverages"
   ":ref:`GetCoverage <qgisserver_wcs_getcoverage>`", ""


.. _`qgisserver_wcs_getcapabilities`:

GetCapabilities
---------------

Standard parameters for the **GetCapabilities** request according to the OGC
WCS 1.1.1 specifications:

.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   ":ref:`MAP <wms-map>`", "Yes", "Name of the service (**WCS**)"
   ":ref:`SERVICE <wcs_service>`", "Yes", "Name of the service (**WCS**)"
   ":ref:`VERSION <wcs_version>`", "No", "Version of the service"
   ":ref:`REQUEST <wcs_getcapabilities_request>`", "Yes", "Name of the request (**GetCapabilities**)"

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


.. _`wcs_service`:

SERVICE
^^^^^^^

This parameter has to be ``WCS``.


.. _`wcs_getcapabilities_request`:

REQUEST
^^^^^^^

This parameter is ``GetCapabilities`` in case of the **GetCapabilities**
request.


.. _`wcs_version`:

VERSION
^^^^^^^

This parameter allows to specify the version of the service to use. Currently,
the version values is not internally used and always fallback to ``1.1.1``.


.. _`qgisserver_wcs_describecoverage`:

DescribeCoverage
----------------

This request allows to retrieve additional information about coverages like the
format of the underlying datasource, the number of bands, ... Standard
parameters for the **DescribeCoverage** request according to the OGC WCS 1.1.1
specifications:

.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   ":ref:`COVERAGE <wcs_describecoverage_coverage>`", "No", "Specify coverage layers"
   ":ref:`IDENTIFIER <wcs_describecoverage_identifier>`", "No", ""


The XML document for a 3 bands GeoTIFF raster layer looks like:

.. code-block:: xml

  <CoverageDescription xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.opengis.net/wcs" xmlns:gml="http://www.opengis.net/gml" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" updateSequence="0" version="1.0.0" xsi:schemaLocation="http://www.opengis.net/wcs http://schemas.opengis.net/wcs/1.0.0/describeCoverage.xsd">
    <CoverageOffering>
      <name>T20QPD_20171123T144719_TCI</name>
      <label>T20QPD_20171123T144719_TCI</label>
      <lonLatEnvelope srsName="urn:ogc:def:crs:OGC:1.3:CRS84">
        ...
      </lonLatEnvelope>
      <domainSet>
        ...
      </domainSet>
      <rangeSet>
        <RangeSet>
          <name>Bands</name>
          <label>Bands</label>
          <axisDescription>
            <AxisDescription>
              <name>bands</name>
              <label>bands</label>
              <values>
                <singleValue>1</singleValue>
                <singleValue>2</singleValue>
                <singleValue>3</singleValue>
              </values>
            </AxisDescription>
          </axisDescription>
        </RangeSet>
      </rangeSet>
      <supportedCRSs>
      ...
      </supportedCRSs>
      <supportedFormats nativeFormat="raw binary">
        <formats>GeoTIFF</formats>
      </supportedFormats>
    </CoverageOffering>
  </CoverageDescription>


.. _`wcs_describecoverage_coverage`:

COVERAGE
^^^^^^^^

This parameter, defined in WCS ``1.0.0``, allows to specify the layers to query
for additional information. Names have to be separated by a comma.

In addition, QGIS Server introduced an option to select layers by its short
name.  The short name of a layer may be configured through
:menuselection:`Properties --> Metadata` in layer menu.  If the short name is
defined, then it's used by default instead of the layer's name:

.. code-block:: bash

  http://localhost/qgisserver?
  SERVICE=WCS
  &REQUEST=DescribeCoverage
  &COVERAGE=mylayer1name,mylayer2shortname


.. _`wcs_describecoverage_identifier`:

IDENTIFIER
^^^^^^^^^^

This parameter replaces the :ref:`COVERAGE <wcs_describecoverage_coverage>`
parameter in WCS ``1.1.1``. But QGIS Server does not filter according to the
``VERSION`` parameter so ``IDENTIFIER`` and ``COVERAGE`` have the same effect.

.. note::

  If both ``IDENTIFIER`` and ``COVERAGE`` parameters are defined,
  ``COVERAGE`` is always used in priority.


.. _`qgisserver_wcs_getcoverage`:

GetCoverage
-----------

TODO
