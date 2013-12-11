Preparing Exercise Data
=======================

.. note:: This process is intended for course conveners, or more experienced
  QGIS users who wish to create localised sample data sets for their course.
  Default data sets are provided with the Training Manual, but you may follow
  these instructions if you wish to replace the default data sets.

|hard| |TY|
--------------------------------------------------------------------------------

.. note:: These instructions assume you have a good knowledge of QGIS and are
  not intended to be used as teaching material.

If you wish to replace the default data set with localised data for your course,
this can easily be done with tools built into QGIS. The region you choose to use
should have a good mix of urban and rural areas, containing roads of differing
significance, area boundaries (such as nature reserves or farms) and surface
water, such as streams and rivers.

* Open a new QGIS project
* In the :guilabel:`Vector` menu dropdown, select
  :guilabel:`OpenStreetMap -> Download Data`. You can then manually enter the
  co-ordinates of the region you wish to use, or you can use an existing layer
  to set the co-ordinates.
* Choose a location to save the resulting .osm file and click :guilabel:`Ok`:

.. image:: /static/training_manual/foreword/set_osm_region.png
   :align: center

* You can then open the .osm file using the :guilabel:`Add Vector Layer` button.
  You may need to select :guilabel:`All files` in the browser window.
  Alternatively, you can drag and drop the file into the QGIS window.
* In the dialog which opens, select all the layers, *except* the
  :kbd:`other_relations` and :kbd:`multilinestrings` layer:

.. image:: /static/training_manual/foreword/select_osm_layers.png
   :align: center

This will load four layers into your map which relate to OSM's naming
conventions (you may need to zoom in/out to see the vector data).

.. image:: /static/training_manual/foreword/osm_data_loaded.png
   :align: center

We need to extract the useful data from these layers, rename them
and create corresponding shape files:

* First, double-click the :kbd:`multipolygons` layer to open the
  :guilabel:`Layer properties` dialog.
* In the :guilabel:`General` tab, click :guilabel:`Query Builder` to open the
  :guilabel:`Query builder` window.

This layer contains three fields whose we will need to extract for use
throughout the Training Manual:

* :kbd:`building`
* :kbd:`natural` (specifically, water)
* :kbd:`leisure`

You can sample the data your region contains in order to see what kind of
results your region will yield. If you find that "leisure" returns no result,
then feel free to exclude it.

You'll need to write filter expressions for each field to extract the data we
need. We'll use the "building" field as an example here:

* Enter the following expression into the text area:
  :kbd:`building != "NULL"` and click :guilabel:`Test` to see how many results
  the query will return. If the number of results is small, you may wish to
  have a look at the layer's :guilabel:`Attribute Table` to see what data OSM
  has returned for your region:

.. image:: /static/training_manual/foreword/building_query_builder.png
   :align: center

* Click :guilabel:`Ok` and you'll see that the layer elements which are not
  buildings have been removed from the map.

We now need to save the resulting data as a shapefile for you to use during your
course:

* Right-click the :guilabel:`multipolygons` layer and select
  :guilabel:`Save As...`
* Make sure the file type is :kbd:`ESRI Shapefile` and save the file in your
  new :kbd:`exercise_data` directory, under a directory called :kbd:`buildings`.
* Make sure :guilabel:`No Symbology` is selected (we'll add symbology as part of
  the course later on).
* You can also select :guilabel:`Add saved file to map`.

Once the :guilabel:`buildings` layer has been added to the map, you can repeat
the process for the :kbd:`natural` and :kbd:`leisure` fields using the following
expressions:

.. note:: Make sure you clear the previous filter (via the
   :guilabel:`Layer properties` dialog) from the
   :guilabel:`multipolygons` layer before proceeding with the next filter
   expression!

* :kbd:`natural`: "natural = 'water'"
* :kbd:`leisure`: "leisure != 'NULL'"

Each resulting data set should be saved under a separate directory in your new
:kbd:`exercise_data` directory (i.e. "water", "leisure").

You should then extract and save the following fields from the :kbd:`lines` and
:kbd:`points` layers to their corresponding directories:

* :kbd:`lines`:
  "highway != 'NULL'" to :kbd:`roads`, and
  "waterway != 'NULL'" to :kbd:`rivers`
* :kbd:`points`:
  "place != 'NULL'" to :kbd:`towns`

Once you have finished extracting the above data, you can remove the
:guilabel:`multipolygons`, :guilabel:`lines` and :guilabel:`points` layers.

You should now have a map which looks something like this (the symbology will
certainly be very different, but that is fine):

.. image:: /static/training_manual/foreword/post_osm_import.png
   :align: center

The important thing is that you have 6 layers matching those show above and that
all those layers have some data.
