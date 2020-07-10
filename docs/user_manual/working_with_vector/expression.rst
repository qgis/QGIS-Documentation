.. index:: Expressions

.. _vector_expressions:

************
Expressions
************

.. only:: html

   .. contents::
      :local:
      :depth: 2

Based on layer data and prebuilt or user defined functions, **Expressions**
offer a powerful way to manipulate attribute value, geometry and variables
in order to dynamically change the geometry style, the content or position
of the label, the value for diagram, the height of a layout item,
select some features, create virtual field ...

.. _expression_builder:

The Expression string builder
=============================

Main dialog to build expressions, the :guilabel:`Expression string builder`
is available from many parts in QGIS and, can particularly be accessed when:

* clicking the |expression| button;
* :ref:`selecting features <sec_selection>` with the |expressionSelect|
  :sup:`Select By Expression...` tool;
* :ref:`editing attributes <calculate_fields_values>` with e.g. the
  |calculateField| :sup:`Field calculator` tool;
* manipulating symbology, label or layout item parameters with the |dataDefined|
  :sup:`Data defined override` tool (see :ref:`data_defined`);
* building a :ref:`geometry generator <geometry_generator_symbol>` symbol layer;
* doing some :ref:`geoprocessing <label_processing>`.

The Expression builder dialog offers access to the:

* :ref:`Expression tab <functions_list>` which, thanks to a list of predefined
  functions, helps to write and check the expression to use;
* :ref:`Function Editor tab <function_editor>` which helps to extend the list of
  functions by creating custom ones.

**Some use cases of expressions:**

* From Field Calculator, calculate a "pop_density" field using existing "total_pop"
  and "area_km2" fields::

    "total_pop" / "area_km2"

* Update the field "density_level" with categories according to the "pop_density" values::

    CASE WHEN "pop_density" < 50 THEN 'Low population density'
         WHEN "pop_density" >= 50 and "pop_density" < 150 THEN 'Medium population density'
         WHEN "pop_density" >= 150 THEN 'High population density'
    END

* Apply a categorized style to all the features according to whether their average house
  price is smaller or higher than 10000€ per square metre::

    "price_m2" > 10000

* Using the "Select By Expression..." tool, select all the features representing
  areas of “High population density” and whose average house price is higher than
  10000€ per square metre::

    "density_level" = 'High population density' and "price_m2" > 10000

  Likewise, the previous expression could also be used to define which features
  should be labeled or shown in the map.

Using expressions offers you a lot of possibilities.

.. index:: Named parameters
   single: Expressions; Named parameters
   single: Functions; Named parameters

.. tip:: **Use named parameters to improve the expression reading**

  Some functions require many parameters to be set. The expression engine supports the
  use of named parameters. This means that instead of writing the cryptic expression
  ``clamp( 1, 2, 9)``, you can use ``clamp( min:=1, value:=2, max:=9)``. This also allows
  arguments to be switched, e.g. ``clamp( value:=2, max:=9, min:=1)``. Using named parameters
  helps clarify what the arguments for an expression function refer to, which is helpful
  when you are trying to interpret an expression at a later date!


.. index:: Functions
.. _functions_list:

List of functions
=================

The :guilabel:`Expression` tab provides the main interface to write expressions
using functions, layer's fields and values. It contains following widgets:

* An expression editor area to type or paste expressions. Autocompletion is
  available to speed expression writing:

  * Corresponding variables, function names and field names to the input text
    are shown below: use the :kbd:`Up` and :kbd:`Down` arrows to browse the
    items and press :kbd:`Tab` to insert in the expression or simply click
    on the wished item.
  * Function parameters are shown while filling them.

  QGIS also checks the expression rightness and highlights all the errors using:

  * *Underline*: for unknown functions, wrong or invalid arguments;
  * *Marker*: for every other error (eg, missing parenthesis, unexpected
    character) at a single location.

  .. tip:: **Document your expression with comments**

    When using complex expression, it is good practice to add
    text either as a multiline comment or inline comments to help you remember.

    ::

      /*
      Labels each region with its highest (in altitude) airport(s)
      and altitude, eg 'AMBLER : 264m' for the 'Northwest Artic' region
      */
      with_variable(
        'airport_alti', -- stores the highest altitude of the region
        aggregate(
          'airports',
          'max',
          "ELEV", -- the field containing the altitude
          -- and limit the airports to the region they are within
          filter := within( $geometry, geometry( @parent ) )
        ),
          aggregate( -- finds airports at the same altitude in the region
            'airports',
            'concatenate',
            "NAME",
            filter := within( $geometry, geometry( @parent ) )
              and "ELEV" = @airport_alti
          )
          || ' : ' || @airport_alti || 'm'
          -- using || allows regions without airports to be skipped
      )

* Above the expression editor, a set of tools helps you:

  * |fileNew|:sup:`Clear the expression editor`
  * create and manage :ref:`user expressions <user_expressions_functions>`

* Under the expression editor, you find:

  * a set of basic operators to help you build the expression
  * an indication of the expected format of output when you are data-defining
    feature properties
  * a live :guilabel:`Output preview` of the expression, evaluated
    on the first feature of the Layer by default.
    You can browse and evaluate other features of the layer using the
    :guilabel:`Feature` combobox (the values are taken from the
    :ref:`display name <maptips>` property of the layer).

    In case of error, it indicates it and you can access the details with the
    provided hyperlink.

* A function selector displays the list of functions, variables, fields...
  organized in groups. A search box is available to filter the list and quickly
  find a particular function or field.
  Double-clicking an item adds it to the expression editor.
* A help panel displays help for each selected item in the function selector.

  .. tip::

   Press :kbd:`Ctrl+Click` when hovering a function name in an expression to
   automatically display its help in the dialog.

  A field's values widget shown when a field is selected in the function selector
  helps to fetch features attributes:

  * Look for a particular field value
  * Display the list of :guilabel:`All Unique` or :guilabel:`10 Samples` values.
    Also available from right-click.

    When the field is mapped with another layer or a set of values, i.e. if the
    :ref:`field widget <edit_widgets>` is of *RelationReference*, *ValueRelation*
    or *ValueMap* type, it's possible to list all the values of the mapped field
    (from the referenced layer, table or list). Moreover, you can filter this
    list to |checkbox| :guilabel:`Only show values in use` in the current field.

  Double-clicking a field value in the widget adds it to the expression editor.

  .. tip::

   The right panel, showing functions help or field values, can be
   collapsed (invisible) in the dialog. Press the :guilabel:`Show Values`
   or :guilabel:`Show Help` button to get it back.

