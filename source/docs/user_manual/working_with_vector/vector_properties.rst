|updatedisclaimer|

.. comment out this Section (by putting '|updatedisclaimer|' on top) if file is not uptodate with release

.. _vector_properties_dialog:

The Vector Properties Dialog
============================

The :guilabel:`Layer Properties` dialog for a vector layer provides information
about the layer, symbology settings and labeling options. If your vector layer
has been loaded from a PostgreSQL/PostGIS datastore, you can also alter the
underlying SQL for the layer by invoking the :guilabel:`Query Builder` dialog on
the :guilabel:`General` tab. To access the :guilabel:`Layer Properties` dialog,
double-click on a layer in the legend or right-click on the layer and select
:menuselection:`Properties` from the popup menu.


.. do not change the order of reference-tag and only-tag, this figure has
   an external reference.

.. only:: html

   **Figure Vector Properties 1:**

.. _figure_vector_properties_1:

.. figure:: /static/user_manual/working_with_vector/vectorLayerSymbology.png
   :width: 25em
   :align: center

   Vector Layer Properties Dialog |nix|

.. _vector_style_tab:

Style Tab
---------

.. index:: New_Symbology, Symbology_New

|symbology| Since |qg| 1.4.0 a new symbology was integrated in parallel to improve and
finally replace the old symbology. Since |qg| 2.0.0 the old symbology is no longer available.
In this version the new symbology has been redesigned and revised. 

There are three types of symbols: marker symbols (for points), line symbols
(for lines) and fill and outline symbols (for polygons). Symbols can consist
of one or more symbol layers. It is possible to define the color of a symbol
and this color is then defined for all symbol layers. Some layers may have
the color locked - for those the color can not be altered. This is useful
when you define the color of a multilayer symbol. Similarly, it is possible
to define the width for line symbols, as well as size and rotation for
marker symbols.

.. index:: Font_Marker, Simple_Marker, SVG_Marker
.. index:: Line_decoration, Marker_line, Simple_line
.. index:: Centroid_fill, SVG_fill, Simple_fill

.. _vector_symbol_types:

**Available symbol layer types**


* Point layers

  - **Font marker**: Rendering with a font.
  - **Simple marker**: Rendering with a hardcoded marker.
  - **SVG marker**: Rendering with a SVG picture.
  - **Ellipse marker**: Rendering with ellipse shapes derived from attributes.
  - **Vector field marker**: Rendering with vector fields derived from attributes.

* Line layers

  - **Line decoration**: Add a line decoration, e.g an arrow to indicate
    line direction.
  - **Marker line**: A line rendered by repeating a marker symbol.
  - **Simple line**: Usual rendering of a line (with specified width
    color and pen style).

* Polygon layers

  - **Centroid fill**: Fill a polygon centroid with a hardcoded marker.
  - **SVG fill**: Fill a polygon with a SVG symbol.
  - **Simple fill**: Usual rendering of a polygon (with defined fill color,
    fill pattern and outline).
  - **Line pattern fill**: Fill a polygon with a line pattern.
  - **Point pattern fill**: Fill a polygon with a point pattern.
  - **Outline: Line decoration**: Add a line decoration, e.g an arrow to
    indicate line direction.
  - **Outline: Marker line**: Use a hardcoded marker as area outline.
  - **Outline: Simple line**: Define width, color and pen style as area outline.

.. index:: Color_ramps


**Color ramps**

Color ramps are used to define a range of colors that can be used during
the creation of renderers. The symbol's color will be set from the color ramp.

There are three types of color ramps:

* **Gradient**: Linear gradient from one color to some other.
* **Random**: Randomly generated colors from a specified area of color space.
* **ColorBrewer**: Create color area from a color shema and a defined number
  of color classes.

Color ramps can be defined in the :guilabel:`Color ramp` tab of the
:guilabel:`Style Manager` by clicking the **[Add]** button and then choosing
a color ramp type (see section vector_style_manager_ ).

**Styles**

A style groups a set of various symbols and color ramps. You can define
your prefered or frequently used symbols, and can use it without having
to recreate it everytime. Style items (symbols and color ramps) have always
a name by which they can be queried from the style. There is at least one
default style in |qg| (modifiable) and the user can add further styles.
In the lower part of the Style tab there are four buttons for managing styles:
Use **[Restore Default Style]** to get back to your default settings, **[Save As Default]**
to save your style as default, **[Load Style...]** to get to your own styles and
**[Save Style]** to save your own styles. Layer styles can also be transferred
from one layer to another layer. Activate a layer and choose :menuselection:`Layer -->`
|mActionEditCopy| :guilabel:`Copy style` and switch to another layer. Then choose
:menuselection:`Layer -->` |mActionEditPaste| :guilabel:`Paste style`.

.. index:: Renderers

**Renderers**

The renderer is responsible for drawing a feature together with the correct
symbol. There are four types of renderers: single symbol, categorized
(called unique color in the old symbology), graduated and rule-based. There
is no continuous color renderer, because it is in fact only a special case
of the graduated renderer. The categorized and graduated renderer can be created
by specifying a symbol and a color ramp - they will set the colors for symbols
appropriately.

.. _vector_new_symbology:

**Working with the New Generation Symbology**


