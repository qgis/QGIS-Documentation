|updatedisclaimer|

.. index:: Expressions

.. _vector_expressions:

Expressions
============


The **Expressions** feature is available from many parts in |qg|. It can be accessed using the 
|mIconExpressionSelect| :sup:`Select by expression`, the |mActionCalculateField| :sup:`Field calculator` 
or the |mIconDataDefine| :sup:`Data defined override` tool. It offers a powerful way to manipulate  
attribute value or variables in order to dynamically change the geometry style, the content or position
of the label, the value for diagram, the height of a composer item, select some feature, create virtual 
column ...

The **Expressions** feature offers access to the:

- :guilabel:`Expression` tab which lists functions to use 
- :guilabel:`Function Editor` tab which helps to create custom functions to use in the expressions.


.. _functions_list:

Functions List
***************


.. _figure_expression_1:

.. only:: html

   **Figure Expression 1:**

.. figure:: /static/user_manual/working_with_vector/function_list.png
   :align: center

   The Expression tab |nix|

The **Expression** tab contains functions as well as layer's fields and values.
It contains widgets to:

- type expressions using functions and/or fields. A preview of the expression's result is displayed at the bottom of the dialog.
- select the appropriate function among a list. A search box helps to quickly find a particular function or field. Double-clicking on its name adds it to the expression being written. 
- display help for each function selected. When a field is selected, this widget shows a sample of its values. Double-clicking a value adds it to the expression.


To help to quickly find a function, they are organized in groups.
In :guilabel:`Operators`, you find mathematical operators.
Look in :guilabel:`Math` for mathematical functions. 
The :guilabel:`Conversions` group contains functions that convert one data type to another. 
The :guilabel:`String` group provides functions for data strings, 
such as :guilabel:`Date and Time` handles date and time data. 
In the :guilabel:`Geometry` group, you find functions for geometry objects. 
With :guilabel:`Record` group functions, you can add a numeration to your data set 
while :guilabel:`Fields and Values` group helps view all attributes of the attribute table.
The :guilabel:`Customs` group lists the functions created or imported by the user. 
There are many other groups, listed below.


.. index:: Field_Calculator_Functions


Operators
----------

This group contains operators (e.g., +, -, \*).

::

 a + b      a plus b
 a - b      a minus b
 a * b      a multiplied by b
 a / b      a divided by b
 a % b      a modulo b (for example, 7 % 2 = 1, or 2 fits into 7 three 
            times with remainder 1)
 a ^ b      a power b (for example, 2^2=4 or 2^3=8)
 a = b      a and b are equal
 a > b      a is larger than b
 a < b      a is smaller than b
 a <> b     a and b are not equal
 a != b     a and b are not equal
 a <= b     a is less than or equal to b
 a >= b     a is larger than or equal to b
 a ~ b      a matches the regular expression b
 + a        positive sign
 - a        negative value of a
 ||         joins two values together into a string 'Hello' || ' world'
 LIKE       returns 1 if the string matches the supplied pattern
 ILIKE      returns 1 if the string matches case-insensitive the supplied
            pattern (ILIKE can be used instead of LIKE to make the match 
            case-insensitive)
 IS         returns 1 if a is the same as b
 OR         returns 1 when condition a or b is true
 AND        returns 1 when condition a and b are true
 NOT        returns 1 if a is not the same as b
 column name "column name"     value of the field column name, take 
                               care to not be confused with simple 
                               quote, see below
 'string'                      a string value, take care to not be 
                               confused with double quote, see above
 NULL                          null value
 a IS NULL                     a has no value
 a IS NOT NULL                 a has a value
 a IN (value[,value])          a is below the values listed
 a NOT IN (value[,value])      a is not below the values listed

**Some examples:**

* Joins a string and a value from a column name::

    'My feature's id is: ' || "gid"

* Test if the "description" attribute field starts with the 'Hello' string 
  in the value (note the position of the % character)::

    "description" LIKE 'Hello%'

