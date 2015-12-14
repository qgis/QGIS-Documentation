|updatedisclaimer|

.. index::
   single: Scalebar; Map_Scalebar

The Scale Bar Item
==================

To add a scale bar, click the |mActionScaleBar| :sup:`Add new scalebar` icon, place
the element with the left mouse button on the Print Composer canvas and position
and customize the appearance in the scale bar :guilabel:`Item Properties` tab.

The :guilabel:`Item properties` of a scale bar item tab provides the following
functionalities (see figure_composer_scalebar_1_):

.. _Figure_composer_scalebar_1:

.. only:: html

   **Figure Composer Scalebar 1:**

.. figure:: /static/user_manual/print_composer/scalebar_properties.png
   :align: center

   Scale Bar Item properties Tab |nix|

Main properties
---------------

The :guilabel:`Main properties` dialog of the scale bar :guilabel:`Item Properties` tab
provides the following functionalities (see figure_composer_scalebar_2_):

.. _Figure_composer_scalebar_2:

.. only:: html

   **Figure Composer Scalebar 2:**

.. figure:: /static/user_manual/print_composer/scalebar_mainproperties.png
   :align: center

   Scale Bar Main properties Dialog |nix|

* First, choose the map the scale bar will be attached to.
* Then, choose the style of the scale bar. Six styles are available:

  * **Single box** and **Double box** styles, which contain one or two lines of boxes alternating colors.
  * **Middle**, **Up** or **Down** line ticks.
  * **Numeric**, where the scale ratio is printed (i.e., 1:50000).

Units and Segments
------------------

The :guilabel:`Units` and :guilabel:`Segments` dialogs of the scale bar :guilabel:`Item Properties` tab provide the following functionalities (see figure_composer_scalebar_3_):

.. _Figure_composer_scalebar_3:

.. only:: html

   **Figure Composer scalebar 3:**

.. figure:: /static/user_manual/print_composer/scalebar_units.png
   :align: center

   Scale Bar Units and Segments Dialogs |nix|

In these two dialogs, you can set how the scale bar will be represented.

* Select the units you want to use with :guilabel:`Scalebar units`. There are four possible choices: **Map Units**, the default one and **Meters**, **Feet** or **Nautical Miles** which may force unit conversions.
* The :guilabel:`Label unit multiplier` specifies how many scalebar units per labeled unit. Eg, if your scalebar units are set to "meters", a multiplier of 1000 will result in the scale bar labels in "kilometers".
* The :guilabel:`Label for units` field defines the text used to describe the units of the scale bar, eg "m" or "km". This should be matched to reflect the multiplier above.
* You can define how many :guilabel:`Segments` will be drawn on the left and on the right side of the scale bar.
* You can set how long each segment will be (:guilabel:`fixed width`), or limit the scale bar size in mm with :guilabel:`Fit segment width` option. In the latter case, each time the map scale changes, the scale bar is resized (and its label updated) to fit the range set.
* :guilabel:`Height` is used to define the height of the bar.

Display
--------

The :guilabel:`Display` dialog of the scale bar :guilabel:`Item Properties` tab provide the following functionalities (see figure_composer_scalebar_4_):

.. _Figure_composer_scalebar_4:

.. only:: html

   **Figure Composer Scalebar 4:**

.. figure:: /static/user_manual/print_composer/scalebar_display.png
   :align: center

   Scale Bar Display |nix|

You can define how the scale bar will be displayed in its frame. 

* :guilabel:`Box margin` : space between text and frame borders
* :guilabel:`Labels margin` :  space between text and scale bar drawing
* :guilabel:`Line width` : line width of the scale bar drawing
* :guilabel:`Join style` : Corners at the end of scalebar in style Bevel, Rounded or Square 
  (only available for Scale bar style Single Box & Double Box)  
* :guilabel:`Cap style` : End of all lines in style Square, Round or Flat
  (only available for Scale bar style Line Ticks Up, Down and Middle)  
* :guilabel:`Alignment` : Puts text on the left, middle or right side of the frame
  (works only for Scale bar style Numeric) 

Fonts and colors
-----------------

The :guilabel:`Fonts and colors` dialog of the scale bar :guilabel:`Item Properties` tab 
provide the following functionalities (see figure_composer_scalebar_5_):

.. _Figure_composer_scalebar_5:

.. only:: html

   **Figure Composer Scalebar 5:**

.. figure:: /static/user_manual/print_composer/scalebar_fonts.png
   :align: center

   Scale Bar Fonts and colors Dialogs |nix|

You can define the fonts and colors used for the scale bar.

* Use the **[Font]** button to set the font of scale bar label
* :guilabel:`Font color`: set the font color
* :guilabel:`Fill color`: set the first fill color 
* :guilabel:`Secondary fill color`: set the second fill color 
* :guilabel:`Stroke color`: set the color of the lines of the Scale Bar

Fill colors are only used for scale box styles Single Box and Double Box. 
To select a color you can use the list option using the dropdown arrow to open 
a simple color selection option or the more advanced color selection option, that is 
started when you click in the colored box in the dialog. 

