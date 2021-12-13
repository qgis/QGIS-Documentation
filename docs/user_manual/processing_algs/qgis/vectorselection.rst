Vector selection
================

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _qgisextractbyattribute:

Extract by attribute
--------------------
Creates two vector layers from an input layer: one will contain only
matching features while the second will contain all the non-matching
features.

The criteria for adding features to the resulting layer is based on
the values of an attribute from the input layer.

.. seealso:: :ref:`qgisselectbyattribute`

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [vector: any]
     - Layer to extract features from.
   * - **Selection attribute**
     - ``FIELD``
     - [tablefield: any]
     - Filtering field of the layer
   * - **Operator**
     - ``OPERATOR``
     - [enumeration]

       Default: 0
     - Many different operators are available:

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

   * - **Value**

       Optional
     - ``VALUE``
     - [string]
     - Value to be evaluated
   * - **Extracted (attribute)**
     - ``OUTPUT``
     - [same as input]

       Default: ``[Create Temporary Layer]``
     - Specify the output vector layer for matching features.
       One of:

       .. include:: ../algs_include.rst
          :start-after: **layer_output_types**
          :end-before: **end_layer_output_types**

   * - **Extracted (non-matching)**
     - ``FAIL_OUTPUT``
     - [same as input]

       Default: ``[Skip output]``
     - Specify the output vector layer for non-matching
       features.
       One of:

       .. include:: ../algs_include.rst
          :start-after: **layer_output_types_skip**
          :end-before: **end_layer_output_types_skip**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Extracted (attribute)**
     - ``OUTPUT``
     - [same as input]
     - Vector layer with matching features from the input
       layer
   * - **Extracted (non-matching)**
     - ``FAIL_OUTPUT``
     - [same as input]
     - Vector layer with non-matching features from the
       input layer

Python code
...........

**Algorithm ID**: ``qgis:extractbyattribute``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisextractbyexpression:

Extract by expression
---------------------
Creates two vector layers from an input layer: one will contain only
matching features while the second will contain all the non-matching
features.

The criteria for adding features to the resulting layer is based on a
QGIS expression.
For more information about expressions see the
:ref:`vector_expressions`.

.. seealso:: :ref:`qgisselectbyexpression`

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [vector: any]
     - Input vector layer
   * - **Expression**
     - ``EXPRESSION``
     - [expression]
     - Expression to filter the vector layer
   * - **Matching features**
     - ``OUTPUT``
     - [same as input]

       Default: ``[Create Temporary Layer]``
     - Specify the output vector layer for matching features.
       One of:

       .. include:: ../algs_include.rst
          :start-after: **layer_output_types**
          :end-before: **end_layer_output_types**

   * - **Non-matching**
     - ``FAIL_OUTPUT``
     - [same as input]

       Default: ``[Skip output]``
     - Specify the output vector layer for non-matching
       features.
       One of:

       .. include:: ../algs_include.rst
          :start-after: **layer_output_types_skip**
          :end-before: **end_layer_output_types_skip**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Matching features**
     - ``OUTPUT``
     - [same as input]
     - Vector layer with matching features from the input
       layer
   * - **Non-matching**
     - ``FAIL_OUTPUT``
     - [same as input]
     - Vector layer with non-matching features from the
       input layer

Python code
...........

**Algorithm ID**: ``qgis:extractbyexpression``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisextractbylocation:

Extract by location
-------------------
Creates a new vector layer that only contains matching features from
an input layer.

The criteria for adding features to the resulting layer is based on
the spatial relationship between each feature and the features in an
additional layer.

.. seealso:: :ref:`qgisselectbylocation`, :ref:`qgisextractwithindistance`

Exploring spatial relations
...........................

