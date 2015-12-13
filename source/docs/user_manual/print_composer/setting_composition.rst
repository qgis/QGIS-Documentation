|updatedisclaimer|


General Composition Setup
==========================

Page size and settings
----------------------

In the :guilabel:`Composition` tab, you can define the global settings of the current composition.


.. _figure_composition_1:

.. only:: html

   **Figure Composition 1:**

.. figure:: /static/user_manual/print_composer/composition_settings.png
   :align: center

   Composition settings in the Print Composer |nix|

You can choose one of the :guilabel:`Presets` formats for your paper sheet, or enter your custom :guilabel:`width`, :guilabel:`height` and :guilabel:`units`. You can also choose the page :guilabel:`Orientation` to use. 

Composition can be divided into several pages. For instance, a first page can show a map canvas, and a second page can show the attribute table associated with a layer, while a third one shows an HTML frame linking to your organization website.
Set the :guilabel:`Number of pages` to the desired value. you can also custom the :guilabel:`Page Background` with the color or the symbol you want.

The Page size options apply to all the pages in the composition. However, you can modify the values using the data defined override options (see :ref:`atlas_data_defined_override`).

A custom page size can also be set, using the :guilabel:`Resize page` tool. This creates an unique page composition, resizes the page to fit the current contents of the composition (with optional margins).


Export settings
----------------

You can define a resolution to use for all exported maps in :guilabel:`Export resolution`. This setting can however be overridden each time you are exporting a map. 
When checked, |checkbox| :guilabel:`print as raster` means all elements will be rasterized before printing or saving as PostScript or PDF.

While exporting to an image file format, you can choose to generate a world file by checking |checkbox| :guilabel:`World file on` and select a map item. The world file is created beside the exported map, has same name and contains informations to easily georeference it.

.. _figure_composition_2:

.. only:: html

   **Figure Composition 2:**

.. figure:: /static/user_manual/print_composer/composition_export.png
   :align: center

   Export Settings in the Print Composer |nix|

Grid and guides
----------------

:guilabel:`Grid and guides` lets you customize grid settings like :guilabel:`Grid spacing`, :guilabel:`Grid offset` and :guilabel:`Snap tolerance` to your need. The tolerance is the maximum distance below which an item is snapped to smart guides.
Snap to grid and/or to smart guides can be enabled from the :menuselection:`View` menu. In that menu, you can also set the style and color of the grid. The options defined in :menuselection:`View` menu are applied by default to any new print composer.

  
.. _figure_composition_3:

.. only:: html

   **Figure Composition 3:**

.. figure:: /static/user_manual/print_composer/composition_guides.png
   :align: center

   Snapping to grids in the Print Composer |nix|
