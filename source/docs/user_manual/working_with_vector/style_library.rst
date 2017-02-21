.. only:: html

   |updatedisclaimer|

.. _vector_symbol_library:

********************
 The Symbol Library
********************

.. only:: html

   .. contents::
      :local:

.. index::
    single: Style Manager

.. _vector_style_manager:

The Style Manager
==================

The Style Manager is the place where users can manage and create generic symbols
to be used in several QGIS projects. You can open it with the :menuselection:`Settings
--> Style Manager` or from the **Style** tab in the vector layer's
:menuselection:`Properties`. It allows users to:

* create, edit and remove symbols
* organize symbols in custom groups
* export and import symbols.

.. _figure_style_manager:

.. figure:: /static/user_manual/working_with_vector/stylemanager.png
   :align: center

   The Style Manager


Groups and smart groups
------------------------

You can organize symbols into different categories. These categories, listed in
the panel at the left, can be static (called **Group**) or dynamic (named
**Smart Group**). A group is smart when its symbols are dynamically fetched
according to conditions set. See figure_smart_group_:

To create a group, right click on an existing group or on the main **Groups**
directory in the left of the dialog.
You can also select a group and click the |signPlus| :sup:`Add Group`
button. The new group will be a sub-group of the selected one.

Create **Smart Group** is similar to creating group, but instead select
**Smart Groups**. The dialog box allows user to choose the expression to
select symbols in order to appear in the smart group (contains some tags,
member of a group, have a string in its name, etc.). Any symbol that satisfies
the entered condition(s) is automatically added to the smart group.

.. _figure_smart_group:

.. figure:: /static/user_manual/working_with_vector/create_smartgroup.png
   :align: center

   Creating a Smart Group

To remove a group or a smart group, right click on the group and select
:menuselection:`Remove Group` or select it and push
|signMinus| :sup:`Remove Group` button.

Unlike the smart groups that automatically fetch their belonged symbols,
simple groups are filled by the user.
To add a symbol into a group, you can either right click on a symbol, choose
:menuselection:`Apply Group` and then the group name. There is a second
way to add several symbols into a group: just select the group, click
|changeLabelProperties| and choose :menuselection:`Group Symbols`. All
symbols display a checkbox that allows you to add the symbol into the selected
groups. When selection is finished, you can click the same button, and
choose :menuselection:`Finish Grouping`.

All the symbols that are not placed under a custom group belong
to a default group named **Ungrouped**.

Add, Edit, Remove Symbol
-------------------------

Selecting a group returns in the right panel, if applicable, the list of symbols
of the group (including its subgroups). These symbols are organized in four
different tabs:

* **Marker** for point symbols
* **Line** for linear symbols
* **Fill** for surface symbols
* and `Color Ramp`_

To delete a symbol you no longer need, just select it and click |signMinus|
:sup:`Remove item` (also available through right-click).
The symbol will be deleted from the local symbols database.

The symbol list can be modified by adding new symbols with |signPlus|
:sup:`Add item` button or modifying existing ones with |symbologyEdit|
:sup:`Edit item`.
See `symbol-selector`_ for further information.

Share symbols
--------------

The |sharing| :sup:`Share item` tool, at the right bottom of the Style
Library dialog, offers options to easily share symbols with others: users can
indeed export their symbols and import symbols to their library.

**Exporting symbols**

You can export the selected symbols to PNG, SVG or XML file formats.
Exporting to PNG or SVG (both not available for color ramp symbols) creates
a file for each selected symbol, and the SVG folder can be added to SVG Paths
in :menuselection:`Settings --> Options` to e.g. share these symbols on a network.
The XML format generates a single file containing all the selected symbols.
This file can then be imported in another user's style library.

**Importing symbols**

You can extend your symbols library by importing new symbols. Just select |sharing|
:menuselection:`Import` from the drop-down list at the right bottom of the dialog.
In the new dialog, you'll need to :

* indicate the source of the symbols (it can be a ``.xml`` file on the disk or an url),
* give the name of the group under which the symbols will be put
* select the symbols you want to add to your library
* and press **Import**.

Note that import and export options are also available through right-click.

.. _figure_symbol_import:

.. figure:: /static/user_manual/working_with_vector/import_styles.png
   :align: center

   Importing symbols


.. _color-ramp:

Color Ramp
-----------

.. index:: Colors
   single: Colors; Color ramp
   single: Colors; Gradient color ramp
   single: Colors; Color brewer
   single: Colors; Custom color ramp

The Color ramp tab in the Style Manager presents different types of
color ramps you can use to style layers.

To create a custom color ramp, activate the Color ramp tab and click the
|signPlus| :sup:`Add item` button. The button reveals a drop-down list to
choose the ramp type:

* :guilabel:`Gradient`: given a start and end colors, generate a color ramp which
  can be **continuous** or **discrete**. With double-clicking the ramp preview, you
  can add as many intermediate color stops as you want.
* :guilabel:`Random`: creates a random set of colors based on range of values for
  hue, saturation, value and opacity and a number of colors (classes)
* :guilabel:`ColorBrewer`: a set of predefined discrete color gradients you can
  custom the number of colors in the ramp
* or :guilabel:`cpt-city`: an access to a whole catalog of color gradients to
  locally :guilabel:`save as gradient color`.

.. tip:: **Easily custom the color stops of the gradient color ramp**

 Double-clicking the ramp preview or drag-and-drop a color from the color spot onto
 the ramp preview adds a new color stop. Each color stop can be tweaked using the
 :ref:`color-selector` widgets or by plotting each of its parameters. You can also 
 reposition it using the mouse, the arrow keys (combine with :kbd:`Shift` key for
 a larger move) or the :guilabel:`Relative position` spinbox. Pressing :guilabel:`Delete
 stop` as well as :kbd:`DEL` key removes the selected color stop. 

You can use the |checkbox| :guilabel:`Invert` option while
classifying the data with a color ramp. See figure_color_custom_ramp_ for an
example of a custom color ramp and figure_color_cpt_city_ for the cpt-city Colors dialog.


.. _figure_color_custom_ramp:

.. figure:: /static/user_manual/working_with_vector/customColorRampGradient.png
   :align: center

   Example of custom gradient color ramp with multiple stops

The cpt-city option opens a new dialog with hundreds of themes included 'out of the box'.

.. _figure_color_cpt_city:

.. figure:: /static/user_manual/working_with_vector/cpt-cityColorRamps.png
   :align: center

   cpt-city dialog with hundreds of color ramps


.. _symbol-selector:

The Symbol Selector
====================

The Symbol selector is the main dialog to design a symbol.
You can create or edit Marker, Line or Fill Symbols.

.. _figure_symbol_marker:

.. figure:: /static/user_manual/working_with_vector/symbolselector.png
   :align: center

   Designing a Marker symbol


Two main components structure the symbol selector dialog:

* the symbol tree, showing symbol layers that are combined afterwards to shape a
  new global symbol
* and settings to configure the selected symbol layer in the tree.

.. _symbol_tree:

The symbol layer tree
----------------------

A symbol can consist of several :guilabel:`Symbol layers`. The symbol tree shows
the overlay of these symbol layers that are combined afterwards to shape a
new global symbol. Besides, a dynamic symbol representation is updated as soon as
symbol properties change.

A set of tools is available to manage the symbol tree items and according to the
level selected, you'll get enabled different tools at the bottom of the dialog to:

* |signPlus| add new symbol layer: you can stack as many symbols as you want
* |signMinus| remove the selected symbol layer
* lock colors of symbol layer: a |locked| locked color stays unchanged when
  user changes the color at the global (or upper) symbol level
* |duplicateLayer| duplicate a (group of) symbol layer(s)
* move up or down the symbol layer

.. _edit_symbol:

Configuring a symbol
---------------------

In QGIS, configuring a symbol is done in two steps: the symbol and then the
symbol layer.

The symbol
..........

At the top level of the tree, it depends on the layer geometry and can be of
**Marker**, **Line** or **Fill** type. Each symbol can embed one or
more symbols (including, of any other type) or symbol layers.

You can setup some parameters that apply to the global symbol:

* :guilabel:`Unit`: it can be **Millimeter**, **Pixels** or **Map unit**
* :guilabel:`Transparency`
* :guilabel:`Color`: when this parameter is changed by the user, its value is
  echoed to all unlocked sub-symbols color
* :guilabel:`Size` and :guilabel:`Rotation` for marker symbols
* :guilabel:`Width` for line symbols

.. note::

  The :ref:`Data-defined override <data-defined>` button beside the last layer-related
  parameters is inactive when setting the symbol from the Style manager dialog.
  When the symbol is connected to a map layer, this button offers access to the
  :ref:`size assistant <size_assistant>` dialog which helps to create proportional
  or multivariate analysis rendering.

The symbols used at this level are items you can pick from the :ref:`symbols
library <vector_style_manager>`. A list of available symbols of the same type
from your symbol library is shown and can be filtered by selecting a group in
the drop-down list just above. Click the :guilabel:`Save` button to add the
designed symbol to your symbol library.

With the :guilabel:`Advanced` |selectString| option, you can:

* set the **symbol levels**: defining the way symbol layers are connected to
  each other in the map canvas (see :ref:`Symbols_levels` for more information)
* and for line and fill symbols, **clip features to canvas extent**.

.. Fix Me: What does advanced "clip features to canvas" option mean for the symbol?

