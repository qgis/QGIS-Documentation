|updatedisclaimer|

.. _metasearch:

MetaSearch Catalogue Client
===========================

.. image:: /static/user_manual/plugins/metasearch-splash.png
  :scale: 100%
  :alt: MetaSearch
  :align: right
  :target: https://hub.qgis.org/wiki/MetaSearch

Introduction
------------

MetaSearch is a QGIS plugin to interact with metadata catalogue services,
supporting the OGC Catalogue Service for the Web (CSW) standard.

MetaSearch provides an easy and intuitive approach and user-friendly interface
to searching metadata catalogues within QGIS.

Installation
------------

MetaSearch is included by default with QGIS 2.0 and higher.  All dependencies are
included within MetaSearch.

Install MetaSearch from the QGIS plugin manager, or manually from
http://plugins.qgis.org/plugins/MetaSearch.

Working with Metadata Catalogues in QGIS
----------------------------------------

CSW (Catalogue Service for the Web)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

`CSW (Catalogue Service for the Web)`_ is an
`OGC (Open Geospatial Consortium)`_ specification, that defines common
interfaces to discover, browse, and query metadata about data, services,
and other potential resources.

Startup
^^^^^^^

To start MetaSearch, click the MetaSearch icon or select Web / MetaSearch / 
MetaSearch via the QGIS main menu.  The MetaSearch dialog will appear.
The main GUI consists of two tabs: 'Services' and 'Search'.

Managing Catalogue Services
^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. image:: /static/user_manual/plugins/metasearch-services.png
  :scale: 80%
  :alt: Managing Catalogue Services
  :align: right

The 'Services' tab allows the user to manage all available catalogue services.
MetaSearch provides a default list of Catalogue Services, which can be added
by pressing 'Add default services' button.

To all listed Catalogue Service entries, click the dropdown select box.

To add a Catalogue Service entry, click the 'New' button, and enter a Name for
the service, as well as the URL/endpoint.  Note that only the base URL is
required (not a full GetCapabilities URL).  Clicking ok will add the service 
to the list of entries.

To edit an existing Catalogue Service entry, select the entry you would like
to edit and click the 'Edit' button, and modify the Name or URL values, then
click ok.

To delete a Catalogue Service entry, select the entry you would like to
delete and click the 'Delete' button.  You will be asked to confirm deleting
the entry.

MetaSearch allows for loading and saving connections to an XML file.  This is
useful when you need to share settings between applications.  Below is an
example of the XML file format.

.. code-block:: xml

  <?xml version="1.0" encoding="UTF-8"?>
  <qgsCSWConnections version="1.0">
      <csw name="Data.gov CSW" url="http://catalog.data.gov/csw-all"/>
      <csw name="Geonorge - National CSW service for Norway" url="http://www.geonorge.no/geonetwork/srv/eng/csw"/>
      <csw name="Geoportale Nazionale - Servizio di ricerca Italiano" url="http://www.pcn.minambiente.it/geoportal/csw"/>
      <csw name="LINZ Data Service" url="http://data.linz.govt.nz/feeds/csw"/>
      <csw name="Nationaal Georegister (Nederland)" url="http://www.nationaalgeoregister.nl/geonetwork/srv/eng/csw"/>
      <csw name="RNDT - Repertorio Nazionale dei Dati Territoriali - Servizio di ricerca" url="http://www.rndt.gov.it/RNDT/CSW"/>
      <csw name="UK Location Catalogue Publishing Service" url="http://csw.data.gov.uk/geonetwork/srv/en/csw"/>
      <csw name="UNEP/GRID-Geneva Metadata Catalog" url="http://metadata.grid.unep.ch:8080/geonetwork/srv/eng/csw"/>
  </qgsCSWConnections>


To load a list of entries, click the 'Load' button.  A new window will appear;
click the 'Browse' button and navigate to the XML file of entries you wish to
load and click 'Open'.  The list of entries will be displayed.  Select the
entries you wish to add from the list and click 'Load'.

The 'Service info' button displays information about the selected Catalogue
Service such as service identification, service provider and contact
information.  If you would like to view the raw XML response, click the
'GetCapabilities response' button.  A separate window will open displaying
Capabilities XML.

Searching Catalogue Services
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. image:: /static/user_manual/plugins/metasearch-search.png
  :scale: 80%
  :alt: Searching Catalogue Services
  :align: right

The 'Search' tab allows the user to query Catalogue Services for data and
services, set various search parameters and view results.

The following search parameters are available:

- **Keywords**: free text search keywords
- **From**: the Catalogue Service to perform the query against
- **Bounding box**: the spatial area of interest to filter on.  The default
  bounding box is the map view / canvas.  Click 'Set global' to do a global
  search, or enter custom values as desired
- **Records**: the number of records to return when searching.  Default is
  10 records

Clicking the 'Search' button will search the selected Metadata Catalogue.
Search results are displayed in a list and are sortable by clicking on the
column title.  You can navigate through search results with the directional
buttons below the search results.  Clicking the 'View search results as XML'
button opens a window with the service response in raw XML format.

Clicking a result will show the record's abstract in the 'Abstract' window and
provides the following options:

- if the metadata record has an associated bounding box, a footprint of the
  bounding box will be displayed on the map
- double-clicking the record displays the record metadata with any associated
  access links.  Clicking the links opens the link in the user's web browser
- if the record is an OGC web service (WMS/WMTS, WFS, WCS), the appropriate
  'Add to WMS/WMTS|WFS|WCS' buttons will be enabled for the user to add to QGIS.
  When clicking this button, MetaSearch will verify if this is a valid OWS.
  The OWS will then be added to the appropriate QGIS connection list, and the
  appropriate WMS/WMTS|WFS|WCS connection dialogue will then appear

.. image:: /static/user_manual/plugins/metasearch-record-metadata.png
  :scale: 60%
  :alt: Metadata Record Display
  :align: right

Settings
^^^^^^^^

You can fine tune MetaSearch with the following settings:

- **Connection naming**: when adding an OWS connection (WMS/WMTS|WFS|WCS), the connection is stored with the various QGIS layer provider. Use this setting to set whether to use the name provided from MetaSearch, whether to overwrite or to use a temporary name
- **Results paging**: when searching metadata catalogues, the number of results to show per page
- **Timeout**: when searching metadata catalogues, the number of seconds for blocking connection attempt.  Default value is 10

.. _`CSW (Catalogue Service for the Web)`: http://www.opengeospatial.org/standards/cat
.. _`OGC (Open Geospatial Consortium)`: http://www.opengeospatial.org
