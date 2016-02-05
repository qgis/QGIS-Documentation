|updatedisclaimer|

.. _vector_properties_dialog:

*****************************
The Vector Properties Dialog
*****************************

.. contents::
   :local:

The :guilabel:`Layer Properties` dialog for a vector layer provides general
settings to manage appearance of layer features in the map (symbology, labeling,
diagrams), interaction with the mouse (actions, map tips, form design). It also
provides information about the layer.

To access the :guilabel:`Layer Properties` dialog, double-click on a layer in
the legend or right-click on the layer and select :menuselection:`Properties` from the pop-up menu.


Special Tools
=============

.. _save_layer_property:

Save and Share Layer Properties
-------------------------------

When a layer is added to map canvas, QGIS uses by default a random symbol/color
to render its features. You can however set a default symbol in
:guilabel:`Project --> Properties --> Default styles` that will be applied
to each newly added layer according to its geometry type.

But, most of the time, you'd prefer to have a custom and more complexe style
that can be applied automatically or manually (with less efforts) to the layers.
You can achieve this goal using the :menuselection:`Style` combobox at the bottom of
the Layer Properties dialog. This combobox provides you with functions to create,
load and manage styles.

A style stores any information set in the layer properties dialog to render
or interact with the features (including symbology, labelling, action, diagram...
settings).
Styles can be stored inside the project, in a file (``.qml`` or ``.sld``) or
in a database (SpatiaLite, PostGIS...). Thanks to layer visibility manager, you can assign
several styles to the same layer but only one can be active at the same time.

.. only:: html

   **Figure Vector Properties 10:**

.. _figure_vector_properties_10:

.. figure:: /static/user_manual/working_with_vector/style_combobox.png
   :align: center

   Style combobox options

By default, the style applied to a loaded layer is named ``default``.
Once you have got the ideal and appropriate rendering for your layer,
you can save it by clicking the |selectstring| :menuselection:`Style` combobox and choose:

* **Rename Current**: The active style gets renamed and updated with the current options
* **Add**: A new style is created using the current options.

At the bottom of the Style drop-down list, you see the styles set
for the layer and the active one is checked.
Once you have more than one style defined for a layer, a **Remove Current** option
can help you delete those you no more want.

Note that each time you validate the layer properties dialog, the active style
is updated with the changes you've done.

You can create as many styles as you wish for each layer.
Combined to layer visibility preset, this offers a quick and powerful way to manage
complexe projects with few layers (no need to duplicate any layer in the map legend).

While these styles are saved inside the project and can be copied and pasted from
layer to layer in the project, it's also possible to save them outside the project
so that they can be loaded in another project.
Clicking the |selectstring| :menuselection:`Style --> Save Style`
saves the symbol as a QGIS layer style file (``.qml``) or SLD file (``.sld``).
SLDs can be exported from any type of renderer -- single symbol,
categorized, graduated or rule-based -- but when importing an SLD, either a
single symbol or rule-based renderer is created.
That means that categorized or graduated styles are converted to rule-based.
If you want to preserve those renderers, you have to stick to the QML format.
On the other hand, it can be very handy sometimes to have this easy way of
converting styles to rule-based.

If the datasource of the layer is a database (PostGIS or Spatialite for example),
you can also save your layer style inside a table of the database. Just click on
:menuselection:`Save Style` combobox and choose **Save in database** item then fill in
the dialog to define a style name, add a description, an ui file if applicable
and check if the style is the default style. You can add several style in the database.
However each table can have only one default style.

.. ToDo:
   It might be interesting to explain the difference between *local database*
   and *datasource database* proposed as options when saving or loading style from DB

   It might also be nice to add the tip about restoring style table while
   restoring a database

When loading a layer in QGIS, if a default style already exists for this layer,
QGIS will load the layer and its style. After you modified the layer style,
you can **Save as Default**, creating a new style that becomes the default one
or **Restore Default** style if you're not satisfied.

.. only:: html

   **Figure Vector Properties 2:**

.. _figure_vector_properties_2:

.. figure:: /static/user_manual/working_with_vector/save_style_database.png
   :align: center

   Save Style in database Dialog


From many parts of the layer properties dialog (and also from many other dialogs),
there are some features you'll often encounter. Some of them are presented below.

.. _color-selector:

Color Selector
--------------

The :guilabel:`select color` dialog will appear whenever you click
to choose a color - either border or fill color. This dialog
has four different tabs which allow you to select colors by
|mIconColorBox| :sup:`color ramp`, |mIconColorWheel| :sup:`color wheel`,
|mIconColorSwatches| :sup:`color swatches` or |mIconColorPicker| :sup:`color picker`.

Whatever method you use, the selected color is always described through color
sliders for HSV  (Hue, Saturation, Value) and RGB (Red, Green, Blue) values.
There is also an :guilabel:`opacity` slider to set transparency level.
On the lower left part of the dialog you can see a comparison between the
:guilabel:`current` and the :guilabel:`new` color you are presently
selecting and on the lower right part you have the option to add the color
you just tweaked into a color slot button.

.. _figure_color_selector_1:

.. only:: html

   **Figure color selector 1:**

.. figure:: /static/user_manual/working_with_vector/color_selector_ramp.png
   :align: center

   Color selector ramp tab


With |mIconColorBox| :sup:`color ramp` or with |mIconColorWheel| :sup:`color wheel`,
you can browse to all possible color combinations.
There are other possibilities though. By using |mIconColorSwatches| :sup:`color swatches`
you can choose from a preselected list. This selected list is
populated with one of three methods: :guilabel:`Recent colors`,
:guilabel:`Standard colors` or :guilabel:`Project colors`.

.. _figure_color_selector_2:

.. only:: html

   **Figure color selector 2:**

.. figure:: /static/user_manual/working_with_vector/color_selector_recent_colors.png
   :align: center

   Color selector switcher tab


Another option is to use the |mIconColorPicker| :sup:`color picker` which allows
you to sample a color from under your mouse pointer at any part of
QGIS or even from another application by pressing the space bar. Please note
that the color picker is OS dependent and is currently not supported by OSX.

.. _tip_quick_color_picker_+_copy/paste_colors:

.. tip:: **quick color picker + copy/paste colors**

   You can quickly choose from :guilabel:`Recent colors`, from :guilabel:`Standard colors`
   or simply :guilabel:`copy` or :guilabel:`paste` a color by clicking
   the drop-down arrow that follows a current color box.

.. _figure_color_selector_3:

.. only:: html

   **Figure color selector 3:**

.. figure:: /static/user_manual/working_with_vector/quick_color_selector.png
   :align: center

   Quick color selector menu


.. _blend-modes:

Blending Modes
--------------

QGIS offers different options for special rendering effects with these tools that
you may previously only know from graphics programs:

* **Normal**: This is the standard blend mode, which uses the alpha channel of the top
  pixel to blend with the pixel beneath it. The colors aren't mixed.
