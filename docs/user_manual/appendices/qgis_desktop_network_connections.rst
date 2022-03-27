************************************************
Appendix E: QGIS Application Network Connections
************************************************

This is a list of the pre-configured/automated network connections that QGIS makes. 
Some of the connections are user initiated because they require an action
from the user before they take place, others happen automatically.


.. list-table::
   :header-rows: 1
   :widths: auto

   * - Name
     - Purpose
     - UX mode
     - Server
     - Information sent to server
     - Information stored on server
   * - **qgis.org**
     -
     -
     -
     -
     -
   * - New version check
     - Notify the user on new QGIS versions availability
     - Automatic
     - https://www.qgis.org
     - IP, QGIS version, OS
     - IP in server log
   * - Python API help
     - Browser PyQGIS documentation
     - User initiated
     - https://qgis.org/pyqgis/%1/search.html?q=%2
     - IP, QGIS version, OS
     - IP in server log
   * - **feed.qgis.org**
     -
     -
     -
     -
     -
   * - QGIS Feed
     - Retrieve QGIS news from the feed
     - Automatic
     - https://feed.qgis.org
     - IP, language code, last download timestamp, OS
     - IP in server log
   * - **plugins.qgis.org**
     -
     -
     -
     -
     -
   * - Check for plugin updates
     - Notify the user about plugin updates
     - User initiated/automatic (configurable)
     - https://plugins.qgis.org
     - IP, QGIS version, OS
     - IP in server log
   * - Plugins list
     - Retrieve the list of plugins
     - User initiated
     - https://plugins.qgis.org
     - IP, QGIS version, OS
     - IP in server log
   * - Plugin installation
     - Download and install a plugin package
     - User initiated
     - https://plugins.qgis.org
     - IP, QGIS version, OS
     - Increase plugin download counter by one
   * - Styles
     - List user contributed styles
     - User initiated
     - https://plugins.qgis.org/styles
     - IP, QGIS version, OS
     - Increase download counter by one
   * - **3rd party**
     -
     -
     -
     -
     -
   * - Terrain data
     - Produce a DEM for 3D views
     - User initiated
     - https://s3.amazonaws.com/elevation-tiles-prod/terrarium/{z}/{x}/{y}.png
     - IP, QGIS version, OS
     - see Amazon TOS
   * - Google Map Geocoder
     - Geocoding services
     - User initiated
     - https://maps.googleapis.com/maps/api/geocode/json
     - IP, QGIS version, OS
     - See google maps API TOS
   * - Nominatim Geocoder
     - Geocoding services
     - User initiated
     - https://nominatim.qgis.org/search
     - IP, QGIS version, OS
     -
   * - Geodetic grid
     - Add a new PROJ grid
     - User initiated
     - https://cdn.proj.org
     - IP, PROJ version
     - Access logs are permanently deleted after one day

