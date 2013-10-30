.. |updatedisclaimer|
.. _sec_grass:

*********************
GRASS GIS Integration
*********************

The :index:`GRASS` plugin provides access to GRASS GIS (see GRASS-PROJECT
:ref:`literature_and_web`) databases and functionalities. This includes
visualization of GRASS raster and vector layers, digitizing vector layers,
editing vector attributes, creating new vector layers and analysing GRASS 2D and
3D data with more than 400 GRASS modules.

In this Section we'll introduce the plugin functionalities and give some examples
on managing and working with GRASS data. Following main features are provided
with the toolbar menu, when you start the GRASS plugin, as described in section
:ref:`sec_starting_grass` :

* |grass_open_mapset| :sup:`Open mapset`
* |grass_new_mapset| :sup:`New mapset`
* |grass_close_mapset| :sup:`Close mapset`
* |grass_add_vector| :sup:`Add GRASS vector layer`
* |grass_add_raster| :sup:`Add GRASS raster layer`
* |grass_new_vector_layer| :sup:`Create new GRASS vector`
* |grass_edit| :sup:`Edit GRASS vector layer`
* |grass_tools| :sup:`Open GRASS tools`
* |grass_region| :sup:`Display current GRASS region`
* |grass_region_edit| :sup:`Edit current GRASS region`

.. _sec_starting_grass:
Starting the GRASS plugin
=========================

To use GRASS functionalities and/or visualize GRASS vector and raster layers in
QGIS, you must select and load the GRASS plugin with the Plugin Manager.
Therefore go to the menu :menuselection:`Plugins -->` |mActionShowPluginManager|
:menuselection:`Manage Plugins`, select |checkbox| :guilabel:`GRASS` and click
**[OK]**.

You can now start loading raster and vector layers from an existing GRASS
:file:`LOCATION` (see section :ref:`sec_load_grassdata`). Or you create a new
GRASS :file:`LOCATION` with QGIS (see section :ref:`sec_create_loc`) and import
some raster and vector data (see Section :ref:`sec_import_loc_data`) for further
analysis with the GRASS Toolbox (see section :ref:`subsec_grass_toolbox`).

.. _sec_load_grassdata:
Loading GRASS raster and vector layers
======================================

With the GRASS plugin, you can load vector or raster layers using the appropriate
button on the toolbar menu. As an example we use the QGIS alaska dataset (see
Section :ref:`label_sampledata`). It includes a small sample GRASS :file:`LOCATION`
with 3 vector layers and 1 raster elevation map.

#. Create a new folder :file:`grassdata`, download the QGIS 'Alaska' dataset
   :file:`qgis\_sample\_data.zip` from http://download.osgeo.org/qgis/data/
   and unzip the file into :file:`grassdata`.
#. Start QGIS.
#. If not already done in a previous QGIS session, load the GRASS plugin
   clicking on :menuselection:`Plugins -->` |mActionShowPluginManager|
   :menuselection:`Manage Plugins` and activate |checkbox| :guilabel:`GRASS`.
   The GRASS toolbar appears in the QGIS main window.
#. In the GRASS toolbar, click the |grass_open_mapset| :sup:`Open mapset` icon
   to bring up the :guilabel:`MAPSET` wizard.
#. For :file:`Gisdbase` browse and select or enter the path to the newly created
   folder :file:`grassdata`.
#. You should now be able to select the :guilabel:`LOCATION` |selectstring|
   :file:`alaska` and the :guilabel:`MAPSET` |selectstring| :file:`demo`.
#. Click **[OK]**. Notice that some previously disabled tools in the
   GRASS toolbar are now enabled.
#. Click on |grass_add_raster| :sup:`Add GRASS raster layer`, choose the map name
   :file:`gtopo30` and click **[OK]**. The elevation layer will be visualized.
#. Click on |grass_add_vector| :sup:`Add GRASS vector layer`, choose the map name
   :file:`alaska` and click **[OK]**. The Alaska boundary vector layer will be
   overlayed on top of the :file:`gtopo30` map. You can now adapt the layer
   properties as described in chapter :ref:`vector_properties_dialog`, e.g.
   change opacity, fill and outline color.
#. Also load the other two vector layers :file:`rivers` and :file:`airports` and
   adapt their properties.

As you see, it is very simple to load GRASS raster and vector layers in QGIS.
See following sections for editing GRASS data and creating a new :file:`LOCATION`.
More sample GRASS :file:`LOCATIONs` are available at the GRASS website at 
http://grass.osgeo.org/download/sample-data/.

.. tip:: **GRASS Data Loading**

   If you have problems loading data or QGIS terminates abnormally, check to make
   sure you have loaded the GRASS plugin properly as described in section
   :ref:`sec_starting_grass`.

.. _sec_about_loc:

GRASS LOCATION and MAPSET
=========================

