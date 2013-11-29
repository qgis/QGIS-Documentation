|LS| GRASS Setup
===============================================================================

Using GRASS in QGIS requires you to think of the interface in a slightly
different way. Remember that you're not working in QGIS directly, but working
in GRASS *via* QGIS.

**The goal for this lesson:** To begin a GRASS project in QGIS.

|basic| |FA| Start a New GRASS Project
-------------------------------------------------------------------------------

To launch GRASS from within QGIS, you need to activate it as with any other
plugin.

* In the :guilabel:`Plugin Manager`, enable :guilabel:`GRASS` in the list:

  .. image:: ../_static/grass/001.png
     :align: center

The GRASS toolbar will appear:

.. image:: ../_static/grass/002.png
   :align: center

Before you can use GRASS, you need to create a **mapset**. GRASS always works
in a database environment, which means that you need to import all the
data you want to use into a GRASS database.

* Click on the :guilabel:`New mapset` button:

  .. image:: ../_static/grass/004.png
     :align: center

  You'll see a dialog explaining the structure of a GRASS mapset.
* Create a new directory called :kbd:`grass_db` in :guilabel:`exercise_data`.
* Set it as the directory that will be used by GRASS to set up its database:

  .. image:: ../_static/grass/005.png
     :align: center

GRASS needs to create a "location", which describes the maximum extents of the
geographic area you'll be working in.

* Call the new location :kbd:`South_Africa`:

  .. image:: ../_static/grass/006.png
     :align: center

* We'll be working with :kbd:`WGS 84`, so search for and select this CRS:

  .. image:: ../_static/grass/007.png
     :align: center

* Now select the region :guilabel:`South Africa`, which is already defined in
  GRASS:

  .. image:: ../_static/grass/008.png
     :align: center

* Create a mapset, which is the map file that you'll be working with.

  .. image:: ../_static/grass/009.png
     :align: center

Once you're done, you'll see a dialog asking you to confirm that the settings
it displays are correct.

* Click :guilabel:`Finish`.
* Click :guilabel:`OK` on the success dialog.

|basic| |FA| Loading Vector Data into GRASS
-------------------------------------------------------------------------------

You'll now have a blank map. To load data into GRASS, you need to follow a
two-step process.

* Load data into QGIS as usual. Use the :kbd:`streets.shp` dataset (found under
  :kbd:`exercise_data/`) for now.
* As soon as it's loaded, click on the :guilabel:`GRASS Tools` button:

  .. image:: ../_static/grass/013.png
     :align: center

* Find the vector import tool by entering the term :kbd:`v.in.ogr.qgis` in the
  :guilabel:`Filter` field of the dialog that has appeared.

The :kbd:`v` stands for "vector", :kbd:`in` means its a function to import data
into the GRASS database, :kbd:`ogr` is the software library used to read vector
data, and :kbd:`qgis` means that the tool will look for a vector from among the
vectors already loaded into QGIS.

* Once you've found this tool, click on it to bring up the tool itself:

  .. image:: ../_static/grass/014.png
     :align: center

* Set the loaded layer to :guilabel:`streets` and its GRASS version's name to
  :kbd:`g_streets` to prevent confusion.

  .. image:: ../_static/grass/015.png
     :align: center

.. note::  |hard| Note the extra import options provided under
   :guilabel:`Advanced Options`. These include the ability to add a WHERE
   clause for the SQL query used for importing the data.

* Click :guilabel:`Run` to begin the import.
* When it's done, click the :guilabel:`View output` button to see the newly
  imported GRASS layer in the map.
* Close first the import tool itself (click the :guilabel:`Close` button to the
  immediate right of :guilabel:`View output`), then close the :guilabel:`GDAL
  Tools` window.
* Remove the original :guilabel:`roads_33S` layer.

Now you are left with only the imported GRASS layer as displayed in your QGIS
map.

|basic| |FA| Loading Raster Data into GRASS
-------------------------------------------------------------------------------

Recall that our DEM is in the Projected CRS :kbd:`UTM 33S / WGS 84`, but our
GRASS project is in the Geographic CRS :kbd:`WGS 84`. So let's reproject the
DEM first.

* Load the :kbd:`srtm_41_19.tif` dataset (found under
  :kbd:`exercise_data/raster/SRTM/`) into the QGIS map as usual, using QGIS'
  :guilabel:`Add Raster Layer` tool.
* Reproject it using GDAL Warp tool (:menuselection:`Raster --> Projections -->
  Warp (Reproject)`), setting it up as shown:

  .. image:: ../_static/grass/017.png
     :align: center

* Save the raster under the same folder as the original, but with the file name
  :kbd:`DEM_WGS84.tif`. Once it appears in your map, remove the
  :kbd:`srtm_41_19.tif` dataset from your :guilabel:`Layers list`.

Now that it's reprojected, you can load it into your GRASS database.

* Open the :guilabel:`GRASS Tools` dialog again.
* Click on the :guilabel:`Modules List` tab.
* Search for :kbd:`r.in.gdal.qgis`:

  .. image:: ../_static/grass/016.png
     :align: center

  Which gives you this tool:

  .. image:: ../_static/grass/018.png
     :align: center

* Set it up as shown (input layer is :guilabel:`DEM_WGS84`, output is
  :kbd:`g_dem`).
* Click :guilabel:`Run`.
* When the process is done, click :guilabel:`View output`.
* :guilabel:`Close` the current tab, and then :guilabel:`Close` the whole
  dialog.

  .. image:: ../_static/grass/019.png
     :align: center

* You may now remove the original :guilabel:`DEM_WGS84` layer.

|IC|
-------------------------------------------------------------------------------

The GRASS workflow for ingesting data is somewhat different from the QGIS
method, because GRASS loads its data into a spatial database structure.
However, by using QGIS as a frontend, you can make the setup of a GRASS mapset
easier by using existing layers in QGIS as data sources for GRASS.

|WN|
-------------------------------------------------------------------------------

Now that the data is imported into GRASS, we can look at the advanced analysis
operations that GRASS offers.
