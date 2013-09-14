|updatedisclaimer|

.. comment out this Section (by putting '|updatedisclaimer|' on top) if file is not uptodate with release

.. index:: Field_Calculator, Calculator_Field, Derived_Fields

.. _vector_field_calculator:

Field Calculator
================

The |mActionCalculateField| :sup:`Field Calculator` button in the attribute
table allows to perform calculations on basis of existing attribute values or
defined functions, e.g to calculate length or area of geometry features. The
results can be written to a new attribute column or it can be used to update
values in an already existing column.

You have to bring the vector layer in editing mode, before you can click on
the field calculator icon to open the dialog (see figure_attributes_3_). In
the dialog you first have to select whether you want to only update selected
features, create a new attribute field where the results of the calculation will
be added or update an existing field.

.. _figure_attributes_3:

.. only:: html

   **Figure Attributes 3:**

.. figure:: /static/user_manual/working_with_vector/fieldcalculator.png
   :width: 30em
   :align: center

   Field Calculator |nix|

If you choose to add a new field, you need to enter a field name, a field type
(integer, real or string), the total field width, and the field precision (see
figure_attributes_3_). For example, if you choose a field width of 10 and a field
precision of 3 it means you have 6 signs before the dot, then the dot and another
3 signs for the precision.

The **Function List** contains functions as well as fields and values. View the
help function in the **Selected Function Help**. In **Expression** you see the
calculation expressions you create with the **Function List**. The most commonly
used operators, see **Operators**.

In the **Function List**, click on :guilabel:`Fields and Values` to view all
attributes of the attribute table to be searched. To add an attribute to the
Field calculator **Expression** field, double click its name in the
:guilabel:`Fields and Values` list. Generally you can use the various fields,
values and functions to construct the calculation expression or you can just type
it into the box. To display the values ​​of a field, you just right click on the
appropriate field. You can choose between :guilabel:`Load top 10 unique values`
and :guilabel:`Load all unique values`. On the right side opens the **Field Values**
list with the unique values. To add a value to the Field calculator **Expression**
box, double click its name in the **Field Values** list.

The :guilabel:`Operators`, :guilabel:`Math`, :guilabel:`Conversions`,
:guilabel:`String`, :guilabel:`Geometry` and :guilabel:`Record` groups provides
several functions. In :guilabel:`Operators` you find mathematical operators.
Find :guilabel:`Math` for mathematical functions. The :guilabel:`Conversions`
group contains functions that convert one data type to another. The :guilabel:`String`
group provides functions for data strings. In the :guilabel:`Geometry` group you
find functions for geometry objects. With :guilabel:`Record` group functions you
can add a numeration to your data set. To add a function to the Field calculator
**Expression** box, click on the > and then doubleclick the function.

A short example illustrates how the field calculator works. We want to
calculate the length of the ``railroads`` layer from the QGIS sample dataset:

#. Load the Shapefile :file:`railroads.shp` in |qg| and press |mActionOpenTable|
   :sup:`Open Attribute Table`.
#. Click on |mActionToggleEditing| :sup:`Toggle editing mode` and open the
   |mActionCalculateField| :sup:`Field Calculator` dialog.
#. Select the |checkbox| :guilabel:`Create a new field` checkbox to safe the
   calculations into a new field.
#. Add ``length`` as Output field name, ``real`` as Output field type and
   define Output field width 10 and a Precision of 3.
#. Now click on function ``length`` in the :guilabel:`Geometry` group to add it
   as ``$length`` into the Field calculator expression box and click **[Ok]**.
#. You can now find a new column ``length`` in the attribute table.

The available functions are listed below.

The field calculator **Function list** with the **Selected Function Help** ,
**Operators** and **Expression** menu are also available through the rule-based
rendering in the Style tab of the Layer properties and the expression based
labeling |browsebutton| in the |mActionLabeling| :sup:`Labeling` core application.


.. index:: Field_Calculator_Functions

Operators

::

 a = b                                a and b are equal
 a != b                               a and b are not equal
 a <> b
 a >= b                               a is larger than or equal to b
 a <= b                               a is less than or equal to b
 a > b                                a is larger than b
 a < b                                a is smaller than b
 a ~ b                                a matches the regular expression b
 a LIKE b                             a equals b
 a ILIKE b                            a equals b (without regard to case-sensitive)
 a |wedge| b                    a raised to the power of b
 a * b                          a multiplied by b
 a / b              a divided by b
 a + b              a plus b
 a - b              a minus b
 + a                positive sign
 - a                      negative value of a


 column name "column name"     value of the field column name
 'string'                      a string value
 NULL                          null value
 a IS NULL                     a has no value
 a IS NOT NULL                 a has a value
 a IN (value[,value])          a is below the values listed
 a NOT IN (value[,value])      a is not below the values listed
 a OR b                        a or *b* is true
 a AND b                       a and *b* is true
 NOT a                         inverted truth value of a

Conditionals

::
 CASE                          evaluates multiple expressions and return a result
 CASE ELSE                     evaluates multiple expressions and return a result
 coalesce                      returns the first non-NULL value from the expression list
 regexp_match                  returns true if any part of a string matches the supplied regular expression

Mathematical Functions