* **Lighten**: This selects the maximum of each component from the foreground and
  background pixels. Be aware that the results tend to be jagged and harsh.
* **Screen**: Light pixels from the source are painted over the destination, while
  dark pixels are not. This mode is most useful for mixing the texture of one layer
  with another layer (e.g., you can use a hillshade to texture another layer).
* **Dodge**: Dodge will brighten and saturate underlying pixels based on the lightness
  of the top pixel. So, brighter top pixels cause the saturation and brightness of
  the underlying pixels to increase. This works best if the top pixels aren't too
  bright; otherwise the effect is too extreme.
* **Addition**: This blend mode simply adds pixel values of one layer with the other.
  In case of values above one (in the case of RGB), white is displayed.
  This mode is suitable for highlighting features.
* **Darken**: This creates a resultant pixel that retains the smallest components of the
  foreground and background pixels. Like lighten, the results tend to be jagged and harsh.
* **Multiply**: Here, the numbers for each pixel of the top layer are multiplied with
  the corresponding pixels for the bottom layer. The results are darker pictures.
* **Burn**: Darker colors in the top layer cause the underlying layers to darken.
  Burn can be used to tweak and colorise underlying layers.
* **Overlay**: This mode combines the multiply and screen blending modes.
  In the resulting picture, light parts become lighter and dark parts become darker.
* Soft light: This is very similar to overlay, but instead of using multiply/screen
  it uses color burn/dodge. This is supposed to emulate shining a soft light onto an image.
* **Hard light**: Hard light is also very similar to the overlay mode. It's supposed
  to emulate projecting a very intense light onto an image.
* **Difference**: Difference subtracts the top pixel from the bottom pixel, or the other
  way around, to always get a positive value. Blending with black produces no change,
  as the difference with all colors is zero.
* **Subtract**: This blend mode simply subtracts pixel values of one layer from the other.
  In case of negative values, black is displayed.

.. _draw-effects:

..
  Draw effects
  ------------


  Data-Defined Override
  ---------------------


.. _vectorgeneralmenu:


General Menu
============

|general| Use this menu to make general settings for the vector layer.
There are several options available:

**Layer Info**

* Change the display name of the layer in :guilabel:`displayed as`
* Define the :guilabel:`Layer source` of the vector layer
* Define the :guilabel:`Data source encoding` to define provider-specific options
  and to be able to read the file

**Coordinate Reference System**

* :guilabel:`Specify` the coordinate reference system. Here, you
  can view or change the projection of the specific vector layer.
* Create a :guilabel:`Spatial Index` (only for OGR-supported formats)
* :guilabel:`Update Extents` information for a layer
* View or change the projection of the specific vector layer, clicking on
  :guilabel:`Specify ...`

|checkbox| :guilabel:`Scale dependent visibility`

* You can set the :guilabel:`Maximum (inclusive)` and :guilabel:`Minimum (exclusive)`
  scale, defining a range of scale in which features will be visible.
  Out of this range, they are hidden.
  The |mActionMapIdentification| :sup:`Set to current canvas scale` button helps
  you use the current map canvas scale as boundary of the range visibility.

**Feature subset**

* With the **[Query Builder]** button, you can create a subset of the features in the
  layer that will be visualized (also refer to section :ref:`vector_query_builder`).

.. do not change the order of reference-tag and only-tag, this figure has
   an external reference.

.. only:: html

   **Figure Vector General 1:**

.. _figure_vector_general_1:

.. figure:: /static/user_manual/working_with_vector/vector_general_menu.png
   :align: center

   General menu in vector layers properties dialog


.. index:: Symbology

.. _vector_style_menu:


Style Menu
==========

The Style menu provides you with a comprehensive tool for rendering and
symbolizing your vector data.
You can use tools that are common to all vector data, as well as special symbolizing
tools that were designed for the different kinds of vector data.

Features rendering
------------------

The renderer is responsible for drawing a feature together with the correct
symbol. There are four types of renderers: single symbol, categorized, graduated
and rule-based.
There is no continuous color renderer, because it is in fact only a special case
of the graduated renderer. The categorized and graduated renderers can be created
by specifying a symbol and a color ramp - they will set the colors for symbols
appropriately. For point layers, there is a point displacement renderer available.
For each data type (points, lines and polygons), vector symbol layer types are available.
Depending on the chosen renderer, the :guilabel:`Style` menu provides different
additional sections.

If you change the renderer type when setting the style of a vector layer the settings
you made for the symbol will be maintained. Be aware that this procedure only works
for one change. If you repeat changing the renderer type the settings for the symbol
will get lost.

.. index:: Single_Symbol_Renderer, Renderer_Single_Symbol

Single Symbol Renderer
......................

The Single Symbol Renderer is used to render all features of the layer using
a single user-defined symbol. The properties, which can be adjusted in the
:guilabel:`Style` menu, depend partially on the type of layer, but all types share
the following dialog structure: in the upper part, you have panels that help you
prepare the symbol to use (see :ref:`symbol-selector` for further information),
and at the bottom the :ref:`layer_rendering` widget.


.. _figure_symbology_1:

.. only:: html

   **Figure Symbology 1:**

.. figure:: /static/user_manual/working_with_vector/singlesymbol_ng_line.png
   :align: center

   Single symbol line properties

.. index:: Categorized_Renderer, Renderer_Categorized


Categorized Renderer
....................

The Categorized Renderer is used to render all features from a layer, using
an user-defined symbol whose aspect reflects the value of a selected
feature's attribute. The :guilabel:`Style` menu allows you to select:


* The attribute (using the Column listbox or the |mActionmIconExpressionEditorOpen|
  :guilabel:`Set column expression` function, see :ref:`vector_expressions` chapter)
* The symbol (using the :ref:`symbol-selector` dialog) which will be used as default
  for each class
* The range of colors (using the Color ramp listbox) from which color applied
  to the symbol is selected

Then click on **Classify** button to create classes from the distinct value of
the attribute column. Each class can be disabled unchecking the checkbox at
the left of the class name.

To change symbol, value and/or label of the class, just double click
on the item you want to change.

Right-click shows a contextual menu to **Copy/Paste**, **Change color**, **Change
transparency**, **Change output unit**, **Change symbol width**.

The example in figure_symbology_2_ shows the category rendering dialog used
for the rivers layer of the QGIS sample dataset.

.. _figure_symbology_2:

.. only:: html

   **Figure Symbology 2:**

.. figure:: /static/user_manual/working_with_vector/categorysymbol_ng_line.png
   :align: center

   Categorized Symbolizing options

.. _tip_change_multiple_symbols:

.. tip:: **Select and change multiple symbols**

   The Symbology allows you to select multiple symbols and right
   click to change color, transparency, size, or width of selected
   entries.

.. index:: Graduated_Renderer, Renderer_Graduated
.. index:: Natural_Breaks_(Jenks), Pretty_Breaks, Equal_Interval, Quantile


