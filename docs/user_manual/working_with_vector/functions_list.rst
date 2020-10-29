.. index:: Functions
.. _functions_list:

List of functions
=================

The functions, operators and variables available in QGIS are listed below,
grouped by categories.

.. only:: html

   .. contents::
      :local:
      :depth: 1

.. index:: Aggregates
.. _aggregates_function:

Aggregates Functions
--------------------

This group contains functions which aggregate values over layers and fields.

.. contents::
   :local:
   :class: toc_columns

.. include:: expression_help/Aggregates.rst
   :start-after: :orphan:
   :end-before: .. end_relation_aggregate_section

Further reading: :ref:`vector_relations`

.. include:: expression_help/Aggregates.rst
   :start-after: .. end_relation_aggregate_section


.. index:: Array, List data structure
.. _array_functions:

Array Functions
---------------

This group contains functions to create and manipulate arrays (also known as
list data structures). The order of values within the array matters, unlike the
:ref:`'map' data structure <maps_functions>`, where the order of key-value pairs
is irrelevant and values are identified by their keys.

.. contents::
   :local:
   :class: toc_columns

.. include:: expression_help/Arrays.rst
   :start-after: :orphan:


Color Functions
----------------

This group contains functions for manipulating colors.

.. contents::
   :local:
   :class: toc_columns

.. include:: expression_help/Color.rst
   :start-after: :orphan:
   :end-before: .. end_darker_section

Further reading: :ref:`expression_function_Color_lighter`

.. include:: expression_help/Color.rst
   :start-after: .. end_darker_section
   :end-before: .. end_lighter_section

Further reading: :ref:`expression_function_Color_darker`

.. include:: expression_help/Color.rst
   :start-after: .. end_lighter_section
   :end-before: .. end_project_color_section

Further reading: :ref:`setting project colors <project_colors>`

.. include:: expression_help/Color.rst
   :start-after: .. end_project_color_section
   :end-before: .. end_ramp_color_section

Further reading: :ref:`color-ramp`, :ref:`color_ramp_widget`

.. include:: expression_help/Color.rst
   :start-after: .. end_ramp_color_section


Conditional Functions
---------------------

This group contains functions to handle conditional checks in expressions.

.. contents::
   :local:
   :class: toc_columns

.. include:: expression_help/Conditionals.rst
   :start-after: :orphan:


.. _conversion_functions:

Conversions Functions
---------------------

This group contains functions to convert one data type to another
(e.g., string from/to integer, binary from/to string, string to date, ...).

.. contents::
   :local:
   :class: toc_columns

.. include:: expression_help/Conversions.rst
   :start-after: :orphan:


Custom Functions
-----------------

This group contains functions created by the user.
See :ref:`function_editor` for more details.


Date and Time Functions
------------------------

This group contains functions for handling date and time data.
This group shares several functions with the :ref:`conversion_functions` (
to_date, to_time, to_datetime, to_interval) and :ref:`string_functions`
(format_date) groups.

.. note:: **Storing date, datetime and intervals on fields**

   The ability to store *date*, *time* and *datetime* values directly on
   fields may depend on the data source's provider (e.g., Shapefile accepts
   *date* format, but not *datetime* or *time* format). The following are some
   suggestions to overcome this limitation:

   * *date*, *Datetime* and *time* can be stored in text type fields after
     using the ``to_format()`` function.

   * *Intervals* can be stored in integer or decimal type fields after using
     one of the date extraction functions (e.g., ``day()`` to get the interval
     expressed in days)

.. contents::
   :local:
   :class: toc_columns

.. include:: expression_help/Date_and_Time.rst
   :start-after: :orphan:


**Some examples:**

Besides these functions, subtracting dates, datetimes or times using the
``-`` (minus) operator will return an interval.

Adding or subtracting an interval to dates, datetimes or times, using the
``+`` (plus) and ``-`` (minus) operators, will return a datetime.

* Get the number of days until QGIS 3.0 release:

  .. code-block:: sql

     to_date('2017-09-29') - to_date(now())
     -- Returns <interval: 203 days>

* The same with time:

  .. code-block:: sql

     to_datetime('2017-09-29 12:00:00') - now()
     -- Returns <interval: 202.49 days>

* Get the datetime of 100 days from now:

  .. code-block:: sql

     now() + to_interval('100 days')
     -- Returns <datetime: 2017-06-18 01:00:00>

.. _fields_values:

Fields and Values
------------------

