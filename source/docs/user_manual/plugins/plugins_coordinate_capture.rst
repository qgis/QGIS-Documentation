|updatedisclaimer|

.. comment out this Section (by putting '|updatedisclaimer|' on top) if file is not uptodate with release

.. _coordcapt:

Coordinate Capture Plugin
=========================

The coordinate capture plugin is easy to use and provides the ability to display
coordinates on the map canvas for two selected coordinate reference systems (CRS).

.. _figure_coordinate_capture_1:

.. only:: html

   **Figure Coordinate Capture 1:**

.. figure:: /static/user_manual/plugins/coordinate_capture_dialog.png
   :align: center

   Coordinate Capture Plugin |nix|

#. Start |qg|, select |mActionOptions| :guilabel:`Project Properties` from the
   :guilabel:`Settings` (KDE, Windows) or :guilabel:`File` (Gnome, OSX) menu
   and click on the :guilabel:`Projection` tab. As an alternative, you can also
   click on the |mIconProjectionEnabled| :sup:`CRS status` icon in the lower
   right-hand corner of the status bar.
#. Click on the |checkbox| `Enable on the fly projection` checkbox and select
   a projected coordinate system of your choice (see also :ref:`label_projections`).
#. Load the coordinate capture plugin in the Plugin Manager (see
   :ref:`load_core_plugin`) and ensure that the dialog is visible by going to
   :menuselection:`View --> Panels` and ensuring that |checkbox|
   :guilabel:`Coordinate Capture` is enabled. The coordinate capture dialog
   appears as shown in Figure figure_coordinate_capture_1_. Alternatively,
   you can also go to :menuselection:`Vector --> Coordinate Capture` and see
   if |checkbox| :guilabel:`Coordinate Capture` is enabled.
#. Click on the |geographic| :sup:`Click to the select the CRS to use for
   coordinate display` icon and select a different CRS from the one you selected
   above.
#. To start capturing coordinates, click on **[Start capture]**. You can now
   click anywhere on the map canvas and the plugin will show the coordinates for
   both of your selected CRS.
#. To enable mouse coordinate tracking, click the |tracking| :sup:`mouse tracking`
   icon.
#. You can also copy selected coordinates to the clipboard.
