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

.. image:: /static/training_manual/vector_analysis/select_road_graph_plugin.png
   :align: center

* Click :guilabel:`Close` on the :guilabel:`Plugin Manager` dialog.

.. note:: If you do not see the the plugin in your interface, go to
   :menuselection:`View --> Panels` and ensure that :guilabel:`Shortest path`
   has a check mark next to it.

This panel will appear in your interface:

.. image:: /static/training_manual/vector_analysis/shortest_path_panel.png
   :align: center


|basic| |FA| Configure the Tool
-------------------------------------------------------------------------------

To have a layer to calculate on, first save your current map. If you haven't
already done so, save your :kbd:`roads_34S` layer to a shapefile by
right-clicking the layer and selecting :guilabel:`Save as...`. Create a new map
and load this layer into it.

Since so many different configurations are possible when analyzing networks,
the plugin doesn't assume anything before you've set it up. This means that it
won't do anything at all if you don't set it up first.

* Click on the menu item :menuselection:`Vecotr --> Road graph --> settings`. A
  dialog will appear.
* Make sure it's set up like this (use defaults unless otherwise specified):

.. image:: /static/training_manual/vector_analysis/road_graph_settings.png
   :align: center

- :guilabel:`Time unit`: :guilabel:`hour`
- :guilabel:`Distance unit`: :guilabel:`kilometer`
- :guilabel:`Layer`: :guilabel:`roads_34S`
- :guilabel:`Speed field`: :guilabel:`Always use default` / :guilabel:`km/h`

.. image:: /static/training_manual/vector_analysis/road_graph_settings_two.png
   :align: center

- :guilabel:`Direction`: :guilabel:`Two-way direction`
- :guilabel:`Speed`: :guilabel:`60`


|basic| |FA| Use the Tool
-------------------------------------------------------------------------------

Find two points, on roads, on your map. They do not need to have any
significance, but they should be connected by roads and separated by a
reasonable distance:

.. image:: /static/training_manual/vector_analysis/road_points.png
   :align: center

* In the plugin panel, click on the :guilabel:`Capture Point` button next to
  the :guilabel:`Start` field:

.. image:: /static/training_manual/vector_analysis/capture_point_start.png
   :align: center

* Click on your chosen start point.
* Use the :guilabel:`Capture Point` button next to the :guilabel:`Stop` field
  and capture your chosen end point.
* Click on the :guilabel:`Calculate` button to see the solution:

.. image:: /static/training_manual/vector_analysis/path_result.png
   :align: center

|moderate| |FA| Using Criteria
-------------------------------------------------------------------------------

.. note:: Section developed by Linfiniti and S Motala (Cape Peninsula
   University of Technology)

* Add your :kbd:`restaurants_34S` layer to the map (extract it from your
  :kbd:`analyis` map if necessary).
* Open the attribute table for the :guilabel:`roads_subset` layer and enter
  edit mode.
* Add a new column with the name :kbd:`SPEED`, and give it the type
 :guilabel:`Whole number (integer)` with a width of :kbd:`3`.
* In the main window, activate the :guilabel:`Select Features by Rectangle`
  tool:

.. image:: /static/training_manual/vector_analysis/select_by_rectangle.png
   :align: center

* Select any main roads in urban - but not residential - areas:

.. image:: /static/training_manual/vector_analysis/60_roads_selected.png
   :align: center

(To select more than one road, hold the :kbd:`ctrl` button and drag a box
across any road that you want to include in the selection.)

* In the attribute table, select :guilabel:`Show selected features`.

    .. image:: /static/training_manual/vector_analysis/show_selected.png
       :align: center

* Set the :kbd:`SPEED` value for all the selected streets to :kbd:`60`:

.. image:: /static/training_manual/vector_analysis/60_roads_edited.png
   :align: center

In context, this means that you're setting the speed limit on those roads to
:kbd:`60 km/h`.

* Select any highways or major roads outside urban areas:

.. image:: /static/training_manual/vector_analysis/highways_selected.png
   :align: center

* Set the :kbd:`SPEED` value for all the selected streets to :kbd:`120`.
* Close the attribute table, save your edits, and exit edit mode.
* Check the :menuselection:`Vector --> Road graph --> Road graph settings` to
  ensure that it's set up as explained previously in this lesson, but with the
  :guilabel:`Speed` value set to the :kbd:`SPEED` field you just created.
* In the :guilabel:`Shortest path` panel, click the :guilabel:`Start point`
  button.
* Set the starting point on a minor road on one side of Swellendam and the end
  point on a major road on the other side of town:

.. image:: /static/training_manual/vector_analysis/speed_start_end.png
   :align: center

* In the :guilabel:`Criterion` drop-down list in the :guilabel:`Shortest path`
  panel, select :guilabel:`Length`.
* Click :guilabel:`Calculate`. The route will be calculated for the shortest
  distance:

.. image:: /static/training_manual/vector_analysis/length_result.png
   :align: center

Notice the values of :guilabel:`Length` and :guilabel:`Time` in the
:guilabel:`Shortest path` panel.

* Set the :guilabel:`Criterion` to :guilabel:`Time`.
* Click :guilabel:`Calculate` again. The route will be calculated for the
  shortest time:

.. image:: /static/training_manual/vector_analysis/time_result.png
   :align: center

You can switch back and forth between these criteria, recalculating each time,
and note the changes in the :guilabel:`Length` and :guilabel:`Time` taken.
Remember that the assumption being made to arrive at the time taken to travel a
route does not account for acceleration, and assumes that you will be traveling
at the speed limit at all times. In a real situation, you may want to split
roads into smaller sections and note the average or expected speed in each
section, rather than the speed limit. 

If, on clicking :guilabel:`Calculate`, you see an error stating that a
path could not be found, make sure that the roads you digitized actually
meet each other. If they're not quite touching, either fix them by modifying
the features, or set the :guilabel:`Topology tolerance` in the plugin's
settings. If they're passing over each other without intersecting, use
the :guilabel:`Split features` tool to "split" roads at their intersections:

|mActionSplitFeatures|

Remember that the :guilabel:`Split features` tool only works in edit mode on
selected features, though!

You might also find that the shortest route is also the quickest if this error
is returned.

|IC|
-------------------------------------------------------------------------------

Now you know how to use the :guilabel:`Road Graph` plugin to solve
shortest-path problems.

|WN|
-------------------------------------------------------------------------------

Next you'll see how to run spatial statistics algorithms on vector datasets.
