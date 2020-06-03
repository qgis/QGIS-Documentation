.. _vector_properties_dialog:

****************************
The Vector Properties Dialog
****************************

.. only:: html

   .. contents::
      :local:

The :guilabel:`Layer Properties` dialog for a vector layer provides general
settings to manage appearance of layer features in the map (symbology,
labeling, diagrams), interaction with the mouse (actions, map tips, form
design). It also provides information about the layer.

To access the :guilabel:`Layer Properties` dialog:

* In the :guilabel:`Layers` panel, double-click the layer or right-click
  and select :guilabel:`Properties...` from the pop-up menu;
* Go to :menuselection:`Layer --> Layer Properties...` menu when the layer
  is selected.

The vector :guilabel:`Layer Properties` dialog provides the following sections:

.. list-table::


   * - |metadata| :ref:`Information <vectorinformationmenu>`
     - |system| :ref:`Source <vectorsourcemenu>`
     - |symbology| :ref:`Symbology <vector_style_menu>`:sup:`[1]`
   * - |labeling| :ref:`Labels <vector_labels_tab>`:sup:`[1]`
     - |diagram| :ref:`Diagrams <sec_diagram>`
     - |3d| :ref:`3D View <sec_3_d_view>`:sup:`[1]`
   * - |sourceFields| :ref:`Fields <vector_fields_menu>`
     - |formView| :ref:`Attributes Form <vector_attributes_menu>`
     - |join| :ref:`Joins <sec_joins>`
   * - |auxiliaryStorage| :ref:`Auxiliary Storage <vector_auxiliary_storage>`
     - |action| :ref:`Actions <actions_menu>`
     - |display| :ref:`Display <maptips>`
   * - |rendering| :ref:`Rendering <vectorrenderingmenu>`
     - |expression| :ref:`Variables <vectorvariablesmenu>`
     - |editMetadata| :ref:`Metadata <vectormetadatamenu>`
   * - |dependencies| :ref:`Dependencies <vectordependenciesmenu>`
     - |legend| :ref:`Legend <vectorlegendmenu>`
     - |overlay| :ref:`QGIS Server <vectorservermenu>`
   * - |digitizing| :ref:`Digitizing <digitizingmenu>`
     - :ref:`External plugins <plugins>`:sup:`[2]` tabs
     -

:sup:`[1]` Also available in the :ref:`Layer styling panel <layer_styling_panel>`

:sup:`[2]` :ref:`External plugins <plugins>` you install can optionally add tabs to this
dialog. Those are not presented in this document. Refer to their documentation.

.. tip:: **Share full or partial properties of the layer styles**

   The :menuselection:`Style` menu at the bottom of the dialog allows you to import or export
   these or part of these properties from/to several destination (file, clipboard, database).
   See :ref:`manage_custom_style`.

.. note::

   Because properties (symbology, label, actions, default values, forms...) of
   embedded layers (see :ref:`nesting_projects`) are pulled from the original
   project file and to avoid changes that may break this behavior, the layer
   properties dialog is made unavailable for these layers.


.. _vectorinformationmenu:

Information Properties
======================

|metadata| The :guilabel:`Information` tab is read-only and represents an interesting
place to quickly grab summarized information and metadata on the current layer.
Provided information are:

* based on the provider of the layer (format of storage, path, geometry type,
  data source encoding, extent...);
* picked from the :ref:`filled metadata <vectormetadatamenu>` (access, links,
  contacts, history...);
* or related to its geometry (spatial extent, CRS...) or its attributes (number
  of fields, characteristics of each...).


.. _vectorsourcemenu:

Source Properties
=================

|system| Use this tab to define general settings for the vector layer.


.. _figure_vector_general:

.. figure:: img/vector_source_menu.png
   :align: center

   Source tab in vector Layer Properties dialog


Other than setting the :guilabel:`Layer name` to display in the
:guilabel:`Layers Panel`, available options include:

Coordinate Reference System
---------------------------

* Displays the layer's :ref:`Coordinate Reference System (CRS) <layer_crs>`.
  You can change the layer's CRS, selecting a recently used one
  in the drop-down list or clicking on |setProjection| :sup:`Select CRS` button
  (see :ref:`crs_selector`). Use this process only if the CRS applied to the
  layer is a wrong one or if none was applied.
  If you wish to reproject your data into another CRS, rather use layer reprojection
  algorithms from Processing or :ref:`Save it into another layer <general_saveas>`.
* :guilabel:`Create spatial index` (only for OGR-supported formats).
* :guilabel:`Update extents` information for a layer.

.. index:: Query builder
.. _vector_query_builder:

Query Builder
-------------

The :guilabel:`Query Builder` dialog is accessible through the eponym button
at the bottom of the :guilabel:`Source` tab in the Layer Properties dialog,
under the :guilabel:`Provider feature filter` group.

The Query Builder provides an interface that allows
you to define a subset of the features in the layer using a SQL-like WHERE
clause and to display the result in the main window. As long as the query is
active, only the features corresponding to its result are available in the
project.

You can use one or more layer attributes to define the filter in the ``Query
Builder``.
The use of more than one attribute is shown in Figure_vector_querybuilder_.
In the example, the filter combines the attributes

* ``toa`` (``DateTime`` field: ``cast("toa" as character) > '2017-05-17'`` and
  ``cast("toa" as character) < '2019-12-24T18:00:00'``),
* ``name`` (``String`` field: ``"name" > 'S'``) and
* ``FID`` (``Integer`` field: ``FID > 10``)

using the AND, OR and NOT operators and parenthesis.
This syntax (including the DateTime format for the ``toa`` field) works for
GeoPackage datasets.

The filter is made at the data provider (OGR, PostgreSQL, MSSQL...) level.
So the syntax depends on the data provider (DateTime is for instance not
supported for the ESRI Shapefile format).
The complete expression::

  cast("toa" as character) > '2017-05-17' AND
  cast("toa" as character) < '2019-12-24T18:00:00' AND
  NOT ("name" > 'S' OR FID > 10)


.. _figure_vector_querybuilder:

.. figure:: img/queryBuilder.png
   :align: center

   Query Builder


You can also open the :guilabel:`Query Builder` dialog using the :guilabel:`Filter...`
option from the :menuselection:`Layer` menu or the layer contextual menu.
The :guilabel:`Fields`, :guilabel:`Values` and :guilabel:`Operators` sections in
the dialog help you to construct the SQL-like query exposed in the
:guilabel:`Provider specific filter expression` box.

The **Fields** list contains all the fields of the layer. To add an attribute
column to the SQL WHERE clause field, double-click its name or just type it into
the SQL box.

The **Values** frame lists the values of the currently selected field. To list all
unique values of a field, click the :guilabel:`All` button. To instead list the first
25 unique values of the column, click the :guilabel:`Sample` button. To add a value
to the SQL WHERE clause field, double click its name in the Values list.
You can use the search box at the top of the Values frame to easily browse and
find attribute values in the list.

The **Operators** section contains all usable operators. To add an operator to
the SQL WHERE clause field, click the appropriate button. Relational operators
( ``=`` , ``>`` , ...), string comparison operator (``LIKE``), and logical
operators (``AND``, ``OR``, ...) are available.

The :guilabel:`Test` button helps you check your query and displays a message box with
the number of features satisfying the current query.
Use the :guilabel:`Clear` button to wipe the SQL query and revert the layer to its
original state (ie, fully load all the features).

When a filter is applied,
QGIS treats the resulting subset acts as if it were the entire layer. For
example if you applied the filter above for 'Borough' (``"TYPE_2" = 'Borough'``),
you can not display, query, save or edit ``Anchorage``, because that is a
'Municipality' and therefore not part of the subset.

.. tip:: **Filtered layers are indicated in the Layers Panel**

  In the :guilabel:`Layers` panel, filtered layer is listed with a |indicatorFilter|
  :sup:`Filter` icon next to it indicating the query used when the mouse hovers
  over the button. Double-click the icon opens the :guilabel:`Query Builder` dialog
  for edit.


.. index:: Style, Symbology, Renderer
.. _vector_style_menu:

Symbology Properties
====================

|symbology| The Symbology tab provides you with a comprehensive tool for
rendering and symbolizing your vector data. You can use tools that are
common to all vector data, as well as special symbolizing tools that were
designed for the different kinds of vector data. However all types share the
following dialog structure: in the upper part, you have a widget that helps
you prepare the classification and the symbol to use for features and at
the bottom the :ref:`layer_rendering` widget.

.. tip:: **Switch quickly between different layer representations**

   Using the :menuselection:`Styles --> Add` menu at the bottom of the
   :guilabel:`Layer Properties` dialog, you can save as many styles as needed.
   A style is the combination of all properties of a layer (such as symbology,
   labeling, diagram, fields form, actions...) as you want. Then, simply
   switch between styles from the context menu of the layer in :guilabel:`Layers Panel`
   to automatically get different representations of your data.


.. tip:: **Export vector symbology**

   You have the option to export vector symbology from QGIS into Google \*.kml,
   \*.dxf and MapInfo \*.tab files. Just open the right mouse menu of the layer
   and click on :menuselection:`Save As...` to specify the name of the output file
   and its format. In the dialog, use the :menuselection:`Symbology export` menu
   to save the symbology either as :menuselection:`Feature symbology -->` or as
   :menuselection:`Symbol layer symbology -->`. If you have used symbol layers,
   it is recommended to use the second setting.

.. ToDo: add information about the export options

Features rendering
------------------

The renderer is responsible for drawing a feature together with the correct
symbol. Regardless layer geometry type, there are four common types of
renderers: single symbol, categorized, graduated and rule-based. For point
layers, there are a point displacement and a heatmap renderers available while
polygon layers can also be rendered with the inverted polygons and 2.5 D renderers.

There is no continuous color renderer, because it is in fact only a special
case of the graduated renderer. The categorized and graduated renderers can be
created by specifying a symbol and a color ramp - they will set the colors for
symbols appropriately. For each data type (points, lines and polygons), vector
symbol layer types are available. Depending on the chosen renderer, the dialog
provides different additional sections.

.. note::

   If you change the renderer type when setting the style of a vector layer the
   settings you made for the symbol will be maintained. Be aware that this
   procedure only works for one change. If you repeat changing the renderer
   type the settings for the symbol will get lost.

.. index::
   single: Symbology; Single symbol renderer
.. _single_symbol_renderer:

Single Symbol Renderer
......................

The |singleSymbol| :guilabel:`Single Symbol` renderer is used to render
all features of the layer using a single user-defined symbol.
See :ref:`symbol-selector` for further information about symbol representation.


.. _figure_single_symbology:

.. figure:: img/singlesymbol_ng_line.png
   :align: center

   Single symbol line properties


.. index::
   single: Symbology; No symbols renderer
.. _no_symbol_renderer:

No Symbols Renderer
...................

The |nullSymbol| :guilabel:`No Symbols` renderer is a special use case of the
Single Symbol renderer as it applies the same rendering to all features.
Using this renderer, no symbol will be drawn for features,
but labeling, diagrams and other non-symbol parts will still be shown.

Selections can still be made on the layer in the canvas and selected
features will be rendered with a default symbol. Features being edited
will also be shown.

This is intended as a handy shortcut for layers which you only want
to show labels or diagrams for, and avoids the need to render
symbols with totally transparent fill/border to achieve this.


.. index:: Classes
   single: Symbology; Categorized renderer
.. _categorized_renderer:

Categorized Renderer
....................

The |categorizedSymbol| :guilabel:`Categorized` renderer is used to render the
features of a layer, using a user-defined symbol whose aspect reflects the
discrete values of a field or an expression.

.. _figure_categorized_symbology:

.. figure:: img/categorysymbol_ng_line.png
   :align: center

   Categorized Symbolizing options

To use categorized symbology for a layer:

#. Select the :guilabel:`Value` of classification: it can be an existing field
   or an :ref:`expression <vector_expressions>` you can type in the box or build
   using the associated |expression| button. Using expressions for categorizing
   avoids the need to create an ad hoc field for symbology purposes (eg, if your
   classification criteria are derived from one or more attributes).

   The expression used to classify features can be of any type; eg, it can:

   * be a comparison. In this case, QGIS returns values ``1`` (**True**) and
     ``0`` (**False**). Some examples:

     ::

      myfield >= 100
      $id = @atlas_featureid
      myfield % 2 = 0
      within( $geometry, @atlas_geometry )

   * combine different fields:

     ::

      concat( field_1, ' ', field_2 )

   * be a calculation on fields:

     ::

      myfield % 2
      year( myfield )
      field_1 + field_2
      substr( field_1, -3 )

   * be used to transform linear values to discrete classes, e.g.:

     ::

      CASE WHEN x > 1000 THEN 'Big' ELSE 'Small' END

   * combine several discrete values into a single category, e.g.:

     ::

      CASE
      WHEN building IN ('residence', 'mobile home') THEN 'residential'
      WHEN building IN ('commercial', 'industrial') THEN 'Commercial and Industrial'
      END

   .. tip:: While you can use any kind of expression to categorize features,
    for some complex expressions it might be simpler to use :ref:`rule-based
    rendering <rule_based_rendering>`.

#. Configure the :ref:`Symbol <symbol-selector>`, which will be used as
   base symbol for all the classes;
#. Indicate the :ref:`Color ramp <color-ramp>`, ie the range of colors from which
   the color applied to each symbol is selected.

   Besides the common options of the :ref:`color ramp widget <color_ramp_widget>`,
   you can apply a |unchecked| :guilabel:`Random Color Ramp` to the categories.
   You can click the :guilabel:`Shuffle Random Colors` entry to regenerate a new set
   of random colors if you are not satisfied.
#. Then click on the :guilabel:`Classify` button to create classes from the
   distinct values of the provided field or expression.
#. :guilabel:`Apply` the changes if the :ref:`live update <layer_styling_panel>`
   is not in use and each feature on the map canvas will be rendered with the
   symbol of its class.

   By default, QGIS appends an :guilabel:`all other values` class to the list.
   While empty at the beginning, this class is used as a default class for any
   feature not falling into the other classes (eg, when you create features
   with new values for the classification field / expression).

Further tweaks can be done to the default classification:

* You can |signPlus| :sup:`Add` new categories, |signMinus| :sup:`Remove`
  selected categories or :guilabel:`Delete All` of them.
* A class can be disabled by unchecking the checkbox to the left of the
  class name; the corresponding features are hidden on the map.
* Drag-and-drop the rows to reorder the classes
* To change the symbol, the value or the legend of a class, double click the item.

Right-clicking over selected item(s) shows a contextual menu to:

* :guilabel:`Copy Symbol` and :guilabel:`Paste Symbol`, a convenient way
  to apply the item's representation to others
* :guilabel:`Change Color...` of the selected symbol(s)
* :guilabel:`Change Opacity...` of the selected symbol(s)
* :guilabel:`Change Output Unit...` of the selected symbol(s)
* :guilabel:`Change Width...` of the selected line symbol(s)
* :guilabel:`Change Size...` of the selected point symbol(s)
* :guilabel:`Change Angle...` of the selected point symbol(s)
* :guilabel:`Merge Categories`: Groups multiple selected categories into a single
  one. This allows simpler styling of layers with a large number of categories,
  where it may be possible to group numerous distinct categories into a smaller
  and more manageable set of categories which apply to multiple values.

  .. tip:: Since the symbol kept for the merged categories is the one of the
   topmost selected category in the list, you may want to move the category
   whose symbol you wish to reuse to the top before merging.

