.. only:: html

   |updatedisclaimer|

.. index:: Catalog services, Metadata
   single: Plugins; MetaSearch
.. _metasearch:

MetaSearch Catalog Client
=========================

.. only:: html

   .. contents::
      :local:


Introduction
------------

MetaSearch is a QGIS plugin to interact with metadata catalog services,
supporting the OGC Catalog Service for the Web (CSW) standard.

MetaSearch provides an easy and intuitive approach and user-friendly interface
to searching metadata catalogs within QGIS.

.. _figure_metasearch_results:

.. figure:: img/metasearch-splash.png
   :align: center

   Search and results of Services in MetaSearch

Installation
------------

MetaSearch is included by default with QGIS 2.0 and higher. All dependencies
are included within MetaSearch.

Install MetaSearch from the QGIS plugin manager, or manually from
https://plugins.qgis.org/plugins/MetaSearch.

Working with Metadata Catalogs in QGIS
--------------------------------------

CSW (Catalog Service for the Web)
...................................

`CSW (Catalog Service for the Web)`_ is an
`OGC (Open Geospatial Consortium)`_ specification that defines common
interfaces to discover, browse and query metadata about data, services,
and other potential resources.

Startup
.......

To start MetaSearch, click the |metasearch| icon or select :menuselection:`Web -->
MetaSearch --> MetaSearch` via the QGIS main menu. The MetaSearch dialog will
appear. The main GUI consists of three tabs: :guilabel:`Services`,
:guilabel:`Search` and :guilabel:`Settings`.

Managing Catalog Services
.........................

.. _figure_metasearch_catalog:

.. figure:: img/metasearch-services.png
   :align: center

   Managing Catalog Services

The :guilabel:`Services` tab allows the user to manage all available catalog
services. MetaSearch provides a default list of Catalog Services, which can
be added by pressing :guilabel:`Add Default Services` button.

To all listed Catalog Service entries, click the dropdown select box.

To add a Catalog Service entry, click the :guilabel:`New` button, and enter a
:guilabel:`Name` for the service, as well as the :guilabel:`URL` (endpoint).
Note that only the base URL is required (not a full GetCapabilities URL).
If the CSW requires authentication, enter the appropriate :guilabel:`User name`
and :guilabel:`Password` credentials. Clicking :guilabel:`OK` will add the service to
the list of entries.

To edit an existing Catalog Service entry, select the entry you would like to
edit and click the :guilabel:`Edit` button, and modify the :guilabel:`Name` or
:guilabel:`URL` values, then click :guilabel:`OK`.

To delete a Catalog Service entry, select the entry you would like to delete
and click the :guilabel:`Delete` button. You will be asked to confirm deleting the
entry.

MetaSearch allows for loading and saving connections to an XML file. This is
useful when you need to share settings between applications. Below is an
example of the XML file format.

.. code-block:: xml

  <?xml version="1.0" encoding="UTF-8"?>
  <qgsCSWConnections version="1.0">
      <csw name="Data.gov CSW" url="https://catalog.data.gov/csw-all"/>
      <csw name="Geonorge - National CSW service for Norway" url="https://www.geonorge.no/geonetwork/srv/eng/csw"/>
      <csw name="Geoportale Nazionale - Servizio di ricerca Italiano" url="http://www.pcn.minambiente.it/geoportal/csw"/>
      <csw name="LINZ Data Service" url="http://data.linz.govt.nz/feeds/csw"/>
      <csw name="Nationaal Georegister (Nederland)" url="http://www.nationaalgeoregister.nl/geonetwork/srv/eng/csw"/>
      <csw name="RNDT - Repertorio Nazionale dei Dati Territoriali - Servizio di ricerca" url="http://www.rndt.gov.it/RNDT/CSW"/>
      <csw name="UK Location Catalogue Publishing Service" url="http://csw.data.gov.uk/geonetwork/srv/en/csw"/>
      <csw name="UNEP/GRID-Geneva Metadata Catalog" url="http://metadata.grid.unep.ch:8080/geonetwork/srv/eng/csw"/>
  </qgsCSWConnections>


To load a list of entries, click the :guilabel:`Load` button. A new window will
appear; click the :guilabel:`Browse` button and navigate to the XML file of entries
you wish to load and click :guilabel:`Open`. The list of entries will be displayed.
Select the entries you wish to add from the list and click :guilabel:`Load`.

Click the :guilabel:`Service Info` button to displays information about the selected
Catalog Service such as service identification, service provider and contact
information. If you would like to view the raw XML response, click the
:guilabel:`GetCapabilities Response` button. A separate window will open displaying
Capabilities XML.

Searching Catalog Services
..........................

.. _figure_metasearch_search:

.. figure:: img/metasearch-search.png
   :align: center

   Searching catalog services

The :guilabel:`Search` tab allows the user to query Catalog Services for data
and services, set various search parameters and view results.

The following search parameters are available:

* :guilabel:`Keywords`: free text search keywords;
* :guilabel:`From`: the Catalog Service to perform the query against;
* **Bounding box**: the spatial area of interest to filter on defined by
  :guilabel:`Xmax`, :guilabel:`Xmin`, :guilabel:`Ymax`, and :guilabel:`Ymin`.
  Click :guilabel:`Set  Global` to do a  global search, click :guilabel:`Map Extent` to do a
  search on the visible area only or manually enter custom values as desired.

Clicking the :guilabel:`Search` button will search the selected Metadata Catalog.
Search results are displayed in a list and are sortable by clicking on the
column title. You can navigate through search results with the directional
buttons below the search results. Clicking the :guilabel:`View Search Results as XML`
button opens a window with the service response in raw XML format.

Clicking a result will provide the following options:

* if the metadata record has an associated bounding box, a footprint of the
  bounding box will be displayed on the map;
* double-clicking the record displays the record metadata with any associated
  access links. Clicking the links opens the link in the user's web browser;
* if the record is a supported web service (WMS/WMTS, WFS, WCS, ArcGIS MapServer,
  ArcGIS FeatureServer, etc.), the :guilabel:`Add Data` button will be enabled for the user to add to
  QGIS. When clicking this button, MetaSearch will verify if this is a valid
  OWS. The service will then be added to the appropriate QGIS connection list, and
  the appropriate connection dialog will then appear.

.. _figure_metasearch_metadata:

.. figure:: img/metasearch-record-metadata.png
  :align: center

  Metadata record display

Settings
........

.. _figure_metasearch_setting:

.. figure:: img/metasearch-settings.png
   :align: center

   MetaSearch settings

You can fine tune MetaSearch with the following :guilabel:`settings`:

* :guilabel:`Results paging`: when searching metadata catalogs, the number of
  results to show per page. Default value is 10;
* :guilabel:`Timeout`: when searching metadata catalogs, the number of
  seconds for blocking connection attempt. Default value is 10.

.. _`CSW (Catalog Service for the Web)`: https://www.opengeospatial.org/standards/cat
.. _`OGC (Open Geospatial Consortium)`: https://www.opengeospatial.org


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |metasearch| image:: /static/common/MetaSearch.png
   :width: 1.5em
.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
