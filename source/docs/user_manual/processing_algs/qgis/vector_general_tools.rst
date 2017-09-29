.. only:: html

   |updatedisclaimer|

Vector general
==============

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _qgis_build_virtual_vector:

Build virtual vector
--------------------
This algorithm creates a virtual layer that contains a set of vector layer.
The output virtual layer will not be open in the current project.

This algorithm is especially useful in case another algorithm needs multiple
layers but accept only one vrt in which the layers are specified

Parameters
..........
``Input datasources`` [selection: vector any]
  Select the vector layers you want to use to build the virtual vector

``Create "unioned" VRT`` [boolean]
  Check if you want to unite all the vectors
  Default: *False*

Outputs
.......
``Virtual vector``
  The final virtual vector made by all the source vector chosen

Console usage
.............

::

  processing.runalg('qgis:deleteduplicategeometries', input, output)


.. _qgis_create_attribute_index:

Create attribute index
----------------------
Creates an index against a field of the attribute table to speed up queries.
The support for index creation depends on both the layer's data provider and the
field type.

No outputs are created: the index is stored on the layer itself.

Parameters
..........

``Input layer`` [vector: any]
  Vector layer

``Attribute to index`` [tablefield: any]
  Field of the vector layer

Console usage
.............

::

  processing.runalg('qgis:deleteduplicategeometries', input, output)



.. _qgis_create_spatial_index:

Create spatial index
--------------------
Creates an index to speed up queries made against a field in a table. Support for
index creation is dependent on the layer's data provider and the field type.

No new output layers are created.

Parameters
..........
``Input layer`` [vector: any]
  Vector layer in input

``Attribute to index`` [tablefield: any]
  Choose the attribute you want to index in order to speed up future queries.


Console usage
.............

::

  processing.runalg('qgis:deleteduplicategeometries', input, output)


.. _qgis_define_current_projection:

Define current projection
-------------------------
Useful when a layer is missing the `proj` file and you know the correct projection.

Final results are not visible directly on QGIS but the `prj` file is written in
the same directory of the input layer.

Parameters
..........
``Input layer`` [vector: any]
  Vector layer with missing projection information

``Output CRS`` [projection]
  The combo box will show the last CRS used in QGIS. If the desired CRS is missing
  you can search by clicking on the button

Console usage
.............

::

  processing.runalg('qgis:deleteduplicategeometries', input, output)


.. _qgis_delete_duplicate_geometries:

Delete duplicate geometries
---------------------------
This algorithm finds duplicated geometries and removes them.

Attributes are not checked, so in case two features have identical geometries
but different attributes, only one of them will be added to the result layer.

Parameters
..........
``Input layer`` [vector: any]
  The layer with duplicate geometries you want to clean


Output
......
``Cleaned`` [vector]
  The final layer without any duplicated geometries

Console usage
.............

::

  processing.runalg('qgis:deleteduplicategeometries', input, output)


.. _qgis_drop_geometries:

Drop geometries
---------------
Creates a simple geometryless copy of the input layer attribute table. It keeps
the attribute table of the source layer.

If the file is save in a local folder, the output will be a ``dbf`` file.

Parameters
..........
``Input layer`` [vector: any]
  Vector layer

Outputs
.......

``Dropped geometry`` [table]
  Geometryless table as a copy of the original attribute table.

Console usage
.............

::

  processing.runalg('qgis:deleteduplicategeometries', input, output)



.. _qgis_execute_sql:

Execute SQL
-----------
Run a simple or complex query with SQL syntax on the source layer.

The resulting query will be added as new layer.

Parameters
..........
``Additional input datasource`` [selection: vector any]
  Here you can choose a single layer to query or many different layers. In the
  SQL editor you can refer this layers with their **real** name or also with
  **input1**, **input2**, **inputN** depending on how many layer have been choosen

``SQL query`` [text]
  Type here the string of your SQL query

``Unique identifier field`` (optional)
  Specify the column with unique ID

``Geometry field`` (optional)
  Specify the geometry field

``Geometry type`` (optional)
  Choose the final geometry of the result. By default the algorith will autodetect
  it

  Default: *Autodetect*

``CRS`` (optional)
  Forse the output layer to be reprojected to another CRS


