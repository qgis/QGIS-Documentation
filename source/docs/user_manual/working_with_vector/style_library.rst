|updatedisclaimer|

.. _vector_symbol_library:

The Symbol Library
==================

.. _vector_style_manager:

Presentation
------------

The Symbol Library is the place where users can create generic symbols to be used
in several QGIS projects. You can open it with the :menuselection:`Settings 
--> Style Library` or from the **Style** tab in the vector layer's 
:menuselection:`Properties`. It allows users to :

* create, edit and remove symbols
* organize symbols in custom groups
* export and import symbols.

.. _figure_symbol_1:

.. only:: html

   **Figure Symbol 1:**

.. figure:: /static/user_manual/working_with_vector/stylemanager.png
   :align: center

   The Style Manager |nix|


Groups and smart groups
.......................

You can organize symbols into different categories. These categories, listed in 
the panel at the left, can be static (called **Group**) or dynamic (named 
**Smart Group**). A group is smart when its symbols are dynamically fetched 
according to conditions set. See figure_symbol_2_:

To create a group, right click on an existing group or on the main **Groups** 
directory in the left of the dialog. 
You can also select a group and click the |mActionSignPlus| :sup:`Add Group` 
button. The new group will be a sub-group of the selected one.

Create **Smart Group** is similar to creating group, but instead select 
**Smart Groups**. The dialog box allows user to choose the expression to 
select symbols in order to appear in the smart group (contains some tags, 
member of a group, have a string in its name, etc.). Any symbol that satisfies 
the entered condition(s) is automatically added to the smart group.

.. _figure_symbol_2:

.. only:: html

   **Figure Symbol 2:**

.. figure:: /static/user_manual/working_with_vector/create_smartgroup.png
   :align: center

   Creating a Smart Group |nix|

To remove a group or a smart group, right click on the group and select 
:menuselection:`Remove Group` or select it and push 
|mActionSignMinus| :sup:`Remove Group` button.

Unlike the smart groups that automatically fetch their belonged symbols, 
simple groups are filled by the user.
To add a symbol into a group, you can either right click on a symbol, choose 
:menuselection:`Apply Group` and then the group name. There is a second 
way to add several symbols into a group: just select the group, click 
|mActionChangeLabelProperties| and choose :menuselection:`Group Symbols`. All 
symbols display a checkbox that allows you to add the symbol into the selected 
groups. When selection is finished, you can click the same button, and 
choose :menuselection:`Finish Grouping`.

All the symbols that are not placed under a custom goup belong 
to a default group named **Ungrouped**.

Add, Edit, Remove Symbol
........................

Selecting a group returns in the right panel, if applicable, the list of symbols 
of the group (including its subgroups). These symbols are organized in four 
different tabs:

* **Marker** for point symbols
* **Line** for linear symbols
* **Fill** for surface symbols
* `Color Ramp`_

To delete a symbol you no longer need, just select it and click |mActionSignMinus| 
:sup:`Remove item`. The symbol will be deleted from the local symbols database.

The symbol list can be modified by adding new symbols with |mActionSignPlus| 
:sup:`Add item` button or modifying existing ones with |symbologyEdit| 
:sup:`Edit item`.
See `The Symbol Selector`_ for further informations. 

Share symbols
.............

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

You can extend your symbols librairy by importing new symbols. Just select 
*Import Symbol* from the drop-down list at the right bottom of the dialog.
In the new dialog, you'll need to :

* indicate the source of the symbols (it can be a ``.xml`` file on the disk or an url),
* give the name of the group under which the symbols will be put
* choose the symbols you want to get
* and press **Import**.

.. _figure_symbol_3:

.. only:: html

   **Figure Symbol 3:**

.. figure:: /static/user_manual/working_with_vector/import_styles.png
   :align: center

   Importing symbols |nix|



.. _symbol-selector:

The symbol Selector
-------------------

The Symbol selector is the main dialog to design a symbol. 
You can create or edit Marker, Line or Fill Symbols.

.. _figure_symbol_4:

.. only:: html

   **Figure Symbol 4:**

.. figure:: /static/user_manual/working_with_vector/symbolselector.png
   :align: center

   Designing a Marker symbol |nix|


For each kind of symbols, you will find always the same dialog structure:

* at the top left side a dynamic symbol representation, updated as soon as 
  symbol properties evolve
* under the symbol representation, the symbol tree shows the symbol layers that 
  are combined afterwards to shape a new global symbol. A symbol can consist of 
  several :guilabel:`Symbol layers`.
  Settings will be shown later in this chapter.
* at the right you can setup some parameters that apply to the global symbol:

  * **unit**: it can be millimeter, pixel or map unit
  * **transparency**
  * **color**: when this parameter is changed by the user, its value is echoed to all 
    unlocked sub-symbols color
  * **size** for marker, **width** for line symbol
  * and **rotation** for marker symbol
  
* under these parameters are displayed symbols from the symbols library to choose from.
  This list of symbols can be filtered by selecting a group in the drop-down list
  just above

You can manage the symbol tree with tools below :

* add new symbol layers: you can imbricate as many symbols as you want
* remove symbol layers
* lock colors of symbol layer: a locked color stays unchanged when 
  user changes the color at the global symbol level
* move up or down each symbol layer 
* and save the designed symbol into your symbol library.

.. Fix Me: What does advanced "clip features to canvas" option mean for the symbol? 

.. tip:: 

   Note that once you have set the size in the lower levels of the 
   :guilabel:`Symbol layers` dialog, the size of the whole symbol can be changed 
   with the :guilabel:`Size` (for marker symbol) or the :guilabel:`Width` (for line
   symbol) menu in the first level again. The size of the lower levels changes 
   accordingly, while the size ratio is maintained.
  
More detailed settings can be made when clicking on the lower level in the
Symbol tree. You can change each :guilabel:`Symbol layers` properties and according
to the symbol type, you get different settings.

.. TODO: Better describe each of the options... 
  
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
marker point regularly on the line. You can choose different location vertex, 
interval or central point. Marker line can have offset along the line or offset 
line. Finally, :guilabel:`rotation` allows you to change the orientation of the 
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
between a |radiobuttonon| :guilabel:`Two color`
and |radiobuttonoff| :guilabel:`Color ramp` setting. You can use the
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


.. _color-ramp:

Color Ramp
----------

.. index:: color_Ramp, Gradient_color_Ramp, colorBrewer, Custom_color_Ramp

The Color ramp tab in the Style Manager presents a different types of 
color ramps you can use to style layers.

To create a custom color ramp, activate the Color ramp tab and click the 
|mActionSignPlus| :sup:`Add item` button. The button reveals a drop-down list to
choose the ramp type: Gradient, Random, colorBrewer, or cpt-city.

The first three have options for number of steps and/or multiple stops in 
the color ramp. You can use the |checkbox| :guilabel:`Invert` option while 
classifying the data with a color ramp. See figure_symbol_5_ for an
example of custom color ramp and figure_symbol_5a_ for the cpt-city dialog.

 
.. _figure_symbol_5:

.. only:: html

   **Figure Symbol 5:**

.. figure:: /static/user_manual/working_with_vector/customColorRampGradient.png
   :align: center

   Example of custom gradient color ramp with multiple stops |nix|

The cpt-city option opens a new dialog with hundreds of themes included 'out of the box'.

.. _figure_symbol_5a:

.. only:: html

   **Figure Symbol 5a:**

.. figure:: /static/user_manual/working_with_vector/cpt-cityColorRamps.png
   :align: center

   cpt-city dialog with hundreds of color ramps |nix|