Contains a list of fields from the layer.

Double-click a field name to have it added to your expression. You can also
type the field name (preferably inside double quotes) or its :ref:`alias
<configure_field>`.

To retrieve fields values to use in an expression, select the appropriate field
and, in the shown widget, choose between :guilabel:`10 Samples` and :guilabel:`All
Unique`. Requested values are then displayed and you can use the :guilabel:`Search`
box at the top of the list to filter the result.
Sample values can also be accessed via right-clicking on a field.

To add a value to the expression you are writing, double-click on it in the list.
If the value is of a string type, it should be simple quoted, otherwise no quote
is needed.


Files and Paths Functions
------------------------------

This group contains functions which manipulate file and path names.

.. contents::
   :local:
   :class: toc_columns

.. include:: expression_help/Files_and_Paths.rst
   :start-after: :orphan:


Form Functions
--------------

This group contains functions that operate exclusively under the attribute form
context. For example, in :ref:`field's widgets <vector_attributes_menu>` settings.

.. contents::
   :local:

.. include:: expression_help/Form.rst
   :start-after: :orphan:


Fuzzy Matching Functions
-------------------------

This group contains functions for fuzzy comparisons between values.

.. contents::
   :local:
   :class: toc_columns

.. include:: expression_help/Fuzzy_Matching.rst
   :start-after: :orphan:


General Functions
------------------

This group contains general assorted functions.

.. contents::
   :local:
   :class: toc_columns

.. include:: expression_help/General.rst
   :start-after: :orphan:
   :end-before: .. end_layer_property_section

Further reading: :ref:`vector <vectorinformationmenu>`, :ref:`raster <raster_information>`
and :ref:`mesh <mesh_information>` layer properties

.. include:: expression_help/General.rst
   :start-after: .. end_layer_property_section
   :end-before: .. end_var_section

Further reading: List of default :ref:`variables <expression_variables>`

.. include:: expression_help/General.rst
   :start-after: .. end_var_section


.. _geometry_functions:

Geometry Functions
------------------

This group contains functions that operate on geometry objects
(e.g. buffer, transform, $area).

.. contents::
   :local:
   :class: toc_columns

.. include:: expression_help/GeometryGroup.rst
   :start-after: :orphan:
   :end-before: .. end_boundary_section

Further reading: :ref:`qgisboundary` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_boundary_section
   :end-before: .. end_bounds_section

Further reading: :ref:`qgisboundingboxes` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: end_bounds_section
   :end-before: .. end_buffer_section

Further reading: :ref:`qgisbuffer` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_buffer_section
   :end-before: .. end_buffer_by_m_section

Further reading: :ref:`qgisbufferbym` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_buffer_by_m_section
   :end-before: .. end_centroid_section

Further reading: :ref:`qgiscentroids` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_centroid_section
   :end-before: .. end_collect_geometries_section

Further reading: :ref:`qgiscollect` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_collect_geometries_section
   :end-before: .. end_contains_section

Further reading: :ref:`expression_function_GeometryGroup_overlay_contains`

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_contains_section
   :end-before: .. end_convex_hull_section

Further reading: :ref:`qgisconvexhull` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_convex_hull_section
   :end-before: .. end_crosses_section

Further reading: :ref:`expression_function_GeometryGroup_overlay_crosses`

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_crosses_section
   :end-before: .. end_difference_section

Further reading: :ref:`qgisdifference` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_difference_section
   :end-before: .. end_disjoint_section

Further reading: :ref:`expression_function_GeometryGroup_overlay_disjoint`

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_disjoint_section
   :end-before: .. end_end_point_section

Further reading: :ref:`qgisextractspecificvertices` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_end_point_section
   :end-before: .. end_extend_section

Further reading: :ref:`qgisextendlines` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_extend_section
   :end-before: .. end_flip_coordinates_section

Further reading: :ref:`qgisswapxy` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_flip_coordinates_section
   :end-before: .. end_force_rhr_section

Further reading: :ref:`qgisforcerhr` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_force_rhr_section
   :end-before: .. end_intersection_section
   
Further reading: :ref:`qgisintersection` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_intersection_section
   :end-before: .. end_intersects_section

Further reading: :ref:`expression_function_GeometryGroup_overlay_intersects`

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_intersects_section
   :end-before: .. end_line_interpolate_point_section

Further reading: :ref:`qgisinterpolatepoint` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_line_interpolate_point_section
   :end-before: .. end_line_substring_section

