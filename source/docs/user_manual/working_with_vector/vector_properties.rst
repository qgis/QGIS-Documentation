|updatedisclaimer|

.. _vector_properties_dialog:

The Vector Properties Dialog
============================

The :guilabel:`Layer Properties` dialog for a vector layer provides information
about the layer, symbology settings and labeling options. If your vector layer
has been loaded from a PostgreSQL/PostGIS datastore, you can also alter the
underlying SQL for the layer by invoking the :guilabel:`Query Builder` dialog on
the :guilabel:`General` tab. To access the :guilabel:`Layer Properties` dialog,
double-click on a layer in the legend or right-click on the layer and select
:menuselection:`Properties` from the pop-up menu.


.. do not change the order of reference-tag and only-tag, this figure has
   an external reference.

.. only:: html

   **Figure Vector Properties 1:**

.. _figure_vector_properties_1:

.. figure:: /static/user_manual/working_with_vector/vector_general_menu.png
   :align: center

   Vector Layer Properties Dialog |nix|

.. _vector_style_menu:

Style Menu
----------

The Style menu provides you with a comprehensive tool for rendering and symbolizing your
vector data. You can use :menuselection:`Layer rendering -->` tools that are common to
all vector data, as well as special symbolizing tools that were designed for the different kinds
of vector data.

Layer rendering
...............

* :guilabel:`Layer transparency` |slider|: You can make the underlying layer in the map canvas
  visible with this tool. Use the slider to adapt the visibility of your vector layer to your needs.
  You can also make a precise definition of the percentage of visibility in the the menu beside the slider.

.. _blend_modes:

* :guilabel:`Layer blending mode` and :guilabel:`Feature blending mode`: You can achieve special rendering effects with these tools that you may
  previously only know from graphics programs. The pixels of your overlaying and underlaying layers are mixed
  through the settings described below.

  * Normal: This is the standard blend mode, which uses the alpha channel of the top pixel to blend with the pixel beneath it. The colors aren't mixed.
  * Lighten: This selects the maximum of each component from the foreground and background pixels. Be aware that the results tend to be jagged and harsh.
  * Screen: Light pixels from the source are painted over the destination, while dark pixels are not. This mode is most useful for mixing the texture of one layer with another layer (e.g., you can use a hillshade to texture another layer).
  * Dodge: Dodge will brighten and saturate underlying pixels based on the lightness of the top pixel. So, brighter top pixels cause the saturation and brightness of the underlying pixels to increase. This works best if the top pixels aren't too bright; otherwise the effect is too extreme.
  * Addition: This blend mode simply adds pixel values of one layer with the other. In case of values above one (in the case of RGB), white is displayed. This mode is suitable for highlighting features.
  * Darken: This creates a resultant pixel that retains the smallest components of the foreground and background pixels. Like lighten, the results tend to be jagged and harsh.
  * Multiply: Here, the numbers for each pixel of the top layer are multiplied with the corresponding pixels for the bottom layer. The results are darker pictures.
  * Burn: Darker colors in the top layer cause the underlying layers to darken. Burn can be used to tweak and colorise underlying layers.
  * Overlay: This mode combines the multiply and screen blending modes. In the resulting picture, light parts become lighter and dark parts become darker.
  * Soft light: This is very similar to overlay, but instead of using multiply/screen it uses color burn/dodge. This is supposed to emulate shining a soft light onto an image.
  * Hard light: Hard light is also very similar to the overlay mode. It's supposed to emulate projecting a very intense light onto an image.
  * Difference: Difference subtracts the top pixel from the bottom pixel, or the other way around, to always get a positive value. Blending with black produces no change, as the difference with all colors is zero.
  * Subtract: This blend mode simply subtracts pixel values of one layer from the other. In case of negative values, black is displayed.

.. index:: Symbology


Renderers
.........

The renderer is responsible for drawing a feature together with the correct
symbol. There are four types of renderers: single symbol, categorized, graduated and rule-based.
There is no continuous color renderer, because it is in fact only a special case
of the graduated renderer. The categorized and graduated renderers can be created
by specifying a symbol and a color ramp - they will set the colors for symbols
appropriately. For point layers, there is a point displacement renderer available.
For each data type (points, lines and polygons), vector symbol layer types are available. 
Depending on the chosen renderer, the :guilabel:`Style` menu provides different
additional sections. On the bottom right of the symbology dialog, there is a **[Symbol]** button, which gives access
to the Style Manager (see section vector_style_manager_). The Style Manager allows you to edit and remove
existing symbols and add new ones.


.. _tip_change_multiple_symbols:

.. tip:: **Select and change multiple symbols**

   The Symbology allows you to select multiple symbols and right
   click to change color, transparency, size, or width of selected
   entries.

.. index:: Single_Symbol_Renderer, Renderer_Single_Symbol

**Single Symbol Renderer**

The Single Symbol Renderer is used to render all features of the layer using
a single user-defined symbol. The properties, which can be adjusted in the
:guilabel:`Style` menu, depend partially on the type of layer, but all types share
the following dialog structure. In the top-left part of the menu, there is a preview
of the current symbol to be rendered. On the right part of the menu, there is
a list of symbols already defined for the current style, prepared to be used
by selecting them from the list. The current symbol can be modified using
the menu on the right side.

.. _defining_symbols:

If you click on the first level in the :guilabel:`Symbol layers` dialog on the left
side, it's possible to define basic parameters like :guilabel:`Size`, :guilabel:`Transparency`, :guilabel:`Color`
and :guilabel:`Rotation`. Here, the layers are joined together.


.. _figure_symbology_1:

.. only:: html

   **Figure Symbology 1:**

.. figure:: /static/user_manual/working_with_vector/singlesymbol_ng_line.png
   :align: center

   Single symbol line properties |nix|

More detailed settings can be made when clicking on the second level in the
:guilabel:`Symbol layers` dialog. You can define :guilabel:`Symbol layers` that are
combined afterwards. A symbol can consist of several :guilabel:`Symbol layers`.
The following settings are possible:

* Point layers:
 * :guilabel:`Symbol layer type`: You have the option to use Ellipse markers, Font markers,
   Simple markers, SVG markers and Vector Field markers.
 * :guilabel:`Colors`
 * :guilabel:`Size`
 * :guilabel:`Outline style`
 * :guilabel:`Outline width` 
 * :guilabel:`Angle`
 * :guilabel:`Offset X,Y`: You can shift the symbol in the x- or y-direction.
 * :guilabel:`Anchor point`
 * :guilabel:`Data defined properties ...`