In the :guilabel:`Style` tab you can choose one of the five renderers: single
symbol, categorized, graduated, rule-based and point displacement. For each
data type (points, lines and polygons) vector symbol layer types are available
(see vector_symbol_types_). Depending on the chosen renderer, the symbology
Depending on the chosen renderer, the :guilabel:`Style` tab provides different
following sections. The new generation symbology dialog also provides a
**[Style Manager]** button which gives access to the Style Manager (see Section
:ref:`vector_style_manager`). The Style Manager allows you to edit and remove
existing symbols and add new ones.


.. _tip_change_multiple_symbols:

.. tip:: **Select and change multiple symbols**

   The New Generation Symbology allows to select multiple symbols and right
   click to change color, transparency, size, or width of selected
   entries.

.. index:: Single_Symbol_Renderer, Renderer_Single_Symbol

**Single Symbol Renderer**

The Single Symbol Renderer is used to render all features of the layer using
a single user-defined symbol. The properties, that can be adjusted in the
``Style`` tab, depend partially on the type of the layer, but all types share
the following structure. In the top left part of the tab, there is a preview
of the current symbol to be rendered. In the bottom part of the tab, there is
a list of symbols already defined for the current style, prepared to be used
via selecting them from the list. The current symbol can be modified using
the **[Change]** button below the preview, which opens a :guilabel:`Symbol
Properties` dialog, or the **[Change]** button right of the preview, which
opens an ordinary :guilabel:`Color` dialog.

.. _figure_symbology_1:

.. only:: html

   **Figure Symbology 1:**

.. figure:: /static/user_manual/working_with_vector/singlesymbol_ng_line.png
   :align: center
   :width: 20em

   Single symbol line properties |nix|

In the :guilabel:`Style` tab you can apart from a general layer transparency
also define to use millimeter or map units for the size scale. In the **[Advanced]** button
next to the **[Save as style]** button you can use data-defined size scale and rotation.
Here the :menuselection:`Symbol levels -->` menu allows to enable and define the order
in which the symbol layers are rendered (if the symbol
consists of more than one layer).

After having done any needed changes, the symbol can be added to the list of
current style symbols (using the **[Save as style]** button) and then easily
be used in the future. Furthermore you can use the **[Save Style]** button to
save the symbol as a QGIS layer style file (.qml) or SLD file(.sld). Currently
in version 1.8 SLDs can be exported from any type of renderer: single symbol,
categorized, graduated or rule-based, but when importing an SLD, either a
single symbol or rule-based renderer is created.
That means that categorized or graduated styles are converted to rule-based.
If you want to preserve those renderers, you have to stick to the QML format.
On the other hand, it could be very handy sometimes to have this easy way of
converting styles to rule-based.

.. index:: Categorized_Renderer, Renderer_Categorized

**Categorized Renderer**


The Categorized Renderer is used to render all features from a layer, using
a single user-defined symbol, which color reflects the value of a selected
feature's attribute. The :guilabel:`Style` tab allows you to select:


* The attribute (using the Column listbox)
* The symbol (using the Symbol dialog)
* The colors (using the Color Ramp listbox)


The **[Advanced]** button in the lower right corner of the dialog allows to
set the fields containing rotation and size scale information.
For convenience, the list in the bottom part of the tab lists the values of
all currently selected attributes together, including the symbols that will
be rendered.

The example in figure_symbology_2_ shows the category rendering dialog used
for the rivers layer of the |qg| sample dataset.

.. _figure_symbology_2:

.. only:: html

   **Figure Symbology 2:**

.. figure:: /static/user_manual/working_with_vector/categorysymbol_ng_line.png
   :width: 25em
   :align: center

   Categorized Symbolizing options |nix|

.. index:: Color_Ramp, Gradient_Color_Ramp, ColorBrewer, Custom_Color_Ramp

You can create a custom color ramp choosing :menuselection:`New color ramp...`
from the Color ramp dropdown menu. A dialog will prompt for the ramp type:
Gradient, Random, ColorBrewer, then each one has options for number of steps
and/or multiple stops in the color ramp. See figure_symbology_3_ for an
example of custom color ramp.

.. _figure_symbology_3:

.. only:: html

   **Figure Symbology 3:**

.. figure:: /static/user_manual/working_with_vector/customColorRampGradient.png
   :align: center
   :width: 12em

   Example of custom gradient color ramp with multiple stops |nix|

.. index:: Graduated_Renderer, Renderer_Graduated
.. index:: Natural_Breaks_(Jenks), Pretty_Breaks, Equal_Interval, Quantile

**Graduated Renderer**

The Graduated Renderer is used to render all the features from a layer, using
a single user-defined symbol, whose color reflects the classification of a
selected feature's attribute to a class.


.. _figure_symbology_4:

.. only:: html

   **Figure Symbology 4:**

.. figure:: /static/user_manual/working_with_vector/graduatesymbol_ng_line.png
   :width: 25em
   :align: center

   Graduated Symbolizing options |nix|

Like Categorized Renderer, it allows
to define rotation and size scale from specified columns.

Analogue to the categorized rendered, the :guilabel:`Style` tab allows you to
select:


* The attribute (using the Column listbox)
* The symbol (using the Symbol Properties button)
* The colors (using the Color Ramp list)

Additionally, you can specify the number of classes and also the mode how to
classify features inside the classes (using the Mode list). The available
modes are:

* Equal Interval
* Quantile
* Natural Breaks (Jenks)
* Standard Deviation
* Pretty Breaks


The listbox in the bottom part of the :guilabel:`Style` tab lists the classes
together with their ranges, labels and symbols that will be rendered.