::

 sqrt(a)                       square root of a
 abs                           returns the absolute value of a number.
 sin(a)                        sinus of a
 cos(a)                        cosinus of a
 tan(a)                        tangens of a
 asin(a)                       arcussinus of a
 acos(a)                       arcuscosinus of a
 atan(a)                       arcustangens of a
 atan2(y,x)                    arcustangens of y/x using the signs of the two arguments 
                               to determine the quadrant of the result
 exp                           exponential of an value
 ln                            value of the natural logarithm of the passed expression
 log10                         value of the base 10 logarithm of the passed expression
 log                           value of the logarithm of the passed value and base
 round                         number to number of decimal places
 rand                          random integer within the range specified by the minimum 
                               and maximum argument (inclusive)
 randf                         random float within the range specified by the minimum 
                               and maximum argument (inclusive)
 max                           largest value in a set of values
 min                           smallest value in a set of values
 clamp                         restricts an input value to a specified range
 scale_linear                  transforms a given value from an input domain to an output 
                               range using linear interpolation
 scale_exp                     transforms a given value from an input domain to an output 
                               range using an exponential curve
 floor                         rounds a number downwards
 ceil                          rounds a number upwards
 $pi                           pi as value for calculations

Conversions

::

 toint                        converts a string to integer number
 toreal                       converts a string to real number
 tostring                     convert number to string
 todatetime                   convert a string into Qt data time type
 todate                       convert a string into Qt data type 
 totime                       convert a string into Qt time type
 tointerval                   converts a string to a interval type. Can be used to take days, 
                              hours, month, etc off a date

Date and Time Functions

::

 $now                         current date and time
 age                          difference between two dates
 year                         extract the year part from a date, or the number of years from a Interval 
 month                        extract the month part from a date, or the number of months from a Interval 
 week                         extract the week number from a date, or the number of weeks from a Interval 
 day                          extract the day from a date, or the number of days from a Interval
 hour                         extract the hour from a datetime or time, or the number of hours from a Interval
 minute                       extract the minute from a datetime or time, or the number of minutes from a Interval
 second                       extract the second from a datetime or time, or the number of minutes from a Interval


String Functions

::

 lower                        convert string a to lower case
 upper                        convert string a to upper case
 title                        converts all words of a string to title case (all words lower case 
                              with leading capital letter)
 trim                         removes all leading and trailing whitespace (spaces, tabs, etc) from a string
 length                       length of string a
 replace                      returns a string with the the supplied string replaced
 regexp_replace(a,this,that)  returns a string with the supplied regular expression replaced
 regexp_substr                returns the portion of a string which matches a supplied regular expression
 substr(*a*,from,len)         returns a part of a string
 concat                       concatenates several strings to one
 strpos                       returns the index of a regular expression in a string
 left                         returns a substring that contains the n leftmost characters of the string
 right                        returns a substring that contains the n rightmost characters of the string
 rpad                         returns a string with supplied width padded using the fill character
 lpad                         returns a string with supplied width padded using the fill character
 format                       formats a string using supplied arguments
 format_number                returns a number formatted with the locale separator for thousands. 
                              Also truncates the number to the number of supplied places
 format_date                  formats a date type or string into a custom string format

Color Functions

::

 color_rgb                    returns a string representation of a color based on its red, green, and blue components                        
 color_rgba                   returns a string representation of a color based on its red, green, blue, and alpha (transparency) components
 ramp_color                   returns a string representing a color from a color ramp
 color_hsl                    returns a string representation of a color based on its hue, saturation, and lightness attributes 
 color_hsla                   returns a string representation of a color based on its hue, saturation, 
                              lightness and alpha (transparency) attributes
 color_hsv                    returns a string representation of a color based on its hue, saturation, and value attributes
 color_hsva                   returns a string representation of a color based on its hue, saturation, 
                              value and alpha (transparency) attributes 
 color_cmyk                   returns a string representation of a color based on its cyan, magenta, 
                              yellow and black components
 color_cmyka                  returns a string representation of a color based on its cyan, magenta,
                              yellow, black and alpha (transparency) components 
  
Geometry Functions

::
 
 xat                          retrieves a x coordinate of the current feature                 
 yat                          retrieves a y coordinate of the current feature
 $area                        returns the area size of the current feature
 $length                      returns the area size of the current feature
 $perimeter                   returns the perimeter length of the current feature
 $x                           returns the x coordinate of the current feature
 $y                           returns the y coordinate of the current feature
 $geometry                    
 geomFromWKT
 geomFromGML
 bbox
 disjoint
 intersects
 touches
 crosses
 contains
 overlaps
 within
 buffer
 centroid
 convexHull
 difference
 distance
 intersection
 symDifference
 combine
 union
 geomToWKT

                            

Record Functions

::

 $rownum                      returns the number of the current row
 $id                          returns the feature id of the current row
 $scale                       returns the current scale of the map canvas


Fields and Values

::

 access the fields of your features


 a || b                               concatenate strings a and b
 $rownum                number current row
 $area              area of polygon
 $perimeter           perimeter of polygon
 $length              length of line
 $id                feature id
 $x               x coordinate of point
 $y               y coordinate of point
 xat(n)                               X coordinate of the point of an n-th line (indeces
                                      start at 0; negative values refer to the line end)
 yat(n)                               y coordinate of the point of an n-th line (indeces
                                      start at 0; negative values refer to the line end)
 