GRASS data are stored in a directory referred to as GISDBASE. This directory often
called :file:`grassdata`, must be created before you start working with the GRASS
plugin in QGIS. Within this directory, the GRASS GIS data are organized by projects
stored in subdirectories called :file:`LOCATION`. Each :file:`LOCATION` is defined
by its coordinate system, map projection and geographical boundaries. Each
:file:`LOCATION` can have several :file:`MAPSETs` (subdirectories of the
:file:`LOCATION`) that are used to subdivide the project into different topics,
subregions, or as workspaces for individual team members (Neteler & Mitasova
2008 :ref:`literature_and_web`). In order to analyze vector and raster layers
with GRASS modules, you must import them into a GRASS :file:`LOCATION` (This is
not strictly true - with the GRASS modules :file:`r.external` and :file:`v.external`
you can create read-only links to external GDAL/OGR-supported data sets without
importing them. But because this is not the usual way for beginners to work with
GRASS, this functionality will not be described here.).

.. _figure_grass_location_1:

.. only:: html

   **Figure GRASS location 1:**

.. figure:: /static/user_manual/grass_integration/grass_location.png
   :align: center
   :width: 40em

   GRASS data in the alaska LOCATION


.. _sec_create_loc:

Creating a new GRASS LOCATION
-----------------------------

As an example here is how the sample GRASS :file:`LOCATION alaska`, which is
projected in Albers Equal Area projection with unit feet was created for the
QGIS sample dataset. This sample GRASS :file:`LOCATION alaska` will be used for
all examples and exercises in the following GRASS GIS related chapters. It is
useful to download and install the dataset on your computer :ref:`label_sampledata`).

#. Start QGIS and make sure the GRASS plugin is loaded.
#. Visualize the :file:`alaska.shp` shapefile (see Section
   :ref:`vector_load_shapefile`) from the QGIS alaska dataset :ref:`label_sampledata`.
#. In the GRASS toolbar, click on the |grass_new_mapset| :sup:`New mapset` icon
   to bring up the :guilabel:`MAPSET` wizard.
#. Select an existing GRASS database (GISDBASE) folder :file:`grassdata` or create
   one for the new :file:`LOCATION` using a file manager on your computer. Then
   click **[Next]**.
#. We can use this wizard to create a new :file:`MAPSET` within an existing
   :file:`LOCATION` (see section :ref:`sec_add_mapset`) or to create a new
   :file:`LOCATION` altogether. Select |radiobuttonon| :guilabel:`Create new
   location` (see figure_grass_location_2_).
#. Enter a name for the :file:`LOCATION` - we used 'alaska' and click **[Next]**.
#. Define the projection by clicking on the radio button |radiobuttonon|
   :guilabel:`Projection` to enable the projection list.
#. We are using Albers Equal Area Alaska (feet) projection. Since we happen to
   know that it is represented by the EPSG ID 2964, we enter it in the search box.
   (Note: If you want to repeat this process for another :file:`LOCATION` and
   projection and haven't memorized the EPSG ID, click on the |mIconProjectionEnabled|
   :sup:`CRS Status` icon in the lower right-hand corner of the status bar (see
   Section :ref:`label_projections`)).
#. In :guilabel:`Filter` insert 2964 to select the projection.
#. Click **[Next]**.
#. To define the default region, we have to enter the :file:`LOCATION` bounds in
   north, south, east, and west direction. Here we simply click on the button
   **[Set current QGIS extent]**, to apply the extend of the loaded layer
   :file:`alaska.shp` as the GRASS default region extend.
#. Click **[Next]**.
#. We also need to define a :file:`MAPSET` within our new :file:`LOCATION`. You
   can name it whatever you like - we used 'demo' (when creating a new
   :file:`LOCATION`). GRASS automatically creates a special :file:`MAPSET` called
   :file:`PERMANENT` designed to store the core data for the project, its default
   spatial extend and coordinate system definitions (Neteler & Mitasova 2008
   :ref:`literature_and_web`).
#. Check out the summary to make sure it's correct and click **[Finish]**.
#. The new :file:`LOCATION` 'alaska' and two :file:`MAPSETs` 'demo' and 'PERMANENT'
   are created. The currently opened working set is 'demo', as you defined.
#. Notice that some of the tools in the GRASS toolbar that were disabled are now
   enabled.


.. _figure_grass_location_2:

.. only:: html

   **Figure GRASS location 2:**

.. figure:: /static/user_manual/grass_integration/create_grass_location.png
   :align: center
   :width: 30em

   Creating a new GRASS LOCATION or a new MAPSET in |QG|

If that seemed like a lot of steps, it's really not all that bad and a very quick
way to create a :file:`LOCATION`. The :file:`LOCATION` 'alaska` is now ready for
data import (see section :ref:`sec_import_loc_data`). You can also use the already
existing vector and raster data in the sample GRASS :file:`LOCATION` 'alaska'
included in the QGIS 'Alaska' dataset :ref:`label_sampledata` and move on to
Section :ref:`label_vectmodel`.

.. _sec_add_mapset:

Adding a new MAPSET
-------------------

A user has only write access to a GRASS :file:`MAPSET` he created. This means that
besides access to his own :file:`MAPSET`, each user can read maps in other user's
:file:`MAPSETs`, but he can modify or remove only the maps in his own :file:`MAPSET`.

All :file:`MAPSETs` include a :file:`WIND` file that stores the current boundary
coordinate values and the currently selected raster resolution (Neteler & Mitasova
2008 :ref:`literature_and_web`, see Section :ref:`sec_grass_region`).