.. _figure_expression_tab:

.. figure:: img/function_list.png
   :align: center
   :width: 100%

   The Expression tab


.. index:: Aggregates
.. _aggregates_function:

Aggregates Functions
--------------------

This group contains functions which aggregate values over layers and fields.

.. contents:: :local:

.. include:: expression_help/Aggregates.txt

.. csv-table::
   :header: "Function", "Description"
   :widths: 20, 75
   :class: longtable

   "aggregate", "Returns an aggregate value calculated using features from another layer"
   "array_agg", "Returns an array of aggregated values from a field or expression"
   "collect", "Returns the multipart geometry of aggregated geometries from an expression"
   "concatenate", "Returns all aggregated strings from a field or expression joined by a delimiter"
   "concatenate_unique", "Returns all unique aggregated strings from a field
   or expression joined by a delimiter"
   "count", "Returns the count of matching features"
   "count_distinct", "Returns the count of distinct values"
   "count_missing", "Returns the count of missing (null) values"
   "iqr", "Returns the calculated inter quartile range from a field or expression"
   "majority", "Returns the aggregate majority of values (most commonly occurring
   value) from a field or expression"
   "max_length", "Returns the maximum length of strings from a field or expression"
   "maximum", "Returns the aggregate maximum value from a field or expression"
   "mean", "Returns the aggregate mean value from a field or expression"
   "median", "Returns the aggregate median value from a field or expression"
   "min_length", "Returns the minimum length of strings from a field or expression"
   "minimum", "Returns the aggregate minimum value from a field or expression"
   "minority", "Returns the aggregate minority of values (least commonly occurring
   value) from a field or expression"
   "q1", "Returns the calculated first quartile from a field or expression"
   "q3", "Returns the calculated third quartile from a field or expression"
   "range", "Returns the aggregate range of values (maximum - minimum) from a field or expression"
   "relation_aggregate", "Returns an aggregate value calculated using all matching
   child features from a layer relation"
   "stdev", "Returns the aggregate standard deviation value from a field or expression"
   "sum", "Returns the aggregate summed value from a field or expression"

**Examples:**

* Return the maximum of the "passengers" field from features in the layer
  grouped by "station_class" field::

   maximum("passengers", group_by:="station_class")

* Calculate the total number of passengers for the stations inside the current
  atlas feature::

   aggregate('rail_stations','sum',"passengers",
     intersects(@atlas_geometry, $geometry))

* Return the mean of the "field_from_related_table" field for all matching
  child features using the 'my_relation' relation from the layer::

   relation_aggregate('my_relation', 'mean', "field_from_related_table")

  or::

   relation_aggregate(relation:='my_relation', aggregate := 'mean',
     expression := "field_from_related_table")


.. index:: Array, List data structure
.. _array_functions:

Array Functions
---------------

This group contains functions to create and manipulate arrays (also known as
list data structures). The order of values within the array matters, unlike the
:ref:`'map' data structure <maps_functions>`, where the order of key-value pairs
is irrelevant and values are identified by their keys.


.. csv-table::
   :header: "Function", "Description"
   :widths: 20, 75
   :class: longtable

   "array", "Returns an array containing all the values passed as parameter"
   "array_all", "Returns true if an array contains all the values of a given array"
   "array_append", "Returns an array with the given value added at the end"
   "array_cat", "Returns an array containing all the given arrays concatenated"
   "array_contains", "Returns true if an array contains the given value"
   "array_distinct", "Returns an array containing distinct values of the given array"
   "array_filter", "Returns an array with only the items for which an expression
   evaluates to true"
   "array_find", "Returns the index (0 for the first one) of a value within an array.
   Returns -1 if the value is not found."
   "array_first", "Returns the first value of an array"
   "array_foreach", "Returns an array with the given expression evaluated on each item"
   "array_get", "Returns the Nth value (0 for the first one) of an array"
   "array_insert", "Returns an array with the given value added at the given position"
   "array_intersect", "Returns true if any element of array_1 exists in array_2"
   "array_last", "Returns the last element of an array"
   "array_length", "Returns the number of elements of an array"
   "array_prepend", "Returns an array with the given value added at the beginning"
   "array_remove_all", "Returns an array with all the entries of the given value removed"
   "array_remove_at", "Returns an array with the given index removed"
   "array_reverse", "Returns the given array with array values in reversed order"
   "array_slice", "Returns the values of the array from the start_pos argument
   up to and including the end_pos argument"
   "array_sort", "Returns the provided array with its elements sorted"
   "array_to_string", "Concatenates array elements into a string separated by a
   delimiter and using optional string for empty values"
   "generate_series", "Creates an array containing a sequence of numbers"
   "regexp_matches", "Returns an array of all strings captured by capturing groups,
   in the order the groups themselves appear in the supplied regular expression
   against a string"
   "string_to_array", "Splits string into an array using supplied delimiter and
   optional string for empty values"


Color Functions
----------------

This group contains functions for manipulating colors.

.. contents:: :local:

.. include:: expression_help/Color.txt

.. csv-table::
   :header: "Function", "Description"
   :widths: 25, 70

   "color_cmyk", "Returns a string representation of a color based on its cyan,
   magenta, yellow and black components"
   "color_cmyka", "Returns a string representation of a color based on its cyan,
   magenta, yellow, black and alpha (transparency) components"
   "color_grayscale_average", "Applies a grayscale filter and returns a string
   representation from a provided color"
   "color_hsl", "Returns a string representation of a color based on its hue,
   saturation, and lightness attributes"
   "color_hsla", "Returns a string representation of a color based on its hue,
   saturation, lightness and alpha (transparency) attributes"
   "color_hsv", "Returns a string representation of a color based on its hue,
   saturation, and value attributes"
   "color_hsva", "Returns a string representation of a color based on its hue,
   saturation, value and alpha (transparency) attributes"
   "color_mix_rgb", "Returns a string representing a color mixing the red, green,
   blue, and alpha values of two provided colors based on a given ratio"
   "color_part", "Returns a specific component from a color string, eg the red component or alpha component"
   "color_rgb", "Returns a string representation of a color based on its red, green, and blue components"
   "color_rgba", "Returns a string representation of a color based on its red,
   green, blue, and alpha (transparency) components"
   "create_ramp", "Returns a gradient ramp from a map of color strings and steps"
   "darker", "Returns a darker (or lighter) color string"
   "lighter", "Returns a lighter (or darker) color string"
   "project_color", "Returns a color from the project's color scheme"
   "ramp_color", "Returns a string representing a color from a color ramp"
   "set_color_part", "Sets a specific color component for a color string, eg the red component or alpha component"


