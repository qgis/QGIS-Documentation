|LS| Vector Analysis
===============================================================================

Vector data can also be analyzed to reveal how different features interact with
each other in space. There are many different analysis-related functions in
GIS, so we won't go through them all. Rather, we'll pose a question and try to
solve it using the tools that QGIS provides.

**The goal for this lesson:** To ask a question and solve it using analysis
tools.


|basic| The GIS Process
-------------------------------------------------------------------------------

Before we start, it would be useful to give a brief overview of a process that
can be used to solve any GIS problem. The way to go about it is:

i. State the Problem
ii. Get the Data
iii. Analyze the Problem
iv. Present the Results

|basic| The problem
-------------------------------------------------------------------------------

Let's start off the process by deciding on a problem to solve. For example,
you are an estate agent and you are looking for a residential property in
|majorUrbanName| for clients who have the following criteria:

#. It needs to be in |majorUrbanName|.
#. It must be within reasonable driving distance of a school (say 1km).
#. It must be more than 100m squared in size.
#. Closer than 50m to a main road.
#. Closer than 500m to a restaurant.

|basic| The data
-------------------------------------------------------------------------------

To answer these questions, we're going to need the following data:

#. The residential properties (buildings) in the area.
#. The roads in and around the town.
#. The location of schools and restaurants.
#. The size of buildings.

All of this data is available through OSM and you should find that the dataset
you have been using throughout this manual can also be used for this lesson.
However, in order to ensure we have the complete data, we will re-download the
data from OSM using QGIS' built-in OSM download tool.

.. note:: Although OSM downloads have consistent data fields, the coverage and
    detail does vary. If you find that your chosen region does not contain
    information on restaurants, for example, you may need to chose a different
    region.

|basic| |FA| Start a Project
-------------------------------------------------------------------------------

* Start a new QGIS project.
* Use the OpenStreetMap data download tool found in the :guilabel:`Vector` ->
  :guilabel:`OpenStreeMap` menu to download the data for your chosen region.
* Save the data as :kbd:`osm_data.osm` in your :kbd:`exercise_data` folder.

* Note that the :guilabel:`osm` format is a type of vector data. Add this data as a vector
  layer as usually :guilabel:`Layer` -> :guilabel:`Add vector layer...`,
  browse to the new :kbd:`osm_data.osm` file you just downloaded. You may need to
  select :guilabel:`Show All Files` as the file format.
* Select :kbd:`osm_data.osm` and click :guilabel:`Open`
* In the dialog which opens, select all the layers, *except* the
  :kbd:`other_relations` and :kbd:`multilinestrings` layer:

.. image:: /static/training_manual/foreword/select_osm_layers.png
   :align: center

This will import the OSM data as separate layers into your map.

The data you just downloaded from OSM is in a geographic coordinate system, WGS84,
which uses latitude and longitude coordinates, as you know from the previous
lesson. You also learnt that to calculate distances in meters, we need to work with
a projected coordinate system. Start by setting your project's coordinate system to a
suitable :guilabel:`CRS` for your data, in the case of |majorUrbanName|,
:guilabel:`WGS 84 / UTM zone 34S`:

* Open the :kbd:`Project Properties` dialog, select :guilabel:`CRS` and filter
  the list to find :guilabel:`WGS 84 / UTM zone 34S`.
* Click :guilabel:`OK`.

We now need to extract the information we need from the OSM dataset. We need to
end up with layers representing all the houses, schools, restaurants and roads in the
region. That information is inside the :guilabel:`multipolygons` layer and can be extracted
using the information in its :guilabel:`Attribute Table`. We'll start with the :kbd:`schools` layer:

* Right-click on the :guilabel:`multipolygons` layer in the
  :guilabel:`Layers list` and open the :guilabel:`Layer Properties`.
* Go to the :guilabel:`General` menu.
* Under :guilabel:`Feature subset` click on the **[Query Builder]** button to
  open the :guilabel:`Query builder` dialog.