The example in figure_symbology_4_ shows the graduated rendering dialog for
the rivers layer of the |qg| sample dataset.

.. Index:: Rule-based_Rendering, Rendering_Rule-based

**Rule-based rendering**


The rule-based renderer is used to render all the features from a layer, using
rule based symbols, whose color reflects the classification of a selected
feature's attribute to a class. The rules are based on SQL statements. The dialog
allows rule grouping by filter or scale and you can decide if you want to enable
symbol levels or use only first matched rule.

The example in figure_symbology_5_ shows the rule-based rendering dialog
for the rivers layer of the |qg| sample dataset.

To create a rule, activate an existing row by clicking on it or click on '+' and
click on the new rule. Then press the **[Edit]** button. In the :guilabel:`Rule
properties` dialog you can define a label for the rule. Press the |browsebutton|
button to open the Expression builder. In the **Function List**, click on
:guilabel:`Fields and Values` to view all attributes of the attribute table to
be searched. To add an attribute to the Field calculator **Expression** field,
double click its name in the :guilabel:`Fields and Values` list. Generally you
can use the various fields, values and functions to construct the calculation
expression or you can just type it into the box (see :ref:`vector_field_calculator`).


.. _figure_symbology_5:

.. only:: html

   **Figure Symbology 5:**

.. figure:: /static/user_manual/working_with_vector/rulesymbol_ng_line.png
   :width: 25em
   :align: center

   Rule-based Symbolizing options |nix|

.. index:: Point_Displacement_Renderer, Renderer_Point_Displacement
.. index:: Displacement_plugin

**Point displacement**

The point displacement renderer offers to visualize all features of a point layer,
even if they have the same location. To do this, the symbols of the points are
placed on a displacement circle around a center symbol.

.. _figure_symbology_6:

.. only:: html

   **Figure Symbology 6:**

.. figure:: /static/user_manual/working_with_vector/poi_displacement.png
   :width: 25em
   :align: center

   Point displacement dialog |nix|

.. index:: Symbol_Properties

**Symbol Properties**

The symbol properties dialog allows the user to specify different properties
of the symbol to be rendered. In the bottom left part of the dialog, you find
a preview of the current symbol as it will be displayed in the map canvas.
Above the preview is the list of symbol layers. To start the :guilabel:`Symbol
properties` dialog, click the **[** |mActionOptions| **Change...]** button in
the :guilabel:`Style` tab of the :guilabel:`Layer Properties` dialog.

The buttons allow adding or removing layers, changing the position of layers, or
locking layers for color changes. In the right part of the dialog, there are
shown the settings applicable to the single symbol layer selected in the symbol
layer list. The most important is the :guilabel:`Symbol Layer Type` |selectstring|
combobox, which allows you to choose the layer type. The available options depend
on the layer type (Point, Line, Polygon). The symbol layer type options are
described in section vector_symbol_types_. You can also change the symbol
layer properties in the right part of the dialog. For example if you have chosen
an SVG marker for a point layer it is now possible to change its color using
:guilabel:`Color` button.

.. _figure_symbology_7:

.. only:: html

   **Figure Symbology 7:**

.. figure:: /static/user_manual/working_with_vector/symbolproperties1.png
   :align: center
   :width: 25em

   Line composed from three simple lines |nix|

.. _vector_style_manager:

Style Manager
-------------

The Style Manager is a small helper application, that lists symbols and color
ramps available in a style. It also allows you to add and/or remove items.
To launch the Style Manager, click on :menuselection:`Settings -->
Style Manager` in the main menu. Alternatively, you can access it via the
:guilabel:`Style` tab.

.. _figure_symbology_10:

.. only:: html

   **Figure Symbology 10:**

.. figure:: /static/user_manual/working_with_vector/stylemanager.png
   :width: 25em
   :align: center

   Style Manager to manage symbols and color ramps |nix|


.. index:: Old_Symbology, Symbology_Old

.. _vector_old_symbology:

Old Symbology
-------------

.. note::
   |qg| 1.8. still supports the usage of the old symbology, although it is
   recommended to switch to the new symbology, described in section vector_new_symbology_,
   because the old symbology will be removed in one of the next releases.

If you want or need to switch back to the old symbology you can click on
the **[Old symbology]** button in the :guilabel:`Style` tab of the
:guilabel:`Layer Properties` dialog.

You can also make the old symobolgy the default, deactivating |checkbox|
:guilabel:`Use new generation symbology for rendering` in the
:guilabel:`Rendering` tab under :menuselection:`Settings -->` |mActionOptions|
:menuselection:`Options`.

.. index:: Old_Symbology_Renderers, Renderers_Old_Symbology

The old |qg| symbology supports the following renderers:


* **Single symbol** - a single style is applied to every object in the layer.
* **Graduated symbol** - objects within the layer are displayed with different
  symbols classified by the values of a particular field.
* **Continuous color** - objects within the layer are displayed with a spread of
  colours classified by the numerical values within a specified field.
* **Unique value** - objects are classified by the unique values within a
  specified field with each value having a different symbol.


To :index:`change the symbology` for a layer, simply double click on its legend
entry and the vector :guilabel:`Layer Properties` dialog will be shown.


.. index:: Fill_Style, Fill_Color, Outline_Options

**Style Options**

Within this dialog you can style your vector layer. Depending on the
selected rendering option you have the possibility to also classify your
map features.