Conditional Functions
---------------------

This group contains functions to handle conditional checks in expressions.

.. csv-table::
   :header: "Function", "Description"
   :widths: auto

   "CASE WHEN ... THEN ... END", "Evaluates an expression and returns a result if true. You can test multiple conditions"
   "CASE WHEN ... THEN ... ELSE ... END", "Evaluates an expression and
   returns a different result whether it's true or false. You can test multiple conditions"
   "coalesce", "Returns the first non-NULL value from the expression list"
   "if", "Tests a condition and returns a different result depending on the conditional check"
   "nullif(value1, value2)", "Returns a null value if value1 equals value2
   otherwise it returns value1. This can be used to conditionally substitute values with NULL."
   "try", "Tries an expression and returns its value if error-free,
   an alternative value (if provided) or Null if an error occurs"

**Some example:**

* Send back a value if the first condition is true, else another value::

    CASE WHEN "software" LIKE '%QGIS%' THEN 'QGIS' ELSE 'Other' END


.. _conversion_functions:

Conversions Functions
---------------------

This group contains functions to convert one data type to another
(e.g., string to integer, integer to string).

.. csv-table::
   :header: "Function", "Description"
   :widths: auto

   "to_date", "Converts a string into a date object"
   "to_datetime", "Converts a string into a datetime object"
   "to_dm", "Converts a coordinate to degree, minute"
   "to_dms", "Converts coordinate to degree, minute, second"
   "to_int", "Converts a string to integer number"
   "to_interval", "Converts a string to an interval type (can be used
   to take days, hours, months, etc. of a date)"
   "to_real", "Converts a string to a real number"
   "to_string", "Converts number to string"
   "to_time", "Converts a string into a time object"


Custom Functions
-----------------

This group contains functions created by the user.
See :ref:`function_editor` for more details.


Date and Time Functions
------------------------

This group contains functions for handling date and time data.

.. csv-table::
   :header: "Function", "Description"
   :widths: auto

   "age", "Returns as an interval the difference between two dates or datetimes"
   "datetime_from_epoch |312|", "Returns a datetime whose date and time are the number of milliseconds,
   msecs, that have passed since 1970-01-01T00:00:00.000, Coordinated Universal Time (Qt.UTC),
   and converted to Qt.LocalTime."
   "day", "Extracts the day from a date or datetime, or the number of days from an interval"
   "day_of_week", "Returns a number corresponding to the day of the week for a specified date or datetime"
   "epoch", "Returns the interval in milliseconds between the unix epoch and a given date value"
   "hour", "Extracts the hour from a datetime or time, or the number of hours from an interval"
   "make_date |314|", "Creates a date value from year, month and day numbers"
   "make_datetime |314|", "Creates a datetime value from year, month, day, hour, minute and second numbers"
   "make_time |314|", "Creates a time value from hour, minute and second numbers"
   "minute", "Extracts the minute from a datetime or time, or the number of minutes from an interval"
   "month", "Extracts the month part from a date or datetime, or the number of months from an interval"
   "now", "Returns current date and time"
   "second", "Extracts the second from a datetime or time, or the number of seconds from an interval"
   "week", "Extracts the week number from a date or datetime, or the number of weeks from an interval"
   "year", "Extracts the year part from a date or datetime, or the number of years from an interval"

This group also shares several functions with the :ref:`conversion_functions` (
to_date, to_time, to_datetime, to_interval) and :ref:`string_functions`
(format_date) groups.

**Some examples:**

* Get today's month and year in the "month_number/year" format:

  .. code-block:: sql

     format_date(now(),'MM/yyyy')
     -- Returns '03/2017'

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

     to_datetime('2017-09-29 12:00:00') - to_datetime(now())
     -- Returns <interval: 202.49 days>

* Get the datetime of 100 days from now:

  .. code-block:: sql

     now() + to_interval('100 days')
     -- Returns <datetime: 2017-06-18 01:00:00>

.. note:: **Storing date and datetime and intervals on fields**

   The ability to store *date*, *time* and *datetime* values directly on
   fields may depend on the data source's provider (e.g., Shapefile accepts
   *date* format, but not *datetime* or *time* format). The following are some
   suggestions to overcome this limitation:

   * *date*, *Datetime* and *time* can be stored in text type fields after
     using the ``to_format()`` function.

   * *Intervals* can be stored in integer or decimal type fields after using
     one of the date extraction functions (e.g., ``day()`` to get the interval
     expressed in days)

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

.. csv-table::
   :header: "Function", "Description"
   :widths: auto

   "base_file_name", "Returns the base name of the file without the directory or file suffix."
   "file_exists", "Returns true if a file path exists."
   "file_name", "Returns the name of a file (including the file extension), excluding the directory."
   "file_path", "Returns the directory component of a file path, without the file name"
   "file_size", "Returns the size (in bytes) of a file."
   "file_suffix", "Returns the file extension from a file path."
   "is_directory", "Returns true if a path corresponds to a directory."
   "is_file", "Returns true if a path corresponds to a file."


Fuzzy Matching Functions
-------------------------

This group contains functions for fuzzy comparisons between values.

.. csv-table::
   :header: "Function", "Description"
   :widths: 25, 70

   "hamming_distance", "Returns the number of characters at corresponding
   positions within the input strings where the characters are different"
   "levensheim", "Returns the minimum number of character edits (insertions,
   deletions or substitutions) required to change one string to another.
   Measure the similarity between two strings"
   "longest_common_substring", "Returns the longest common substring between two strings"
   "soundex", "Returns the Soundex representation of a string"


General Functions
------------------

This group contains general assorted functions.

