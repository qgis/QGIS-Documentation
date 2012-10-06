**Project Properties**


In the properties window for the project under |nix| :menuselection:`File -->
Project Properties` or |win| :menuselection:`Settings -->
Project Properties` you set project specific options. These
include:

* In the :guilabel:`General` tab the project title, selection and background
  color, layer units, precision, and the option to save relative paths to
  layers can be defined. You can define the layer units (only used when CRS 
  transformation is disabled) and the precision of decimal places to use.  
* The :guilabel:`CRS Coordinate Reference System` tab enables you to choose 
  the CRS for this project, and to enable on-the-fly re-projection of raster and 
  vector layers when displaying layers from a different CRS.
* With the third :guilabel:`Identifiable layers` tab you set (or disable) 
  which layers will respond to the identify tool. (See the Map tools paragraph from
  the :ref:`gui_options` section to enable identifying of multiple layers.)
* The tab :guilabel:`WMS Server` allows to define information about the QGIS 
  mapserver Service Capabilities, the Extent and the CRS Restrictions. Activating 
  the |checkbox| :guilabel:`Add WKT geometry to feature info response` will allow 
  to query the WMS layers.

.. _gui_options:

GUI Options 
=============


|mActionOptions| Some basic options for QGIS can be selected using the 
:guilabel:`Options` dialog. Select the menu option :menuselection:`Settings -->` 
|mActionOptions| :menuselection:`Options`. The tabs where you can optimize 
your options are:

**General Tab**


* |checkbox| :guilabel:`Prompt to save project changes when required`
* |checkbox| :guilabel:`Warn when opening a project file saved with an older version of QGIS`
* Change Selection and background Color
* Change the icon theme (choose between default, classic, gis and newgis)
* Change icon size between 16, 24 and 32 pixel.
* Define double click action in legend (choose between 'open layer properties' 
  and 'open ') attribute table.
* |checkbox| :guilabel:`Capitalize layer names in legend`
* |checkbox| :guilabel:`Display classification attribute names in legend`
* |checkbox| :guilabel:`Create raster icons in legend`
* |checkbox| :guilabel:`Hide splash screen at startup`
* |checkbox| :guilabel:`Open identify results in a dock window (QGIS restart
  required)`
* |checkbox| :guilabel:`Open snapping options in a dock window (QGIS restart
  required)`
* |checkbox| :guilabel:`Open attribute table in a dock window`
* |checkbox| :guilabel:`Add PostGIS layers with double click and select in extended mode`
* |checkbox| :guilabel:`Add new layers to selected group`
* Attribute table behavior (choose between Show all features (default), Show 
  selected features,
  show features in current canvas)
* Define representation for NULL values
* Add path(s) to search for additional C++ plugin libraries. 

**Rendering Tab**


* |checkbox| :guilabel:`By default new layers added to the map should be displayed`
* Define number of features to draw before updating the display.
* |checkbox| :guilabel:`Use render caching where possible to speed up redraws`
* |checkbox| :guilabel:`Make lines appear less jagged at the expense of some drawing
  performance`
* |checkbox| :guilabel:`Fix problems with incorrectly filled polygons`
* |checkbox| :guilabel:`Use new generation symbology for rendering`
* Add/remove path(s) to search for Scalable Vector Graphics (SVG) symbols


Additionally you can define whether to save the path for svg textures
absolute or relative in the :guilabel:`General` tab of the
:menuselection:`Settings --> Project Properties` menu.

**Map tools Tab**


* The Mode setting determines which layers will be shown by the Identify
  tool. By switching to ``Top down`` or ``Top down, stop at
  first`` instead of ``Current layer`` attributes for all identifiable
  layers (see the Project properties section under: :ref:`sec_projects` to set
  which layers are identifiable) will be shown with the Identify tool.
* |checkbox| :guilabel:`Open feature form, if a single feature is identified`
* Define search radius for identifying and displaying map tips as a
  percentage of the map width
