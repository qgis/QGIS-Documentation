|LS| Raster to Vector Conversion
===============================================================================

Converting between raster and vector formats allows you to make use of both
raster and vector data when solving a GIS problem, as well as using the various
analysis methods unique to these two forms of geographic data. This increases
the flexibility you have when considering data sources and processing methods
for solving a GIS problem.

To combine a raster and vector analysis, you need to convert the one type of
data to the other. Let's convert the raster result of the previous lesson to a
vector.

**The goal for this lesson:** To get the raster result into a vector that can
be used to complete the analysis.

|moderate| |FA| The :guilabel:`Raster to Vector` Tool
-------------------------------------------------------------------------------

* Click on :menuselection:`Raster --> Conversion --> Polygonize (Raster to
  Vector)`. The tool dialog will appear.
* Set it up like this:

  .. image:: ../_static/complete_analysis/001.png
     :align: center

* Change the field name (describing the values of the raster) to
  :kbd:`suitable`.
* Save the shapefile under :kbd:`exercise_data/residential_development` as
  :kbd:`all_terrain.shp`.

Now you have a vector file which contains all the values of the raster, but
the only areas you're interested in are those that are suitable; i.e., those
polygons where the value of :kbd:`suitable` is :kbd:`1`.

.. _backlink-complete-analysis-1:

|moderate| |TY|
-------------------------------------------------------------------------------

Refer back to the module on vector analysis.

* Create a new vector file that contains only the polygons where
  :kbd:`suitable` has the value of :kbd:`1`.
* Save the new file under :kbd:`exercise_data/residential_development` as
  :guilabel:`suitable_terrain.shp`.

:ref:`Check your results <complete-analysis-1>`

|moderate| |FA| The :guilabel:`Vector to Raster` Tool
-------------------------------------------------------------------------------

Although unnecessary for our current problem, it's useful to know about the
opposite conversion from the one performed above.

* Click on :menuselection:`Raster --> Conversion --> Rasterize (Vector to
  Raster)` to start this tool, then set it up as in the screenshot below:

.. image:: ../_static/complete_analysis/003.png
   :align: center

* :guilabel:`Input file` is :guilabel:`all_terrain`;
* :guilabel:`Output file...` is
  :kbd:`exercise_data/residential_development/raster_conversion.tif`;
* :guilabel:`Width` and :guilabel:`Height` are :kbd:`837` and :kbd:`661`,
  respectively.

.. note::  The size of the output image is specified here to be the same as the
   original raster which was vectorized. To view the dimensions of an image,
   open its metadata (:guilabel:`Metadata` tab in the :guilabel:`Layer
   Properties`).

* Click :guilabel:`OK` on the dialog to begin the conversion process.
* When it is complete, gauge its success by comparing the new raster with the
  original one.  They should match up exactly, pixel for pixel.

|IC|
-------------------------------------------------------------------------------

Converting between raster and vector formats allows you to widen the
applicability of data, and need not lead to data degradation.

|WN|
-------------------------------------------------------------------------------

Now that we have the results of the terrain analysis available in vector
format, they can be used to solve the problem of which farms we should consider
for the residential development.