.. csv-table::
   :header: "Function", "Description"
   :widths: 20, 75

   "env", "Gets an environment variable and returns its content as a string.
   If the variable is not found, ``NULL`` will be returned."
   "eval", "Evaluates an expression which is passed in a string.
   Useful to expand dynamic parameters passed as context variables or fields."
   "eval_template |314|", "Evaluates a template which is passed in a string.
   Useful to expand dynamic parameters passed as context variables or fields."
   "is_layer_visible", "Returns true if a specified layer is visible"
   "layer_property", "Returns a property of a layer or a value of its metadata.
   It can be layer name, crs, geometry type, feature count..."
   "var", "Returns the value stored within a specified variable. See :ref:`expression_variables` below"
   "with_variable", "Creates and sets a variable for any expression code that
   will be provided as a third argument. Useful to avoid repetition in expressions
   where the same value needs to be used more than once."


.. _geometry_functions:

Geometry Functions
------------------

This group contains functions that operate on geometry objects
(e.g. buffer, transform, $area).

.. csv-table::
   :header: "Function", "Description"
   :widths: 25, 70
   :class: longtable

   "$area", "Returns the area size of the current feature"
   "$geometry", "Returns the geometry of the current feature (can be used for
   processing with other functions)"
   "$length", "Returns the length of the current line feature"
   "$perimeter", "Returns the perimeter of the current polygon feature"
   "$x", "Returns the X coordinate of the current feature"
   "$x_at(n)", "Returns the X coordinate of the nth node of the current feature's geometry"
   "$y", "Returns the Y coordinate of the current feature"
   "$y_at(n)", "Returns the Y coordinate of the nth node of the current feature's geometry"
   "angle_at_vertex", "Returns the bisector angle (average angle) to the geometry
   for a specified vertex on a linestring geometry. Angles are in degrees clockwise from north"
   "area", "Returns the area of a geometry polygon feature. Calculations are in
   the Spatial Reference System of this geometry"
   "azimuth", "Returns the north-based azimuth as the angle in radians measured
   clockwise from the vertical on point_a to point_b"
   "boundary", "Returns the closure of the combinatorial boundary of the geometry
   (ie the topological boundary of the geometry - see also :ref:`qgisboundary`)."
   "bounds", "Returns a geometry which represents the bounding box of an input geometry.
   Calculations are in the Spatial Reference System of this geometry
   (see also :ref:`qgisboundingboxes`)"
   "bounds_height", "Returns the height of the bounding box of a geometry.
   Calculations are in the Spatial Reference System of this geometry"
   "bounds_width", "Returns the width of the bounding box of a geometry.
   Calculations are in the Spatial Reference System of this geometry"
   "buffer", "Returns a geometry that represents all points whose distance from
   this geometry is less than or equal to distance. Calculations are in the Spatial
   Reference System of this geometry (see also :ref:`qgisbuffer`)"
   "buffer_by_m", "Creates a buffer along a line geometry where the buffer diameter
   varies according to the M values at the line vertices (see also :ref:`qgisbufferbym`)"
   "centroid", "Returns the geometric center of a geometry (see also :ref:`qgiscentroids`)"
   "close_line |314|",  "Returns a closed line string of the input line string by appending the
   first point to the end of the line, if it is not already closed. If the geometry is not
   a line string or multi line string then the result will be null."
   "closest_point", "Returns the point on a geometry that is closest to a second geometry"
   "collect_geometries", "Collects a set of geometries into a multi-part geometry
   object (see also :ref:`qgiscollect`)"
   "combine", "Returns the combination of two geometries"
   "contains(a,b)", "Returns 1 (true) if and only if no points of b lie in the exterior of a,
   and at least one point of the interior of b lies in the interior of a"
   "convex_hull", "Returns the convex hull of a geometry (this represents the minimum
   convex geometry that encloses all geometries within the set) (see also :ref:`qgisconvexhull`)"
   "crosses", "Returns 1 (true) if the supplied geometries have some, but not all,
   interior points in common"
   "difference(a,b)", "Returns a geometry that represents that part of geometry
   a that does not intersect with geometry b (see also :ref:`qgisdifference`)"
   "disjoint", "Returns 1 (true) if the geometries do not share any space together"
   "distance", "Returns the minimum distance (based on Spatial Reference System)
   between two geometries in projected units"
   "distance_to_vertex", "Returns the distance along the geometry to a specified vertex"
   "end_point", "Returns the last node from a geometry (see also :ref:`qgisextractspecificvertices`)"
   "extend", "Extends the start and end of a linestring geometry by a specified amount
   (see also :ref:`qgisextendlines`)"
   "exterior_ring", "Returns a line string representing the exterior ring of a polygon geometry,
   or null if the geometry is not a polygon"
   "extrude(geom,x,y)", "Returns an extruded version of the input (Multi-) Curve
   or (Multi-)Linestring geometry with an extension specified by X and Y"
   "flip_coordinates", "Returns a copy of the geometry with the X and Y coordinates
   swapped (see also :ref:`qgisswapxy`)"
   "force_rhr", "Forces a geometry to respect the Right-Hand-Rule (see also
   :ref:`qgisforcerhr`)"
   "geom_from_gml", "Returns a geometry created from a GML representation of geometry"
   "geom_from_wkb |312|", "Returns a geometry created from a Well-Known Binary (WKB) representation"
   "geom_from_wkt", "Returns a geometry created from a well-known text (WKT) representation"
   "geom_to_wkb |312|", "Returns the Well-Known Binary (WKB) representation (a BLOB) of
   a geometry"
   "geom_to_wkt", "Returns the well-known text (WKT) representation of the geometry without SRID metadata"
   "geometry", "Returns a feature's geometry"
   "geometry_n", "Returns the nth geometry from a geometry collection,
   or null if the input geometry is not a collection"
   "hausdorff_distance", "Returns basically a measure of how similar or dissimilar
   two geometries are, with a lower distance indicating more similar geometries"
   "inclination", "Returns the inclination measured from the zenith (0) to the nadir (180) on point_a to point_b"
   "interior_ring_n", "Returns the geometry of the nth interior ring from a polygon geometry,
   or null if the geometry is not a polygon"
   "intersection", "Returns a geometry that represents the shared portion of two
   geometries (see also  :ref:`qgisintersection`)"
   "intersects", "Tests whether a geometry intersects another. Returns 1 (true)
   if the geometries spatially intersect (share any portion of space) and 0 if they don't"
   "intersects_bbox", "Tests whether a geometry's bounding box overlaps another geometry's
   bounding box. Returns 1 (true) if the geometries spatially intersect
   (share any portion of space) their bounding box, or 0 if they don't"
   "is_closed", "Returns true if a line string is closed (start and end points are coincident),
   false if a line string is not closed, or null if the geometry is not a line string"
   "is_empty |312|", "Returns true if a geometry is empty (without coordinates),
   false if the geometry is not empty and NULL if there is no geometry"
   "is_empty_or_null |312|", "Returns true if a geometry is NULL or empty
   (without coordinates)  or false otherwise"
   "is_valid |312|", "Returns true if a geometry is well-formed in 2D according to
   the OGC rules (see `examples of OGC geometry validity
   <https://postgis.net/docs/using_postgis_dbmanagement.html#OGC_Validity>`_)"
   "length", "Returns length of a line geometry feature (or length of a string)"
   "line_interpolate_angle", "Returns the angle parallel to the geometry at a specified
   distance along a linestring geometry. Angles are in degrees clockwise from north."
   "line_interpolate_point", "Returns the point interpolated by a specified
   distance along a linestring geometry. (see also :ref:`qgisinterpolatepoint`)"
   "line_locate_point", "Returns the distance along a linestring corresponding
   to the closest position the linestring comes to a specified point geometry."
   "line_merge", "Returns a (Multi-)LineString geometry, where any connected LineStrings
   from the input geometry have been merged into a single linestring."
   "line_substring", "Returns the portion of a line or curve geometry falling betweeen
   specified start and end distances (measured from the beginning of the line)
   (see also :ref:`qgislinesubstring`)"
   "m", "Returns the M value of a point geometry"
   "m_max |314|", "Returns the maximum M (measure) value of a geometry"
   "m_min |314|", "Returns the minimum M (measure) value of a geometry"
   "make_circle", "Creates a circular geometry based on center point and radius"
   "make_ellipse", "Creates an elliptical geometry based on center point, axes and azimuth"
   "make_line", "Creates a line geometry from a series or an array of point geometries"
   "make_point(x,y,z,m)", "Returns a point geometry from X and Y (and optional Z or M) values"
   "make_point_m(x,y,m)", "Returns a point geometry from X and Y coordinates and M values"
   "make_polygon", "Creates a polygon geometry from an outer ring and optional series
   of inner ring geometries"
   "make_rectangle_3points", "Creates a rectangle from 3 points"
   "make_regular_polygon", "Creates a regular polygon"
   "make_square", "Creates a square from a diagonal"
   "make_triangle", "Creates a triangle polygon"
   "minimal_circle", "Returns the minimal enclosing circle of an input geometry
   (see also :ref:`qgisminimumenclosingcircle`)"
   "nodes_to_points", "Returns a multipoint geometry consisting of every node in
   the input geometry (see also :ref:`qgisextractvertices`)"
   "num_geometries", "Returns the number of geometries in a geometry collection,
   or null if the input geometry is not a collection"
   "num_interior_rings", "Returns the number of interior rings in a polygon or
   geometry collection, or null if the input geometry is not a polygon or collection"
   "num_points", "Returns the number of vertices in a geometry"
   "num_rings", "Returns the number of rings (including exterior rings) in a polygon
   or geometry collection, or null if the input geometry is not a polygon or collection"
   "offset_curve", "Returns a geometry formed by offsetting a linestring geometry to the side.
   Distances are in the Spatial Reference System of this geometry. (see also :ref:`qgisoffsetline`)"
   "order_parts", "Orders the parts of a MultiGeometry by a given criteria"
   "oriented_bbox", "Returns a geometry representing the minimal oriented
   bounding box of an input geometry (see also :ref:`qgisorientedminimumboundingbox`)"
   "overlaps", "Tests whether a geometry overlaps another. Returns 1 (true) if
   the geometries share space, are of the same dimension, but are not completely contained by each other"
   "perimeter", "Returns the perimeter of a geometry polygon feature.
   Calculations are in the Spatial Reference System of this geometry"
   "point_n", "Returns a specific node from a geometry (see also :ref:`qgisextractspecificvertices`)"
   "point_on_surface", "Returns a point guaranteed to lie on the surface of
   a geometry (see also :ref:`qgispointonsurface`)"
   "pole_of_inaccessibility", "Calculates the approximate pole of inaccessibility for
   a surface, which is the most distant internal point from the boundary of the surface
   (see also :ref:`qgispoleofinaccessibility`)"
   "project", "Returns a point projected from a start point using a distance, a
   bearing (azimuth) and an elevation in radians (see also :ref:`qgisprojectpointcartesian`)"
   "relate", "Tests or returns the Dimensional Extended 9 Intersection Model (DE-9IM)
   representation of the relationship between two geometries"
   "reverse", "Reverses the direction of a line string by reversing the order of its
   vertices (see also :ref:`qgisreverselinedirection`)"
   "rotate |312|", "Returns a rotated version of a geometry. Calculations are in
   the Spatial Reference System of this geometry (see also :ref:`qgisrotatefeatures`)"
   "segments_to_lines", "Returns a multi line geometry consisting of a line for
   every segment in the input geometry (see also :ref:`qgisexplodelines`)"
   "shortest_line", "Returns the shortest line joining two geometries.
   The resultant line will start at geometry 1 and end at geometry 2"
   "simplify", "Simplifies a geometry by removing nodes using a distance based
   threshold (see also :ref:`qgissimplifygeometries`)"
   "simplify_vw", "Simplifies a geometry by removing nodes using an area based
   threshold (see also :ref:`qgissimplifygeometries`)"
   "single_sided_buffer", "Returns a geometry formed by buffering out just one
   side of a linestring geometry. Distances are in the Spatial Reference System
   of this geometry (see also :ref:`qgissinglesidedbuffer`)"
   "smooth", "Smooths a geometry by adding extra nodes which round off corners
   in the geometry (see also :ref:`qgissmoothgeometry`)"
   "start_point", "Returns the first node from a geometry (see also :ref:`qgisextractspecificvertices`)"
   "sym_difference", "Returns a geometry that represents the portions of two
   geometries that do not intersect (see also :ref:`qgissymmetricaldifference`)"
   "tapered_buffer", "Creates a buffer along a line geometry where the buffer
   diameter varies evenly over the length of the line (see also :ref:`qgistaperedbuffer`)"
   "touches", "Tests whether a geometry touches another. Returns 1 (true) if
   the geometries have at least one point in common, but their interiors do not intersect"
   "transform", "Returns the geometry transformed from the source CRS to the
   destination CRS (see also :ref:`qgisreprojectlayer`)"
   "translate", "Returns a translated version of a geometry. Calculations are in
   the Spatial Reference System of the geometry (see also :ref:`qgistranslategeometry`)"
   "union", "Returns a geometry that represents the point set union of the geometries"
   "wedge_buffer", "Returns a wedge shaped buffer originating from a point geometry
   given an angle and radii (see also :ref:`qgiswedgebuffers`)"
   "within (a,b)", "Tests whether a geometry is within another. Returns 1 (true)
   if geometry a is completely inside geometry b"
   "x", "Returns the X coordinate of a point geometry, or the X coordinate of the
   centroid for a non-point geometry"
   "x_max", "Returns the maximum X coordinate of a geometry.
   Calculations are in the Spatial Reference System of this geometry"
   "x_min", "Returns the minimum X coordinate of a geometry.
   Calculations are in the Spatial Reference System of this geometry"
   "y", "Returns the Y coordinate of a point geometry, or the Y coordinate of
   the centroid for a non-point geometry"
   "y_max", "Returns the maximum Y coordinate of a geometry.
   Calculations are in the Spatial Reference System of this geometry"
   "y_min", "Returns the minimum Y coordinate of a geometry.
   Calculations are in the Spatial Reference System of this geometry"
   "z", "Returns the Z coordinate of a point geometry"
   "z_max |314|", "Returns the maximum Z coordinate of a geometry"
   "z_min |314|", "Returns the minimum Z coordinate of a geometry"