* Line layers:
 * :guilabel:`Symbol layer type`: Here you can use Simple Lines and Marker Lines.
 * :guilabel:`Color`
 * :guilabel:`Pen width`
 * :guilabel:`Offset`
 * :guilabel:`Pen style`
 * :guilabel:`Join style`
 * :guilabel:`Cap style`
 * |checkbox| :guilabel:`Use custom dash pattern`
 * :guilabel:`Dash pattern unit`
 * :guilabel:`Data defined properties ...`

* Polygon Layers:
 * :guilabel:`Symbol layer type`: It's possible to use Centroid Fill, Gradient Fill, Line Pattern Fill,
   Point Pattern Fill, SVG Fill, Simple Fill and two Outlines (Marker line and Simple line).
 * :guilabel:`Colors`
 * :guilabel:`Fill style`
 * :guilabel:`Border style`
 * :guilabel:`Border width`
 * :guilabel:`Offset X,Y`
 * :guilabel:`Data defined properties ...`

'Gradient Fill' :guilabel:`Symbol layer type` allows you to select
between a |radiobuttonon| :guilabel:`Two color` 
and |radiobuttonoff| :guilabel:`Color ramp` setting. You can use the
|checkbox| :guilabel:`Feature centroid` as :guilabel:`Referencepoint`.
All fills 'Gradient Fill` :guilabel:`Symbol layer type` is also
available through the :guilabel:`Symbol` menu of the Categorized and
Graduated Renderer and through the :guilabel:`Rule properties` menu of
the Rule-based renderer.

It is possible to only draw polygon borders inside the polygon. Using
'Outline: Simple line' select |checkbox| :guilabel:`Draw line
only inside polygon`.

Note that once you have set the size in the lower levels of the :guilabel:`Symbol layers` dialog, 
the size of the whole symbol can be changed with the :guilabel:`Size` menu in the first level again. The size of
the lower levels changes accordingly, while the size ratio is maintained.
After having made any needed changes, the symbol can be added to the list of
current style symbols (using **[Symbol]** |selectstring| :guilabel:`Save in symbol library`),
and then it can easily be used in the future. Furthermore, you can use the **[Save Style]** |selectstring| button to
save the symbol as a |qg| layer style file (.qml) or SLD file (.sld). SLDs can be exported from any type of renderer -- single symbol,
categorized, graduated or rule-based -- but when importing an SLD, either a
single symbol or rule-based renderer is created.
That means that categorized or graduated styles are converted to rule-based.
If you want to preserve those renderers, you have to stick to the QML format.
On the other hand, it can be very handy sometimes to have this easy way of
converting styles to rule-based.

.. _vector_style_manager:

With the :guilabel:`Style manager` from the **[Symbol]** |selectstring| menu you can administer your
symbols. You can |mActionSignPlus| :sup:`add item`, |edit|:sup:`edit item`, |mActionSignMinus| :sup:`remove item`
and |user| :sup:`share item`. 'Marker' symbols, 'Line' symbols, 'Fill' patterns and 'Color ramps'
can be used to create the symbols (see defining_symbols_). The symbols are then assigned to 'All Symbols',
'Groups' or 'Smart groups'.


.. index:: Categorized_Renderer, Renderer_Categorized

**Categorized Renderer**


The Categorized Renderer is used to render all features from a layer, using
a single user-defined symbol whose color reflects the value of a selected
feature's attribute. The :guilabel:`Style` menu allows you to select:


* The attribute (using the Column listbox or the |mActionmIconExpressionEditorOpen| :guilabel:`Set column expression` function)
* The symbol (using the Symbol dialog)
* The colors (using the Color Ramp listbox)


The **[Advanced]** button in the lower-right corner of the dialog allows you to
set the fields containing rotation and size scale information.
For convenience, the center of the menu lists the values of
all currently selected attributes together, including the symbols that will
be rendered.

The example in figure_symbology_2_ shows the category rendering dialog used
for the rivers layer of the |qg| sample dataset.

.. _figure_symbology_2:

.. only:: html

   **Figure Symbology 2:**

.. figure:: /static/user_manual/working_with_vector/categorysymbol_ng_line.png
   :align: center

   Categorized Symbolizing options |nix|

.. index:: Color_Ramp, Gradient_Color_Ramp, ColorBrewer, Custom_Color_Ramp

You can create a custom color ramp choosing :menuselection:`New color ramp...`
from the :guilabel:`Color ramp` drop-down menu. A dialog will prompt for the ramp type:
Gradient, Random, ColorBrewer, or cpt-city. The first three have options for number of steps
and/or multiple stops in the color ramp. You can use the |checkbox| :guilabel:`Invert` option while classifying
the data with a color ramp. See figure_symbology_3_ for an
example of custom color ramp and figure_symbology_3a_ for the cpt-city dialog.

.. _figure_symbology_3:

.. only:: html

   **Figure Symbology 3:**

.. figure:: /static/user_manual/working_with_vector/customColorRampGradient.png
   :align: center

   Example of custom gradient color ramp with multiple stops |nix|

The cpt-city option opens a new dialog with hundreds of themes included 'out of the box'.

.. _figure_symbology_3a:

.. only:: html

   **Figure Symbology 3a:**

.. figure:: /static/user_manual/working_with_vector/cpt-cityColorRamps.png
   :align: center

   cpt-city dialog with hundreds of color ramps |nix|

.. index:: Graduated_Renderer, Renderer_Graduated
.. index:: Natural_Breaks_(Jenks), Pretty_Breaks, Equal_Interval, Quantile

**Graduated Renderer**

The Graduated Renderer is used to render all the features from a layer, using
a single user-defined symbol whose color reflects the assignment of a
selected feature's attribute to a class.


.. _figure_symbology_4:

.. only:: html

   **Figure Symbology 4:**

.. figure:: /static/user_manual/working_with_vector/graduatesymbol_ng_line.png
   :align: center

   Graduated Symbolizing options |nix|

Like the Categorized Renderer, the Graduated Renderer allows you
to define rotation and size scale from specified columns.

Also, analogous to the Categorized Renderer, the :guilabel:`Style` tab allows you to
select:


* The attribute (using the Column listbox or the |mActionmIconExpressionEditorOpen| :guilabel:`Set column expression` function)
* The symbol (using the Symbol Properties button)
* The colors (using the Color Ramp list)

Additionally, you can specify the number of classes and also the mode for
classifying features within the classes (using the Mode list). The available
modes are:

* Equal Interval
* Quantile
* Natural Breaks (Jenks)
* Standard Deviation
* Pretty Breaks


The listbox in the center part of the :guilabel:`Style` menu lists the classes
together with their ranges, labels and symbols that will be rendered.

The example in figure_symbology_4_ shows the graduated rendering dialog for
the rivers layer of the |qg| sample dataset.

