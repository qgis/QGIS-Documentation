.. only:: html

   |updatedisclaimer|

Vector selection
================

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _qgisextractbyattribute:

Extract by attribute
--------------------
Creates two vector layers from an input layer: one will contain only matching
features while the second will contain all the non-matching features.

The criteria for adding features to the resulting layer is defined based on the
values of an attribute from the input layer.

Parameters
..........

``Input Layer`` [vector: any]
  Vector layer to extract features from.

``Selection attribute`` [tablefield: any]
  Filtering field of the layer.

``Operator`` [enumeration]
  Many different operators are available:

  * 0 --- =
  * 1 --- ≠
  * 2 --- >
  * 3 --- >=
  * 4 --- <
  * 5 --- <=
  * 6 --- begins with
  * 7 --- contains
  * 8 --- is null
  * 9 --- is not null
  * 10 --- does not contain

  Default: ``0``

``Value`` [string]
  Optional

  Value to be evaluated.

Outputs
.......

``Extracted (attribute)`` [vector: any]
  Vector layer with matching features.

``Extracted (non-matching)`` [vector: any]
  Vector layer with not matching features.


.. _qgisextractbyexpression:

Extract by expression
---------------------
Creates two vector layers from an input layer: one will contain only matching
features while the second will contain all the non-matching features.

The criteria for adding features to the resulting layer is based on a QGIS expression.

For more information about expressions see the :ref:`vector_expressions`.

Parameters
..........

``Input Layer`` [vector: any]
  Input vector layer.

``Expression`` [expression]
  Expression to filter the vector layer.

Outputs
.......

``Matching features`` [vector: any]
  Vector layer with matching features.

``Non-matching`` [vector: any]
  Vector layer with not matching features.


.. _qgisextractbylocation:

Extract by location
-------------------
Creates a new vector layer that only contains matching features from an input layer.

The criteria for adding features to the resulting layer is defined based on the
spatial relationship between each feature and the features in an additional layer.

Parameters
..........

``Extract features from`` [vector: any]
  Input vector layer.

``Where the features (geometric predicate)`` [enumeration] [list]
  Spatial condition for the selection.

  Options:

  * 0 --- intersect
  * 1 --- contain
  * 2 --- disjoint
  * 3 --- equal
  * 4 --- touch
  * 5 --- overlap
  * 6 --- are within
  * 7 --- cross

  Default: *0*

``By comparing to the features from`` [vector: any]
  Intersection vector layer.


Outputs
.......

``Extracted (location)`` [vector: any]
  Vector layer of the spatial intersection.


.. _qgisrandomextract:

Random extract
--------------
Takes a vector layer and generates a new one that contains only a subset of the
features in the input layer.

The subset is defined randomly, based on feature IDs, using a percentage or count
value to define the total number of features in the subset.

Parameters
..........

``Input layer`` [vector: any]
  Source vector layer to select the features from.

``Method`` [enumeration]
  Method of the random selection:

  * 0 --- Number of selected features
  * 1 --- Percentage of selected features

  Default: *0*

``Number/percentage of selected features`` [number]
  Number or percentage of features to select.

  Default: *10*

Outputs
.......

``Extracted (random)`` [vector: any]
  Vector layer containing random selected features.


.. _qgisrandomextractwithinsubsets:

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
  Source vector layer to select the features from.

``ID field`` [tablefield: any]
  Category of the source vector layer to select the features from.

``Method`` [enumeration]
  Method of the random selection:

  * 0 --- Number of selected features
  * 1 --- Percentage of selected features

  Default: *0*

``Number/percentage of selected features`` [number]
  Number or percentage of features to select.

  Default: *10*

Outputs
.......

``Extracted (random stratified)`` [vector: any]
  Vector layer containing random selected features.


.. _qgisrandomselection:

Random selection
----------------
Takes a vector layer and selects a subset of its features. No new layer is generated
by this algorithm.

The subset is defined randomly, based on feature IDs, using a percentage or count
value to define the total number of features in the subset.

``Default menu``: :menuselection:`Vector --> Research Tools`

Parameters
..........

``Input layer`` [vector: any]
  Source vector layer to select the features from.

``Method`` [enumeration]
  Method of the random selection:

  * 0 --- Number of selected features
  * 1 --- Percentage of selected features

  Default: *0*

``Number/percentage of selected features`` [number]
  Number or percentage of features to select.

  Default: *10*


.. _qgisrandomselectionwithinsubsets:

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

``Default menu``: :menuselection:`Vector --> Research Tools`

Parameters
..........

``Input layer`` [vector: any]
  Source vector layer to select the features from.

``ID field`` [tablefield: any]
  Category of the source vector layer.

``Method`` [enumeration]
  Method of the random selection:

  * 0 --- Number of selected features
  * 1 --- Percentage of selected features

  Default: *0*

``Number/percentage of selected features`` [number]
  Number or percentage of features to select.

  Default: *10*


.. _qgisselectbyattribute:

Select by attribute
-------------------
Creates a selection in a vector layer.

The criteria for selected features is defined based on the values of an attribute
from the input layer.

No new outputs are created.

Parameters
..........

``Input Layer`` [vector: any]
  Input vector layer.

``Selection attribute`` [tablefield: any]
  Filtering field of the layer.

``Operator`` [enumeration]
  Many different operators are available:

  * 0 --- =
  * 1 --- ≠
  * 2 --- >
  * 3 --- >=
  * 4 --- <
  * 5 --- <=
  * 6 --- begins with
  * 7 --- contains
  * 8 --- is null
  * 9 --- is not null
  * 10 --- does not contain

  Default: ``0``

``Value`` [string]
  Optional

  Value to be evaluated.

``Modify current selection by`` [enumeration] |32|
  How the selection of the algorithm should be managed. You have many options:

  * 0 --- creating new selection
  * 1 --- adding to current selection
  * 2 --- selecting within current selection
  * 3 --- removing from current selection

  Default: *0*

.. _qgisselectbyexpression:

Select by expression
--------------------
Creates a selection in a vector layer. The criteria for selecting
features is based on a QGIS expression. For more information about expressions
see the :ref:`vector_expressions`.

No new outputs are created.

Parameters
..........

``Input Layer`` [vector: any]
  Input vector layer.

``Expression`` [expression]
  Expression to filter the vector layer.

``Modify current selection by`` [enumeration]
  How the selection of the algorithm should be managed. You have many options:

  * 0 --- creating new selection
  * 1 --- adding to current selection
  * 2 --- selecting within current selection
  * 3 --- removing from current selection

  Default: *0*


.. _qgisselectbylocation:

Select by location
------------------
Creates a selection in a vector layer. The criteria for selecting
features is based on the spatial relationship between each feature and
the features in an additional layer.

No new outputs are created.

``Default menu``: :menuselection:`Vector --> Research Tools`

Parameters
..........

``Select features from`` [vector: any]
  Source vector layer.

``Where the features (geometric predicate)`` [enumeration] [list]
  Spatial condition for the selection:

  Options:

  * 0 --- intersect
  * 1 --- contain
  * 2 --- disjoint
  * 3 --- equal
  * 4 --- touch
  * 5 --- overlap
  * 6 --- are within
  * 7 --- cross

  Default: *0*

``By comparing to the features from`` [vector: any]
  Intersection vector layer.

``Modify current selection by`` [enumeration]
  How the selection of the algorithm should be managed. You have many options:

  * 0 --- creating new selection
  * 1 --- adding to current selection
  * 2 --- selecting within current selection
  * 3 --- removing from current selection

  Default: *0*


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |32| replace:: ``NEW in 3.2``
.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit http://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