.. tip::

   Note that once you have set the size in the lower levels of the
   :guilabel:`Symbol layers` dialog, the size of the whole symbol can be changed
   with the :guilabel:`Size` (for marker symbols) or the :guilabel:`Width` (for
   line symbols) menu in the first level again. The size of the lower levels
   changes accordingly, while the size ratio is maintained.

The symbol layer
................

At a lower level of the tree, you can customize the symbol layers. The available
symbol layer types depend on the upper symbol type. Regardless the symbol layer
type, some common parameters can be applied such as |paintEffects|
:ref:`special effects <draw_effects>`.

Because describing all the options of all the symbol layer types would not be
possible, only particular and significative ones are mentioned below.

.. note:: Almost all the parameters of the symbol layer type can be set using
 the |dataDefined| :sup:`Data-defined override` settings, extending
 capabilities of customizing each symbol (see :ref:`data_defined` for more
 information).

.. _vector_marker_symbols:

Marker Symbols
..............

Marker symbols have several symbol layer types:

* Ellipse marker
* Font marker
* Simple marker (default)
* SVG marker
* Vector Field marker

For each marker symbol, you can set the following properties:

* :guilabel:`Symbol layer type`: You have the option to use Ellipse markers,
  Font markers, Simple markers, SVG markers and Vector Field markers.
* :guilabel:`colors`
* :guilabel:`Size`
* :guilabel:`Outline style`
* :guilabel:`Outline width`
* :guilabel:`Angle`
* :guilabel:`Offset X,Y`: You can shift the symbol in the x- or y-direction.
* :guilabel:`Anchor point`
* :guilabel:`Data defined properties ...`


Line Symbols
..............

Line marker symbols have only two symbol layer types:

* Marker line
* Simple line (default)

The default symbol layer type draws a simple line whereas the other display a
marker point regularly on the line. You can choose different location: vertex,
last and first vertex, interval, central point or on every curve point. Marker
line can have offset along the line or offset line. Finally,
:guilabel:`rotation` allows you to change the orientation of the
symbol.

The following settings are available:

* :guilabel:`colour`
* :guilabel:`Pen width`
* :guilabel:`Offset`
* :guilabel:`Pen style`
* :guilabel:`Join style`
* :guilabel:`Cap style`
* |checkbox| :guilabel:`Use custom dash pattern`
* :guilabel:`Dash pattern unit`
* :guilabel:`Data defined properties ...`


Polygon Symbols
................

Polygon marker symbols have also several symbol layer types:

* Centroid fill
* Gradient fill
* Line pattern fill
* Point pattern fill
* Raster image fill
* SVG fill
* Shapeburst fill
* Simple fill (default)
* Outline: Marker line (same as line marker)
* Outline: simple line (same as line marker)

The following settings are available:

* :guilabel:`Colors` for the border and the fill.
* :guilabel:`Fill style`
* :guilabel:`Border style`
* :guilabel:`Border width`
* :guilabel:`Offset X,Y`
* :guilabel:`Data defined properties ...`

Using the color combo box, you can drag and drop color for one color button
to another button, copy-paste color, pick color from somewhere, choose a color
from the palette or from  recent or standard color. The combo box allows you to
fill in the feature with transparency. You can also just click the button to open the
palette dialog. Note that you can import color from some external software
like GIMP.

With the 'Raster image fill' you can fill polygons with a tiled raster image.
Options include (data defined) file name, opacity, image size (in pixels, mm or map units),
coordinate mode (feature or view) and rotation.

'Gradient Fill' :guilabel:`Symbol layer type` allows you to select
between a |radioButtonOn| :guilabel:`Two color`
and |radioButtonOff| :guilabel:`Color ramp` setting. You can use the
|checkbox| :guilabel:`Feature centroid` as :guilabel:`Referencepoint`.
All fills 'Gradient Fill` :guilabel:`Symbol layer type` is also
available through the :guilabel:`Symbol` menu of the Categorized and
Graduated Renderer and through the :guilabel:`Rule properties` menu of
the Rule-based renderer.

Other possibility is to choose a 'shapeburst
fill' which is a buffered gradient fill, where a gradient is drawn from
the boundary of a polygon towards the polygon's centre. Configurable
parameters include distance from the boundary to shade, use of color ramps or
simple two color gradients, optional blurring of the fill and offsets.

It is possible to only draw polygon borders inside the polygon. Using
'Outline: Simple line' select |checkbox| :guilabel:`Draw line
only inside polygon`.

**Note:** When geometry type is polygon, you can choose to disable the
automatic clipping of lines/polygons to the canvas extent. In
some cases this clipping results in unfavourable symbology (eg
centroid fills where the centroid must always be the actual
feature's centroid).