.. tip:: **Thematic maps using an expression**

   Categorized and graduated thematic maps can now be created using the result of an expression. 
   In the properties dialog for vector layers, the attribute chooser has been augmented with a 
   |mActionmIconExpressionEditorOpen| :guilabel:`Set column expression` function. So now you no longer
   need to write the classification attribute to a new column in your attribute table if you want the
   classification attribute to be a composite of multiple fields, or a formula of some sort.

.. Index:: Rule-based_Rendering, Rendering_Rule-based


**Rule-based rendering**

The Rule-based Renderer is used to render all the features from a layer, using
rule based symbols whose color reflects the assignment of a selected
feature's attribute to a class. The rules are based on SQL statements. The dialog
allows rule grouping by filter or scale, and you can decide if you want to enable
symbol levels or use only the first-matched rule.

The example in figure_symbology_5_ shows the rule-based rendering dialog
for the rivers layer of the |qg| sample dataset.

To create a rule, activate an existing row by double-clicking on it, or click on '+' and
click on the new rule. In the :guilabel:`Rule properties` dialog, you can define a label
for the rule. Press the |browsebutton| button to open the expression string builder. In
the **Function List**, click on :guilabel:`Fields and Values` to view all attributes of
the attribute table to be searched. To add an attribute to the field calculator **Expression** field,
double click its name in the :guilabel:`Fields and Values` list. Generally, you
can use the various fields, values and functions to construct the calculation
expression, or you can just type it into the box (see :ref:`vector_field_calculator`).
Since |qg| 2.2, you can create a new rule by copying and pasting an existing rule with the right mouse button. 
Also since |qg| 2.2, you can use the 'ELSE' rule that will be run if none of the other 
rules on that level match.


.. _figure_symbology_5:

.. only:: html

   **Figure Symbology 5:**

.. figure:: /static/user_manual/working_with_vector/rulesymbol_ng_line.png
   :align: center

   Rule-based Symbolizing options |nix|

.. index:: Point_Displacement_Renderer, Renderer_Point_Displacement
.. index:: Displacement_plugin

**Point displacement**

The Point Displacement Renderer works to visualize all features of a point layer,
even if they have the same location. To do this, the symbols of the points are
placed on a displacement circle around a center symbol.

.. _figure_symbology_6:

.. only:: html

   **Figure Symbology 6:**

.. figure:: /static/user_manual/working_with_vector/poi_displacement.png
   :align: center

   Point displacement dialog |nix|

.. tip:: **Export vector symbology**

   You have the option to export vector symbology from |qg| into Google *.kml, *.dxf
   and MapInfo *.tab files. Just open the right mouse menu of the layer and click on :menuselection:`Save selection
   as -->` to specify the name of the output file and its format.
   In the dialog, use the :guilabel:`Symbology export` menu to save the symbology either as
   :menuselection:`Feature symbology -->` or as :menuselection:`Symbol layer symbology -->`.
   If you have used symbol layers, it is recommended to use the second setting.

.. _vector_labels_tab:

Labels Menu
-----------
The |mActionLabeling| :sup:`Labels` core application provides smart
labeling for vector point, line and polygon layers, and it only requires a
few parameters. This new application also supports on-the-fly transformed layers.
The core functions of the application have been redesigned. In |qg|, there are a 
number of other features that improve the labeling. The following menus
have been created for labeling the vector layers:

* Text
* Formatting
* Buffer
* Background
* Shadow
* Placement
* Rendering

Let us see how the new menus can be used for various vector layers.

.. _labeling_point_layers:
**Labeling point layers**

Start |qg| and load a vector point layer. Activate the layer in the legend and click on the
|mActionLabeling| :sup:`Layer Labeling Options` icon in the |qg| toolbar menu.

The first step is to activate the |checkbox| :guilabel:`Label this layer with` checkbox
and select an attribute column to use for labeling. Click |mActionmIconExpressionEditorOpen| if you
want to define labels based on expressions - See labeling_with_expressions_.

The following steps describe a simple labeling without using the :guilabel:`Data defined override` functions,
which are situated next to the drop-down menus.

You can define the text style in the :guilabel:`Text` menu (see Figure_labels_1_ ). Use the
:guilabel:`Type case` option to influence the text rendering. You have the possibility to render
the text 'All uppercase', 'All lowercase' or 'Capitalize first letter'. Use the blend modes to create effects
known from graphics programs (see blend_modes_).

In the :guilabel:`Formatting` menu, you can define a character for a line break in the labels with the 'Wrap on character' function.
Use the |checkbox| :guilabel:`Formatted numbers` option to format the numbers in an attribute table. Here,
decimal places may be inserted. If you enable this option, three decimal places are initially set by default.

To create a buffer, just activate the |checkbox| :guilabel:`Draw text buffer` checkbox in the :guilabel:`Buffer` menu.
The buffer color is variable. Here, you can also use blend modes (see blend_modes_).

If the |checkbox| :guilabel:`Color buffer's fill` checkbox is activated, it will interact with partially transparent
text and give mixed color transparency results. Turning off the buffer fill fixes that issue (except where the interior
aspect of the buffer's stroke intersects with the text's fill) and also allows you to make outlined text.

In the :guilabel:`Background` menu, you can define with :guilabel:`Size X` and :guilabel:`Size Y` the shape of your background.
Use :guilabel:`Size type` to insert an additional 'Buffer' into your background. The buffer size is set by default here.
The background then consists of the buffer plus the background in :guilabel:`Size X` and :guilabel:`Size Y`.
You can set a :guilabel:`Rotation` where you can choose between 'Sync with label', 'Offset of label' and 'Fixed'.
Using 'Offset of label' and 'Fixed', you can rotate the background. Define an :guilabel:`Offset X,Y` with X and Y values, and the background
will be shifted. When applying :guilabel:`Radius X,Y`, the background gets rounded corners.
Again, it is possible to mix the background with the underlying layers in the map canvas using the :guilabel:`Blend mode`
(see blend_modes_).

Use the :guilabel:`Shadow` menu for a user-defined :guilabel:`Drop shadow`. The drawing of the background is very variable.
Choose between 'Lowest label component', 'Text', 'Buffer' and 'Background'. The :guilabel:`Offset` angle depends on the orientation
of the label. If you choose the |checkbox| :guilabel:`Use global shadow` checkbox, then the zero point of the angle is
always oriented to the north and doesn't depend on the orientation of the label. You can influence the appearance of the shadow
with the :guilabel:`Blur radius`. The higher the number, the softer the shadows. The appearance of the drop shadow can also be altered by choosing a blend mode (see blend_modes_).


.. FIXME: at the moment there is an error in this setting