.. include:: ../algs_include.rst
   :start-after: **geometric_predicates**
   :end-before: **end_geometric_predicates**

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Extract features from**
     - ``INPUT``
     - [vector: any]
     - Input vector layer
   * - **Where the features (geometric predicate)**
     - ``PREDICATE``
     - [enumeration] [list]

       Default: [0]
     - Type of spatial relation the input feature should have with an intersect
       feature so that it could be selected. One or more of:

       * 0 --- intersect
       * 1 --- contain
       * 2 --- disjoint
       * 3 --- equal
       * 4 --- touch
       * 5 --- overlap
       * 6 --- are within
       * 7 --- cross

       If more than one condition is chosen, at least one
       of them (OR operation) has to be met for a feature
       to be extracted.
   * - **By comparing to the features from**
     - ``INTERSECT``
     - [vector: any]
     - Intersection vector layer
   * - **Extracted (location)**
     - ``OUTPUT``
     - [same as input]

       Default: ``[Create temporary layer]``
     - Specify the output vector layer for the features that
       have the chosen spatial relationship(s) with one or more
       features in the comparison layer.
       One of:

       .. include:: ../algs_include.rst
          :start-after: **layer_output_types**
          :end-before: **end_layer_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Extracted (location)**
     - ``OUTPUT``
     - [same as input]
     - Vector layer with features from the input layer that
       have the chosen spatial relationship(s) with one or
       more features in the comparison layer.

Python code
...........

**Algorithm ID**: ``qgis:extractbylocation``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisextractwithindistance:

Extract within distance
-----------------------

Creates a new vector layer that only contains matching features from an
input layer. Features are copied wherever they are within
the specified maximum distance from the features in an additional reference layer.

.. seealso:: :ref:`qgisselectwithindistance`, :ref:`qgisextractbylocation`

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Extract features from**
     - ``INPUT``
     - [vector: any]
     - Input vector layer to copy features from
   * - **By comparing to the features from**
     - ``REFERENCE``
     - [vector: any]
     - Vector layer whose features closeness is used
   * - **Where the features are within**
     - ``DISTANCE``
     - [number]

       Default: 100
     - The maximum distance around reference features
       to select input features within
   * - **Modify current selection by**
     - ``METHOD``
     - [enumeration]

       Default: 0
     - How the selection of the algorithm should be managed.
       One of:

       * 0 --- creating new selection
       * 1 --- adding to current selection
       * 2 --- selecting within current selection
       * 3 --- removing from current selection
   * - **Extracted (location)**
     - ``OUTPUT``
     - [same as input]

       Default: ``[Create temporary layer]``
     - Specify the output vector layer for the features that
       are within the set distance from reference features.
       One of:

       .. include:: ../algs_include.rst
          :start-after: **layer_output_types**
          :end-before: **end_layer_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Extracted (location)**
     - ``OUTPUT``
     - [same as input]
     - Vector layer with features from the input layer matching
       the condition of distance from reference features

Python code
...........

**Algorithm ID**: ``native:extractwithindistance``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisrandomextract:

Random extract
--------------
Takes a vector layer and generates a new one that contains only a
subset of the features in the input layer.

The subset is defined randomly, based on feature IDs, using a
percentage or count value to define the total number of features in
the subset.

.. seealso:: :ref:`qgisrandomselection`

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [vector: any]
     - Source vector layer to select the features from
   * - **Method**
     - ``METHOD``
     - [enumeration]

       Default: 0
     - Random selection methods. One of:

       * 0 --- Number of selected features
       * 1 --- Percentage of selected features

   * - **Number/percentage of selected features**
     - ``NUMBER``
     - [number]

       Default: 10
     - Number or percentage of features to select
   * - **Extracted (random)**
     - ``OUTPUT``
     - [vector: any]

       Default: ``[Create temporary layer]``
     - Specify the output vector layer for the randomly
       selected features.
       One of:

       .. include:: ../algs_include.rst
          :start-after: **layer_output_types**
          :end-before: **end_layer_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Extracted (random)**
     - ``OUTPUT``
     - [same as input]
     - Vector layer containing randomly selected features from
       the input layer

Python code
...........

**Algorithm ID**: ``qgis:randomextract``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisrandomextractwithinsubsets:

Random extract within subsets
-----------------------------
Takes a vector layer and generates a new one that contains only a
subset of the features in the input layer.

