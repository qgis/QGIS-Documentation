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

Let's start off the process by deciding on a problem to solve. Let's say you're
a property developer, and you need to buy a farm to build a new residential
development for people who have had enough of Cape Town and Johannesburg.
You've done some market research, and you've come up with the following
requirements that a farm needs to satisfy:

#. It needs to be in Swellendam.
#. You don't want to have to build a long access road (maximum distance 500
   meters), and it has to be easily accessible from main routes.
#. The people who make up the target market will probably have children, so it
   must be within a reasonable distance (by car) from a school.
#. The farm must be between 100 and 150 hectares in area.

|basic| The data
-------------------------------------------------------------------------------

To answer these questions, we're going to need the following data:

#. The farms we're going to be choosing from.
#. The roads that need to be running through these farms.
#. The location of schools.

For this exercise the data has been provided already, but in reality you may
need to find a provider for the datasets in question. In South Africa, the
Surveyor-General's Office is a good source of the kind of data you'd find on 1:
50 000 topographic map sheets, which includes all of the data we need for this
particular problem.

|basic| |FA| Start a Project
-------------------------------------------------------------------------------

So now that we know what we want to do, let's start doing it!

* Start a new QGIS project.
* Start adding new layers. They're all to be found in the
  :kbd:`exercise_data/projected_data` folder.
* Add the :kbd:`schools_33S`, :kbd:`roads_33S` and :kbd:`farms_33S` layers.

They'll probably look very familiar. They're the same data we've been working
with all along, except that they're now in a Projected Coordinate System. This
is necessary for analysis, for reasons we've covered in the previous lesson.
(We want to be able to calculate distances in meters and areas in hectares, not
in degrees.)

Once you've got these layers in your :guilabel:`Layers list`:

* Rename the layers by right-clicking on them and selecting the
  :guilabel:`Rename` option.
* Give them the new, less messy names :kbd:`roads`, :kbd:`schools` and
  :kbd:`farms`.
* Save your map under :guilabel:`exercise_data`, as :kbd:`analysis.qgs`.
* In your operating system's file manager, create a new folder under
  :guilabel:`exercise_data` and call it :kbd:`residential_development`. This is
  where you'll save the datasets that will be the results of the analysis
  functions.

Now that we've got the data, let's analyze the problem!

|basic| |FA| Analyzing the Problem: Farms in Swellendam
-------------------------------------------------------------------------------

The first criterion we're facing is that the farm needs to be in Swellendam.
So let's tell QGIS to only show us the farms that are, in fact, in Swellendam!

* Right-click on the :guilabel:`farms` layer in the :guilabel:`Layers list`.
* Select the option :guilabel:`Query...`. This gives you a new :guilabel:`Query
  Builder` dialog.
* Scroll down in the :guilabel:`Fields` list on the left of this dialog until
  you see the field :kbd:`TOWN`.
* Click on it once.
* Click the :guilabel:`All` button underneath the :guilabel:`Values` list:

.. image:: ../_static/vector_analysis/013.png
   :align: center

Now we need to tell QGIS to only show us the farms where the value of
:kbd:`TOWN` is equal to :kbd:`Swellendam`.

* Double-click the word :kbd:`TOWN` in the :guilabel:`Fields` list.
* Watch what happens in the :guilabel:`SQL where clause` field below:

.. image:: ../_static/vector_analysis/014.png
   :align: center

The word :kbd:`"TOWN"` has appeared! To build the rest of the query:

* Click the :guilabel:`=` button (under :guilabel:`Operators`).
* Double-click the value :kbd:`Swellendam` in the :guilabel:`Values` list.

Your query is this:

.. image:: ../_static/vector_analysis/015.png
   :align: center

And now your :guilabel:`farms` layer looks like this:

.. image:: ../_static/vector_analysis/016.png
   :align: center

For further analysis, it's better if we've got these farms as a separate layer.

* Right-click on the :guilabel:`farms` layer and click :guilabel:`Save As...`.
* Next to the :guilabel:`Save as` field in the dialog that appears, click the
  :guilabel:`Browse` button.
* Save the layer under :kbd:`exercise_data/residential_development/`, as
  :kbd:`swellendam_farms.shp`.
* Check the :guilabel:`Add saved file to map` box in the :guilabel:`Save vector
  layer as...` dialog.
* Click :guilabel:`OK`. It will tell you that :kbd:`Export to vector file has
  been completed`.
* Click :guilabel:`OK`.

Now we've got the :guilabel:`farms` twice, but we only need the one we just
created.

* Right-click on the old :guilabel:`farms` layer and remove it.


.. _backlink-vector-analysis-basic-1:

|basic| |TY| find important roads
-------------------------------------------------------------------------------

We have a similar problem with the roads; the only roads we're taking into
account are the main ones.

* Build a query for the :guilabel:`roads` layer, like you did above for the
  :guilabel:`farms` layer. You want only the types :kbd:`primary`,
  :kbd:`secondary`, :kbd:`tertiary` and :kbd:`trunk`, so you need to build this
  query:

  :kbd:`"TYPE" = 'primary' OR "TYPE" = 'secondary' OR "TYPE" = 'tertiary' OR
  "TYPE" = 'trunk'`

You can either use the approach above, where you double-clicked values and
clicked buttons, or you can copy and paste the command above.

:ref:`Check your results <vector-analysis-basic-1>`

|basic| |TY| find high schools
-------------------------------------------------------------------------------

Your future customers will want to send their children to high schools.

* Use the same approach as before and build this query for the
  :guilabel:`schools` layer:

  :kbd:`"has_high_s" = 'y'`

