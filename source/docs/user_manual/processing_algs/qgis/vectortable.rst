Vector table
============

.. only:: html

   .. contents::
      :local:
      :depth: 1


.. _qgisaddautoincrementalfield:

Add autoincremental field
-------------------------
Adds a new integer field to a vector layer, with a sequential value for each feature.

This field can be used as a unique ID for features in the layer. The new attribute
is not added to the input layer but a new layer is generated instead.

The initial starting value for the incremental series can be specified.
Optionally, the incremental series can be based on grouping fields and a sort order
for features can also be specified.

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer.

``Field name`` [string]
  Name of the field with autoincremental values.

  Default: *AUTO*

``Start values at`` [number]
  Optional

  Choose the initial number of the incremental count.

  Default: *0*

``Group values by`` [tablefield: any] [list]
  Optional

  Select grouping field(s): instead of a single count run for the whole layer,
  a separate count is processed for each value returned by the combination of
  these fields.

``Sort expression`` [expression]
  Optional

  Use an expression to sort the features in the layer either globally
  or if set, based on group fields.

``Sort ascending`` [boolean]
  When a ``sort expression`` is set, use this option to control the order in
  which features are assigned values.

  Default: *True*

``Sort nulls first`` [boolean]
  When a ``sort expression`` is set, use this option to set whether
  *Null* values are counted first or last.

  Default: *False*

Outputs
.......

``Incremented`` [vector: any]
  Vector layer with auto incremental field.


.. _qgisaddfieldtoattributestable:

Add field to attributes table
-----------------------------
Adds a new field to a vector layer.

The name and characteristics of the attribute are defined as parameters.

The new attribute is not added to the input layer but a new layer is generated
instead.

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer.

``Field name`` [string]
  Name of the new field.

``Field type`` [enumeration]
  Type of the new field. You can choose between:

  * 0 --- Integer
  * 1 --- Float
  * 2 --- String

  Default: *0*

``Field length`` [number]
  Length of the field.

  Default: *10*

``Field precision`` [number]
  Precision of the field. Useful with Float field type.

  Default: *0*

Outputs
.......

``Added`` [vector: any]
  Vector layer with new field added.


.. _qgisadduniquevalueindexfield:

Add unique value index field
----------------------------
Takes a vector layer and an attribute and adds a new numeric field.

Values in this field correspond to values in the specified attribute, so features
with the same value for the attribute will have the same value in the new numeric
field.

This creates a numeric equivalent of the specified attribute, which defines the
same classes.

The new attribute is not added to the input layer but a new layer is generated
instead.

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer.

``Class field`` [tablefield: any]
  Features of the same value are given the same index.

``Output field name`` [tablefield: any]
  Name of the new field containing the indexes.

  Default: *NUM_FIELD*

Outputs
.......

``Layer with index field`` [vector: any]
  Vector layer with the numeric field containing indexes.

``Class summary`` [table]
  Table with summary of the class field mapped to the corresponding unique value.

  Default: *Skip Output*


.. _qgisaddxyfieldstolayer:

Add X/Y fields to layer |38|
----------------------------
Adds X and Y (or latitude/longitude) fields to a point layer.
The X/Y fields can be calculated in a different CRS to the layer
(e.g. creating latitude/longitude fields for a layer in a projected CRS).

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   *  - Name
      - Identifier
      - Type
      - Description
   *  - **Input layer**
      - INPUT
      - [vector: point]
      - The input layer.
   *  - **Coordinate system**
      - CRS
      - [crs]
        
        Default: "EPSG:4326"
      - Coordinate reference system to use for the generated x and
        y fields.
   *  - **Field prefix**
        
        Optional
      - PREFIX
      - [string]
      - Prefix to add to the new field names to avoid name collisions
        with fields in the input layer.
   *  - **Added fields**
      - OUTPUT
      - [vector:point]
      - Specification of the output layer.
       One of:
       
       * Create Temporary Layer
       * Save to File
       * Save to Geopackage
       * Save to PostGIS Table
       
       The file encoding can also be changed here.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   *  - Name
      - Identifier
      - Type
      - Description
   *  - **Added fields**
      - OUTPUT
      - [vector:point]
      - The output layer - identical to the input layer but with two
        new double fields, ``x`` and ``y``.


.. _qgisadvancedpythonfieldcalculator:

Advanced Python field calculator
--------------------------------
Adds a new attribute to a vector layer, with values resulting from applying an
expression to each feature.

The expression is defined as a Python function.

Parameters
..........

