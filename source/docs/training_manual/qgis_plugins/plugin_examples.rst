|LS| Useful QGIS Plugins
===============================================================================

Now that you can install, enable and disable plugins, let's see how this can 
help you in practice by looking at some examples of useful plugins. 

**The goal for this lesson:** To familiarize yourself with the plugin interface
and get acquainted with some useful plugins.

|basic| |FA| The Raster Terrain Analysis Plugin
-------------------------------------------------------------------------------

* Start a new map with only the :guilabel:`srtm_41_19.tif` raster dataset in it
  (look in :kbd:`exercise_data/raster/SRTM`).

From the lesson on raster analysis, you're already familiar with raster
analysis functions. You used GDAL tools (accessible via
:menuselection:`Raster --> Analysis`) for this. However, you should also know about
the Raster Terrain Analysis plugin. This ships standard with newer versions of
QGIS, and so you don't need to install it separately.

* Open the :guilabel:`Plugin Manager` and check that the Raster Terrain
  Analysis plugin is enabled:

  .. image:: img/raster_terrain_enabled.png
     :align: center

* Open the :menuselection:`Raster` menu. You should see a
  :menuselection:`Terrain analysis` submenu.
* Click on :menuselection:`Terrain analysis --> Relief` and input the following
  options:

  .. image:: img/terrain_analysis_dialog.png
     :align: center

* Save the new file under :kbd:`exercise_data/plugins/relief.tif` (create a new
  folder if necessary).
* Leave the :guilabel:`Output format` and :guilabel:`Z factor` unchanged.
* Make sure the :guilabel:`Add result to project` box is checked.
* Click the :guilabel:`Create automatically` button. The list below will be
  populated:

  .. image:: img/terrain_analysis_list.png
     :align: center

  These are the colors that the plugin will use to create the relief.

* If you like, you can change these colors by double-clicking on each row's
  color bar. For example:

  .. image:: img/color_changes.png
     :align: center

* Click :guilabel:`OK` and the relief will be created:

  .. image:: img/relief_created.png
     :align: center

This achieves a similar effect to when you used the semi-transparent hillshade
as an overlay over another raster layer. The advantage of this plugin is that
it creates this effect using only one layer.

|basic| |FA| The OpenLayers Plugin
-------------------------------------------------------------------------------

* Start a new map and add the :guilabel:`roads.shp` layer to it.
* Zoom in over the |majorUrbanName| area.
* Using the :guilabel:`Plugin Manager`, find a new plugin by entering the word
  :kbd:`OpenLayers` in the :guilabel:`Filter` field.
* Select the OpenLayers plugin from the filtered list:

  .. image:: img/select_openlayers.png
     :align: center

* Click the :guilabel:`Install plugin` button to install.
* When it's done, close the :guilabel:`Plugin Manager`.

Before using it, make sure that both your map and the plugin are configured
properly:

* Open the plugin's settings by clicking on :menuselection:`Web --> 
  OpenLayers plugin --> OpenLayers Overview`.
* Use the panel to choose a map type you want. In this example, we'll use the
  "Hybrid" type map, but you can choose any others if you want.

  .. image:: img/hybrid_map_selected.png
     :align: center

* Open the :guilabel:`Project Properties` Dialog by selecting 
  :guilabel:`Project --> Project Properties` from the menu.

* Enable "on the fly" projection and use the Google Mercator projection:

  .. image:: img/google_mercator_crs.png
     :align: center

* Now use the plugin to give you a Google map of the area. You can click on
  :menuselection:`Web --> OpenLayers Plugin --> Add Google Hybrid Layer` to
  add it: 

  .. image:: img/add_google_hybrid.png
     :align: center

This will load a new raster image in from Google that you can use as a
backdrop, or to help you find out where you are on the map. Here is such a
layer, with our own vector road layer as overlay:

.. image:: img/google_hybrid_result.png
   :align: center

.. note:: You may need to drag your roads layer above the Google layer to make
   it visible above the background layer. It may also be necessary to zoom to the
   extent of the roads layer to re-center the map.

|moderate| |FA| The GeoSearch Plugin
-------------------------------------------------------------------------------

* Start a new map with no datasets. 

* Open the :guilabel:`Plugin Manager` and filter for the GeoSearch Plugin 
  and click :guilabel:`Install Plugin` to install it.

  .. image:: img/find_geosearch_plugin.png
     :align: center

* Close the :guilabel:`Plugin Manager`.
* You can now use the GeoSearch plugin to search for placenames. Click on 
  :menuselection:`Plugins --> GeoSearch Plugin --> GeoSearch` to open the
  GeoSearch dialog.

  .. image:: img/geosearch_menu.png
     :align: center

* Search for |majorUrbanName| in the GeoSearch Dialog to locate it on your map:

  .. image:: img/city_search.png
     :align: center
 
|IC|
-------------------------------------------------------------------------------

There are many useful plugins available for QGIS. Using the built-in tools for
installing and managing these plugins, you can find new plugins and make
optimum use of them.

|WN|
-------------------------------------------------------------------------------

Next we'll look at how to use layers that are hosted on remote servers in real
time.

.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |FA| replace:: Follow Along:
.. |IC| replace:: In Conclusion
.. |LS| replace:: Lesson:
.. |WN| replace:: What's Next?
.. |basic| image:: /static/global/basic.png
.. |majorUrbanName| replace:: Swellendam
.. |moderate| image:: /static/global/moderate.png
