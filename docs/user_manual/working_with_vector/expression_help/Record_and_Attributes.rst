.. attribute_section

.. _expression_function_Record_and_Attributes_attribute:

attribute
.........

Returns an attribute from a feature.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - attribute()




.. end_attribute_section

.. attributes_section

.. _expression_function_Record_and_Attributes_attributes:

attributes
..........

Returns a map containing all attributes from a feature, with field names as map keys.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - attributes()




.. end_attributes_section

.. $currentfeature_section

.. _expression_function_Record_and_Attributes_$currentfeature:

$currentfeature
...............

Returns the current feature being evaluated. This can be used with the 'attribute' function to evaluate attribute values from the current feature.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - $currentfeature

   * - Examples
     - * attribute( $currentfeature, 'name' ) → value stored in 'name' attribute for the current feature


.. end_$currentfeature_section

.. display_expression_section

.. _expression_function_Record_and_Attributes_display_expression:

display_expression
..................

Returns the display expression for a given feature in a layer. If called with no parameters, it evaluates the current feature. The expression is evaluated by default.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - display_expression(feature, layer, evaluate)

   * - Arguments
     - * **feature** - The feature which should be evaluated.

       * **layer** - The layer (or its id or name).

       * **evaluate** - If the expression must be evaluated. If false, the expression will be returned as a string literal only (which could potentially be later evaluated using the 'eval' function).

   * - Examples
     - * display_expression() → The display expression of the current feature.

       * display_expression(get_feature_by_id('streets', 1), 'streets') → The display expression of the feature with the ID 1 on the layer 'streets'.

       * display_expression('a_layer_id', $currentfeature, 'False') → The display expression of the given feature not evaluated.


.. end_display_expression_section

.. get_feature_section

.. _expression_function_Record_and_Attributes_get_feature:

get_feature
...........

Returns the first feature of a layer matching a given attribute value.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - get_feature(layer, attribute, value)

   * - Arguments
     - * **layer** - layer name or ID

       * **attribute** - attribute name

       * **value** - attribute value to match

   * - Examples
     - * get_feature('streets','name','main st') → first feature found in "streets" layer with "main st" value in the "name" field


.. end_get_feature_section

.. get_feature_by_id_section

.. _expression_function_Record_and_Attributes_get_feature_by_id:

get_feature_by_id
.................

Returns the feature with an id on a layer.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - get_feature_by_id(layer, feature_id)

   * - Arguments
     - * **layer** - layer, layer name or layer id

       * **feature_id** - the id of the feature which should be returned

   * - Examples
     - * get_feature('streets', 1) → the feature with the id 1 on the layer "streets"


.. end_get_feature_by_id_section

.. $id_section

.. _expression_function_Record_and_Attributes_$id:

$id
...

Returns the feature id of the current row.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - $id

   * - Examples
     - * $id → 42


.. end_$id_section

.. is_selected_section

.. _expression_function_Record_and_Attributes_is_selected:

is_selected
...........

Returns True if a feature is selected. Can be used with zero, one or two arguments, see below for details.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - is_selected()




.. end_is_selected_section

.. maptip_section

.. _expression_function_Record_and_Attributes_maptip:

maptip
......

Returns the maptip for a given feature in a layer. If called with no parameters, it evaluates the current feature. The maptip is evaluated by default.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - maptip(feature, layer, evaluate)

   * - Arguments
     - * **feature** - The feature which should be evaluated.

       * **layer** - The layer (or its id or name).

       * **evaluate** - If the expression must be evaluated. If false, the expression will be returned as a string literal only (which could potentially be later evaluated using the 'eval_template' function).

   * - Examples
     - * maptip() → The maptip of the current feature.

       * maptip(get_feature('streets', 1), 'streets') → The maptip of the feature with the ID 1 on the layer 'streets'.

       * maptip('a_layer_id', $currentfeature, 'False') → The maptip of the given feature not evaluated.


.. end_maptip_section

