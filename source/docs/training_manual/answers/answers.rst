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

There should be two layers on your map:

* :guilabel:`places` and
* :guilabel:`streets`.

:ref:`Back to text <backlink-vector-load-shapefiles-1>`


.. _vector-load-from-database-1:

|basic| *Databases*
...............................................................................

All the vector layers should be loaded into the map. It probably won't look
nice yet:

.. image:: ../_static/vector/001.png
   :align: center

(We'll fix the ugly colors later.)

:ref:`Back to text <backlink-vector-load-from-database-1>`


|RF| *Symbology*
-------------------------------------------------------------------------------

.. _symbology-colors-1:

|basic| *Colors*
...............................................................................

* Verify that the colors are changing as you expect them to change.
* It is enough to change only the :guilabel:`rural` layer for now. An example
  is below, but may look different depending on the color you chose.

.. image:: ../_static/symbology/018.png
   :align: center

.. note::  If you want to work on only one layer at a time and don't want the
   other layers to distract you, you can hide a layer by clicking in the check
   box next to its name in the Layers list. If the box is blank, then the layer
   is hidden.

:ref:`Back to text <backlink-symbology-colors-1>`


.. _symbology-structure-1:

|basic| *Symbol Structure*
...............................................................................

Seen together, your rural and urban layers should look more or less like this:

.. image:: ../_static/symbology/020.png
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

* Customize your layers as you like, but remember that it has to be easy to
  tell different layers apart on the map.

Here's an example:

.. image:: ../_static/symbology/013.png
   :align: center

:ref:`Back to text <backlink-symbology-layers-1>`


.. _symbology-levels-1:

|moderate| *Symbol Levels*
...............................................................................

To make the required symbol, you need at least three symbol layers:

.. image:: ../_static/symbology/021.png
   :align: center

The lowest symbol layer is a broad, solid yellow line. On top of it there is a
slightly thinner solid dark gray or black line. The symbol layer on top is a
thin white dashed line.

* If your symbol layers resemble the above but you're not getting the result
  you want, check that your symbol levels look something like this:

  .. image:: ../_static/symbology/022.png
     :align: center

* Now your symbol should look like this:

  .. image:: ../_static/symbology/023.png
     :align: center

* Which, on the map, gives you this kind of effect:

  .. image:: ../_static/symbology/024.png
     :align: center

:ref:`Back to text <backlink-symbology-levels-1>`


.. _symbology-levels-2:

|hard| *Symbol Levels*
...............................................................................

* Adjust your symbol levels to these values:

.. image:: ../_static/symbology/026.png
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
values are unique for every object, and it contains no "null" values (i.e.,
fields with no value).

:ref:`Back to text <backlink-labels-attribute-data-1>`


|RF| *The Label Tool*
-------------------------------------------------------------------------------

.. _label-tool-1:

|moderate| *Label Customization* (Part 1)
...............................................................................

Your map should look like this:

.. image:: ../_static/labels/010.png
   :align: center

:ref:`Back to text <backlink-label-tool-1>`


.. _label-tool-2:

|moderate| *Label Customization* (Part 2)
...............................................................................

One possible solution has this final product:

.. image:: ../_static/labels/015.png
   :align: center

To arrive at this result:

* Use the font type :kbd:`Arial` of size :kbd:`10` and a :guilabel:`Label
  distance` of :kbd:`1,5 mm`.
* In addition, this example uses the :guilabel:`Wrap label on character`
  option:

  .. image:: ../_static/labels/016.png
     :align: center

* Enter a :kbd:`space` in this field and click :guilabel:`Apply` to achieve the
  same effect.

:ref:`Back to text <backlink-label-tool-1>`


.. _label-data-defined-1:

|hard| *Using Data Defined Settings*
...............................................................................

* Still in edit mode, set the :kbd:`FONT_SIZE` values to whatever you prefer.
  The example uses :kbd:`12` for towns, :kbd:`10` for suburbs and villages, and
  :kbd:`8` for the null entries.
* Remember to save changes and exit edit mode.
* In :guilabel:`Data defined settings`, do this:

  .. image:: ../_static/labels/026.png
     :align: center

  Your results, if using the above values, should be this:

  .. image:: ../_static/labels/027.png
     :align: center

:ref:`Back to text <backlink-label-data-defined-1>`


|RF| *Classification*
-------------------------------------------------------------------------------

.. _classification-refine-1:

|moderate| *Refine the Classification*
...............................................................................

* Use the same method as in the first exercise of the lesson to get rid of the
  lines:

  .. image:: ../_static/classification/027.png
     :align: center

The settings you used might not be the same, but with the values
:guilabel:`Classes` = :kbd:`7` and :guilabel:`Mode` = :guilabel:`Natural Breaks
(Jenks)` (and using the same colors, of course), the map will look like this:

.. image:: ../_static/classification/028.png
   :align: center

:ref:`Back to text <backlink-classification-refine-1>`


|RF| *Creating a New Vector Dataset*
-------------------------------------------------------------------------------

.. _create-vector-digitize-1:

|basic| *Digitizing*
...............................................................................

The symbology doesn't matter, but the results should look more or less like
this:

.. image:: ../_static/create_vector_data/017.png
   :align: center

:ref:`Back to text <backlink-create-vector-digitize-1>`


.. _create-vector-topology-3:

|moderate| *Topology: Avoid Intersections*
...............................................................................

Your map should look like this:

.. image:: ../_static/create_vector_data/071.png
   :align: center

:ref:`Back to text <backlink-create-vector-topology-3>`


.. _create-vector-topology-1:

|moderate| *Topology: Add Ring Tool*
...............................................................................

The exact shape doesn't matter, but you should be getting a hole in your
feature, like this one:

.. image:: ../_static/create_vector_data/056.png
   :align: center

* Undo your edit before continuing with the exercise for the next tool.

:ref:`Back to text <backlink-create-vector-topology-1>`


.. _create-vector-topology-2:

|moderate| *Topology: Add Part Tool*
...............................................................................

The exact shape and location doesn't matter, but you should be getting an extra
part on your feature, like this one:

.. image:: ../_static/create_vector_data/058.png
   :align: center

* Note that you first need to select the farm with the selection tool ...

  .. image:: ../_static/create_vector_data/059.png
     :align: center

  ... so that QGIS knows which feature to add the new part to.
* Undo your edit before continuing with the exercise for the next tool.

:ref:`Back to text <backlink-create-vector-topology-2>`


.. _create-vector-topology-4:

|hard| *Merge Features*
...............................................................................

* Use the feature with the :guilabel:`id` of :kbd:`1237` as the source of your
  attributes (click on its entry in the dialog, then click the :guilabel:`Take
  attributes from selected feature` button):

  .. image:: ../_static/create_vector_data/074.png
     :align: center

* Using :guilabel:`Merge Selected Features` will merge the attributes as well
  as the geometries:

   .. image:: ../_static/create_vector_data/075.png
     :align: center

  Whereas :guilabel:`Merge Attributes of Selected Features` will keep the
  geometries distinct, but give them the same attributes.

:ref:`Back to text <backlink-create-vector-topology-4>`


.. _create-vector-forms-1:

|moderate| *Forms*
...............................................................................

For the :guilabel:`TYPE`, there is obviously a limited amount of types that a
road can be, and if you check the attribute table for this layer, you'll see
that they are predefined.

* Set the widget to :guilabel:`Unique values` and leave :guilabel:`Editable` as
  :kbd:`False`:

  .. image:: ../_static/create_vector_data/030.png
     :align: center

* A road is either a one-way or it isn't, so :guilabel:`ONEWAY` should be a
  :guilabel:`Checkbox`.

Looking at the attribute table for :guilabel:`streets`, the value for when it's
not a one-way seems to be :guilabel:`NULL`, and when it is, it's
:guilabel:`yes`.

* Set those values:

  .. image:: ../_static/create_vector_data/031.png
     :align: center

* If you use the :guilabel:`Identify` tool on a street now while edit mode is
  active, the dialog you get should look like this:

  .. image:: ../_static/create_vector_data/032.png
     :align: center

:ref:`Back to text <backlink-create-vector-forms-1>`


|RF| *Vector Analysis*
-------------------------------------------------------------------------------

.. _vector-analysis-basic-1:

|basic| *Find Important Roads*
...............................................................................

Your layer should now have these roads:

.. image:: ../_static/vector_analysis/017.png
   :align: center

* Save this new layer (the same way you did before) under
  :kbd:`exercise_data/residential_development/`, as :kbd:`important_roads.shp`.
* Once the new layer has been added to your map, remove the old layer.
* If for some reason it gives you an error message saying that it can't add the
  layer to the map (this can happen), remember that you can add the layer
  yourself by using the :guilabel:`Add Vector Layer` button as you did before.

:ref:`Back to text <backlink-vector-analysis-basic-1>`

.. _vector-analysis-basic-2:

|basic| *Distance from High Schools*
...............................................................................

* Your buffer dialog should look like this:

  .. image:: ../_static/vector_analysis/024.png
     :align: center

  The :guilabel:`Buffer distance` is :kbd:`10000` meters (i.e., :kbd:`10`
  kilometers).

* The :guilabel:`Segments to approximate` value is set to :kbd:`20`. This is
  optional, but it's recommended, because it makes the output buffers look
  smoother.  Compare this:

  .. image:: ../_static/vector_analysis/025.png
     :align: center

  To this:

  .. image:: ../_static/vector_analysis/026.png
     :align: center

  The red circle is the buffer with :guilabel:`Segments to approximate` set to
  :kbd:`20`; the gray circle on top of it is the buffer with
  :guilabel:`Segments to approximate` set to :kbd:`5`.

:ref:`Back to text <backlink-vector-analysis-basic-2>`


|RF| *Raster Analysis*
-------------------------------------------------------------------------------

.. _raster-analysis-1:

|basic| *Calculate Aspect*
...............................................................................

* Set your :guilabel:`DEM (Terrain analysis)` dialog up like this:

  .. image:: ../_static/rasters/026.png
     :align: center

Your result:

.. image:: ../_static/rasters/027.png
   :align: center

:ref:`Back to text <backlink-raster-analysis-1>`


.. _raster-analysis-2:

|moderate| *Calculate Slope (less than 2 and 5 degrees)*
...............................................................................

* Set your :guilabel:`Raster calculator` dialog up like this:

  .. image:: ../_static/rasters/031.png
     :align: center

* For the 5 degree version, replace the :kbd:`2` in the expression and file
  name with :kbd:`5`.

Your results:

* 2 degrees:

  .. image:: ../_static/rasters/032.png
     :align: center

* 5 degrees:

  .. image:: ../_static/rasters/033.png
     :align: center

:ref:`Back to text <backlink-raster-analysis-2>`


|RF| *Completing the Analysis*
-------------------------------------------------------------------------------

.. _complete-analysis-1:

|moderate| *Raster to Vector*
...............................................................................

* Open the :guilabel:`Query` dialog by right-clicking on the
  :guilabel:`all_terrain` layer in the :guilabel:`Layers list`.
* Then build the query :kbd:`"suitable" = 1`.
* Click :guilabel:`OK` to filter out all the polygons where this condition
  isn't met.

When viewed over the original raster, the areas should overlap perfectly:

.. image:: ../_static/complete_analysis/002.png
   :align: center

* You can save this layer by right-clicking on the :guilabel:`all_terrain`
  layer in the :guilabel:`Layers list` and choosing :guilabel:`Save As...`,
  then continue as per the instructions.

:ref:`Back to text <backlink-complete-analysis-1>`


.. _complete-analysis-2:

|moderate| *Inspecting the Results*
...............................................................................

In this map, farms that are definitely not suitable are orange; farms that may
still be suitable are blue:

.. image:: ../_static/complete_analysis/002.png
   :align: center

The orange farms have almost no suitable terrain within them, and so can't be
used for the intended purpose.

:ref:`Back to text <backlink-complete-analysis-2>`


.. _complete-analysis-3:

|moderate| *Refining the Analysis*
...............................................................................

At the moment, your analysis should look like this (ignore the symbology):

.. image:: ../_static/complete_analysis/006.png
   :align: center

Consider a circular area, continuous for 350 meters in all directions.

.. image:: ../_static/complete_analysis/007.png
   :align: center

If it is greater than 350 meters in radius, then subtracting 350 meters from
its size (from all directions) will result in a part of it being left in the
middle.

.. image:: ../_static/complete_analysis/008.png
   :align: center

Therefore, you can run an *interior buffer* of 350 meters on your existing
:guilabel:`suitable_terrain` vector layer. In the output of the buffer
function, whatever remains of the original layer will represent areas where
there is suitable terrain for 350 meters beyond.

To demonstrate:

* Go to :menuselection:`Vector --> Geoprocessing Tools --> Buffer(s)` to open
  the Buffer(s) dialog.
* Set it up like this:

  .. image:: ../_static/complete_analysis/009.png
     :align: center

* Use the :guilabel:`suitable_terrain` layer with :kbd:`10` segments and a
  buffer distance of :kbd:`-350`. (The distance is automatically in meters
  because your map is using a projected CRS.)
* Save the output in :kbd:`exercise_data/residential_development/` as
  :kbd:`suitable_terrain_continuous350m.shp`.

Your results will look like this:

.. image:: ../_static/complete_analysis/010.png
   :align: center

* Now use the :guilabel:`Select by Location` tool (:menuselection:`Vector -->
  Research Tools --> Select by location`).
* Set up like this:

  .. image:: ../_static/complete_analysis/011.png
     :align: center

* Select features in :guilabel:`new_solution` that intersect features in
  :guilabel:`suitable_terrain_continuous350m.shp`.

This is the result:

.. image:: ../_static/complete_analysis/012.png
   :align: center

The yellow farms are selected.

* Save the selection under :kbd:`exercise_data/residential_development/` as
  :kbd:`final_answer.shp`.

The farms that meet the revised criteria are here:

.. image:: ../_static/complete_analysis/013.png
   :align: center


:ref:`Back to text <backlink-complete-analysis-3>`

|RF| *WMS*
-------------------------------------------------------------------------------

.. _wms-1:

|basic| *Adding Another WMS Layer*
...............................................................................

Your map should look like this:

.. image:: ../_static/online_resources/012.png
   :align: center

:ref:`Back to text <backlink-wms-1>`


.. _wms-2:

|moderate| *Adding a New WMS Server*
...............................................................................

* Use the same approach as before to add the new server and the appropriate
  layer as hosted on that server:

  .. image:: ../_static/online_resources/013.png
     :align: center

  .. image:: ../_static/online_resources/014.png
     :align: center

* If you zoom into the Swellendam area, you'll notice that this dataset has a
  low resolution:

.. image:: ../_static/online_resources/015.png
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

Result:

::

         name       |   street_name   |    geometry
  ------------------+-----------------+---------------
   Rusty Bedsprings | High street     | 
   QGIS Geek        | High street     | 
   Joe Bloggs       | New Main Street | 
   IP Knightly      | QGIS Road       | 
   Fault Towers     | QGIS Road       | POINT(33 -33)
  (5 rows)

As you can see, our constraint allows nulls to be added into the database.

:ref:`Back to text <backlink-simple-feature-3>`