Conditionals
-------------

This group contains functions to handle conditional checks in expressions.

::

 CASE                          evaluates multiple expressions and returns a 
                               result
 CASE ELSE                     evaluates multiple expressions and returns a 
                               result
 coalesce                      returns the first non-NULL value from the 
                               expression list
 if                            tests a condition and returns a different result
                               depending on the conditional check
 regexp_match                  returns true if any part of a string matches
                               the supplied regular expression

**Some example:**

* Send back a value if the first condition is true, else another value::

    CASE WHEN "software" LIKE '%QGIS%' THEN 'QGIS' ELSE 'Other'

Mathematical Functions
-----------------------

This group contains math functions (e.g., square root, sin and cos).

::

 $pi                           pi as value for calculations
 abs                           returns the absolute value of a number
 acos(a)                       arccos of a
 asin(a)                       arcsin of a
 atan(a)                       arctan of a
 atan2(y,x)                    arctan of y/x using the signs of the two 
                               arguments to determine the quadrant of the 
                               result
 ceil                          rounds a number upwards
 clamp                         restricts an input value to a specified 
                               range
 cos(a)                        cosine of a
 exp                           exponential of a value
 floor                         rounds a number downwards
 ln                            value of the natural logarithm of the passed 
                               expression
 log                           value of the logarithm of the passed value 
                               and base
 log10                         value of the base 10 logarithm of the passed 
                               expression
 max                           largest value in a set of values
 min                           smallest value in a set of values
 rand                          random integer within the range specified by 
                               the minimum
                               and maximum argument (inclusive)
 randf                         random float within the range specified by 
                               the minimum
                               and maximum argument (inclusive)
 round                         round to number of decimal places
 scale_linear                  transforms a given value from an input 
                               domain to an output
                               range using linear interpolation
 scale_exp                     transforms a given value from an input 
                               domain to an output
                               range using an exponential curve
 sin(a)                        sine of a
 sqrt(a)                       square root of a
 tan(a)                        tangent of a


Color Functions
----------------

This group contains functions for manipulating colors.

::

 color_cmyk      returns a string representation of a color based on its 
                 cyan, magenta, yellow and black components
 color_cmyka     returns a string representation of a color based on its 
                 cyan, magenta, yellow, black and alpha (transparency) 
                 components
 color_hsl       returns a string representation of a color based on its 
                 hue, saturation, and lightness attributes
 color_hsla      returns a string representation of a color based on its 
                 hue, saturation, lightness and alpha (transparency) 
                 attributes
 color_hsv       returns a string representation of a color based on its 
                 hue, saturation, and value attributes
 color_hsva      returns a string representation of a color based on its 
                 hue, saturation, value and alpha (transparency) 
                 attributes
 color_part      returns a specific component from a color string,
                 eg the red component or alpha component
 color_rgb       returns a string representation of a color based on its 
                 red, green, and blue components
 color_rgba      returns a string representation of a color based on its 
                 red, green, blue, and alpha (transparency) components
 project_color   returns a color from the project's color scheme
 ramp_color      returns a string representing a color from a color ramp
 set_color_part  sets a specific color component for a color string,
                 eg the red component or alpha component.


Conversions
------------

This group contains functions to convert one data type to another (e.g., string to integer, integer to string).

::

 todate                       converts a string into Qt date type
 todatetime                   converts a string into Qt date time type
 toint                        converts a string to integer number
 tointerval                   converts a string to an interval type (can be 
                              used to take days, hours, months, etc. off a 
                              date)
 toreal                       converts a string to real number
 tostring                     converts number to string
 totime                       converts a string into Qt time type


Custom functions
-----------------

This group contains functions created by the user. See function_editor_ for more details.


Date and Time Functions
------------------------

This group contains functions for handling date and time data.