* In the :guilabel:`Fields` list on the left of this dialog until
  you see the field :kbd:`amenity`.
* Click on it once.
* Click the :guilabel:`All` button underneath the :guilabel:`Values` list:

Now we need to tell QGIS to only show us the polygons where the value of
:kbd:`amenity` is equal to :kbd:`school`.

* Double-click the word :kbd:`amenity` in the :guilabel:`Fields` list.
* Watch what happens in the :guilabel:`Provider specific filter expression`
  field below:

.. image:: /static/training_manual/vector_analysis/schools_query.png
   :align: center

The word :kbd:`"amenity"` has appeared. To build the rest of the query:

* Click the :guilabel:`=` button (under :guilabel:`Operators`).
* Double-click the value :kbd:`school` in the :guilabel:`Values` list.
* Click :kbd:`OK` twice.

This will filter OSM's :kbd:`multipolygons` layer to only show the schools in
your region. You can now either:

* Rename the filtered OSM layer to :kbd:`schools` and re-import the
  :kbd:`multipolygons` layer from :kbd:`osm_data.osm`, OR
* Duplicate the filtered layer, rename the copy, clear the :kbd:`Query Builder`
  and create your new query in the :guilabel:`Query Builder`.

.. _backlink-vector-analysis-basic-1:

|moderate| |TY| Extract Required Layers from OSM
--------------------------------------------------------------------------------
Using the above technique, use the :kbd:`Query Builder`
tool to extract the remaining data from OSM to create the following layers:

