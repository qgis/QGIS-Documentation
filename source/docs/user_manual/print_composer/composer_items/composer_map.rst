.. only:: html

   |updatedisclaimer|

.. index:: Layout; Map item
.. _layout_map_item:

The Map Item
=============

.. only:: html

   .. contents::
      :local:


The map item is the main frame that displays the map you've designed in the map
canvas.
Use the |addMap| :guilabel:`Add Map` tool following :ref:`items creation
instructions <create_layout_item>` to add a new map item that you can later
manipulate the same way as exposed in :ref:`interact_layout_item`.

By default, a new map item shows the current status of the :ref:`map canvas
<label_mapview>` with its extent and visible layers. You can customize it
thanks to the :guilabel:`Item Properties` panel. Other than the :ref:`items
common properties <item_common_properties>`, this feature has the following
functionalities:

.. _figure_layout_map:

.. figure:: img/map_mainproperties.png
   :align: center

   Map Item Properties Panel


.. _`layout_main_properties`:

Main properties
---------------

In the :guilabel:`Main properties` group (see figure_layout_map_) of the map
:guilabel:`Item Properties` panel, available options are:

* The :guilabel:`Update Preview` button to refresh the map item rendering if the view
  in map canvas has been modified. Note that most of the time, the map item
  refresh is automatically triggered by the changes;
* The :guilabel:`Scale` to manually set the map item scale;
* The :guilabel:`Map rotation` allows you to rotate the map item content
  clockwise in degrees. The rotation of the map canvas can be imitated here;
* The :guilabel:`CRS` allows you to display the map item content in any
  :ref:`CRS <crs_selector>`. It defaults to ``Use project CRS``;
* |checkbox| :guilabel:`Draw map canvas items` lets you show in the print
  layout :ref:`annotations <sec_annotations>` that are placed on the main map
  canvas.

Layers
------

By default, map item appearance is synced with the map canvas rendering meaning
that toggling visibility of the layers or modifying their style in the
:guilabel:`Layers Panel` is automatically applied to the map item. Because,
like any other item, you may want to add multiple map items to a print layout,
there's a need to break this synchronization in order to allow showing
different areas, layer combinations, at different scales...
The :guilabel:`Layers` properties group (see figure_layout_map_layers_) helps
you do that.

.. _figure_layout_map_layers:

.. figure:: img/map_layers.png
   :align: center

   Map Layers group


If you want to keep the map item consistent with an existing :ref:`map theme
<map_themes>`, check |checkbox| :guilabel:`Follow map theme` and select the
desired theme in the drop-down list. Any changes applied to the theme in QGIS'
main window (using the replace theme function) will automatically affect the
map item.
If a map theme is selected, the :guilabel:`Lock styles for layers` option is
disabled because :guilabel:`Follow map theme` also updates the
style (symbology, labels, diagrams) of the layers.

To lock the layers shown in a map item to the current map canvas visibility,
check |checkbox| :guilabel:`Lock layers`. When this option is enabled, any
changes on the layers' visibility in QGIS' main window will not affect
the layout's map item. Nevertheless, style and labels of locked
layers are still refreshed according to QGIS' main window.
You can prevent this by using :guilabel:`Lock styles for layers`.

Instead of using the current map canvas, you can also lock the layers of the
map item to those of an existing map theme: select a map theme from the
|showMapTheme| :sup:`Set layer list from a map theme` drop-down button, and the
|checkbox| :guilabel:`Lock layers` is activated. The set of visible layers in
the map theme is from now on used for the map item until you select another map
theme or uncheck the |checkbox| :guilabel:`Lock layers` option. You then may
need to refresh the view using the |draw| :sup:`Refresh view` button of the
:guilabel:`Navigation` toolbar or the :guilabel:`Update Preview` button seen above.

Note that, unlike the :guilabel:`Follow map theme` option, if the
:guilabel:`Lock layers` option is enabled and set to a map theme, the layers in
the map item will not be refreshed even if the map theme is updated (using the
replace theme function) in QGIS' main window.

Locked layers in the map item can also be :ref:`data-defined <data_defined>`,
using the |dataDefined| icon beside the option. When used, this overrides the
selection set in the drop-down list. You need to pass a list of layers
separated by ``|`` character.
The following example locks the map item to use only layers ``layer 1`` and
``layer 2``::

  concat ('layer 1', '|', 'layer 2')