::

 age            difference between two dates
 day            extracts the day from a date, or the number of days from an 
                interval
 day_of_week    returns a number corresponding to the day of the week
                for a specified date or datetime
 hour           extract the hour from a datetime or time, or the number
                of hours from an interval
 minute         extract the minute from a datetime or time, or the number
                of minutes from an interval
 month          extract the month part from a date, or the number of months 
                from an interval
 now            current date and time
 second         extract the second from a datetime or time, or the number
                of minutes from an interval
 week           extract the week number from a date, or the number of weeks 
                from an interval
 year           extract the year part from a date, or the number of years from 
                an interval


**Some example:**

* Get the month and the year of today in the format "10/2014" ::

    month($now) || '/' || year($now)


Fields and Values
------------------

Contains a list of fields from the layer. 

Generally, you can use the various fields,
values and functions to construct the calculation expression, or you can just type
it into the box.

To display the values of a field, you just click on the
appropriate field and choose between :guilabel:`Load top 10 unique values`
and :guilabel:`Load all unique values`. On the right side, the **Field Values**
list opens with the unique values. To add a value to the expression you are writing,
double click its name in the list.

Sample values can also be accessed via right-click.
Select the field name from the list, then right-click to access a context menu 
with options to load sample values from the selected field.

Fields name should be double-quoted in the expression. Values or string should be simple-quoted.

Fuzzy Matching Functions
-------------------------

This group contains functions for fuzzy comparisons between values.

::

 hamming_distance            returns the number of characters at 
                             corresponding positions within the input strings
                             where the characters are different.
 levensheim                  returns the minimum number of character edits 
                             (insertions, deletions or substitutions) required 
                             to change one string to another. Measure the similarity between two strings
 longest_common_substring    returns  the longest common substring between two strings. 
 soundex                     returns the Soundex representation of a string.

                
General Functions
------------------

This group  contains general assorted functions.

::

 layer_property            returns a property of a layer or a value of its metadata. It can be 
                           layer name, crs, geometry type, feature count...
 var                       returns the value stored within a specified variable.
                           see variable functions below

                
                
Geometry Functions
------------------

This group contains functions that operate on geometry objects (e.g., length, area).