**Some examples:**

* Return the X coordinate of the current feature's centroid::

    x( $geometry )

* Send back a value according to feature's area::

    CASE WHEN $area > 10 000 THEN 'Larger' ELSE 'Smaller' END

* You can manipulate the current geometry using the variable ``$geometry`` to create
  a buffer or get a point on the geometry's surface::

    buffer( $geometry, 10 )
    point_on_surface( $geometry )

* Given a point feature, generate a closed line (using ``make_line``) around the
  point's geometry::

    make_line(
      -- using an array of points placed around the original
      array_foreach(
        -- list of angles for placing the projected points (every 90°)
        array:=generate_series( 0, 360, 90 ),
        -- translate the point 20 units in the given direction (angle)
        expression:=project( $geometry, distance:=20, azimuth:=radians( @element ) )
      )
    )


Layout Functions
----------------

This group contains functions to manipulate print layout items properties.

.. csv-table::
   :header: "Function", "Description"
   :widths: auto

   "item_variables", "Returns a map of variables from a layout item inside this print layout"

**An example:**

* Get the scale of the 'Map 0' in the current print layout::

    map_get( item_variables('Map 0'), 'map_scale')


Map Layers
----------

This group contains a list of the available layers in the current project.
This offers a convenient way to write expressions referring to multiple layers,
such as when performing :ref:`aggregates <aggregates_function>`, :ref:`attribute
<record_attributes>` or :ref:`spatial <geometry_functions>` queries.