Extents
-------

The :guilabel:`Extents` group of the map item properties panel provides the
following functionalities (see figure_layout_map_extents_):

.. _figure_layout_map_extents:

.. figure:: img/map_extents.png
   :align: center

   Map Extents group

The **Extents** area displays ``X`` and ``Y`` coordinates of the area shown
in the map item. Each of these values can be manually replaced, modifying the
map canvas area displayed and/or map item size.
Clicking the :guilabel:`Set to Map Canvas Extent` button sets the extent of the
layout map item to the extent of the main map canvas.
The button :guilabel:`View Extent in Map Canvas` does exactly the opposite; it
updates the extent of the main map canvas to the extent of the layout map item.

You can also alter a map item extent using the |moveItemContent| :sup:`Move
item content` tool: click-and-drag within the map item to modify its current
view, keeping the same scale. With the |moveItemContent| tool enabled, use the
mouse wheel to zoom in or out, modifying the scale of the shown map. Combine
the movement with :kbd:`Ctrl` key pressed to have a smaller zoom.

.. index:: Atlas
.. _controlled_atlas:

Controlled by atlas
-------------------

The |checkbox| :guilabel:`Controlled by atlas` group properties is available
only if an :ref:`atlas <atlas_generation>` is active in the print layout. Check
this option if you want the map item being ruled by the atlas; when iterating
over the coverage layer, the map item extent is panned/zoomed to the atlas
feature following:

* |radioButtonOn| :guilabel:`Margin around features`: zooms to the feature at the
  best scale, keeping around each a margin representing a percentage of the map
  item width or height. The margin can be the same for all features or :ref:`set
  variable <data_defined>`, e.g., depending on map scale;
* |radioButtonOff| :guilabel:`Predefined scale (best fit)`: zooms to the feature
  at the project :ref:`predefined scale <predefinedscales>` where the atlas
  feature best fits;
* |radioButtonOff| :guilabel:`Fixed scale`: atlas features are panned from one
  to another, keeping the same scale of the map item. Ideal when working with
  features of same size (e.g., a grid) or willing to highlight size differences
  among atlas features.

.. index:: Grids, Map grid

Grids
-----

With grids, you can add, over your map, information relative to its extent or
coordinates, either in the map item projection or a different one. The
:guilabel:`Grids` group provides the possibility to add several grids to a
map item.

* With the |signPlus| and |signMinus| buttons you can add or remove a selected
  grid;
* With the |arrowUp| and |arrowDown| buttons you can move up and down a grid in
  the list, hence move it on top or bottom of another one, over the map item.

Double-click the added grid to rename it.

.. _Figure_layout_map_grid:

.. figure:: img/map_grids.png
   :align: center

   Map Grids Dialog

After you add a grid, you can activate the checkbox |checkbox| :guilabel:`Draw
grid` to allow overlaying the grid onto the map item. Press the :guilabel:`Modify Grid...`
button to access configuration options.

Grid Appearance
...............

As grid type, you can specify to use a:

* *Solid*: shows a line across the grid frame. The :guilabel:`Line style` can
  be customized using :ref:`color <color-selector>` and :ref:`symbol
  <symbol-selector>` selector widget;
* *Cross*: displays segment at the grid lines intersection for which you can
  set the :guilabel:`Line style` and the :guilabel:`Cross width`;
* *Markers*: only displays customizable markers symbol at grid lines
  intersection;
* or *Frame and annotations only*.

Other than the grid type, you can define:

* the :guilabel:`CRS` which could not be the same as the map item's;
* the :guilabel:`Interval` between two consecutive grid references in ``X``
  and ``Y`` directions;
* the :guilabel:`Interval Units` to use for the grid references, in ``Map
  units``, ``Millimeters`` or ``Centimeters``;
* an :guilabel:`Offset` from the map item edges, in ``X`` and ``Y`` directions;
* and the :guilabel:`Blend mode` of the grid (see :ref:`blend-modes`) when
  compatible.

.. _Figure_layout_map_grid_draw:

.. figure:: img/map_draw_grid.png
   :align: center

   Draw Grid Dialog

Grid Frame
..........