Output
......
``SQL Output`` [vector]
  Vector layer created by the query


Console usage
.............

::

  processing.runalg('qgis:deleteduplicategeometries', input, output)



.. _qgis_find_projection:

Find projection
---------------
This algorithm allows creation of a shortlist of possible candidate coordinate
reference systems for a layer with an unknown projection.

The expected area which the layer should reside in must be specified via the
target area parameter. Additionally, the coordinate reference system for this
target area must also be set.

The algorithm operates by testing the layer's extent in every known reference
system and listing any in which the bounds would fall near the target area if the
layer was in this projection.

Parameters
..........
``Input layer`` [vector: any]
  Layer with unknown projection

``Target area for layer`` [extent]
  This is the area in which the layer is expected to be

``Target area CRS`` [crs]
  Choose the target CRS of the target area selected

Output
......
``CRS candidates`` [table]
  The algorithm writes a table with all the CRS (EPSG codes) of the matching
  criteria


Console usage
.............

::

  processing.runalg('qgis:deleteduplicategeometries', input, output)



.. _qgis_join_attributes_by_location:

Join attributes by location
---------------------------
This algorithm takes an input vector layer and creates a new vector layer that is
an extended version of the input one, with additional attributes in its attribute
table.

The additional attributes and their values are taken from a second vector layer.
A spatial criteria is applied to select the values from the second layer that are
added to each feature from the first layer in the resulting one.

Parameters
..........
``Input layer`` [vector: any]
  Source vector layer

``Join layer`` [vector: any]
  the attributes of this vector layer will be **added** to the source layer
  attribute table

``Geometric predicate`` [checkbox]
  Check the geometric criteria.

  Options:

  * intersect
  * contains
  * equals
  * touches
  * overlaps
  * within
  * crossed

``Fields to add`` (optional) [tablefield]
  Select the specific fields you want to add. By defaul all the fields are added

``Join type`` [combobox]
  Choose the type of the final joined layer. If you want you can create one feature
  for each located feature or you can take the attributes of only the first feature
  located

``Discard records which could not be joined`` [boolean]
  Check if you don't want to add the features that cannot be joined

Output
......
``Joined layer`` [vector]
  The final vector with all the joined features.

Console usage
.............

::

  processing.runalg('qgis:deleteduplicategeometries', input, output)



.. _qgis_join_attributes_by_location_summary:

Join attributes by location (summary)
-------------------------------------
This algorithm takes an input vector layer and creates a new vector layer that is
an extended version of the input one, with additional attributes in its attribute
table.

The additional attributes and their values are taken from a second vector layer.
A spatial criteria is applied to select the values from the second layer that are
added to each feature from the first layer in the resulting one.

The algorithm calculates a statistical summary for the values from matching
features in the second layer (e.g. maximum value, mean value, etc).

Parameters
..........
``Input layer`` [vector: any]
  Source vector layer

``Join layer`` [vector: any]
  the attributes of this vector layer will be **added** to the source layer
  attribute table

``Geometric predicate`` [checkbox]
  Check the geometric criteria.

  Options:

  * intersect
  * contains
  * equals
  * touches
  * overlaps
  * within
  * crossed

``Fields to summarize`` (optional) [tablefield]
  Select the specific fields you want to add. By defaul all the fields are added

``Summaries to calculate`` (optional) [selection]
  Choose with type of summary you want to add to each field and for each fature.

  * count
  * unique
  * min
  * max
  * range
  * sum
  * mean
  * median
  * stddev
  * minority
  * majority
  * q1
  * q3
  * iqr
  * empty
  * filled
  * min_length
  * max_length
  * mean_length

``Discard records which could not be joined`` [boolean]
  Check if you don't want to add the features that cannot be joined

Output
......
``Joined layer`` [vector]
  The final vector with all the joined features.

Console usage
.............

::

  processing.runalg('qgis:deleteduplicategeometries', input, output)



.. _qgis_join_attributes_table:

Join attributes table
---------------------
This algorithm takes an input vector layer and creates a new vector layer that
is an extended version of the input one, with additional attributes in its attribute
table.

The additional attributes and their values are taken from a second vector layer.
An attribute is selected in each of them to define the join criteria.