Further reading: :ref:`qgislinesubstring` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_line_substring_section
   :end-before: .. end_minimal_circle_section

Further reading: :ref:`qgisminimumenclosingcircle` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_minimal_circle_section
   :end-before: .. end_nodes_to_points_section

Further reading: :ref:`qgisextractvertices` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_nodes_to_points_section
   :end-before: .. end_offset_curve_section

Further reading: :ref:`qgisoffsetline` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_offset_curve_section
   :end-before: .. end_oriented_bbox_section

Further reading: :ref:`qgisorientedminimumboundingbox` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_oriented_bbox_section
   :end-before: .. end_overlay_contains_section

Further reading: :ref:`expression_function_GeometryGroup_contains`,
:ref:`qgisselectbylocation` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_overlay_contains_section
   :end-before: .. end_overlay_crosses_section

Further reading: :ref:`expression_function_GeometryGroup_crosses`,
:ref:`qgisselectbylocation` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_overlay_crosses_section
   :end-before: .. end_overlay_disjoint_section

Further reading: :ref:`expression_function_GeometryGroup_disjoint`,
:ref:`qgisselectbylocation` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_overlay_disjoint_section
   :end-before: .. end_overlay_equals_section

Further reading: :ref:`qgisselectbylocation` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_overlay_equals_section
   :end-before: .. end_overlay_intersects_section

Further reading: :ref:`expression_function_GeometryGroup_intersects`,
:ref:`qgisselectbylocation` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_overlay_intersects_section
   :end-before: .. end_overlay_nearest_section

Further reading: :ref:`qgisjoinbynearest` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_overlay_nearest_section
   :end-before: .. end_overlay_touches_section

Further reading: :ref:`expression_function_GeometryGroup_touches`,
:ref:`qgisselectbylocation` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_overlay_touches_section
   :end-before: .. end_overlay_within_section

Further reading: :ref:`expression_function_GeometryGroup_within`,
:ref:`qgisselectbylocation` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_overlay_within_section
   :end-before: .. end_point_n_section

Further reading: :ref:`qgisextractspecificvertices` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_point_n_section
   :end-before: .. end_point_on_surface_section

Further reading: :ref:`qgispointonsurface` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_point_on_surface_section
   :end-before: .. end_pole_of_inaccessibility_section

Further reading: :ref:`qgispoleofinaccessibility` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_pole_of_inaccessibility_section
   :end-before: .. end_project_section

Further reading: :ref:`qgisprojectpointcartesian` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_project_section
   :end-before: .. end_reverse_section

Further reading: :ref:`qgisreverselinedirection` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_reverse_section
   :end-before: .. end_segments_to_lines_section

Further reading: :ref:`qgisexplodelines` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_segments_to_lines_section
   :end-before: .. end_simplify_section

Further reading: :ref:`qgissimplifygeometries` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_simplify_section
   :end-before: .. end_simplify_vw_section

Further reading: :ref:`qgissimplifygeometries` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_simplify_vw_section
   :end-before: .. end_single_sided_buffer_section

Further reading: :ref:`qgissinglesidedbuffer` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_single_sided_buffer_section
   :end-before: .. end_smooth_section

Further reading: :ref:`qgissmoothgeometry` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_smooth_section
   :end-before: .. end_start_point_section

Further reading: :ref:`qgisextractspecificvertices` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_start_point_section
   :end-before: .. end_sym_difference_section

Further reading: :ref:`qgissymmetricaldifference` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_sym_difference_section
   :end-before: .. end_tapered_buffer_section

Further reading: :ref:`qgistaperedbuffer` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_tapered_buffer_section
   :end-before: .. end_touches_section

Further reading: :ref:`expression_function_GeometryGroup_overlay_touches`

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_touches_section
   :end-before: .. end_transform_section

Further reading: :ref:`qgisreprojectlayer` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_transform_section
   :end-before: .. end_translate_section

Further reading: :ref:`qgistranslategeometry` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_translate_section
   :end-before: .. end_wedge_buffer_section

Further reading: :ref:`qgiswedgebuffers` algorithm

.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_wedge_buffer_section
   :end-before: .. end_within_section

Further reading: :ref:`expression_function_GeometryGroup_overlay_within`


.. include:: expression_help/GeometryGroup.rst
   :start-after: .. end_within_section

Layout Functions
----------------

This group contains functions to manipulate print layout items properties.