``Input layer`` [vector: any]
  Input vector layer.

``Result field name`` [string]
  Name of the new field.

  Default: *NewField*

``Field type`` [enumeration]
  Type of the new field. You can choose between:

  * 0 --- Integer
  * 1 --- Float
  * 2 --- String

  Default: *0*

``Field length`` [number]
  Length of the field.

  Default: *10*

``Field precision`` [number]
  Precision of the field. Useful with Float field type.

  Default: *3*

``Global expression`` [string]
  Optional

  The code in the global expression section will be executed only once before the
  calculator starts iterating through all the features of the input layer.
  Therefore, this is the correct place to import necessary modules or to calculate
  variables that will be used in subsequent calculations.

``Formula`` [string]
  Add here the Python formula to evaluate. For example to calculate the area of
  an input polygon layer you can add::

    value = $geom.area()


Outputs
.......

``Calculated`` [vector: any]
  Vector layer with the new calculated field.


.. _qgisdeletecolumn:

Drop field(s)
-------------
Takes a vector layer and generates a new one that has the same features but
without the selected columns.

Parameters
..........
.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   *  - Label
      - Name
      - Type
      - Description
   *  - **Input layer**
      - ``INPUT``
      - [vector: any]
      - Input vector layer to drop field(s) from
   *  - **Fields to drop**
      - ``COLUMN``
      - [tablefield: any] [list]
      - The field(s) to drop
   *  - **Remaining fields**
      - ``OUTPUT``
      - [vector: any]
      - Vector layer with the remaining fields

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   *  - Label
      - Name
      - Type
      - Description
   *  - **Remaining fields**
      - ``OUTPUT``
      - [vector: any]
      - Vector layer with the remaining fields


.. _qgisextractbinary:

Extract binary field |36|
-------------------------
Extracts contents from a binary field, saving them to individual files.
Filenames can be generated using values taken from an attribute in the
source table or based on a more complex expression.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   *  - Label
      - Name
      - Type
      - Description
   *  - **Input layer**
      - ``INPUT``
      - [vector: any]
      - Input vector layer containing the binary data
   *  - **Binary field**
      - ``FIELD``
      - [tablefield: any]
      - Field containing the binary data
   *  - **Destination folder**
      - ``FOLDER``
      - [folder]
      - Folder in which to store the output files
   *  - **File name**
      - ``FILENAME``
      - [expression]
      - Field or expression-based text to name each output file

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   *  - Label
      - Name
      - Type
      - Description
   *  - **Folder**
      - ``FOLDER``
      - [folder]
      - The folder that contains the output file.
    
      



.. _qgisfeaturefilter:

Feature filter (Modeler only)
-----------------------------
Filters features from the input layer and redirects
them to one or several outputs.
If you do not know about any attribute names that are common to all
possible input layers, filtering is only possible on the feature
geometry and general record mechanisms, such as ``$id`` and ``uuid``.  


Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   *  - Label
      - Name
      - Type
      - Description
   *  - **Input layer**
      - ``INPUT``
      - [vector: any]
      - The input layer.
   *  - **Outputs and filters**
        
        (one or more)
      - ``OUTPUT_<name of the filter>``
      - [vector: any]
      - The output layers with filters (as many as there are filters).

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   *  - Label
      - Name
      - Type
      - Description
   *  - **Output**
        
        (one or more)
      - ``native:filter_1:OUTPUT_<name of filter>``
      - [vector: any]
      - The output layers with filtered features (as many as there are
        filters).



.. _qgisfieldcalculator:

Field calculator
----------------
Opens the field calculator (see :ref:`vector_expressions`). You can use all the
supported expressions and functions.

A new layer is created with the result of the expression.

The field calculator is very useful when used in :ref:`processing.modeler`.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [vector: any]
     - The layer to calculate on
   * - **Result field name**
     - ``FIELD_NAME``
     - [string]
     - The name of the field for the results
   * - **Field type**
     - ``FIELD_TYPE``
     - [enumeration]
     - The type of the field.  One of:
       
       * 0 --- Float
       * 1 --- Integer
       * 2 --- String
       * 3 --- Date
       
   * - **Field length**
     - ``FIELD_LENGTH``
     - [number]
       
       Default: 10
     - The length of the result field (minimum 0)
   * - **Field precision**
     - ``FIELD_PRECISION``
     - [number]
       
       Default: 3
     - The precision of the result field (minimum 0, maximum 15)
   * - **Create new field**
     - ``NEW_FIELD``
     - [boolean]
       
       Default: True
     - Should the result field be a new field
   * - **Formula**
     - ``FORMULA``
     - [expression]
     - The formula to use to calculate the result
   * - **Calculated**
     - ``OUTPUT``
     - [vector:any]
     - Specification of the output layer.
       One of:
       
       * Create Temporary Layer
       * Save to File
       * Save to Geopackage
       * Save to PostGIS Table
       
       The file encoding can also be changed here.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Calculated**
     - ``OUTPUT``
     - [vector: any]
     - Output layer with the calculated field values

