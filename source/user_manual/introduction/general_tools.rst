.. `general_tools`:

**************
General Tools
**************

.. _`shortcuts`:

Keyboard shortcuts
==================

.. index::
   single:Keyboard shortcuts

QGIS provides default keyboard shortcuts for many features. You find them in
Section :ref:`label_menubar` below. Additionally the menu option 
:menuselection:`Settings -->` :menuselection:`Configure Shortcuts -->` allows to 
change the default keyboard shortcuts and to add new keyboard shortcuts to QGIS 
features.

.. _figure_shortcuts:

.. figure:: img/en/shortcuts.png 
   :align: center
   :width: 30em

   Define shortcut options |nix| (KDE)

Configuration is very simple. Just select a feature from the list and click
on **[Change]**, **[Set none]** or **[Set default]**. Once you 
have found your configuration, you can save it as XML file and load it to another
QGIS installation.

.. _`context_help`:

Context help
============

.. index::
   single:Context help

When you need help on a specific topic, you can access context help via the 
:guilabel:`Help` button available in most dialogs - please note that third-party 
plugins can point to dedicated web pages.

.. _`redraw_events`:

Rendering
==========
.. index::
   single:Rendering

By default, QGIS renders all visible layers whenever the map canvas must be
refreshed. The events that trigger a refresh of the map canvas include:

*  Adding a layer
*  Panning or zooming
*  Resizing the QGIS window
*  Changing the visibility of a layer or layers

QGIS allows you to control the rendering process in a number of ways.

.. `label_scaledepend`:

Scale Dependent Rendering
-------------------------
.. index::
   single:Rendering scale dependent

Scale dependent rendering allows you to specify the minimum and maximum
scales at which a layer will be visible.  To set scale dependency rendering,
open the :guilabel:`Properties` dialog by double-clicking on the layer in the
legend. On the :guilabel:`General` tab, set the minimum and maximum scale values and 
then click on the |checkbox|:guilabel:`Use scale dependent rendering` checkbox.

You can determine the scale values by first zooming to the level you want
to use and noting the scale value in the QGIS status bar.

.. index::
   single:Scale

.. _`label_controlmap`:

Controlling Map Rendering 
-------------------------

Map rendering can be controlled in the following ways:

.. _`label_suspendrender`:

**a) Suspending Rendering**

.. index::`rendering!suspending`

To suspend rendering, click the |checkbox| :guilabel:`Render` checkbox in the lower right
corner of the statusbar. When the |checkbox| :guilabel:`Render` checkbox is not checked, QGIS
does not redraw the canvas in response to any of the events described in
Section :ref:`redraw_events`. Examples of when you might want to suspend
rendering include:

* Add many layers and symbolize them prior to drawing
* Add one or more large layers and set scale dependency before drawing
* Add one or more large layers and zoom to a specific view before drawing
* Any combination of the above

Checking the |checkbox| :guilabel:`Render` checkbox enables rendering and causes an immediate
refresh of the map canvas.

.. _`label_settinglayer`:

**b) Setting Layer Add Option** 


.. index::`rendering!options`
.. index::`layers!initial visibility`

You can set an option to always load new layers without drawing them. This
means the layer will be added to the map, but its visibility checkbox in the
legend will be unchecked by default. To set this option, choose
menu option :menuselection:`Settings --> Options -->` and click on the
:guilabel:`Rendering` tab. Uncheck the |checkbox| :guilabel:`By default new layers 
added to the map should be displayed` checkbox. Any layer added to the map will 
be off (invisible) by default.

**Stopping Rendering**

.. index::
   single:Rendering halting

.. _label_stoprender:

To stop the map drawing, press the ESC key. This will halt the refresh of
the map canvas and leave the map partially drawn. It may take a bit of time
between pressing ESC and the time the map drawing is halted.
 
.. note::
   It is currently not possible to stop rendering - this was disabled 
   in qt4 port because of User Interface (UI) problems and crashes.

.. _`label_updatemap`:

**c) Updating the Map Display During Rendering**


.. index::
   single:rendering update during drawing

You can set an option to update the map display as features are drawn. By
default, QGIS does not display any features for a layer until the entire
layer has been rendered. To update the display as features are read from the
datastore, choose menu option :menuselection:`Settings --> Options -->`
click on the :guilabel:`Rendering` tab. Set the feature count to an
appropriate value to update the display during rendering. Setting a value of 0
disables update during drawing (this is the default). Setting a value too low
will result in poor performance as the map canvas is continually updated
during the reading of the features. A suggested value to start with is 500.

.. _`label_renderquality`:

**d) Influence Rendering Quality**


.. index::
   single:rendering quality

To influence the rendering quality of the map you have 3 options. Choose menu
option :menuselection:`Settings --> Options -->` click on the :guilabel:`Rendering` 
tab and select or deselect following checkboxes.


