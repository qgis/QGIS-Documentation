
.. _decorations:

Decorations
===========


The Decorations of QGIS includes the Copyright Label Plugin, the North
Arrow Plugin and the Scale Bar Plugin. They are used to ``decorate'' the
map by adding cartographic elements.

.. note:: 
   Before QGIS 1.8 the decoration plugin provided the same functionality.
   From 1.8 onwards it has become an integral part of QGIS.


Copyright Label
***************


You can add a Copyright label of your choose using the text you prefer to the map.

.. _figure_decorations_1:

.. figure:: /static/user_manual/introduction/copyright.png
   :align: centre 

   Figure Decorations 1: Your own copyright added |nix|


#.  Make sure the plugin is loaded
#.  Click on \mainmenuopt{Plugins} \arrow \dropmenuopt{Decorations} \arrow \dropmenuopttwo{copyright_label}{Copyright Label} or use the \toolbtntwo{copyright_label}{Copyright Label} button from the Toolbar.
#.  Enter the text you want to place on the map. You can use HTML as
  shown in the example
#.  Choose the placement of the label from the \selectstring{Placement}{Bottom Right} drop-down box
#.  Make sure the \checkbox{Enable Copyright Label} checkbox is checked
#.  Click \button{OK}



In the example above (default) places a copyright symbol followed by the date in the
lower right hand corner of the map canvas.

North Arrow Plugin}\label{northarrow
************************************


The North Arrow plugin places a simple north arrow on the map canvas. At
present there is only one style available. You can adjust the angle of the
arrow or let QGIS set the direction automatically. If you choose to let
QGIS determine the direction, it makes its best guess as to how the arrow
should be oriented. For placement of the arrow you have four options,
corresponding to the four corners of the map canvas.

.. _figure_decorations_2:

.. figure:: /static/user_manual/introduction/north_arrow.png
   :align: centre

   Figure Decorations 2: The North Arrow |nix|
 

Scale Bar
*********


The Scale Bar plugin adds a simple scale bar to the map canvas. You
control the style and placement, as well as the labeling of the bar.

QGIS only supports displaying the scale in the same units as your map frame. So
if the units of your layers are in meters, you can't create a scale bar in
feet. Likewise if you are using decimal degrees, you can't create a scale
bar to display distance in meters.

To add a scale bar:



#.  Click on \mainmenuopt{Plugins} \arrow \dropmenuopt{Decorations} \arrow \dropmenuopttwo{scale_bar}{Scale Bar} or use the \toolbtntwo{scale_bar}{Scale Bar} button from the Toolbar.
#.  Choose the placement from the \selectstring{Placement}{Bottom Left} drop-down list
#.  Choose the style from the \selectstring{Scale bar style}{Tick Down} list
#.  Select the color for the bar \selectcolor{Color of bar}{black} or use the default black color
#.  Set the size of the bar and its label \selectnumber{Size of bar}{30 degrees}
#.  Make sure the \checkbox{Enable scale bar} checkbox is checked
#.  Optionally choose to automatically snap to a round number when the
  canvas is resized \checkbox{Automatically snap to round number on resize}
#.  Click \button{OK}

.. _figure_decorations_3:

.. figure: /static/user_manual/introduction/scale_bar.png
   :align: centre

   Figure Decorations 3: The Scale Bar |nix|

.. tip:: Settings of Decorations

   When you save a .qgs project, any changes you have made to NorthArrow, 
   ScaleBar and Copyright plugins will be saved in the project and restored 
   the next time you load the project.
