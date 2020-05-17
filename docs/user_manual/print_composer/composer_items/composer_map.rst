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


The Toolbar
-----------

The Map :guilabel:`Item Properties` panel embeds a toolbar with the following
functionalities:

* |refresh| :sup:`Update map preview`
* |setToCanvasExtent| :sup:`Set map canvas to match main canvas extent`
* |viewExtentInCanvas| :sup:`View current map extent in main canvas`
* |setToCanvasScale| :sup:`Set map scale to match main canvas scale`
* |viewScaleInCanvas| :sup:`Set main canvas to match current map scale`
* |showBookmarks| :sup:`Bookmarks`: set the map item extent to match
  an existing spatial bookmark
* |moveItemContent| :sup:`Interactively edit map extent`: pan and
  zoom interactively
  within the map item
* |labeling| :sup:`Labeling settings`: control feature label behaviour
  (placement, visibility...) in the layout map item extent:

  * set a :guilabel:`Margin from map edges`, a data definable distance from the
    map item's limits inside which no label should be displayed
  * |unchecked| :guilabel:`Allow truncated labels on edges of map`: controls
    whether labels which fall partially outside of the map item allowed extent
    should be rendered. If checked, these labels will be shown (when there’s
    no way to place them fully within the visible area). If unchecked then
    partially visible labels will be skipped.
  * :guilabel:`Label blocking items`: allows other layout items (such as
    scalebars, north arrows, inset maps, etc) to be marked as a blockers for
    the map labels in the **active** map item. This prevents any map labels
    from being placed under those items - causing the labeling engine to either
    try alternative placement for these labels or discard them altogether.

    If a :guilabel:`Margin from map edges` is set, the map labels are not
    placed closer than the specified distance from the checked layout items.
  * :guilabel:`Show unplaced labels`: can be used to determine whether labels
    are missing from the layout map (e.g. due to conflicts with other
    map labels or due to insufficient space to place the label) by
    highlighting them in a :ref:`predefined color <automated_placement>`.


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

.. _`layout_layers`:

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
need to refresh the view using the |refresh| :sup:`Refresh view` button of the
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

To modify a grid, select it and press the :guilabel:`Modify Grid...` button
to open the :guilabel:`Map Grid Properties` panel and access its
configuration options.

Grid Appearance
...............

In the :guilabel:`Map Grid Properties` panel, check |checkbox|
:guilabel:`Grid enabled` to show the grid on the map item.

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

* the :guilabel:`CRS`, which could be different from the project CRS
* the :guilabel:`Interval` type to use for the grid references. Available
  options are ``Map Unit``, ``Fit Segment Width``, ``Millimeter`` or ``Centimeter``:

  * choosing ``Fit Segment Width`` will dynamically select the grid interval based 
    on the map extent to a "pretty" interval. When selected, the ``Minimum`` and 
    ``Maximum`` intervals can be set.
  * the other options allow you to set the distance between two consecutive grid
    references in the ``X`` and ``Y`` directions.

* the :guilabel:`Offset` from the map item edges, in the ``X`` and/or the ``Y``
  direction
* and the :guilabel:`Blend mode` of the grid (see :ref:`blend-modes`) when
  compatible.

.. _Figure_layout_map_grid_draw:

.. figure:: img/map_grid_appearance.png
   :align: center

   Grid Appearance Dialog

Grid Frame
..........

There are different options to style the frame that holds the map.
The following options are available: ``No Frame``, ``Zebra``, ``Zebra (nautical)``,
``Interior ticks``, ``Exterior ticks``, ``Interior and Exterior ticks``,
``Line border`` and ``Line border (nautical)``.

When compatible, it's possible to set the :guilabel:`Frame size`, a
:guilabel:`Frame margin`, the :guilabel:`Frame line thickness` with associated
color and the :guilabel:`Frame fill colors`.

Using ``Latitude/Y only`` and ``Longitude/X only`` values in the divisions
section you can prevent a mix of latitude/Y and longitude/X coordinates showing
on each side when working with rotated maps or reprojected grids.
Also you can choose to set visible or not each side of the grid frame.

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

* Rename it with a double-click
* With the |signPlus| and |signMinus| buttons, add or remove overviews
* With the |arrowUp| and |arrowDown| buttons, move an overview up and down in
  the list, placing it above or below other overviews in the map item
  (when they are at the same :ref:`stack position <overview_stack_position>`).

Then select the overview item in the list and check the |checkbox|
:guilabel:`Draw "<name_overview>" overview` to enable the drawing
of the overview on the selected map frame. You can customize it with:

* The :guilabel:`Map frame` selects the map item whose
  extents will be shown on the present map item.
* The :guilabel:`Frame Style` uses the :ref:`symbol properties
  <symbol-selector>` to render the overview frame.
* The :guilabel:`Blending mode` allows you to set different transparency blend
  modes.
* The |checkbox| :guilabel:`Invert overview` creates a mask around the extents
  when activated: the referenced map extents are shown clearly, whereas
  the rest of the map item is blended with the frame fill color
  (if a fill color is used).
* The |checkbox| :guilabel:`Center on overview` pans the map item content so
  that the overview frame is displayed at the center of the map. You can only
  use one overview item to center, when you have several overviews.
  
.. _`overview_stack_position`:

* The :guilabel:`Position` controls exactly where in the map item's layer stack
  the overview will be placed, e.g. allowing an overview extent to be
  drawn below some feature layers such as roads whilst drawing it
  above other background layers. Available options are:

  * :guilabel:`Below map`
  * :guilabel:`Below map layer` and :guilabel:`Above map layer`: place the
    overview frame below and above the geometries of a layer, respectively.
    The layer is selected in the :guilabel:`Stacking layer` option.
  * :guilabel:`Below map labels`: given that labels are always rendered above
    all the feature geometries in a map item, places the overview frame above
    all the geometries and below any label.
  * :guilabel:`Above map labels`: places the overview frame above all the
    geometries and labels in the map item.


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
.. |labeling| image:: /static/common/labelingSingle.png
   :width: 1.5em
.. |moveItemContent| image:: /static/common/mActionMoveItemContent.png
   :width: 1.5em
.. |radioButtonOff| image:: /static/common/radiobuttonoff.png
   :width: 1.5em
.. |radioButtonOn| image:: /static/common/radiobuttonon.png
   :width: 1.5em
.. |refresh| image:: /static/common/mActionRefresh.png
   :width: 1.5em
.. |setToCanvasExtent| image:: /static/common/mActionSetToCanvasExtent.png
   :width: 1.5em
.. |setToCanvasScale| image:: /static/common/mActionSetToCanvasScale.png
   :width: 1.5em
.. |showBookmarks| image:: /static/common/mActionShowBookmarks.png
   :width: 1.5em
.. |showMapTheme| image:: /static/common/mActionShowPresets.png
   :width: 1.5em
.. |signMinus| image:: /static/common/symbologyRemove.png
   :width: 1.5em
.. |signPlus| image:: /static/common/symbologyAdd.png
   :width: 1.5em
.. |unchecked| image:: /static/common/checkbox_unchecked.png
   :width: 1.3em
.. |viewExtentInCanvas| image:: /static/common/mActionViewExtentInCanvas.png
   :width: 1.5em
.. |viewScaleInCanvas| image:: /static/common/mActionViewScaleInCanvas.png
   :width: 1.5em