#. Start QGIS and make sure the GRASS plugin is loaded.
#. In the GRASS toolbar, click on the |grass_new_mapset| :sup:`New mapset` icon
   to bring up the :guilabel:`MAPSET` wizard.
#. Select the GRASS database (GISDBASE) folder :file:`grassdata` with the
   :file:`LOCATION` 'alaska', where we want to add a further :file:`MAPSET`,
   called 'test'.
#. Click **[Next]**.
#. We can use this wizard to create a new :file:`MAPSET` within an existing
   :file:`LOCATION` or to create a new :file:`LOCATION` altogether. Click on the
   radio button |radiobuttonon| :guilabel:`Select location`
   (see figure_grass_location_2_) and click **[Next]**.
#. Enter the name :file:`text` for the new :file:`MAPSET`. Below in the wizard you
   see a list of existing :file:`MAPSETs` and its owners.
#. Click **[Next]**, check out the summary to make sure it's all correct and
   click **[Finish]**.

.. _sec_import_loc_data:

Importing data into a GRASS LOCATION
====================================

This Section gives an example how to import raster and vector data into the
'alaska' GRASS :file:`LOCATION` provided by the QGIS 'Alaska' dataset.
Therefore we use a landcover raster map :file:`landcover.img` and a vector GML
file :file:`lakes.gml` from the QGIS 'Alaska' dataset :ref:`label_sampledata`.

#. Start QGIS and make sure the GRASS plugin is loaded.
#. In the GRASS toolbar, click the |grass_open_mapset| :sup:`Open MAPSET` icon
   to bring up the :guilabel:`MAPSET` wizard.
#. Select as GRASS database the folder :file:`grassdata` in the QGIS
   alaska dataset, as :file:`LOCATION` 'alaska', as :file:`MAPSET` 'demo' and
   click **[OK]**.
#. Now click the |grass_tools| :sup:`Open GRASS tools` icon. The
   GRASS Toolbox (see section :ref:`subsec_grass_toolbox`) dialog appears.
#. To import the raster map :file:`landcover.img`, click the module
   :file:`r.in.gdal` in the :guilabel:`Modules Tree` tab. This GRASS module
   allows to import GDAL supported raster files into a GRASS
   :file:`LOCATION`. The module dialog for :file:`r.in.gdal` appears.
#. Browse to the folder :file:`raster` in the QGIS 'Alaska' dataset
   and select the file :file:`landcover.img`.
#. As raster output name define :file:`landcover_grass` and click
   **[Run]**. In the :guilabel:`Output` tab you see the currently running GRASS
   command ``r.in.gdal -o input=/path/to/landcover.img
   output=landcover_grass``.
#. When it says **Succesfully finished** click **[View output]**.
   The :file:`landcover_grass` raster layer is now imported into GRASS and
   will be visualized in the QGIS canvas.
#. To import the vector GML file :file:`lakes.gml`, click the module
   :file:`v.in.ogr` in the :guilabel:`Modules Tree` tab. This GRASS module allows
   to import OGR supported vector files into a GRASS :file:`LOCATION`. The
   module dialog for :file:`v.in.ogr` appears.
#. Browse to the folder :file:`gml` in the QGIS 'Alaska' dataset and select the
   file :file:`lakes.gml` as OGR file.
#. As vector output name define :file:`lakes_grass` and click **[Run]**. You
   don't have to care about the other options in this example. In the
   :guilabel:`Output` tab you see the currently running GRASS command
   ``v.in.ogr -o dsn=/path/to/lakes.gml output=lakes\_grass``.
#. When it says **Succesfully finished** click **[View output]**. The
   :file:`lakes_grass` vector layer is now imported into GRASS and will be
   visualized in the QGIS canvas.

.. _label_vectmodel:

The GRASS vector data model
===========================

It is important to understand the :index:`GRASS vector data model` prior to digitizing.

In general, GRASS uses a topological vector model.

This means that areas are not represented as closed polygons, but by one or more
boundaries. A boundary between two adjacent areas is digitized only once, and it
is shared by both areas. Boundaries must be connected and closed without gaps.
An area is identified (and labeled) by the **centroid** of the area.

Besides boundaries and centroids, a vector map can also contain points and lines.
All these geometry elements can be mixed in one vector and will be represented
in different so called 'layers' inside one GRASS vector map. So in GRASS a layer
is not a vector or raster map but a level inside a vector layer. This is important
to distinguish carefully (Although it is possible to mix geometry elements, it
is unusual and even in GRASS only used in special cases such as vector network
analysis. Normally you should prefere to store different geometry elements in
different layers.).

It is possible to store several 'layers' in one vector dataset. For example,
fields, forests and lakes can be stored in one vector. Adjacent forest and lake
can share the same boundary, but they have separate attribute tables. It is also
possible to attach attributes to boundaries. For example, the boundary between
lake and forest is a road, so it can have a different attribute table.

The 'layer' of the feature is defined by 'layer' inside GRASS. 'Layer' is the
number which defines if there are more than one layer inside the dataset, e.g.
if the geometry is forest or lake. For now, it can be only a number, in the future
GRASS will also support names as fields in the user interface.

Attributes can be stored inside the GRASS :file:`LOCATION` as DBase or SQLITE3 or
in external database tables, for example PostgreSQL, MySQL, Oracle, etc.