At least the following styling options apply for nearly all renderers:

* **Fill style** - Style for filling. Beside the given brushes you can select
  :guilabel:`Fill style:` |selectstring| 'Texture' and click the |browsebutton|
  button for selecting your own texture file. Currently the fileformats
  :file:`*.jpeg`, :file:`*.xpm`, and :file:`*.png` are supported.
* **Fill color** - fill-color of your features.
* **Outline options**

  * Outline style - Pen-style for your outline of your feature.
    You can also set this to 'no Pen'.
  * Outline color - color of the ouline of your feature.
  * Outline width - width of your features.

Once you have styled your layer you also could save your layer-style to a
separate file (ending with :file:`*.qml`).
To do this, use the button **[Save Style...]**. No need to say that
**[Load Style...]** loads your saved layer-style-file.

If you wish to always use a particular style whenever the layer is loaded,
use the **[Save As Default]** button to make your style the default. Also,
if you make changes to the style that you are not happy with, use the
**[Restore Default Style]** button to revert to your default style.

.. index:: Vector_Transparency, Transparency_Vector


**Vector transparency**

|qg| allows to set a transparency for every vector layer. This can be done
with the slider :guilabel:`Transparency` |slider| inside the
:guilabel:`Style` tab. This is very useful for overlaying several vector
layers.

.. Index:: Style_Manager, Manage_Symbols, Manage_Color_Ramps

.. index:: Labeling_Engine, Labeling_New, Labeling_Old

.. _vector_labels_tab:

Labels Tab
----------

|labels| As for the symbology |qg| 1.8 currently provides an old and a new labeling
engine in parallel. The :guilabel:`Labels` tab still contains the old labeling.
The new labeling is implemented as a core application and will replace the features
of the old labels tab in one of the next versions.

We recommend to switch to the new labeling, described in section
:ref:`vector_new_labeling`.

The old labeling in the :guilabel:`Labels` tab allows you to enable labeling
features and control a number of options related to fonts, placement, style,
alignment and buffering. We will illustrate this by labeling the lakes
shapefile of the QGIS sample dataset:


#. Load the Shapefile :file:`alaska.shp` and GML file :file:`lakes.gml`
   in |qg|
#. Zoom in a bit to your favorite area with some lake
#. Make the ``lakes`` layer active
#. Open the :guilabel:`Layer Properties` dialog
#. Click on the :guilabel:`Labels` tab
#. Check the |checkbox| :guilabel:`Display labels` checkbox to enable labeling
#. Choose the field to label with. We will use
   :guilabel:`Field containing label` |selectstring| ``NAMES``
#. Enter a default for lakes that have no name. The default label will be
   used each time |qg| encounters a lake with no value in the ``NAMES`` field.
#. If you have labels extending over several lines, check
   |checkbox|:guilabel:`Multiline labels?`. |qg| will check for a true line
   return in your label field and insert the line breaks accordingly.
   A true line return is a **single** character ``\n``, (not two separate
   characters, like a backlash ``\`` followed by the character ``n``).  To insert
   line returns in an attribute field configure the edit widget to be text
   edit (not line edit).
#. Click **[Apply]**.

Now we have labels. How do they look? They are probably too big and poorly
placed in relation to the marker symbol for the lakes.

Select the ``Font`` entry and use the **[Font]** and **[Color]** buttons to
set the font and color. You can also change the angle and the placement of
the text-label.

To change the position of the text relative to the feature:

#. Beneath the Basic label options change the placement by selecting one of the
   radio buttons in the :guilabel:`Placement` group. To fix our labels, choose
   the |radiobuttonon| :guilabel:`Right` radio button.
#. the ``Font size units`` allows you to select between |radiobuttonon|
   :guilabel:`Points` or |radiobuttonoff| :guilabel:`Map units`.
#. Click **[Apply]** to see your changes without closing the dialog.

Things are looking better, but the labels are still too close to the marker.
To fix this we can use the options on the ``Offset`` entry which is on the bottom
of the menu. Here we can add offsets for the X and Y directions. Adding an X
offset of 5 will move our labels off the marker and make them more readable. Of
course if your marker symbol or font is larger, more of an offset will be required.

The last adjustment we'll make is to ``Buffer`` the labels. This just means
putting a backdrop around them to make them stand out better. To buffer the
lakes labels:

#. Click the |checkbox| :guilabel:`Buffer Labels` checkbox to enable
   buffering.
#. Choose a size for the buffer using the spin box.
#. Choose a color by clicking on **[Color]** and choosing your favorite
   from the color selector. You can also set some transparency for the
   buffer if you prefer.
#. Click **[Apply]** to see if you like the changes.

If you aren't happy with the results, tweak the settings and then test again by
clicking **[Apply]**.

A buffer of 1 points seems to give a good result. Notice you can also specify
the buffer size in map units if that works out better for you.

The advanced entries inside the :guilabel:`Label` tab allow you control
the appearance of the labels using attributes stored in the layer. The
entries beginning with ``Data defined`` allow you to set all the parameters
for the labels using fields in the layer.

Note that the :guilabel:`Label` tab provides a ``preview-box`` where your
selected label is shown.

.. index:: New_Labeling, Smart_Labeling

.. _vector_new_labeling:

New Labeling
------------

The new |mActionLabeling| :sup:`Labeling` core application provides smart
labeling for vector point, line and polygon layers and only requires a
few parameters. This new application will replace the current QGIS labeling,
described in section :ref:`vector_labels_tab` and also supports on-the-fly
transformated layers.

