|LS| Network Analysis
===============================================================================

Calculating the shortest distance between two points is a commonly cited use
for GIS. QGIS ships with this tool, but it's not visible by default. In this
brief lesson, we'll show you what you need to get started.

**The goal for this lesson:** To activate, configure and use the
:guilabel:`Road Graph` plugin.

|basic| |FA| Activate the Tool
-------------------------------------------------------------------------------

QGIS has many plugins that add to its basic functions. Many of these plugins
are so useful that they ship along with the program straight out of the box.
They're still hidden by default, though. So in order to use them, you need to
activate them first.

To activate the :guilabel:`Road Graph` plugin:

* Start the :guilabel:`Plugin Manager` by clicking on the QGIS main window's
  menu item :menuselection:`Plugins --> Manage Plugins`. A dialog appears.
* Select the plugin like this:

.. image:: ../_static/vector_analysis/039.png
   :align: center

* Click :guilabel:`OK` on the :guilabel:`Plugin Manager` dialog.
* To see the plugin in your interface, go to :menuselection:`View --> Panels`
  and ensure that :guilabel:`Shortest path` has a check mark next to it.

This panel will appear in your interface:

.. image:: ../_static/vector_analysis/042.png
   :align: center


|basic| |FA| Configure the Tool
-------------------------------------------------------------------------------

To have a layer to calculate on, first save your current map. Then create a new
map and load the layer :guilabel:`exercise_data/projected_data/roads_33S.shp`.

Since so many different configurations are possible when analyzing networks,
the plugin doesn't assume anything before you've set it up. Unfortunately, this
means that it won't do anything at all if you don't set it up first.

* Click on the menu item :menuselection:`Plugins --> Road graph --> Road graph
  settings`. A dialog will appear.
* Make sure it's set up like this (use defaults unless otherwise specified):

.. image:: ../_static/vector_analysis/040.png
   :align: center

- :guilabel:`Time unit`: :guilabel:`hour`
- :guilabel:`Distance unit`: :guilabel:`kilometer`
- :guilabel:`Layer`: :guilabel:`roads_33S`
- :guilabel:`Speed field`: :guilabel:`Always use default` / :guilabel:`km/h`

.. image:: ../_static/vector_analysis/041.png
   :align: center

- :guilabel:`Direction`: :guilabel:`Two-way direction`
- :guilabel:`Speed`: :guilabel:`60`


|basic| |FA| Use the Tool
-------------------------------------------------------------------------------

Let's say you want to get from Barrydale to Bonnievale:

.. image:: ../_static/vector_analysis/043.png
   :align: center

* In the plugin panel, click on the :guilabel:`Capture Point` button next to
  the :guilabel:`Start` field:

.. image:: ../_static/vector_analysis/044.png
   :align: center

* Click somewhere in Barrydale.
* Use the :guilabel:`Capture Point` button next to the :guilabel:`Stop` field
  and capture a point somewhere in Bonnievale.
* Click on the :guilabel:`Calculate` button to see the solution:

.. image:: ../_static/vector_analysis/045.png
   :align: center

.. image:: ../_static/vector_analysis/046.png
   :align: center

|moderate| |FA| Using Criteria
-------------------------------------------------------------------------------

.. note:: Section developed by Linfiniti and S Motala (Cape Peninsula
   University of Technology)

* Add the layer :guilabel:`exercise_data/projected_data/places_33S.shp`.
* Add the aerial photographs under :guilabel:`exercise_data/raster/`.
* Zoom to the Swellendam area (the town / cluster of roads in the center of the
  map).
* Select only the roads that are in the categories :kbd:`trunk`, :kbd:`primary`
  or :kbd:`tertiary` by running this attribute selection query on the road
  layer:

::

  "TYPE" = 'trunk' OR "TYPE" = 'primary' OR "TYPE" = 'tertiary'

* Right-click on the :guilabel:`roads_33S` layer in the :guilabel:`Layers list`.
* Save it out to a new file, :kbd:`roads_subset`. Only the currently visible
  features will be saved.
* Remove the original :guilabel:`roads_33S` layer from the :guilabel:`Layers
  list`.