* |checkbox| :guilabel:`Make lines appear less jagged at the expense of some 
  drawing performance`
* |checkbox| :guilabel:`Fix problems with incorrectly filled polygons`

.. _`sec_measure`:

Measuring 
==========
.. index::
   single:measure

Measuring works within projected coordinate systems (e.g., UTM) and 
unprojected data. If the loaded map is defined with a geographic coordinate system
(latitude/longitude), the results from line or area measurements will be
incorrect. To fix this you need to set an appropriate map coordinate system
(See Section :ref:`label_projections`). All measuring modules also use the
snapping settings from the digitizing module. This is useful, if you want to
measure along lines or areas in vector layers.

To select a measure tool click on |mActionMeasure| and select the tool you want 
to use.

Measure length, areas and angles
---------------------------------

.. index::
   single:measure;line length
.. index::
   single:measure;areas
.. index::
   single:measure;angles

|mActionMeasure| QGIS is able to measure real distances between given points 
according to a defined ellipsoid. To configure this, choose menu option
:menuselection:`Settings --> Options -->`, click on the :guilabel:`Map tools` tab and 
choose the appropriate ellipsoid. There you can also define a rubberband color 
and your preferred measurement units (meters or feet) and angle units (degrees, 
radians and gon). The tools then allows you to click points on the map. Each 
segment-length as well as the total shows up in the measure-window. To stop 
measuring click your right mouse button. 

|mActionMeasureArea| Areas can also be measured.  In the measure window the 
accumulated area-size appears. In addition, the measuring tool will snap to the 
currently selected layer, provided that layer has its snapping tolerance set. 
(See Section :ref:`snapping_tolerance`).  So if you want to measure exactly along 
a line feature, or around a polygon feature, first set its snapping tolerance, 
then select the layer. Now, when using the measuring tools, each mouse click 
(within the tolerance setting) will snap to that layer. 

|mActionMeasureAngle| You can also measure angles, selecting Measure Angle tool. 
The cursor becomes cross-shaped. Click to draw the first segment of the angle you 
wish to measure, then move the the cursor to draw the desired angle. The measure
is displayed in a popup dialog.

.. _measure_in_action:

+------------------------+------------------------+
| |measure_line|         | |measure_angle|        |
+------------------------+------------------------+
| (a) Measure lines      | (b) Measure angles     |
+------------------------+------------------------+

+------------------------+
| |measure_area|         |
+------------------------+
| (c) Measure areas      |
+------------------------+

Measure tools in action


.. _`sec_selection`:

Select and deselect features 
-----------------------------


The QGIS toolbar provides several tools to select features in the map canvas. 
To select one or several features just click on 
|mActionSelect| and select your tool:

* |mActionSelect| :sup:`Select features`
* |mActionSelectRectangle| :sup:`Select features by rectangle`
* |mActionSelectPolygon| :sup:`Select features by polygon`
* |mActionSelectFreehand| :sup:`Select features by freehand`
* |mActionSelectRadius| :sup:`Select features by radius`

To deselect all selected features click on |mActionDeselectAll|.

.. index::
   single:projects

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

.. figure:: img/en/proxy-settings.png
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


.. _`sec_annotations`:

.. index::
   single: annotation

Annotation Tools 
================


The |mActionTextAnnotation| text annotation tools in the attribute t oolbar 
provides the possibility to place formatted text in a balloon on the QGIS map 
canvas. Use the text annotation tool and click into the map canvas.

.. _annotation:

.. figure:: img/en/annotation.png
   :align: center
   :width: 30em

   Annotation text dialog |nix| 

Double click on the item opens a dialog with various options. There is the
text editor to enter the formatted text and other item settings. E.g. there
is the choice of having the item placed on a map position (displayed by
a marker symbol) or to have the item on a screen position (not related
to the map). The item can be moved by map position (drag the map marker)
or by moving only the balloon. The icons are part of gis theme, and are used
by default in the other themes too.

The |mActionAnnotation| move annotation tool allows to move the annotation on the 
map canvas.

**Form annotations**

.. index::`annotations`
.. index::`form annotation|\see{annotations}`

Additionally you can also create your own annotation forms. The
|mActionFormAnnotation| form annotation tool is useful to display attributes of 
a vector layer in a customized qt designer form (see figure_custom_annotation_). It is similar to the
designer forms for the identify tool, but displayed in an annotation item.
Also see QGIS blog http://blog.qgis.org/node/143 for more information.

.. _figure_custom_annotation:

.. figure:: img/en/custom_annotation.png
   :align: center
   :width: 30em

   Customized qt designer annotation form |nix| 

.. note::
   If you press :kbd:`Ctrl+T` while an annotation tool is active 
   (move annotation, text annotation, form annotation), the visibility states 
   of the items are inverted.

.. _`sec_bookmarks`:

Spatial Bookmarks
==================

.. index::
   single:bookmarks
.. index::
   single:spatial bookmarks;see bookmarks