**Using new labeling**

#. Start QGIS and load a vector point, line or polygon layer.
#. Activate the layer in the legend and click on the |mActionLabeling|
   :sup:`Labeling` icon in the QGIS toolbar menu.

**Labeling point layers**

First step is to activate the |checkbox| :guilabel:`Label this layer` checkbox
and select an attribute column to use for labeling. Click |browsebutton| if you
want to define labels based on expressions. After that you can define the text
style and the scale-based visibility in the :guilabel:`Label settings` tab (see
Figure_labels_1_ ). Choose the :guilabel:`Advanced` tab for the label placement
and the labeling priority. You can define if every part of a multipart feature
is to be labeled here. With the wrap label on character function you can define
a character for a line break in the labels. The :guilabel:`Data defined settings`
tab provides you with the attribute-based definition of Font properties, Buffer
properties and Position.


.. features act as obstacles for labels or not .

.. _figure_labels_1:

.. only:: html

   **Figure Labels 1:**

.. figure:: /static/user_manual/working_with_vector/label_points.png
   :width: 30em
   :align: center

   Smart labeling of vector point layers |nix|

**Labeling line layers**

First step is to activate the |checkbox| :guilabel:`Label this layer` checkbox
in the :guilabel:`Label settings` tab and select an attribute column to use for
labeling. Here you can also define labels based on expressions. After that you
can define the text style and the scale-based visibility. Further labeling options
are available through the :guilabel:`Advanced` tab. You can define the label
placement and label distance, a line orientation dependend position and the
labeling priority here. Furthermore you can define if every part of a multipart
line is to be labeled, if lines shall be merged to avoid duplicate labels and if
a direction symbol is added (see Figure_labels_2_ ). It is also possible to
supress labeling of features and wrap lables on characters. Use :guilabel:`Data
defined settings` for attribute-based or database-connection-based settings.

.. if features act as obstacles for labels or not.

.. _figure_labels_2:

.. only:: html

   **Figure Labels 2:**

.. figure:: /static/user_manual/working_with_vector/label_line.png
   :width: 30em
   :align: center

   Smart labeling of vector line layers |nix|


**Labeling polygon layers**

First step is to activate the |checkbox| :guilabel:`Label this layer` checkbox
and select an attribute column to use for labeling. Here you can also define
labels based on expressions. In :guilabel:`Label settings` define the text style
and the scale-based visibility (see Figure_labels_3_ ). Use the :guilabel:`Advanced`
tab for label placement, label distance and labeling priority. Define if every
part of a multipart feature is to be labeled, suppress labeling of features and
wrap labels on characters here. Use :guilabel:`Data defined settings` for
attribute-based or database-connection-based settings.

.. if features act as obstacles for labels or not

.. _figure_labels_3:

.. only:: html

   **Figure Labels 3:**

.. figure:: /static/user_manual/working_with_vector/label_area.png
   :width: 30em
   :align: center

   Smart labeling of vector polygon layers |nix|

.. index:: Label_Engine_Settings, Colliding_Labels
.. index:: Popmusic_Tabu, Popmusic_Chain, Chain, Popmusic_Tabu_Chain, FALP

**Change engine settings**

Additionally you can click the **[Engine settings]** button and select
the search method, used to find the best label placement. Available is
Chain, Popmusic Tabu, Popmusic Chain, Popmusic Tabu Chain and FALP.

.. _figure_labels_4:

.. only:: html

   **Figure Labels 4:**

.. figure:: /static/user_manual/working_with_vector/label_engine.png
   :width: 15em
   :align: center

   Dialog to change label engine settings |nix|

Furthermore the number of candidates can be defined for point, line and
polygon features, and you can define whether to show all labels (including
colliding labels) and label candidates for debugging.

**Keywords to use in attribute columns for labeling**

There is a list of supported key words, that can be used for the placement
of labels in defined attribute columns.


* **For horizontal alignment**: ``left``, ``center``, ``right``
* **For vertical alignment**: ``bottom``, ``base``, ``half``, ``top``
* **Colors can be specified in svg notation**, e.g. \#ff0000
* **for bold, underlined, strikeout and italic**: 0 = false 1 = true

A combination of key words in one column also works, e.g.: ``base right`` or
``bottom left``.

.. _vector_attributes_tab:

Fields Tab
----------

|attributes| Within the :guilabel:`Fields` tab the field attributes of the
selected dataset can be manipulated. The buttons |mActionNewAttribute|
:sup:`New Column` and |mActionDeleteAttribute| :sup:`Delete Column`
can be used, when the dataset is |mActionToggleEditing| :sup:`Editing mode`.

At the moment only columns from PostGIS layers can be removed and added. The
OGR library supports to add and remove columns, if you have a GDAL version >= 1.9
installed.

**Edit Widget**

.. following is included to give some space between title and figure!

\

\

.. _figure_fields_1:

.. only:: html

   **Figure Fields 1:**

.. figure:: /static/user_manual/working_with_vector/editwidgetsdialog.png
   :width: 25 em
   :align: center

   Dialog to select an edit widget for an attribute column |nix|

Within the :guilabel:`Fields` tab you also find an ``edit widget`` column.
This column can be used to define values or a range of values that are allowed
to be added to the specific attribute table column. If you click on the
**[edit widget]** button, a dialog opens, where you can define different
widgets. These widgets are:

* **Line edit**: an edit field which allows to enter simple text
  (or restrict to numbers for numeric attributes).
* **Classification**: Displays a combo box with the values used for
  classification, if you have chosen 'unique value' as legend type in
  the :guilabel:`Style` tab of the properties dialog.
* **Range**: Allows to set numeric values from a specific range. The edit
  widget can be either a slider or a spin box.
* **Unique values**: The user can select one of the values already used in
  the attribute table. If editable is activated, a line edit is shown with
  autocompletion support, otherwise a combo box is used.
* **File name**: Simplifies the selection by adding a file chooser dialog.
* **Value map**: a combo box with predefined items. The value is stored in
  the attribute, the description is shown in the combo box. You can define
  values manually or load them from a layer or a CSV file.
* **Enumeration**: Opens a combo box with values that can be used within
  the columns type. This is currently only supported by the postgres provider.
* **Immutable**: The immutable attribute column is read-only. The user is not
  able to modify the content.
* **Hidden**: A hidden attribute column is invisible. The user is not able
  to see its content.
* **Checkbox**: Displays a checkbox and you can define what attribute is
  added to the column when the checkbox is activated or not.
* **Text edit**: This opens a text edit field that allows multiple lines to
  be used.
* **Calendar**: Opens a calendar widget to enter a date. Column type must be
  text.
* **Value Relation**: Offers values from a related table in a combobox. You can
  select layer, key column and value column.
* **UUID Generator**: Generates a read-only UUID (Universally Unique Identifiers)
  field, if empty.

.. _vectorgeneraltab:

General Tab
-----------

|general| The :guilabel:`General` tab is essentially like that of the raster dialog.
There are several options available:

* Change the display name of the layer
* Set a display field to be used for the :guilabel:`Identify Results` dialog
* Define a certain Edit User Interface for the vector layer written with the Qt
  Creator IDE and tools at http://qt.digia.com/Product/Developer-Tools/
* Create a :guilabel:`Spatial Index` (only for OGR supported formats)
* Add an :guilabel:`Init function` for the layer. They will overwrite existing
  QGIS widget initializations, if applied
* :guilabel:`Update Extents` information for a layer
* View or change the projection of the specific vector layer, clicking on
  :guilabel:`Specify CRS`

Furthermore you can activate and set |checkbox| :guilabel:`Use scale
dependent rendering`, define provider specific options (e.g. encoding) and with the
**[Query Builder]** button you can create a subset of the features in the layer
that will be visualized (also refer to section :ref:`sec_selection_query`).

.. _figure_general_vect:

.. only:: html

   **Figure General 1:**

.. figure:: /static/user_manual/working_with_vector/vector_general_tab.png
   :width: 25 em
   :align: center

   General tab in vector layers properties dialog |nix|

.. _vectormetadatatab:

Metadata Tab
------------

|metadata| The :guilabel:`Metadata` tab contains general information about the layer,
including specifics about the type and location, number of features, feature
type, and the editing capabilities. The :guilabel:`Extents` section, providing
layer extent information, and the :guilabel:`Layer Spatial Reference System`
section, providing information about the CRS of the layer. This is a quick way
to get information about the layer.

Additionally you can add/edit a title for the layer and some abtract information.
These information will be saved in the QGIS project file for following sessions
and will be used for QGIS server.

.. _figure_metadata_vect:

.. only:: html

   **Figure Metadata 1:**

.. figure:: /static/user_manual/working_with_vector/vector_metadata_tab.png
   :width: 25 em
   :align: center

   Metadata tab in vector layers properties dialog |nix|

Actions Tab
-----------

|action| |qg| provides the ability to perform an action based on the attributes
of a feature. This can be used to perform any number of actions, for example,
running a program with arguments built from the attributes of a feature or
passing parameters to a web reporting tool.

.. _figure_actions_1:

.. only:: html

   **Figure Actions 1:**

.. figure:: /static/user_manual/working_with_vector/action_dialog.png
   :width: 25 em
   :align: center

   Overview action dialog with some sample actions |nix|

Actions are useful when you frequently want to run an external application or
view a web page based on one or more values in your vector layer. They are
devided into 6 types and can be used like this:

* Generic, Mac, Windows and Unix actions start an external process,
* Python actions execute a python expression,
* Generic and Python actions are visible everywhere,
* Mac, Windows and Unix actions are visible only on the respective platform (i.e.
  you can define three 'Edit' actions to open an editor and the users can only
  see and execute the one 'Edit' action for their platform to run the editor).

There are several examples included in the dialog. You can load them clicking
on **[Add default actions]**. An example is performing a search based on an
attribute value. This concept is used in the following discussion.

.. index:: Actions, Attribute_Actions

**Defining Actions**

Attribute actions are defined from the vector :guilabel:`Layer Properties`
dialog. To :index:`define an action`, open the vector :guilabel:`Layer Properties`
dialog and click on the :guilabel:`Actions` tab. Select 'Generic' as type and
provide a descriptive name for the action. The action itself must contain
the name of the application that will be executed when the action is invoked.
You can add one or more attribute field values as arguments to the application.
When the action is invoked any set of characters that start with a ``%``
followed by the name of a field will be replaced by the value of that field.
The special characters :index:`%%` will be replaced by the value of the field
that was selected from the identify results or attribute table (see using_actions_
below). Double quote marks can be used to group text into a single argument to
the program, script or command. Double quotes will be ignored if preceded by a
backslash.