.. contents::
   :local:
   :class: toc_columns

.. include:: expression_help/Layout.rst
   :start-after: :orphan:
   :end-before: .. end_item_variables_section

Further reading: List of default :ref:`variables <expression_variables>`

.. include:: expression_help/Layout.rst
   :start-after: .. end_item_variables_section


Map Layers
----------

This group contains a list of the available layers in the current project.
This offers a convenient way to write expressions referring to multiple layers,
such as when performing :ref:`aggregates <aggregates_function>`, :ref:`attribute
<record_attributes>` or :ref:`spatial <geometry_functions>` queries.

It also provides some convenient functions to manipulate layers.

.. contents::
   :local:
   :class: toc_columns

.. include:: expression_help/Map_Layers.rst
   :start-after: :orphan:


.. index:: Map data structure, Dictionary, Key-value pairs, Associative arrays
.. _maps_functions:

Maps Functions
--------------

This group contains functions to create or manipulate keys and values of map
data structures (also known as dictionary objects, key-value pairs, or associative
arrays). Unlike the :ref:`list data structure <array_functions>` where values
order matters, the order of the key-value pairs in the map object is not relevant
and values are identified by their keys.

.. contents::
   :local:
   :class: toc_columns

.. include:: expression_help/Maps.rst
   :start-after: :orphan:


Mathematical Functions
-----------------------

This group contains math functions (e.g., square root, sin and cos).

.. contents::
   :local:
   :class: toc_columns

.. include:: expression_help/Math.rst
   :start-after: :orphan:


Operators
----------

This group contains operators (e.g., +, -, \*).
Note that for most of the mathematical functions below,
if one of the inputs is NULL then the result is NULL.

.. csv-table::
   :header: "Function", "Description"
   :widths: 27,68
   :class: longtable

   "a + b", "Addition of two values (a plus b)"
   "a - b", "Subtraction of two values (a minus b)."
   "a * b", "Multiplication of two values (a multiplied by b)"
   "a / b", "Division of two values (a divided by b)"
   "a % b", "Remainder of division of a by b (eg, 7 % 2 = 1, or 2 fits into 7 three times with remainder 1)"
   "a ^ b", "Power of two values (for example, 2^2=4 or 2^3=8)"
   "a < b", "Compares two values and evaluates to 1 if the left value is less than the right value (a is smaller than b)"
   "a <= b", "Compares two values and evaluates to 1 if the left value is less than or equal to the right value"
   "a <> b", "Compares two values and evaluates to 1 if they are not equal"
   "a = b", "Compares two values and evaluates to 1 if they are equal"
   "a != b", "a and b are not equal"
   "a > b", "Compares two values and evaluates to 1 if the left value is greater than the right value (a is larger than b)"
   "a >= b", "Compares two values and evaluates to 1 if the left value is greater than or equal to the right value"
   "a ~ b", "a matches the regular expression b"
   "||", "Joins two values together into a string. If one of the values is NULL the result will be NULL"
   "'\\n'", "Inserts a new line in a string"
   "LIKE", "Returns 1 if the first parameter matches the supplied pattern"
   "ILIKE", "Returns 1 if the first parameter matches case-insensitive the supplied
   pattern (ILIKE can be used instead of LIKE to make the match case-insensitive)"
   "a IS b", "Tests whether two values are identical. Returns 1 if a is the same as b"
   "a OR b", "Returns 1 when condition a or condition b is true"
   "a AND b", "Returns 1 when conditions a and b are true"
   "NOT", "Negates a condition"
   """Column_name""", "Value of the field *Column_name*, take care to not be confused with simple quote, see below"
   "'string'", "a string value, take care to not be confused with double quote, see above"
   "NULL", "null value"
   "a IS NULL", "a has no value"
   "a IS NOT NULL", "a has a value"
   "a IN (value[,value])", "a is below the values listed"
   "a NOT IN (value[,value])", "a is not below the values listed"

**Some examples:**

* Joins a string and a value from a column name::

    'My feature''s id is: ' || "gid"

* Test if the "description" attribute field starts with the 'Hello' string
  in the value (note the position of the ``%`` character)::

    "description" LIKE 'Hello%'


.. _processing_functions:

Processing Functions
-------------------------

This group contains functions that operate on processing algorithms.

.. contents:: :local:

.. include:: expression_help/Processing.rst
   :start-after: :orphan:


.. _raster_functions:

Rasters Functions
-----------------