There are different options to style the frame that holds the map.
Following options are available: ``No Frame``, ``Zebra``, ``Interior ticks``,
``Exterior ticks``, ``Interior and Exterior ticks`` and ``Line border``.
Also you can choose to set visible or not each side of the grid frame.


When compatible, it's possible to set the :guilabel:`Frame size`,
:guilabel:`Frame line thickness`, :guilabel:`Frame fill colors`.
With ``Latitude/Y only`` and ``Longitude/X only`` settings in the divisions
section you have the possibility to prevent a mix of latitude/Y and longitude/X
coordinates showing on a side when working with rotated maps or reprojected
grids.

.. _Figure_layout_map_frame:

.. figure:: img/map_grid_frame.png
   :align: center

   Grid Frame Dialog

Coordinates
...........

The |checkbox| :guilabel:`Draw coordinates` checkbox allows you to add
coordinates to the map frame. You can choose the annotation numeric format,
the options range from decimal to degrees, minute and seconds, with or without
suffix, aligned or not and a custom format using the expression dialog.

You can choose which annotation to show. The options are: show all, latitude
only, longitude only, or disable(none). This is useful when the map is rotated.
The annotation can be drawn inside or outside the map frame. The annotation
direction can be defined as horizontal, vertical ascending or vertical
descending.

Finally, you can define the annotation font, font color, distance from the map
frame and the precision of the drawn coordinates.

.. _figure_layout_map_coord:

.. figure:: img/map_grid_draw_coordinates.png
   :align: center

   Grid Draw Coordinates dialog


.. index:: Location map, Map overview

Overviews
---------

Sometimes you may have more than one map in the print layout and would like to
locate the study area of one map item on another one. This could be for example
to help map readers identify the area in relation with its larger geographic
context shown in the second map.

The :guilabel:`Overviews` group of the map panel helps you create the link
between two different maps extent and provides the following functionalities:

.. _figure_layout_map_overview:

.. figure:: img/map_overview.png
   :align: center

   Map Overviews group

To create an overview, select the map item on which you want to show the other
map item's extent and expand the :guilabel:`Overviews` option in the
:guilabel:`Item Properties` panel. Then press the |signPlus| button to add
an overview.

Initially this overview is named 'Overview 1' (see Figure_layout_map_overview_).
You can:

* Rename it with a double-click;
* With the |signPlus| and |signMinus| buttons, add or remove overviews;
* With the |arrowUp| and |arrowDown| buttons, move up and down an overview in
  the list, hence move it on top or bottom of another one, over the map item.

Then select the overview item in the list and check the |checkbox|
:guilabel:`Draw "<name_overview>" overview` to enable the overview
drawing over the selected map frame. You can customize it with:

* The :guilabel:`Map frame` combo list can be used to select the map item whose
  extents will be drawn on the present map item.
* The :guilabel:`Frame Style` allows you to change the style of the overview frame.
* The :guilabel:`Blending mode` allows you to set different transparency blend modes.
* The |checkbox| :guilabel:`Invert overview` creates a mask around the extents when
  activated: the referenced map extents are shown clearly, whereas everything else
  is blended with the frame color.
* The |checkbox| :guilabel:`Center on overview` puts the extent of the overview
  frame in the center of the overview map. You can only activate one overview
  item to center, when you have added several overviews.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |addMap| image:: /static/common/mActionAddMap.png
   :width: 1.5em
.. |arrowDown| image:: /static/common/mActionArrowDown.png
   :width: 1.5em
.. |arrowUp| image:: /static/common/mActionArrowUp.png
   :width: 1.5em
.. |checkbox| image:: /static/common/checkbox.png
   :width: 1.3em
.. |dataDefined| image:: /static/common/mIconDataDefine.png
   :width: 1.5em
.. |draw| image:: /static/common/mActionDraw.png
   :width: 1.5em
.. |moveItemContent| image:: /static/common/mActionMoveItemContent.png
   :width: 1.5em
.. |radioButtonOff| image:: /static/common/radiobuttonoff.png
.. |radioButtonOn| image:: /static/common/radiobuttonon.png
.. |showMapTheme| image:: /static/common/mActionShowPresets.png
   :width: 1.5em
.. |signMinus| image:: /static/common/symbologyRemove.png
   :width: 1.5em
.. |signPlus| image:: /static/common/symbologyAdd.png
   :width: 1.5em
.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
