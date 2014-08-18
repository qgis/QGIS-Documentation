Answer Sheet
===============================================================================

|RF| *Adding Your First Layer*
-------------------------------------------------------------------------------

.. _interface-preparation-1:

|basic| *Preparation*
...............................................................................

You should see a lot of lines, symbolizing roads. All these lines are in the
vector layer that you just loaded to create a basic map.

:ref:`Back to text <backlink-interface-preparation-1>`


|RF| *An Overview of the Interface*
-------------------------------------------------------------------------------

.. _interface-overview-1:

|basic| *Overview* (Part 1)
...............................................................................

Refer back to the image showing the interface layout and check that you
remember the names and functions of the screen elements.

:ref:`Back to text <backlink-interface-overview-1>`


.. _interface-overview-2:

|basic| *Overview* (Part 2)
...............................................................................

#. :guilabel:`Save as`
#. :guilabel:`Zoom to layer`
#. :guilabel:`Help`
#. :guilabel:`Rendering on/off`
#. :guilabel:`Measure line`

:ref:`Back to text <backlink-interface-overview-2>`


|RF| *Working with Vector Data*
-------------------------------------------------------------------------------

.. _vector-load-shapefiles-1:

|basic| *Shapefiles*
...............................................................................

There should be five layers on your map:

* :guilabel:`places`
* :guilabel:`water`
* :guilabel:`buildings`
* :guilabel:`rivers` and
* :guilabel:`roads`.

:ref:`Back to text <backlink-vector-load-shapefiles-1>`


.. _vector-load-from-database-1:

|basic| *Databases*
...............................................................................