* :kbd:`roads` (from OSM's :kbd:`lines` layer)
* :kbd:`restaurants` (from OSM's :kbd:`multipolygons` layer)
* :kbd:`houses` (from OSM's :kbd:`multipolygons` layer)

You may wish to re-use the :kbd:`roads.shp` layer you created in earlier lessons.

:ref:`Check your results <vector-analysis-basic-1>`

* Save your map under :guilabel:`exercise_data`, as :kbd:`analysis.qgs` (this
  map will be used in future modules).
* In your operating system's file manager, create a new folder under
  :guilabel:`exercise_data` and call it :kbd:`residential_development`. This is
  where you'll save the datasets that will be the results of the analysis
  functions.

.. _backlink-vector-analysis-basic-2:

|basic| |TY| Find important roads
-------------------------------------------------------------------------------

Some of the roads in OSM's dataset are listed as :kbd:`unclassified`,
:kbd:`tracks`, :kbd:`path` and :kbd:`footway`. We want to exclude these from
our roads dataset.

* Open the :kbd:`Query Builder` for the :kbd:`roads` layer,
  click :guilabel:`Clear` and build the following query:

  :kbd:`"highway"  != 'NULL' AND "highway" != 'unclassified' AND "highway" != 'track' AND "highway" != 'path' AND "highway" != 'footway'`

You can either use the approach above, where you double-clicked values and
clicked buttons, or you can copy and paste the command above.

This should immediately reduce the number of roads on your map:

.. image:: /static/training_manual/vector_analysis/correct_roads_filter.png
   :align: center

|basic| |TY| Convert Layers' CRS
-------------------------------------------------------------------------------

Because we are going to be measuring distances within our layers, we need to
change the layers' CRS. To do this, we need to select each layer in turn,
save the layer to a new shapefile with our new projection, then import that new
layer into our map.

.. note:: In this example, we are using the
    :guilabel:`WGS 84 / UTM zone 34S` CRS, but you may use a UTM CRS which is
    more appropriate for your region.

* Right click the :kbd:`roads` layer in the :kbd:`Layers` panel.
* Click :kbd:`Save as...`
* In the :kbd:`Save Vector As` dialog, choose the following settings and click
  :guilabel:`Ok` (making sure you select :kbd:`Add saved file to map`):

.. image:: /static/training_manual/vector_analysis/save_roads_34S.png
   :align: center

The new shapefile will be created and the resulting layer added to your map.

.. note:: If you don't have activated :guilabel:`Enable 'on the fly' CRS transformation`
    or the :guilabel:`Automatically enable 'on the fly' reprojection if layers have different CRS`
    settings (see previous lesson), you might no be able to see the new layers you just added
    to the map. In this case, you can focus the map on any of the layers by right
    click on any layer and click :guilabel:`Zoom to layer extent`, or just enable
    any of the mentioned 'on the fly' options.

* Remove the old :kbd:`roads` layer.

Repeat this process for each layer, creating a new shapefile and layer with
"_34S" appended to the original name and removing each of the old layers.

Once you have completed the process for each layer, right click on any layer and
click :guilabel:`Zoom to layer extent` to focus the map to the area of interest.

Now that we have converted OSM's data to a UTM projection, we can begin our
calculations.

|basic| |FA| Analyzing the Problem: Distances From Schools and Roads
-------------------------------------------------------------------------------

QGIS allows you to calculate distances from any vector object.

* Make sure that only the :guilabel:`roads_34S` and
  :guilabel:`houses_34S` layers are visible, to simplify the map while
  you're working.
* Click on the :menuselection:`Vector --> Geoprocessing Tools --> Buffer(s)`
  tool:

This gives you a new dialog.

* Set it up like this:

.. image:: /static/training_manual/vector_analysis/vector_buffer_setup.png
   :align: center

The :guilabel:`Buffer distance` is in meters because our input dataset is in a
Projected Coordinate System that uses meter as its basic measurement unit.
This is why we needed to use projected data.

* Save the resulting layer under :kbd:`exercise_data/residential_development/`
  as :kbd:`roads_buffer_50m.shp`.
* Click :guilabel:`OK` and it will create the buffer.
* When it asks you if it should "add the new layer to the TOC", click
  :guilabel:`Yes`. ("TOC" stands for "Table of Contents", by which it means the
  :guilabel:`Layers list`).
* Close the :guilabel:`Buffer(s)` dialog.

Now your map will look something like this:

.. image:: /static/training_manual/vector_analysis/roads_buffer_result.png
   :align: center

If your new layer is at the top of the :kbd:`Layers` list, it will probably obscure
much of your map, but this gives us all the areas in your region which are
within 50m of a road.

However, you'll notice that there are distinct areas within our buffer, which
correspond to all the individual roads. To get rid of this problem, remove the
layer and re-create the buffer using the settings shown here:

.. image:: /static/training_manual/vector_analysis/dissolve_buffer_setup.png
   :align: center

* Note that we're now checking the :guilabel:`Dissolve buffer results` box.
* Save the output under the same name as before (click :guilabel:`Yes` when it
  asks your permission to overwrite the old one).
* Click :guilabel:`OK` and close the :guilabel:`Buffer(s)` dialog again.
  
Once you've added the layer to the :guilabel:`Layers list`, it will look like
this:

.. image:: /static/training_manual/vector_analysis/dissolve_buffer_results.png
   :align: center

Now there are no unnecessary subdivisions.

.. _backlink-vector-analysis-basic-2:

|basic| |TY| Distance from schools
-------------------------------------------------------------------------------

* Use the same approach as above and create a buffer for your schools.

It needs to be :kbd:`1 km` in radius, and saved under the usual directory as
:kbd:`schools_buffer_1km.shp`.

:ref:`Check your results <vector-analysis-basic-2>`

|basic| |FA| Overlapping Areas
-------------------------------------------------------------------------------

Now we have areas where the road is 50 meters away and there's a school within
1 km (direct line, not by road). But obviously, we only want the areas where
both of these criteria are satisfied. To do that, we'll need to use the
:guilabel:`Intersect` tool. Find it under
:menuselection:`Vector --> Geoprocessing Tools --> Intersect`. Set it up like
this:

.. image:: /static/training_manual/vector_analysis/school_roads_intersect.png
   :align: center

The two input layers are the two buffers; the save location is as usual; and
the file name is :kbd:`road_school_buffers_intersect.shp`. Once it's set up
like this, click :guilabel:`OK` and add the layer to the
:guilabel:`Layers list` when prompted.

In the image below, the blue areas show us where both distance criteria are
satisfied at once!

.. image:: /static/training_manual/vector_analysis/intersect_result.png
   :align: center

You may remove the two buffer layers and only keep the one that shows where
they overlap, since that's what we really wanted to know in the first place:

.. image:: /static/training_manual/vector_analysis/final_intersect_result.png
   :align: center

.. _select-by-location:

|basic| |FA| Select the Buildings
-------------------------------------------------------------------------------

Now you've got the area that the buildings must overlap. Next, you want to
select the buildings in that area.

* Click on the menu entry :menuselection:`Vector --> Research Tools --> Select
  by location`. A dialog will appear.
* Set it up like this:

.. image:: /static/training_manual/vector_analysis/location_select_dialog.png
   :align: center

* Click :guilabel:`OK`, then :guilabel:`Close`.
* You'll probably find that not much seems to have changed. If so, move the
  :kbd:`school_roads_intersect` layer to the bottom of the layers list, then
  zoom in:

.. image:: /static/training_manual/vector_analysis/select_zoom_result.png
   :align: center

The buildings highlighted in yellow are those which match our criteria and are
selected, while the buildings in green are those which do not. We can now save
the selected buildings as a new layer.

* Right-click on the :guilabel:`houses_34S` layer in the :guilabel:`Layers list`.
* Select :guilabel:`Save Selection As...`.
* Set the dialog up like this:

.. image:: /static/training_manual/vector_analysis/save_selection_as.png
   :align: center

* The file name is :kbd:`well_located_houses.shp`.
* Click :guilabel:`OK`.
  
Now you have the selection as a separate layer and can remove the
:kbd:`houses_34S` layer.

.. _backlink-vector-analysis-basic-3:

|moderate| |TY| Further Filter our Buildings
-------------------------------------------------------------------------------

We now have a layer which shows us all the buildings within 1km of a school and
within 50m of a road. We now need to reduce that selection to only show
buildings which are within 500m of a restaurant.

Using the processes described above, create a new layer called
:kbd:`houses_restaurants_500m` which further filters
your :kbd:`well_located_houses` layer to show only those which are within 500m
of a restaurant.

:ref:`Check your results <vector-analysis-basic-3>`

|basic| |FA| Select Buildings of the Right Size
-------------------------------------------------------------------------------

To see which buildings are the correct size (more than 100 square metres), we
first need to calculate their size.

* Open the attribute table for the :guilabel:`houses_restaurants_500m` layer.
* Enter edit mode and open the field calculator.
* Set it up like this:

.. image:: /static/training_manual/vector_analysis/buildings_area_calculator.png
   :align: center

* If you can't find :guilabel:`AREA` in the list, try creating a new field as
  you did in the previous lesson of this module.
* Click :guilabel:`OK`.
* Scroll to the right of the attribute table; your :kbd:`AREA` field now has
  areas in metres for all the buildings in your
  :guilabel:`houses_restaurants_500m` layer.
* Click the edit mode button again to finish editing, and save your edits
  when prompted.
* Build a query as earlier in this lesson:

.. image:: /static/training_manual/vector_analysis/buildings_area_query.png
   :align: center

* Click :guilabel:`OK`. Your map should now only show you those buildings which
  match our starting criteria and which are more than 100m squared in size.


|basic| |TY|
-------------------------------------------------------------------------------

* Save your solution as a new layer, using the approach you learned above for
  doing so. The file should be saved under the usual directory, with the name
  :kbd:`solution.shp`.

|IC|
-------------------------------------------------------------------------------

Using the GIS problem-solving approach together with QGIS vector analysis
tools, you were able to solve a problem with multiple criteria quickly and
easily.

|WN|
-------------------------------------------------------------------------------

In the next lesson, we'll look at how to calculate the shortest distance along
the road from one point to another.