It also provides some convenient functions to manipulate layers.

.. csv-table::
   :header: "Function", "Description"
   :widths: auto

   "decode_uri", "Takes a layer and decodes the uri of the underlying data provider.
   Available information depends on the data provider type."

.. index:: Map data structure, Dictionary, Key-value pairs, Associative arrays
.. _maps_functions:

Maps Functions
--------------

This group contains functions to create or manipulate keys and values of map
data structures (also known as dictionary objects, key-value pairs, or associative
arrays). Unlike the :ref:`list data structure <array_functions>` where values
order matters, the order of the key-value pairs in the map object is not relevant
and values are identified by their keys.

.. csv-table::
   :header: "Function", "Description"
   :widths: auto

   "from_json", "Loads a json-formatted string"
   "hstore_to_map", "Creates a map from a hstore-formatted string"
   "json_to_map", "Creates a map from a json-formatted string"
   "map", "Returns a map containing all the keys and values passed as pair of parameters"
   "map_akeys", "Returns all the keys of a map as an array"
   "map_avals", "Returns all the values of a map as an array"
   "map_concat", "Returns a map containing all the entries of the given maps.
   If two maps contain the same key, the value of the second map is taken."
   "map_delete", "Returns a map with the given key and its corresponding value deleted"
   "map_exist", "Returns true if the given key exists in the map"
   "map_get", "Returns the value of a map, given it's key"
   "map_insert", "Returns a map with an added key/value"
   "map_to_hstore", "Merges map elements into a hstore-formatted string"
   "map_to_json", "Merges map elements into a json-formatted string"
   "to_json", "Creates a json-formatted string from a map, an array or other value"


Mathematical Functions
-----------------------

This group contains math functions (e.g., square root, sin and cos).

.. csv-table::
   :header: "Function", "Description"
   :widths: 15, 80
   :class: longtable

   "abs", "Returns the absolute value of a number"
   "acos", "Returns the inverse cosine of a value in radians"
   "asin", "Returns the inverse sine of a value in radians"
   "atan", "Returns the inverse tangent of a value in radians"
   "atan2(y,x)", "Returns the inverse tangent of Y/X by using the signs of the
   two arguments to determine the quadrant of the result"
   "azimuth(a,b)", "Returns the north-based azimuth as the angle in radians
   measured clockwise from the vertical on point a to point b"
   "ceil", "Rounds a number upwards"
   "clamp", "Restricts an input value to a specified range"
   "cos", "Returns the cosine of an angle in radians"
   "degrees", "Converts from radians to degrees"
   "exp", "Returns exponential of a value"
   "floor", "Rounds a number downwards"
   "inclination", "Returns the inclination measured from the zenith (0) to the
   nadir (180) on point_a to point_b."
   "ln", "Returns the natural logarithm of the passed expression"
   "log", "Returns the value of the logarithm of the passed value and base"
   "log10", "Returns the value of the base 10 logarithm of the passed expression"
   "max", "Returns the largest not null value in a set of values"
   "min", "Returns the smallest not null value in a set of values"
   "pi", "Returns the value of pi for calculations"
   "radians", "Converts from degrees to radians"
   "rand", "Returns a random integer within the range specified by the minimum
   and maximum argument (inclusive). A seed can be used for deterministic results"
   "randf", "Returns a random float within the range specified by the minimum
   and maximum argument (inclusive). A seed can be used for deterministic results"
   "round", "Rounds to number of decimal places"
   "scale_exp", "Transforms a given value from an input domain to an output
   range using an exponential curve"
   "scale_linear", "Transforms a given value from an input domain to an output
   range using linear interpolation"
   "sin", "Returns the sine of an angle in radians"
   "sqrt", "Returns the square root of a value"
   "tan", "Returns the tangent of an angle in radians"


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

