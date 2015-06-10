|updatedisclaimer|

.. _arrow_item:

The Arrow item
===============

To add an arrow, click the |mActionAddArrow| :sup:`Add Arrow` icon, place the element holding 
down the left mouse button and drag a line to draw the arrow on the Print Composer canvas and 
position and customize the appearance in the scale bar :guilabel:`Item Properties` tab.

When you also hold down the :kbd:`Shift` key while placing the arrow, it is placed in an angle 
of exactly 45\ |degrees| .

The arrow item can be used to add a line or a simple arrow that can be used, for example, to 
show the relation between other print composer items. To create a north arrow, the image item should 
be considered first. |qg| has a set of North arrows in SVG format. Furthermore you can connect 
an image item with a map so it can rotate automatically with the map (see :ref:`image_item`).

.. _figure_composer_arrow:

.. only:: html

   **Figure Composer Arrow:**

.. figure:: /static/user_manual/print_composer/print_composer_arrow.png
   :align: center

   Arrow Item properties Tab |nix|

Item Properties
---------------

The :guilabel:`Arrow` item properties tab allows you to configure an arrow item.

The  **[Line style ...]** button can be used to set the line style using the line style symbol editor.

In :guilabel:`Arrows markers` you can select one of three radio buttons.
 
* :guilabel:`Default` : To draw a regular arrow, gives you options to style the arrow head 
* :guilabel:`None` : To draw a line without arrow head
* :guilabel:`SVG Marker` : To draw a line with an SVG :guilabel:`Start marker` and/or :guilabel:`End marker`

For :guilabel:`Default` Arrow marker you can use following options to style the arrow head.

* :guilabel:`Arrow outline color` : Set the outline color of the arrow head
* :guilabel:`Arrow fill color` : Set the fill color of the arrow head
* :guilabel:`Arrow outline width` : Set the outline width of the arrow head
* :guilabel:`Arrow head width`: Set the size of the arrow head
  
For :guilabel:`SVG Marker` you can use following options. 

* :guilabel:`Start marker` : Choose an SVG image to draw at the beginning of the line
* :guilabel:`End marker` : Choose an SVG image to draw at the end of the line
* :guilabel:`Arrow head width`: Set the size of Start and/or End marker

SVG images are automatically rotated with the line. The color of the SVG image can not be changed.