If you have field names that are substrings of other field names (e.g.,
``col1`` and ``col10``) you should indicate so, by surrounding the field name
(and the \% character) with square brackets (e.g., ``[%col10]``). This will
prevent the ``%col10`` field name being mistaken for the ``%col1`` field name
with a ``0`` on the end. The brackets will be removed by |qg| when it
substitutes in the value of the field. If you want the substituted field to be
surrounded by square brackets, use a second set like this: ``[[%col10]]``.

Using the :guilabel:`Identify Features` tool you can open :guilabel:`Identify Results`
dialog. It includes a *(Derived)* item that contains information relevant to the
layer type. The values in this item can be accessed in a similar way to the other
fields by using preceeding the derived field name by ``(Derived).``. For example,
a point layer has an ``X`` and ``Y`` field and the value of these can be used in
the action with ``%(Derived).X`` and ``%(Derived).Y``. The derived attributes
are only available from the :guilabel:`Identify Results` dialog box, not the
:guilabel:`Attribute Table` dialog box.

Two :index:`example actions` are shown below:

* ``konqueror http://www.google.com/search?q=%nam``
* ``konqueror http://www.google.com/search?q=%%``

In the first example, the web browser konqueror is invoked and passed a URL
to open. The URL performs a Google search on the value of the ``nam`` field
from our vector layer. Note that the application or script called by the
action must be in the path or you must provide the full path. To be sure, we
could rewrite the first example as:
``/opt/kde3/bin/konqueror http://www.google.com/search?q=%nam``. This will
ensure that the konqueror application will be executed when the action is
invoked.

The second example uses the \%\% notation which does not rely on a particular
field for its value. When the action is invoked, the \%\% will be replaced by
the value of the selected field in the identify results or attribute table.

.. _using_actions:

**Using Actions**

Actions can be invoked from either the :guilabel:`Identify Results` dialog,
an :guilabel:`Attribute Table` dialog or from :guilabel:`Run Feature Action`
(recall that these dialogs can be opened by clicking |mActionIdentify|
:sup:`Identify Features` or |mActionOpenTable| :sup:`Open Attribute Table` or
|mAction| :sup:`Run Feature Action`). To invoke an action, right
click on the record and choose the action from the popup menu. Actions are
listed in the popup menu by the name you assigned when defining the actions.
Click on the action you wish to invoke.

If you are invoking an action that uses the ``%%`` notation, right-click on the
field value in the :guilabel:`Identify Results` dialog or the
:guilabel:`Attribute Table` dialog that you wish to pass to the application
or script.

Here is another example that pulls data out of a vector layer and inserts
them into a file using bash and the ``echo`` command (so it will only work
|nix| or perhaps |osx|). The layer in question has fields for a species name
``taxon_name``, latitude ``lat`` and longitude ``long``. I would like to be
able to make a spatial selection of a localities and export these field values
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


As an exercise we create an action that does a Google search on the ``lakes``
layer. First we need to determine the URL needed to perform a search on a
keyword. This is easily done by just going to Google and doing a simple
search, then grabbing the URL from the address bar in your browser. From this
little effort we see that the format is: http://google.com/search?q=qgis,
where ``QGIS`` is the search term. Armed with this information, we can proceed:

#. Make sure the ``lakes`` layer is loaded.
#. Open the :guilabel:`Layer Properties` dialog by double-clicking on the
   layer in the legend or right-click and choose :guilabel:`Properties`
   from the popup menu.
#. Click on the :guilabel:`Actions` tab.
#. Enter a name for the action, for example ``Google Search``.
#. For the action, we need to provide the name of the external program to run.
   In this case, we can use Firefox. If the program is not in your path, you
   need to provide the full path.
#. Following the name of the external application, add the URL used for doing
   a Google search, up to but not included the search term:
   ``http://google.com/search?q=``
#. The text in the :guilabel:`Action` field should now look like this:
   ``firefox http://google.com/search?q=``
#. Click on the drop-down box containing the field names for the ``lakes``
   layer. It's located just to the left of the **[Insert Field]** button.
#. From the drop-down box :guilabel:`The valid attribute names for this layer`
   |selectstring| select 'NAMES' and click **[Insert Field]**.
#. Your action text now looks like this:

   ``firefox http://google.com/search?q=%NAMES``
#. To finalize the action click the **[Insert action]** button.


This completes the action and it is ready to use. The final text of the
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
   :width: 15em

   Select feature and choose action |nix|

When we click on the action, it brings up Firefox and navigates to the URL
http://www.google.com/search?q=Tustumena. It is also possible to add further
attribute fields to the action. Therefore you can add a ``+`` to the end of
the action text, select another field and click on **[Insert Field]**. In
this example there is just no other field available that would make sense
to search for.

You can define multiple actions for a layer and each will show up in the
:guilabel:`Identify Results` dialog.

.. % FIXME No longer valid??
.. %You can also invoke actions from the attribute table
.. %by selecting a row and right-clicking, then choosing the action from the popup
.. %menu.

You can think of all kinds of uses for actions. For example, if you have
a point layer containing locations of images or photos along with a file name,
you could create an action to launch a viewer to display the image. You could
also use actions to launch web-based reports for an attribute field or
combination of fields, specifying them in the same way we did in our
Google search example.

We can also make more complex examples, for instance on how to use **Python**
actions.

