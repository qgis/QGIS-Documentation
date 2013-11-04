.. |updatedisclaimer|
.. _`sec_gpstracking`:

Live GPS tracking
==================

To activate Live GPS tracking in |qg| you need to select :menuselection:`Settings --> Panels`
|checkbox| :guilabel:`GPS information`. You will get a new docked window on the
left side of the canvas.

There are 4 possible screens in this GPS tracking window:

* |mActionToggleEditing| GPS position coordinates and for manually entering
  Vertices and Features.
* |gpstrack_barchart| GPS signal strength of satellite connections.
* |gpstrack_polarchart| GPS polar screen showing number and polar position of
  satellites.
* |mActionOptions| GPS options screen (see figure_gps_options_).

With a plugged in GPS receiver (has to be supported by your operating system)
a simple click on **[Connect]** connects the GPS to |qg|. A second click (now
on **[Disconnect]**) disconnects the GPS-receiver from your computer. For GNU/Linux
gpsd support is integrated to support connection to most GPS receivers. Therefore
you first have to configure gpsd properly to connect |qg| to it.

.. warning::
   If you want to record your position to the canvas you have to create a new
   vector layer first and switch it to editable status to be able to record your
   track.

Position and additional attributes
----------------------------------

|mActionToggleEditing| If the GPS is receiving signals from satellites you will
see your position in latitude, longitude and altitude together with additional
attributes.

.. _figure_gps_position:

.. only:: html

   **Figure GPS Position:**

.. figure:: /static/user_manual/working_with_gps/gpstrack_main.png
   :align: center
   :width: 15em

   GPS tracking position and additional attributes |nix|

GPS signal strength
-------------------

|gpstrack_barchart| Here you can see the signal strenght of the satellites you
are receiving signals from.

.. _figure_gps_strength:

.. only:: html

   **Figure GPS Strength:**

.. figure:: /static/user_manual/working_with_gps/gpstrack_stren.png
   :align: center
   :width: 15em

   GPS tracking signal strength |nix|


GPS polar window
----------------

|gpstrack_polarchart| If you want to know where in the sky all the connected
satellites are, you have to switch to the polar screen. You can also see the
ID numbers of the satellites you are receiving signals from.

.. _figure_gps_polar:

.. only:: html

   **Figure GPS polar window:**

.. figure:: /static/user_manual/working_with_gps/gpstrack_polar.png
   :align: center
   :width: 15em

   GPS tracking polar window |nix|

GPS options
-----------

|mActionOptions| In case of connection problems you can switch between:

* |radiobuttonon| :guilabel:`Autodetect`
* |radiobuttonoff| :guilabel:`Internal`
* |radiobuttonoff| :guilabel:`Serial device`
* |radiobuttonoff| :guilabel:`gpsd` (selecting Host, Port and Device your
  GPS is connected to)

A click on **[Connect]** again initiates the connection to the GPS receiver.

.. _figure_gps_options:

.. only:: html

   **Figure GPS Tracking 2:**

.. figure:: /static/user_manual/working_with_gps/gpstrack_options.png
   :align: center
   :width: 12em

   GPS tracking options window |nix|

You can activate |checkbox| :menuselection:`Automatically save added features`
when you are in editing mode. Or you can can activate |checkbox|
:guilabel:`Automatically add points` to the map canvas with a certain width
and color.

Activating |checkbox| :guilabel:`Cursor` you can use a slider |slider| to shrink
and grow the position cursor on the canvas.

Activating |radiobuttonon| :guilabel:`Map centering` allows to decide in which
way the canvas will be updated. This includes 'always', 'when leaving' if your
recorded coordinates start either to move out of canvas or 'never' to keep map
extent.

Finally you can activate |checkbox| :guilabel:`Log file` and define a path
and a file where log messages about the gps tracking a logged.

If you want to set a feature manually you have to go back to |mActionToggleEditing|
:sup:`Position` and click on **[Add Point]** or **[Add track point]**.