Graduated Renderer
..................

.. FixMe: This section is really really out of date

The Graduated Renderer is used to render all the features from a layer, using
an user-defined symbol whose color or size reflects the assignment of a
selected feature's attribute to a class.


Like the Categorized Renderer, the Graduated Renderer allows you
to define rotation and size scale from specified columns.

Also, analogous to the Categorized Renderer, the :guilabel:`Style` tab allows you
to select:


* The attribute (using the Column listbox or the |mActionmIconExpressionEditorOpen|
  :guilabel:`Set column expression` function)
* The symbol (using the Symbol selector dialog)
* The colors (using the color Ramp list)

Additionally, you can specify the number of classes and also the mode for
classifying features within the classes (using the Mode list). The available
modes are:

* Equal Interval: each class has the same size (e.g. values from 0 to 16 and
  4 classes, each class has a size of 4);
* Quantile: each class will have the same number of element inside
  (the idea of a boxplot);
* Natural Breaks (Jenks): the variance within each class is minimal while the
  variance between classes is maximal;
* Standard Deviation: classes are built depending on the standard deviation of
  the values;
* Pretty Breaks: Computes a sequence of about n+1 equally spaced nice values
  which cover the range of the values in x. The values are chosen so that they
  are 1, 2 or 5 times a power of 10. (based on pretty from the R statistical
  environment http://astrostatistics.psu.edu/datasets/R/html/base/html/pretty.html)


The listbox in the center part of the :guilabel:`Style` menu lists the classes
together with their ranges, labels and symbols that will be rendered.

Click on **Classify** button to create classes using the chosen mode. Each
classes can be disabled unchecking the checkbox at the left of the class name.

To change symbol, value and/or label of the class, just double click
on the item you want to change.

Right-click shows a contextual menu to **Copy/Paste**, **Change color**, **Change
transparency**, **Change output unit**, **Change symbol width**.

The example in figure_symbology_3_ shows the graduated rendering dialog for
the rivers layer of the QGIS sample dataset.


.. _figure_symbology_3:

.. only:: html

   **Figure Symbology 3:**

.. figure:: /static/user_manual/working_with_vector/graduatesymbol_ng_line.png
   :align: center

   Graduated Symbolizing options


The |mIconDataDefine| menu provides 'Data-defined override' for points size
and rotation and for line width (for points and line layers resp.). For point
layers, an assistant is accessible through the |mIconDataDefine| menu
to help you define size expression.

.. _figure_symbology_4:

.. only:: html

   **Figure Symbology 4:**

.. figure:: /static/user_manual/working_with_vector/varying_size_assistant.png
   :align: center

   Varying size assistant

The assistant lets you define:

* The attribute (using the Field listbox or the |mActionmIconExpressionEditorOpen|
  :guilabel:`Set column expression` function, see :ref:`vector_expressions`)
* The minimum and maximum size of the symbol
* The minimum and maximum values of the Field. The down pointing arrow allows
  to set the minimum and maximum values according to your data.

The values presented in the varying size assistant above will set the size
'Data-defined override' with:
::

 scale_exp( Importance, 1, 20, 1, 10, 0.57 )

The available scale methods are 'Flannery', 'Surface' and 'Radius'.





.. tip:: **Thematic maps using an expression**

   Categorized and graduated thematic maps can be created using the result
   of an expression. In the properties dialog for vector layers, the attribute
   chooser is extended with a |mActionmIconExpressionEditorOpen|
   :guilabel:`Set column expression` function.
   So you don't need to write the classification attribute
   to a new column in your attribute table if you want the classification
   attribute to be a composite of multiple fields, or a formula of some sort.

.. Index:: Rule-based_Rendering, Rendering_Rule-based

.. _rule_based_rendering:

Rule-based rendering
....................

The Rule-based Renderer is used to render all the features from a layer,
using rule based symbols whose aspect reflects the assignment of a selected
feature's attribute to a class. The rules are based on SQL statements.
The dialog allows rule grouping by filter or scale, and you can decide
if you want to enable symbol levels or use only the first-matched rule.

To create a rule, activate an existing row by double-clicking on it, or
click on '+' and click on the new rule. In the :guilabel:`Rule properties` dialog,
you can define a label for the rule. Press the |browsebutton| button to open the
expression string builder.
In the **Function List**, click on :guilabel:`Fields and Values` to view all
attributes of the attribute table to be searched.
To add an attribute to the field calculator **Expression** field,
double click on its name in the :guilabel:`Fields and Values` list. Generally, you
can use the various fields, values and functions to construct the calculation
expression, or you can just type it into the box (see :ref:`vector_expressions`).
You can create a new rule by copying and pasting an existing rule with the right
mouse button. You can also use the 'ELSE' rule that will be run if none of the other
rules on that level matches.
Since QGIS 2.8 the rules appear in a tree hierarchy in the map legend. Just
double-click the rules in the map legend and the Style menu of the layer properties
appears showing the rule that is the background for the symbol in the tree.

The example in figure_symbology_5_ shows the rule-based rendering dialog
for the rivers layer of the QGIS sample dataset.

.. _figure_symbology_5:

.. only:: html

   **Figure Symbology 5:**

.. figure:: /static/user_manual/working_with_vector/rulesymbol_ng_line.png
   :align: center

   Rule-based Symbolizing options

.. index:: Point_Displacement_Renderer, Renderer_Point_Displacement
.. index:: Displacement_plugin

Point displacement
..................

The Point Displacement Renderer works to visualize all features of a point layer,
even if they have the same location. To do this, the symbols of the points are
placed on a displacement circle around a center symbol.

.. _figure_symbology_6:

.. only:: html

   **Figure Symbology 6:**

.. figure:: /static/user_manual/working_with_vector/poi_displacement.png
   :align: center

   Point displacement dialog

.. tip:: **Export vector symbology**

   You have the option to export vector symbology from QGIS into Google \*.kml,
   \*.dxf and MapInfo \*.tab files. Just open the right mouse menu of the layer
   and click on :menuselection:`Save As...` to specify the name
   of the output file and its format.
   In the dialog, use the :menuselection:`Symbology export` menu to save the symbology
   either as :menuselection:`Feature symbology -->` or as :menuselection:`Symbol
   layer symbology -->`.
   If you have used symbol layers, it is recommended to use the second setting.

.. ToDo: add information about the export options


.. index:: Inverted_Polygon_Renderer

Inverted Polygon
................

Inverted polygon renderer allows user to define a symbol to fill in outside of
the layer's polygons. As before you can select subrenderers. These subrenderers
are the same as for the main renderers.

.. _figure_symbology_7:

.. only:: html

   **Figure Symbology 7:**

.. figure:: /static/user_manual/working_with_vector/inverted_polygon_symbol.png
   :align: center

   Inverted Polygon dialog

.. tip:: **Switch quickly between styles**

   Once you created one of the above mentioned styles you can right-click on the
   layer and choose :menuselection:`Styles --> Add` to save your style. Now you
   can easily switch between styles you created using the
   :menuselection:`Styles -->` menu again.

.. index:: Heatmap Renderer

Heatmap
.......

With the Heatmap renderer you can create live dynamic heatmaps for (multi)point
layers. You can specify the heatmap radius in pixels, mm or map units, choose
a color ramp for the heatmap style and use a slider for selecting a trade-off
between render speed and quality. When adding or removing a feature the heatmap
renderer updates the heatmap style automatically.

.. _layer_rendering:

Layer rendering
---------------

From the Style tab, you can also set some options that invariabily act on all
features of the layer:

* :guilabel:`Layer transparency` |slider|: You can make the underlying layer in
  the map canvas visible with this tool. Use the slider to adapt the visibility
  of your vector layer to your needs. You can also make a precise definition of
  the percentage of visibility in the the menu beside the slider.
* :guilabel:`Layer blending mode` and :guilabel:`Feature blending mode`: You can
  achieve special rendering effects with these tools that you may
  previously only know from graphics programs. The pixels of your overlaying and
  underlaying layers are mixed through the settings described in :ref:`blend-modes`.
* :guilabel:`Draw effects`
* :guilabel:`Control feature rendering order` allows you to define, using features
  attributes, the order in which they shall be processed by the renderer.


.. _vector_labels_tab:

Labels Menu
===========

The |mActionLabeling| :sup:`Labels` core application provides smart
labelling for vector point, line and polygon layers, and only requires a
few parameters. This application also supports on-the-fly transformed layers.
The following menus are used to configure the labelling of vector layers:

* Text
* Formatting
* Buffer
* Background
* Shadow
* Placement
* Rendering

To label a layer start QGIS and load a vector layer. Activate the layer
in the legend and click on the |mActionLabeling| :sup:`Layer Labelling Options`
icon in the QGIS toolbar menu.

The first step is to choose the labelling method from the drop-down list. There
are four options available: **No labels**, **Show labels for this layer**, **Rule-based
labelling** and **Discourage other labels from covering features in this layer**.
Select the **Show labels for this layer** option and then select an attribute
column to use for labelling from the **Label with** drop-down list. Click
|mActionmIconExpressionEditorOpen| if you want to define labels based on
expressions - See labeling_with_expressions_.

The following steps describe simple labelling without using the
:guilabel:`Data defined override` functions,
which are situated next to the drop-down menus.

Text menu
---------

You can define the text style in the :guilabel:`Text` menu (see Figure_labels_1_).
Use the :guilabel:`Type case` option to influence the text rendering.
You have the possibility to render the text 'All uppercase', 'All lowercase'
or 'Capitalize first letter'. Use the :ref:`blend-modes` to create effects
known from graphics programs.

Formatting menu
---------------

In the :guilabel:`Formatting` menu, you can define a character for a line break
in the labels with the 'Wrap on character' function. You can format the
:guilabel:`Line Height` and the alignment. For the latter typical values are
available plus *Follow label placement*. When set to this mode, text alignment
for labels will be dependant on the final placement of the label relative to the
point. Eg, if the label is placed to the left of the point then the label will
be right aligned, and if it is placed to the right of the point then the label
will be left aligned.

For line vector layers you can include line directions symbols. There are options
specifying the type of symbol and the symbol placement.

Use the |checkbox| :guilabel:`Formatted numbers` option to format the numbers in
an attribute table. Here, decimal places may be inserted.
If you enable this option, three decimal places are initially set by default.

Buffer menu
-----------

To create a buffer, just activate the |checkbox| :guilabel:`Draw text buffer`
checkbox in the :guilabel:`Buffer` menu.
The buffer color is variable. Here, you can also use blend modes.
If the |checkbox| :guilabel:`color buffer's fill` checkbox is activated, it will
interact with partially transparent text and give mixed color transparency
results. Turning off the buffer fill fixes that issue (except where the interior
aspect of the buffer's stroke intersects with the text's fill) and also allows
you to make outlined text.

Background menu
---------------

In the :guilabel:`Background` menu, you can define with :guilabel:`Size X` and
:guilabel:`Size Y` the shape of your background.
Use :guilabel:`Size type` to insert an additional 'Buffer' into your background.
The buffer size is set by default here.
The background then consists of the buffer plus the background in :guilabel:`Size X`
and :guilabel:`Size Y`. You can set a :guilabel:`Rotation` where you can choose
between 'Sync with label', 'Offset of label' and 'Fixed'.
Using 'Offset of label' and 'Fixed', you can rotate the background.
Define an :guilabel:`Offset X,Y` with X and Y values, and the background
will be shifted. When applying :guilabel:`Radius X,Y`, the background gets
rounded corners.
Again, it is possible to mix the background with the underlying layers in the
map canvas using the :guilabel:`Blend mode` (see :ref:`blend-modes`).

Shadow menu
-----------

Use the :guilabel:`Shadow` menu for a user-defined :guilabel:`Drop shadow`.
The drawing of the background is very variable.
Choose between 'Lowest label component', 'Text', 'Buffer' and 'Background'.
The :guilabel:`Offset` angle depends on the orientation
of the label. If you choose the |checkbox| :guilabel:`Use global shadow` checkbox,
then the zero point of the angle is
always oriented to the north and doesn't depend on the orientation of the label.
You can influence the appearance of the shadow with the :guilabel:`Blur radius`.
The higher the number, the softer the shadows. The appearance of the drop shadow
can also be altered by choosing a blend mode.


.. comment FIXME: at the moment there is an error in this setting

   |checkbox| :guilabel:`Blur only alpha pixels`:
   It is supposed to show only those
   pixels that have a partial alpha component beyond the base opaque pixels of
   the component being blurred. For example, if you set the shadow of some
   text to be gray and turn on that option, it should still show a duplication
   of the text, colored as per the shadow color option, but with any blurred
   shadow that extends beyond its text. With the option off, in this example,
   it will blur all pixels of the duplicated text.
   This is useful for creating a shadow that increases legibility at smaller
   output sizes, e.g. like duplicating text and offsetting it a bit in
   illustration programs, while still showing a bit of shadow at larger sizes.
   Apparently, there is an error with re-painting the opaque pixels back over
   top of the shadow (depending upon the shadow's color), when that setting is
   used.

Placement menu
--------------

Choose the :guilabel:`Placement` menu for configuring label placement and labeling
priority. Note that the placement options differ according to the type of
vector layer, namely point, line or polygon.

Placement for point layers
..........................

Using the |radiobuttonon| :guilabel:`Around point` setting, you are able to set
the distance between the points and their labels.

If you use the |radiobuttonon| :guilabel:`Offset from point` setting, you
can select the :guilabel:`Quadrant` in which to place your label. You are also
able to set the distance between the points and their labels and can alter the
angle of the label placement with the :guilabel:`Rotation` setting. Thus,
placement in a selected quadrant with a defined rotation is possible.

Placement for line layers
.........................

Label options for line layers include |radiobuttonon| :guilabel:`Parallel`,
|radiobuttonoff| :guilabel:`Curved` or |radiobuttonoff| :guilabel:`Horizontal`.
For the |radiobuttonon| :guilabel:`Parallel` and 
|radiobuttonoff| :guilabel:`Curved` options, you can set the position to 
|checkbox| :guilabel:`Above line`, |checkbox| :guilabel:`On line` and
|checkbox| :guilabel:`Below line`. It's possible to select several options at once.
In that case, QGIS will look for the optimal label position. For Parallel and
curved placement you can also use the line orientation for the position of the label.
Additionally, you can define a :guilabel:`Maximum angle between curved characters` when
selecting the |radiobuttonoff| :guilabel:`Curved` option (see Figure_labels_2_ ).

For all three placement options you can set up a minimum distance for repeating
labels. The distance can be in mm or in map units.

Placement for polygon layers
............................

You can choose one of the following options for placing labels in polygons:
|radiobuttonon| :guilabel:`Offset from centroid`, |radiobuttonoff| :guilabel:`Horizontal
(slow)`, |radiobuttonoff| :guilabel:`Around centroid`,
|radiobuttonoff| :guilabel:`Free` and
|radiobuttonoff| :guilabel:`Using perimeter`.

In the |radiobuttonon| :guilabel:`Offset from centroid` settings you can specify
if the centroid is of the |radiobuttonon| :guilabel:`visible polygon` or
|radiobuttonoff| :guilabel:`whole polygon`. That means that either the centroid
is used for the polygon you can see on the map or the centroid is determined for
the whole polygon, no matter if you can see the whole feature on the map.
You can place your label within a specific quadrant, and define offset and rotation.
The |radiobuttonoff| :guilabel:`Around centroid` setting places the label at a
specified distance around the centroid. Again, you can define
|radiobuttonon| :guilabel:`visible polygon`
or |radiobuttonoff| :guilabel:`whole polygon` for the centroid.
With the |radiobuttonoff| :guilabel:`Using perimeter` settings, you can define a
position and a distance for the label. For the position,
|checkbox| :guilabel:`Above line`, |checkbox| :guilabel:`On line`,
|checkbox| :guilabel:`Below line` and |checkbox| :guilabel:`Line orientation
dependent position` are possible. You can specify the distance between the label
and the polygon outline, as well as the repeat interval for the label.

In the :guilabel:`priority` section you can define the priority with which labels
are rendered for all three vector layer types (point, line, polygon). This
placement option interact with labels of the other vector layers in the map
canvas. If there are labels from different layers in the same location, the
label with the higher priority will be displayed and the others will be left out.

Rendering menu
--------------

In the :guilabel:`Rendering` menu, you can define label and feature options.
Under :guilabel:`Label options`, you find the scale-based visibility setting now.
You can prevent QGIS from rendering only selected labels with the
|checkbox| :guilabel:`Show all labels for this layer (including colliding labels)`
checkbox. Under :guilabel:`Feature options`, you can define whether every
part of a multipart feature is to be labelled. It's possible to define
whether the number of features to be labelled is limited and to
|checkbox| :guilabel:`Discourage labels from covering features`.


.. features act as obstacles for labels or not .

.. _figure_labels_1:

.. only:: html

   **Figure Labels 1:**

.. figure:: /static/user_manual/working_with_vector/label_points.png
   :align: center

   Smart labeling of vector point layers

For line layers you can
:guilabel:`Suppress labelling of features smaller than` a set length.

.. if features act as obstacles for labels or not.

.. _figure_labels_2:

.. only:: html

   **Figure Labels 2:**

.. figure:: /static/user_manual/working_with_vector/label_line.png
   :align: center

   Smart labeling of vector line layers

For polygon layers you can also use :guilabel:`Suppress labelling of features smaller than` in
the :guilabel:`Feature options`.


.. if features act as obstacles for labels or not

.. _figure_labels_3:

.. only:: html

   **Figure Labels 3:**

.. figure:: /static/user_manual/working_with_vector/label_area.png
   :align: center

   Smart labelling of vector polygon layers


.. _labeling_with_expressions:


Define labels based on expressions
----------------------------------

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

   Using expressions for labelling

Expression based labelling is easy to work with. All you have to take care of
is, that you need to combine all elements (strings, fields and functions) with a
string concatenation sign '||' and that fields are written in "double quotes"
and strings in 'single quotes'. Let's have a look at some examples:

::

   # label based on two fields 'name' and 'place' with a comma as separator
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

As you can see in the expression builder, you have hundreds of functions available
to create simple and very complex expressions to label your data in QGIS. See
:ref:`vector_expressions` chapter for more information and examples on expressions.

Using data-defined override for labelling
-----------------------------------------

With the data-defined override functions, the settings for the labelling
are overridden by entries in the attribute table.
You can activate and deactivate the function with the right-mouse button.
Hover over the symbol and you see the information about the data-defined override,
including the current definition field.
We now describe an example using the data-defined override function for the
|mActionMoveLabel|:sup:`Move label` function (see figure_labels_5_ ).

#. Import :file:`lakes.shp` from the QGIS sample dataset.
#. Double-click the layer to open the Layer Properties. Click on :guilabel:`Labels`
   and :guilabel:`Placement`. Select |radiobuttonon| :guilabel:`Offset from centroid`.
#. Look for the :guilabel:`Data defined` entries. Click the |mIconDataDefine| icon
   to define the field type for the :guilabel:`Coordinate`. Choose 'xlabel' for X
   and 'ylabel' for Y. The icons are now highlighted in yellow.
#. Zoom into a lake.
#. Go to the Label toolbar and click the |mActionMoveLabel| icon.
   Now you can shift the label manually to another position (see figure_labels_6_).
   The new position of the label is saved in the 'xlabel' and 'ylabel' columns
   of the attribute table.

.. _figure_labels_5:

.. only:: html

   **Figure Labels 5:**

.. figure:: /static/user_manual/working_with_vector/label_data_defined.png
   :align: center

   Labelling of vector polygon layers with data-defined override


.. _figure_labels_6:

.. only:: html

   **Figure Labels 6:**

.. figure:: /static/user_manual/working_with_vector/move_label.png
   :align: center

   Move labels

.. _rule_based_labeling:

Rule-based labeling
-------------------

With Rule-based labeling multiple label configurations can be defined
and applied selectively on the base of expression filters, as in
:ref:`Rule-based rendering <rule_based_rendering>`

Rules can be set selecting the corresponding option at the top of the
Labels panel (see figure_labels_7_ )

.. _figure_labels_7:

.. only:: html

   **Figure Labels 7:**

.. figure:: /static/user_manual/working_with_vector/label_rules_panel.png
   :align: center

   Rule based labeling panel

To create a rule, activate an existing row by double-clicking on it,
or click on ‘+’ and click on the new rule.
Within the panel you can set the filter expression and the related label
configurations.

.. _figure_labels_8:

.. only:: html

   **Figure Labels 8:**

.. figure:: /static/user_manual/working_with_vector/label_rule_settings.png
   :align: center

   Rule settings


.. _vector_attributes_menu:

Fields Menu
===========

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

   Dialog to select an edit widget for an attribute column

Within the :guilabel:`Fields` menu, you also find an **edit widget** column.
This column can be used to define values or a range of values that are allowed
to be added to the specific attribute table column. If you click on the
**[edit widget]** button, a dialog opens, where you can define different
widgets. These widgets are:

* **Checkbox**: Displays a checkbox, and you can define what attribute is
  added to the column when the checkbox is activated or not.
* **Classification**: Displays a combo box with the values used for
  classification, if you have chosen 'unique value' as legend type in
  the :guilabel:`Style` menu of the properties dialog.
* **Color**: Displays a color button allowing user to choose a color from the
  color dialog window.
* **Date/Time**: Displays a line field which can open a calendar widget to enter
  a date, a time or both. Column type must be text. You can select a custom
  format, pop-up a calendar, etc.
* **Enumeration**: Opens a combo box with values that can be used within
  the columns type. This is currently only supported by the PostgreSQL provider.
* **File name**: Simplifies the selection by adding a file chooser dialog.
* **Hidden**: A hidden attribute column is invisible. The user is not able
  to see its contents.
* **Photo**: Field contains a filename for a picture. The width and height of
  the field can be defined.
* **Range**: Allows you to set numeric values from a specific range. The edit
  widget can be either a slider or a spin box.
* **Relation Reference**: This widget lets you embed the feature form of the
  referenced layer on the feature form   of the actual layer.
  See :ref:`vector_relations`.
* **Text edit** (default): This opens a text edit field that allows simple
  text or multiple lines to be used. If you choose multiple lines you
  can also choose html content.
* **Unique values**: You can select one of the values already used in
  the attribute table. If 'Editable' is activated, a line edit is shown with
  autocompletion support, otherwise a combo box is used.
* **UUID Generator**: Generates a read-only UUID (Universally Unique Identifiers)
  field, if empty.
* **Value map**: A combo box with predefined items. The value is stored in
  the attribute, the description is shown in the combo box. You can define
  values manually or load them from a layer or a CSV file.
* **Value Relation**: Offers values from a related table in a combobox. You can
  select layer, key column and value column. Several options are available to
  change the standard behaviours: allow null value, order by value, allow
  multiple selections and use of autocompleter. The forms will display either
  a dropdown list or a line edit field when completer checkbox is enabled.
* **Webview**: Field contains a URL. The width and height of the field is variable.

.. note::

   QGIS has an advanced 'hidden' option to define your own field
   widget using python and add it to this impressive list of widgets.
   It is tricky but it is very well explained in following excellent blog that
   explains how to create a real time validation widget that can be used like
   described widgets.
   See http://blog.vitu.ch/10142013-1847/write-your-own-qgis-form-elements


With the **Attribute editor layout**, you can now define built-in forms
(see figure_fields_2_). This is useful for data entry jobs or to identify
objects using the option auto open form when you have objects with many attributes.
You can create an editor with several tabs and named groups to present
the attribute fields.

Choose 'Drag and drop designer' and an attribute column. Use the |mActionSignPlus|
icon to create a category to insert a tab or a named group (see figure_fields_3_).
When creating a new category, QGIS will insert a new tab or named group for the
category in the built-in form.
The next step will be to assign the relevant fields to a selected category
with the |mActionArrowRight| icon. You can create more categories and use the
same fields again.

Other options in the dialog are 'Autogenerate' and 'Provide ui-file'.

* 'Autogenerate' just creates editors for all fields and tabulates them.

* The 'Provide ui-file' option allows you to use complex dialogs made with the Qt-Designer.
  Using a UI-file allows a great deal of freedom in creating a dialog.
  For detailed information, see
  http://nathanw.net/2011/09/05/qgis-tips-custom-feature-forms-with-python-logic/.

QGIS dialogs can have a Python function that is called when the dialog is opened.
Use this function to add extra logic to your dialogs. The form code can be specified
in three different ways:

* load from the environment (for example in :file:`startup.py` or from a plugin)
* load from an external file, a file chooser will appear in that case to allow
  you to select a Python file from your filesystem
* load from inline code, a Python editor will appear where you can directly
  type your form code

In all cases you must enter the name of the function that will be called
(`open` in the example below).

An example is (in module MyForms.py):

::

  def open(dialog,layer,feature):
      geom = feature.geometry()
      control = dialog.findChild(QWidged,"My line edit")

Reference in Python Init Function like so: `open`


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

   Resulting built-in form with tabs and named groups


.. _`sec_joins`:

Joins Menu
==========

|join| The :guilabel:`Joins` menu allows you to :index:`join` a loaded attribute
table to a loaded vector layer. After clicking |mActionSignPlus|, the
:guilabel:`Add vector join` dialog appears. As key columns, you have to define a
:index:`join layer` you want to connect with the target vector layer.
Then, you have to specify the join field that is common to both the join layer
and the target layer. Now you can also specify a subset of fields from the joined
layer based on the checkbox |checkbox| :guilabel:`Choose which fields are joined`.
As a result of the join, all information from the join layer and the target layer
are displayed in the attribute table of the target layer as joined information.
If you specified a subset of fields only these fields are displayed in the attribute
table of the target layer.

.. FIXME: are table joins also possible with MSSQL and ORACLE tables?

QGIS currently has support for joining non-spatial table formats supported by OGR
(e.g., CSV, DBF and Excel), delimited text and the PostgreSQL provider
(see figure_joins_1_).

.. _figure_joins_1:

.. only:: html

   **Figure Joins 1:**

.. figure:: /static/user_manual/working_with_vector/join_attributes.png
   :align: center

   Join an attribute table to an existing vector layer

Additionally, the add vector join dialog allows you to:

* |checkbox| :guilabel:`Cache join layer in virtual memory`
* |checkbox| :guilabel:`Create attribute index on the join field`
* |checkbox| :guilabel:`Choose which fields are joined`
* Create a |checkbox| :guilabel:`Custom field name prefix`


.. _`sec_diagram`:

Diagrams Menu
=============

|diagram| The :guilabel:`Diagrams` menu allows you to add a graphic overlay to
a vector layer (see figure_diagrams_1_).

The current core implementation of diagrams provides support for:

* **pie charts**, a circular statistical graphic divided into slices to illustrate
  numerical proportion. The arc length of each slice is proportional to the
  quantity it represents,
* **text diagrams**, a horizontaly divided circle showing statistics values inside
* and **histograms**.

For each type of diagram, the menu is divided into five tabs:

Attributes
----------

:guilabel:`Attributes` defines which variables to display in the diagram.
Use |mActionSignPlus| :sup:`add item` button to select the desired fields into
the 'Assigned Attributes' panel. Generated attributes with :ref:`vector_expressions`
can also be used.

You can move up and down any row with click and drag, sorting how atributes
are displayed. You can also change the label in the 'Legend' column
or the attibute color by double-clicking the item.
This label is the default text displayed in the legend of the print composer.

.. _figure_diagrams_1:

.. only:: html

   **Figure Diagrams 1:**

.. figure:: /static/user_manual/working_with_vector/diagram_tab.png
   :align: center

   Vector properties dialog with diagram menu

Appearance
----------

:guilabel:`Appearance` defines how the diagram looks like. It provides
general settings that do not interfere with the statistic values such as:

* the graphic transparency, its outline width and color
* the width of the bar in case of histogram
* the circle background color in case of text diagram, and the font used for texts
* the orientation of the left line of the first slice represented in pie chart.
  Note that slices are displayed clockwise.

In this menu, you can also manage the diagram visibility:

* by removing diagrams that overlap others or :guilabel:`Show all diagrams`
  even if they overlap each other
* by setting the :ref:`scale visibility <label_scaledepend>`


Size
----

:guilabel:`Size` is the main tab to set how the selected statistics are
represented. The diagram size units can be 'Map Units' or 'Millimeters'.
You can use :

* :guilabel:`Fixed size`, an unique size to represent the graphic of all the
  features, except when displaying histogram
* or :guilabel:`Scaled size`, based on an expression using layer attributes.

.. ToDo: better explain the scale behaviour of the different diagram types

.. _figure_diagrams_2:

.. only:: html

   **Figure Diagrams 2:**

.. figure:: /static/user_manual/working_with_vector/diagram_tab_size.png
   :align: center

   Vector properties dialog with diagram menu, Size tab


Position
--------

:guilabel:`Position` helps to define diagram placement.
According to the layer geometry type, it offers different options for the placement:

* 'Over the point' or 'Around  the point' for point geometry.
  The latter variable requires a radius to follow.
* 'Over the line' or 'Around  the line' for line geometry. Like point feature,
  the last variable requires a distance to respect and user can specify the
  diagram placement relative to the feature ('above', 'on' and/or 'below' the line)
  It's possible to select several options at once.
  In that case, QGIS will look for the optimal position of the diagram. Remember that
  here you can also use the line orientation for the position of the diagram.
* 'Over the centroid', 'Around the centroid' (with a distance set),
  'Perimeter' and anywhere 'Inside polygon' are the options for polygon features.

The diagram can also be placed using feature data by filling the ``X``
and ``Y`` fields with an attribute of the feature.

The placement of the diagrams can interact with the labelling, so you can
detect and solve position conflicts between diagrams and labels by setting
the **Priority** slider.

Options
-------

The :guilabel:`Options` tab has settings only in case of histogram. You can
choose whether the bar orientation should be 'Up', 'Down', 'Right' and 'Left'.

.. ToDo: explain the behaviour of this option

.. note::
  Given that almost all the settings above are common to the different types of
  diagram, when designing your diagram, you can switch between them to check
  which one is more appropriate to your data without any loss.

Case Study
----------

We will demonstrate an example and overlay on the Alaska boundary layer a
text diagram showing temperature data from a climate vector layer.
Both vector layers are part of the QGIS sample dataset (see section
:ref:`label_sampledata`).

#. First, click on the |mActionAddOgrLayer| :sup:`Load Vector` icon, browse
   to the QGIS sample dataset folder, and load the two vector shape layers
   :file:`alaska.shp` and :file:`climate.shp`.
#. Double click the ``climate`` layer in the map legend to open the
   :guilabel:`Layer Properties` dialog.
#. Click on the :guilabel:`Diagrams` menu, activate |checkbox| :guilabel:`Show
   diagrams for this layer`, and from the :guilabel:`Diagram type` |selectstring|
   combo box, select 'Text diagram'.
#. In the :guilabel:`Appearance` tab, we choose a light blue as background color,
   and in the :guilabel:`Size` tab, we set a fixed size to 18 mm.
#. In the :guilabel:`Position` tab, placement could be set to 'Around Point'.
#. In the diagram, we want to display the values of the three columns
   ``T_F_JAN``, ``T_F_JUL`` and ``T_F_MEAN``. So, in the :guilabel:`Attributes` tab
   first select ``T_F_JAN`` and click the |mActionSignPlus| button, then repeat with
   ``T_F_JUL`` and finally ``T_F_MEAN``.
#. Now click **[Apply]** to display the diagram in the QGIS main window.
#. You can adapt the chart size in the :guilabel:`Size` tab. Activate the
   |radiobuttonon| :guilabel:`Scaled size` and set the size of the diagrams on
   the basis of the :guilabel:`maximum value` of an attribute and the
   :guilabel:`Size` option.
   If the diagrams appear too small on the screen, you can activate the
   |checkbox| :guilabel:`Increase size of small diagrams` checkbox and define
   the minimum size of the diagrams.
#. Change the attribute colors by double clicking on the color values in the
   :guilabel:`Assigned attributes` field.
   Figure_diagrams_3_ gives an idea of the result.
#. Finally, click **[Ok]**.

.. _figure_diagrams_3:

.. only:: html

   **Figure Diagrams 3:**

.. figure:: /static/user_manual/working_with_vector/climate_diagram.png
   :align: center
   :width: 25em

   Diagram from temperature data overlayed on a map

Remember that in the :guilabel:`Position` tab, a |checkbox| :guilabel:`Data
defined position` of the diagrams is possible. Here, you can use attributes
to define the position of the diagram.
You can also set a scale-dependent visibility in the :guilabel:`Appearance` tab.

The size and the attributes can also be an expression.
Use the |mActionmIconExpressionEditorOpen| button to add an expression.
See :ref:`vector_expressions` chapter for more information and example.


Actions Menu
============

|action| QGIS provides the ability to perform an action based on the attributes
of a feature. This can be used to perform any number of actions, for example,
running a program with arguments built from the attributes of a feature or
passing parameters to a web reporting tool.

.. _figure_actions_1:

.. only:: html

   **Figure Actions 1:**

.. figure:: /static/user_manual/working_with_vector/action_dialog.png
   :align: center

   Overview action dialog with some sample actions

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

Defining Actions
----------------

Attribute actions are defined from the vector :guilabel:`Layer Properties`
dialog. To :index:`define an action`, open the vector :guilabel:`Layer Properties`
dialog and click on the :guilabel:`Actions` menu. Go to the :guilabel:`Action properties`.
Select 'Generic' as type and provide a descriptive name for the action.
The action itself must contain
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
prevent the ``%col10`` field name from being mistaken for the ``%col1`` field
name with a ``0`` on the end. The brackets will be removed by QGIS when it
substitutes in the value of the field. If you want the substituted field to be
surrounded by square brackets, use a second set like this: ``[[%col10]]``.

Using the :guilabel:`Identify Features` tool, you can open the
:guilabel:`Identify Results` dialog. It includes a *(Derived)* item that contains
information relevant to the layer type. The values in this item can be accessed
in a similar way to the other fields by proceeding the derived field name with
``(Derived).``. For example, a point layer has an ``X`` and ``Y`` field, and the
values of these fields can be used in the action with ``%(Derived).X`` and
``%(Derived).Y``. The derived attributes are only available from the
:guilabel:`Identify Results` dialog box, not the :guilabel:`Attribute Table` dialog box.

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

Using Actions
-------------

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
to a text file for the selected record (shown in yellow in the QGIS map area).
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
   layer in the legend, or right-click and choose :menuselection:`Properties`
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

   Select feature and choose action

When we click on the action, it brings up Firefox and navigates to the URL
http://www.google.com/search?q=Tustumena. It is also possible to add further
attribute fields to the action. Therefore, you can add a ``+`` to the end of
the action text, select another field and click on **[Insert Field]**. In
this example, there is just no other field available that would make sense
to search for.

You can define multiple actions for a layer, and each will show up in the
:guilabel:`Identify Results` dialog.


You can also invoke actions from the attribute table
by selecting a row and right-clicking, then choosing the action from the
pop-up menu.

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

  command = "firefox"
  imagerelpath = "images_test/test_image.jpg"
  layer = qgis.utils.iface.activeLayer()
  import os.path
  layerpath = layer.source() if layer.providerType() == 'ogr'
    else (qgis.core.QgsDataSourceURI(layer.source()).database()
      if layer.providerType() == 'spatialite' else None)
  path = os.path.dirname(str(layerpath))
  image = os.path.join(path,imagerelpath)
  import subprocess
  subprocess.Popen( [command, image ] )

We just have to remember that the action is one of type *Python* and
the *command* and *imagerelpath* variables must be changed to fit our needs.

But what about if the relative path needs to be relative to the (saved)
project file? The code of the Python action would be:

::

  command="firefox"
  imagerelpath="images/test_image.jpg"
  projectpath=qgis.core.QgsProject.instance().fileName()
  import os.path
  path=os.path.dirname(str(projectpath)) if projectpath != '' else None
  image=os.path.join(path, imagerelpath)
  import subprocess
  subprocess.Popen( [command, image ] )

Another Python action example is the one that allows us to add new layers
to the project. For instance, the following examples will add to the project
respectively a vector and a raster. The names of the files to be added to the
project and the names to be given to the layers are data driven (*filename* and
*layername* are column names of the table of attributes of the vector where
the action was created):

::


  qgis.utils.iface.addVectorLayer('/yourpath/[% "filename" %].shp',
    '[% "layername" %]', 'ogr')


To add a raster (a TIF image in this example), it becomes:

::


  qgis.utils.iface.addRasterLayer('/yourpath/[% "filename" %].tif',
    '[% "layername" %]')


Display Menu
============

|mActionMapTips| This menu is specifically created for Map Tips.
It includes a nice feature: Map Tip display text in HTML.
While you can still choose a |radiobuttonoff| :guilabel:`Field` to be displayed
when hovering over a feature on the map, it is also possible to insert HTML code
that creates a complex display when hovering over a feature.
To activate Map Tips, select the menu option :menuselection:`View --> Map Tips`.

Figure Display 1 and 2 show an example of HTML code and how it behaves in map canvas.

.. _figure_display_1:

.. only:: html

   **Figure Display 1:**

.. figure:: /static/user_manual/working_with_vector/display_html.png
   :align: center

   HTML code for map tip


.. _figure_display_2:

.. only:: html

   **Figure Display 2:**

.. figure:: /static/user_manual/working_with_vector/map_tip.png
   :align: center

   Map tip made with HTML code



Rendering Menu
==============

QGIS offers support for on-the-fly feature generalisation. This can
improve rendering times when drawing many complex features at small scales.
This feature can be enabled or disabled in the layer settings using the
|checkbox| :guilabel:`Simplify geometry` option. There is also a global
setting that enables generalisation by default for newly added layers (see
section :ref:`gui_options`).

.. _figure_rendering_10:

.. only:: html

   **Figure Rendering 1:**

.. figure:: /static/user_manual/working_with_vector/simplify_rendering.png
   :align: center

   Layer Geometry Simplification dialog


.. note::
  Feature generalisation may introduce artefacts into your rendered
  output in some cases. These may include slivers between polygons and
  inaccurate rendering when using offset-based symbol layers.


While rendering extremely detailed layers (e.g. polygon layers with a huge number
of nodes), this can cause composer exports in PDF/SVG format to be huge as all
nodes are included in the exported file. This can also make the resultant file
very slow to work with/open in other programs.

Checking |checkbox| :guilabel:`Force layer to render as raster` forces these
layers to be rasterised so that the exported files won't have to include all
the nodes contained in these layers and the rendering is therefore sped up.

You can also do this by forcing the composer to export as a raster,
but that is an all-or-nothing solution, given that the rasterisation
is applied to all layers.



.. _vectormetadatamenu:

Metadata Menu
=============

|metadata| The :guilabel:`Metadata` menu consists of :guilabel:`Description`,
:guilabel:`Attribution`, :guilabel:`MetadataURL` and :guilabel:`Properties` sections.

In the :guilabel:`Properties` section, you get general information about the layer,
including specifics about the type and location, number of features, feature type,
and editing capabilities. The :guilabel:`Extents`
table provides you with layer extent information and the
:guilabel:`Layer Spatial Reference System`, which is information about the CRS
of the layer. This is a quick way to get information about the layer.

Additionally, you can add or edit a title and abstract for the layer in the
:guilabel:`Description` section. It's also possible to define a
:guilabel:`Keyword list` here. These keyword lists can be used in a
metadata catalogue. If you want to use a title from an XML metadata file,
you have to fill in a link in the :guilabel:`DataUrl` field.
Use :guilabel:`Attribution` to get attribute data from an XML metadata catalogue.
In :guilabel:`MetadataUrl`, you can define the general path to the XML metadata
catalogue. This information will be saved in the QGIS project file for subsequent
sessions and will be used for QGIS server.

.. _figure_metadata_vect:

.. only:: html

   **Figure Metadata 1:**

.. figure:: /static/user_manual/working_with_vector/vector_metadata_tab.png
   :align: center

   Metadata menu in vector layers properties dialog


.. _variable-layer:

.. Variables Menu
   To write this chapter, informations are available at
   http://nyalldawson.net/2015/12/exploring-variables-in-qgis-pt-3-layer-level-variables/
   http://nyalldawson.net/2015/12/exploring-variables-in-qgis-pt-2-project-management/
   http://nyalldawson.net/2015/12/exploring-variables-in-qgis-2-12-part-1/