.. csv-table::
   :header: "Function", "Description"
   :widths: auto

   "parameter", "Returns the value of a processing algorithm input parameter"


.. _raster_functions:

Rasters Functions
-----------------

This group contains functions to operate on raster layer.

.. csv-table::
   :header: "Function", "Description"
   :widths: auto

   "raster_statistic", "Returns statistics from a raster layer"
   "raster_value", "Returns the raster band value at the provided point"


.. _record_attributes:

Record and Attributes Functions
-------------------------------

This group contains functions that operate on record identifiers.

.. csv-table::
   :header: "Function", "Description"
   :widths: 25, 70
   :class: longtable

   "$currentfeature", "Returns the current feature being evaluated. This can be used
   with the 'attribute' function to evaluate attribute values from the current feature."
   "$id", "Returns the feature id of the current row"
   "attribute", "Returns the value of a specified attribute from a feature"
   "attributes", "Returns a :ref:`map <maps_functions>` of all attributes from
   a feature, with field names as map keys"
   "display_expression |314|", "Returns the :ref:`display expression <maptips>` for a given
   feature in a layer. If called with no parameters, it evaluates the current feature"
   "get_feature", "Returns the first feature of a layer matching a given attribute value"
   "get_feature_by_id", "Returns the feature of a layer matching the given feature ID"
   "is_selected", "Returns if a feature is selected"
   "maptip |314|", "Returns the :ref:`maptip <maptips>` for a given feature in a layer.
   If called with no parameters, it evaluates the current feature"
   "num_selected", "Returns the number of selected features on a given layer"
   "represent_value", "Returns the configured representation value for a field value
   (convenient with some :ref:`widget types <edit_widgets>`)"
   "sql_fetch_and_increment", "Manage autoincrementing values in SQLite databases"
   "uuid", "Generates a Universally Unique Identifier (UUID) for each row. Each UUID is 38 characters long."

**Some examples:**

* Return the first feature in layer "LayerA" whose field "id" has the same value
  as the field "name" of the current feature (a kind of jointure)::

    get_feature( 'layerA', 'id', attribute( $currentfeature, 'name') )

* Calculate the area of the joined feature from the previous example::

    area( geometry( get_feature( 'layerA', 'id', attribute( $currentfeature, 'name') ) ) )


.. _string_functions:

String Functions
-----------------

This group contains functions that operate on strings
(e.g., that replace, convert to upper case).

.. csv-table::
   :header: "Function", "Description"
   :widths: 20, 75
   :class: longtable

   "ascii |314|", "Returns the unicode code associated with the first character of a string"
   "char", "Returns the character associated with a unicode code"
   "concat", "Concatenates several strings to one"
   "format", "Formats a string using supplied arguments"
   "format_date", "Formats a date type or string into a custom string format"
   "format_number", "Returns a number formatted with the locale separator for
   thousands (also truncates the number to the number of supplied places)"
   "left(string, n)", "Returns a substring that contains the n leftmost characters of the string"
   "length", "Returns length of a string (or length of a line geometry feature)"
   "lower", "converts a string to lower case"
   "lpad", "Returns a string padded on the left to the specified width, using the fill character"
   "regexp_match", "Returns the first matching position matching a regular expression
   within a string, or 0 if the substring is not found"
   "regexp_replace", "Returns a string with the supplied regular expression replaced"
   "regexp_substr", "Returns the portion of a string which matches a supplied regular expression"
   "replace", "Returns a string with the supplied string, array, or map of strings replaced
   by a string, an array of strings or paired values"
   "right(string, n)", "Returns a substring that contains the n rightmost characters of the string"
   "rpad", "Returns a string padded on the right to the specified width, using the fill character"
   "strpos", "Returns the first matching position of a substring within another string,
   or 0 if the substring is not found"
   "substr", "Returns a part of a string"
   "title", "Converts all words of a string to title case (all words lower case with leading capital letter)"
   "trim", "Removes all leading and trailing white space (spaces, tabs, etc.) from a string"
   "upper", "Converts string a to upper case"
   "wordwrap", "Returns a string wrapped to a maximum/minimum number of characters"

**About fields concatenation**

You can concatenate strings or field values using either ``||`` or ``+``
operators or the ``concat`` function, with some special characteristics:

* The ``+`` operator also means sum up expression, so if you have an integer
  (field or numeric value) operand, this can be error prone and you better use
  the others::

   'My feature''s id is: ' + "gid" => triggers an error as gid is an integer

* When any of the arguments is a NULL value, either ``||`` or ``+`` will
  return a NULL value. To return the other arguments regardless the NULL value,
  you may want to use the ``concat`` function::

   "country_name" || NULL => NULL
   concat('My feature''s id is: ', NULL) => My feature's id is
   concat("firstname", "nickname", "lastname") => Chuck Norris (if empty nickname)
   "firstname" + "nickname" + "lastname" => NULL (if one field is empty)

* For other cases, do at your convenience::

   'My country is ' + "country_name" + ' (' + "country_code" + ')'
   'My country is ' || "country_name" || ' (' || "country_code" || ')'
   concat('My country is ', "country_name", ' (', "country_code", ')')
   # All the above return: My country is France (FR)


.. _user_expressions_functions:

User Expressions |312|
----------------------

This group contains the expressions saved as **user expressions** using
the |fileSave| :sup:`Add current expression to user expressions` button
above the expression editor frame.
It is meant for important expressions you want to have quick access to.
They are saved under the user profile (:file:`<userprofile>/QGIS/QGIS3.ini`
file) and available in all expression dialogs inside all projects of the
current user profile.

