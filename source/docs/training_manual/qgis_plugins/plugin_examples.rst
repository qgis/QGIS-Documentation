|LS| Useful QGIS Plugins
===============================================================================

Now you can install, enable and disable plugins. Let's see how this can help
you in practice by looking at some examples of useful plugins. 

**The goal for this lesson:** To familiarize yourself with the plugin interface
and get acquainted with some useful plugins.

|basic| |FA| The Raster Terrain Analysis Plugin
-------------------------------------------------------------------------------

* Start a new map with only the :guilabel:`srtm_41_19.tif` raster dataset in it
  (look in :kbd:`exercise_data/raster/SRTM`).

From the lesson on raster analysis, you're already familiar with raster
analysis functions. You used GDAL tools (accessible via :guilabel:`Raster -->
Analysis`) for this. However, you should also know about the Raster Terrain
Analysis plugin. This ships standard with newer versions of QGIS, and so you
don't need to install it separately.

* Open the :guilabel:`Plugin Manager` and check that the Raster Terrain
  Analysis plugin is enabled:

  .. image:: ../_static/qgis_plugins/026.png
     :align: center

* Open the :menuselection:`Raster` menu. You should see a
  :menuselection:`Terrain analysis` submenu.
* Click on :menuselection:`Terrain analysis --> Relief` to open this dialog:

  .. image:: ../_static/qgis_plugins/027.png
     :align: center

* Save the new file under :kbd:`exercise_data/plugins/relief.tif` (create a new
  folder if necessary).
* Leave the :guilabel:`Output format` and :guilabel:`Z factor` unchanged.
* Check the box :guilabel:`Add result to project`.
* Click the :guilabel:`Create automatically` button. The list below will be
  populated:

  .. image:: ../_static/qgis_plugins/028.png
     :align: center

  These are the colors that the plugin will use to create the relief.
* If you like, you can change these colors now. For example:

  .. image:: ../_static/qgis_plugins/029.png
     :align: center

* Click :guilabel:`OK` and the relief will be created:

  .. image:: ../_static/qgis_plugins/030.png
     :align: center

This achieves a similar effect to when you used the semi-transparent hillshade
as an overlay over another raster layer. The advantage of this plugin is that
it creates this effect using only one layer.

|basic| |FA| The Google Layers Plugin
-------------------------------------------------------------------------------

* Start a new map with only the :guilabel:`streets` layer in it.
* Zoom in over the Swellendam area.
* Using the :guilabel:`Plugin Installer`, find the plugin by entering the word
  :kbd:`Google` in the :guilabel:`Filter` field.
* Select the Google Layers plugin from the filtered list:

  .. image:: ../_static/qgis_plugins/020.png
     :align: center

* Click the :guilabel:`Install plugin` button to install.
* When it's done, close the :guilabel:`Plugin Installer`.
* Open the :guilabel:`Plugin Manager`.
* Enable the new plugin:

  .. image:: ../_static/qgis_plugins/021.png
     :align: center

* Check the box beside it.
* Now click :guilabel:`OK` to enable the plugin.

Before using it, make sure that both your map and the plugin are configured
properly:

* Open the plugin's settings by clicking on :menuselection:`Plugins --> Google
  Layers --> Settings`.
* Use the dialog to choose a map type you want. In this example, we'll use the
  "Hybrid" type map, but you can choose any others if you want.
* Enable "on the fly" projection and use the Google Mercator projection:

  .. image:: ../_static/qgis_plugins/023.png
     :align: center

* Now use the plugin to give you a Google map of the area! You can click on
  :menuselection:`Plugins --> Google Layers --> Google Layers` to run it. Or,
  if you have the :guilabel:`Plugins` toolbar enabled, you can click on its
  icon:

  .. image:: ../_static/qgis_plugins/025.png
     :align: center

This will load a new raster image in from Google that you can use as a
backdrop, or to help you find out where you are on the map. Here is such a
layer, with our own vector road layer as overlay:

.. image:: ../_static/qgis_plugins/024.png
   :align: center

|moderate| |FA| The OpenStreetMap Plugin
-------------------------------------------------------------------------------

Since we're using OpenStreetMap (OSM) data in our examples, it would be
instructive to know where it comes from. QGIS has a plugin that allows you to
download and edit this kind of data easily.

* First, ensure that you have the plugin installed by opening the
  :guilabel:`Plugin Installer` and filtering on the word :kbd:`street`:

  .. image:: ../_static/qgis_plugins/006.png
     :align: center

* The :guilabel:`OpenStreetMap plugin` should be installed by default, but if
  it isn't, you can get it by clicking the :guilabel:`Install plugin` button.
* Once it's installed, activate it via the :guilabel:`Plugin Manager`.
* A new panel and new buttons will be added to your interface:

  .. image:: ../_static/qgis_plugins/007.png
     :align: center

Let's download data for Swellendam. The plugin will download data for the area
currently on your map.

* Zoom in to the Swellendam area.
* To add data, click on the :guilabel:`Download OSM data` button:

  .. image:: ../_static/qgis_plugins/008.png
     :align: center

.. note:: You may see a message stating that the latitude, longitude, or both
   extents are too large. This is because the OSM server doesn't have the
   capacity to continually give people data about the whole world. To prevent
   people trying to download too much data, there's a limit to the size of the
   area for which you can download data. If you get one of these error
   messages, zoom in to a smaller area on the map.

* If you have an acceptable area, you can leave the other options as default
  and click the :guilabel:`Download` button.
* After a while, the data will be downloaded, and will be shown in your map
  automatically. Here's an example:

  .. image:: ../_static/qgis_plugins/011.png
     :align: center

  (The labels are added from our local data for identification purposes.)

With any of the OSM layers selected in your :guilabel:`Layers list`, the
buttons in the plugin's dock panel will become active:

.. image:: ../_static/qgis_plugins/012.png
   :align: center

* Using the plugin's own :guilabel:`Identify feature` tool (at the far left of
  the above buttons), click on any feature in the OSM layers to retrieve its
  data and see it displayed in the plugin interface. For example, clicking on
  the river that runs through town gives you this:

  .. image:: ../_static/qgis_plugins/013.png
     :align: center

* You can create new features (point, lines, polygons) as well as edit a
  feature that you have identified. For example, using the plugin's
  :guilabel:`Identify feature` tool as before, you can click on this street:

  .. image:: ../_static/qgis_plugins/014.png
     :align: center

  Looking at its attributes, it doesn't have a name:

  .. image:: ../_static/qgis_plugins/015.png
     :align: center

* Double-click in the :guilabel:`<new tag here>` field.
* Select a new tag (attribute) from a list. Let's choose :guilabel:`name`:

  .. image:: ../_static/qgis_plugins/016.png
     :align: center

* Double-click in the :guilabel:`Value` field:

  .. image:: ../_static/qgis_plugins/017.png
     :align: center

You can save your changes to the original source data, too. This makes the
changes available internationally on the OSM server.

* Click the :guilabel:`Upload OSM data` button:

  .. image:: ../_static/qgis_plugins/018.png
     :align: center

  This gives you a dialog, which you can fill in as needed.
* If you have a user account at OSM, you can enter your credentials in the
  spaces provided and click the :guilabel:`Upload` button to save those
  changes.

Note that the plugin has many other functions: for example, you can also save
OSM layers to a local directory, load data from saved OSM layers, and export
OSM data as shapefiles.

OSM's data comes from, and is maintained by, the efforts of their users.
Contributing data using this plugin allows you to help improve the quality of
the OSM data you depend on.

|IC|
-------------------------------------------------------------------------------

There are many useful plugins available for QGIS. Using the built-in tools for
installing and managing these plugins, you can find new plugins and make
optimum use of them.

|WN|
-------------------------------------------------------------------------------

Next we'll look at how to use layers that are hosted on remote servers in real
time.