You should have only 3 out of the 4 original schools left.

* Save the resulting layer under :kbd:`exercise_data/residential_development/`
  as :kbd:`high_schools.shp`.


|basic| |FA| Analyzing the Problem: Distances From Schools and Roads
-------------------------------------------------------------------------------

QGIS allows you to calculate distances from any vector object.

* Make sure that only the :guilabel:`important_roads` and
  :guilabel:`swellendam_farms` layers are visible, to simplify the map while
  you're working.
* Click on the :menuselection:`Vector --> Geoprocessing Tools --> Buffer(s)`
  tool:

.. image:: ../_static/vector_analysis/018.png
   :align: center

This gives you a new dialog.

* Set it up like this:

.. image:: ../_static/vector_analysis/020.png
   :align: center

The :guilabel:`Buffer distance` is in meters because our input dataset is in a
Projected Coordinate System. This is why we needed to use projected data!

* Save the resulting layer under :kbd:`exercise_data/residential_development/`
  as :kbd:`important_roads_buffer_500m.shp`.
* Click :guilabel:`OK` and it will create the buffer.
* When it asks you if it should "add the new layer to the TOC", click
  :guilabel:`Yes`. ("TOC" stands for "Table of Contents", by which it means the
  :guilabel:`Layers list`).

Now you've got this:

.. image:: ../_static/vector_analysis/021.png
   :align: center

OK, that looks interesting! Those are all the areas that are within 500 meters
of an important road. 

But look closer: it looks like there are joins between different sections of
road! That's not nice. Remove that layer and let's try again:

.. image:: ../_static/vector_analysis/022.png
   :align: center

* Note that we're now checking the :guilabel:`Dissolve buffer results` box.
* Save the output under the same name as before (click :guilabel:`Yes` when it
  asks your permission to overwrite the old one).
* Click :guilabel:`OK`.
  
Once you've added the layer to the :guilabel:`Layers list`, it will look like
this:

.. image:: ../_static/vector_analysis/023.png
   :align: center

That's more like it! Now there are no unnecessary subdivisions.

.. _backlink-vector-analysis-basic-2:

|basic| |TY| distance from high schools
-------------------------------------------------------------------------------

* Use the same approach as above and create a buffer for your schools.

It needs to be :kbd:`10 km` in radius, and saved under the usual directory as
:kbd:`high_schools_buffer_10km.shp`.

:ref:`Check your results <vector-analysis-basic-2>`

|basic| |FA| Overlapping Areas
-------------------------------------------------------------------------------

Now we have areas where the road in 500 meters away and there's a school within
10 km (as the crow flies). But obviously, we only want the areas where both of
these criteria are satisfied at once! To do that, we'll need to use the
:guilabel:`Intersect` tool. Find it under :menuselection:`Vector -->
Geoprocessing Tools --> Intersect`. Set it up like this:

.. image:: ../_static/vector_analysis/027.png
   :align: center

The two input layers are the two buffers; the save location is as usual; and
the file name is :kbd:`road_school_buffers_intersect.shp`. Once it's set up
like this, click :guilabel:`OK` and add the layer to the :guilabel:`Layers
list` when prompted.

In the image below, the blue areas show us where both distance criteria are
satisfied at once!

.. image:: ../_static/vector_analysis/028.png
   :align: center

You may remove the two buffer layers and only keep the one that shows where
they overlap, since that's what we really wanted to know in the first place.

.. _select-by-location:

|basic| |FA| Select the Farms
-------------------------------------------------------------------------------

Now you've got the area that the farms must overlap. Next, you want to select
the farms in that area.

* Click on the menu entry :menuselection:`Vector --> Research Tools --> Select
  by location`. A dialog will appear.
* Set it up like this:

.. image:: ../_static/vector_analysis/030.png
   :align: center

* Click :guilabel:`OK` and you'll see the results:

.. image:: ../_static/vector_analysis/031.png
   :align: center

The yellow farms are the selected ones. Let's save them as a new layer.

* Right-click on the :guilabel:`swellendam_farms` layer in the
  :guilabel:`Layers list`.
* Select :guilabel:`Save Selection As...`.
* Set the dialog up like this:

.. image:: ../_static/vector_analysis/032.png
   :align: center

* The file name is :kbd:`well_located_farms.shp`.
* Click :guilabel:`OK`.
  
Now you have the selection as a separate layer.

|basic| |FA| Select Farms of the Right Size
-------------------------------------------------------------------------------

To see which farms are the right area (between 100 and 150 ha), we first need
to calculate their areas in hectares.

* Open the attribute table for the :guilabel:`well_located_farms` layer.
* Enter edit mode:

.. image:: ../_static/vector_analysis/033.png
   :align: center

* Start the field calculator:

.. image:: ../_static/vector_analysis/034.png
   :align: center

* Set it up like this:

.. image:: ../_static/vector_analysis/035.png
   :align: center

* If you can't find :guilabel:`AREA` in the list, try this instead:

.. image:: ../_static/vector_analysis/036.png
   :align: center

* Click :guilabel:`OK`.
* Scroll to the right of the attribute table; your :kbd:`AREA` field now has
  areas in hectares for all the farms in your :guilabel:`well_located_farms`
  layer.
* Click the edit mode button again as above, and save your edits when prompted.
* Do a query:

.. image:: ../_static/vector_analysis/037.png
   :align: center

* Click :guilabel:`OK`. Your results should look like this:

.. image:: ../_static/vector_analysis/038.png
   :align: center

That's it! Those red farms are the ones satisfying your criteria. Well done!

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