The subset is defined randomly, based on feature IDs, using a
percentage or count value to define the total number of features in
the subset.
The percentage/count value is not applied to the whole layer, but
instead to each category.
Categories are defined according to a given attribute.

.. seealso:: :ref:`qgisrandomselectionwithinsubsets`

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [vector: any]
     - Vector layer to select the features from
   * - **ID field**
     - ``FIELD``
     - [tablefield: any]
     - Category of the source vector layer to select the features from
   * - **Method**
     - ``METHOD``
     - [enumeration]

       Default: 0
     - Random selection method. One of:

       * 0 --- Number of selected features
       * 1 --- Percentage of selected features

   * - **Number/percentage of selected features**
     - ``NUMBER``
     - [number]

       Default: 10
     - Number or percentage of features to select
   * - **Extracted (random stratified)**
     - ``OUTPUT``
     - [same as input]

       Default: ``[Create temporary layer]``
     - Specify the output vector layer for the randomly
       selected features.
       One of:

       .. include:: ../algs_include.rst
          :start-after: **layer_output_types**
          :end-before: **end_layer_output_types**

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Extracted (random stratified)**
     - ``OUTPUT``
     - [same as input]
     - Vector layer containing randomly selected features from
       the input layer

Python code
...........

**Algorithm ID**: ``qgis:randomextractwithinsubsets``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisrandomselection:

Random selection
----------------
Takes a vector layer and selects a subset of its features.
No new layer is generated by this algorithm.

The subset is defined randomly, based on feature IDs, using a
percentage or count value to define the total number of features in
the subset.

**Default menu**: :menuselection:`Vector --> Research Tools`

.. seealso:: :ref:`qgisrandomextract`

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [vector: any]
     - Vector layer for the selection
   * - **Method**
     - ``METHOD``
     - [enumeration]

       Default: 0
     - Random selection method. One of:

       * 0 --- Number of selected features
       * 1 --- Percentage of selected features

   * - **Number/percentage of selected features**
     - ``NUMBER``
     - [number]

       Default: 10
     - Number or percentage of features to select

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [same as input]
     - The input layer with features selected

Python code
...........

**Algorithm ID**: ``qgis:randomselection``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisrandomselectionwithinsubsets:

Random selection within subsets
-------------------------------
Takes a vector layer and selects a subset of its features.
No new layer is generated by this algorithm.

The subset is defined randomly, based on feature IDs, using a
percentage or count value to define the total number of features in
the subset.

The percentage/count value is not applied to the whole layer, but
instead to each category.

Categories are defined according to a given attribute, which is also
specified as an input parameter for the algorithm.

No new outputs are created.

**Default menu**: :menuselection:`Vector --> Research Tools`

.. seealso:: :ref:`qgisrandomextractwithinsubsets`

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [vector: any]
     - Vector layer to select features in
   * - **ID field**
     - ``FIELD``
     - [tablefield: any]
     - Category of the input layer to select the features from
   * - **Method**
     - ``METHOD``
     - [enumeration]

       Default: 0
     - Random selection method. One of:

       * 0 --- Number of selected features
       * 1 --- Percentage of selected features

   * - **Number/percentage of selected features**
     - ``NUMBER``
     - [number]

       Default: 10
     - Number or percentage of features to select

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [same as input]
     - The input layer with features selected

Python code
...........

**Algorithm ID**: ``qgis:randomselectionwithinsubsets``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisselectbyattribute:

Select by attribute
-------------------
Creates a selection in a vector layer.

The criteria for selecting features is based on the values of an
attribute from the input layer.

.. seealso:: :ref:`qgisextractbyattribute`

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [vector: any]
     - Vector layer to select features in
   * - **Selection attribute**
     - ``FIELD``
     - [tablefield: any]
     - Filtering field of the layer
   * - **Operator**
     - ``OPERATOR``
     - [enumeration]

       Default: 0
     - Many different operators are available:

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

   * - **Value**

       Optional
     - ``VALUE``
     - [string]
     - Value to be evaluated
   * - **Modify current selection by**
     - ``METHOD``
     - [enumeration]

       Default: 0
     - How the selection of the algorithm should be managed.
       One of:

       * 0 --- creating new selection
       * 1 --- adding to current selection
       * 2 --- removing from current selection
       * 3 --- selecting within current selection

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [same as input]
     - The input layer with features selected