.. num_selected_section

.. _expression_function_Record_and_Attributes_num_selected:

num_selected
............

Returns the number of selected features on a given layer. By default works on the layer on which the expression is evaluated.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - num_selected(layer)

   * - Arguments
     - * **layer** - The layer (or its id or name) on which the selection will be checked.

   * - Examples
     - * num_selected() → The number of selected features on the current layer.

       * num_selected('streets') → The number of selected features on the layer streets


.. end_num_selected_section

.. represent_value_section

.. _expression_function_Record_and_Attributes_represent_value:

represent_value
...............

Returns the configured representation value for a field value. It depends on the configured widget type. Often, this is useful for 'Value Map' widgets.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - represent_value(value, fieldName)

   * - Arguments
     - * **value** - The value which should be resolved. Most likely a field.

       * **fieldName** - The field name for which the widget configuration should be loaded. (Optional)

   * - Examples
     - * represent_value("field_with_value_map") → Description for value

       * represent_value('static value', 'field_name') → Description for static value


.. end_represent_value_section

.. sqlite_fetch_and_increment_section

.. _expression_function_Record_and_Attributes_sqlite_fetch_and_increment:

sqlite_fetch_and_increment
..........................

Manage autoincrementing values in sqlite databases.<p>SQlite default values can only be applied on insert and not prefetched.</p><p>This makes it impossible to acquire an incremented primary key via AUTO_INCREMENT before creating the row in the database. Sidenote: with postgres, this works via the option <i>evaluate default values</i>.</p><p>When adding new features with relations, it is really nice to be able to already add children for a parent, while the parents form is still open and hence the parent feature uncommitted.</p><p>To get around this limitation, this function can be used to manage sequence values in a separate table on sqlite based formats like gpkg.</p><p>The sequence table will be filtered for a sequence id (filter_attribute and filter_value) and the current value of the id_field will be incremented by 1 and the incremented value returned.</p><p>If additional columns require values to be specified, the default_value map can be used for this purpose.</p><p><b>Note</b><br/>This function modifies the target sqlite table. It is intended for usage with default value configurations for attributes.</p><p>When the database parameter is a layer and the layer is in transaction mode, the value will only be retrieved once during the lifetime of a transaction and cached and incremented. This makes it unsafe to work on the same database from several processes in parallel.</p>

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - sqlite_fetch_and_increment(database, table, id_field, filter_attribute, filter_value, default_values)

   * - Arguments
     - * **database** - Path to the sqlite file or geopackage layer

       * **table** - Name of the table that manages the sequences

       * **id_field** - Name of the field that contains the current value

       * **filter_attribute** - Name the field that contains a unique identifier for this sequence. Must have a UNIQUE index.

       * **filter_value** - Name of the sequence to use.

       * **default_values** - Map with default values for additional columns on the table. The values need to be fully quoted. Functions are allowed.

   * - Examples
     - * sqlite_fetch_and_increment(@layer, 'sequence_table', 'last_unique_id', 'sequence_id', 'global', map('last_change','date(''now'')','user','''' || @user_account_name || '''')) → 0

       * sqlite_fetch_and_increment(layer_property(@layer, 'path'), 'sequence_table', 'last_unique_id', 'sequence_id', 'global', map('last_change','date(''now'')','user','''' || @user_account_name || '''')) → 0


.. end_sqlite_fetch_and_increment_section

.. uuid_section

.. _expression_function_Record_and_Attributes_uuid:

uuid
....

Generates a Universally Unique Identifier (UUID) for each row using the Qt <a href='http://qt-project.org/doc/qt-4.8/quuid.html#createUuid'>QUuid::createUuid</a>  method.  Each UUID is 38 characters long.

.. list-table::
   :widths: 15 85
   :stub-columns: 1

   * - Syntax
     - uuid()

   * - Examples
     - * uuid() → '{0bd2f60f-f157-4a6d-96af-d4ba4cb366a1}'


.. end_uuid_section