* Open the attribute table for the :guilabel:`roads_subset` layer and enter
  edit mode:

.. image:: ../_static/vector_analysis/047.png
   :align: center

* Add a new column:

.. image:: ../_static/vector_analysis/050.png
   :align: center

* Call this new column :kbd:`SPEED`, and give it the type :guilabel:`Whole
  number (integer)` with a width of :kbd:`3`.
* In the main window, activate the :guilabel:`Select Features by Rectangle`
  tool:

.. image:: ../_static/vector_analysis/051.png
   :align: center

* Select these roads:

.. image:: ../_static/vector_analysis/052.png
   :align: center

(To select more than one road, hold the :kbd:`ctrl` button and drag a box
across any road that you want to include in the selection.)

* In the attribute table, click on the :guilabel:`Show selected only` box.
* Set the :kbd:`SPEED` value for all the selected streets to :kbd:`60`:

.. image:: ../_static/vector_analysis/053.png
   :align: center

In context, this means that you're setting the speed limit on those roads to
:kbd:`60 km/h`.

* Select the highway outside of town:

.. image:: ../_static/vector_analysis/054.png
   :align: center

* Set the :kbd:`SPEED` value for all the selected streets to :kbd:`120`.
* Close the attribute table, save your edits, and exit edit mode.
* Check the :menuselection:`Vector --> Road graph --> Road graph settings` to
  ensure that it's set up as explained previously in this lesson, but with the
  :guilabel:`Speed` value set to the :kbd:`SPEED` field you just created.
* In the :guilabel:`Shortest path` panel, click the :guilabel:`Start point`
  button.
* Set the starting point to where the dirt road meets the on/off-rqamp at the
  edge of town on the east.
* Set the end point to the T-junction west of town.

.. image:: ../_static/vector_analysis/055.png
   :align: center

* In the :guilabel:`Criterion` drop-down list in the :guilabel:`Shortest path`
  panel, select :guilabel:`Length`.
* Click :guilabel:`Calculate`. The route will be calculated for the shortest
  distance:

.. image:: ../_static/vector_analysis/048.png
   :align: center

Notice the values of :guilabel:`Length` and :guilabel:`Time` in the
:guilabel:`Shortest path` panel.

* Set the :guilabel:`Criterion` to :guilabel:`Time`.
* Click :guilabel:`Calculate` again. The route will be calculated for the
  shortest time:

.. image:: ../_static/vector_analysis/049.png
   :align: center

You can switch back and forth between these criteria, recalculating each time,
and note the changes in the :guilabel:`Length` and :guilabel:`Time` taken.
Remember that the assumption being made to arrive at the time taken to travel a
route does not account for acceleration, and assumes that you will be traveling
at the speed limit at all times. In a real situation, you may want to split
roads into smaller sections and note the average or expected speed in each
section, rather than the speed limit. 

|moderate| |TY|
-------------------------------------------------------------------------------

* Digitize the roads in Railton.
  
These are the main roads, type :guilabel:`tertiary`, speed :kbd:`60`:

.. image:: ../_static/vector_analysis/056.png
   :align: center

And these are the smaller streets, type :guilabel:`residential`, speed
:kbd:`40`:

.. image:: ../_static/vector_analysis/057.png
   :align: center

* Use the :guilabel:`Shortest path` tool to calculate the shortest and fastest
  ways to get from the southern extreme of town to the highway.

If, on clicking :guilabel:`Calculate`, you're getting an error stating that a
path could not be found, then make sure that the roads you digitized actually
meet each other. If they're not quite touching, either fix them by modifying
the features, or set the :guilabel:`Topology tolerance` (:guilabel:`Road graph
plugin settings`). If they're passing over each other without intersecting, use
the :guilabel:`Split features` tool to "split" roads at their intersections:

.. image:: ../_static/vector_analysis/058.png
   :align: center

Remember that the :guilabel:`Split features` tool only works in edit mode on
selected features, though!

|IC|
-------------------------------------------------------------------------------

Now you know how to use the :guilabel:`Road Graph` plugin to solve
shortest-path problems.

|WN|
-------------------------------------------------------------------------------

Next you'll see how to run spatial statistics algorithms on vector datasets.
