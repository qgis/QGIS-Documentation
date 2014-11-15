|updatedisclaimer|

.. _vector_symbol_library:

The Symbol Library
==================

.. _vector_style_manager:

Presentation
*************

The Symbol Library is the place where users can create generic symbols to be used in several 
QGIS projects. It allows users to export and import symbols, groups symbols and 
add, edit and remove symbols. You can open it with the :menuselection:`Settings --> Style Library` 
or from the **Style** tab in the vector layer's :menuselection:`Properties`.

Share and import symbols
-------------------------

Users can export and import symbols in two main formats: qml (QGIS format) and SLD 
(OGC standard). Note that SLD format is not fully supported by |qg|.

|user| :sup:`share item` displays a drop down list to let the user import or 
export symbols.

Groups and smart groups
------------------------

Groups are categories of Symbols and smart groups are dynamic groups.

To create a group, right-click on an existing group or on the main **Groups** 
directory in the left of the library. You can also select a group and click 
on the |mActionSignPlus| :sup:`add item` button.

To add a symbol into a group, you can either right click on a symbol then choose 
:menulabel:`Apply group` and then the group name added before. There is a second 
way to add several symbols into group: just select a group and click 
|mActionOnGroup| and choose **Group Symbols**. All symbols display a checkbox 
that allow you to add the symbol into the selected groups. When finished, you can 
click on the same button, and choose **Finish Grouping**.

Create **Smart Symbols** is similar to creating group, but instead select 
**Smart Groups**. The dialog box allow user to choose the expression to 
select symbols in order to appear in the smart group (contains some tags, 
member of a group, have a string in its name, etc.)

Add, edit, remove symbol
-------------------------

With the :guilabel:`Style manager` from the **[Symbol]** |selectstring| menu you can administer your
symbols. You can |mActionSignPlus| :sup:`add item`, |edit|:sup:`edit item`, |mActionSignMinus| 
:sup:`remove item` and |user| :sup:`share item`. 'Marker' symbols, 'Line' 
symbols, 'Fill' patterns and 'colour ramps' can be used to create the symbols 
(see defining_symbols_). The symbols are then assigned to 'All Symbols', 'Groups' 
or 'Smart groups'.

For each kind of symbols, you will find always the same dialog structure:
* at the top left side a symbol representation 
* under the symbol representation the symbol tree show the symbol layers
* at the right you can setup some parameter (unit,transparency, color, size 
  and rotation)
* under these parameteres you find some symbol from the symbol library

The symbol tree allow adding, removing or protect new simple symbol. You 
can move up or down the symbol layer.

More detailed settings can be made when clicking on the second level in the
:guilabel:`Symbol layers` dialog. You can define :guilabel:`Symbol layers` that are
combined afterwards. A symbol can consist of several :guilabel:`Symbol layers`.
Settings will be shown later in this chapter.

.. tip:: Note that once you have set the size in the lower levels of the 
   :guilabel:`Symbol layers` dialog, the size of the whole symbol can be changed 
   with the :guilabel:`Size` menu in the first level again. The size of the lower 
   levels changes accordingly, while the size ratio is maintained.

.. _vector_marker_symbols:

Marker Symbols
***************

Marker symbols have several symbol layer types:

* Ellipse marker
* Font marker
* Simple marker (default)
* SVG marker
* Vector Field marker

The following settings are possible:

 * :guilabel:`Symbol layer type`: You have the option to use Ellipse markers, Font markers,
   Simple markers, SVG markers and Vector Field markers.
 * :guilabel:`colors`
 * :guilabel:`Size`
 * :guilabel:`Outline style`
 * :guilabel:`Outline width`
 * :guilabel:`Angle`
 * :guilabel:`Offset X,Y`: You can shift the symbol in the x- or y-direction.
 * :guilabel:`Anchor point`
 * :guilabel:`Data defined properties ...`


Line Symbols
************
Line marker symbols have only two symbol layer types:

* Marker line
* Simple line (default)

The default symbol layer type draws a simple line whereas the other display a 
marker point regularly on the line. You can choose different location vertex, 
interval or central point. Marker line can have offset along the line or offset 
line. Finally, :guilabel:`rotation` allows you to change the orientation of the 
symbol.

The following settings are possible:

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
****************

Polygon marker symbols have also several symbol layer types:

* Centroid fill
* Gradient fill
* Line pattern fill
* Point pattern fill
* SVG fill
* Shapeburst fille
* Simple fill (default)
* Outline: Marker line (same as line marker)
* Outline: simple line (same as line marker)

The following settings are possible:

 * :guilabel:`Colors` for the border and the fill.
 * :guilabel:`Fill style`
 * :guilabel:`Border style`
 * :guilabel:`Border width`
 * :guilabel:`Offset X,Y`
 * :guilabel:`Data defined properties ...`

Using the color combo box, you can drag and drop color for one color button 
to another button, copy-paste color, pick color from somewhere, choose a color 
from the palette or from  recent or standard color. The combo box allow you to 
fill in the feature with transparency. You can also just clic on the button to open the 
palettte dialog. Note that you can import color from some external software 
like GIMP.

'Gradient Fill' :guilabel:`Symbol layer type` allows you to select
between a |radiobuttonon| :guilabel:`Two color`
and |radiobuttonoff| :guilabel:`Color ramp` setting. You can use the
|checkbox| :guilabel:`Feature centroid` as :guilabel:`Referencepoint`.
All fills 'Gradient Fill` :guilabel:`Symbol layer type` is also
available through the :guilabel:`Symbol` menu of the Categorized and
Graduated Renderer and through the :guilabel:`Rule properties` menu of
the Rule-based renderer. Other possibility is to choose a 'shapeburst
fill' which is a buffered gradient fill, where a gradient is drawn from
the boundary of a polygon towards the polygon's centre. Configurable
parameters include distance from the boundary to shade, use of color ramps or
simple two color gradients, optional blurring of the fill and offsets.

It is possible to only draw polygon borders inside the polygon. Using
'Outline: Simple line' select |checkbox| :guilabel:`Draw line
only inside polygon`.


Color ramp
**********

.. index:: color_Ramp, Gradient_color_Ramp, colorBrewer, Custom_color_Ramp

You can create a custom color ramp choosing :menuselection:`New color ramp...`
from the :guilabel:`color ramp` drop-down menu. A dialog will prompt for the ramp type:
Gradient, Random, colorBrewer, or cpt-city. The first three have options for number of steps
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