::

 $area            returns the area size of the current feature
 $geometry        returns the geometry of the current feature (can be used
                  for processing with other functions)
 $length          returns the length of the current line feature
 $perimeter       returns the perimeter of the current polygon feature
 $x               returns the x coordinate of the current feature
 $x_at(n)         returns the x coordinate of the nth node of the current
                  feature's geometry
 $y               returns the y coordinate of the current feature
 $y_at(n)         returns the y coordinate of the nth node 
                  of the current feature's geometry 
 area             returns the area of a geometry polygon feature. 
                  Calculations are in the Spatial 
                  Reference System of this geometry.
 bounds           returns a geometry which represents the bounding box of 
                  an input geometry. Calculations are in the Spatial 
                  Reference System of this Geometry. 
 bounds_height    returns the height of the bounding box of a geometry. 
                  Calculations are in the Spatial Reference System of 
                  this Geometry.
 bounds_width     returns the width of the bounding box of a geometry. 
                  Calculations are in the Spatial Reference System of 
                  this Geometry.
 buffer           returns a geometry that represents all points whose 
                  distance from this geometry is less than or equal to 
                  distance. Calculations are in the Spatial Reference 
                  System of this geometry.
 centroid         returns the geometric center of a geometry
 combine          returns the combination of two geometries
 contains(a,b)    returns 1 (true) if and only if no points of b lie in the 
                  exterior of a, and at least one point of the interior 
                  of b lies in the interior of a
 convex_hull       returns the convex hull of a geometry (this represents 
                  the minimum convex geometry that encloses all geometries 
                  within the set)
 crosses          returns 1 (true) if the supplied geometries have some, but not 
                  all, interior points in common
 difference(a,b)  returns a geometry that represents that part of geometry 
                  a that does not intersect with geometry b
 disjoint         returns 1 (true) if the geometries do not share any space 
                  together
 distance         returns the minimum distance (based on spatial ref) 
                  between two geometries in projected units
 end_point        returns the last node from a geometry
 geometry         returns a feature's geometry
 geom_from_gml    returns a geometry created from a GML representation of geometry
 geom_from_wkt    returns a geometry created from a well-known text (WKT) 
                  representation
 geom_to_wkt      returns the well-known text (WKT) representation of the
                  geometry without SRID metadata
 intersection     returns a geometry that represents the shared portion
                  of two geometries
 intersects       returns 1 (true) if the geometries spatially intersect
                  (share any portion of space) and 0 if they don't
 intersects_bbox  returns 1 (true) if the geometries spatially intersect
                  (share any portion of space) their bounding box and 0 if they don't
 make_point(x,y)  returns a point geometry from x and y values
 num_points       returns the number of vertices in a geometry
 overlaps         returns 1 (true) if the geometries share space, are of the 
                  same dimension, but are not completely contained by 
                  each other
 perimeter        returns the perimeter of a geometry polygon feature.
                  Calculations are in the Spatial Reference System of this geometry.
 point_n          returns a specific node from a geometry
 start_point      returns the first node from a geometry
 sym_difference   returns a geometry that represents the portions of a and 
                  b that do not intersect
 touches          returns 1 (true) if the geometries have at least one point in 
                  common, but their interiors do not intersect
 transform        returns the geometry transformed from the source CRS to
                  the dest CRS
 union            returns a geometry that represents the point set union of 
                  the geometries
 within           returns 1 (true) if geometry a is completely inside geometry b
 x                returns the x coordinate of a point geometry, or the
                  x coordinate of the centroid for a non-point geometry
 x_min            returns the minimum x coordinate of a geometry. 
                  Calculations are in the Spatial Reference System of this 
                  geometry
 x_max            returns the maximum x coordinate of a geometry. 
                  Calculations are in the Spatial Reference System of this 
                  geometry
 y                returns the y coordinate of a point geometry, or the
                  y coordinate of the centroid for a non-point geometry
 y_min            returns the minimum y coordinate of a geometry. 
                  Calculations are in the Spatial Reference System of this 
                  geometry 
 y_max            returns the maximum y coordinate of a geometry. 
                  Calculations are in the Spatial Reference System of this 
                  geometry


Record Functions
-----------------

This group contains functions that operate on record identifiers.

::

 $currentfeature          returns the current feature being evaluated. 
                          This can be used with the 'attribute' function 
                          to evaluate attribute values from the current 
                          feature. 
 $id                      returns the feature id of the current row
 $map                     returns the id of the current map item if the map 
                          is being drawn in a composition, or "canvas" if 
                          the map is being drawn within the main QGIS 
                          window.
 $rownum                  returns the number of the current row
 $scale                   returns the current scale of the map canvas
 attribute                returns the value of a specified attribute from 
                          a feature.
 get_feature              returns the first feature of a layer matching a 
                          given attribute value.
 uuid                     generates a Universally Unique Identifier (UUID) 
                          for each row. Each UUID is 38 characters long.

String Functions
-----------------

This group contains functions that operate on strings (e.g., that replace, convert to upper case).

::

 concat                       concatenates several strings to one
 format                       formats a string using supplied arguments
 format_number                returns a number formatted with the locale 
                              separator for thousands (also truncates the 
                              number to the number of supplied places)
 format_date                  formats a date type or string into a custom 
                              string format
 left                         returns a substring that contains the n 
                              leftmost characters of the string
 length                       length of string a
 lower                        convert string a to lower case
 lpad                         returns a string with supplied width padded 
                              using the fill character
 replace                      returns a string with the supplied string 
                              replaced
 regexp_replace(a,this,that)  returns a string with the supplied regular 
                              expression replaced
 regexp_substr                returns the portion of a string which matches 
                              a supplied regular expression
 right                        returns a substring that contains the n 
                              rightmost characters of the string
 rpad                         returns a string with supplied width padded 
                              using the fill character
 strpos                       returns the index of a regular expression 
                              in a string
 substr(*a*,from,len)         returns a part of a string
 title                        converts all words of a string to title 
                              case (all words lower case with leading 
                              capital letter)
 trim                         removes all leading and trailing white 
                              space (spaces, tabs, etc.) from a string
 upper                        convert string a to upper case
 wordwrap                     returns a string wrapped to a maximum/
                              minimum number of characters