Parameters
..........
``Input layer`` [vector: any]
  Source input vector layer. The final attribute table will be appended to **this**
  vector layer

``Input layer 2`` [vector: any]
  Layer with the attribute table to join

``Table field`` [tablefield]
  Field of the source layer with the unique identifier

``Table field 2`` [tablefield]
  Table of the joining layer with the common unique field identifier

Output
......
``Joined layer`` [vector]
  Final vector layer with the attribute table as result of the joining


Console usage
.............

::

  processing.runalg('qgis:deleteduplicategeometries', input, output)



.. _qgis_merge_vector_layers:

Merge vector layers
-------------------
This algorithm combines multiple vector layers of the **same geometry** type into
a single one.

If attributes tables are different, the attribute table of the resulting layer
will contain the attributes from all input layers. New attributes will be added
for the original layer name and source.

The layers will all be reprojected to match the coordinate reference system of
the first input layer.

.. figure:: /static/user_manual/processing_algs/qgis/merge_vector_layers.png
   :align: center

Parameters
..........

``Layers to merge`` [multipleinput: vector]
  All the layers that have to be merged into a single layer.

Outputs
.......

``Merged`` [vector]
  Merged vector layer.

Console usage
.............

::

  processing.runalg('qgis:mergevectorlayers', layer1, layer2, output)



.. _qgis_reproject_layer:

Reproject layer
---------------

Reprojects a vector layer in a different CRS. The reprojected layer will have
the same features and attributes of the input layer.

Parameters
..........

``Input layer`` [vector: any]
  Layer to reproject.

``Target CRS`` [crs]
  Destination coordinate reference system.

  Default: *EPSG:4326*

Outputs
.......

``Reprojected layer`` [vector]
  The resulting reprojected layer.

Console usage
.............

::

  processing.runalg('qgis:reprojectlayer', input, target_crs, output)


.. _qgis_save_selected_features:

Save selected features
----------------------
Saves the selected features as a new layer.

Parameters
..........

``Input layer`` [vector: any]
  Layer to save the selection from.

Outputs
.......

``Selection`` [vector]
  Vector layer with just the selected features.

Console usage
.............

::

  processing.runalg('qgis:saveselectedfeatures', input_layer, output_layer)



.. _qgis_set_style_for_vector_layer:

Set style for vector layer
--------------------------
Sets the style of a vector layer. The style must be defined in a
QML file.

This algorithm could be particularly useful in Processing models: if you have
some `qml` files saved in your computer you can easily assign them to the output
of the model.

No new output are created: the source layer is immediatly style with the `qml`
rules.

Parameters
..........
``Vector layer`` [vector: any]
  The layer you want to change the style

``Style file`` [file]
  `qml` file of the style


Console usage
.............

::

  # import processing
  import processing
  # define the parameters dictionary with all the input
  parameters = {'INPUT' : 'path_of_your_layer', 'STYLE': 'path_to_your_style'}
  # run the algorithm
  processing.runAndLoadResults('qgis:setstyleforvectorlayer', parameters)



.. _qgis_split_vector_layer:

Split vector layer
------------------
Creates a set of vectors in an output folder from an input layer and an attribute.
Each layer in the output folder contain all the features from the input layer that
matches the unique attribute chosen.

The number of files generated is equal to the number of different values found
for the specified attribute.

It is the opposite operation of *merging*.

Parameters
..........

``Input layer`` [vector: any]
  Vector layer

``Unique ID field`` [tablefield: any]
  Field of the attribute table on witch the layer will be split.

Outputs
.......

``Output directory`` [directory]
  Directory where all the split layer will be saved.

Console usage
.............

::

  processing.runalg('qgis:splitvectorlayer', input, field, output)



.. _qgis_truncate_table:

Truncate table
--------------
This algorithm truncates a layer, by deleting all features from within the layer.

**Warning** - this algorithm modifies the layer in place, and deleted features cannot
be restored!

Parameters
..........
``Input layer`` [vector: any]
  Vector layer in input

Console usage
.............

::

  # import processing
  import processing
  # define the parameters dictionary with all the input
  parameters = {'INPUT' : 'path_of_your_layer'}
  # run the algorithm
  processing.runAndLoadResults('qgis:truncatetable', parameters)