This group contains functions to operate on raster layer.

.. contents:: :local:

.. include:: expression_help/Rasters.rst
   :start-after: :orphan:


.. _record_attributes:

Record and Attributes Functions
-------------------------------

This group contains functions that operate on record identifiers.

.. contents::
   :local:
   :class: toc_columns

.. include:: expression_help/Record_and_Attributes.rst
   :start-after: :orphan:
   :end-before: .. end_attributes_section

Further reading: :ref:`maps_functions`

.. include:: expression_help/Record_and_Attributes.rst
   :start-after: .. end_attributes_section
   :end-before: .. end_get_feature_by_id_section

Further reading: :ref:`expression_function_Record_and_Attributes_$id`

.. include:: expression_help/Record_and_Attributes.rst
   :start-after: .. end_get_feature_by_id_section
   :end-before: .. end_represent_value_section

Further reading: :ref:`widget types <edit_widgets>` 

.. include:: expression_help/Record_and_Attributes.rst
   :start-after: .. end_represent_value_section
   :end-before: .. end_sqlite_fetch_and_increment_section

Further reading: :ref:`project_data_source_properties`, :ref:`vector_relations`

.. include:: expression_help/Record_and_Attributes.rst
   :start-after: .. end_sqlite_fetch_and_increment_section


.. index:: Relations
.. _relations_list:

Relations
---------

This group contains the list of the :ref:`relations <project_relations>`
available in the current project, with their description. It provides a quick
access to the relation ID for writing an expression (with e.g. the
:ref:`relation_aggregate <expression_function_Aggregates_relation_aggregate>`
function) or customizing a form.

.. _string_functions:

String Functions
-----------------

This group contains functions that operate on strings
(e.g., that replace, convert to upper case).

.. contents::
   :local:
   :class: toc_columns

.. include:: expression_help/String.rst
   :start-after: :orphan:
   :end-before: .. end_concat_section

**About fields concatenation**

You can also concatenate strings or field values using either ``||`` or ``+``
operators, with some special characteristics:

* The ``+`` operator also means sum up expression, so if you have an integer
  (field or numeric value) operand, this can be error prone and you better use
  the others::

   'My feature id is: ' + "gid" => triggers an error as gid returns an integer

* When any of the arguments is a NULL value, either ``||`` or ``+`` will
  return a NULL value. To return the other arguments regardless the NULL value,
  you may want to use the ``concat`` function::

    'My feature id is: ' + NULL ==> NULL 
    'My feature id is: ' || NULL => NULL 
    concat('My feature id is: ', NULL) => My feature's id is 


.. include:: expression_help/String.rst
   :start-after: .. end_concat_section


User Expressions
----------------

This group contains the expressions saved as
:ref:`user expressions <user_expressions_functions>`.


.. _expression_variables:

Variables
---------

This group contains dynamic variables related to the application, the project
file and other settings.
The availability of variables depends on the context:

- from the |expressionSelect| :sup:`Select by expression` dialog
- from the |calculateField| :sup:`Field calculator` dialog
- from the layer properties dialog
- from the print layout

To use these variables in an expression, they should be preceded by the
``@`` character (e.g, ``@row_number``).

