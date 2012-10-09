
.. _decorations:

Decorations
===========


The Decorations of QGIS includes the Copyright Label, the North Arrow and 
the Scale Bar. They are used to 'decorate' the map by adding cartographic 
elements.

.. note:: 
   Before QGIS 1.8 the same functionality was provided by the Decoration 
   Plugin.


Copyright Label
***************


|copyright_label| :menuselection:`Copyright label` adds a Copyright label 
of your choice, using the text you prefer to the map.

.. _figure_decorations_1:

.. figure:: /static/user_manual/introduction/copyright.png
   :align: center
   :width: 20em 

   Figure Decorations 1: Your own copyright added |nix|


#.  Select from menu :menuselection:`View --> Decorations --> Copyright Label`.
#.  Enter the text you want to place on the map. You can use HTML as
    shown in the example
#.  Choose the placement of the label from the :guilabel:`Placement` 
    'Bottom Right' drop-down box
#.  Make sure the |checkbox| :guilabel:`Enable Copyright Label` checkbox is 
    checked
#.  Click **[OK]**


In the example above (default) places a copyright symbol followed by the 
date in the lower right hand corner of the map canvas.


North Arrow
***********


|north_arrow| :menuselection:`North Arrow` places a simple north arrow on the 
map canvas. At present there is only one style available. You can adjust the 
angle of the arrow or let QGIS set the direction automatically. If you choose 
to let QGIS determine the direction, it makes its best guess as to how the 
arrow should be oriented. For placement of the arrow you have four options,
corresponding to the four corners of the map canvas.

.. _figure_decorations_2:

.. figure:: /static/user_manual/introduction/north_arrow.png
   :align: center
   :width: 20em 

   Figure Decorations 2: The North Arrow |nix|
 

Scale Bar
*********


|scale_bar| :menuselection:`Scale Bar` adds a simple scale bar to the map 
canvas. You control the style and placement, as well as the labeling of the bar.

QGIS only supports displaying the scale in the same units as your map frame. 
So if the units of your layers are in meters, you can't create a scale bar in
feet. Likewise if you are using decimal degrees, you can't create a scale
bar to display distance in meters.

To add a scale bar:


#.  Select from menu :menuselection:`View --> Decorations --> Scale Bar`
#.  Choose the placement from the :guilabel:`Placement` 'Bottom Left'  
    drop-down list
#.  Choose the style from the :guilabel:`Scale bar style` 'Tick Down' list
#.  Select the color for the bar :guilabel:`Color of bar` 'black' or use 
    the default black color
#.  Set the size of the bar and its label :guilabel:`Size of bar` '30 degrees'
#.  Make sure the |checkbox| :guilabel:`Enable scale bar` checkbox is checked
#.  Optionally choose to automatically snap to a round number when the
    canvas is resized |checkbox| guilabel`Automatically snap to round number 
    on resize`
#.  Click **[OK]**

.. _figure_decorations_3:

.. figure: /static/user_manual/introduction/scale_bar.png
   :align: center
   :width: 20em 

   Figure Decorations 3: The Scale Bar |nix|

.. tip:: Settings of Decorations

   When you save a .qgs project, any changes you have made to NorthArrow, 
   ScaleBar and Copyright will be saved in the project and restored 
   the next time you load the project.