* :guilabel:`Unmerge Categories` that were previously merged

.. _categorized_advanced_menu:

The :guilabel:`Advanced` menu gives access to options to speed classification
or fine-tune the symbols rendering:

* :guilabel:`Match to saved symbols`: Using the :ref:`symbols library
  <vector_style_manager>`, assigns to each category a symbol whose name
  represents the classification value of the category
* :guilabel:`Match to symbols from file...`: Provided a file with symbols,
  assigns to each category a symbol whose name represents the classification
  value of the category
* :ref:`Symbol levels... <Symbols_levels>` to define the order of symbols rendering.

.. tip:: **Edit categories directly from the** :guilabel:`Layers` **panel**

   When a layer symbology is based on a :ref:`categorized <categorized_renderer>`,
   :ref:`graduated <graduated_renderer>` or :ref:`rule-based <rule_based_rendering>`
   symbology mode, you can edit each of the categories from the :guilabel:`Layers`
   Panel. Right-click on a sub-item of the layer and you will:

   * |toggleAllLayers| :guilabel:`Toggle items` visibility
   * |showAllLayers| :guilabel:`Show all items`
   * |hideAllLayers| :guilabel:`Hide all items`
   * Modify the symbol color thanks to the :ref:`color selector
     <color-selector>` wheel
   * :guilabel:`Edit symbol...` from the :ref:`symbol selector
     <symbol-selector>` dialog
   * :guilabel:`Copy symbol`
   * :guilabel:`Paste symbol`


.. index:: Natural Breaks (Jenks), Pretty Breaks, Equal Interval, Quantile, Histogram
   single: Symbology; Graduated renderer
.. _graduated_renderer:

Graduated Renderer
..................

The |graduatedSymbol| :guilabel:`Graduated` renderer is used to render
all the features from a layer, using an user-defined symbol whose color or size
reflects the assignment of a selected feature's attribute to a class.

Like the Categorized Renderer, the Graduated Renderer allows you
to define rotation and size scale from specified columns.

Also, analogous to the Categorized Renderer, it allows you to select:

* The value (using the fields listbox or the |expression|
  :sup:`Set value expression` function)
* The symbol (using the Symbol selector dialog)
* The legend format and the precision
* The method to use to change the symbol: color or size
* The colors (using the color Ramp list) if the color method is selected
* The size (using the size domain and its unit)

Then you can use the Histogram tab which shows an interactive histogram of the
values from the assigned field or expression. Class breaks can be moved or
added using the histogram widget.

.. note::

   You can use Statistical Summary panel to get more information on your vector
   layer. See :ref:`statistical_summary`.

Back to the Classes tab, you can specify the number of classes and also the
mode for classifying features within the classes (using the Mode list). The
available modes are:

* Equal Interval: each class has the same size (e.g. values from 0 to 16 and
  4 classes, each class has a size of 4).
* Quantile: each class will have the same number of element inside
  (the idea of a boxplot).
* Natural Breaks (Jenks): the variance within each class is minimal while the
  variance between classes is maximal.
* Standard Deviation: classes are built depending on the standard deviation of
  the values.
