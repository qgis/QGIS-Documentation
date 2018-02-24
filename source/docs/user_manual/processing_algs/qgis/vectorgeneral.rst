.. only:: html

   |updatedisclaimer|

Vector general
==============

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _qgisassignprojection:

Assign projection
-----------------
Assigns a new projection to a vector layer.

It creates a new layer with the exact same features and geometries as the input
one, but assigned to a new CRS. The geometries are **not** reprojected, they
are just assigned to a different CRS.

This algorithm can be used to repair layers which have been assigned an incorrect
projection.

Attributes are not modified by this algorithm.

Parameters
..........
``Input layer`` [vector: any]
  Vector layer with wrong or missing CRS

``Assigned CRS`` [projection]
  Select the new CRS to assign to the vector layer

  Default: *EPSG:4326 - WGS84*

Outputs
.......
``Assigned CRS`` [vector: any]
  Vector layer with assigned projection.

See also
........
:ref:`qgisfindprojection`, :ref:`qgisreprojectlayer`


.. _qgisbuildvirtualvector:

Build virtual vector
--------------------
Creates a virtual vector layer that contains a set of vector layer.
The output virtual vector layer will not be open in the current project.

This algorithm is especially useful in case another algorithm needs multiple
layers but accept only one ``vrt`` in which the layers are specified.

Parameters
..........
``Input datasources`` [multipleinput: vector]
  Select the vector layers you want to use to build the virtual vector

``Create "unioned" VRT`` [boolean]
  Check if you want to unite all the vectors in a single ``vrt`` file.

  Default: *False*

Outputs
.......
``Virtual vector``
  The final virtual vector made by all the source vector chosen


.. _qgiscreateattributeindex:

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


.. _qgiscreatespatialindex:

Create spatial index
--------------------
Creates an index to speed up access to the features in a layer based on their
spatial location. Support for spatial index creation is dependent on the layer's
data provider.

No new output layers are created.

Parameters
..........
``Input layer`` [vector: any]
  Vector layer in input


.. _qgisdefinecurrentprojection:

Define current projection
-------------------------
Takes a vector layer and changes the associated CRS. It is very useful when a layer
is missing the ``proj`` file and you know the correct projection.

Final results are not visible directly on QGIS but the ``prj`` file is written in
the same directory of the input layer.

Parameters
..........
``Input layer`` [vector: any]
  Vector layer with missing projection information

``Output CRS`` [projection]
  Output CRS associated with the source vector layer. The CRS information are
  written in the ``proj`` file.


.. _qgisdeleteduplicategeometries:

Delete duplicate geometries
---------------------------
Finds and removes duplicated geometries.

Attributes are not checked, so in case two features have identical geometries
but different attributes, only one of them will be added to the result layer.

Parameters
..........
``Input layer`` [vector: any]
  The layer with duplicate geometries you want to clean


Outputs
.......
``Cleaned`` [vector]
  The final layer without any duplicated geometries


.. _qgisdropgeometries:

Drop geometries
---------------
Creates a simple *geometryless* copy of the input layer attribute table. It keeps
the attribute table of the source layer.

If the file is saved in a local folder, you can choose between many file formats.

Parameters
..........
``Input layer`` [vector: any]
  Vector layer

Outputs
.......

``Dropped geometry`` [table]
  Geometryless table as a copy of the original attribute table.


.. _qgisexecutesql:

Execute SQL
-----------
Runs a simple or complex query with ``SQL`` syntax on the source layer.

The result of the query will be added as new layer.

Parameters
..........
``Additional input datasource`` [selection: vector]
  List of layers to query. In the   SQL editor you can refer this layers with
  their **real** name or also with   **input1**, **input2**, **inputN** depending
  on how many layers have been chosen.

``SQL query`` [text]
  Type here the string of your SQL query, e.g. ``SELECT * FROM input1``

``Unique identifier field`` (optional)
  Specify the column with unique ID

``Geometry field`` (optional)
  Specify the geometry field

``Geometry type`` (optional)
  Choose the final geometry of the result. By default the algorithm will autodetect
  it

  Default: *Autodetect*

``CRS`` (optional)
  The CRS to or assign to the output layer


Outputs
.......
``SQL Output`` [vector]
  Vector layer created by the query


.. _qgisfindprojection:

Find projection
---------------
Allows creation of a shortlist of possible candidate coordinate reference systems
for a layer with an unknown projection.

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

``Target area CRS`` [projection]
  Choose the target CRS of the target area selected

Outputs
.......
``CRS candidates`` [table]
  The algorithm writes a table with all the CRS (EPSG codes) of the matching
  criteria

See also
........
:ref:`qgisassignprojection`, :ref:`qgisreprojectlayer`


.. _qgisjoinattributesbylocation:

Join attributes by location
---------------------------
Takes an input vector layer and creates a new vector layer that is an extended
version of the input one, with additional attributes in its attribute table.

The additional attributes and their values are taken from a second vector layer.
A spatial criteria is applied to select the values from the second layer that are
added to each feature from the first layer.

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
  Select the specific fields you want to add. By default all the fields are added

``Join type`` [combobox]
  Choose the type of the final joined layer. If you want you can create one feature
  for each located feature or you can take the attributes of only the first feature
  located