* Define ellipsoid for distance calculations
* Define rubberband color for measure tools
* Define decimal places
* |checkbox| :guilabel:`Keep base unit`
* |radiobuttonon| :guilabel:`Define preferred measurement units (meters or feet)`
* |radiobuttonon| :guilabel:`Define preferred angle units (Degrees, Radians or Gon)`
* Define Mouse wheel action (Zoom, Zoom and recenter, Zoom to mouse
  cursor, Nothing)
* Define Zoom factor for wheel mouse


**Overlays Tab**


* Define placement algorithm for labels (choose between central point
  (standard), chain, popmusic tabu chain, popmusic tabu and popmusic chain)


**Digitizing Tab**


* Define Rubberband line color and line width
* Define default snap mode (to vertex, to segment, to vertex and segment)
* Define default snapping tolerance in map units or pixel
* Define search radius for vertex edits in map units or pixel
* |checkbox| :guilabel:`Show markers only for selected features`
* Define vertex marker style (cross (default), semi transparent circle or
  none) and vertex marker size.
* |checkbox| :guilabel:`Reuse last entered attribute values`
* |checkbox| :guilabel:`Suppress attributes pop-up windows after each created feature`


**CRS Tab**


The CRS tab is divided in two areas. The first area allows to define the default 
CRS for new projects.


* Select a CRS and always start new projects with this CRS.
* |checkbox| :guilabel:`Enable on the fly re-projection by default`

The second area allows to define the action, when a new layer is created, or when 
a layer without CRS is loaded.

* |radiobuttonoff| :guilabel:`Prompt for Coordinate Reference System (CRS)`
* |radiobuttonoff| :guilabel:`Project wide default Coordinate Reference System (CRS) will be used`
* |radiobuttonon| :guilabel:`Global default Coordinate Reference System (CRS) displayed below will be used`

**Locale Tab**

* |checkbox| :guilabel:`Overwrite system locale and use defined locale instead`
* Information about active system locale


**Network Tab**


.. _fig_proxy-settings:

.. figure:: ../../../static/user_manual/introduction/proxy-settings.png
   :align: center
   :width: 40em
   
   Proxy-settings in |qg|

* |checkbox| :guilabel:`Use proxy for web access` and define host, port, user, 
  and password.
* Set the :menuselection:`Proxy type -->` according to your needs.

  * :menuselection:`Default Proxy -->`: Proxy is determined based on the application 
     proxy set using
  * :menuselection:`Socks5Proxy -->`: Generic proxy for any kind of connection. 
     Supports TCP, UDP, binding to a port (incoming connections) and 
     authentication.
  * :menuselection:`HttpProxy -->`: Implemented using the "CONNECT" command, supports 
    only outgoing TCP connections; supports authentication.
  * :menuselection:`HttpCachingProxy -->`: Implemented using normal HTTP commands, it 
    is useful only in the context of HTTP requests
  * :menuselection:`FtpCachingProxy -->`: Implemented using an FTP proxy, it is 
    useful only in the context of FTP requests
 
* Define Cache settings (path and size)
* Define WMS search address, default is 
  ``http://geopole.org/wms/search?search=\%1\&type=rss``
* Define timeout for network requests in ms - default is 60000

Excluding some URLs can be added to the text box below the proxy-settings (see
Figure :ref:`fig_proxy-settings`) by pressing the **[Add]** button. After 
that double-click into the just created URL-field and enter the URL you would like
to exclude from using the proxy. Obviously the button **[Remove]** removes 
the selected entry.

If you need more detailed information about the different proxy-settings,
please refer to the manual of the underlying QT-library-documentation at
http://doc.trolltech.com/4.5/qnetworkproxy.html#ProxyType-enum.

.. tip::
   **Using Proxies**

   Using proxies can sometimes be tricky. It is useful to 'trial and
   error' the above proxy types and check if they succeed in your case.

You can modify the options according to your needs. Some of the changes may
require a restart of QGIS before they will be effective.

* |nix| settings are saved in a texfile: \$HOME/.config/QuantumGIS/qgis.conf
* |osx| you can find your settings in: 
  \$HOME/Library/Preferences/org.qgis.qgis.plist
* |win| settings are stored in the registry under:

::

   \\HKEY\CURRENT_USER\Software\QuantumGISqgis

