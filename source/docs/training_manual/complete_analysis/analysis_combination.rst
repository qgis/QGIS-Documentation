|LS| Combining the Analyses
===============================================================================

Using the vectorized results of the raster analysis will allow you to select
only those farms with suitable tarrain.

**The goal for this lesson:** To use the vectorized terrain results to select
suitable farms.

|moderate| |TY|
-------------------------------------------------------------------------------

* Save your current map (:kbd:`raster_analysis.qgs`).
* Open the map in which you did the vector analysis earlier
  (:kbd:`analysis.qgs`).
* In the :guilabel:`Layers list`, enable these layers:
  - :guilabel:`hillshade`,
  - :guilabel:`solution`,
  - :guilabel:`important_roads` and
  - either :guilabel:`aerial_photos` or :guilabel:`DEM`.
* In addition to these layers, which should already be loaded in the map from
  when you worked on it before, also add the :kbd:`suitable_terrain.shp`
  dataset.
* Select all the farms (in the :guilabel:`solution` layer) that intersect with
  the :kbd:`suitable_terrain` layer. (Use the :guilabel:`select by location`
  tool as before.)
* Save the selection as :kbd:`new_solution.shp`.

You should now have a layer with these farms as your solution:

.. image:: ../_static/complete_analysis/004.png
   :align: center


.. _backlink-complete-analysis-2:

|moderate| |TY| Inspecting the Results
-------------------------------------------------------------------------------

Look at each of the farms in your :guilabel:`new_solution` layer. Compare them
with the :guilabel:`suitable_terrain` layer by changing the symbology for the
:guilabel:`new_solution` layer so that it has outlines only. What do you notice
about some of the farms? Are they all suitable just because they intersect with
the :guilabel:`suitable_terrain` layer? Why or why not? Which ones would you
deem to be unsuitable?

:ref:`Check your results <complete-analysis-2>`


.. _backlink-complete-analysis-3:

|moderate| |TY| Refining the Analysis
-------------------------------------------------------------------------------

Now that you can see from the results that some farms were included that were
not really suitable, it becomes possible to refine the analysis.

We can see that there are some farms which do have suitable areas in them, but
these areas are too small to be useful. The decision is made that for a farm to
be considered, it must have suitable areas on it that are continuous for 350
meters or more. How would you ensure that the farms meet this requirement? Use
(a) **vector** analysis tool(s) for this.

:ref:`Check your results <complete-analysis-3>`

|IC|
-------------------------------------------------------------------------------

You have now answered the original research question, and can offer an opinion
(with reasons, backed by analysis) for a recommendation regarding which
property to develop.

|WN|
-------------------------------------------------------------------------------

Next you will present these results as part of your second assignment.