Usually when we create an action to open a file with an external application
we can use absolute paths, or eventually relative paths, in the second case
the path is relative to the location of the external program executable file.
But what about we need to use relative paths, relative to the selected layer
(a file based one, like a shapefile or spatialite)? The following code will
do the trick:

::


  command = "firefox";
  imagerelpath = "images_test/test_image.jpg";
  layer = qgis.utils.iface.activeLayer();
  import os.path;
  layerpath = layer.source() if layer.providerType() == 'ogr' else (qgis.core.QgsDataSourceURI(layer.source()).database() if layer.providerType() == 'spatialite' else None);
  path = os.path.dirname(str(layerpath));
  image = os.path.join(path,imagerelpath);
  import subprocess;
  subprocess.Popen( [command, image ] );

we have to just remember that the action is one of type *Python* and to
change the *command* and *imagerelpath* variables to fit our needs.

But what about if the relative path need to be relative to the (saved)
project file? The code of the Python action would be:

::


  command="firefox";
  imagerelpath="images/test_image.jpg";
  projectpath=qgis.core.QgsProject.instance().fileName();
  import os.path; path=os.path.dirname(str(projectpath)) if projectpath != '' else None;
  image=os.path.join(path, imagerelpath);
  import subprocess;
  subprocess.Popen( [command, image ] );

Another Python actions example if the one that allows us to add new layers
to the project. For instance the following examples will add to the project
respectively a vector and a raster. The name of files to be added to the
project and the name to be given to the layer are data driven (*filename* and
*layname* are column names of the table of attributes of the vector where
the action was created):

::


  qgis.utils.iface.addVectorLayer('/yourpath/[% "filename" %].shp','[% "layername" %]', 'ogr')


To add a raster (a tif image in this example) it becomes:

::


  qgis.utils.iface.addRasterLayer('/yourpath/[% "filename" %].tif','[% "layername" %]')


.. _`sec_joins`:

Joins Tab
---------


|join| The :guilabel:`Joins` tab allows you to :index:`join a loaded attribute table
to a loaded vector layer`. As key columns you have to define a :index:`join
layer`, a join field and a target field. QGIS currently supports to join non
spatial table formats supported by OGR, delimited text and the PostgreSQL
provider (see figure_joins_1_).

.. _figure_joins_1:

.. only:: html

   **Figure Joins 1:**

.. figure:: /static/user_manual/working_with_vector/join_attributes.png
   :width: 25em
   :align: center

   Join an attribute table to an existing vector layer |nix|

Additionally the add vector join dialog allows to:

* |checkbox| :guilabel:`Cache join layer in virtual memory`
* |checkbox| :guilabel:`Create attribute index on the join field`

.. _`sec_diagram`:

Diagrams Tab
------------

|diagram| The :guilabel:`Diagrams` tab allows you to add a graphic overlay to a
vector layer (see figure_diagrams_1_).

The current core implementation of diagrams provides support for piecharts
and text diagrams. Text values ​​of different data columns are displayed one
below the other with a circle or a box and dividers. Diagram size is based
on a fixed size or on linear scaling according to a classification attribute.
The placement of the diagrams interacts with the new labeling, so position
conflicts between diagrams and labels are detected and solved. In addition
to chart positions can be fixed by the users hand.

.. _figure_diagrams_1:

.. only:: html

   **Figure Diagrams 1:**

.. figure:: /static/user_manual/working_with_vector/diagram_tab.png
   :width: 25em
   :align: center

   Vector properties dialog with diagram tab |nix|

We will demonstrate an example and overlay the alaska boundary layer a
text diagram showing some temperature data from a climate vector layer.
Both vector layers are part of the |qg| sample dataset (see Section
:ref:`label_sampledata`).

#. First click on the |mActionAddOgrLayer| :sup:`Load Vector` icon, browse
   to the |qg| sample dataset folder and load the two vector shape layers
   :file:`alaska.shp` and :file:`climate.shp`.
#. Double click the ``climate`` layer in the map legend to open the
   :guilabel:`Layer Properties` dialog.
#. Click on the :guilabel:`Diagrams` tab, activate :guilabel:`Display diagrams`
   and from :guilabel:`Diagram type` |selectstring| combobox select 'Text diagram'
#. As Background color we choose a light blue and set a fixed size to 18 mm.
#. Placement could be set to AroundPoint.
#. In the diagram we want to display the values of the three columns
   ``T_F_JAN``, ``T_F_JUL`` and ``T_F_MEAN``. First select ``T_F_JAN`` as
   Attributes and click the green **[\+]** button, then ``T_F_JUL`` and
   finally ``T_F_MEAN``.
#. Now click **[Apply]** to display the diagram in the |qg| main window.
#. You can now adapt the chart size, or change the attribute colors by double
   clicking on the color values in the attribute field. Figure_diagrams_2_
   gives an impression.
#. Finally click **[Ok]**.

.. _figure_diagrams_2:

.. only:: html

   **Figure Diagrams 2:**

.. figure:: /static/user_manual/working_with_vector/climate_diagram.png
   :width: 25em
   :align: center

   Diagram from temperature data overlayed on a map |nix|

Additionally in the :menuselection:`Settings --> Options` dialog, there is a
``Overlay`` tab where it is possible to select the placement algorithm of the diagrams.
The central point method is a generic one, the others use algorithms of the PAL library.
They also consider diagram objects and labels in different layers. Also see section
:ref:`diagram_overlay` for additional diagram features.