.. index::
   single:GRASS;attribute storage

Attributes in database tables are linked to geometry elements using a 'category'
value.

.. index::
   single:GRASS;attribute linkage

'Category' (key, ID) is an integer attached to geometry primitives, and it is
used as the link to one key column in the database table.

.. tip:: **Learning the GRASS Vector Model**

   The best way to learn the GRASS vector model and its capabilities is to
   download one of the many GRASS tutorials where the vector model is described
   more deeply. See http://grass.osgeo.org/documentation/manuals/ for more information,
   books and tutorials in several languages.

.. index::
      see:GRASS;Creating new vectors;editing;creating a new layer

.. _creating_new_grass_vectors:

Creating a new GRASS vector layer
=================================

To create a new GRASS vector layer with the GRASS plugin click the
|grass_new_vector_layer| :sup:`Create new GRASS vector` toolbar icon.
Enter a name in the text box and you can start digitizing point, line or polygon
geometries, following the procedure described in Section :ref:`grass_digitizing`.

In GRASS it is possible to organize all sort of geometry types (point, line and
area) in one layer, because GRASS uses a topological vector model, so you don't
need to select the geometry type when creating a new GRASS vector. This is
different from Shapefile creation with QGIS, because Shapefiles use the Simple
Feature vector model (see Section :ref:`sec_create_vector`).

.. tip:: **Creating an attribute table for a new GRASS vector layer**

   If you want to assign attributes to your digitized geometry features, make
   sure to create an attribute table with columns before you start digitizing
   (see figure_grass_digitizing_5_).

.. _grass_digitizing:

Digitizing and editing a GRASS vector layer
===========================================

.. index::
   single:GRASS;digitizing tools

The digitizing tools for GRASS vector layers are accessed using the
|grass_edit| :sup:`Edit GRASS vector layer` icon on the toolbar. Make sure you
have loaded a GRASS vector and it is the selected layer in the legend before
clicking on the edit tool. Figure figure_grass_digitizing_2_ shows the GRASS
edit dialog that is displayed when you click on the edit tool. The tools and
settings are discussed in the following sections.

.. tip:: **Digitizing polygons in GRASS**

   If you want to create a polygon in GRASS, you first digitize the boundary of
   the polygon, setting the mode to 'No category'. Then you add a centroid
   (label point) into the closed boundary, setting the mode to 'Next not used'.
   The reason is, that a topological vector model links attribute information of
   a polygon always to the centroid and not to the boundary.

.. _label_grasstoolbar:

**Toolbar**

In figure_grass_digitizing_1_ you see the GRASS digitizing toolbar icons provided
by the GRASS plugin. Table table_grass_digitizing_1_ explains the available
functionalities.

.. _figure_grass_digitizing_1:

.. only:: html

   **Figure GRASS digitizing 1:**

.. figure:: /static/user_manual/grass_integration/grass_digitizing_toolbar.png
   :align: center
   :width: 30em

   GRASS Digitizing Toolbar

.. _table_grass_digitizing_1:

+------------------------+-----------------+---------------------------------------------------------------------------------------------------+
| Icon                   | Tool            | Purpose                                                                                           |
+========================+=================+===================================================================================================+
| |grass_new_point|      | New Point       | Digitize new point                                                                                |
+------------------------+-----------------+---------------------------------------------------------------------------------------------------+
| |grass_new_line|       | New Line        | Digitize new line                                                                                 |
+------------------------+-----------------+---------------------------------------------------------------------------------------------------+
| |grass_new_boundary|   | New Boundary    | Digitize new boundary (finish by selecting new tool)                                              |
+------------------------+-----------------+---------------------------------------------------------------------------------------------------+
| |grass_new_centroid|   | New Centroid    | Digitize new centroid (label existing area)                                                       |
+------------------------+-----------------+---------------------------------------------------------------------------------------------------+
| |grass_move_vertex|    | Move vertex     | Move one vertex of existing line or boundary and identify new position                            |
+------------------------+-----------------+---------------------------------------------------------------------------------------------------+
| |grass_add_vertex|     | Add vertex      | Add a new vertex to existing line                                                                 |
+------------------------+-----------------+---------------------------------------------------------------------------------------------------+
| |grass_delete_vertex|  | Delete vertex   | Delete vertex from existing line (confirm selected vertex by another click)                       |
+------------------------+-----------------+---------------------------------------------------------------------------------------------------+
| |grass_move_line|      | Move element    | Move selected boundary, line, point or centroid and click on new position                         |
+------------------------+-----------------+---------------------------------------------------------------------------------------------------+
| |grass_split_line|     | Split line      | Split an existing line to 2 parts                                                                 |
+------------------------+-----------------+---------------------------------------------------------------------------------------------------+
| |grass_delete_line|    | Delete element  | Delete existing boundary, line, point or centroid (confirm selected element by another click)     |
+------------------------+-----------------+---------------------------------------------------------------------------------------------------+
| |grass_edit_attributes|| Edit attributes | Edit attributes of selected element (note that one element can represent more features, see above)|
+------------------------+-----------------+---------------------------------------------------------------------------------------------------+
| |grass_close_edit|     | Close           | Close session and save current status (rebuilds topology afterwards)                              |
+------------------------+-----------------+---------------------------------------------------------------------------------------------------+