All the vector layers should be loaded into the map. It probably won't look
nice yet though (we'll fix the ugly colors later).

:ref:`Back to text <backlink-vector-load-from-database-1>`


|RF| *Symbology*
-------------------------------------------------------------------------------

.. _symbology-colors-1:

|basic| *Colors*
...............................................................................

* Verify that the colors are changing as you expect them to change.
* It is enough to change only the :guilabel:`water` layer for now. An example
  is below, but may look different depending on the color you chose.

.. image:: /static/training_manual/symbology/answer_water_blue.png
   :align: center

.. note::  If you want to work on only one layer at a time and don't want the
   other layers to distract you, you can hide a layer by clicking in the check
   box next to its name in the Layers list. If the box is blank, then the layer
   is hidden.

:ref:`Back to text <backlink-symbology-colors-1>`


.. _symbology-structure-1:

|basic| *Symbol Structure*
...............................................................................

Your map should now look like this:

.. image:: /static/training_manual/symbology/answer_symbology1.png
   :align: center

If you are a Beginner-level user, you may stop here.

* Use the method above to change the colors and styles for all the remaining
  layers.
* Try using natural colors for the objects. For example, a road should not be
  red or blue, but can be gray or black.
* Also feel free to experiment with different :guilabel:`Fill Style` and
  :guilabel:`Border Style` settings for the polygons.

:ref:`Back to text <backlink-symbology-structure-1>`


.. _symbology-layers-1:

|moderate| *Symbol Layers*
...............................................................................

* Customize your :guilabel:`buildings` layer as you like, but remember that it
  has to be easy to tell different layers apart on the map.

Here's an example:

.. image:: /static/training_manual/symbology/answer_buildings_symbology.png
   :align: center

:ref:`Back to text <backlink-symbology-layers-1>`


.. _symbology-levels-1:

|moderate| *Symbol Levels*
...............................................................................

To make the required symbol, you need two symbol layers:

.. image:: /static/training_manual/symbology/answer_road_symbology.png
   :align: center

The lowest symbol layer is a broad, solid yellow line. On top of it there is a
slightly thinner solid gray line.

* If your symbol layers resemble the above but you're not getting the result
  you want, check that your symbol levels look something like this:

  .. image:: /static/training_manual/symbology/answer_road_symbol_levels.png
     :align: center

* Now your map should look like this:

  .. image:: /static/training_manual/symbology/target_road_symbology.png
     :align: center

:ref:`Back to text <backlink-symbology-levels-1>`


.. _symbology-levels-2:

|hard| *Symbol Levels*
...............................................................................

* Adjust your symbol levels to these values:

.. image:: /static/training_manual/symbology/answer_road_symbol_layers.png
   :align: center

* Experiment with different values to get different results.
* Open your original map again before continuing with the next exercise.

:ref:`Back to text <backlink-symbology-levels-2>`


|RF| *Attribute Data*
-------------------------------------------------------------------------------

.. _labels-attribute-data-1:

|basic| *Attribute Data*
...............................................................................

The *NAME* field is the most useful to show as labels. This is because all its
values are unique for every object and are very unlikely to contain *NULL*
values. If your data contains some *NULL* values, do not worry as long as most
of your places have names.

:ref:`Back to text <backlink-labels-attribute-data-1>`


|RF| *The Label Tool*
-------------------------------------------------------------------------------

.. _label-tool-1:

|moderate| *Label Customization* (Part 1)
...............................................................................

Your map should now show the marker points and the labels should be offset by
:kbd:`2.0 mm`: The style of the markers and labels should allow both to be
clearly visible on the map:

.. image:: /static/training_manual/labels/customised_labels_one.png
   :align: center

:ref:`Back to text <backlink-label-tool-1>`


.. _label-tool-2:

|moderate| *Label Customization* (Part 2)
...............................................................................

One possible solution has this final product:

.. image:: /static/training_manual/labels/possible_outcome_map.png
   :align: center

To arrive at this result:

* Use a font size of :kbd:`10`, a :guilabel:`Label
  distance` of :kbd:`1,5 mm`, :guilabel:`Symbol width` and
  :guilabel:`Symbol size` of :kbd:`3.0 mm`.
* In addition, this example uses the :guilabel:`Wrap label on character`
  option:

  .. image:: /static/training_manual/labels/wrap_character_settings.png
     :align: center

* Enter a :kbd:`space` in this field and click :guilabel:`Apply` to achieve the
  same effect. In our case, some of the place names are very long, resulting in
  names with multiple lines which is not very user friendly. You might find this
  setting to be more appropriate for your map.

:ref:`Back to text <backlink-label-tool-1>`


.. _label-data-defined-1:

|hard| *Using Data Defined Settings*
...............................................................................

* Still in edit mode, set the :kbd:`FONT_SIZE` values to whatever you prefer.
  The example uses :kbd:`16` for towns, :kbd:`14` for suburbs, :kbd:`12` for
  localities and :kbd:`10` for hamlets.
* Remember to save changes and exit edit mode.
* Return to the :guilabel:`Text` formatting options for the :guilabel:`places`
  layer and select :kbd:`FONT_SIZE` in the :guilabel:`Attribute field` of the
  font size data override dropdown:

  .. image:: /static/training_manual/labels/font_size_override.png
     :align: center

  Your results, if using the above values, should be this:

  .. image:: /static/training_manual/labels/font_override_results.png
     :align: center

:ref:`Back to text <backlink-label-data-defined-1>`


|RF| *Classification*
-------------------------------------------------------------------------------

.. _classification-refine-1:

|moderate| *Refine the Classification*
...............................................................................

* Use the same method as in the first exercise of the lesson to get rid of the
  borders:

  .. image:: /static/training_manual/classification/gradient_map_no_pen.png
     :align: center

The settings you used might not be the same, but with the values
:guilabel:`Classes` = :kbd:`6` and :guilabel:`Mode` = :guilabel:`Natural Breaks
(Jenks)` (and using the same colors, of course), the map will look like this:

.. image:: /static/training_manual/classification/gradient_map_new_mode.png
   :align: center

:ref:`Back to text <backlink-classification-refine-1>`


|RF| *Creating a New Vector Dataset*
-------------------------------------------------------------------------------

.. _create-vector-digitize-1:

|basic| *Digitizing*
...............................................................................

The symbology doesn't matter, but the results should look more or less like
this:

.. image:: /static/training_manual/create_vector_data/routes_layer_result.png
   :align: center

:ref:`Back to text <backlink-create-vector-digitize-1>`


.. _create-vector-topology-3:

|moderate| *Topology: Add Ring Tool*
...............................................................................

The exact shape doesn't matter, but you should be getting a hole in the middle
of your feature, like this one:

.. image:: /static/training_manual/create_vector_data/ring_tool_result.png
   :align: center

* Undo your edit before continuing with the exercise for the next tool.

:ref:`Back to text <backlink-create-vector-topology-1>`


.. _create-vector-topology-2:

|moderate| *Topology: Add Part Tool*
...............................................................................

* First select the |largeLandUseArea|:

.. image:: /static/training_manual/create_vector_data/park_selected.png
   :align: center

* Now add your new part:

.. image:: /static/training_manual/create_vector_data/new_park_area.png
   :align: center

* Undo your edit before continuing with the exercise for the next tool.

:ref:`Back to text <backlink-create-vector-topology-2>`


.. _create-vector-topology-4:

|hard| *Merge Features*
...............................................................................

* Use the :guilabel:`Merge Selected Features` tool, making sure to first select
  both of the polygons you wish to merge.
* Use the feature with the :guilabel:`OGC_FID` of :kbd:`1` as the source of your
  attributes (click on its entry in the dialog, then click the :guilabel:`Take
  attributes from selected feature` button):

.. note:: If you're using a different dataset, it is highly likely that your
   original polygon's :guilabel:`OGC_FID` will not be :kbd:`1`. Just choose the
   feature which has an :guilabel:`OGC_FID`.

  .. image:: /static/training_manual/create_vector_data/merge_feature_dialog.png
     :align: center

.. Note:: Using the :guilabel:`Merge Attributes of Selected Features` tool
  will keep the geometries distinct, but give them the same attributes.

:ref:`Back to text <backlink-create-vector-topology-4>`


.. _create-vector-forms-1:

|moderate| *Forms*
...............................................................................

For the :guilabel:`TYPE`, there is obviously a limited amount of types that a
road can be, and if you check the attribute table for this layer, you'll see
that they are predefined.

* Set the widget to :guilabel:`Value Map` and click
  :guilabel:`Load Data from Layer`.
* Select :guilabel:`roads` in the :guilabel:`Label` dropdown and
  :guilabel:`highway` for both the :guilabel:`Value` and :guilabel:`Description`
  options:

  .. image:: /static/training_manual/create_vector_data/value_map_settings.png
     :align: center

* Click :guilabel:`Ok` three times.
* If you use the :guilabel:`Identify` tool on a street now while edit mode is
  active, the dialog you get should look like this:

  .. image:: /static/training_manual/create_vector_data/highway_as_value_map.png
     :align: center

:ref:`Back to text <backlink-create-vector-forms-1>`


|RF| *Vector Analysis*
-------------------------------------------------------------------------------
.. _vector-analysis-basic-1:

|moderate| *Extract Your Layers from OSM Data*
...............................................................................

For the purpose of this exercise, the OSM layers which we are interested in are
:kbd:`multipolygons` and :kbd:`lines`. The :kbd:`multipolygons` layer contains
the data we need in order to produce the :kbd:`houses`, :kbd:`schools` and
:kbd:`restaurants` layers. The :kbd:`lines` layer contains the roads dataset.

The :guilabel:`Query Builder` is found in the layer properties:

  .. image:: /static/training_manual/vector_analysis/query_builder.png
     :align: center

Using the :guilabel:`Query Builder` against the :kbd:`multipolygon` layer,
create the following queries for the :kbd:`houses`, :kbd:`schools`,
:kbd:`restaurants` and :kbd:`residential` layers:

  .. image:: /static/training_manual/vector_analysis/houses_query.png
     :align: center

  .. image:: /static/training_manual/vector_analysis/schools_query.png
     :align: center

  .. image:: /static/training_manual/vector_analysis/restaurants_query.png
     :align: center

Once you have entered each query, click :guilabel:`OK`. You'll see that the map
updates to show only the data you have selected. Since you need to use again
the :kbd:`multipolygon` data from the OSM dataset, at this point, you can use one of
the following methods:

* Rename the filtered OSM layer and re-import the layer from :kbd:`osm_data.osm`, OR
* Duplicate the filtered layer, rename the copy, clear the query and create your
  new query in the :guilabel:`Query Builder`.

.. note:: Although OSM's :kbd:`building` field has a :kbd:`house` value, the
    coverage in your area - as in ours - may not be complete. In our test
    region, it is therefore more accurate to *exclude* all buildings which are
    defined as anything other than :kbd:`house`. You may decide to
    simply include buildings which are defined as :kbd:`house` and all other
    values that have not a clear meaning like :kbd:`yes`.

To create the :kbd:`roads` layer, build this query against OSM's :kbd:`lines`
layer:

  .. image:: /static/training_manual/vector_analysis/roads_query.png
     :align: center


You should end up with a map which looks similar to the following:

  .. image:: /static/training_manual/vector_analysis/osm_queries_result.png
     :align: center

:ref:`Back to text <backlink-vector-analysis-basic-1>`

.. _vector-analysis-basic-2:

|basic| *Distance from High Schools*
...............................................................................

* Your buffer dialog should look like this:

  .. image:: /static/training_manual/vector_analysis/schools_buffer_setup.png
     :align: center

  The :guilabel:`Buffer distance` is :kbd:`1000` meters (i.e., :kbd:`1`
  kilometer).

* The :guilabel:`Segments to approximate` value is set to :kbd:`20`. This is
  optional, but it's recommended, because it makes the output buffers look
  smoother.  Compare this:

  .. image:: /static/training_manual/vector_analysis/schools_buffer_5.png
     :align: center

  To this:

  .. image:: /static/training_manual/vector_analysis/schools_buffer_20.png
     :align: center

The first image shows the buffer with the :guilabel:`Segments to approximate`
value set to :kbd:`5` and the second shows the value set to :kbd:`20`. In our
example, the difference is subtle, but you can see that the buffer's edges are
smoother with the higher value.

:ref:`Back to text <backlink-vector-analysis-basic-2>`

.. _vector-analysis-basic-3:

|basic| *Distance from Restaurants*
...............................................................................

To create the new :kbd:`houses_restaurants_500m` layer, we go through a two step
process:

* First, create a buffer of 500m around the restaurants and add the layer to
  the map:

  .. image:: /static/training_manual/vector_analysis/restaurants_buffer.png
     :align: center

  .. image:: /static/training_manual/vector_analysis/restaurants_buffer_result.png
     :align: center

* Next, select buildings within that buffer area:

  .. image:: /static/training_manual/vector_analysis/select_within_restaurants.png
     :align: center

* Now save that selection to our new :kbd:`houses_restaurants_500m` layer:

  .. image:: /static/training_manual/vector_analysis/save_selection_restaurants.png
     :align: center

Your map should now show only those buildings which are within 50m of a road,
1km of a school and 500m of a restaurant:

  .. image:: /static/training_manual/vector_analysis/restaurant_buffer_result.png
     :align: center

:ref:`Back to text <backlink-vector-analysis-basic-3>`

|RF| *Raster Analysis*
-------------------------------------------------------------------------------

.. _raster-analysis-1:

|basic| *Calculate Aspect*
...............................................................................

* Set your :guilabel:`DEM (Terrain analysis)` dialog up like this:

  .. image:: /static/training_manual/rasters/answer_dem_aspect.png
     :align: center

Your result:

.. image:: /static/training_manual/rasters/answer_aspect_result.png
   :align: center

:ref:`Back to text <backlink-raster-analysis-1>`


.. _raster-analysis-2:

|moderate| *Calculate Slope (less than 2 and 5 degrees)*
...............................................................................

* Set your :guilabel:`Raster calculator` dialog up like this:

  .. image:: /static/training_manual/rasters/answer_raster_calculator_slope.png
     :align: center

* For the 5 degree version, replace the :kbd:`2` in the expression and file
  name with :kbd:`5`.

Your results:

* 2 degrees:

  .. image:: /static/training_manual/rasters/answer_2degree_result.png
     :align: center

* 5 degrees:

  .. image:: /static/training_manual/rasters/answer_5degree_result.png
     :align: center

:ref:`Back to text <backlink-raster-analysis-2>`


|RF| *Completing the Analysis*
-------------------------------------------------------------------------------

.. _complete-analysis-1:

|moderate| *Raster to Vector*
...............................................................................

* Open the :guilabel:`Query Builder` by right-clicking on the :guilabel:`all_terrain`
  layer in the :guilabel:`Layers list`, select the :guilabel:`General` tab.
* Then build the query :kbd:`"suitable" = 1`.
* Click :guilabel:`OK` to filter out all the polygons where this condition
  isn't met.

When viewed over the original raster, the areas should overlap perfectly:

.. image:: /static/training_manual/complete_analysis/002.png
   :align: center

* You can save this layer by right-clicking on the :guilabel:`all_terrain`
  layer in the :guilabel:`Layers list` and choosing :guilabel:`Save As...`,
  then continue as per the instructions.

:ref:`Back to text <backlink-complete-analysis-1>`


.. _complete-analysis-2:

|moderate| *Inspecting the Results*
...............................................................................

You may notice that some of the buildings in your :kbd:`new_solution` layer have
been "sliced" by the :guilabel:`Intersect` tool. This shows that only part of the
building - and therefore only part of the property - lies on suitable terrain.
We can therefore sensibly eliminate those buildings from our dataset

:ref:`Back to text <backlink-complete-analysis-2>`


.. _complete-analysis-3:

|moderate| *Refining the Analysis*
...............................................................................

At the moment, your analysis should look something like this:

.. image:: /static/training_manual/complete_analysis/new_solution_example.png
   :align: center

Consider a circular area, continuous for 100 meters in all directions.

.. image:: /static/training_manual/complete_analysis/circle_100.png
   :align: center

If it is greater than 100 meters in radius, then subtracting 100 meters from
its size (from all directions) will result in a part of it being left in the
middle.

.. image:: /static/training_manual/complete_analysis/circle_with_remainder.png
   :align: center

Therefore, you can run an *interior buffer* of 100 meters on your existing
:guilabel:`suitable_terrain` vector layer. In the output of the buffer
function, whatever remains of the original layer will represent areas where
there is suitable terrain for 100 meters beyond.

To demonstrate:

* Go to :menuselection:`Vector --> Geoprocessing Tools --> Buffer(s)` to open
  the Buffer(s) dialog.
* Set it up like this:

  .. image:: /static/training_manual/complete_analysis/suitable_terrain_buffer.png
     :align: center

* Use the :guilabel:`suitable_terrain` layer with :kbd:`10` segments and a
  buffer distance of :kbd:`-100`. (The distance is automatically in meters
  because your map is using a projected CRS.)
* Save the output in :kbd:`exercise_data/residential_development/` as
  :kbd:`suitable_terrain_continuous100m.shp`.
* If necessary, move the new layer above your original :kbd:`suitable_terrain`
  layer.

Your results will look like something like this:

.. image:: /static/training_manual/complete_analysis/suitable_buffer_results.png
   :align: center

* Now use the :guilabel:`Select by Location` tool (:menuselection:`Vector -->
  Research Tools --> Select by location`).
* Set up like this:

  .. image:: /static/training_manual/complete_analysis/select_by_location.png
     :align: center

* Select features in :guilabel:`new_solution` that intersect features in
  :guilabel:`suitable_terrain_continuous100m.shp`.

This is the result:

.. image:: /static/training_manual/complete_analysis/buffer_select_result.png
   :align: center

The yellow buildings are selected. Although some of the buildings fall partly
outside the new :kbd:`suitable_terrain_continuous100m` layer, they lie well
within the original :kbd:`suitable_terrain` layer and therefore meet all of our
requirements.

* Save the selection under :kbd:`exercise_data/residential_development/` as
  :kbd:`final_answer.shp`.


:ref:`Back to text <backlink-complete-analysis-3>`

|RF| *WMS*
-------------------------------------------------------------------------------

.. _wms-1:

|basic| *Adding Another WMS Layer*
...............................................................................

Your map should look like this (you may need to re-order the layers):

.. image:: /static/training_manual/online_resources/geology_layer_result.png
   :align: center

:ref:`Back to text <backlink-wms-1>`


.. _wms-2:

|moderate| *Adding a New WMS Server*
...............................................................................

* Use the same approach as before to add the new server and the appropriate
  layer as hosted on that server:

  .. image:: /static/training_manual/online_resources/add_ogc_server.png
     :align: center

  .. image:: /static/training_manual/online_resources/add_bluemarble_layer.png
     :align: center

* If you zoom into the |majorUrbanName| area, you'll notice that this dataset has a
  low resolution:

.. image:: /static/training_manual/online_resources/low_resolution_dataset.png
   :align: center

Therefore, it's better not to use this data for the current map. The Blue
Marble data is more suitable at global or national scales.

:ref:`Back to text <backlink-wms-2>`


.. _wms-3:

|moderate| *Finding a WMS Server*
...............................................................................

You may notice that many WMS servers are not always available. Sometimes this
is temporary, sometimes it is permanent. An example of a WMS server that worked
at the time of writing is the :guilabel:`World Mineral Deposits` WMS at
:kbd:`http://apps1.gdr.nrcan.gc.ca/cgi-bin/worldmin_en-ca_ows`. It does not
require fees or have access constraints, and it is global. Therefore, it does
satisfy the requirements. Keep in mind, however, that this is merely an
example. There are many other WMS servers to choose from.

:ref:`Back to text <backlink-wms-3>`


|RF| *Database Concepts*
-------------------------------------------------------------------------------

.. _database-concepts-1:

|basic| *Address Table Properties*
...............................................................................

For our theoretical address table, we might want to store the following
properties::

    House Number
    Street Name
    Suburb Name
    City Name
    Postcode
    Country

When creating the table to represent an address object, we would create columns
to represent each of these properties and we would name them with SQL-compliant
and possibly shortened names::

    house_number
    street_name
    suburb
    city
    postcode
    country

:ref:`Back to text <backlink-database-concepts-1>`

.. _database-concepts-2:

|basic| *Normalising the People Table*
...............................................................................

The major problem with the `people` table is that there is a single address
field which contains a person's entire address. Thinking about our theoretical
`address` table earlier in this lesson, we know that an address is made up of
many different properties. By storing all these properties in one field, we make
it much harder to update and query our data. We therefore need to split the
address field into the various properties. This would give us a table which has
the following structure::

  id |     name      | house_no |  street_name   |    city    |   phone_no
   --+---------------+----------+----------------+------------+-----------------
   1 | Tim Sutton    |     3    | Buirski Plein  | Swellendam | 071 123 123
   2 | Horst Duester |     4    | Avenue du Roix | Geneva     | 072 121 122


.. note:: In the next section, you will learn about Foreign Key relationships
  which could be used in this example to further improve our database's
  structure.

:ref:`Back to text <backlink-database-concepts-2>`

.. _database-concepts-3:

|moderate| *Further Normalisation of the People Table*
...............................................................................

Our `people` table currently looks like this::

   id |     name     | house_no | street_id |  phone_no
   ---+--------------+----------+-----------+-------------
    1 | Horst Duster |        4 |         1 | 072 121 122

The :kbd:`street_id` column represents a 'one to many' relationship between the
`people` object and the related `street` object, which is in the `streets`
table.

One way to further normalise the table is to split the name field into
*first_name* and *last_name*::

    id | first_name | last_name  | house_no | street_id |  phone_no
    ---+------------+------------+----------+-----------+------------
     1 |    Horst   |   Duster   |     4    |     1     | 072 121 122

We can also create separate tables for the town or city name and country,
linking them to our `people` table via 'one to many' relationships::

    id | first_name | last_name | house_no | street_id | town_id | country_id
    ---+------------+-----------+----------+-----------+---------+------------
     1 |    Horst   |   Duster  |     4    |     1     |    2    |     1


An ER Diagram to represent this would look like this:

.. image:: /static/training_manual/database_concepts/er-people-normalised-example.png
   :align: center

:ref:`Back to text <backlink-database-concepts-3>`

.. _database-concepts-4:

|moderate| *Create a People Table*
...............................................................................

The SQL required to create the correct people table is::

  create table people (id serial not null primary key,
                       name varchar(50),
                       house_no int not null,
                       street_id int not null,
                       phone_no varchar null );

The schema for the table (enter :kbd:`\d people`) looks like this::

  Table "public.people"

  Column     |         Type          |                      Modifiers
  -----------+-----------------------+-------------------------------------
  id         | integer               | not null default
             |                       | nextval('people_id_seq'::regclass)
  name       | character varying(50) |
  house_no   | integer               | not null
  street_id  | integer               | not null
  phone_no   | character varying     |
  Indexes:
    "people_pkey" PRIMARY KEY, btree (id)

.. note::  For illustration purposes, we have purposely omitted the fkey
    constraint.

:ref:`Back to text <backlink-database-concepts-4>`

.. _database-concepts-5:

|basic| *The DROP Command*
...............................................................................

The reason the DROP command would not work in this case is because the `people`
table has a Foreign Key constraint to the `streets` table. This means that
dropping (or deleting) the `streets` table would leave the `people` table with
references to non-existent `streets` data.

.. note:: It is possible to 'force' the `streets` table to be deleted by using
  the `CASCADE` command, but this would also delete the `people` and any other
  table which had a relationship to the `streets` table. Use with caution!

:ref:`Back to text <backlink-database-concepts-5>`

.. _database-concepts-6:

|basic| *Insert a New Street*
...............................................................................

The SQL command you should use looks like this (you can replace the street name
with a name of your choice)::

    insert into streets (name) values ('Low Road');

:ref:`Back to text <backlink-database-concepts-6>`

.. _database-concepts-7:

|moderate| *Add a New Person With Foreign Key Relationship*
...............................................................................

Here is the correct SQL statement::

  insert into streets (name) values('Main Road');
  insert into people (name,house_no, street_id, phone_no)
    values ('Joe Smith',55,2,'072 882 33 21');

If you look at the streets table again (using a select statement as before),
you'll see that the :kbd:`id` for the :kbd:`Main Road` entry is :kbd:`2`.

That's why we could merely enter the number :kbd:`2` above. Even though we're
not seeing :kbd:`Main Road` written out fully in the entry above, the
database will be able to associate that with the :kbd:`street_id` value of
:kbd:`2`.

.. note:: If you have already added a new :kbd:`street` object, you might find
that the new :kbd:`Main Road` has an ID of :kbd:`3` not :kbd:`2`.

:ref:`Back to text <backlink-database-concepts-7>`

.. _database-concepts-8:


|moderate| *Return Street Names*
...............................................................................

Here is the correct SQL statement you should use::

  select count(people.name), streets.name
  from people, streets
  where people.street_id=streets.id
  group by streets.name;

Result::

     count |    name
     ------+-------------
         1 | Low Street
         2 | High street
         1 | Main Road
     (3 rows)

.. note::  You will notice that we have prefixed field names with table names
(e.g. people.name and streets.name). This needs to be done whenever the
   field name is ambiguous (i.e. not unique across all tables in the database).

:ref:`Back to text <backlink-database-concepts-8>`


|RF| *Spatial Queries*
-------------------------------------------------------------------------------

.. _spatial-queries-1:

|basic| *The Units Used in Spatial Queries*
...............................................................................

The units being used by the example query are degrees, because the CRS that the
layer is using is WGS 84. This is a Geographic CRS, which means that its units
are in degrees. A Projected CRS, like the UTM projections, is in meters.

Remember that when you write a query, you need to know which units the layer's
CRS is in. This will allow you to write a query that will return the results
that you expect.

:ref:`Back to text <backlink-spatial-queries-1>`


.. _spatial-queries-2:

|basic| *Creating a Spatial Index*
...............................................................................

::

  CREATE INDEX cities_geo_idx
    ON cities
    USING gist (the_geom);

:ref:`Back to text <backlink-spatial-queries-2>`


|RF| *Geometry Construction*
-------------------------------------------------------------------------------


.. _geometry-1:

|moderate| *Creating Linestrings*
...............................................................................

::

  alter table streets add column the_geom geometry;
  alter table streets add constraint streets_geom_point_chk check
       (st_geometrytype(the_geom) = 'ST_LineString'::text OR the_geom IS NULL);
  insert into geometry_columns values ('','public','streets','the_geom',2,4326,
       'LINESTRING');
  create index streets_geo_idx
    on streets
    using gist
    (the_geom);

:ref:`Back to text <backlink-geometry-1>`


.. _geometry-2:

|moderate| *Linking Tables*
...............................................................................

::

  delete from people;
  alter table people add column city_id int not null references cities(id);

(capture cities in QGIS)

::

  insert into people (name,house_no, street_id, phone_no, city_id, the_geom)
     values ('Faulty Towers',
             34,
             3,
             '072 812 31 28',
             1,
             'SRID=4326;POINT(33 33)');

  insert into people (name,house_no, street_id, phone_no, city_id, the_geom)
     values ('IP Knightly',
             32,
             1,
             '071 812 31 28',
             1,
             'SRID=4326;POINT(32 -34)');

  insert into people (name,house_no, street_id, phone_no, city_id, the_geom)
     values ('Rusty Bedsprings',
             39,
             1,
             '071 822 31 28',
             1,
             'SRID=4326;POINT(34 -34)');

If you're getting the following error message:

::

  ERROR:  insert or update on table "people" violates foreign key constraint
          "people_city_id_fkey"
  DETAIL: Key (city_id)=(1) is not present in table "cities".

then it means that while experimenting with creating polygons for the
cities table, you must have deleted some of them and started over. Just
check the entries in your cities table and use any :kbd:`id` which exists.

:ref:`Back to text <backlink-geometry-2>`

|RF| *Simple Feature Model*
-------------------------------------------------------------------------------


.. _simple-feature-1:

|moderate| *Populating Tables*
...............................................................................

::

  create table cities (id serial not null primary key,
                       name varchar(50),
                       the_geom geometry not null);
   alter table cities
   add constraint cities_geom_point_chk
   check (st_geometrytype(the_geom) = 'ST_Polygon'::text );

:ref:`Back to text <backlink-simple-feature-1>`


.. _simple-feature-2:

|moderate| *Populate the Geometry_Columns Table*
...............................................................................

::

  insert into geometry_columns values
        ('','public','cities','the_geom',2,4326,'POLYGON');

:ref:`Back to text <backlink-simple-feature-2>`


.. _simple-feature-3:

|hard| *Adding Geometry*
...............................................................................

::

  select people.name,
         streets.name as street_name,
         st_astext(people.the_geom) as geometry
  from   streets, people
  where  people.street_id=streets.id;

Result::

         name     | street_name |   geometry
    --------------+-------------+---------------
     Roger Jones  | High street |
     Sally Norman | High street |
     Jane Smith   | Main Road   |
     Joe Bloggs   | Low Street  |
     Fault Towers | Main Road   | POINT(33 -33)
    (5 rows)

As you can see, our constraint allows nulls to be added into the database.

:ref:`Back to text <backlink-simple-feature-3>`
