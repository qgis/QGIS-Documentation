Composer items common options
------------------------------

Composer items have a set of common properties you will find on the bottom of the :guilabel:`Item Properties` tab: Position and size, Rotation, Frame,
Background, Item ID and Rendering (See figure_composer_common_1_).

.. _Figure_composer_common_1:

.. only:: html

   **Figure Composer Common 1:**

.. figure:: /static/user_manual/print_composer/print_composer_common_properties.png
   :align: center

   Common Item properties Dialogs |nix|

.. _Frame_Dialog:

* The :guilabel:`Position and size` dialog lets you define size and position of the frame that contains the item. You can also choose
  which :guilabel:`Reference point` will be set at the **X** and **Y** coordinates previously defined.
* The :guilabel:`Rotation` sets the rotation of the element (in degrees).
* The |checkbox| :guilabel:`Frame` shows or hides the frame around the item.
   Click on the [Color] and [Thickness] buttons to adjust those properties.
* Use the :guilabel:`Background color` menu for setting a background color.
  Click on the [Color...] button to display a dialog where you can pick a color or choose from a custom setting. 
  Transparency can also be adjusted throught the alpha field.  
* Use the :guilabel:`Item ID` to create a relationship to other Print Composer items. This is used with |qg| server and any potential web 
  client. You can set an ID on an item (e.g., a map and a label), and then the web client can send data to set a property 
  (e.g., label text) for that specific item. The GetProjectSettings command will list what items and which IDs are available in a layout.
* :guilabel:`Rendering` mode can be selected in the option field. See Rendering_Mode_.

.. note:: 

   * If you checked |checkbox| :guilabel:`Use live-updating color chooser dialogs`
     in the QGIS general options, the color button will update as soon as you 
     choose a new color from **Color Dialog** windows. If not, you need to 
     close the **Color Dialog**.
   * The |mIconDataDefine| :sup:`Data defined override` icon next to a field 
     means that you can associate the field with data in the map item or use 
     expressions. These are particularly helpful with atlas generation 
     (See :ref:`atlas_data_defined_override`).


.. _Rendering_Mode:

.. index:: Rendering_Mode

Rendering mode
^^^^^^^^^^^^^^

|qg| now allows advanced rendering for Composer items just like vector and raster layers.

.. _figure_composer_common_2:

.. only:: html

   **Figure Composer common 2:**

.. figure:: /static/user_manual/print_composer/rendering_mode.png
   :align: center

   Rendering mode |nix|

* :guilabel:`Transparency` |slider|: You can make the underlying item in the Composer
  visible with this tool. Use the slider to adapt the visibility of your item to your needs.
  You can also make a precise definition of the percentage of visibility in the menu beside the slider.
* |checkbox| :guilabel:`Exclude item from exports`: You can decide to make an item not visible in all exports. After activating this checkbox, the item will not be included in PDF's, prints etc.. 
* :guilabel:`Blending mode`: You can achieve special rendering effects with these tools that you
  previously only may know from graphics programs. The pixels of your overlaying and underlaying items are mixed
  through the settings described below.

    * Normal: This is the standard blend mode, which uses the alpha channel of the 
      top pixel to blend with the pixel beneath it; the colors aren't mixed.
    * Lighten: This selects the maximum of each component from the foreground and 
      background pixels. Be aware that the results tend to be jagged and harsh.
    * Screen: Light pixels from the source are painted over the destination, while 
      dark pixels are not. This mode is most useful for mixing the texture of one layer 
      with another layer (e.g., you can use a hillshade to texture another layer).
    * Dodge: Dodge will brighten and saturate underlying pixels based on the lightness 
      of the top pixel. So, brighter top pixels cause the saturation and brightness of the 
      underlying pixels to increase. This works best if the top pixels aren't too bright; 
      otherwise the effect is too extreme.
    * Addition: This blend mode simply adds pixel values of one layer with pixel values of 
      the other. In case of values above 1 (as in the case of RGB), white is displayed. This 
      mode is suitable for highlighting features.
    * Darken: This creates a resultant pixel that retains the smallest components of the 
      foreground and background pixels. Like lighten, the results tend to be jagged and harsh.
    * Multiply: Here, the numbers for each pixel of the top layer are multiplied with the numbers 
      for the corresponding pixel of the bottom layer. The results are darker pictures.
    * Burn: Darker colors in the top layer cause the underlying layers to darken. Burn can be 
      used to tweak and colorise underlying layers.
    * Overlay: This mode combines the multiply and screen blending modes. In the resulting picture, 
      light parts become lighter and dark parts become darker.
    * Soft light: This is very similar to overlay, but instead of using multiply/screen it uses 
      color burn/dodge. This mode is supposed to emulate shining a soft light onto an image.
    * Hard light: Hard light is very similar to the overlay mode. It's supposed to emulate projecting 
      a very intense light onto an image.
    * Difference: Difference subtracts the top pixel from the bottom pixel, or the other way 
      around, to always get a positive value. Blending with black produces no change, as the 
      difference with all colors is zero.
    * Subtract: This blend mode simply subtracts pixel values of one layer with pixel values of 
      the other. In case of negative values, black is displayed.