Spatial Bookmarks allow you to "bookmark" a geographic location and return to 
it later.

Creating a Bookmark
-------------------

To create a bookmark:

#. Zoom or pan to the area of interest.
#. Select the menu option :menuselection:`View --> New Bookmark -->` or press :kbd:`Ctrl-B`.
#. Enter a descriptive name for the bookmark (up to 255 characters).
#. Click **[OK]** to add the bookmark or **[Cancel]** to exit without adding the bookmark.



Note that you can have multiple bookmarks with the same name.

Working with Bookmarks
-----------------------

To use or manage bookmarks, select the menu option 
:menuselection:`View --> Show Bookmarks -->`. The 
:menuselection:`Geospatial Bookmarks` dialog allows you to zoom to or delete a 
bookmark. You can not edit the bookmark name or coordinates.

Zooming to a Bookmark
----------------------

From the :menuselection:`Geospatial Bookmarks` dialog, select the desired 
bookmark by clicking on it, then click **[Zoom To]**.
You can also zoom to a bookmark by double-clicking on it.

Deleting a Bookmark
-------------------

To delete a bookmark from the :guilabel:`Geospatial Bookmarks`
dialog, click on it then click **[Delete]**.
Confirm your choice by clicking **[Yes]** or cancel the
delete by clicking **[No]**.

.. _`sec_gpstracking`:

Live GPS tracking
==================


To activate Live GPS tracking in QGIS you need to select :menuselection:`View --> Live GPS tracking -->` . You will get a new docked Window on 
the left side of the canvas.

There are 4 possible screens in this GPS tracking window
(see table_figure_gps_tracking_ and Figure_gpstrack_options_).

* |mActionToggleEditing| GPS position coordinates and for manually entering 
  Vertices and Features.
* |gpstrack_barchart| GPS signal strength of satellite connections.
* |gpstrack_polarchart| GPS polar screen showing number and polar position of 
  satellites.
* |mActionOptions| GPS options screen (see Figure_gpstrack_options_).

With a plugged in GPS receiver (has to be supported by your operating system)
a simple click on **[Connect]** connects the GPS to QGIS. 
A second click (now **[Disconnect]**) disconnects the 
GPS-Receiver from your Computer. For GNU/Linux gpsd support is integrated to 
support connection to most GPS receivers. Therefore you first have to configure 
gpsd properly to connect QGIS to it.

.. warning::
   If you want to record your position to the canvas you have to
   create a new vector layer first and switch it to editable status to be able 
   to record your track.

.. _table_figure_gps_tracking:

Live GPS tracking |nix| 

+-------------------------------+-----------------------------+
| |gpstrack_main|                                             |
+-------------------------------+-----------------------------+
| (a) Position coordinates                                    | 
+-------------------------------+-----------------------------+
| |gpstrack_stren|              |    |gpstrack_polar|         | 
+-------------------------------+-----------------------------+
| (b) GPS signal_strength       | (c) GPS polar window        |
+-------------------------------+-----------------------------+

Position coordinates
---------------------

|mActionToggleEditing| If the GPS is
receiving signals from satellites you will see your position in latitude,
longitude and elevation as you can see in Figure table_figure_gps_tracking_.

GPS signal strength
--------------------

|gpstrack_barchart| Here you can see
the signal strenght of the satellites you are receiving signals from
table_figure_gps_tracking_.

GPS polar window
----------------

|gpstrack_polarchart| If you want
to know where in the sky all the connected satellites are, you have to
switch to the polar screen (see table_figure_gps_tracking_).
You can also see the ID numbers of the satellites you are receiving signals from.

GPS options
------------

|mActionOptions| In case of connection problems you can switch from 
|radiobuttonon| :menuselection:`Autodetect` to |radiobuttonon| 
:menuselection:`Use path/port below` and select the path/port your GPS receiver 
is connected to.  A click on **[Connect]** again initiates 
the connection to the GPS receiver.

With the slider :menuselection:`GPS Cursor Size` |slider| you can shrink and grow 
the position cursor on the canvas. Activating |radiobuttonon| 
:menuselection:`Auto-add vertices` within GPS digitizing your track will 
automatically be recorded in the active vector layer (of course the layer has to 
be in edit mode).

With GPS map recenter you can decide in which way the canvas will be
updated if your recorded coordinates start either to move out of canvas
or there is any change at all.

Track color and width sets the color of and the width of your drawn track.

If you want to set a feature manually you have to go back to
|mActionToggleEditing| "Position Coordinates"
and click on **[Add feature]**.

.. _Figure_gpstrack_options:

.. figure:: img/en/gpstrack_options.png
   :align: center
   :width: 15em

   GPS tracking options window |nix| 

----

.. [1] Keyboard shortcuts can now be configured manually
   (shortcuts presented in this section are the defaults), using the Configure
   Shortcuts tool under Settings Menu.