.. csv-table::
   :header: "Function", "Description"
   :widths: 25, 70

   "algorithm_id", "The unique ID of an algorithm"
   "animation_end_time", "End of the animation's overall temporal time range (as a datetime value)"
   "animation_interval", "Duration of the animation's overall temporal time range (as an interval value)"
   "animation_start_time", "Start of the animation's overall temporal time range (as a datetime value)"
   "atlas_feature", "The current atlas feature (as feature object)"
   "atlas_featureid", "The current atlas feature ID"
   "atlas_featurenumber", "The current atlas feature number in the layout"
   "atlas_filename", "The current atlas file name"
   "atlas_geometry", "The current atlas feature geometry"
   "atlas_layerid", "The current atlas coverage layer ID"
   "atlas_layername", "The current atlas coverage layer name"
   "atlas_pagename", "The current atlas page name"
   "atlas_totalfeatures", "The total number of features in atlas"
   "canvas_cursor_point", "The last cursor position on the canvas in the
   project's geographical coordinates"
   "cluster_color", "The color of symbols within a cluster, or NULL if
   symbols have mixed colors"
   "cluster_size", "The number of symbols contained within a cluster"
   "current_feature", "The feature currently being edited in the attribute
   form or table row"
   "current_geometry", "The geometry of the feature currently being edited
   in the form or the table row"
   "current_parent_feature", "represents the feature currently being
   edited in the parent form. Only usable in an embedded form context."
   "current_parent_geometry", "represents the geometry of the feature currently being
   edited in the parent form. Only usable in an embedded form context."
   "form_mode", "What the form is used for, like AddFeatureMode, SingleEditMode, MultiEditMode,
   SearchMode, AggregateSearchMode or IdentifyMode as string."
   "frame_duration", "Temporal duration of each animation frame (as an interval value)"
   "frame_number", "Current frame number during animation playback"
   "frame_rate", "Number of frames per second during animation playback"
   "fullextent_maxx", "Maximum x value from full canvas extent (including all layers)"
   "fullextent_maxy", "Maximum y value from full canvas extent (including all layers)"
   "fullextent_minx", "Minimum x value from full canvas extent (including all layers)"
   "fullextent_miny", "Minimum y value from full canvas extent (including all layers)"
   "geometry_part_count", "The number of parts in rendered feature's geometry"
   "geometry_part_num", "The current geometry part number for feature being rendered"
   "geometry_point_count", "The number of points in the rendered geometry's part"
   "geometry_point_num", "The current point number in the rendered geometry's part"
   "grid_axis", "The current grid annotation axis (eg, 'x' for longitude, 'y' for latitude)"
   "grid_number", "The current grid annotation value"
   "item_id", "The layout item user ID (not necessarily unique)"
   "item_uuid", "The layout item unique ID"
   "layer", "The current layer"
   "layer_id", "The ID of current layer"
   "layer_ids", "The IDs of all the map layers in the current project as a list"
   "layer_name", "The name of current layer"
   "layers", "All the map layers in the current project as a list"
   "layout_dpi", "The composition resolution (DPI)"
   "layout_name", "The layout name"
   "layout_numpages", "The number of pages in the layout"
   "layout_page", "The page number of the current item in the layout"
   "layout_pageheight", "The active page height in the layout (in mm)"
   "layout_pagewidth", "The active page width in the layout (in mm)"
   "legend_column_count", "The number of columns in the legend"
   "legend_filter_by_map", "Indicates if the content of the legend is
   filtered by the map"
   "legend_filter_out_atlas", "Indicates if the atlas is filtered out of the legend"
   "legend_split_layers", "Indicates if layers can be split in the legend"
   "legend_title", "The title of the legend"
   "legend_wrap_string", "The character(s) used to wrap the legend text"
   "map_crs", "The Coordinate reference system of the current map"
   "map_crs_acronym", "The acronym of the Coordinate reference
   system of the current map"
   "map_crs_definition", "The full definition of the Coordinate
   reference system of the current map"
   "map_crs_description", "The name of the Coordinate reference
   system of the current map"
   "map_crs_ellipsoid", "The acronym of the ellipsoid of the
   Coordinate reference system of the current map"
   "map_crs_proj4", "The Proj4 definition of the Coordinate
   reference system of the current map"
   "map_crs_wkt", "The WKT definition of the Coordinate reference
   system of the current map"
   "map_end_time", "The end of the map's temporal time range
   (as a datetime value)"
   "map_extent", "The geometry representing the current extent of the map"
   "map_extent_center", "The point feature at the center of the map"
   "map_extent_height", "The current height of the map"
   "map_extent_width", "The current width of the map"
   "map_id", "The ID of current map destination. This will be 'canvas'
   for canvas renders, and the item ID for layout map renders"
   "map_interval", "The duration of the map's temporal time range
   (as an interval value)"
   "map_layer_ids", "The list of map layer IDs visible in the map"
   "map_layers", "The list of map layers visible in the map"
   "map_rotation", "The current rotation of the map"
   "map_scale", "The current scale of the map"
   "map_start_time", "The start of the map's temporal time range
   (as a datetime value)"
   "map_units", "The units of map measurements"
   "model_path", "Full path (including file name) of current model
   (or project path if model is embedded in a project)."
   "model_folder", "Folder containing current model (or project folder
   if model is embedded in a project)."
   "model_name", "Name of current model"
   "model_group", "Group for current model"
   "notification_message", "Content of the notification message sent by the provider
   (available only for actions triggered by provider notifications)."
   "parent", "Refers to the current feature in the parent layer, providing access to
   its attributes and geometry when filtering an :ref:`aggregate <aggregates_function>`
   function"
   "project_abstract", "The project abstract, taken from project metadata"
   "project_area_units", "The area unit for the current project, used when
   calculating areas of geometries"
   "project_author", "The project author, taken from project metadata"
   "project_basename", "The basename of current project's filename
   (without path and extension)"
   "project_creation_date", "The project creation date, taken from project metadata"
   "project_crs", "The Coordinate reference system of the project"
   "project_crs_arconym", "The acronym of the Coordinate reference system of the project"
   "project_crs_definition", "The full definition of the Coordinate reference
   system of the project"
   "project_crs_description", "The description of the Coordinate reference system of the project"
   "project_crs_ellipsoid", "The ellipsoid of the Coordinate reference system of the project"
   "project_crs_proj4", "The Proj4 representation of the Coordinate reference system of the project"
   "project_crs_wkt", "The WKT (well known text) representation of the coordinate reference system of the project"
   "project_distance_units", "The distance unit for the current project,
   used when calculating lengths of geometries and distances"
   "project_ellipsoid", "The name of the ellipsoid of the current project,
   used when calculating geodetic areas or lengths of geometries"
   "project_filename", "The filename of the current project"
   "project_folder", "The folder of the current project"
   "project_home", "The home path of the current project"
   "project_identifier", "The project identifier, taken from the project's metadata"
   "project_keywords", "The project keywords, taken from the project's metadata"
   "project_last_saved", "Date/time when project was last saved."
   "project_path", "The full path (including file name) of the current project"
   "project_title", "The title of current project"
   "project_units", "The units of the project's CRS"
   "qgis_locale", "The current language of QGIS"
   "qgis_os_name", "The current Operating system name, eg 'windows', 'linux' or 'osx'"
   "qgis_platform", "The QGIS platform, eg 'desktop' or 'server'"
   "qgis_release_name", "The current QGIS release name"
   "qgis_short_version", "The current QGIS version short string"
   "qgis_version", "The current QGIS version string"
   "qgis_version_no", "The current QGIS version number"
   "row_number", "Stores the number of the current row"
   "snapping_results", "Gives access to snapping results while digitizing a
   feature (only available in add feature)"
   "scale_value", "The current scale bar distance value"
   "symbol_angle", "The angle of the symbol used to render the feature
   (valid for marker symbols only)"
   "symbol_color", "The color of the symbol used to render the feature"
   "symbol_count", "The number of features represented by the symbol (in the layout legend)"
   "symbol_id", "The Internal ID of the symbol (in the layout legend)"
   "symbol_label", "The label for the symbol (either a user defined
   label or the default autogenerated label - in the layout legend)"
   "symbol_layer_count", "Total number of symbol layers in the symbol"
   "symbol_layer_index", "Current symbol layer index"
   "symbol_marker_column", "Column number for marker (valid for point pattern fills only)."
   "symbol_marker_row", "Row number for marker (valid for point pattern fills only)."
   "user_account_name", "The current user's operating system account name"
   "user_full_name", "The current user's operating system user name"
   "value", "The current value"
   "with_variable", "Allows setting a variable for usage within an expression
   and avoid recalculating the same value repeatedly"
   "zoom_level", "Zoom level of the tile that is being rendered (derived from the current
   map scale). Normally in interval [0, 20]."

**Some examples:**

* Return the X coordinate of a map item center in layout::

   x( map_get( item_variables( 'map1'), 'map_extent_center' ) )

* Return, for each feature in the current layer, the number of overlapping airport
  features::

   aggregate( layer:='airport', aggregate:='count', expression:="code",
                  filter:=intersects( $geometry, geometry( @parent ) ) )

* Get the object_id of the first snapped point of a line::

   with_variable(
     'first_snapped_point',
     array_first( @snapping_results ),
     attribute(
       get_feature_by_id(
         map_get( @first_snapped_point, 'layer' ),
         map_get( @first_snapped_point, 'feature_id' )
       ),
       'object_id'
     )
   )


Recent Functions
-----------------

This group contains recently used functions. Depending on the context of its
usage (feature selection, field calculator, generic), recently applied expressions
are added to the corresponding list (up to ten expressions), sorted from
more to less recent.
This makes it easy to quickly retrieve and reapply previously used expressions.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |calculateField| image:: /static/common/mActionCalculateField.png
   :width: 1.5em
.. |expressionSelect| image:: /static/common/mIconExpressionSelect.png
   :width: 1.5em