Table GRASS Digitizing 1: GRASS Digitizing Tools


**Category Tab**

.. index::
   single:GRASS;category settings

The :guilabel:`Category` tab allows you to define the way in which the category
values will be assigned to a new geometry element.

.. _figure_grass_digitizing_2:

.. only:: html

   **Figure GRASS digitizing 2:**

.. figure:: /static/user_manual/grass_integration/grass_digitizing_category.png
   :align: center
   :width: 30em

   GRASS Digitizing Category Tab

* **Mode**: what category value shall be applied to new geometry elements.

  -  Next not used - apply next not yet used category value to geometry element.
  -  Manual entry - manually define the category value for the geometry element
     in the 'Category'-entry field.
  -  No category - Do not apply a category value to the geometry element. This is
     e.g. used for area boundaries, because the category values are connected via
     the centroid.

* **Category** - A number (ID) is attached to each digitized geometry element.
  It is used to connect each geometry element with its attributes.
* **Field (layer)** - Each geometry element can be connected with several
  attribute tables using different GRASS geometry layers. Default layer number
  is 1.

.. tip:: **Creating an additional GRASS 'layer' with QGIS**

   If you would like to add more layers to your dataset, just add a new number
   in the 'Field (layer)' entry box and press return. In the Table tab you can
   create your new table connected to your new layer.

.. _label_settingtab:

**Settings Tab**

.. index::
   single:GRASS;snapping tolerance

The :guilabel:`Settings` tab allows you to set the snapping in screen pixels.
The threshold defines at what distance new points or line ends are snapped to
existing nodes. This helps to prevent gaps or dangles between boundaries. The
default is set to 10 pixels.

.. _figure_grass_digitizing_3:

.. only:: html

   **Figure GRASS digitizing 3:**

.. figure:: /static/user_manual/grass_integration/grass_digitizing_settings.png
   :align: center
   :width: 30em

   GRASS Digitizing Settings Tab

**Symbology Tab**

.. index::
   single:GRASS;symbology settings

The :guilabel:`Symbology` tab allows you to view and set symbology and color
settings for various geometry types and their topological status (e.g. closed
/ opened boundary).

.. _figure_grass_digitizing_4:

.. only:: html

   **Figure GRASS digitizing 4:**

.. figure:: /static/user_manual/grass_integration/grass_digitizing_symbology.png
   :align: center
   :width: 30em

   GRASS Digitizing Symbolog Tab


**Table Tab**

.. index::
   single:GRASS;table editing

The :guilabel:`Table` tab provides information about the database table for a
given 'layer'. Here you can add new columns to an existing attribute table, or
create a new database table for a new GRASS vector layer (see Section
:ref:`creating_new_grass_vectors`).

.. _figure_grass_digitizing_5:

.. only:: html

   **Figure GRASS digitizing 5:**

.. figure:: /static/user_manual/grass_integration/grass_digitizing_table.png
   :align: center
   :width: 30em

   GRASS Digitizing Table Tab

.. tip:: **GRASS Edit Permissions**

   You must be the owner of the GRASS :file:`MAPSET` you want to edit. It is
   impossible to edit data layers in a :file:`MAPSET` that is not yours, even
   if you have write permissions.


.. _sec_grass_region:

The GRASS region tool
=====================
.. index::
   single:GRASS;region

The region definition (setting a spatial working window) in GRASS is important
for working with raster layers. Vector analysis is by default not limited to any
defined region definitions. But all newly-created rasters will have the spatial
extension and resolution of the currently defined GRASS region, regardless of
their original extension and resolution. The current GRASS region is stored in
the :file:`$LOCATION/$MAPSET/WIND` file, and it defines north, south, east and
west bounds, number of columns and rows, horizontal and vertical spatial resolution.

It is possible to switch on/off the visualization of the GRASS region in the QGIS
canvas using the |grass_region| :sup:`Display current GRASS region` button.

.. index::
   single:GRASS;region display

With the |grass_region_edit| :sup:`Edit current GRASS region` icon you can open
a dialog to change the current region and the symbology of the GRASS region
rectangle in the QGIS canvas. Type in the new region bounds and resolution and
click **[OK]**. It also allows to select a new region interactively with your
mouse on the QGIS canvas. Therefore click with the left mouse button in the QGIS
canvas, open a rectangle, close it using the left mouse button again and click
**[OK]**.

.. index::
   single:GRASS;region editing

The GRASS module :file:`g.region` provide a lot more parameters to define an
appropriate region extend and resolution for your raster analysis. You can use
these parameters with the GRASS Toolbox, described in Section :ref:`subsec_grass_toolbox`.

.. _subsec_grass_toolbox:

The GRASS toolbox
=================
.. index::
   single:GRASS toolbox

The |grass_tools| :sup:`Open GRASS Tools` box provides GRASS module functionalities
to work with data inside a selected GRASS :file:`LOCATION` and :file:`MAPSET`.
To use the GRASS toolbox you need to open a :file:`LOCATION` and :file:`MAPSET`
where you have write-permission (usually granted, if you created the :file:`MAPSET`).
This is necessary, because new raster or vector layers created during analysis
need to be written to the currently selected :file:`LOCATION` and :file:`MAPSET`.