Size and position
^^^^^^^^^^^^^^^^^^

Each item inside the Composer can be moved/resized to create a perfect layout.
For both operations the first step is to activate the |mActionSelect| :sup:`Select/Move item` 
tool and to click on the item; you can then move it using the mouse while holding the left button. 
If you need to constrain the movements to the horizontal or the vertical axis, just hold 
the :kbd:`Shift` while moving the mouse.
If you need a better precision, you can move a selected item using the :kbd:`Arrow keys` on the keyboard; 
if the movement is too slow, you can speed up it by holding :kbd:`Shift`.

A selected item will show squares on its boundaries; moving one of them with the mouse, will resize the item in the corresponding direction. While resizing, 
holding :kbd:`Shift` will maintain the aspect ratio. Holding :kbd:`Alt` will 
resize from the item center.

The correct position for an item can be obtained using snapping to grid or 
smart guides. Guides are set by clicking and dragging in the rulers. Guides are 
moved by clicking in the ruler, level with the guide and dragging to a new 
place. To delete a guide move it off the canvas. If you need to disable the 
snap on the fly just hold :kbd:`Ctrl` while moving the mouse.

You can choose multiple items with the |mActionSelect| :sup:`Select/Move item` button. 
Just hold the :kbd:`Shift` button and click on all the items you need. You can then resize/move
this group just like a single item.

Once you have found the correct position for an item, you can lock it by using 
the items on the toolbar or ticking the box next to the item in the 
:menuselection:`Items` tab. Locked items are **not** selectable on the canvas. 

Locked items can be unlocked by selecting the item in the 
:menuselection:`Items` tab and unchecking the tickbox or you can use the icons 
on the toolbar.

To unselect an item, just click on it holding the :kbd:`Shift` button.

Inside the :menuselection:`Edit` menu, you can find actions to select all the items, to clear all selections or 
to invert the current selection.

Alignment
^^^^^^^^^^

Raising or lowering functionalities for elements are inside the |mActionRaiseItems|
:sup:`Raise selected items` pull-down menu. Choose an element on the Print Composer
canvas and select the matching functionality to raise or lower the selected
element compared to the other elements. This order is 
shown in the :menuselection:`Items` tab. You can also raise or lower objects 
in the :menuselection:`Items` tab by clicking and dragging an object's label 
in this list.

.. _figure_composer_common_3:

.. only:: html

   **Figure Composer Common 3:**

.. figure:: /static/user_manual/print_composer/alignment_lines.png
   :align: center

   Alignment helper lines in the Print Composer |nix|

There are several alignment functionalities available within the |mActionAlignLeft|
:sup:`Align selected items` pull-down menu (see figure_composer_common_3_). To use an
alignment functionality, you first select some elements and then click on the
matching alignment icon. All selected elements will then be aligned within to their common
bounding box.
When moving items on the Composer canvas, alignment helper lines appear when borders, centers or corners are aligned.

