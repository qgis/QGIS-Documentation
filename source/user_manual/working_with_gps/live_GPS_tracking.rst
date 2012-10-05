
.. _`sec_gpstracking`:

Live GPS tracking
==================


To activate Live GPS tracking in QGIS you need to select :menuselection:`View --> Live GPS tracking -->` . You will get a new docked Window on 
the left side of the canvas.

There are 4 possible screens in this GPS tracking window
(see table_figure_gps_tracking_ and Figure_gpstrack_options_).

* |mActionToggleEditing| GPS position coordinates and for manually entering 
  Vertices and Features.
* |gpstrack_barchart| GPS signal strength of satellite connections.
* |gpstrack_polarchart| GPS polar screen showing number and polar position of 
  satellites.
* |mActionOptions| GPS options screen (see Figure_gpstrack_options_).

With a plugged in GPS receiver (has to be supported by your operating system)
a simple click on **[Connect]** connects the GPS to QGIS. 
A second click (now **[Disconnect]**) disconnects the 
GPS-Receiver from your Computer. For GNU/Linux gpsd support is integrated to 
support connection to most GPS receivers. Therefore you first have to configure 
gpsd properly to connect QGIS to it.

.. warning::
   If you want to record your position to the canvas you have to
   create a new vector layer first and switch it to editable status to be able 
   to record your track.

.. _table_figure_gps_tracking:

Live GPS tracking |nix| 

+-------------------------------+-----------------------------+
| |gpstrack_main|                                             |
+-------------------------------+-----------------------------+
| (a) Position coordinates                                    | 
+-------------------------------+-----------------------------+
| |gpstrack_stren|              |    |gpstrack_polar|         | 
+-------------------------------+-----------------------------+
| (b) GPS signal_strength       | (c) GPS polar window        |
+-------------------------------+-----------------------------+

Position coordinates
---------------------

|mActionToggleEditing| If the GPS is
receiving signals from satellites you will see your position in latitude,
longitude and elevation as you can see in Figure table_figure_gps_tracking_.

GPS signal strength
--------------------

|gpstrack_barchart| Here you can see
the signal strenght of the satellites you are receiving signals from
table_figure_gps_tracking_.

GPS polar window
----------------

|gpstrack_polarchart| If you want
to know where in the sky all the connected satellites are, you have to
switch to the polar screen (see table_figure_gps_tracking_).
You can also see the ID numbers of the satellites you are receiving signals from.

GPS options
------------

|mActionOptions| In case of connection problems you can switch from 
|radiobuttonon| :menuselection:`Autodetect` to |radiobuttonon| 
:menuselection:`Use path/port below` and select the path/port your GPS receiver 
is connected to.  A click on **[Connect]** again initiates 
the connection to the GPS receiver.

With the slider :menuselection:`GPS Cursor Size` |slider| you can shrink and grow 
the position cursor on the canvas. Activating |radiobuttonon| 
:menuselection:`Auto-add vertices` within GPS digitizing your track will 
automatically be recorded in the active vector layer (of course the layer has to 
be in edit mode).

With GPS map recenter you can decide in which way the canvas will be
updated if your recorded coordinates start either to move out of canvas
or there is any change at all.

Track color and width sets the color of and the width of your drawn track.

If you want to set a feature manually you have to go back to
|mActionToggleEditing| "Position Coordinates"
and click on **[Add feature]**.

.. _Figure_gpstrack_options:

.. figure:: img/en/gpstrack_options.png
   :align: center
   :width: 15em

   GPS tracking options window |nix| 

----

.. [1] Keyboard shortcuts can now be configured manually
   (shortcuts presented in this section are the defaults), using the Configure
   Shortcuts tool under Settings Menu.