.. _figure_grass_toolbox_1:

.. only:: html

   **Figure GRASS toolbox 1:**

.. figure:: /static/user_manual/grass_integration/grass_toolbox_moduletree.png
   :align: center
   :width: 30em

   GRASS Toolbox and Module Tree |nix|

The GRASS Shell inside the GRASS Toolbox provides access to almost all (more than
330) GRASS modules through a command line interface. To offer a more user friendly
working environment, about 200 of the available GRASS modules and functionalities
are also provided by graphical dialogs within the GRASS plugin Toolbox.

.. _grass_modules:

Working with GRASS modules
---------------------------

The GRASS Shell inside the GRASS Toolbox provides access to almost all (more than
300) GRASS modules in a command line interface. To offer a more user friendly
working environment, about 200 of the available GRASS modules and functionalities
are also provided by graphical dialogs.

A complete list of GRASS modules available in the graphical Toolbox in QGIS
version |CURRENT| is available in the GRASS wiki (http://grass.osgeo.org/wiki/GRASS-QGIS_relevant_module_list).

It is also possible to customize the GRASS Toolbox content. This procedure is
described in Section :ref:`sec_toolbox-customizing`.

As shown in figure_grass_toolbox_1_ , you can look for the appropriate GRASS
module using the thematically grouped :guilabel:`Modules Tree` or the searchable
:guilabel:`Modules List` tab.

Clicking on a graphical module icon a new tab will be added to the toolbox dialog
providing three new sub-tabs :guilabel:`Options`, :guilabel:`Output` and
:guilabel:`Manual`.

**Options**

The :guilabel:`Options` tab provides a simplified module dialog where you can
usually select a raster or vector layer visualized in the QGIS canvas and enter
further module specific parameters to run the module.

.. _figure_grass_module_1:

.. only:: html

   **Figure GRASS module 1:**

.. figure:: /static/user_manual/grass_integration/grass_module_option.png
   :align: center
   :width: 30em

   GRASS Toolbox Module Options |nix|


The provided module parameters are often not complete to keep the dialog clear.
If you want to use further module parameters and flags, you need to start the
GRASS Shell and run the module in the command line.

A new feature since QGIS 1.8 is the support for a :guilabel:`show advanced options`
button below the simplified module dialog in the :guilabel:`Options` tab. At the
moment it is only added to the module v.in.ascii as an example use, but will
probably be part of more / all modules in the GRASS toolbox in future versions
of QGIS. This allows to use the complete GRASS module options without the need
to switch to the GRASS Shell.

**Output**

.. _figure_grass_module_2:

.. only:: html

   **Figure GRASS module 2:**

.. figure:: /static/user_manual/grass_integration/grass_module_output.png
   :align: center
   :width: 30em

   GRASS Toolbox Module Output |nix|

The :guilabel:`Output` tab provides information about the output status of the
module. When you click the **[Run]** button, the module switches to the
:guilabel:`Output` tab and you see information about the analysis process. If
all works well, you will finally see a ``Successfully finished`` message.

**Manual**

.. _figure_grass_module_3:

.. only:: html

   **Figure GRASS module 3:**

.. figure:: /static/user_manual/grass_integration/grass_module_manual.png
   :align: center
   :width: 30em

   GRASS Toolbox Module Manual |nix|

The :guilabel:`Manual` tab shows the HTML help page of the GRASS module. You can
use it to check further module parameters and flags or to get a deeper knowledge
about the purpose of the module. At the end of each module manual page you see
further links to the :file:`Main Help index`, the :file:`Thematic index` and the
:file:`Full index`. These links provide the same information as if you use the
module :file:`g.manual`.

.. index::
   single:GRASS;display results

.. tip:: **Display results immediately**

   If you want to display your calculation results immediately in your map canvas,
   you can use the 'View Output' button at the bottom of the module tab.

GRASS module examples
---------------------

The following examples will demonstrate the power of some of the GRASS modules.

Creating contour lines
......................

The first example creates a vector contour map from an elevation raster (DEM).
Assuming you have the Alaska :file:`LOCATION` set up as explained in Section
:ref:`sec_import_loc_data`.

* First open the location by clicking the
  |grass_open_mapset| :sup:`Open mapset` button and choosing the Alaska location.
* Now load the ``gtopo30`` elevation raster by clicking
  |grass_add_raster| :sup:`Add GRASS raster layer` and selecting the
  ``gtopo30`` raster from the demo location.
* Now open the Toolbox with the |grass_tools| :sup:`Open GRASS tools` button.
* In the list of tool categories double click :menuselection:`Raster --> Surface
  Management --> Generate vector contour lines`.
* Now a single click on the tool **r.contour** will open the tool dialog as
  explained above :ref:`grass_modules`. The ``gtopo30`` raster should appear as
  the :guilabel:`Name of input raster`.
* Type into the :guilabel:`Increment between Contour levels` |selectnumber|
  the value 100. (This will create contour lines at intervals of 100 meters.)
* Type into the :guilabel:`Name for output vector map` the name ``ctour_100``.
* Click **[Run]** to start the process. Wait for several moments until the message
  ``Successfully finished`` appears in the output window. Then click **[View Output]**
  and **[Close]**.

Since this is a large region, it will take a while to display. After it finishes
rendering, you can open the layer properties window to change the line color so
that the contours appear clearly over the elevation raster, as in :ref:`vector_properties_dialog`.

Next zoom in to a small mountainous area in the center of Alaska. Zooming in close
you will notice that the contours have sharp corners. GRASS offers the **v.generalize**
tool to slightly alter vector maps while keeping their overall shape. The tool
uses several different algorithms with different purposes. Some of the algorithms
(i.e. Douglas Peuker and Vertex reduction) simplify the line by removing some of
the vertices. The resulting vector will load faster. This process will be used
when you have a highly detailed vector, but you are creating a very small scale
map, so the detail is unnecessary.

.. index::
   single:GRASS;display results

.. tip:: **The simplify tool**

   Note that the QGIS fTools plugin has a :menuselection:`Simplify geometries -->`
   tool that works just like the GRASS **v.generalize** Douglas-Peuker algorithm.

However, the purpose of this example is different. The contour lines created by
``r.contour`` have sharp angles that should be smoothed. Among the **v.generalize**
algorithms there is Chaikens which does just that (also Hermite splines). Be
aware that these algorithms can **add** additional vertices to the vector,
causing it to load even more slowly.

* Open the GRASS toolbox and double click the categories :menuselection:`Vector -->
  Develop map --> Generalization`, then click on the **v.generalize** module to
  open its options window.
* Check that the 'ctour_100' vector appears as the :guilabel:`Name of input vector`.
* From the list of algorithms choose Chaiken's. Leave all other options at their
  default, and scroll down to the last row to enter in the field :guilabel:`Name
  for output vector map` 'ctour_100_smooth', and click **[Run]**.
* The process takes several moments. Once ``Successfully finished`` appears in
  the output windows, click **[View output]** and then **[close]**.
* You may change the color of the vector to display it clearly on the raster
  background and to contrast with the original contour lines. You will notice
  that the new contour lines have smoother corners than the original while staying
  faithful to the original overall shape.

.. _figure_grass_module_4:

.. only:: html

   **Figure GRASS module 4:**

.. figure:: /static/user_manual/grass_integration/grass_toolbox_vgeneralize.png
   :align: center
   :width: 30em

   GRASS module v.generalize to smooth a vector map |nix|

.. index::
   single:GRASS;toolbox
.. tip:: **Other uses for r.contour**

   The procedure described above can be used in other equivalent situations. If
   you have a raster map of precipitation data, for example, then the same method
   will  be used to create a vector map of isohyetal (constant rainfall) lines.

Creating a Hillshade 3D effect
..............................

Several methods are used to display elevation layers and give a 3D effect to maps.
The use of contour lines as shown above is one popular method often chosen to
produce topographic maps. Another way to display a 3D effect is by hillshading.
The hillshade effect is created from a DEM (elevation) raster by first calculating
the slope and aspect of each cell, then simulating the sun's position in the sky
and giving a reflectance value to each cell. Thus you get sun facing slopes
lighted and the slopes facing away from the sun (in shadow) are darkened.

* Begin this example by loading the ``gtopo30`` elevation raster. Start the GRASS
  toolbox and under the Raster category double click to open :menuselection:`Spatial analysis
  --> Terrain analysis`.
* Then click **r.shaded.relief** to open the module.
* Change the :guilabel:`azimuth angle` |selectnumber| 270 to 315.
* Enter ``gtopo30_shade`` for the new hillshade raster, and click **[Run**].
* When the process completes, add the hillshade raster to the map. You should see
  it displayed in grayscale.
* To view both the hill shading and the colors of the ``gtopo30`` together shift
  the hillshade map below the ``gtopo30`` map in the table of contents, then open
  the :menuselection:`Properties` window of ``gtopo30``, switch to the
  :guilabel:`transparency` tab and set its transparency level to about 25%.

You should now have the ``gtopo30`` elevation with its colormap and transparency
setting displayed **above** the grayscale hillshade map. In order to see the
visual effects of the hillshading, turn off the ``gtopo30_shade`` map, then turn
it back on.

**Using the GRASS shell**

The GRASS plugin in QGIS is designed for users who are new to GRASS, and not
familiar with all the modules and options. As such, some modules in the toolbox
do not show all the options available, and some modules do not appear at all.
The GRASS shell (or console) gives the user access to those additional GRASS
modules that do not appear in the toolbox tree, and also to some additional
options to the modules that are in the toolbox with the simplest default
parameters. This example demonstrates the use of an additional option in the
**r.shaded.relief** module that was shown above.

.. figure_grass_module_5:

.. only:: html

   **Figure GRASS module 5:**

.. figure:: /static/user_manual/grass_integration/grass_toolbox_shell.png
   :align: center
   :width: 30em

   The GRASS shell, r.shaded.relief module |nix|

The module **r.shaded.relief** can take a parameter ``zmult`` which multiplies
the elevation values relative to the X-Y coordinate units so that the hillshade
effect is even more pronounced.

* Load the ``gtopo30`` elevation raster as above, then start the GRASS toolbox
  and click on the GRASS shell. In the shell window type the command
  ``r.shaded.relief map=gtopo30 shade=gtopo30_shade2 azimuth=315 zmult=3`` and
  press **[Enter]**.
* After the process finishes shift to the :guilabel:`Browse` tab and double click
  on the new ``gtopo30_shade2`` raster to display in QGIS.
* As explained above, shift the shaded relief raster below the gtopo30 raster in
  the Table of Contents, then check transparency of the colored gtopo30 layer.
  You should see that the 3D effect stands out more strongly compared to the
  first shaded relief map.

.. figure_grass_module_6:

.. only:: html

   **Figure GRASS module 6:**

.. figure:: /static/user_manual/grass_integration/grass_toolbox_shadedrelief.png
   :align: center
   :width: 30em

   Displaying shaded relief created with the GRASS module r.shaded.relief |nix|


Raster statistics in a vector map
..................................

The next example shows how a GRASS module can aggregate raster data and add columns
of statistics for each polygon in a vector map.

* Again using the Alaska data, refer to :ref:`sec_import_loc_data` to import the
  trees shapefile from the ``shapefiles`` directory into GRASS.
* Now an intermediary step is required: centroids must be added to the imported
  trees map to make it a complete GRASS area vector (including both boundaries
  and centroids).
* From the toolbox choose :menuselection:`Vector --> Manage features`, and open
  the module **v.centroids**.
* Enter as the :guilabel:`output vector map` 'forest_areas' and run the module.
* Now load the ``forest_areas`` vector and display the types of forests - deciduous,
  evergreen, mixed - in different colors: In the layer :guilabel:`Properties`
  window, :guilabel:`Symbology` tab, choose from :guilabel:`Legend type`
  |selectstring| 'Unique value' and set the :guilabel:`Classification field`
  to 'VEGDESC'. (Refer to the explanation of the symbology tab
  :ref:sec_symbology in the vector section).
* Next reopen the GRASS toolbox and open :menuselection:`Vector --> Vector update`
  by other maps.
* Click on the **v.rast.stats** module. Enter ``gtopo30``, and ``forest_areas``.
* Only one additional parameter is needed: Enter :guilabel:`column prefix` ``elev``,
  and click **[run]**. This is a computationally heavy operation which will run
  for a long time (probably up to two hours).
* Finally open the ``forest_areas`` attribute table, and verify that several new
  columns have been added including ``elev_min``, ``elev_max``, ``elev_mean``
  etc. for each forest polygon.

Working with the GRASS LOCATION browser
---------------------------------------
.. index::
   single:GRASS toolbox;Browser

Another useful feature inside the GRASS Toolbox is the GRASS :file:`LOCATION`
browser. In figure_grass_module_7_ you can see the current working :file:`LOCATION`
with its :file:`MAPSETs`.

In the left browser windows you can browse through all :file:`MAPSETs` inside the
current :file:`LOCATION`. The right browser window shows some meta information
for selected raster or vector layers, e.g. resolution, bounding box, data source,
connected attribute table for vector data and a command history.

.. _figure_grass_module_7:

.. only:: html

   **Figure GRASS module 7:**

.. figure:: /static/user_manual/grass_integration/grass_mapset_browser.png
   :align: center
   :width: 30em

   GRASS LOCATION browser |nix|

The toolbar inside the :guilabel:`Browser` tab offers following tools to manage
the selected :file:`LOCATION`:

*  |grass_add_map| :guilabel:`Add selected map to canvas`
*  |grass_copy_map| :guilabel:`Copy selected map`
*  |grass_rename_map| :guilabel:`Rename selected map`
*  |grass_delete_map| :guilabel:`Delete selected map`
*  |grass_set_region| :guilabel:`Set current region to selected map`
*  |grass_refresh| :guilabel:`Refresh browser window`

The |grass_rename_map| :guilabel:`Rename selected map` and |grass_delete_map|
:guilabel:`Delete selected map` only work with maps inside your currently selected
:file:`MAPSET`. All other tools also work with raster and vector layers in
another :file:`MAPSET`.

.. _sec_toolbox-customizing:

Customizing the GRASS Toolbox
------------------------------
.. index::
   single:GRASS toolbox;customize

Nearly all GRASS modules can be added to the GRASS toolbox. A XML interface is
provided to parse the pretty simple XML files which configures the modules
appearance and parameters inside the toolbox.

A sample XML file for generating the module ``v.buffer`` (v.buffer.qgm) looks
like this:

::

  <?xml version="1.0" encoding="UTF-8"?>
  <!DOCTYPE qgisgrassmodule SYSTEM "http://mrcc.com/qgisgrassmodule.dtd">

  <qgisgrassmodule label="Vector buffer" module="v.buffer">
          <option key="input" typeoption="type" layeroption="layer" />
          <option key="buffer"/>
          <option key="output" />
  </qgisgrassmodule>


The parser reads this definition and creates a new tab inside the toolbox when
you select the module. A more detailed description for adding new modules, changing
the modules group, etc. can be found on the QGIS wiki at
http://hub.qgis.org/projects/quantum-gis/wiki/Adding_New_Tools_to_the_GRASS_Toolbox
