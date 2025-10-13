.. index:: Layout; Elevation profile item
.. _layout_elevation_profile_item:

The Elevation Profile Item
==========================

.. only:: html

   .. contents::
      :local:


The Elevation Profile item is used to display an :ref:`elevation profile view <label_elevation_profile_view>` in a layout.
Use the |elevationProfile| :guilabel:`Add Elevation Profile` button,
and follow :ref:`items creation instructions <create_layout_item>` to add a new
elevation profile item that you can later manipulate the same way as demonstrated in :ref:`interact_layout_item`.

A new elevation profile item has default settings that make it render an empty chart.
You can customize its properties in the :guilabel:`Item Properties` panel.
In addition to the :ref:`common properties <item_common_properties>`,
this feature has the following functionalities:

.. todo: add properties screenshot
   .. _figure_layout_elevationprofile_prop:

   .. figure:: img/elevationprofile_properties.png
   :align: center
   :width: 20em

   Elevation Profile Item Properties


The Elevation profile :guilabel:`Item Properties` panel embeds a top toolbar
with the following functionalities:

* |refresh| :sup:`Update elevation profile` to refresh the item rendering
* |copyProfileSettings| :sup:`Copy from elevation profile`: a drop-down menu to select an elevation profile view from.
  The view settings are applied to the layout elevation profile item, and can be later modified.

Layers
------

Under the :guilabel:`Layers` group, check in the tree view the layers
you would like to render in the profile item.
Remember to properly configure the :guilabel:`Elevation` properties of the selected layers.

Profile curve
-------------

* |unchecked| :guilabel:`Controlled by atlas`:
  the :ref:`profile curve <elevation_profile_create>` will be taken from the current atlas feature
  and the elevation profile view updated as you walk through the atlas features.
  This is currently supported for an active layout atlas or report, using a line geometry type coverage layer.
* The :guilabel:`Tolerance` distance, which can be data-defined, helps you control how far a feature of the visible layers
  should be from the profile curve in order to display in the layout elevation view.
  Only point features are currently returned.

Chart ranges
------------

A layout elevation profile item does not necessarily display the full extent of the elevation profile view it is based on.
You can limit the area to render, providing:

* on the X axis, the :guilabel:`Minimum distance` and :guilabel:`Maximum distance` from the profile curve starting point
* On the Y axis, the :guilabel:`Minimum elevation` and :guilabel:`Maximum elevation`

Distance and elevation axes
---------------------------

The :guilabel:`Distance axis` and :guilabel:`Elevation axis` groups give options
to tweak the grid over the elevation profile item, respectively on the X and Y axes:

* the distance display :guilabel:`Unit`, allowing to override the map canvas unit
* the graduation on the axis with both a :guilabel:`Major interval` and :guilabel:`Minor interval`
* the line symbols to apply to the corresponding :guilabel:`Major grid lines` and :guilabel:`Minor grid lines`
* how regular the graduation items should be labeled (:guilabel:`Label interval`)
  as well as their :guilabel:`Label format` and :guilabel:`Label font`
* the :guilabel:`Distance labels`: configures whether the distance unit symbol should be placed
  next to :guilabel:`Every value`, :guilabel:`First value`, :guilabel:`Last value`,
  :guilabel:`First and last values`, or skipped (:guilabel:`None`)

Chart area
----------

Under :guilabel:`Chart area`, you can configure the rendering of the area
in which the elevation profile plot is actually displayed:

* a :guilabel:`Background` fill symbol
* a :guilabel:`Border` line symbol
* the margins from the elevation profile item border


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |copyProfileSettings| image:: /static/common/mActionCopyProfileSettings.png
   :width: 1.5em
.. |elevationProfile| image:: /static/common/mActionElevationProfile.png
   :width: 1.5em
.. |refresh| image:: /static/common/mActionRefresh.png
   :width: 1.5em
.. |unchecked| image:: /static/common/unchecked.png
   :width: 1.3em