.. |checkbox| :guilabel:`Blur only alpha pixels`:
.. It is supposed to show only those
.. pixels that have a partial alpha component beyond the base opaque pixels of
.. the component being blurred. For example, if you set the shadow of some
.. text to be gray and turn on that option, it should still show a duplication
.. of the text, colored as per the shadow color option, but with any blurred
.. shadow that extends beyond its text. With the option off, in this example,
.. it will blur all pixels of the duplicated text.
.. This is useful for creating a shadow that increases legibility at smaller
.. output sizes, e.g. like duplicating text and offsetting it a bit in
.. illustration programs, while still showing a bit of shadow at larger sizes.
.. Apparently, there is an error with re-painting the opaque pixels back over
.. top of the shadow (depending upon the shadow's color), when that setting is
.. used.


Choose the :guilabel:`Placement` menu for the label placement and the labeling priority. Using the
|radiobuttonon| :guilabel:`Offset from point` setting, you now have the option to use :guilabel:`Quadrants`
to place your label. Additionally, you can alter the angle of the label placement with the :guilabel:`Rotation` setting.
Thus, a placement in a certain quadrant with a certain rotation is possible.

.. index:: Colliding_labels

In the :guilabel:`Rendering` menu, you can define label and feature options. Under :guilabel:`Label options`,
you find the scale-based visibility setting now. You can prevent |qg| from rendering only selected labels with
the |checkbox| :guilabel:`Show all labels for this layer (including colliding labels)` checkbox.
Under :guilabel:`Feature options`, you can define whether every part of a multipart feature is to be labeled. It's possible to define
whether the number of features to be labeled is limited and to |checkbox| :guilabel:`Discourage labels from covering features`.


.. features act as obstacles for labels or not .

.. _figure_labels_1:

.. only:: html

   **Figure Labels 1:**

.. figure:: /static/user_manual/working_with_vector/label_points.png
   :align: center

   Smart labeling of vector point layers |nix|

**Labeling line layers**

The first step is to activate the |checkbox| :guilabel:`Label this layer` checkbox
in the :guilabel:`Label settings` tab and select an attribute column to use for
labeling. Click |mActionmIconExpressionEditorOpen| if you
want to define labels based on expressions - See labeling_with_expressions_.

After that, you can define the text style in the :guilabel:`Text` menu. Here, you can use the
same settings as for point layers.

Also, in the :guilabel:`Formatting` menu, the same settings as for point layers are possible.

The :guilabel:`Buffer` menu has the same functions as described in section labeling_point_layers_.

The :guilabel:`Background` menu has the same entries as described in section labeling_point_layers_.

Also, the :guilabel:`Shadow` menu has the same entries as described in section labeling_point_layers_.

In the :guilabel:`Placement` menu, you find special settings for line layers. The label can be placed
|radiobuttonon| :guilabel:`Parallel`, |radiobuttonoff| :guilabel:`Curved` or |radiobuttonoff| :guilabel:`Horizontal`.
With the |radiobuttonon| :guilabel:`Parallel` and |radiobuttonoff| :guilabel:`Curved` option, you can define the position |checkbox| :guilabel:`Above line`, |checkbox| :guilabel:`On line`
and |checkbox| :guilabel:`Below line`. It's possible to select several options at once.
In that case, |qg| will look for the optimal position of the label. Remember that here you can
also use the line orientation for the position of the label.
Additionally, you can define a :guilabel:`Maximum angle between curved characters` when
selecting the |radiobuttonoff| :guilabel:`Curved` option (see Figure_labels_2_ ).

The :guilabel:`Rendering` menu has nearly the same entries as for point layers. In the
:guilabel:`Feature options`, you can now :guilabel:`Suppress labeling of features smaller than`.


.. if features act as obstacles for labels or not.

.. _figure_labels_2:

.. only:: html

   **Figure Labels 2:**

.. figure:: /static/user_manual/working_with_vector/label_line.png
   :align: center

   Smart labeling of vector line layers |nix|


**Labeling polygon layers**

The first step is to activate the |checkbox| :guilabel:`Label this layer` checkbox
and select an attribute column to use for labeling. Click |mActionmIconExpressionEditorOpen| if you
want to define labels based on expressions - See labeling_with_expressions_.

In the :guilabel:`Text` menu, define the text style. The entries are the same as for point
and line layers.

The :guilabel:`Formatting` menu allows you to format multiple lines, also similar to the cases of point and line layers.

As with point and line layers, you can create a text buffer in the :guilabel:`Buffer` menu.

Use the :guilabel:`Background` menu to create a complex user-defined background for the polygon layer.
You can use the menu also as with the point and line layers.

The entries in the :guilabel:`Shadow` menu are the same as for point and line layers.

In the :guilabel:`Placement` menu, you find special settings for polygon layers (see Figure_labels_3_).
|radiobuttonon| :guilabel:`Offset from centroid`, |radiobuttonoff| :guilabel:`Horizontal (slow)`,
|radiobuttonoff| :guilabel:`Around centroid`, |radiobuttonoff| :guilabel:`Free` and
|radiobuttonoff| :guilabel:`Using perimeter` are possible.

In the |radiobuttonon| :guilabel:`Offset from centroid` settings, you can specify if the centroid
is of the |radiobuttonon| :guilabel:`visible polygon` or |radiobuttonoff| :guilabel:`whole polygon`.
That means that either the centroid is used for the polygon you can see on the map or the centroid is
determined for the whole polygon, no matter if you can see the whole feature on the map.
You can place your label with the quadrants here, and define offset and rotation.
The |radiobuttonoff| :guilabel:`Around centroid` setting makes it possible to place the label
around the centroid with a certain distance. Again, you can define |radiobuttonon| :guilabel:`visible polygon`
or |radiobuttonoff| :guilabel:`whole polygon` for the centroid.
With the |radiobuttonoff| :guilabel:`Using perimeter` settings, you can define a position and
a distance for the label. For the position, |checkbox| :guilabel:`Above line`, |checkbox| :guilabel:`On line`,
|checkbox| :guilabel:`Below line` and |checkbox| :guilabel:`Line orientation dependent position` are possible.

The entries in the :guilabel:`Rendering` menu are the same as for line layers. You can also use
:guilabel:`Suppress labeling of features smaller than` in the :guilabel:`Feature options`.


.. if features act as obstacles for labels or not

.. _figure_labels_3:

.. only:: html

   **Figure Labels 3:**

.. figure:: /static/user_manual/working_with_vector/label_area.png
   :align: center

   Smart labeling of vector polygon layers |nix|


.. _labeling_with_expressions:


**Define labels based on expressions**

QGIS allows to use expressions to label features. Just click the 
|mActionmIconExpressionEditorOpen| icon in the |mActionLabeling| :sup:`Labels` 
menu of the properties dialog. In figure_labels_4_ you see a sample expression 
to label the alaska regions with name and area size, based on the field 'NAME_2', 
some descriptive text and the function '$area()' in combination with 
'format_number()' to make it look nicer.

.. features act as obstacles for labels or not .

.. _figure_labels_4:

.. only:: html

   **Figure Labels 4:**

.. figure:: /static/user_manual/working_with_vector/label_expression.png
   :align: center
   :width: 30em

   Using expressions for labeling |nix|

Expression based labeling is easy to work with. All you have to take care of 
is, that you need to combine all elements (strings, fields and functions) with a 
string concatenation sign '||' and that fields a written in "double quotes" 
and strings in 'single quotes'. Let's have a look at some examples:

::

   # label based on two fields 'name' and 'place' with a comma as separater 
   "name" || ', ' || "place"

   -> John Smith, Paris 

   # label based on two fields 'name' and 'place' separated by comma
   'My name is ' || "name" || 'and I live in ' || "place"

   -> My name is John Smith and I live in Paris

   # label based on two fields 'name' and 'place' with a descriptive text 
   # and a line break (\n)
   'My name is ' || "name" || '\nI live in ' || "place"

   -> My name is John Smith
      I live in Paris

   # create a multi-line label based on a field and the $area function
   # to show the place name and its area size based on unit meter.
   'The area of ' || "place" || 'has a size of ' || $area || 'm²'

   -> The area of Paris has a size of 105000000 m²

   # create a CASE ELSE condition. If the population value in field 
   # population is <= 50000 it is a town, otherwise a city.  
   'This place is a ' || CASE WHEN "population <= 50000" THEN 'town' ELSE 'city' END

  -> This place is a town

As you can see in the expression builder, you have hundreds if functions available to 
create simple and very complex expressions to label your data in QGIS.

**Using data-defined override for labeling**

With the data-defined override functions, the settings for the labeling
are overridden by entries in the attribute table.
You can activate and deactivate the function with the right-mouse button.
Hover over the symbol and you see the information about the data-defined override,
including the current definition field.
We now describe an example using the data-defined override function for the
|mActionMoveLabel|:sup:`Move label` function (see figure_labels_5_ ).

#. Import :file:`lakes.shp` from the |qg| sample dataset.
#. Double-click the layer to open the Layer Properties. Click on :guilabel:`Labels`
   and :guilabel:`Placement`. Select |radiobuttonon| :guilabel:`Offset from centroid`.
#. Look for the :guilabel:`Data defined` entries. Click the |mIconDataDefine| icon to
   define the field type for the :guilabel:`Coordinate`. Choose 'xlabel' for X and 'ylabel'
   for Y. The icons are now highlighted in yellow.
#. Zoom into a lake.
#. Go to the Label toolbar and click the |mActionMoveLabel| icon. Now you can shift the label
   manually to another position (see figure_labels_6_ ). The new position of the label is saved in the 'xlabel' and 'ylabel' columns of the
   attribute table.

.. _figure_labels_5:

.. only:: html

   **Figure Labels 5:**

.. figure:: /static/user_manual/working_with_vector/label_data_defined.png
   :align: center

   Labeling of vector polygon layers with data-defined override |nix|


.. _figure_labels_6:

.. only:: html

   **Figure Labels 6:**

.. figure:: /static/user_manual/working_with_vector/move_label.png
   :align: center

   Move labels |nix|


.. _vector_attributes_menu:

Fields Menu
-----------

|attributes| Within the :guilabel:`Fields` menu, the field attributes of the
selected dataset can be manipulated. The buttons |mActionNewAttribute|
:sup:`New Column` and |mActionDeleteAttribute| :sup:`Delete Column`
can be used when the dataset is in |mActionToggleEditing| :sup:`Editing mode`.

**Edit Widget**

.. following is included to give some space between title and figure!

\

\

.. _figure_fields_1:

.. only:: html

   **Figure Fields 1:**

.. figure:: /static/user_manual/working_with_vector/editwidgetsdialog.png
   :align: center

   Dialog to select an edit widget for an attribute column |nix|

Within the :guilabel:`Fields` menu, you also find an **edit widget** column.
This column can be used to define values or a range of values that are allowed
to be added to the specific attribute table column. If you click on the
**[edit widget]** button, a dialog opens, where you can define different
widgets. These widgets are:

* **Line edit**: An edit field that allows you to enter simple text
  (or restrict to numbers for numeric attributes).
* **Classification**: Displays a combo box with the values used for
  classification, if you have chosen 'unique value' as legend type in
  the :guilabel:`Style` menu of the properties dialog.
* **Range**: Allows you to set numeric values from a specific range. The edit
  widget can be either a slider or a spin box.
* **Unique values**: You can select one of the values already used in
  the attribute table. If 'Editable' is activated, a line edit is shown with
  autocompletion support, otherwise a combo box is used.
* **File name**: Simplifies the selection by adding a file chooser dialog.
* **Value map**: A combo box with predefined items. The value is stored in
  the attribute, the description is shown in the combo box. You can define
  values manually or load them from a layer or a CSV file.
* **Enumeration**: Opens a combo box with values that can be used within
  the columns type. This is currently only supported by the PostgreSQL provider.
* **Immutable**: The immutable attribute column is read-only. The user is not
  able to modify the content.
* **Hidden**: A hidden attribute column is invisible. The user is not able
  to see its contents.
* **Checkbox**: Displays a checkbox, and you can define what attribute is
  added to the column when the checkbox is activated or not.
* **Text edit**: This opens a text edit field that allows multiple lines to
  be used.
* **Calendar**: Opens a calendar widget to enter a date. Column type must be
  text.
* **Value Relation**: Offers values from a related table in a combobox. You can
  select layer, key column and value column.
* **UUID Generator**: Generates a read-only UUID (Universally Unique Identifiers)
  field, if empty.
* **Photo**: Field contains a filename for a picture. The width and height of the field can be defined.
* **Webview**: Field contains a URL. The width and height of the field is variable.
* **Color**: A field that allows you to enter color codes. During data entry, the color is visible through a color bar
  included in the field.
* **Relation Reference**: This widged lets you embed the feature form of the referenced layer on the feature form 
  of the actual layer. See :ref:`vector_relations`.

With the **Attribute editor layout**, you can now define built-in forms for data entry jobs (see figure_fields_2_).
Choose 'Drag and drop designer' and an attribute column. Use the |mActionSignPlus| icon to create
a category that will then be shown during the digitizing session (see figure_fields_3_). The next step will be to
assign the relevant fields to the category with the |mActionArrowRight| icon. You can create
more categories and use the same fields again. When creating a new category, |qg|
will insert a new tab for the category in the built-in form.

Other options in the dialog are 'Autogenerate' and 'Provide ui-file'. 'Autogenerate' just creates editors for all fields
and tabulates them.
The 'Provide ui-file' option allows you to use complex dialogs made with the Qt-Designer. Using a UI-file allows
a great deal of freedom in creating a dialog. For detailed information, see http://nathanw.net/2011/09/05/qgis-tips-custom-feature-forms-with-python-logic/.

|qg| dialogs can have a Python function that is called when the dialog is opened. Use this function to add extra logic to your dialogs.
An example is (in module MyForms.py):

::

  def open(dialog,layer,feature):
  geom = feature.geometry()
  control = dialog.findChild(QWidged,"My line edit")

Reference in Python Init Function like so: MyForms.open

MyForms.py must live on PYTHONPATH, in .qgis2/python, or inside the project folder.

.. _figure_fields_2:

.. only:: html

   **Figure Fields 2:**

.. figure:: /static/user_manual/working_with_vector/attribute_editor_layout.png
   :align: center

   Dialog to create categories with the **Attribute editor layout**

.. _figure_fields_3:

.. only:: html

   **Figure Fields 3:**

.. figure:: /static/user_manual/working_with_vector/resulting_feature_form.png
   :align: center

   Resulting built-in form in a data entry session

.. _vectorgeneralmenu:

General Menu
------------

|general| Use this menu to make general settings for the vector layer.
There are several options available:

Layer Info

* Change the display name of the layer in :guilabel:`displayed as`
* Define the :guilabel:`Layer source` of the vector layer
* Define the :guilabel:`Data source encoding` to define provider-specific options and to
  be able to read the file

Coordinate Reference System

* :guilabel:`Specify` the coordinate reference system. Here, you
  can view or change the projection of the specific vector layer.
* Create a :guilabel:`Spatial Index` (only for OGR-supported formats)
* :guilabel:`Update Extents` information for a layer
* View or change the projection of the specific vector layer, clicking on
  :guilabel:`Specify ...`

|checkbox| :guilabel:`Scale dependent visibility`

* You can set the :guilabel:`Maximum (inclusive)` and :guilabel:`Minimum (exclusive)`
  scale. The scale can also be set by the **[Current]** buttons.

Feature subset

* With the **[Query Builder]** button, you can create a subset of the features in the layer
  that will be visualized (also refer to section :ref:`sec_selection_query`).

.. _figure_general_vect:

.. only:: html

   **Figure General 1:**

.. figure:: /static/user_manual/working_with_vector/vector_general_menu.png
   :align: center

   General menu in vector layers properties dialog |nix|

Rendering Menu
--------------

|qg| 2.2 introduces support for on-the-fly feature generalisation. This can improve rendering times
when drawing many complex features at small scales. This feature can be enabled or disabled in the
layer settings using the |checkbox| :guilabel:`Simplify geometry` option. There is also a new global
setting that enables generalisation by default for newly added layers (see section :ref:`gui_options`).
**Note**: Feature generalisation may introduce artefacts into your rendered output in some cases.
These may include slivers between polygons and inaccurate rendering when using offset-based symbol layers.

Display Menu
------------

|mActionMapTips| This menu is specifically created for Map Tips. It includes a new feature:
Map Tip display text in HTML. While you can still choose a |radiobuttonoff| :guilabel:`Field`
to be displayed when hovering over a feature on the map, it is now possible to insert HTML code that creates a complex
display when hovering over a feature. To activate Map Tips, select the menu option :menuselection:`View --> MapTips`. Figure Display 1 shows an example of HTML code.

.. _figure_display_1:

.. only:: html

   **Figure Display 1:**

.. figure:: /static/user_manual/working_with_vector/display_html.png
   :align: center

   HTML code for map tip |nix|


.. _figure_display_2:

.. only:: html

   **Figure Display 2:**

.. figure:: /static/user_manual/working_with_vector/map_tip.png
   :align: center

   Map tip made with HTML code |nix|


Actions Menu
------------

|action| |qg| provides the ability to perform an action based on the attributes
of a feature. This can be used to perform any number of actions, for example,
running a program with arguments built from the attributes of a feature or
passing parameters to a web reporting tool.

.. _figure_actions_1:

.. only:: html

   **Figure Actions 1:**

.. figure:: /static/user_manual/working_with_vector/action_dialog.png
   :align: center

   Overview action dialog with some sample actions |nix|

Actions are useful when you frequently want to run an external application or
view a web page based on one or more values in your vector layer. They are
divided into six types and can be used like this:

* Generic, Mac, Windows and Unix actions start an external process.
* Python actions execute a Python expression.
* Generic and Python actions are visible everywhere.
* Mac, Windows and Unix actions are visible only on the respective platform (i.e.,
  you can define three 'Edit' actions to open an editor and the users can only
  see and execute the one 'Edit' action for their platform to run the editor).

There are several examples included in the dialog. You can load them by clicking
on **[Add default actions]**. One example is performing a search based on an
attribute value. This concept is used in the following discussion.

.. index:: Actions, Attribute_Actions

**Defining Actions**

Attribute actions are defined from the vector :guilabel:`Layer Properties`
dialog. To :index:`define an action`, open the vector :guilabel:`Layer Properties`
dialog and click on the :guilabel:`Actions` menu. Go to the :guilabel:`Action properties`.
Select 'Generic' as type and provide a descriptive name for the action. The action itself must contain
the name of the application that will be executed when the action is invoked.
You can add one or more attribute field values as arguments to the application.
When the action is invoked, any set of characters that start with a ``%``
followed by the name of a field will be replaced by the value of that field.
The special characters :index:`%%` will be replaced by the value of the field
that was selected from the identify results or attribute table (see using_actions_
below). Double quote marks can be used to group text into a single argument to
the program, script or command. Double quotes will be ignored if preceded by a
backslash.

If you have field names that are substrings of other field names (e.g.,
``col1`` and ``col10``), you should indicate that by surrounding the field name
(and the \% character) with square brackets (e.g., ``[%col10]``). This will
prevent the ``%col10`` field name from being mistaken for the ``%col1`` field name
with a ``0`` on the end. The brackets will be removed by |qg| when it
substitutes in the value of the field. If you want the substituted field to be
surrounded by square brackets, use a second set like this: ``[[%col10]]``.

Using the :guilabel:`Identify Features` tool, you can open the :guilabel:`Identify Results`
dialog. It includes a *(Derived)* item that contains information relevant to the
layer type. The values in this item can be accessed in a similar way to the other
fields by preceeding the derived field name with ``(Derived).``. For example,
a point layer has an ``X`` and ``Y`` field, and the values of these fields can be used in
the action with ``%(Derived).X`` and ``%(Derived).Y``. The derived attributes
are only available from the :guilabel:`Identify Results` dialog box, not the
:guilabel:`Attribute Table` dialog box.

Two :index:`example actions` are shown below:

* ``konqueror http://www.google.com/search?q=%nam``
* ``konqueror http://www.google.com/search?q=%%``

In the first example, the web browser konqueror is invoked and passed a URL
to open. The URL performs a Google search on the value of the ``nam`` field
from our vector layer. Note that the application or script called by the
action must be in the path, or you must provide the full path. To be certain, we
could rewrite the first example as:
``/opt/kde3/bin/konqueror http://www.google.com/search?q=%nam``. This will
ensure that the konqueror application will be executed when the action is
invoked.

The second example uses the \%\% notation, which does not rely on a particular
field for its value. When the action is invoked, the \%\% will be replaced by
the value of the selected field in the identify results or attribute table.

.. _using_actions:

**Using Actions**

Actions can be invoked from either the :guilabel:`Identify Results` dialog,
an :guilabel:`Attribute Table` dialog or from :guilabel:`Run Feature Action`
(recall that these dialogs can be opened by clicking |mActionIdentify|
:sup:`Identify Features` or |mActionOpenTable| :sup:`Open Attribute Table` or
|mAction| :sup:`Run Feature Action`). To invoke an action, right
click on the record and choose the action from the pop-up menu. Actions are
listed in the popup menu by the name you assigned when defining the action.
Click on the action you wish to invoke.

If you are invoking an action that uses the ``%%`` notation, right-click on the
field value in the :guilabel:`Identify Results` dialog or the
:guilabel:`Attribute Table` dialog that you wish to pass to the application
or script.

Here is another example that pulls data out of a vector layer and inserts
it into a file using bash and the ``echo`` command (so it will only work on
|nix| or perhaps |osx|). The layer in question has fields for a species name
``taxon_name``, latitude ``lat`` and longitude ``long``. We would like to be
able to make a spatial selection of localities and export these field values
to a text file for the selected record (shown in yellow in the |qg| map area).
Here is the action to achieve this:

::


  bash -c "echo \"%taxon_name %lat %long\" >> /tmp/species_localities.txt"


After selecting a few localities and running the action on each one, opening
the output file will show something like this:

::


  Acacia mearnsii -34.0800000000 150.0800000000
  Acacia mearnsii -34.9000000000 150.1200000000
  Acacia mearnsii -35.2200000000 149.9300000000
  Acacia mearnsii -32.2700000000 150.4100000000


As an exercise, we can create an action that does a Google search on the ``lakes``
layer. First, we need to determine the URL required to perform a search on a
keyword. This is easily done by just going to Google and doing a simple
search, then grabbing the URL from the address bar in your browser. From this
little effort, we see that the format is http://google.com/search?q=qgis,
where ``QGIS`` is the search term. Armed with this information, we can proceed:

#. Make sure the ``lakes`` layer is loaded.
#. Open the :guilabel:`Layer Properties` dialog by double-clicking on the
   layer in the legend, or right-click and choose :guilabel:`Properties`
   from the pop-up menu.
#. Click on the :guilabel:`Actions` menu.
#. Enter a name for the action, for example ``Google Search``.
#. For the action, we need to provide the name of the external program to run.
   In this case, we can use Firefox. If the program is not in your path, you
   need to provide the full path.
#. Following the name of the external application, add the URL used for doing
   a Google search, up to but not including the search term:
   ``http://google.com/search?q=``
#. The text in the :guilabel:`Action` field should now look like this:
   ``firefox http://google.com/search?q=``
#. Click on the drop-down box containing the field names for the ``lakes``
   layer. It's located just to the left of the **[Insert Field]** button.
#. From the drop-down box, select 'NAMES' and click **[Insert Field]**.
#. Your action text now looks like this:

   ``firefox http://google.com/search?q=%NAMES``
#. To finalize the action, click the **[Add to action list]** button.


This completes the action, and it is ready to use. The final text of the
action should look like this:

::

   firefox http://google.com/search?q=%NAMES

We can now use the action. Close the :guilabel:`Layer Properties` dialog and
zoom in to an area of interest. Make sure the ``lakes`` layer is active and
identify a lake. In the result box you'll now see that our action is visible:

.. _figure_actions_2:

.. only:: html

   **Figure Actions 2:**

.. figure:: /static/user_manual/working_with_vector/action_identifyaction.png
   :align: center

   Select feature and choose action |nix|

When we click on the action, it brings up Firefox and navigates to the URL
http://www.google.com/search?q=Tustumena. It is also possible to add further
attribute fields to the action. Therefore, you can add a ``+`` to the end of
the action text, select another field and click on **[Insert Field]**. In
this example, there is just no other field available that would make sense
to search for.

You can define multiple actions for a layer, and each will show up in the
:guilabel:`Identify Results` dialog.

.. % FIXME No longer valid??
.. %You can also invoke actions from the attribute table
.. %by selecting a row and right-clicking, then choosing the action from the pop-up
.. %menu.

There are all kinds of uses for actions. For example, if you have
a point layer containing locations of images or photos along with a file name,
you could create an action to launch a viewer to display the image. You could
also use actions to launch web-based reports for an attribute field or
combination of fields, specifying them in the same way we did in our
Google search example.

We can also make more complex examples, for instance, using **Python**
actions.

Usually, when we create an action to open a file with an external application,
we can use absolute paths, or eventually relative paths. In the second case,
the path is relative to the location of the external program executable file.
But what about if we need to use relative paths, relative to the selected layer
(a file-based one, like a shapefile or SpatiaLite)? The following code will
do the trick:

::

  command = "firefox";
  imagerelpath = "images_test/test_image.jpg";
  layer = qgis.utils.iface.activeLayer();
  import os.path;
  layerpath = layer.source() if layer.providerType() == 'ogr'
    else (qgis.core.QgsDataSourceURI(layer.source()).database()
    if layer.providerType() == 'spatialite' else None);
  path = os.path.dirname(str(layerpath));
  image = os.path.join(path,imagerelpath);
  import subprocess;
  subprocess.Popen( [command, image ] );

We just have to remember that the action is one of type *Python* and the *command* and *imagerelpath* variables must be changed to fit our needs.

But what about if the relative path needs to be relative to the (saved)
project file? The code of the Python action would be:

::

  command="firefox";
  imagerelpath="images/test_image.jpg";
  projectpath=qgis.core.QgsProject.instance().fileName();
  import os.path; path=os.path.dirname(str(projectpath)) if projectpath != '' else None;
  image=os.path.join(path, imagerelpath);
  import subprocess;
  subprocess.Popen( [command, image ] );

Another Python action example is the one that allows us to add new layers
to the project. For instance, the following examples will add to the project
respectively a vector and a raster. The names of the files to be added to the
project and the names to be given to the layers are data driven (*filename* and
*layername* are column names of the table of attributes of the vector where
the action was created):

::


  qgis.utils.iface.addVectorLayer('/yourpath/[% "filename" %].shp','[% "layername" %]',
    'ogr')


To add a raster (a TIF image in this example), it becomes:

::


  qgis.utils.iface.addRasterLayer('/yourpath/[% "filename" %].tif','[% "layername" %]
  ')

.. _`sec_joins`:

Joins Menu
----------


|join| The :guilabel:`Joins` menu allows you to :index:`join` a loaded attribute table
to a loaded vector layer. After clicking |mActionSignPlus|, the :guilabel:`Add vector join` dialog appears.
As key columns, you have to define a :index:`join layer` you want to connect with the target vector layer. Then, you have to specify the join field that is common to both the join layer and the target layer. As a result of the join, all information from the join layer and the target layer are displayed in the attribute table of the target layer as joined information.

.. FIXME: are table joins also possible with MSSQL and ORACLE tables?

|qg| currently has support for joining non-spatial table formats supported by OGR (e.g., CSV, DBF and Excel), delimited text and the PostgreSQL provider (see figure_joins_1_).

.. _figure_joins_1:

.. only:: html

   **Figure Joins 1:**

.. figure:: /static/user_manual/working_with_vector/join_attributes.png
   :align: center

   Join an attribute table to an existing vector layer |nix|

Additionally, the add vector join dialog allows you to:

* |checkbox| :guilabel:`Cache join layer in virtual memory`
* |checkbox| :guilabel:`Create attribute index on the join field`

.. _`sec_diagram`:

Diagrams Menu
-------------

|diagram| The :guilabel:`Diagrams` menu allows you to add a graphic overlay to a
vector layer (see figure_diagrams_1_).

The current core implementation of diagrams provides support for pie charts, text diagrams
and histograms.

The menu is divided into four tabs: :guilabel:`Appearance`, :guilabel:`Size`, :guilabel:`Postion` and :guilabel:`Options`.

In the cases of the text diagram and pie chart, text values of different data columns are displayed one below the other with a circle or a box and dividers. In the :guilabel:`Size` tab, diagram size is based on a fixed size or on linear scaling according to a classification attribute.
The placement of the diagrams, which is done in the :guilabel:`Position` tab, interacts with the new labeling, so position
conflicts between diagrams and labels are detected and solved. In addition,
chart positions can be fixed manually.

.. _figure_diagrams_1:

.. only:: html

   **Figure Diagrams 1:**

.. figure:: /static/user_manual/working_with_vector/diagram_tab.png
   :align: center

   Vector properties dialog with diagram menu |nix|

We will demonstrate an example and overlay on the Alaska boundary layer a
text diagram showing temperature data from a climate vector layer.
Both vector layers are part of the |qg| sample dataset (see section
:ref:`label_sampledata`).

#. First, click on the |mActionAddOgrLayer| :sup:`Load Vector` icon, browse
   to the |qg| sample dataset folder, and load the two vector shape layers
   :file:`alaska.shp` and :file:`climate.shp`.
#. Double click the ``climate`` layer in the map legend to open the
   :guilabel:`Layer Properties` dialog.
#. Click on the :guilabel:`Diagrams` menu, activate |checkbox|:guilabel:`Display diagrams`,
   and from the :guilabel:`Diagram type` |selectstring| combo box, select 'Text diagram'.
#. In the :guilabel:`Appearance` tab, we choose a light blue as background color, and
   in the :guilabel:`Size` tab, we set a fixed size to 18 mm.
#. In the :guilabel:`Position` tab, placement could be set to 'Around Point'.
#. In the diagram, we want to display the values of the three columns
   ``T_F_JAN``, ``T_F_JUL`` and ``T_F_MEAN``. First select ``T_F_JAN`` as
   :guilabel:`Attributes` and click the |mActionSignPlus| button, then ``T_F_JUL``, and
   finally ``T_F_MEAN``.
#. Now click **[Apply]** to display the diagram in the |qg| main window.
#. You can adapt the chart size in the :guilabel:`Size` tab. Deactivate the |checkbox| :guilabel:`Fixed size` and set
   the size of the diagrams on the basis of an attribute with the **[Find maximum value]** button and the
   :guilabel:`Size` menu. If the diagrams appear too small on the screen, you can activate the |checkbox| :guilabel:`Increase
   size of small diagrams` checkbox and define the minimum size of the diagrams.
#. Change the attribute colors by double clicking on the color values in the :guilabel:`Assigned attributes` field.   Figure_diagrams_2_ gives an idea of the result.
#. Finally, click **[Ok]**.

.. _figure_diagrams_2:

.. only:: html

   **Figure Diagrams 2:**

.. figure:: /static/user_manual/working_with_vector/climate_diagram.png
   :align: center
   :width: 25em

   Diagram from temperature data overlayed on a map |nix|

Remember that in the :guilabel:`Position` tab, a |checkbox| :guilabel:`Data defined position`
of the diagrams is possible. Here, you can use attributes to define the position of the diagram.
You can also set a scale-dependent visibility in the :guilabel:`Appearance` tab.

The size and the attributes can also be an expression. Use the |mActionmIconExpressionEditorOpen| button
to add an expression.

.. _vectormetadatamenu:

Metadata Menu
-------------

|metadata| The :guilabel:`Metadata` menu consists of :guilabel:`Description`,
:guilabel:`Attribution`, :guilabel:`MetadataURL` and :guilabel:`Properties` sections.

In the :guilabel:`Properties` section, you get general information about the layer,
including specifics about the type and location, number of features, feature type,
and editing capabilities. The :guilabel:`Extents`
table provides you with layer extent information and the :guilabel:`Layer Spatial Reference System`, which is information about the CRS of the layer. This is a quick way
to get information about the layer.

Additionally, you can add or edit a title and abstract for the layer in the :guilabel:`Description` section.
It's also possible to define a :guilabel:`Keyword list` here. These keyword lists can be used in a
metadata catalogue. If you want to use a title from an XML metadata file, you have to fill in
a link in the :guilabel:`DataUrl` field.
Use :guilabel:`Attribution` to get attribute data from an XML metadata catalogue.
In :guilabel:`MetadataUrl`, you can define the general path to the XML metadata catalogue.
This information will be saved in the |qg| project file for subsequent sessions
and will be used for |qg| server.

.. _figure_metadata_vect:

.. only:: html

   **Figure Metadata 1:**

.. figure:: /static/user_manual/working_with_vector/vector_metadata_tab.png
   :align: center

   Metadata menu in vector layers properties dialog |nix|