A set of tools available above the expression editor frame helps you manage
the user expressions:

* |fileSave|:sup:`Add the current expression to user expressions`: store the
  expression in the user profile. A label and a help text can be added for
  easy identification.
* |symbologyEdit| :sup:`Edit selected expression from user expressions`,
  as well as their help and label
* |deleteSelected| :sup:`Remove selected expression from user expressions`
* |sharingImport| :sup:`Import user expressions` from a ``.json`` file
  into the active user profile folder
* |sharingExport| :sup:`Export user expressions` as a ``.json`` file;
  all the user expressions in the user profile :file:`QGIS3.ini` file are
  shared

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
   "layer_ids |314|", "The IDs of all the map layers in the current project as a list"
   "layer_name", "The name of current layer"
   "layers |314|", "All the map layers in the current project as a list"
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
   "map_end_time |314|", "The end of the map's temporal time range
   (as a datetime value)"
   "map_extent", "The geometry representing the current extent of the map"
   "map_extent_center", "The point feature at the center of the map"
   "map_extent_height", "The current height of the map"
   "map_extent_width", "The current width of the map"
   "map_id", "The ID of current map destination. This will be 'canvas'
   for canvas renders, and the item ID for layout map renders"
   "map_interval |314|", "The duration of the map's temporal time range
   (as an interval value)"
   "map_layer_ids", "The list of map layer IDs visible in the map"
   "map_layers", "The list of map layers visible in the map"
   "map_rotation", "The current rotation of the map"
   "map_scale", "The current scale of the map"
   "map_start_time |314|", "The start of the map's temporal time range
   (as a datetime value)"
   "map_units", "The units of map measurements"
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
   "user_account_name", "The current user's operating system account name"
   "user_full_name", "The current user's operating system user name"
   "value", "The current value"
   "with_variable", "Allows setting a variable for usage within an expression
   and avoid recalculating the same value repeatedly"

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


.. index:: Custom functions
.. _function_editor:

Function Editor
===============

With the :guilabel:`Function Editor` tab, you are able to write your own functions
in Python language. This provides a handy and comfortable way to address
particular needs that would not be covered by the predefined functions.

.. _figure_expression_function:

.. figure:: img/function_editor.png
   :align: center

   The Function Editor tab

To create a new function:

#. Press the |signPlus| :sup:`New File` button.
#. Enter a name to use in the form that pops up and press :guilabel:`OK`.

   A new item of the name you provide is added in the left panel of the
   :guilabel:`Function Editor` tab; this is a Python :file:`.py` file based on
   QGIS template file and stored in the :file:`/python/expressions` folder
   under the active :ref:`user profile <user_profiles>` directory.
#. The right panel displays the content of the file: a python script template.
   Update the code and its help according to your needs.
#. Press the |start| :guilabel:`Save and Load Functions` button.
   The function you wrote is added to the functions tree in the :guilabel:`Expression`
   tab, by default under the ``Custom`` group.
#. Enjoy your new function.
#. If the function requires improvements, enable the :guilabel:`Function Editor`
   tab, do the changes and press again the |start| :guilabel:`Save and Load
   Functions` button to make them available in the file, hence in any expression
   tab.

Custom Python functions are stored under the user profile directory, meaning that at
each QGIS startup, it will auto load all the functions defined with the current user
profile. Be aware that new functions are only saved in the :file:`/python/expressions`
folder and not in the project file.
If you share a project that uses one of your custom functions you will need to also
share the :file:`.py` file in the :file:`/python/expressions` folder.

To delete a custom function:

#. Enable the :guilabel:`Function Editor` tab
#. Select the function in the list
#. Press the |signMinus| :sup:`Remove selected function`. The function is
   removed from the list and the corresponding ``.py`` file deleted from
   the user profile folder.

**Example**

Here's a short example on how to create your own functions:

.. code-block:: python

   from qgis.core import *
   from qgis.gui import *

   @qgsfunction(args='auto', group='Custom')
   def my_sum(value1, value2, feature, parent):
       """
       Calculates the sum of the two parameters value1 and value2.
       <h2>Example usage:</h2>
       <ul>
         <li>my_sum(5, 8) -> 13</li>
         <li>my_sum("field1", "field2") -> 42</li>
       </ul>
       """
       return value1 + value2


The short example creates a function ``my_sum`` that will give you a function
with two values.
When using the ``args='auto'`` function argument the number of function
arguments required will be calculated by the number of arguments the function
has been defined with in Python (minus 2 - ``feature``, and ``parent``).

This function can then be used in expressions:

.. _figure_expression_custom_function:

.. figure:: img/customFunction.png
   :align: center

   Custom Function added to the Expression tab


Further information about creating Python code can be found in the
:ref:`PyQGIS-Developer-Cookbook`.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |312| replace:: ``NEW in 3.12``
.. |314| replace:: ``NEW in 3.14``
.. |calculateField| image:: /static/common/mActionCalculateField.png
   :width: 1.5em
.. |checkbox| image:: /static/common/checkbox.png
   :width: 1.3em
.. |dataDefined| image:: /static/common/mIconDataDefine.png
   :width: 1.5em
.. |deleteSelected| image:: /static/common/mActionDeleteSelected.png
   :width: 1.5em
.. |expression| image:: /static/common/mIconExpression.png
   :width: 1.5em
.. |expressionSelect| image:: /static/common/mIconExpressionSelect.png
   :width: 1.5em
.. |fileNew| image:: /static/common/mActionFileNew.png
   :width: 1.5em
.. |fileSave| image:: /static/common/mActionFileSave.png
   :width: 1.5em
.. |sharingExport| image:: /static/common/mActionSharingExport.png
   :width: 1.5em
.. |sharingImport| image:: /static/common/mActionSharingImport.png
   :width: 1.5em
.. |signMinus| image:: /static/common/symbologyRemove.png
   :width: 1.5em
.. |signPlus| image:: /static/common/symbologyAdd.png
   :width: 1.5em
.. |start| image:: /static/common/mActionStart.png
   :width: 1.5em
.. |symbologyEdit| image:: /static/common/symbologyEdit.png
   :width: 1.5em