Recent Functions
-----------------

This group contains recently used functions. Any expression used in the Expression dialog is added to the list,
sorted from the more recent to the less one. This helps to quickly retrieve any previous expression.


Variables Functions
--------------------

This group contains dynamic variables related to the application, the project file and other settings. 
It means that some functions may not be available according to the context:

- from the |mIconExpressionSelect| :sup:`Select by expression` dialog
- from the |mActionCalculateField| :sup:`Field calculator` dialog
- from the layer properties dialog
- from the print composer
 
To use these functions in an expression, they should be preceded by @ character (e.g, @row_number). Are concerned:

::

 atlas_feature                returns the current atlas feature (as feature object)
 atlas_featureid              returns the current atlas feature ID
 atlas_featurenumber          returns the number of pages in composition
 atlas_filename               returns the current atlas file name
 atlas_geometry               returns the current atlas feature geometry
 atlas_pagename               returns the current atlas page name
 atlas_totalfeatures          returns the total number of features in atlas
 grid_axis                    returns the current grid annotation axis 
                              (eg, 'x' for longitude, 'y' for latitude)
 grid_number                  returns the current grid annotation value
 item_id                      returns the composer item user ID (not necessarily unique)
 item_uuid                    returns the composer item unique ID
 layer_id                     returns the ID of current layer
 layer_name                   returns the name of current layer
 layout_dpi                   returns the composition resolution (DPI)
 layout_numpages              returns the number of pages in the composition
 layout_pageheight            returns the composition height in mm
 layout_pagewidth             returns the composition width in mm
 map_id                       returns the ID of current map destination. This will be 'canvas'
                              for canvas renders, and the item ID for composer map renders
 map_rotation                 returns the current rotation of the map
 map_scale                    returns the current scale of the map
 project_filename             returns the filename of current project 
 project_folder               returns the folder for current project
 project_path                 returns the full path (including file name) of current project
 project_title                returns the title of current project 
 qgis_release_name            returns the current QGIS release name
 qgis_version                 returns the current QGIS version string
 qgis_version_no              returns the current QGIS version number
 row_number                   stores the number of the current row 

.. _function_editor:

Function Editor
****************

With the Function Editor, you are able to define your own Python custom functions in a 
comfortable way.

.. _figure_expression_2:

.. only:: html

   **Figure Expression 2:**

.. figure:: /static/user_manual/working_with_vector/function_editor.png
   :align: center

   The Function Editor tab |nix|

The function editor will create new Python files in :file:`.qgis2\\python\\expressions` folder and
will auto load all functions defined when starting QGIS. Be aware that new functions are 
only saved in the :file:`expressions` folder and not in the project file.
If you have a project that uses one of your custom functions you will need to also share 
the .py file in the expressions folder. 

Here's a short example on how to create your own functions:

.. code-block:: python

   @qgsfunction(args="auto", group='Custom')
   def myfunc(value1, value2, feature, parent):
       pass

The short example creates a function 'myfunc' that will give you a function with two
values.
When using the args='auto' function argument the number of function
arguments required will be calculated by the number of arguments the
function has been defined with in Python (minus 2 - feature, and parent).

This function then can be used with the following expression:

.. code-block:: python

   myfunc('test1', 'test2')

Your function will be implemented in the :guilabel:`Custom` functions group of the :guilabel:`Expression` tab
after using the :guilabel:`Run Script` button.

Further information about creating Python code can be found on 
http://www.qgis.org/html/en/docs/pyqgis_developer_cookbook/index.html.

The function editor is not only limited to working with the field calculator, it can be found whenever
you work with expressions.



