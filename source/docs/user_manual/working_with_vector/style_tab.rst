Style Menu
---------

The Style menu provides you with a comprehensive tool for rendering and symbolizing your 
vector data. You can use :menuselection:`Layer rendering -->` tools that are common to
all vector data and special symbolizing tools that were designed for the different kinds
of vector data. 

**Layer rendering**

* :guilabel:`Layer transparency`|slider|: you can make the underlying layer in the map canvas
  visible with this tool. Use the slider to adapt the visibility of your vector layer to your needs.
  You can also make a precise definition of the percentage of visibility in the the menu beside the slider.
* :guilabel:`Layer blending mode`: you can achieve special rendering effects with these tools that you 
  previously only know from graphics programs. The pixels of your overlaying and underlaying layers are mixed
  through the settings described below.

	* Normal: This is the standard blend mode which uses the alpha channel of the top pixel to blend with the
	  Pixel beneath it; the colors aren't mixed
	* Lighten: It selects the maximum of each component from the foreground and background pixels. Be aware that the results tend to be jagged
	  and harsh.
	* Screen: Light pixels from the source are painted over the destination, while dark pixels are not. This mode is
 	  most useful for mixing the texture of one layer with another layer. E.g. you can use a hillshade to texture another layer
	* Dodge: Dodge will brighten and saturate underlying pixels based on the lightness of the top pixel. So brighter top pixels 
          cause the saturation and brightness of the underlying pixels to increase. This works best if the top
          pixels aren't too bright, otherwise the effect is too extreme.
	* Addition: This blend mode simply adds pixel values of one layer with the other. In case of values above 1 (in the case of RGB), white is
          displayed. This mode is suitable for highlighting features.
	* Darken: Creates a resultant pixel that retains the smallest components of the foreground and background pixels. Like lighten, the 
	  results tend to be jagged and harsh
	* Multiply: It multiplies the numbers for each pixel of the top layer with the corresponding pixel for the bottom layer.
          The results are darker pictures.
	* Burn: Darker colors in the top layer causes the underlying layers to darken. Can be used to tweak and colorise underlying layers.
	* Overlay: Combines multiply and screen blending modes. In the resulting picture light parts of the picture become lighter and dark parts become
          darker. 
	* Soft light: Very similar to overlay, but instead of using multiply/screen it uses color burn/dodge. This one is supposed to emulate shining a soft
          light onto an image.
	* Hard light: Hard light is very similar to the overlay mode. It's supposed to emulate projecting a very intense light onto an image.
	* Difference: Difference subtracts the top pixel from the bottom pixel or the other way round, to always get a positive value. Blending with
          black produces no change, as values for all colors are 0.
	* Subtract: This blend mode simply subtracts pixel values of one layer with the other. In case of negative values, black is displayed.
  

.. index:: Symbology

Since |qg| 2.0.0 the old symbology is no longer available.
In this version the new symbology has been redesigned and revised. 


**Renderers**

The renderer is responsible for drawing a feature together with the correct
symbol. There are four types of renderers: single symbol, categorized, graduated and rule-based.
There is no continuous color renderer, because it is in fact only a special case
of the graduated renderer. The categorized and graduated renderer can be created
by specifying a symbol and a color ramp - they will set the colors for symbols
appropriately. For point layers there is a point displacement renderer available.

.. _vector_new_symbology:

**Working with the Symbology**

In the top menu of the :guilabel:`Style` menu you can choose one of the five renderers: single
symbol, categorized, graduated, rule-based and point displacement. For each
data type (points, lines and polygons) vector symbol layer types are available
(see vector_symbol_types_). Depending on the chosen renderer, the :guilabel:`Style` tab provides different
following sections. On the bottom right of the symbology dialog there is a **[Symbol]** button which gives access
to the Style Manager (see Section :ref:`vector_style_manager`). The Style Manager allows you to edit and remove
existing symbols and add new ones.


.. _tip_change_multiple_symbols:

.. tip:: **Select and change multiple symbols**

   The Symbology allows to select multiple symbols and right
   click to change color, transparency, size, or width of selected
   entries.

.. index:: Single_Symbol_Renderer, Renderer_Single_Symbol

**Single Symbol Renderer**

The Single Symbol Renderer is used to render all features of the layer using
a single user-defined symbol. The properties, that can be adjusted in the
:guilabel:`Style` tab, depend partially on the type of the layer, but all types share
the following structure. In the top left part of the tab, there is a preview
of the current symbol to be rendered. On the right part of the tab, there is
a list of symbols already defined for the current style, prepared to be used
via selecting them from the list. The current symbol can be modified using
the menu on the right side.
If you click on the first level in the :guilabel:`Symbol layers` dialog on the left
side it's possible to define basic parameters like :guilabel:`Size`, :guilabel:`Transparency`, :guilabel:`Color` 
and :guilabel:`Rotation`. Here the layers are joined together.


.. _figure_symbology_1:

.. only:: html

   **Figure Symbology 1:**

.. figure:: /static/user_manual/working_with_vector/singlesymbol_ng_line.png
   :align: center
   :width: 20em

   Single symbol line properties |nix|

More detailed settings can be made when clicking on the second level in the 
:guilabel:`Symbol layers` dialog. You can define :guilabel:`Symbol layers` that are
combined afterwards. A symbol can consist of several :guilabel:`Symbol layers`.
The following settings are possible:

* :guilabel:`Symbol layer type` You have the possibility to use Ellipse markers, Font markers, 
  Simple markers, SVG markers and Vector Field markers
* :guilabel:`Size`
* :guilabel:`Angle`
* :guilabel:`Colors`
* :guilabel:`Border width`
* :guilabel:`Offset X,Y` You can shift the symbol in x- or y-direction

Note that once you have set the size in the lower levels the size of the whole symbol
can be changed with the :guilabel:`Size` menu in the first level again. The size of
the lower levels changes accordingly while the size ratio is maintained.
After having done any needed changes, the symbol can be added to the list of
current style symbols (using the **[Symbol]** |selectstring| :guilabel:`Save in symbol library`
and then easily be used in the future. Furthermore you can use the **[Save Style]** |selectstring| button to
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
feature's attribute. The :guilabel:`Style` menu allows you to select:


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