.. _qgisrefactorfields:

Refactor fields
---------------
Allows editing the structure of the attribute table of a vector layer.

Fields can be modified in their type and name, using a fields mapping.

The original layer is not modified. A new layer is generated, which contains a
modified attribute table, according to the provided fields mapping.

Refactor layer fields allows to:

* Change field names and types
* Add and remove fields
* Reorder fields
* Calculate new fields based on expressions
* Load field list from another layer

.. figure:: img/refactor_fields.png
  :align: center

  Refactor fields dialog

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [vector: any]
     - The layer to modify
   * - **Fields mapping**
     - ``FIELDS_MAPPING``
     - [list]
     - List of output fields with their definitions.
       The embedded table lists all the fields of the source
       layer and allows you to edit them:

       * Click the |newAttribute| button to create a new field.
       * Click |deleteAttribute| to remove a field.
       * Use |arrowUp| and |arrowDown| to change the selected field order.
       * Click |clearText| to reset to the default view.

       For each of the fields you'd like to reuse, you need to
       fill the following options:

       :guilabel:`Source expression` (``expression``) [expression]
         Field or expression from the input layer.
     
       :guilabel:`Field name` (``name``) [string]
         Name of the field in the output layer.
         By default input field name is kept.

       :guilabel:`Type` (``type``) [enumeration]
         Data type of the output field.
         One of:
         
         * Date (14)
         * DateTime (16)
         * Double (6)
         * Integer (2)
         * Integer64 (4)
         * String (10)
         * Boolean (1)

       :guilabel:`Length` (``length``) [number]
         Length of the output field.

       :guilabel:`Precision` (``precision``) [number]
         Precision of the output field.

       Fields from another layer can be loaded into the field list
       in :guilabel:`Load fields from layer`.
   * - **Refactored**
     - ``OUTPUT``
     - [vector: any]
     - Specification of the output layer.
       One of:
       
       * Create Temporary Layer
       * Save to File
       * Save to Geopackage
       * Save to PostGIS Table
       
       The file encoding can also be changed here.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Refactored**
     - ``OUTPUT``
     - [vector: any]
     - Output layer with refactored fields


.. _qgistexttofloat:

Text to float
-------------
Modifies the type of a given attribute in a vector layer, converting a text attribute
containing numeric strings into a numeric attribute (e.g. '1' to ``1.0``).

The algorithm creates a new vector layer so the source one is not modified.

If the conversion is not possible the selected column will have ``NULL`` values.

Parameters
..........

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Input layer**
     - ``INPUT``
     - [vector: any]
     - The input vector layer.
   * - **Text attribute to convert to float**
     - ``FIELD``
     - [tablefield: string]
     - The string field for the input layer that is to be converted to a
       float field.
   * - **Float from text**
     - ``OUTPUT``
     - [vector: any]
       
       Default: ``[Create Temporary Layer]``
     - Specification of the output layer.
       One of:
       
       * Create Temporary Layer
       * Save to File
       * Save to Geopackage
       * Save to PostGIS Table
       
       The file encoding can also be changed here.

Outputs
.......

.. list-table::
   :header-rows: 1
   :widths: 20 20 20 40
   :stub-columns: 0

   * - Label
     - Name
     - Type
     - Description
   * - **Float from text**
     - ``OUTPUT``
     - [vector: any]
     - Output vector layer with the string field converted into
       a float field


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |36| replace:: ``NEW in 3.6``
.. |38| replace:: ``NEW in 3.8``
.. |arrowDown| image:: /static/common/mActionArrowDown.png
   :width: 1.5em
.. |arrowUp| image:: /static/common/mActionArrowUp.png
   :width: 1.5em
.. |clearText| image:: /static/common/mIconClearText.png
   :width: 1.5em
.. |deleteAttribute| image:: /static/common/mActionDeleteAttribute.png
   :width: 1.5em
.. |newAttribute| image:: /static/common/mActionNewAttribute.png
   :width: 1.5em