``Discard records which could not be joined`` [boolean]
  Check if you don't want to add the features that cannot be joined

Outputs
.......
``Joined layer`` [vector]
  The final vector with all the joined features.

.. _qgisjoinbylocationsummary:

Join attributes by location (summary)
-------------------------------------
Takes an input vector layer and creates a new vector layer that is an extended
version of the input one, with additional attributes in its attribute table.

The additional attributes and their values are taken from a second vector layer.
A spatial criteria is applied to select the values from the second layer that are
added to each feature from the first layer.

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
  Select the specific fields you want to add. By default all the fields are added

``Summaries to calculate`` (optional) [selection]
  Choose which type of summary you want to add to each field and for each feature.

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

Outputs
.......
``Joined layer`` [vector]
  The final vector with all the joined features.


.. _qgisjoinattributestable:

Join attributes table
---------------------
Takes an input vector layer and creates a new vector layer that is an extended
version of the input one, with additional attributes in its attribute table.

The additional attributes and their values are taken from a second vector layer.
An attribute is selected in each of them to define the join criteria (one-to-one
relation).

Parameters
..........
``Input layer`` [vector: any]
  Source input vector layer. The final attribute table will be added to **this**
  vector layer

``Input layer 2`` [vector: any]
  Layer with the attribute table to join

``Table field`` [tablefield]
  Field of the source layer with the unique identifier

``Table field 2`` [tablefield]
  Table of the joining layer with the common unique field identifier

Outputs
.......
``Joined layer`` [vector]
  Final vector layer with the attribute table as result of the joining


.. _qgismergevectorlayers:

Merge vector layers
-------------------
Combines multiple vector layers of the **same geometry** type into a single one.

If attributes tables are different, the attribute table of the resulting layer
will contain the attributes from all input layers. Non-matching fields will be
appended at the end of the attribute table.

If any input layers contain Z or M values, then the output layer will also contain
these values. Similarly, if any of the input layers are multi-part, the output layer
will also be a multi-part layer.

Optionally, the destination coordinate reference system (CRS) for the merged layer
can be set. If it is not set, the CRS will be taken from the first input layer.
All layers will be reprojected to match this CRS.

.. figure:: /static/user_manual/processing_algs/qgis/merge_vector_layers.png
   :align: center

Parameters
..........

``Layers to merge`` [multipleinput: vector]
  All the layers that have to be merged into a single layer.

``Destination CRS`` [projection]
  Optional

  Optional parameter to choose the CRS of the output layer. If not specified the
  CRS of the first input layer is taken.

Outputs
.......

``Merged`` [vector]
  Merged vector layer containing all the features and attributes from input layers


.. _qgisorderbyexpression:

Order by expression
-------------------
Sorts a vector layer according to an expression: changes the feature index
according to an expression.

Be careful, it might not work as expected with some providers, the order might
not be kept every time.

Parameters
..........

``Input layer`` [vector: any]
  Vector layer to sort

``Expression`` [expression]
  Expression to use for the vector sorting

``Ascending`` [boolean]
  If checked the sorted vector layer will be sorted from the smallest to the
  biggest values found.

  Default: *True*

``Nulls first`` [boolean]
  If checked Null values are placed at the beginning of the sorted layer.

  Default: *False*

Outputs
.......

``Output layer`` [vector]
  Sorted vector layer


.. _qgisreprojectlayer:

Reproject layer
---------------
Reprojects a vector layer in a different CRS. The reprojected layer will have
the same features and attributes of the input layer.

Parameters
..........

``Input layer`` [vector: any]
  Layer to reproject.

``Target CRS`` [projection]
  Destination coordinate reference system.

  Default: *EPSG:4326*

Outputs
.......

``Reprojected layer`` [vector]
  The resulting reprojected layer.

See also
........
:ref:`qgisassignprojection`, :ref:`qgisfindprojection`


.. _qgissaveselectedfeatures:

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


.. _qgissetstyleforvectorlayer:

Set style for vector layer
--------------------------
Sets the style of a vector layer. The style must be defined in a
QML file.

No new output are created: the style is immediately assigned to the vector layer.

Parameters
..........
``Vector layer`` [vector: any]
  The layer you want to change the style

``Style file`` [file]
  ``qml`` file of the style


.. _qgissplitvectorlayer:

Split vector layer
------------------
Creates a set of vectors in an output folder based on an input layer and an attribute.
The output folder will contain as many layers as the unique values found in the
desired field.

The number of files generated is equal to the number of different values found
for the specified attribute.

It is the opposite operation of *merging*.

Parameters
..........

``Input layer`` [vector: any]
  Vector layer

``Unique ID field`` [tablefield: any]
  Field of the attribute table on which the layer will be split.

Outputs
.......

``Output directory`` [directory]
  Directory where all the split layer will be saved.

See also
........
:ref:`qgismergevectorlayers`


.. _qgistruncatetable:

Truncate table
--------------
Truncates a layer, by deleting all features from within the layer.

.. warning:: this algorithm modifies the layer in place, and deleted features cannot
  be restored!

Parameters
..........
``Input layer`` [vector: any]
  Vector layer in input
