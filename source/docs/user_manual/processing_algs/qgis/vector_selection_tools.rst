.. only:: html

   |updatedisclaimer|

Vector selection
================

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _qgis_extract_by_attribute:

Extract by attribute
--------------------
Creates two vector layers from an input layer: one will contain only matching
features while the second will contain all the non-matching features.

The criteria for adding features to the resulting layer is defined based on the
values of an attribute from the input layer.

Parameters
..........

``Input Layer`` [vector: any]
  Vector layer to extract features from

``Selection attribute`` [tablefield: any]
  Filtering field of the layer

``Operator`` [selection]
  Many different operators are available:

  * ``=``
  * ``!=``
  * ``>``
  * ``>=``
  * ``<``
  * ``<=``
  * ``begins with``
  * ``contains``

  Default: ``=``

``Value`` [string]
  Optional

  Value to be evaluated

Outputs
.......

``Extracted (attribute)`` [vector]
  Vector layer with matching features

``Extracted (non-matching)`` [vector]
  Vector layer with not matching features


.. _qgis_extract_by_expression:

Extract by expression
---------------------
Creates two vector layers from an input layer: one will contain only matching
features while the second will contain all the non-matching features.

The criteria for adding features to the resulting layer is based on a QGIS expression.

For more information about expressions see the :ref:`vector_expressions`

Parameters
..........

``Input Layer`` [vector: any]
  Input vector layer

``Expression`` [expression]
  Expression to filter the vector layer

Outputs
.......

``Matching features`` [vector]
  Vector layer with matching features

``Non-matching`` [vector]
  Vector layer with not matching features


.. _qgis_extract_by_location:

Extract by location
-------------------
Creates a new vector layer that only contains matching features from an input layer.

The criteria for adding features to the resulting layer is defined based on the
spatial relationship between each feature and the features in an additional layer.

Parameters
..........

``Extract features from`` [vector: any]
  Input vector layer

``Where the features intersect (geometric predicate)`` [multiple selection]
  Spatial condition for the selection:

  * disjoint
  * intersects
  * contains
  * equals
  * touches
  * overlaps
  * within
  * crosses

``By comparing to the features from`` [vector: any]
  Intersection vector layer


Output
......

``Extracted (location)``
  Vector layer of the spatial intersection


.. _qgis_random_extract:

Random extract
--------------
Takes a vector layer and generates a new one that contains only a subset of the
features in the input layer.

The subset is defined randomly, based on feature IDs, using a percentage or count
value to define the total number of features in the subset.

Parameters
..........

``Input layer`` [vector: any]
  Source vector layer to select the features from

``Method`` [selection]
  Method of the random selection:

  * Number of selected features
  * Percentage of selected features

  Default: *Number of selected features*

``Number/percentage of selected features`` [number]
  Number or the percentage of the features to select

  Default: *10*

Output
......

``Extracted (random)`` [vector]
  Vector layer containing random selected features


.. _qgis_random_extract_within_subsets:

Random extract within subsets
-----------------------------
Takes a vector layer and generates a new one that contains only a subset of the
features in the input layer.

The subset is defined randomly, based on feature IDs, using a percentage or count
value to define the total number of features in the subset.
The percentage/count value is not applied to the whole layer, but instead to each
category. Categories are defined according to a given attribute.

Parameters
..........

``Input layer`` [vector: any]
  Source vector layer to select the features from

``ID field`` [tablefield: any]
  Category of the source vector layer to select the features from

``Method`` [selection]
  Method of the random selection:

  * Number of selected features
  * Percentage of selected features

  Default: *Number of selected features*

``Number/percentage of selected features`` [number]
  Number or the percentage of the feature to select

  Default: *10*

Output
......

``Extracted (random stratified)`` [vector]
  Random vector layer


.. _qgis_random_selection:

Random selection
----------------
Takes a vector layer and selects a subset of its features. No new layer is generated
by this algorithm.

The subset is defined randomly, based on feature IDs, using a percentage or count
value to define the total number of features in the subset.

Parameters
..........

``Input layer`` [vector: any]
  Source vector layer to select the features from

``Method`` [selection]
  Method of the random selection:

  * Number of selected features
  * Percentage of selected features

  Default: *Number of selected features*

``Number/percentage of selected features`` [number]
  Number or the percentage of the feature to select

  Default: *10*


.. _qgis_random_selection_within_subsets:

Random selection within subsets
-------------------------------
Takes a vector layer and selects a subset of its features. No new layer is generated
by this algorithm.

The subset is defined randomly, based on feature IDs, using a percentage or count
value to define the total number of features in the subset.

The percentage/count value is not applied to the whole layer, but instead to each
category.

Categories are defined according to a given attribute, which is also specified as
an input parameter for the algorithm.

No new outputs are created.

Parameters
..........

``Input layer`` [vector: any]
  Source vector layer to select the features from

``ID field`` [tablefield: any]
  Category of the source vector layer

``Method`` [selection]
  Method of the random selection:

  * Number of selected features
  * Percentage of selected features

  Default: *Number of selected features*

``Number/percentage of selected features`` [number]
  Number or the percentage of the feature to select

  Default: *10*


.. _qgis_remove_null_geometries:

Remove null geometries
----------------------
Removes any features which do not have a geometry from a vector layer.

All other features will be copied unchanged.

The features with null geometries can be saved to a separate layer.

Parameters
..........
``Input layer`` [vector: any]
  Input vector layer with NULL geometries

Outputs
.......

``Non null geometries`` [vector]
  Vector layer without NULL geometries

``Null geometries`` [vector]
  Vector layer with only NULL geometries


.. _qgis_select_by_attribute:

Select by attribute
-------------------
Creates a selection in a vector layer.

The criteria for selected features is defined based on the values of an attribute
from the input layer.

No new outputs are created.

Parameters
..........

``Input Layer`` [vector: any]
  Input vector layer

``Selection attribute`` [tablefield: any]
  Filtering field of the layer

``Operator`` [selection]
  Many different operators are available:

  * ``=``
  * ``!=``
  * ``>``
  * ``>=``
  * ``<``
  * ``<=``
  * ``begins with``
  * ``contains``

  Default: ``=``

``Value`` [string]
  Optional

  Values to be evaluated


.. _qgis_select_by_expression:

Select by expression
--------------------
Creates a selection in a vector layer. The criteria for selecting
features is based on a QGIS expression. For more information about expressions
see the :ref:`vector_expressions`

No new outputs are created.

Parameters
..........

``Input Layer`` [vector: any]
  Input vector layer

``Expression`` [expression]
  Expression to filter the vector layer

``Modify current selection by`` [selection]
  How the selection of the algorithm should be managed. You have many options:

  * creating new selection
  * adding to current selection
  * removing from current selection
  * selecting within current selection

  Default: *creating new selection*


.. _qgis_select_by_location:

Select by location
------------------
Creates a selection in a vector layer. The criteria for selecting
features is based on the spatial relationship between each feature and
the features in an additional layer.

No new outputs are created.

Parameters
..........

``Extract features from`` [vector: any]
  Source vector layer

``Where the features intersect (geometric predicate)`` [multiple selection]
  Spatial condition for the selection:

  * disjoint
  * intersects
  * contains
  * equals
  * touches
  * overlaps
  * within
  * crosses

``By comparing to the features from`` [vector: any]
  Intersection vector layer

``Modify current selection by`` [selection]
  How the selection of the algorithm should be managed. You have many options:

  * creating new selection
  * adding to current selection
  * removing from current selection
  * selecting within current selection

  Default: *creating new selection*