Python code
...........

**Algorithm ID**: ``qgis:selectbyattribute``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisselectbyexpression:

Select by expression
--------------------
Creates a selection in a vector layer.

The criteria for selecting features is based on a QGIS expression.
For more information about expressions see the
:ref:`vector_expressions`.

.. seealso:: :ref:`qgisextractbyexpression`

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [vector: any]
     - Input vector layer
   * - **Expression**
     - ``EXPRESSION``
     - [expression]
     - Expression to filter the input layer
   * - **Modify current selection by**
     - ``METHOD``
     - [enumeration]

       Default: 0
     - How the selection of the algorithm should be managed.
       One of:

       * 0 --- creating new selection
       * 1 --- adding to current selection
       * 2 --- removing from current selection
       * 3 --- selecting within current selection

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [same as input]
     - The input layer with features selected

Python code
...........

**Algorithm ID**: ``qgis:selectbyexpression``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisselectbylocation:

Select by location
------------------
Creates a selection in a vector layer.

The criteria for selecting features is based on the spatial
relationship between each feature and the features in an additional
layer.

**Default menu**: :menuselection:`Vector --> Research Tools`

.. seealso:: :ref:`qgisextractbylocation`, :ref:`qgisselectwithindistance`

Exploring spatial relations
...........................

.. include:: ../algs_include.rst
   :start-after: **geometric_predicates**
   :end-before: **end_geometric_predicates**

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Select features from**
     - ``INPUT``
     - [vector: any]
     - Input vector layer
   * - **Where the features (geometric predicate)**
     - ``PREDICATE``
     - [enumeration] [list]

       Default: [0]
     - Type of spatial relation the input feature should have with an intersect
       feature so that it could be selected. One or more of:

       * 0 --- intersect
       * 1 --- contain
       * 2 --- disjoint
       * 3 --- equal
       * 4 --- touch
       * 5 --- overlap
       * 6 --- are within
       * 7 --- cross

       If more than one condition is chosen, at least one
       of them (OR operation) has to be met for a feature
       to be extracted.
   * - **By comparing to the features from**
     - ``INTERSECT``
     - [vector: any]
     - Intersection vector layer
   * - **Modify current selection by**
     - ``METHOD``
     - [enumeration]

       Default: 0
     - How the selection of the algorithm should be managed.
       One of:

       * 0 --- creating new selection
       * 1 --- adding to current selection
       * 2 --- selecting within current selection
       * 3 --- removing from current selection

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [same as input]
     - The input layer with features selected

Python code
...........

**Algorithm ID**: ``qgis:selectbylocation``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**


.. _qgisselectwithindistance:

Select within distance
----------------------

creates a selection in a vector layer.
Features are selected wherever they are within the specified maximum
distance from the features in an additional reference layer.

.. seealso:: :ref:`qgisextractwithindistance`, :ref:`qgisselectbylocation`

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :class: longtable

   * - Label
     - Name
     - Type
     - Description
   * - **Select features from**
     - ``INPUT``
     - [vector: any]
     - Input vector layer to select features from
   * - **By comparing to the features from**
     - ``REFERENCE``
     - [vector: any]
     - Vector layer whose features closeness is used
   * - **Where the features are within**
     - ``DISTANCE``
     - [number]

       Default: 100
     - The maximum distance around reference features
       to select input features
   * - **Modify current selection by**
     - ``METHOD``
     - [enumeration]

       Default: 0
     - How the selection of the algorithm should be managed.
       One of:

       * 0 --- creating new selection
       * 1 --- adding to current selection
       * 2 --- selecting within current selection
       * 3 --- removing from current selection

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [same as input]
     - The input layer with features selected

Python code
...........

**Algorithm ID**: ``native:selectwithindistance``

.. include:: ../algs_include.rst
  :start-after: **algorithm_code_section**
  :end-before: **end_algorithm_code_section**