* Pretty Breaks: Computes a sequence of about n+1 equally spaced nice values
  which cover the range of the values in x. The values are chosen so that they
  are 1, 2 or 5 times a power of 10. (based on pretty from the R statistical
  environment https://astrostatistics.psu.edu/datasets/R/html/base/html/pretty.html)

The listbox in the center part of the :guilabel:`Symbology` tab lists the classes
together with their ranges, labels and symbols that will be rendered.

Click on **Classify** button to create classes using the chosen mode. Each
classes can be disabled unchecking the checkbox at the left of the class name.

To change symbol, value and/or label of the class, just double click
on the item you want to change.

Right-clicking over selected item(s) shows a contextual menu to:

* :guilabel:`Copy Symbol` and :guilabel:`Paste Symbol`, a convenient way
  to apply the item's representation to others
* :guilabel:`Change Color...` of the selected symbol(s)
* :guilabel:`Change Opacity...` of the selected symbol(s)
* :guilabel:`Change Output Unit...` of the selected symbol(s)
* :guilabel:`Change Width...` of the selected line symbol(s)
* :guilabel:`Change Size...` of the selected point symbol(s)
* :guilabel:`Change Angle...` of the selected point symbol(s)

The example in figure_graduated_symbology_ shows the graduated rendering dialog for
the major_rivers layer of the QGIS sample dataset.

.. _figure_graduated_symbology:

.. figure:: img/graduatedsymbol_ng_line.png
   :align: center

   Graduated Symbolizing options

.. tip:: **Thematic maps using an expression**

   Categorized and graduated thematic maps can be created using the result
   of an expression. In the properties dialog for vector layers, the attribute
   chooser is extended with a |expression| :sup:`Set column expression` function.
   So you don't need to write the classification attribute
   to a new column in your attribute table if you want the classification
   attribute to be a composite of multiple fields, or a formula of some sort.

.. index:: Proportional symbol, Multivariate analysis, Size assistant
.. _proportional_symbols:

Proportional Symbol and Multivariate Analysis
.............................................

Proportional Symbol and Multivariate Analysis are not
rendering types available from the Symbology rendering drop-down list.
However with the :ref:`data-defined override <data_defined>` options applied
over any of the previous
rendering options, QGIS allows you to display your point and line data with
such representation.

**Creating proportional symbol**

To apply a proportional rendering:

#. First apply to the layer the :ref:`single symbol renderer
   <single_symbol_renderer>`.
#. Then set the symbol to apply to the features.
#. Select the item at the upper level of the symbol tree, and use the
   |dataDefined| :sup:`Data-defined override` :ref:`button <data_defined>` next
   to the :guilabel:`Size` (for point layer) or :guilabel:`Width` (for line
   layer) option.
#. Select a field or enter an expression, and for each feature, QGIS will apply
   the output value to the property and proportionally resize the symbol in the
   map canvas.

   If need be, use the :guilabel:`Size assistant...` option of the |dataDefined|
   menu to apply some transformation (exponential, flannery...) to the symbol
   size rescaling (see :ref:`data_defined_assistant` for more details).

You can choose to display the proportional symbols in the :ref:`Layers panel
<label_legend>` and the :ref:`print layout legend item <layout_legend_item>`:
unfold the :guilabel:`Advanced` drop-down list at the bottom of the main dialog of
the :guilabel:`Symbology` tab and select **Data-defined size legend...** to
configure the legend items (see :ref:`data_defined_size_legend` for details).

.. _figure_symbology_proportional:

.. figure:: img/proportional_symbols.png
   :align: center

   Scaling airports size based on elevation of the airport

**Creating multivariate analysis**

A multivariate analysis rendering helps you evaluate the relationship between
two or more variables e.g., one can be represented by a color ramp while the
other is represented by a size.

The simplest way to create multivariate analysis in QGIS is to:

#. First apply a categorized or graduated rendering on a layer, using the same
   type of symbol for all the classes.
#. Then, apply a proportional symbology on the classes:

   #. Click on the :guilabel:`Change` button above the classification frame:
      you get the :ref:`symbol-selector` dialog.
   #. Rescale the size or width of the symbol layer using the |dataDefined|
      :ref:`data defined override <data_defined>` widget as seen above.

Like the proportional symbol, the scaled symbology can be added to the layer
tree, on top of the categorized or graduated classes symbols using the
:ref:`data defined size legend <data_defined_size_legend>` feature. And
both representation are also available in the print layout legend item.

.. _figure_symbology_multivariate:

.. figure:: img/multivariate_example.png
   :align: center

   Multivariate example with scaled size legend


.. index::
   single: Symbology; Rule-based renderer
   single: Rule-based renderer; Create a rule
.. _rule_based_rendering:

Rule-based Renderer
....................

The |ruleBasedSymbol| :guilabel:`Rule-based` renderer is used to render
all the features from a layer,
using rule-based symbols whose aspect reflects the assignment of a selected
feature's attribute to a class. The rules are based on SQL statements and can
be nested.
The dialog allows rule grouping by filter or scale, and you can decide
if you want to enable symbol levels or use only the first-matched rule.

To create a rule:

#. Activate an existing row by double-clicking it (by default, QGIS adds a
   symbol without a rule when the rendering mode is enabled) or click the
   |projectProperties| :sup:`Edit rule` or |signPlus| :sup:`Add rule` button.
#. In the :guilabel:`Edit Rule` dialog that opens, you can define a label
   to help you identify each rule. This is the label that will be displayed
   in the :guilabel:`Layers Panel` and also in the print composer legend.
#. Manually enter an expression in the text box next to the |radioButtonOn|
   :guilabel:`Filter` option or press the |expression| button next to it to open
   the expression string builder dialog.
#. Use the provided functions and the layer attributes to build an :ref:`expression
   <vector_expressions>` to filter the features you'd like to retrieve. Press
   the :guilabel:`Test` button to check the result of the query.
#. You can enter a longer label to complete the rule description.
#. You can use the |checkbox| :guilabel:`Scale Range` option to set scales at which
   the rule should be applied.
#. Finally, configure the :ref:`symbol to use <symbol-selector>` for these features.
#. And press :guilabel:`OK`.

A new row summarizing the rule is added to the Layer Properties dialog.
You can create as many rules as necessary following the steps above or copy
pasting an existing rule. Drag-and-drop the rules on top of each other to nest
them and refine the upper rule features in subclasses.

Selecting a rule, you can also organize its features in subclasses using the
:guilabel:`Refine selected rules` drop-down menu. Automated rule refinement can be
based on:

* **scales**;
* **categories**: applying a :ref:`categorized renderer <categorized_renderer>`;
* or **ranges**: applying a :ref:`graduated renderer <graduated_renderer>`.

Refined classes appear like sub-items of the rule, in a tree hierarchy and like
above, you can set symbology of each class.

In the :guilabel:`Edit rule` dialog, you can avoid writing all the rules and
make use of the |radioButtonOff| :guilabel:`Else` option to catch all the
features that do not match any of the other rules, at the same level. This
can also be achieved by writing ``Else`` in the *Rule* column of the
:menuselection:`Layer Properties --> Symbology --> Rule-based` dialog.

Right-clicking over selected item(s) shows a contextual menu to:

* :guilabel:`Copy` and :guilabel:`Paste`, a convenient way to create new
  item(s) based on existing item(s)
* :guilabel:`Copy Symbol` and :guilabel:`Paste Symbol`, a convenient way
  to apply the item's representation to others
* :guilabel:`Change Color...` of the selected symbol(s)
* :guilabel:`Change Opacity...` of the selected symbol(s)
* :guilabel:`Change Output Unit...` of the selected symbol(s)
* :guilabel:`Change Width...` of the selected line symbol(s)
* :guilabel:`Change Size...` of the selected point symbol(s)
* :guilabel:`Change Angle...` of the selected point symbol(s)
* :guilabel:`Refine Current Rule`: open a submenu that allows to
  refine the current rule with **scales**, **categories** (categorized renderer)
  or **Ranges** (graduated renderer).

The created rules also appear in a tree hierarchy in the map legend.
Double-click the rules in the map legend and the Symbology tab of the layer
properties appears showing the rule that is the background for the symbol in
the tree.

The example in figure_rule_based_symbology_ shows the rule-based rendering
dialog for the rivers layer of the QGIS sample dataset.

.. _figure_rule_based_symbology:

.. figure:: img/rulesymbol_ng_line.png
   :align: center

   Rule-based Symbolizing options

.. index:: Displacement plugin, Displacement circle
   single: Symbology; Point displacement renderer
.. _point_displacement:

Point displacement Renderer
............................

The |pointDisplacementSymbol| :guilabel:`Point Displacement` renderer works to
visualize all features of a point layer, even if they have the same location.
To do this, the renderer takes the points falling in a given :guilabel:`Distance`
tolerance from each other and places them around their barycenter following
different :guilabel:`Placement methods`:

* **Ring**: places all the features on a circle whose radius depends on the
  number of features to display.
* **Concentric rings**: uses a set of concentric circles to show the features.
* **Grid**: generates a regular grid with a point symbol at each intersection.

The :guilabel:`Center symbol` widget helps you customize the symbol and color
of the middle point.
For the distributed points symbols, you can apply any of the *No symbols*,
*Single symbol*, *Categorized*, *Graduated* or *Rule-based* renderer using the
:guilabel:`Renderer` drop-down list and customize them using the
:guilabel:`Renderer Settings...` button.

While the minimal spacing of the :guilabel:`Displacement lines` depends on the
point symbol renderer's, you can still customize some of its settings such as
the :guilabel:`Stroke width`, :guilabel:`Stroke color` and :guilabel:`Size
adjustment` (eg, to add more spacing between the rendered points).

Use the :guilabel:`Labels` group options to perform points labeling: the labels
are placed near the displaced position of the symbol, and not at the feature
real position. Other than the :guilabel:`Label attribute`, :guilabel:`Label
font` and :guilabel:`Label color`, you can set the :guilabel:`Minimum map
scale` to display the labels.

.. _figure_displacement_symbology:

.. figure:: img/poi_displacement.png
   :align: center

   Point displacement dialog

.. note::

 Point Displacement renderer does not alter feature geometry, meaning that
 points are not moved from their position. They are still located
 at their initial place. Changes are only visual, for rendering purpose.
 Use instead the Processing :ref:`qgispointsdisplacement` algorithm
 if you want to create displaced features.


.. index:: Cluster
   single: Symbology; Point cluster renderer
.. _point_cluster:

Point Cluster Renderer
.......................

Unlike the |pointDisplacementSymbol| :guilabel:`Point Displacement` renderer
which blows up nearest or overlaid point features placement, the |pointClusterSymbol|
:guilabel:`Point Cluster` renderer groups nearby points into a single
rendered marker symbol. Based on a specified :guilabel:`Distance`, points
that fall within from each others are merged into a single symbol.
Points aggregation is made based on the closest group being formed, rather
than just assigning them the first group within the search distance.

From the main dialog, you can:

* set the symbol to represent the point cluster in the :guilabel:`Cluster symbol`;
  the default rendering displays the number of aggregated features thanks to the
  ``@cluster_size`` :ref:`variable <general_tools_variables>` on Font marker
  symbol layer.
* use the :guilabel:`Renderer` drop-down list to apply any of the other feature
  rendering types to the layer (single, categorized, rule-based...). Then, push
  the :guilabel:`Renderer Settings...` button to configure features' symbology as usual.
  Note that this renderer is only visible on features that are not clustered.
  Also, when the symbol color is the same for all the point features inside a
  cluster, that color sets the ``@cluster_color`` variable of the cluster.

.. _figure_cluster_symbology:

.. figure:: img/cluster_symbol.png
   :align: center

   Point Cluster dialog

.. note::

 Point Cluster renderer does not alter feature geometry,
 meaning that points are not moved from their position. They are still located
 at their initial place. Changes are only visual, for rendering purpose.
 Use instead the Processing :ref:`qgiskmeansclustering` or
 :ref:`qgisdbscanclustering` algorithm if you want to create cluster-based
 features.

.. index::
   single: Symbology; Inverted polygon renderer
.. _inverted_polygon_renderer:

Inverted Polygon Renderer
..........................

The |invertedSymbol| :guilabel:`Inverted Polygon` renderer allows user
to define a symbol to fill in
outside of the layer's polygons. As above you can select subrenderers, namely
Single symbol, Graduated, Categorized, Rule-Based or 2.5D renderer.

.. _figure_inverted_symbology:

.. figure:: img/inverted_polygon_symbol.png
   :align: center

   Inverted Polygon dialog

.. index:: Heatmap
   single: Symbology; Heatmap renderer
.. _heatmap:

Heatmap Renderer
.................

With the |heatmapSymbol| :guilabel:`Heatmap` renderer you can create live
dynamic heatmaps for (multi)point layers.
You can specify the heatmap radius in millimeters, points, pixels, map units or
inches, choose and edit a color ramp for the heatmap style and use a slider for
selecting a trade-off between render speed and quality. You can also define a
maximum value limit and give a weight to points using a field or an expression.
When adding or removing a feature the heatmap renderer updates the heatmap style
automatically.

.. _figure_heatmap_symbology:

.. figure:: img/heatmap_symbol.png
   :align: center

   Heatmap dialog

.. index:: 2.5D
   single: Symbology; 2.5D renderer
.. _2.5_D_rendering:

2.5D Renderer
..............

Using the |25dSymbol| :guilabel:`2.5D` renderer it's possible to create
a 2.5D effect on your layer's features.
You start by choosing a :guilabel:`Height` value (in map units). For that
you can use a fixed value, one of your layer's fields, or an expression. You also
need to choose an :guilabel:`Angle` (in degrees) to recreate the viewer position
(0 |degrees| means west, growing in counter clock wise). Use advanced configuration options
to set the :guilabel:`Roof Color` and :guilabel:`Wall Color`. If you would like
to simulate solar radiation on the features walls, make sure to check the
|checkbox| :guilabel:`Shade walls based on aspect` option. You can also
simulate a shadow by setting a :guilabel:`Color` and :guilabel:`Size` (in map
units).

.. _figure_25d_symbology:

.. figure:: img/2_5dsymbol.png
   :align: center

   2.5D dialog

.. tip:: **Using 2.5D effect with other renderers**

   Once you have finished setting the basic style on the 2.5D renderer, you can
   convert this to another renderer (single, categorized, graduated). The 2.5D
   effects will be kept and all other renderer specific options will be
   available for you to fine tune them (this way you can have for example categorized
   symbols with a nice 2.5D representation or add some extra styling to your 2.5D
   symbols). To make sure that the shadow and the "building" itself do not interfere
   with other nearby features, you may need to enable Symbols Levels (
   :menuselection:`Advanced --> Symbol levels...`).
   The 2.5D height and angle values are saved in the layer's variables,
   so you can edit it afterwards in the variables tab of the layer's properties dialog.

.. index:: Layer rendering, Sort features, Z-level
.. _layer_rendering:

Layer rendering
---------------

From the Symbology tab, you can also set some options that invariably act on all
features of the layer:

* :guilabel:`Opacity` |slider|: You can make the underlying layer in
  the map canvas visible with this tool. Use the slider to adapt the visibility
  of your vector layer to your needs. You can also make a precise definition of
  the percentage of visibility in the menu beside the slider.

* :guilabel:`Blending mode` at the :guilabel:`Layer` and :guilabel:`Feature` levels:
  You can achieve special rendering effects with these tools that you may previously
  only know from graphics programs. The pixels of your overlaying and
  underlaying layers are mixed through the settings described in :ref:`blend-modes`.

* Apply :ref:`paint effects <draw_effects>` on all the layer features with the
  :guilabel:`Draw Effects` button.

* :guilabel:`Control feature rendering order` allows you, using features
  attributes, to define the z-order in which they shall be rendered.
  Activate the checkbox and click on the |sort| button beside.
  You then get the :guilabel:`Define Order` dialog in which you:

  #. Choose a field or build an expression to apply to the layer features.
  #. Set in which order the fetched features should be sorted, i.e. if you choose
     **Ascending** order, the features with lower value are rendered under those
     with higher value.
  #. Define when features returning NULL value should be rendered: **first**
     (bottom) or **last** (top).
  #. Repeat the above steps as many times as rules you wish to use.

  The first rule is applied
  to all the features in the layer, z-ordering them according to their returned value.
  Then, within each group of features with the same value (including those with
  NULL value) and thus the same z-level, the next rule is applied to sort them.
  And so on...

.. _figure_layer_rendering:

.. figure:: img/layer_rendering_options.png
   :align: center

   Layer rendering options


Other Settings
--------------

.. index:: Symbols levels
.. _Symbols_levels:

Symbol levels
.............

For renderers that allow stacked symbol layers (only heatmap doesn't) there is
an option to control the rendering order of each symbol's levels.

For most of the renderers, you can access the Symbols levels option by clicking
the :guilabel:`Advanced` button below the saved symbols list and choosing
:guilabel:`Symbol levels`. For the :ref:`rule_based_rendering` the option is
directly available through :guilabel:`Symbols Levels...` button, while for
:ref:`point_displacement` renderer the same button is inside the
:guilabel:`Rendering settings` dialog.

To activate symbols levels, select the |checkbox| :guilabel:`Enable symbol
levels`. Each row will show up a small sample of the combined symbol, its label
and the individual symbols layer divided into columns with a number next to it.
The numbers represent the rendering order level in which the symbol layer
will be drawn. Lower values levels are drawn first, staying at the bottom, while
higher values are drawn last, on top of the others.

.. _figure_symbol_levels:

.. figure:: img/symbol_levels.png
   :align: center

   Symbol levels dialog

.. note::

   If symbols levels are deactivated, the complete symbols will be drawn
   according to their respective features order. Overlapping symbols will
   simply obfuscate to other below. Besides, similar symbols won't "merge" with
   each other.

.. _figure_symbol_levels_example:

.. figure:: img/symbol_levels_examples.png
   :align: center

   Symbol levels activated (A) and deactivated (B) difference

.. _data_defined_size_legend:

Data-defined size legend
........................

When a layer is rendered with the :ref:`proportional symbol or the multivariate
rendering <proportional_symbols>` or when a :ref:`scaled size diagram
<diagram_size>` is applied to the layer, you can allow the display of the scaled
symbols in both the :ref:`Layers panel <label_legend>` and the :ref:`print
layout legend <layout_legend_item>`.

To enable the :guilabel:`Data-defined Size Legend` dialog to render symbology,
select the eponym option in the :guilabel:`Advanced` button below the saved symbols
list. For diagrams, the option is available under the :guilabel:`Legend` tab.
The dialog provides the following options to:

* select the type of legend: |radioButtonOn| :guilabel:`Legend not enabled`,
  |radioButtonOff| :guilabel:`Separated legend items` and |radioButtonOff|
  :guilabel:`Collapsed legend`. For the latter option, you can select whether
  the legend items are aligned at the **Bottom** or at the **Center**;
* set the :ref:`symbol to use <symbol-selector>` for legend representation;
* insert the title in the legend;
* resize the classes to use: by default, QGIS provides you with a legend of
  five classes (based on natural pretty breaks) but you can apply your own
  classification using the |checkbox| :guilabel:`Manual size classes` option.
  Use the |signPlus| and |signMinus| buttons to set your custom classes
  values and labels.

A preview of the legend is displayed in the right panel of the dialog and
updated as you set the parameters. For collapsed legend, a leader line from
the horizontal center of the symbol to the corresponding legend text is drawn.

.. _figure_size_legend:

.. figure:: img/data_defined_size_legend.png
   :align: center

   Setting size scaled legend

.. note:: Currently, data-defined size legend for layer symbology can only be
  applied to point layer using single, categorized or graduated symbology.


.. index:: Paint effects
.. _draw_effects:

Draw effects
............

In order to improve layer rendering and avoid (or at least reduce)
the resort to other software for final rendering of maps, QGIS provides another
powerful functionality: the |paintEffects| :guilabel:`Draw Effects` options,
which adds paint effects for customizing the visualization of vector layers.

The option is available in the :menuselection:`Layer Properties --> Symbology` dialog,
under the :ref:`Layer rendering <layer_rendering>` group (applying to the whole
layer) or in :ref:`symbol layer properties <symbol-selector>` (applying
to corresponding features). You can combine both usage.

Paint effects can be activated by checking the |checkbox| :guilabel:`Draw effects` option
and clicking the |paintEffects| :sup:`Customize effects` button. That will open
the :guilabel:`Effect Properties` Dialog (see figure_effects_source_). The following
effect types, with custom options are available:

* **Source**: Draws the feature's original style according to the configuration
  of the layer's properties. The :guilabel:`Opacity` of its style can be adjusted
  as well as the :ref:`Blend mode <blend-modes>` and :ref:`Draw mode <draw_modes>`.
  These are common properties for all types of effects.

  .. _figure_effects_source:

  .. figure:: img/source.png
     :align: center

     Draw Effects: Source dialog

* **Blur**: Adds a blur effect on the vector layer. The custom options that you
  can change are the :guilabel:`Blur type` (:guilabel:`Stack blur (fast)` or
  :guilabel:`Gaussian blur (quality)`) and the :guilabel:`Blur strength`.

  .. _figure_effects_blur:

  .. figure:: img/blur.png
     :align: center

     Draw Effects: Blur dialog

* **Colorise**: This effect can be used to make a version of the style using one
  single hue. The base will always be a grayscale version of the symbol and you
  can:

  * Use the |selectString| :guilabel:`Grayscale` to select how to create it:
    options are 'By lightness', 'By luminosity', 'By average' and 'Off'.
  * If |checkbox| :guilabel:`Colorise` is selected, it will be possible to mix
    another color and choose how strong it should be.
  * Control the :guilabel:`Brightness`, :guilabel:`Contrast` and
    :guilabel:`Saturation` levels of the resulting symbol.

  .. _figure_effects_colorize:

  .. figure:: img/colorise.png
     :align: center

     Draw Effects: Colorize dialog

* **Drop Shadow**: Using this effect adds a shadow on the feature, which looks
  like adding an extra dimension. This effect can be customized by changing the
  :guilabel:`Offset` angle and distance, determining where the shadow shifts
  towards to and the proximity to the source object. :menuselection:`Drop Shadow`
  also has the option to change the :guilabel:`Blur radius` and the
  :guilabel:`Color` of the effect.

  .. _figure_effects_drop_shadow:

  .. figure:: img/drop_shadow.png
     :align: center

     Draw Effects: Drop Shadow dialog

* **Inner Shadow**: This effect is similar to the :guilabel:`Drop Shadow`
  effect, but it adds the shadow effect on the inside of the edges of the feature.
  The available options for customization are the same as the :guilabel:`Drop
  Shadow` effect.

  .. _figure_effects_inner_shadow:

  .. figure:: img/inner_shadow.png
     :align: center

     Draw Effects: Inner Shadow dialog

* **Inner Glow**: Adds a glow effect inside the feature. This effect can be
  customized by adjusting the :guilabel:`Spread` (width) of the glow, or
  the :guilabel:`Blur radius`. The latter specifies the proximity from
  the edge of the feature where you want any blurring to happen. Additionally,
  there are options to customize the color of the glow using a :guilabel:`Single
  color` or a :guilabel:`Color ramp`.

  .. _figure_effects_inner_glow:

  .. figure:: img/inner_glow.png
     :align: center

     Draw Effects: Inner Glow dialog

* **Outer Glow**: This effect is similar to the :guilabel:`Inner Glow` effect,
  but it adds the glow effect on the outside of the edges of the feature.
  The available options for customization are the same as the :guilabel:`Inner
  Glow` effect.

  .. _figure_effects_outer_glow:

  .. figure:: img/outer_glow.png
     :align: center

     Draw Effects: Outer Glow dialog

* **Transform**: Adds the possibility of transforming the shape of the symbol.
  The first options available for customization are the :guilabel:`Reflect
  horizontal` and :guilabel:`Reflect vertical`, which actually create a
  reflection on the horizontal and/or vertical axes. The other options are:

  * :guilabel:`Shear X,Y`: Slants the feature along the X and/or Y axis.
  * :guilabel:`Scale X,Y`: Enlarges or minimizes the feature along the X
    and/or Y axis by the given percentage.
  * :guilabel:`Rotation`: Turns the feature around its center point.
  * and :guilabel:`Translate X,Y` changes the position of the item based on
    a distance given on the X and/or Y axis.

  .. _figure_effects_transform:

  .. figure:: img/transform.png
     :align: center

     Draw Effects: Transform dialog

One or more effect types can be used at the same time. You (de)activate an effect
using its checkbox in the effects list. You can change the selected effect type by
using the |selectString| :guilabel:`Effect type` option. You can reorder the effects
using |arrowUp| :sup:`Move up` and |arrowDown| :sup:`Move down`
buttons, and also add/remove effects using the |signPlus| :sup:`Add new effect`
and |signMinus| :sup:`Remove effect` buttons.

There are some common options available for all draw effect types.
:guilabel:`Opacity` and :guilabel:`Blend mode` options work similar
to the ones described in :ref:`layer_rendering` and can be used in all draw
effects except for the transform one.

.. _draw_modes:

There is also a |selectString| :guilabel:`Draw mode` option available for
every effect, and you can choose whether to render and/or modify the
symbol, following some rules:

* Effects render from top to bottom.
* :guilabel:`Render only` mode means that the effect will be visible.
* :guilabel:`Modifier only` mode means that the effect will not be visible
  but the changes that it applies will be passed to the next effect
  (the one immediately below).
* The :guilabel:`Render and Modify` mode will make the effect visible and
  pass any changes to the next effect. If the effect is at the top of the
  effects list or if the immediately above effect is not in modify mode,
  then it will use the original source symbol from the layers properties
  (similar to source).

.. _vector_labels_tab:

Labels Properties
=================

The |labeling| :guilabel:`Labels` properties provides you with all the needed
and appropriate capabilities to configure smart labeling on vector layers. This
dialog can also be accessed from the :guilabel:`Layer Styling` panel, or using
the |labeling| :sup:`Layer Labeling Options` button of the **Labels toolbar**.

The first step is to choose the labeling method from the drop-down list.
Available methods are:

* |labelingNone| :guilabel:`No labels`: the default value, showing no labels
  from the layer
* |labeling| :guilabel:`Single labels`: Show labels on the map using a single
  attribute or an expression
* |labelingRuleBased| :ref:`Rule-based labeling <rule_based_labeling>`
* and |labelingObstacle| :guilabel:`Blocking`: allows to set a layer as just an
  obstacle for other layer's labels without rendering any labels of its own.

The next steps assume you select the |labeling| :guilabel:`Single labels`
option, opening the following dialog.

.. _figure_labels:

.. figure:: img/label_menu_text.png
   :align: center

   Layer labeling settings - Single labels

At the top of the dialog, a :guilabel:`Value` drop-down list is enabled.
You can select an attribute column to use for labeling. By default, the
:ref:`display field <maptips>` is used. Click |expression| if you want to define
labels based on expressions - See :ref:`labeling_with_expressions`.

Below are displayed options to customize the labels, under various tabs:

* |text| :ref:`Text <labels_text>`
* |labelformatting| :ref:`Formatting <labels_formatting>`
* |labelbuffer| :ref:`Buffer <labels_buffer>`
* |labelbackground| :ref:`Background <labels_background>`
* |labelshadow| :ref:`Shadow <labels_shadow>`
* |labelcallout| :ref:`Callouts <labels_callouts>`
* |labelplacement| :ref:`Placement <labels_placement>`
* |render| :ref:`Rendering <labels_rendering>`

Description of how to set each property is exposed at :ref:`showlabels`.

.. index:: Labels; Automated placement
.. _automated_placement:

Setting the automated placement engine
--------------------------------------

You can use the automated placement settings to configure a global and
automated behavior of the labels. In the top right corner of the
:guilabel:`Labels` tab, click the |autoPlacement| :sup:`Automated placement
settings (applies to all layers)` button, opening a dialog with the following
options:

.. _figure_automated_placement:

.. figure:: img/placement_engine.png
   :align: center

   The labels automated placement engine

* The :guilabel:`Number of candidates` controls how many label placement
  candidates should be generated for each feature type. The more candidates
  generated, the better the labeling will be - but at a cost of rendering
  speed. Smaller number of candidates results in less labels placed but faster
  redraws.
* :guilabel:`Text rendering`: sets the default value for label rendering
  widgets when :ref:`exporting a map canvas <exportingmapcanvas>` or
  :ref:`a layout <create-output>` to PDF or SVG.
  If :guilabel:`Always render labels as text` is selected then labels can be
  edited in external applications (e.g. Inkscape) as normal text. BUT the side
  effect is that the rendering quality is decreased, and there are issues with
  rendering when certain text settings like buffers are in place. That's why
  :guilabel:`Always render labels as paths (recommended)` which exports labels
  as outlines, is recommended.
* |checkbox| :guilabel:`Allow truncated labels on edges of map`: controls
  whether labels which fall partially outside of the map extent should be
  rendered. If checked, these labels will be shown (when there's no way to
  place them fully within the visible area). If unchecked then partially
  visible labels will be skipped. Note that this setting has no effects on
  labels' display in the :ref:`layout map item <layout_map_item>`.
* |unchecked| :guilabel:`Show all labels for all layers (i.e. including
  colliding objects)`. Note that this option can be also set per layer (see
  :ref:`labels_rendering`)
* |unchecked| :guilabel:`Show unplaced labels`: allows to determine whether any
  important labels are missing from the maps (e.g. due to overlaps or other
  constraints). They are displayed using a customizable color.
* |unchecked| :guilabel:`Show candidates (for debugging)`: controls whether boxes
  should be drawn on the map showing all the candidates generated for label placement.
  Like the label says, it's useful only for debugging and testing the effect different
  labeling settings have. This could be handy for a better manual placement with
  tools from the :ref:`label toolbar <label_toolbar>`.


.. _rule_based_labeling:

Rule-based labeling
-------------------

With rule-based labeling multiple label configurations can be defined
and applied selectively on the base of expression filters and scale range, as in
:ref:`Rule-based rendering <rule_based_rendering>`.

To create a rule, select the |labelingRuleBased| **Rule-based labeling** option in the main
drop-down list from the :guilabel:`Labels` tab and click the |signPlus| button
at the bottom  of the dialog. Then fill the new dialog with a description and an
expression to filter features. You can also set a :ref:`scale range
<label_scaledepend>` in which the label rule should be applied. The other
options available in this dialog are the :ref:`common settings <showlabels>`
seen beforehand.

.. _figure_labels_rule_settings:

.. figure:: img/label_rule_settings.png
   :align: center

   Rule settings

A summary of existing rules is shown in the main dialog (see figure_labels_rule_based_).
You can add multiple rules, reorder or imbricate them with a drag-and-drop.
You can as well remove them with the |signMinus| button or edit them with
|projectProperties| button or a double-click.

.. _figure_labels_rule_based:

.. figure:: img/label_rules_panel.png
   :align: center

   Rule based labeling panel


.. index::
   pair: Expression; Labels
.. _labeling_with_expressions:

Define labels based on expressions
----------------------------------

Whether you choose single or rule-based labeling type, QGIS allows using
expressions to label features.

Assuming you are using the :guilabel:`Single labels` method, click the
|expression| button near the :guilabel:`Value` drop-down list in the
|labeling| :guilabel:`Labels` tab of the properties dialog.

In figure_labels_expression_, you see a sample expression to label the alaska
trees layer with tree type and area, based on the field 'VEGDESC', some
descriptive text, and the function ``$area`` in combination with
``format_number()`` to make it look nicer.

.. _figure_labels_expression:

.. figure:: img/label_expression.png
   :align: center

   Using expressions for labeling

Expression based labeling is easy to work with. All you have to take
care of is that:

* You may need to combine all elements (strings, fields, and functions)
  with a string concatenation function such as ``concat``, ``+`` or ``||``. Be
  aware that in some situations (when null or numeric value are involved) not
  all of these tools will fit your need.
* Strings are written in 'single quotes'.
* Fields are written in "double quotes" or without any quote.

Let's have a look at some examples:

#. Label based on two fields 'name' and 'place' with a comma as separator::

   "name" || ', ' || "place"

   Returns::

      John Smith, Paris

#. Label based on two fields 'name' and 'place' with other texts:

   .. code-block:: none

      'My name is ' + "name" + 'and I live in ' + "place"
      'My name is ' || "name" || 'and I live in ' || "place"
      concat('My name is ', name, ' and I live in ', "place")

   Returns::

      My name is John Smith and I live in Paris

#. Label based on two fields 'name' and 'place' with other texts combining
   different concatenation functions:

   .. code-block:: none

      concat('My name is ', name, ' and I live in ' || place)

   Returns::

      My name is John Smith and I live in Paris

   Or, if the field 'place' is NULL, returns::

      My name is John Smith

#. Multi-line label based on two fields 'name' and 'place' with a
   descriptive text:

   .. code-block:: none

      concat('My name is ', "name", '\n' , 'I live in ' , "place")

   Returns::

      My name is John Smith
      I live in Paris

#. Label based on a field and the $area function to show the place's name
   and its rounded area size in a converted unit:

   .. code-block:: none

      'The area of ' || "place" || ' has a size of '
      || round($area/10000) || ' ha'

   Returns::

      The area of Paris has a size of 10500 ha

#. Create a CASE ELSE condition. If the population value in field
   `population` is <= 50000 it is a town, otherwise it is a city:

   .. code-block:: none

      concat('This place is a ',
      CASE WHEN "population" <= 50000 THEN 'town' ELSE 'city' END)

   Returns::

      This place is a town

#. Display name for the cities and no label for the other features
   (for the "city" context, see example above):

   .. code-block:: none

      CASE WHEN "population" > 50000 THEN "NAME" END

   Returns::

      Paris

As you can see in the expression builder, you have hundreds of functions available
to create simple and very complex expressions to label your data in QGIS. See
:ref:`vector_expressions` chapter for more information and examples on expressions.

.. index::
   single: Labels; Custom placement
   pair: Data-defined override; Labels
.. _data_defined_labeling:

Using data-defined override for labeling
----------------------------------------

With the |dataDefined| :sup:`Data defined override` function, the settings for
the labeling are overridden by entries in the attribute table or expressions
based on them. This feature can be used to
set values for most of the labeling options described above.

For example, using the Alaska QGIS sample dataset, let's label the :file:`airports`
layer with their name, based on their militarian ``USE``, i.e. whether the airport
is accessible to :

* military people, then display it in gray color, size 8;
* others, then show in blue color, size 10.

To do this, after you enabled the labeling on the ``NAME`` field of the layer
(see :ref:`showlabels`):

#. Activate the :guilabel:`Text` tab.
#. Click on the |dataDefined| icon next to the :guilabel:`Size` property.
#. Select :guilabel:`Edit...` and type::

    CASE
      WHEN "USE" like '%Military%' THEN 8 -- because compatible values are 'Military'
                                          -- and 'Joint Military/Civilian'
      ELSE 10
    END

#. Press :guilabel:`OK` to validate. The dialog closes and the |dataDefined| button
   becomes |dataDefineExpressionOn| meaning that an rule is being run.
#. Then click the button next to the color property, type the expression below
   and validate::

    CASE
      WHEN "USE" like '%Military%' THEN '150, 150, 150'
      ELSE '0, 0, 255'
    END

Likewise, you can customize any other property of the label, the way you want.
See more details on the |dataDefined| :sup:`Data-define override` widget's
description and manipulation in :ref:`data_defined` section.

.. _figure_labels_attribute_data_defined:

.. figure:: img/label_attribute_data_defined.png
   :align: center

   Airports labels are formatted based on their attributes

.. tip:: **Use the data-defined override to label every part of multi-part features**

   There is an option to set the labeling for multi-part features independently from
   your label properties. Choose the  |render| :ref:`Rendering <labels_rendering>`,
   ``Feature options``, go to the |dataDefined| :sup:`Data-define override` button
   next to the checkbox |unchecked| :guilabel:`Label every part of multipart-features`
   and define the labels as described in :ref:`data_defined`.


.. _label_toolbar:

The Label Toolbar
.................

The :guilabel:`Label Toolbar` provides some tools to manipulate |labeling|
:ref:`label <vector_labels_tab>` or |diagram| :ref:`diagram <sec_diagram>`
properties.

.. _figure_labels_tools:

.. figure:: img/diagram_toolbar.png
   :align: center

   The Label toolbar

While for readability, ``label`` has been used below to describe the Label
toolbar, note that when mentioned in their name, the tools work almost the
same way with diagrams:

* |pinLabels| :sup:`Pin/Unpin Labels And Diagrams`. By clicking or draging an
  area, you pin label(s). If you click or drag an area holding :kbd:`Shift`,
  label(s) are unpinned. Finally, you can also click or drag an area holding
  :kbd:`Ctrl` to toggle the pin status of label(s).
* |showPinnedLabels| :sup:`Highlight Pinned Labels And Diagrams`. If the
  vector layer of the label is editable, then the highlighting is green,
  otherwise it's blue.
* |showUnplacedLabel| :sup:`Toggles Display of Unplaced Labels`: Allows to
  determine whether any important labels are missing from the maps (e.g. due
  to overlaps or other constraints). They are displayed with a customizable
  color (see :ref:`automated_placement`).
* |showHideLabels| :sup:`Show/Hide Labels And Diagrams`. If you click on the labels,
  or click and drag an area holding :kbd:`Shift`, they are hidden.
  When a label is hidden, you just have to click on the feature to restore its
  visibility. If you drag an area, all the labels in the area will be restored.
* |moveLabel| :sup:`Move Label And Diagram`. You just have to drag the label to
  the desired place.
* |rotateLabel| :sup:`Rotate Label`. Click the label and move around and
  you get the text rotated.
* |changeLabelProperties| :sup:`Change Label`. It opens a dialog to change the
  clicked label properties; it can be the label itself, its coordinates, angle,
  font, size... as long as this property has been mapped to a field. Here you can
  set the option to |checkbox| :guilabel:`Label every part of a feature`.

.. warning:: **Label tools overwrite current field values**

  Using the :guilabel:`Label toolbar` to customize the labeling actually writes
  the new value of the property in the mapped field. Hence, be careful to not
  inadvertently replace data you may need later!

.. note::

  The :ref:`vector_auxiliary_storage` mechanism may be used to customize
  labeling (position, and so on) without modifying the underlying data source.

Customize the labels from the map canvas
........................................

Combined with the :guilabel:`Label Toolbar`, the data defined override setting
helps you manipulate labels in the map canvas (move, edit, rotate).
We now describe an example using the data-defined override function for the
|moveLabel|:sup:`Move label` function (see figure_labels_coordinate_data_defined_).

#. Import :file:`lakes.shp` from the QGIS sample dataset.
#. Double-click the layer to open the Layer Properties. Click on :guilabel:`Labels`
   and :guilabel:`Placement`. Select |radioButtonOn| :guilabel:`Offset from centroid`.
#. Look for the :guilabel:`Data defined` entries. Click the |dataDefined| icon
   to define the field type for the :guilabel:`Coordinate`. Choose ``xlabel``
   for X and ``ylabel`` for Y. The icons are now highlighted in yellow.

   .. _figure_labels_coordinate_data_defined:

   .. figure:: img/label_coordinate_data_defined.png
      :align: center

      Labeling of vector polygon layers with data-defined override

#. Zoom into a lake.
#. Set editable the layer using the |toggleEditing| :sup:`Toggle Editing` button.
#. Go to the Label toolbar and click the |moveLabel| icon.
   Now you can shift the label manually to another position (see figure_labels_move_).
   The new position of the label is saved in the ``xlabel`` and ``ylabel`` columns
   of the attribute table.
#. Using :ref:`geometry_generator_symbol` with the expression below, you can
   also add a linestring symbol layer to connect each lake to its moved label:

   ::

      make_line( centroid( $geometry ), make_point( "xlabel", "ylabel" ) )


   .. _figure_labels_move:

   .. figure:: img/move_label.png
      :align: center

      Moved labels

.. note::

  The :ref:`vector_auxiliary_storage` mechanism may be used with data-defined
  properties without having an editable data source.


.. index:: Diagrams
.. _`sec_diagram`:

Diagrams Properties
===================

|diagram| The :guilabel:`Diagrams` tab allows you to add a graphic overlay to
a vector layer (see figure_diagrams_attributes_).

The current core implementation of diagrams provides support for:

* |diagramNone| :guilabel:`No diagrams`: the default value with no diagram
  displayed over the features;
* |piechart| :guilabel:`Pie charts`, a circular statistical graphic divided into
  slices to illustrate numerical proportion. The arc length of each slice is
  proportional to the quantity it represents;
* |text| :guilabel:`Text diagrams`, a horizontaly divided circle showing statistics
  values inside;
* and |histogram| :guilabel:`Histograms`.

In the top right corner of the :guilabel:`Diagrams` tab, the |autoPlacement|
:sup:`Automated placement settings (applies to all layers)` button provides
means to control diagram :ref:`labels placement <automated_placement>` on the
map canvas.

.. tip:: **Switch quickly between types of diagrams**

   Given that the settings are almost common to the different types of
   diagram, when designing your diagram, you can easily change the diagram type
   and check which one is more appropriate to your data without any loss.

For each type of diagram, the properties are divided into several tabs:

* :ref:`Attributes <diagram_attributes>`
* :ref:`Rendering <diagram_appearance>`
* :ref:`Size <diagram_size>`
* :ref:`Placement <diagram_placement>`
* :ref:`Options <diagram_options>`
* :ref:`Legend <diagram_legend>`

.. _diagram_attributes:

Attributes
----------

:guilabel:`Attributes` defines which variables to display in the diagram.
Use |signPlus| :sup:`add item` button to select the desired fields into
the 'Assigned Attributes' panel. Generated attributes with :ref:`vector_expressions`
can also be used.

You can move up and down any row with click and drag, sorting how attributes
are displayed. You can also change the label in the 'Legend' column
or the attribute color by double-clicking the item.

This label is the default text displayed in the legend of the print layout
or of the layer tree.

.. _figure_diagrams_attributes:

.. figure:: img/diagram_tab.png
   :align: center

   Diagram properties  - Attributes tab

.. _diagram_appearance:

Rendering
----------

:guilabel:`Rendering` defines how the diagram looks like. It provides
general settings that do not interfere with the statistic values such as:

* the graphic's opacity, its outline width and color;
* and, depending on the type of diagram:

  * the width of the bar in case of histogram;
  * the circle background color in case of text diagram, and the font used for texts;
  * the orientation of the left line of the first slice represented in pie chart.
    Note that slices are displayed clockwise.

In this tab, you can also manage and fine tune the diagram visibility with
different options:

* :guilabel:`Diagram z-index`: controls how diagrams are drawn on top of each
  other and on top of labels. A diagram with a high index is drawn over diagrams
  and labels;
* |checkbox| :guilabel:`Show all diagrams`: shows all the diagrams even if they
  overlap each other;
* :guilabel:`Show diagram`: allows only specific diagrams to be rendered;
* :guilabel:`Always Show`: selects specific diagrams to always render, even when
  they overlap other diagrams or map labels;
* setting the :ref:`Scale dependent visibility <label_scaledepend>`;
* :guilabel:`Discourage diagrams and labels from covering features`: defines
  features to use as obstacles, ie QGIS will try to not place diagrams nor labels
  over these features.


.. _figure_diagrams_appearance:

.. figure:: img/diagram_tab_appearance.png
   :align: center

   Diagram properties - Rendering tab

.. _diagram_size:

Size
----

:guilabel:`Size` is the main tab to set how the selected statistics are
represented. The diagram size units can be 'Millimeter', 'Points', Pixels,
'Map Units' or 'Inches'.
You can use :

* :guilabel:`Fixed size`, an unique size to represent the graphic of all the
  features, except when displaying histogram
* or :guilabel:`Scaled size`, based on an expression using layer attributes.

.. ToDo: better explain the scale behaviour of the different diagram types

.. _figure_diagrams_size:

.. figure:: img/diagram_tab_size.png
   :align: center

   Diagram properties - Size tab

.. _diagram_placement:

Placement
---------

:guilabel:`Placement` helps to define diagram position.
According to the layer geometry type, it offers different options for the placement:

* 'Over the point' or 'Around the point' for point geometry.
  The latter variable requires a radius to follow.
* 'Over the line' or 'Around the line' for line geometry. Like point feature,
  the last variable requires a distance to respect and user can specify the
  diagram placement relative to the feature ('above', 'on' and/or 'below' the line)
  It's possible to select several options at once.
  In that case, QGIS will look for the optimal position of the diagram. Remember that
  here you can also use the line orientation for the position of the diagram.
* 'Over the centroid', 'Around the centroid' (with a distance set),
  'Perimeter' and anywhere 'Inside polygon' are the options for polygon features.

The diagram can also be placed using feature data to fill the coordinates ``X``
and ``Y`` fields.

The placement of the diagrams can interact with the labeling, so you can
detect and solve position conflicts between diagrams and labels by setting
the **Priority** slider value.

.. _figure_diagrams_placement:

.. figure:: img/diagram_tab_placement.png
   :align: center

   Vector properties dialog with diagram properties, Placement tab

.. _diagram_options:

Options
-------

The :guilabel:`Options` tab has settings only in case of histogram. You can
choose whether the bar orientation should be 'Up', 'Down', 'Right' and 'Left'.

.. ToDo: explain the behaviour of this option

.. index:: Size legend, Diagram legend
.. _diagram_legend:

Legend
-------

From the :guilabel:`Legend` tab, you can choose to display items of the diagram
in the :ref:`label_legend`, and in the :ref:`print layout legend <layout_legend_item>`,
next to the layer symbology:

* check :guilabel:`Show legend entries for diagram attributes` to display in the
  legends the ``Color`` and ``Legend`` properties, as previously assigned in the
  :guilabel:`Attributes` tab;
* and, when a :ref:`scaled size <diagram_size>` is being used for the diagrams,
  push the :guilabel:`Legend Entries for Diagram Size...` button to configure the
  diagram symbol aspect in the legends. This opens the :guilabel:`Data-defined
  Size Legend` dialog whose options are described in :ref:`data_defined_size_legend`.

When set, the diagram legend items (attributes with color and diagram size)
are also displayed in the print layout legend, next to the layer symbology.


Case Study
----------

We will demonstrate an example and overlay on the Alaska boundary layer a
text diagram showing temperature data from a climate vector layer.
Both vector layers are part of the QGIS sample dataset (see section
:ref:`label_sampledata`).

#. First, click on the |addOgrLayer| :sup:`Load Vector` icon, browse
   to the QGIS sample dataset folder, and load the two vector shape layers
   :file:`alaska.shp` and :file:`climate.shp`.
#. Double click the ``climate`` layer in the map legend to open the
   :guilabel:`Layer Properties` dialog.
#. Click on the :guilabel:`Diagrams` tab and from the :guilabel:`Diagram type`
   |selectString| combo box, select 'Text diagram'.
#. In the :guilabel:`Appearance` tab, we choose a light blue as background color,
   and in the :guilabel:`Size` tab, we set a fixed size to 18 mm.
#. In the :guilabel:`Position` tab, placement could be set to 'Around Point'.
#. In the diagram, we want to display the values of the three columns
   ``T_F_JAN``, ``T_F_JUL`` and ``T_F_MEAN``. So, in the :guilabel:`Attributes` tab
   first select ``T_F_JAN`` and click the |signPlus| button, then repeat with
   ``T_F_JUL`` and finally ``T_F_MEAN``.
#. Now click :guilabel:`Apply` to display the diagram in the QGIS main window.
#. You can adapt the chart size in the :guilabel:`Size` tab. Activate the
   |radioButtonOn| :guilabel:`Scaled size` and set the size of the diagrams on
   the basis of the :guilabel:`maximum value` of an attribute and the
   :guilabel:`Size` option.
   If the diagrams appear too small on the screen, you can activate the
   |checkbox| :guilabel:`Increase size of small diagrams` checkbox and define
   the minimum size of the diagrams.
#. Change the attribute colors by double clicking on the color values in the
   :guilabel:`Assigned attributes` field.
   Figure_diagrams_mapped_ gives an idea of the result.
#. Finally, click :guilabel:`OK`.

.. _figure_diagrams_mapped:

.. figure:: img/climate_diagram.png
   :align: center
   :width: 25em

   Diagram from temperature data overlayed on a map

Remember that in the :guilabel:`Position` tab, a |checkbox| :guilabel:`Data
defined position` of the diagrams is possible. Here, you can use attributes
to define the position of the diagram.
You can also set a scale-dependent visibility in the :guilabel:`Appearance` tab.

The size and the attributes can also be an expression.
Use the |expression| button to add an expression.
See :ref:`vector_expressions` chapter for more information and example.

Using data-defined override
---------------------------

As mentioned above, you can use some custom data-defined to tune the diagrams
rendering:

* position in :guilabel:`Placement` tab by filling ``X`` and ``Y`` fields
* visibility in :guilabel:`Appearance` tab by filling the ``Visibility`` field

See :ref:`data_defined_labeling` for more information.

.. index:: 3d view properties
.. _`sec_3_d_view`:

3D View Properties
=======================

|3d| The :guilabel:`3D View` tab provides settings for vector layers that should
be depicted in the :ref:`3D Map view <label_3dmapview>` tool.

To display a layer in 3D, select from the combobox at the top of the tab, either:

* :guilabel:`Single symbol`: features are rendered using a common symbol whose
  properties can be :ref:`data-defined <data_defined>` or not
* :guilabel:`Rule-based`: multiple symbol configurations can be defined and applied
  selectively based on expression filters and scale range.
  More details on how-to at :ref:`Rule-based rendering <rule_based_rendering>`.

Depending on the layer geometry type, various properties are available for 3D
rendering.

.. _figure_3dview_properties:

.. figure:: img/3d_view_properties.png
   :align: center

   3D properties of a polygon layer

Point Layers
------------
	
* You can define different simple 3D shapes like :guilabel:`Sphere`, :guilabel:`Cylinder`,
  :guilabel:`Cube`, :guilabel:`Cone`, :guilabel:`Plane` and :guilabel:`Torus`
  defined by their :guilabel:`Radius`, :guilabel:`Size` or :guilabel:`Length`.
  The unit of size of the 3D shapes refers to the CRS of the project.
* The shading of the 3D shapes can be defined by the menus :guilabel:`Diffuse`,
  :guilabel:`Ambient`, :guilabel:`Specular` and :guilabel:`Shininess`
  (see https://en.wikipedia.org/wiki/Phong_reflection_model#Description)
* If you choose :guilabel:`3D Model`, the location will be determined
  by a simple point coordinate.
* For visualizing 3D point clouds you can use :guilabel:`Billboard` Shapes
  defined by the :guilabel:`Billboard Height`, :guilabel:`Billboard symbol` and
  :guilabel:`Altitude clamping`. The symbol will have a stable size.
* :guilabel:`Altitude clamping` can be set to :guilabel:`Absolute`, :guilabel:`Relative`
  or :guilabel:`Terrain`. The :guilabel:`Absolute` setting can be used when height values
  of the 3d vectors are provided as absolute measures from 0. :guilabel:`Relative` and
  :guilabel:`Terrain` add given elevation values to the underlying terrain elevation.
* :guilabel:`Translation` can be used to move objects in x, y and z axis.
* You can define a :guilabel:`Scale factor` for the 3D shape as well as a
  :guilabel:`Rotation` around the x-, y- and z-axis.


Line layers
-----------
	
* Beneath the :guilabel:`Width` and :guilabel:`Height` settings you can
  define the :guilabel:`Extrusion` of the vector lines. If the lines do not have
  z-values, you can define the 3d volumes with this setting.
* With the :guilabel:`Altitude clamping` you define the position of the
  3D lines relative to the underlying terrain surface, if you have included
  raster elevation data or other 3D vectors.
* The :guilabel:`Altitude binding` defines how the feature is clamped to the
  terrain. Either every :guilabel:`Vertex` of the feature will be clamped
  to the terrain or this will be done by the :guilabel:`Centroid`.
* It is possible to |checkbox|:guilabel:`Render as simple 3D lines`.
* The shading can be defined in the menus :guilabel:`Diffuse`, :guilabel:`Ambient`,
  :guilabel:`Specular` and :guilabel:`Shininess`.

Polygon Layers
--------------
	
* As for the other ones, :guilabel:`Height` can be defined in CRS units.
* Again, :guilabel:`Extrusion` is possible for missing z-values.
* The :guilabel:`Altitude clamping`, :guilabel:`Altitude binding` can be defined
  as explained above.
* There is an additional option to |checkbox|:guilabel:`Add back faces`
  and |checkbox|:guilabel:`Invert normals`.
* You can define |checkbox|:guilabel:`Edges` by :guilabel:`Width` and :guilabel:`Color`.


Application example
-------------------

To go through the settings explained above you can have a look at
https://public.cloudmergin.com/projects/saber/luxembourg/tree.


.. index:: Fields, Forms
.. _vector_fields_menu:

Fields Properties
=================

|sourceFields| The :guilabel:`Fields` tab provides information on
fields related to the layer and helps you organize them.

The layer can be made :ref:`editable <editingvector>` using the |toggleEditing|
:sup:`Toggle editing mode`. At this moment, you can modify its structure using
the |newAttribute| :sup:`New field` and |deleteAttribute| :sup:`Delete field`
buttons.

You can also rename fields by double-clicking its name. This is only supported
for data providers like PostgreSQL, Oracle, Memory layer and some OGR layer
depending on the OGR data format and version.

If set in the underlying data source or in the :ref:`forms properties
<configure_field>`, the field's alias is also displayed. An alias is a human
readable field name you can use in the feature form or the attribute table.
Aliases are saved in the project file.

Depending on the data provider, you can associate a comment with a field, for
example at its creation. This information is retrieved and shown in the
:guilabel:`Comment` column and is later displayed when hovering over the
field label in a feature form.

Other than the fields contained in the dataset, virtual fields and
:ref:`Auxiliary Storage <vector_auxiliary_storage>` included, the
:guilabel:`Fields` tab also lists fields from any :ref:`joined layers <sec_joins>`.
Depending on the origin of the field, a different background color is applied to it.

For each listed field, the dialog also lists read-only characteristics such as
its ``type``, ``type name``, ``length`` and ``precision``. When serving the
layer as ``WMS`` or ``WFS``, you can also check here which fields could be retrieved.

.. _figure_fields_tab:

.. figure:: img/fields_properties.png
   :align: center

   Fields properties tab


.. _vector_attributes_menu:

Attributes Form Properties
==========================

|formView| The :guilabel:`Attributes Form` tab helps you set up the form to
display when creating new features or querying existing one. You can define:

* the look and the behavior of each field in the feature form or the attribute
  table (label, widget, constraints...);
* the form's structure (custom or autogenerated):
* extra logic in Python to handle interaction with the form or field widgets.

At the top right of the dialog, you can set whether the form is opened by
default when creating new features. This can be configured per layer or globally
with the :guilabel:`Suppress attribute form pop-up after feature creation`
option in the :menuselection:`Settings --> Options --> Digitizing` menu.

.. index:: Form, Built-in form, Custom form
.. _customize_form:

Customizing a form for your data
--------------------------------

By default, when you click on a feature with the |identify| :sup:`Identify
Features` tool or switch the attribute table to the *form view* mode, QGIS
displays a basic form with predefined widgets (generally spinboxes and
textboxes --- each field is represented on a dedicated row by its label next
to the widget). If :ref:`relations <vector_relations>` are set on the layer,
fields from the referencing layers are shown in an embedded frame
at the bottom of the form, following the same basic structure.

This rendering is the result of the default ``Autogenerate`` value of the
:guilabel:`Attribute editor layout` setting in the :menuselection:`Layer
properties --> Attributes Form` tab. This property holds three different
values:

* ``Autogenerate``: keeps the basic structure of "one row - one field" for the
  form but allows to customize each corresponding widget.
* ``Drag-and-drop designer``: other than widget customization, the form
  structure can be made more complex eg, with widgets embedded in groups and
  tabs.
* ``Provide ui file``: allows to use a Qt designer file, hence a potentially
  more complex and fully featured template, as feature form.

The autogenerated form
......................

When the ``Autogenerate`` option is on, the :guilabel:`Available widgets` panel
shows lists of fields (from the layer and its relations) that would be shown in
the form. Select a field and you can configure its appearance and behavior in
the right panel:

* adding :ref:`custom label and automated checks <configure_field>` to the field;
* setting a :ref:`particular widget <edit_widgets>` to use.

.. TODO: we should insert a screenshot showing the default form here

.. _drag_drop_designer:

The drag and drop designer
..........................

The drag and drop designer allows you to create a form with several containers
(tabs or groups) to present the attribute fields, as shown for example
in figure_fields_form_.

.. _figure_fields_form:

.. figure:: img/resulting_feature_form.png
   :align: center

   Resulting built-in form with tabs and named groups

#. Choose ``Drag and drop designer`` from the :guilabel:`Select attribute layout
   editor` combobox. This enables the :guilabel:`Form Layout` panel next to the
   :guilabel:`Available widgets` panel, filled with existing fields.
   The selected field displays its :ref:`properties <configure_field>` (that you
   can customize) in a third panel.
#. Select fields you do not want to use in your :guilabel:`Form Layout`
   panel and hit the |signMinus| button to remove them. Drag and drop fields
   from the other panel to re-add them. The same field can be added multiple times.
#. Drag and drop fields within the :guilabel:`Form Layout` panel to reorder
   their position.
#. Add containers (tab or group frames) to associate fields that belong to
   the same category and better structure the form.

   #. The first step is to use the |signPlus| icon to create a tab in which
      fields and groups will be displayed
   #. Then set the properties of the container, ie:

      * the name
      * the type, ie a :guilabel:`tab` or a :guilabel:`group in container`
        (a group inside a tab or another group)
      * and the :guilabel:`number of columns` the embedded fields
        should be distributed over

      .. _figure_fields_layout:

      .. figure:: img/attribute_editor_layout.png
         :align: center

         Dialog to create containers with the **Attribute editor layout**

      These, and other properties can later be updated by selecting the item and,
      from the third panel:

      * hide or show the container's label
      * display the container as a group box (only available for tabs).
      * rename the container
      * set the number of columns
      * enter an expression to control the container's visibility.
        The expression will be re-evaluated every time values in the form change,
        and the tab or group box shown/hidden accordingly
      * add a background color
   #. You can create as many containers as you want; press
      the |signPlus| icon again to create another tab or a group frame under
      an existing tab.

#. The next step is to assign the relevant fields to each container,
   by simple drag and drop. Groups and tabs can also be moved in the same way.
#. In case the layer is involved in a :ref:`one or many to many relation
   <vector_relations>`, drag-and-drop the relation name from the
   :guilabel:`Available widgets` panel to the :guilabel:`Form Layout` panel.
   The associated layer attribute form will be embedded at the chosen place
   in the current layer's form. As for the other items, select the relation label
   to configure some properties:

   * hide or show the relation label
   * show the link button
   * show the unlink button

#. Apply the layer's properties dialog
#. Open a feature attribute form (eg, using the |identify| :sup:`Identify features`
   tool) and it should display the new form.


.. _provide_ui_file:

Using custom ui-file
....................

The ``Provide ui-file`` option allows you to use complex dialogs made with
Qt-Designer. Using a UI-file allows a great deal of freedom in creating a
dialog. Note that, in order to link the graphical objects (textbox,
combobox...) to the layer's fields, you need to give them the same name.

Use the :guilabel:`Edit UI` to define the path to the file to use.

You'll find some example in the :ref:`Creating a new form <creating-new-form>`
lesson of the :ref:`QGIS-training-manual-index-reference`. For more advanced information,
see https://nathanw.net/2011/09/05/qgis-tips-custom-feature-forms-with-python-logic/.

.. _form_custom_functions:

Enhance your form with custom functions
.......................................

QGIS forms can have a Python function that is called when the dialog is opened.
Use this function to add extra logic to your dialogs. The form code can be
specified in three different ways:

* ``load from the environment``: use a function, for example in
  :file:`startup.py` or from an installed plugin
* ``load from an external file``: a file chooser will let you
  select a Python file from your filesystem or enter a URL for a remote file.
* ``provide code in this dialog``: a Python editor will appear where you can
  directly type the function to use.

In all cases you must enter the name of the function that will be called
(``open`` in the example below).

An example is (in module MyForms.py):

::

  def open(dialog,layer,feature):
      geom = feature.geometry()
      control = dialog.findChild(QWidged,"My line edit")

Reference in Python Init Function like so: ``open``

.. index:: Edit widget, Field configuration
.. _configure_field:

Configure the field behavior
----------------------------

The main part of the :guilabel:`Attributes Form` tab helps you set the
type of widget used to fill or display values of the field, in the attribute
table or the feature form: you can define how user interacts with each field
and the values or range of values that are allowed to be added to each.

.. _figure_fields_widget:

.. figure:: img/edit_widgets_dialog.png
   :align: center

   Dialog to select an edit widget for an attribute column


.. index:: Default values, Fields constraints, Alias

Common settings
...............

Regardless the type of widget applied to the field, there are some common
properties you can set to control whether and how a field can be edited.

Widget display
^^^^^^^^^^^^^^^

:guilabel:`Show label`: indicates whether the field name should be displayed
in the form.

General options
^^^^^^^^^^^^^^^

* :guilabel:`Alias`: a human readable name to use for fields. The alias will be
  displayed in the feature form, the attribute table, or in the :guilabel:`Identify
  results` panel.
  It can also be used as field name replacement in the :ref:`expression builder
  <vector_expressions>`, easing expressions understanding and reviews.
  Aliases are saved in project file.
* :guilabel:`Comment`: displays the field's comment as shown in the
  :guilabel:`Fields` tab, in a read-only state. This information is shown as
  tooltip when hovering over the field label in a feature form.
* |checkbox| :guilabel:`Editable`: uncheck this option to set the field read-only
  (not manually modifiable) even when the layer is in edit mode. Note that
  checking this setting doesn't override any edit limitation from the provider.
* |checkbox| :guilabel:`Label on top`: places the field name above or beside
  the widget in the feature form.

Default values
^^^^^^^^^^^^^^

* :guilabel:`Default value`: for new features, automatically populates by default
  the field with a predefined value or an :ref:`expression-based one <vector_expressions>`.
  For example, you can:

  * use ``$x``, ``$length``, ``$area`` to automatically populate a field with the
    feature's X coordinate, length, area or any geometric information at its creation;
  * increment a field by 1 for each new feature using ``maximum("field")+1``;
  * save the feature creation datetime using ``now()``;
  * use :ref:`variables <general_tools_variables>` in expressions, making it
    easier to e.g. insert the operator name (``@user_full_name``), the project
    file path (``@project_path``), ...

  A preview of the resulting default value is displayed at the bottom of the widget.

  .. note:: The ``Default value`` option is not aware of the values in any other
    field of the feature being created so it won't be possible to use an expression
    combining any of those values i.e using an expression like ``concat(field1, field2)``
    may not work.

* |checkbox| :guilabel:`Apply default value on update`: whenever the feature
  attribute or geometry is changed, the default value is recalculated. This
  could be handy to save values like last user that modifies data, last time it
  was changed...


Constraints
^^^^^^^^^^^

You can constrain the value to insert in the field. This constraint can be:

* |checkbox| :guilabel:`Not null`: requires the user to provide a value;
* |checkbox| :guilabel:`Unique`: guarantee the inserted value to be unique
  throughout the field;
* based on a custom :guilabel:`expression`: e.g. ``regexp_match(col0,'A-Za-z')``
  to ensure that the value of the field *col0* has only alphabetical letter.
  A short description can be added to help you remember the constraint.

Whenever a value is added or edited in a field, it's submitted to the existing
constraints and:

* if it meets all the requirements, a green check is shown beside the field
  in the form;
* if it does not meet all the requirements, then a yellow or red cross is
  displayed near the field. You can hover over the cross to remind which
  constraints are applied to the field and fix the value:

  * A yellow cross appears when the unmet constraint is an unenforced one
    and it does not prevent you to save the changes with the "wrong"
    values;
  * A red cross can not be ignored and does not allow you to save your
    modifications until they meet the constraints. It appears when the
    |checkbox| :guilabel:`Enforce constraint` option is checked.


.. _edit_widgets:

Edit widgets
............

Based on the field type, QGIS automatically determines and assigns a default
widget type to it. You can then replace the widget with any other compatible
with the field type. The available widgets are:

* **Checkbox**: Displays a checkbox whose state defines the value to insert.
* **Classification**: Only available when a :ref:`categorized symbology
  <categorized_renderer>` is applied to the layer, displays a combo box with
  the values of the classes.
* **Color**: Displays a :ref:`color widget <color-selector>` allowing to select
  a color; the color value is stored as a html notation in the attribute table.
* **Date/Time**: Displays a line field which can open a calendar widget to enter
  a date, a time or both. Column type must be text. You can select a custom
  format, pop-up a calendar, etc.
* **Enumeration**: Opens a combo box with predefined values fetched from the
  database. This is currently only supported by the PostgreSQL provider, for
  fields of ``enum`` type.
* **Attachment**: Uses a "Open file" dialog to store file path in a
  relative or absolute mode. It can also be used to display a hyperlink (to
  document path), a picture or a web page.
* **Hidden**: A hidden attribute column is invisible. The user is not able
  to see its contents.
* **Key/Value**: Displays a two-columns table to store sets of key/value
  pairs within a single field. This is currently supported by the PostgreSQL
  provider, for fields of ``hstore`` type.
* **List**: Displays a single column table to add different values within a
  single field. This is currently supported by the PostgreSQL provider,
  for fields of ``array`` type.
* **Range**: Allows you to set numeric values from a specific range. The edit
  widget can be either a slider or a spin box.
* **Relation Reference**: This widget lets you embed the feature form of the
  referenced layer on the feature form of the actual layer.
  See :ref:`vector_relations`.
* **Text Edit** (default): This opens a text edit field that allows simple
  text or multiple lines to be used. If you choose multiple lines you
  can also choose html content.
* **Unique Values**: You can select one of the values already used in
  the attribute table. If 'Editable' is activated, a line edit is shown with
  autocompletion support, otherwise a combo box is used.
* **Uuid Generator**: Generates a read-only UUID (Universally Unique Identifiers)
  field, if empty.
* **Value Map**: A combo box with predefined items. The value is stored in
  the attribute, the description is shown in the combo box. You can define
  values manually or load them from a layer or a CSV file.
* **Value Relation**: Offers values from a related table in a combobox. You can
  select layer, key column and value column. Several options are available to
  change the standard behaviors: allow null value, order by value, allow
  multiple selections and use of auto-completer. The forms will display either
  a drop-down list or a line edit field when completer checkbox is enabled.


.. tip:: **Relative Path in Attachment widget**

   If the path which is selected with the file browser is located in the same
   directory as the :file:`.qgs` project file or below, paths are converted to
   relative paths. This increases portability of a :file:`.qgs` project with
   multimedia information attached.


.. index:: Jointure, Join layers
.. _`sec_joins`:

Joins Properties
================

|join| The :guilabel:`Joins` tab allows you to associate features
of the current layer (called ``Target layer``) to features from another
loaded vector layer (or table). The join is based on an attribute that is shared by the
layers. The layers can be geometryless (tables) or not but their join attribute
should be of the same type.

To create a join:

#. Click the |signPlus| :sup:`Add new join` button. The :guilabel:`Add vector
   join` dialog appears.
#. Select the :guilabel:`Join layer` you want to connect with the target vector
   layer
#. Specify the :guilabel:`Join field` and the :guilabel:`Target field` that are
   common to both the join layer and the target layer
#. Press :guilabel:`OK` and a summary of selected parameters is added to the
   :guilabel:`Join` panel.

.. _figure_joins:

.. figure:: img/join_attributes.png
   :align: center

   Join an attribute table to an existing vector layer

The steps above will create a join, where **ALL** the attributes of the
first matching feature in the join layer is added to the target layer's feature.
QGIS provides more options to tweak the join:

* |checkbox| :guilabel:`Cache join layer in virtual memory`: allows you to cache
  values in memory (without geometries) from the joined layer in order to speed
  up lookups.
* |unchecked| :guilabel:`Create attribute index on the join field`
* |unchecked| :guilabel:`Dynamic form`: helps to synchronize join fields on the
  fly, according to the :guilabel:`Target field`. This way, constraints for
  join fields are also correctly updated. Note that it's deactivated by default
  because it may be very time consuming if you have a lot of features or a
  myriad of joins.
* If the target layer is editable, then some icons will be displayed in the
  attribute table next to fields, in order to inform about their status:

  * |joinNotEditable|: the join layer is not configured to be
    editable. If you want to be able to edit join features from the target
    attribute table, then you have to check the option
    |checkbox| :guilabel:`Editable join layer`.
  * |joinedLayerNotEditable|: the join layer is well configured to be
    editable, but its current status is read only.
  * |joinHasNotUpsertOnEdit|: the join layer is editable, but synchronization
    mechanisms are not activated. If you want to automatically add a feature in
    the join layer when a feature is created in the target layer, then you have
    to check the option |checkbox| :guilabel:`Upsert on edit`. Symmetrically,
    the option |checkbox| :guilabel:`Delete cascade` may be activated if you
    want to automatically delete join features.
* |unchecked| :guilabel:`Joined fields`: instead of adding all the fields from
  the joined layer, you can specify a subset.
* |unchecked| :guilabel:`Custom field name prefix` for joined fields, in order
  to avoid name collision

QGIS currently has support for joining non-spatial table formats supported by
OGR (e.g., CSV, DBF and Excel), delimited text and the PostgreSQL provider.


.. _vector_auxiliary_storage:

Auxiliary Storage Properties
============================

The regular way to customize styling and labeling is to use data-defined
properties as described in :ref:`data_defined`. However, it may not be
possible if the underlying data is read only. Moreover, configuring these
data-defined properties may be very time consuming or not desirable! For
example, if you want to fully use map tools coming with :ref:`label_toolbar`,
then you need to add and configure more than 20 fields in your original data
source (X and Y positions, rotation angle, font style, color and so on).

The Auxiliary Storage mechanism provides the solution to these limitations
and awkward configurations. Auxiliary fields are a roundabout way to
automatically manage and store these data-defined properties (labels,
diagram, symbology...) in a SQLite database thanks to editable joins.
This allows you to store properties for layers that aren't editable.

A tab is available in vector layer properties dialog to manage auxiliary
storage:

.. figure:: img/auxiliary_storage_tab.png
   :align: center

   Auxiliary Storage tab

.. _vector_auxiliary_storage_key:

Labeling
--------

Considering that the data source may be customized thanks to data-defined
properties without being editable, labeling map tools described in
:ref:`label_toolbar` are always available as soon as labeling is activated.

Actually, the auxiliary storage system needs an auxiliary layer to store these
properties in a SQLite database (see :ref:`vector_auxiliary_storage_database`).
Its creation process is run the first time you click on the map while a
labeling map tool is currently activated. Then, a window is displayed, allowing
you to select the primary key to use for joining (to ensure that features are
uniquely identified):

.. _figure_auxiliary_layer_creation:

.. figure:: img/auxiliary_storage_key.png
   :align: center

   Auxiliary Layer creation dialog


As soon as an auxiliary layer is configured for the current data source, you can
retrieve its information in the tab:

.. figure:: img/auxiliary_storage_tabkey.png
   :align: center

   Auxiliary Layer key


The auxiliary layer now has these characteristics:

* the primary key is ``ID``,
* there are ``0`` features using an auxiliary field,
* there are ``0`` auxiliary fields.

Now that the auxiliary layer is created, you can edit the layer labels.
Click on a label while the |changeLabelProperties| :sup:`Change Label`
map tool is activated, then you can update styling properties like sizes,
colors, and so on. The corresponding data-defined properties are created
and can be retrieved:

.. figure:: img/auxiliary_storage_fields.png
   :align: center

   Auxiliary Fields


As you can see in the figure above, ``21`` fields are automatically created and
configured for labeling. For example, the ``FontStyle`` auxiliary field type is
a ``String`` and is named ``labeling_fontstyle`` in the underlying SQLite
database. There is also ``1`` feature which is currently using these auxiliary
fields.

Notice that the icon |dataDefineOn| is displayed in the :guilabel:`Labels`
properties tab indicating that the data-defined override options are set
correctly:

.. figure:: img/auxiliary_storage_dd.png
   :align: center

   Data-defined properties automatically created


Otherwise, there's another way to create an auxiliary field for a specific
property thanks to the |dataDefined| :sup:`data-defined override` button. By
clicking on :guilabel:`Store data in the project`, an auxiliary field is
automatically created for the :guilabel:`Opacity` field. If you click on this
button whereas the auxiliary layer is not created yet, then the window
:ref:`figure_auxiliary_layer_creation` is first displayed to select the
primary key to use for joining.


Symbology
---------

Like the method described above for customizing labels, auxiliary fields can
also be used to stylize symbols and diagrams. To do this, click on
|dataDefined| :sup:`Data-defined override` and select :guilabel:`Store data in
the project` for a specific property. For example, the :guilabel:`Fill
color` field:

.. figure:: img/auxiliary_storage_symbol.png
   :align: center

   Data-defined property menu for symbol


There are different attributes for each symbol (e.g. fill style, fill color,
stroke color, etc...), so each auxiliary field representing an attribute
requires a unique name to avoid conflicts. After selecting :guilabel:`Store
data in the project`, a window opens and displays the :guilabel:`Type` of the
field and prompts you to enter a unique name for the auxiliary field. For
example, when creating a :guilabel:`Fill color` auxiliary field the following
window opens:

.. figure:: img/auxiliary_storage_symbol_name.png
   :align: center

   Name of the auxiliary field for a symbol


Once created, the auxiliary field can be retrieved in the auxiliary storage
tab:

.. figure:: img/auxiliary_storage_symbol_field.png
   :align: center

   Auxiliary field symbol


Attribute table and widgets
---------------------------

Auxiliary fields can be edited using the
:ref:`attribute table <sec_attribute_table>`. However, not all auxiliary fields
are initially visible in the attribute table.

Auxiliary fields representing attributes of a layer's symbology, labeling,
appearance, or diagrams will appear automatically in the attribute table. The
exception are attributes that can be modified using the :ref:`Label Toolbar <label_toolbar>`
which are hidden by default. Auxiliary fields representing a ``Color`` have a
widget **Color** set by default, otherwise auxiliary fields default to the
**Text Edit** widget.

Auxiliary fields that represent attributes that can be modified using
the :ref:`Label toolbar<label_toolbar>` are **Hidden** in the attribute table
by default. To make a field visible, open the :ref:`Attribute Form properties
tab <vector_attributes_menu>` and change the value of an auxiliary field
:guilabel:`Widget Type` from **Hidden** to another relevant value. For example,
change the **auxiliary_storage_labeling_size** to **Text Edit** or change
**auxiliary_storage_labeling_color** to the **Color** widget. Those fields will
now be visible in the attribute table.

Auxiliary fields in the attribute table will appear like the following image:


.. figure:: img/auxiliary_storage_widgets.png
   :align: center

   Form with auxiliary fields


Management
----------

The :guilabel:`Auxiliary Layer` menu allows you to manage the auxiliary fields:

.. figure:: img/auxiliary_storage_actions.png
   :align: center

   Auxiliary layer management


The first item :guilabel:`Create` is disabled in this case because the auxiliary
layer is already created. But in case of a fresh work, you can use this action to
create an auxiliary layer. As explained in :ref:`vector_auxiliary_storage_key`,
a primary key will be needed then.

The :guilabel:`Clear` action allows to keep all auxiliary fields, but remove
their contents. This way, the number of features using these fields will fall to
``0``.

The :guilabel:`Delete` action completely removes the auxiliary layer. In other
words, the corresponding table is deleted from the underlying SQLite database
and properties customization are lost.

Finally, the :guilabel:`Export` action allows to save the auxiliary layer as a
:ref:`new vector layer <general_saveas>`. Note that geometries are not stored
in auxiliary storage. However, in this case, geometries are exported from the
original data source too.

.. _vector_auxiliary_storage_database:

Auxiliary storage database
--------------------------

When you save your project with the ``.qgs`` format, the SQLite database
used for auxiliary storage is saved at the same place but with the extension
``.qgd``.

For convenience, an archive may be used instead thanks to the ``.qgz`` format.
In this case, ``.qgd`` and  ``.qgs`` files are both embedded in the archive.


.. index:: Tab; Actions
.. _actions_menu:

Actions Properties
==================

|action| QGIS provides the ability to perform an action based on the attributes
of a feature. This can be used to perform any number of actions, for example,
running a program with arguments built from the attributes of a feature or
passing parameters to a web reporting tool.

.. _figure_actions:

.. figure:: img/action_dialog.png
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
on :guilabel:`Create Default Actions`. To edit any of the examples, double-click
its row. One example is performing a search based on an attribute value. This
concept is used in the following discussion.

The |checkbox| :guilabel:`Show in Attribute Table` allows you to display in the
attribute table dialog the checked feature-scoped actions, either as :guilabel:`Combo
Box` or as :guilabel:`Separate Buttons` (see :ref:`configure_table_columns`).


.. index:: Actions, Attribute Actions
   single: Actions; Define an action
.. _adding_actions:

Defining Actions
----------------

To define an attribute action, open the vector :guilabel:`Layer
Properties` dialog and click on the :guilabel:`Actions` tab. In the
:guilabel:`Actions` tab, click the |signPlus| :sup:`Add a new action`
to open the :guilabel:`Edit Action` dialog.

Select the action :guilabel:`Type` and provide a descriptive name
for the action. The action itself must contain the name of the application
that will be executed when the action is invoked.
You can add one or more attribute field values as arguments to the application.
When the action is invoked, any set of characters that start with a ``%``
followed by the name of a field will be replaced by the value of that field.
The special characters ``%%`` will be replaced by the value of the field
that was selected from the identify results or attribute table (see using_actions_
below). Double quote marks can be used to group text into a single argument to
the program, script or command. Double quotes will be ignored if preceded by a
backslash.

The :guilabel:`Action Scopes` allows you to define *where* the action should be
available. You have 4 different choices:

#. :guilabel:`Feature Scope`: action is available when right click in the cell
   within the attribute table.
#. :guilabel:`Field Scope`: action is available when right click in the cell
   within the attribute table, in the feature form and in the default action
   button of the main toolbar.
#. :guilabel:`Layer Scope`: action is available in the action button in the
   attribute table toolbar. Be aware that this type of action involves the entire
   layer and not the single features.
#. :guilabel:`Canvas`: action is available in the main action button in the
   toolbar.

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

.. index::
   single: Actions; Examples

Two example actions are shown below:

* ``konqueror https://www.google.com/search?q=%nam``
* ``konqueror https://www.google.com/search?q=%%``

In the first example, the web browser konqueror is invoked and passed a URL
to open. The URL performs a Google search on the value of the ``nam`` field
from our vector layer. Note that the application or script called by the
action must be in the path, or you must provide the full path. To be certain, we
could rewrite the first example as:
``/opt/kde3/bin/konqueror https://www.google.com/search?q=%nam``. This will
ensure that the konqueror application will be executed when the action is
invoked.

The second example uses the \%\% notation, which does not rely on a particular
field for its value. When the action is invoked, the \%\% will be replaced by
the value of the selected field in the identify results or attribute table.

.. index::
   single: Actions; Using actions
.. _using_actions:

Using Actions
-------------

QGIS offers many ways to execute actions you enabled on a layer. Depending on
their settings, they can be available:

* in the drop-down menu of |actionRun| :sup:`Run Feature Action` button from
  the :guilabel:`Attributes toolbar` or :guilabel:`Attribute table` dialog;
* when right-clicking a feature with the |identify| :sup:`Identify Features` tool
  (see :ref:`identify` for more information);
* from the :guilabel:`Identify Results` panel, under the :guilabel:`Actions` section;
* as items of an :guilabel:`Actions` column in the :guilabel:`Attribute Table`
  dialog.

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
little effort, we see that the format is https://www.google.com//search?q=QGIS,
where ``QGIS`` is the search term. Armed with this information, we can proceed:

#. Make sure the ``lakes`` layer is loaded.
#. Open the :guilabel:`Layer Properties` dialog by double-clicking on the
   layer in the legend, or right-click and choose :menuselection:`Properties`
   from the pop-up menu.
#. Click on the :guilabel:`Actions` tab.
#. Click |signPlus| :sup:`Add a new action`.
#. Choose the :guilabel:`Open` action type,
#. Enter a name for the action, for example ``Google Search``.
#. Additionally you can add a :guilabel:`Short Name` or even an :guilabel:`Icon`.
#. Choose the action :guilabel:`Scope`. See :ref:`adding_actions` for further
   information. Leave the default settings for this example.
#. For the action, we need to provide the name of the external program to run.
   In this case, we can use Firefox. If the program is not in your path, you
   need to provide the full path.
#. Following the name of the external application, add the URL used for doing
   a Google search, up to but not including the search term:
   ``https://www.google.com//search?q=``
#. The text in the :guilabel:`Action` field should now look like this:
   ``https://www.google.com//search?q=``
#. Click on the drop-down box containing the field names for the ``lakes``
   layer. It's located just to the left of the :guilabel:`Insert` button.
#. From the drop-down box, select 'NAMES' and click :guilabel:`Insert`.
#. Your action text now looks like this:

   ``https://www.google.com//search?q=[%NAMES%]``
#. To finalize and add the action, click the :guilabel:`OK` button.

.. _figure_add_action:

.. figure:: img/add_action_edit.png
   :align: center

   Edit action dialog configured with the example

This completes the action, and it is ready to use. The final text of the
action should look like this:

::

   https://www.google.com//search?q=[%NAMES%]

We can now use the action. Close the :guilabel:`Layer Properties` dialog and
zoom in to an area of interest. Make sure the ``lakes`` layer is active and
identify a lake. In the result box you'll now see that our action is visible:

.. _figure_actions_selection:

.. figure:: img/action_identifyaction.png
   :align: center

   Select feature and choose action

When we click on the action, it brings up Firefox and navigates to the URL
https://www.google.com/search?q=Tustumena. It is also possible to add further
attribute fields to the action. Therefore, you can add a ``+`` to the end of
the action text, select another field and click on :guilabel:`Insert Field`. In
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
(a file-based one, like Shapefile or SpatiaLite)? The following code will
do the trick:

.. code-block:: python

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

.. code-block:: python

  command = "firefox"
  imagerelpath = "images/test_image.jpg"
  projectpath = qgis.core.QgsProject.instance().fileName()
  import os.path
  path = os.path.dirname(str(projectpath)) if projectpath != '' else None
  image = os.path.join(path, imagerelpath)
  import subprocess
  subprocess.Popen( [command, image ] )

Another Python action example is the one that allows us to add new layers
to the project. For instance, the following examples will add to the project
respectively a vector and a raster. The names of the files to be added to the
project and the names to be given to the layers are data driven (*filename* and
*layername* are column names of the table of attributes of the vector where
the action was created):

.. code-block:: python

  qgis.utils.iface.addVectorLayer('/yourpath/[% "filename" %].shp',
    '[% "layername" %]', 'ogr')


To add a raster (a TIF image in this example), it becomes:

.. code-block:: python

  qgis.utils.iface.addRasterLayer('/yourpath/[% "filename" %].tif',
    '[% "layername" %]')

.. index:: Map Tips
.. _maptips:

Display Properties
==================

|display| The :guilabel:`Display` tab helps you configure fields to use for
feature identification:

* The :guilabel:`Display name`: based on a field or an :ref:`expression
  <vector_expressions>`. This is:

  * the label shown on top of the feature information in the :ref:`Identify
    tool <identify>` results;
  * the field used in the :ref:`locator bar <locator_options>` when looking for
    features in all layers;
  * the feature identifier in the attribute table :ref:`form view
    <attribute_table_view>`;
  * the map tip information, i.e. the message displayed in the map canvas when
    hovering over a feature of the active layer with the |mapTips| :sup:`Show
    Map Tips` icon pressed. Applicable when no :guilabel:`HTML Map Tip` is set.

* The :guilabel:`HTML Map Tip` is specifically created for the map tips: it's
  a more complex and full HTML text mixing fields, expressions and html tags
  (multiline, fonts, images, hyperlink...).

.. _figure_display_code:

.. figure:: img/display_html.png
   :align: center

   HTML code for map tip


To activate map tips, select the menu option :menuselection:`View --> Show Map
Tips` or click on the |mapTips| :sup:`Show Map Tips` icon of the
:guilabel:`Attributes Toolbar`. Map tip is a cross-session feature meaning that
once activated, it stays on and apply to any layer in any project, even in
future QGIS sessions until it's toggled off.

.. _figure_display_mapped:

.. figure:: img/map_tip.png
   :align: center

   Map tip made with HTML code


.. index:: Generalisation, Feature simplification, Rasterisation
.. _vectorrenderingmenu:

Rendering Properties
====================

Scale dependent visibility
--------------------------

You can set the :guilabel:`Maximum (inclusive)` and :guilabel:`Minimum
(exclusive)` scale, defining a range of scale in which features will be
visible. Out of this range, they are hidden. The |mapIdentification|
:sup:`Set to current canvas scale` button helps you use the current map
canvas scale as boundary of the range visibility.
See :ref:`label_scaledepend` for more information.

Simplify geometry
-----------------

QGIS offers support for on-the-fly feature generalisation. This can
improve rendering times when drawing many complex features at small scales.
This feature can be enabled or disabled in the layer settings using the
|checkbox| :guilabel:`Simplify geometry` option. There is also a global
setting that enables generalisation by default for newly added layers (see
:ref:`global simplification <global_simplification>` for more information).

.. _figure_rendering:

.. figure:: img/simplify_rendering.png
   :align: center

   Layer Geometry Simplification dialog


.. note::
  Feature generalisation may introduce artefacts into your rendered
  output in some cases. These may include slivers between polygons and
  inaccurate rendering when using offset-based symbol layers.


While rendering extremely detailed layers (e.g. polygon layers with a huge number
of nodes), this can cause layout exports in PDF/SVG format to be huge as all
nodes are included in the exported file. This can also make the resultant file
very slow to work with/open in other programs.

Checking |checkbox| :guilabel:`Force layer to render as raster` forces these
layers to be rasterised so that the exported files won't have to include all
the nodes contained in these layers and the rendering is therefore sped up.

You can also do this by forcing the layout to export as a raster,
but that is an all-or-nothing solution, given that the rasterisation
is applied to all layers.

:guilabel:`Refresh layer at interval (seconds)`: set a timer to automatically
refresh individual layers at a matching interval. Canvas updates are
deferred in order to avoid refreshing multiple times if more than one layer
has an auto update interval set.

Depending on the data provider (e.g. PostgreSQL), notifications can be sent to
QGIS when changes are applied to the data source, out of QGIS. Use the |checkbox|
:guilabel:`Refresh layer on notification` option to trigger an update.
You can also limit the layer refresh to a specific message set in the |checkbox|
:guilabel:`Only if message is` text box.


.. index:: Variables
.. _vectorvariablesmenu:

Variables Properties
====================

|expression| The :guilabel:`Variables` tab lists all the variables available at
the layer's level (which includes all global and project's variables).

It also allows the user to manage layer-level variables. Click the |signPlus|
button to add a new custom layer-level variable. Likewise, select a custom
layer-level variable from the list and click the |signMinus| button to remove
it.

More information on variables usage in the General Tools
:ref:`general_tools_variables` section.


.. index:: Metadata, Metadata editor, Keyword
.. _vectormetadatamenu:

Metadata Properties
===================

|editMetadata| The :guilabel:`Metadata` tab provides you with options to create
and edit a metadata report on your layer. Information to fill concern:

* the data :guilabel:`Identification`: basic attribution of the dataset (parent,
  identifier, title, abstract, language...);
* the :guilabel:`Categories` the data belongs to. Alongside the **ISO** categories,
  you can add custom ones;
* the :guilabel:`Keywords` to retrieve the data and associated concepts following
  a standard based vocabulary;
* the :guilabel:`Access` to the dataset (licenses, rights, fees, and constraints);
* the :guilabel:`Extent` of the dataset, either spatial one (CRS, map extent,
  altitudes) or temporal;
* the :guilabel:`Contact` of the owner(s) of the dataset;
* the :guilabel:`Links` to ancillary resources and related information;
* the :guilabel:`History` of the dataset.

A summary of the filled information is provided in the :guilabel:`Validation`
tab and helps you identify potential issues related to the form. You can then
either fix them or ignore them.

Metadata are currently saved in the project file. It can also be saved as an
:file:`.XML` file alongside file based layers or in a local :file:`.sqlite`
database for remote layers (e.g. PostGIS).

.. index:: Dependencies
.. _vectordependenciesmenu:

Dependencies Properties
=======================

|dependencies| The :guilabel:`Dependencies` tab allows to declare data
dependencies between layers. A data dependency occurs when a data modification
in a layer, not by direct user manipulation, may modify data of other layers.
This is the case for instance when geometry of a layer is updated by a
database trigger or custom PyQGIS scripting after modification of another
layer's geometry.

In the :guilabel:`Dependencies` tab, you can select any layers which may externally
alter the data in the current layer. Correctly specifying dependent layers
allows QGIS to invalidate caches for this layer when the dependent layers are
altered.


.. index:: Legend, Embedded widget, Text on symbol
.. _vectorlegendmenu:

Legend Properties
=================

|legend| The :guilabel:`Legend` properties tab provides you with advanced
settings for the :ref:`Layers panel <label_legend>` and/or the :ref:`print
layout legend <layout_legend_item>`. These options include:

* |checkbox| :guilabel:`Text on symbols`: In some cases it can be useful to add
  extra information to the symbols in the legend. With this frame, you can
  affect to any of the symbols used in the layer symbology a text that is
  displayed over the symbol, in both :guilabel:`Layers` panel and print layout
  legend. This mapping is done by typing each text next to the symbol in the
  table widget or filling the table using the :guilabel:`Set Labels from Expression`
  button. Text appearance is handled through the font and color selector
  widgets of the :guilabel:`Text Format` button.

.. _figure_legend_text_symbol:

.. figure:: img/text_legend_symbols.png
   :align: center

   Setting text on symbols (left) and its rendering in the :guilabel:`Layers` panel (right)

* a list of widgets you can embed within the layer tree in the Layers panel.
  The idea is to have a way to quickly access some actions that are often used
  with the layer (setup transparency, filtering, selection, style or other
  stuff...).

  By default, QGIS provides transparency widget but this can be extended by
  plugins registering their own widgets and assign custom actions to layers
  they manage.


.. index:: Metadata, Keyword, QGIS Server

.. _vectorservermenu:

QGIS Server Properties
======================

|overlay| The :guilabel:`QGIS Server` tab consists of :guilabel:`Description`,
:guilabel:`Attribution`, :guilabel:`MetadataURL`, and :guilabel:`LegendUrl` sections.

You can add or edit a title and abstract for the layer in the
:guilabel:`Description` section. It's also possible to define a
:guilabel:`Keyword list` here. These keyword lists can be used in a
metadata catalog. If you want to use a title from an XML metadata file,
you have to fill in a link in the :guilabel:`DataUrl` field.

Use :guilabel:`Attribution` to get attribute data from an XML metadata catalog.

In :guilabel:`MetadataUrl`, you can define the general path to the XML metadata
catalog. This information will be saved in the QGIS project file for subsequent
sessions and will be used for QGIS server.

In the :guilabel:`LegendUrl` section, you can provide the url of a legend image
in the url field. You can use the Format drop-down option to apply the appropriate
format of the image. Currently png, jpg and jpeg image formats are supported.

.. _figure_server_vector:

.. figure:: img/vector_server_properties.png
   :align: center

   QGIS Server tab in vector layers properties dialog

.. _digitizingmenu:

Digitizing Properties
=====================

|digitizing| The :guilabel:`Digitizing` tab gives access to options that help to ensure the
quality of digitized geometries.

.. _figure_digitizing_vector:

.. figure:: img/vector_digitizing_properties.png
   :align: center

   The QGIS Digitizing tab in the vector layers properties dialog

Automatic Fixes
---------------

Options in the :guilabel:`Automatic Fixes` section will directly affect the vertices
of any geometry which is added or modified.
If the |checkbox| :guilabel:`Remove duplicate nodes` option is checked, any two subsequent
vertices with exactly the same coordinates will be removed.
If the :guilabel:`Geometry precision` is set, all vertices will be rounded to
the closest multiple of the configured geometry precision. The rounding will
happen in the layer coordinate reference system. Z and M values are not
rounded. With many map tools, a grid is shown on the canvas while digitizing.

Geometry Checks
---------------

In the :guilabel:`Geometry checks` section, additional validations on a per
geometry basis can be activated. Immediately after any geometry modification,
failures in these checks are reported to the user in the geometry validation panel.
As long as a check is failing, it is not possible to save the layer.
The |checkbox| :guilabel:`Is valid` check will run basic validity checks like self intersection on
geometries.

Topology Checks
---------------

In the :guilabel:`Topology checks` section, additional topology validation
checks can be activated. Topology checks will be executed when the user
saves the layer. Check errors will be reported in the geometry validation
panel. As long as validation errors are present, the layer can not be saved.
Topology checks are executed in the area of the bounding box of the modified
features. Since other features may be present in the same area, topological
errors concerning these features are reported as well as errors introduced
in the current edit session.

.. list-table::
   :header-rows: 1

   * - Topology check option
     - Illustration
   * - The |checkbox| :guilabel:`Gap` check will check for
       gaps between neighbouring polygons.
     - .. figure:: img/gapcheck.png
   * - The |checkbox| :guilabel:`Overlap` check will check
       for overlaps between neighbouring polygons.
     - .. figure:: img/overlapcheck.png
   * - The |checkbox| :guilabel:`Missing vertex` check will
       check for shared boundaries of neighbouring polygons
       where one border misses a vertex which is present on
       the other one.
     - .. figure:: img/missingvertexcheck.png

Gap check exceptions
....................

Sometimes it is desirable to keep gaps inside an area in a polygon
layer that otherwise is fully covered by polygons.
For example, a land use layer may have acceptable holes for lakes.
It is possible to define areas that are ignored in the gap check. Since gaps inside
these areas are allowed, we will refer to them as *Allowed Gaps* areas.

In the options for the gap checks under :guilabel:`Allowed Gaps`, an *Allowed Gaps layer*
can be configured.

Whenever the gap check is executed, gaps which are covered by one or more polygons
in the *Allowed Gaps Layer* are not reported as topology errors.

It is also possible to configure an additional :guilabel:`Buffer`.
This buffer is applied to each polygon on the *Allowed Gaps Layer*.
This makes it possible to make the tests less susceptible to small changes in the
outlines at the borders of gaps.

When *Allowed Gaps* are enabled, an additional button (:guilabel:`Add Allowed Gap`) for
detected gap errors is available in the geometry validation dock, where gaps are reported
during digitizing.
If the :guilabel:`Add Allowed Gap` button is pushed, a new polygon with the geometry
of the detected gap is inserted into the *Allowed Gaps Layer*.
This makes it possible to quickly flag gaps as allowed.

.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |25dSymbol| image:: /static/common/renderer25dSymbol.png
   :width: 1.5em
.. |3d| image:: /static/common/3d.png
   :width: 1.5em
.. |action| image:: /static/common/action.png
   :width: 2em
.. |actionRun| image:: /static/common/mAction.png
   :width: 1.5em
.. |addOgrLayer| image:: /static/common/mActionAddOgrLayer.png
   :width: 1.5em
.. |arrowDown| image:: /static/common/mActionArrowDown.png
   :width: 1.5em
.. |arrowUp| image:: /static/common/mActionArrowUp.png
   :width: 1.5em
.. |autoPlacement| image:: /static/common/mIconAutoPlacementSettings.png
   :width: 1.5em
.. |auxiliaryStorage| image:: /static/common/mIconAuxiliaryStorage.png
   :width: 1.5em
.. |categorizedSymbol| image:: /static/common/rendererCategorizedSymbol.png
   :width: 1.5em
.. |changeLabelProperties| image:: /static/common/mActionChangeLabelProperties.png
   :width: 1.5em
.. |checkbox| image:: /static/common/checkbox.png
   :width: 1.3em
.. |colorWheel| image:: /static/common/mIconColorWheel.png
   :width: 1.5em
.. |dataDefineExpressionOn| image:: /static/common/mIconDataDefineExpressionOn.png
   :width: 1.5em
.. |dataDefineOn| image:: /static/common/mIconDataDefineOn.png
   :width: 1.5em
.. |dataDefined| image:: /static/common/mIconDataDefine.png
   :width: 1.5em
.. |degrees| unicode:: 0x00B0
   :ltrim:
.. |deleteAttribute| image:: /static/common/mActionDeleteAttribute.png
   :width: 1.5em
.. |dependencies| image:: /static/common/dependencies.png
   :width: 1.5em
.. |diagram| image:: /static/common/diagram.png
   :width: 2em
.. |diagramNone| image:: /static/common/diagramNone.png
   :width: 1.5em
.. |digitizing| image:: /static/common/digitizing.png
   :width: 1.5em
.. |display| image:: /static/common/display.png
   :width: 1.5em
.. |editMetadata| image:: /static/common/editmetadata.png
   :width: 1.2em
.. |expression| image:: /static/common/mIconExpression.png
   :width: 1.5em
.. |formView| image:: /static/common/mActionFormView.png
   :width: 1.2em
.. |graduatedSymbol| image:: /static/common/rendererGraduatedSymbol.png
   :width: 1.5em
.. |heatmapSymbol| image:: /static/common/rendererHeatmapSymbol.png
   :width: 1.5em
.. |hideAllLayers| image:: /static/common/mActionHideAllLayers.png
   :width: 1.5em
.. |histogram| image:: /static/common/histogram.png
   :width: 1.5em
.. |identify| image:: /static/common/mActionIdentify.png
   :width: 1.5em
.. |indicatorFilter| image:: /static/common/mIndicatorFilter.png
   :width: 1.5em
.. |invertedSymbol| image:: /static/common/rendererInvertedSymbol.png
   :width: 1.5em
.. |join| image:: /static/common/join.png
   :width: 2em
.. |joinHasNotUpsertOnEdit| image:: /static/common/mIconJoinHasNotUpsertOnEdit.png
   :width: 1.5em
.. |joinNotEditable| image:: /static/common/mIconJoinNotEditable.png
   :width: 1.5em
.. |joinedLayerNotEditable| image:: /static/common/mIconJoinedLayerNotEditable.png
   :width: 1.5em
.. |labelbackground| image:: /static/common/labelbackground.png
   :width: 1.5em
.. |labelbuffer| image:: /static/common/labelbuffer.png
   :width: 1.5em
.. |labelcallout| image:: /static/common/labelcallout.png
   :width: 1.5em
.. |labelformatting| image:: /static/common/labelformatting.png
   :width: 1.5em
.. |labeling| image:: /static/common/labelingSingle.png
   :width: 1.5em
.. |labelingNone| image:: /static/common/labelingNone.png
   :width: 1.5em
.. |labelingObstacle| image:: /static/common/labelingObstacle.png
   :width: 1.5em
.. |labelingRuleBased| image:: /static/common/labelingRuleBased.png
   :width: 1.5em
.. |labelplacement| image:: /static/common/labelplacement.png
   :width: 1.5em
.. |labelshadow| image:: /static/common/labelshadow.png
   :width: 1.5em
.. |legend| image:: /static/common/legend.png
   :width: 1.2em
.. |mapIdentification| image:: /static/common/mActionMapIdentification.png
   :width: 1.5em
.. |mapTips| image:: /static/common/mActionMapTips.png
   :width: 1.5em
.. |metadata| image:: /static/common/metadata.png
   :width: 1.5em
.. |moveLabel| image:: /static/common/mActionMoveLabel.png
   :width: 1.5em
.. |newAttribute| image:: /static/common/mActionNewAttribute.png
   :width: 1.5em
.. |nix| image:: /static/common/nix.png
   :width: 1em
.. |nullSymbol| image:: /static/common/rendererNullSymbol.png
   :width: 1.5em
.. |osx| image:: /static/common/osx.png
   :width: 1em
.. |overlay| image:: /static/common/overlay.png
   :width: 1.5em
.. |paintEffects| image:: /static/common/mIconPaintEffects.png
   :width: 1.5em
.. |piechart| image:: /static/common/pie-chart.png
   :width: 1.5em
.. |pinLabels| image:: /static/common/mActionPinLabels.png
   :width: 1.5em
.. |pointClusterSymbol| image:: /static/common/rendererPointClusterSymbol.png
   :width: 1.5em
.. |pointDisplacementSymbol| image:: /static/common/rendererPointDisplacementSymbol.png
   :width: 1.5em
.. |projectProperties| image:: /static/common/mActionProjectProperties.png
   :width: 1.5em
.. |radioButtonOff| image:: /static/common/radiobuttonoff.png
   :width: 1.5em
.. |radioButtonOn| image:: /static/common/radiobuttonon.png
   :width: 1.5em
.. |render| image:: /static/common/render.png
   :width: 1.5em
.. |rendering| image:: /static/common/rendering.png
   :width: 1.5em
.. |rotateLabel| image:: /static/common/mActionRotateLabel.png
   :width: 1.5em
.. |ruleBasedSymbol| image:: /static/common/rendererRuleBasedSymbol.png
   :width: 1.5em
.. |selectString| image:: /static/common/selectstring.png
   :width: 2.5em
.. |setProjection| image:: /static/common/mActionSetProjection.png
   :width: 1.5em
.. |showAllLayers| image:: /static/common/mActionShowAllLayers.png
   :width: 1.5em
.. |showHideLabels| image:: /static/common/mActionShowHideLabels.png
   :width: 1.5em
.. |showPinnedLabels| image:: /static/common/mActionShowPinnedLabels.png
   :width: 1.5em
.. |showUnplacedLabel| image:: /static/common/mActionShowUnplacedLabel.png
   :width: 1.5em
.. |signMinus| image:: /static/common/symbologyRemove.png
   :width: 1.5em
.. |signPlus| image:: /static/common/symbologyAdd.png
   :width: 1.5em
.. |singleSymbol| image:: /static/common/rendererSingleSymbol.png
   :width: 1.5em
.. |slider| image:: /static/common/slider.png
.. |sort| image:: /static/common/sort.png
   :width: 1.5em
.. |sourceFields| image:: /static/common/mSourceFields.png
   :width: 1.5em
.. |symbology| image:: /static/common/symbology.png
   :width: 2em
.. |system| image:: /static/common/system.png
   :width: 1.5em
.. |text| image:: /static/common/text.png
   :width: 1.5em
.. |toggleAllLayers| image:: /static/common/mActionToggleAllLayers.png
   :width: 1.5em
.. |toggleEditing| image:: /static/common/mActionToggleEditing.png
   :width: 1.5em
.. |unchecked| image:: /static/common/checkbox_unchecked.png
   :width: 1.3em
