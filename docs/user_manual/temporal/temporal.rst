.. _`temporal`:

****************
Temporal Support
****************

.. only:: html

   .. contents::
      :local:

QGIS can handle temporal control on loaded layers depending on the information
of the data. 

Different providers are supported:

* raster layers
* vector layers
* mesh layers
* WMST

Activating the temporal control support means setting up the temporal options on
the layer(s) and then enabling the temporal view QGIS-wide.

The temporal support is also available in the print layout: you can export time
based maps.

Furthermore, many variables are added to the Field Calculator so that you can
use them to change the appearance of the layer(s) depending on the current map
frame.


General concepts
================
Temporal control settings are available at different levels:

* in the `Temporal` tab within the project properties :menuselection:`Project --> Properties`
* in the properties on the single layer(s)

The whole temporal control is activated with the |temporal| icon located in the
main toolbar. Once clicked the temporal panel will appear:

.. _temporal_controller:

.. figure:: img/temporal_controller_panel.png
   :align: center

   Temporal Controller Panel

The temporal panel has 3 main icons:

* |indicatorTemporalOff| :guilabel:`Turn off temporal navigation`: all the temporal 
  settings are diabled
* |indicatorTemporalFixedRange| :guilabel:`Fixed range tamporal navigation`: a 
  fixed time range is set and oly layers that fit this range will be diplayed in 
  the map
* |indicatorTemporalAnimated| :guilabel:`Animated tamporal navigation`: the map
  will be animated depending on the layer settings and temporal customization

In order to link the visible layers with the time range you have first to tweak
the single layer temporal settings.


.. _raster_temporal:

Raster Layers
=============
Normally raster layers don't have any temporal metadata set. Therefore you have
to choose layer by layer the temporal settings like the start date and
eventually the end date:

.. figure:: img/raster_layer_temporal_settings_1.png
   :align: center

   Raster Layer Temporal Settings

In this example the raster layer has a ``Start date`` set to ``2013-06-30 00:00:00``
and no ``End Date``. It means that the raster will be convered by other rasters
that have a more recent start date set.

Once you have enabled the temporal control on the layer the
|indicatorTemporalFixedRange| icon will be dislayed next to the layer name in
the legend to remind you that the layer is temporal controlled:

.. figure:: img/temporal_icon_legend.png
   :align: center

   Temporal icon in the legend

You can click on the icon to quickly go to the temporal layer settings.

If you have many different raster layers loaded in the legend be sure to tweak
the temporal settings for each layer. In the following example the name of the
layers describes the date.

If you open the main temporal panel with the |temporal| button you can animate
the map with by clicking the |indicatorTemporalAnimated| :guilabel:`Animated
tamporal navigation` button.

Before to play the map you have to set the temporal options shown in the bottom
part of the ``Animated temporal navigation`` panel:

* ``Range``: the starting and ending datetime range
* ``Step``: how often the map should update

.. figure:: img/animated_raster_options.png
   :align: center

   Animated Temporal Navigation Options

Once you have set the temporal options you can animate the map with the |play|
button. Use all the other buttons to pause, stop, rewind and forward the map:

.. figure:: img/play_bar.png
   :align: center

   Animated Temporal Navigation Buttons

If the |unchecked| :guilabel:`Loop` checkbox in the upper right part of the bar
if checked the animation will be endlessly repeated.

.. figure:: img/temporal.gif
   :align: center



.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |indicatorTemporalAnimated| image:: /static/common/mTemporalNavigationAnimated.png
   :width: 1.5em
.. |indicatorTemporalFixedRange| image:: /static/common/mTemporalNavigationFixedRange.png
   :width: 1.5em
.. |indicatorTemporalOff| image:: /static/common/mTemporalNavigationOff.png
   :width: 1.5em
.. |play| image:: /static/common/mActionPlay.png
   :width: 1.5em
.. |temporal| image:: /static/common/temporal.png
   :width: 1.5em
.. |unchecked| image:: /static/common/checkbox_unchecked.png
   :width: 1.3em
