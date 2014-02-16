|LS| Combining the Analyses
===============================================================================

Using the vectorized results of the raster analysis will allow you to select
only those buildings on suitable terrain.

**The goal for this lesson:** To use the vectorized terrain results to select
suitable plots.

|moderate| |TY|
-------------------------------------------------------------------------------

* Save your current map (:kbd:`raster_analysis.qgs`).
* Open the map in which you did the vector analysis earlier
  (:kbd:`analysis.qgs`).
* In the :guilabel:`Layers list`, enable these layers:
- :guilabel:`hillshade`,
- :guilabel:`solution` (or :guilabel:`buildings_over_100`)
* In addition to these layers, which should already be loaded in the map from
  when you worked on it before, also add the :kbd:`suitable_terrain.shp`
  dataset.
* If you are missing some layers, you should find them in
  :kbd:`exercise_data/residential_development/`
* Use the :guilabel:`Intersect` tool (:guilabel:`Vector -> Geoprocessing Tools`)
  to create a new vector layer called :kbd:`new_solution.shp` which contains
  only those buildings which intersect the :kbd:`suitable_terrain` layer.

You should now have a layer showing certain buildings as your solution, for
example:

.. image:: /static/training_manual/complete_analysis/new_solution_example.png
   :align: center

.. note:: If you find that the :guilabel:`Intersect` tool does not produce any
  results, check the CRS settings of each of your layers. The CRS must be the
  same for both the layers you are comparing. You may need to reproject one
  layer by saving the layer as a new shapefile with the required CRS. In our
  example, the :kbd:`suitable_terrain` layer was reprojected to
  :kbd:`WGS 84 / UTM 34S` and named :kbd:`suitable_terrain_34S`.


.. _backlink-complete-analysis-2:

|moderate| |TY| Inspecting the Results
-------------------------------------------------------------------------------

Look at each of the buildings in your :guilabel:`new_solution` layer. Compare them
with the :guilabel:`suitable_terrain` layer by changing the symbology for the
:guilabel:`new_solution` layer so that it has outlines only. What do you notice
about some of the buildings? Are they all suitable just because they intersect with
the :guilabel:`suitable_terrain` layer? Why or why not? Which ones would you
deem to be unsuitable?

:ref:`Check your results <complete-analysis-2>`


.. _backlink-complete-analysis-3:

|moderate| |TY| Refining the Analysis
-------------------------------------------------------------------------------

You can see from the results that some buildings which were included were
not really suitable, so we can now refine the analysis.

We want to ensure that our analysis returns only those buildings which fall
entirely within the :kbd:`suitable_terrain` layer. How would you achieve this?
Use one or more Vector Analysis tools and remember that our buildings are all
over 100m squared in size.

:ref:`Check your results <complete-analysis-3>`

|IC|
-------------------------------------------------------------------------------

You have now answered the original research question, and can offer an opinion
(with reasons, backed by analysis) for a recommendation regarding which
property to develop.

|WN|
-------------------------------------------------------------------------------

Next you will present these results as part of your second assignment.
