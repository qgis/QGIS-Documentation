|updatedisclaimer|


Composer Items Common Options
==============================

.. only:: html

   .. contents::
      :local:

Composer items have a set of common properties you will find on the bottom of
the :guilabel:`Item Properties` tab: Position and size, Rotation, Frame,
Background, Item ID and Rendering (See figure_composer_common_1_).

.. _Figure_composer_common_1:

.. only:: html

   **Figure Composer Common 1:**

.. figure:: /static/user_manual/print_composer/common_properties.png
   :align: center

   Common Item properties Dialogs

.. _Frame_Dialog:

* The :guilabel:`Position and size` dialog lets you define the size and position of the frame
  which contains the item.
  You can also choose which :guilabel:`Reference point` will be set at the **X** and **Y**
  coordinates previously defined.
* The :guilabel:`Rotation` sets the rotation of the element (in degrees).
* The |checkbox| :guilabel:`Frame` shows or hides the frame around the item.
  Click on the [Color] and [Thickness] buttons to adjust those properties.
* Use the :guilabel:`Background color` menu for setting a background color.
  Click on the [Color...] button to display a dialog where you can pick a color
  or choose from a custom setting.
  Transparency can be adjusted through atlering the alpha field settings.
* Use the :guilabel:`Item ID` to create a relationship to other Print Composer items.
  This is used with QGIS server and other potential web
  clients. You can set an ID on an item (for example, a map or a label), and then the web client
  can send data to set a property
  (e.g., label text) for that specific item. The GetProjectSettings command will list the items
  and IDs which are available in a layout.
* :guilabel:`Rendering` mode helps you set whether and how the item can be displayed.

.. note::

   * If you checked |checkbox| :guilabel:`Use live-updating color chooser dialogs`
     in the QGIS general options, the color button will update as soon as you
     choose a new color from **Color Dialog** windows. If not, you need to
     close the **Color Dialog**.
   * The |dataDefined| :sup:`Data defined override` icon next to a field
     means that you can associate the field with data in the map item or use
     expressions. These are particularly helpful with atlas generation
     (See :ref:`atlas_data_defined_override`).


.. index:: Rendering_Mode

.. _Composer_Rendering_Mode:

Rendering mode
--------------

QGIS now allows advanced rendering for Composer items just like vector and raster layers.

.. _figure_composer_common_2:

.. only:: html

   **Figure Composer common 2:**

.. figure:: /static/user_manual/print_composer/rendering_mode.png
   :align: center

   Rendering mode

* :guilabel:`Blending mode`: With this tool you can achieve effects which would otherwise
  only be achieved using graphic rendering software. The pixels of your overlaying and
  underlaying items can be mixed according to the mode set (see :ref:`blend-modes`
  for description of each effect).
* :guilabel:`Transparency` |slider|: You can make the underlying item in the Composer visible
  with this tool.
  Use the slider to adapt the visibility of your item to your needs.
  You can also make a precise definition of the percentage of visibility in the menu beside the
  slider.
* |checkbox| :guilabel:`Exclude item from exports`: You can decide to make an item invisible in
  all exports.
  After activating this checkbox, the item will not be included in export to PDF, print etc..


Size and position
------------------

Each item inside the Composer can be moved and resized to create a perfect layout.
For both operations the first step is to activate the |select| :sup:`Select/Move item` tool
and to click on the item; you can then move it using the mouse while holding the left button.
If you need to constrain the movements to the horizontal or the vertical axis, just hold
the :kbd:`Shift` button on the keyboard while moving the mouse.
If you need better precision, you can move a selected item using the :kbd:`Arrow keys` on the keyboard;
if the movement is too slow, you can speed up it by holding :kbd:`Shift`.

A selected item will show squares on its boundaries; moving one of them with the mouse, will resize
the item in the corresponding direction. While resizing,
holding :kbd:`Shift` will maintain the aspect ratio. Holding :kbd:`Alt` will
resize from the item center.

The correct position for an item can be obtained using the grid snapping or
smart guides. Guides are set by clicking and dragging within the ruler area. To move a guide,
click on the ruler, level with the guide and drag it to a new
position. To delete a guide move it off the canvas. If you need to disable the
snap on the fly, hold :kbd:`Ctrl` while moving the mouse.

You can choose multiple items with the |select| :sup:`Select/Move item` button.
Just hold the :kbd:`Shift` button and click on all the items you need.
You can then resize/move this group like a single item.

Once you have found the correct position for an item, you can lock it by using
the items on the toolbar or ticking the box next to the item in the
:menuselection:`Items` tab. Locked items are **not** selectable on the canvas.

Locked items can be unlocked by selecting the item in the
:menuselection:`Items` tab and unchecking the tickbox or you can use the icons
on the toolbar.

To unselect an item, just click on it holding the :kbd:`Shift` button.

Inside the :menuselection:`Edit` menu, you can find actions to select all the items,
to clear all selections or to invert the current selection.


.. index:: Items_Alignment

Alignment
----------

Raising or lowering the visual hierarchy for elements are inside the |raiseItems|
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

   Alignment helper lines in the Print Composer

There are several alignment options available within the |alignLeft|
:sup:`Align selected items` pull-down menu (see figure_composer_common_3_). To use an
alignment function, you first select the elements then click on the
matching alignment icon. All selected elements will then be aligned to their common bounding box.
When moving items on the Composer canvas, alignment helper lines appear when borders, centers or
corners are aligned.

