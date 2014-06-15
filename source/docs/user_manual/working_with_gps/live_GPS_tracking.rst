|updatedisclaimer|

.. _`sec_gpstracking`:

Live GPS tracking
==================

To activate live GPS tracking in |qg|, you need to select :menuselection:`Settings --> Panels`
|checkbox| :guilabel:`GPS information`. You will get a new docked window on the
left side of the canvas.

There are four possible screens in this GPS tracking window:

* |mActionToggleEditing| GPS position coordinates and an interface for manually entering
  vertices and features
* |gpstrack_barchart| GPS signal strength of satellite connections
* |gpstrack_polarchart| GPS polar screen showing number and polar position of
  satellites
* |mActionOptions| GPS options screen (see figure_gps_options_)

With a plugged-in GPS receiver (has to be supported by your operating system),
a simple click on **[Connect]** connects the GPS to |qg|. A second click (now
on **[Disconnect]**) disconnects the GPS receiver from your computer. For GNU/Linux,
gpsd support is integrated to support connection to most GPS receivers. Therefore,
you first have to configure gpsd properly to connect |qg| to it.

.. warning::
   If you want to record your position to the canvas, you have to create a new
   vector layer first and switch it to editable status to be able to record your
   track.

Position and additional attributes
----------------------------------

|mActionToggleEditing| If the GPS is receiving signals from satellites, you will
see your position in latitude, longitude and altitude together with additional
attributes.

.. _figure_gps_position:

.. only:: html

   **Figure GPS Position:**

.. figure:: /static/user_manual/working_with_gps/gpstrack_main.png
   :align: center

   GPS tracking position and additional attributes |nix|

GPS signal strength
-------------------

|gpstrack_barchart| Here, you can see the signal strength of the satellites you
are receiving signals from.

.. _figure_gps_strength:

.. only:: html

   **Figure GPS Strength:**

.. figure:: /static/user_manual/working_with_gps/gpstrack_stren.png
   :align: center

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

   GPS tracking polar window |nix|

GPS options
-----------

|mActionOptions| In case of connection problems, you can switch between:

* |radiobuttonon| :guilabel:`Autodetect`
* |radiobuttonoff| :guilabel:`Internal`
* |radiobuttonoff| :guilabel:`Serial device`
* |radiobuttonoff| :guilabel:`gpsd` (selecting the Host, Port and Device your
  GPS is connected to)

A click on **[Connect]** again initiates the connection to the GPS receiver.

.. _figure_gps_options:

.. only:: html

   **Figure GPS Tracking 2:**

.. figure:: /static/user_manual/working_with_gps/gpstrack_options.png
   :align: center

   GPS tracking options window |nix|

You can activate |checkbox| :menuselection:`Automatically save added features`
when you are in editing mode. Or you can activate |checkbox|
:guilabel:`Automatically add points` to the map canvas with a certain width
and color.

Activating |checkbox| :guilabel:`Cursor`, you can use a slider |slider| to shrink
and grow the position cursor on the canvas.

Activating |radiobuttonon| :guilabel:`Map centering` allows you to decide in which
way the canvas will be updated. This includes 'always', 'when leaving', if your
recorded coordinates start to move out of the canvas, or 'never', to keep map
extent.

Finally, you can activate |checkbox| :guilabel:`Log file` and define a path
and a file where log messages about the GPS tracking are logged.

If you want to set a feature manually, you have to go back to |mActionToggleEditing|
:sup:`Position` and click on **[Add Point]** or **[Add track point]**.

Connect to a Bluetooth GPS for live tracking
--------------------------------------------

With QGIS you can connect a Bluetooth GPS for field data collection. To perform
this task you need a GPS Bluetooth device and a Bluetooth receiver on your
computer.

At first you must let your GPS device be recognized and paired to the computer.
Turn on the GPS, go to the Bluetooth icon on your notification area and search
for a New Device.

On the right side of the Device selection mask make sure that all devices are
selected so your GPS unit will probably appear among those available. In the
next step a serial connection service should be available, select it and click
on **[Configure]** button.

Remember the number of the COM port assigned to the GPS connection as resulting
by the Bluetooth properties.

After the GPS has been recognized, make the pairing for the connection. Usually
the autorization code is ``0000``.

Now open :guilabel:`GPS information`panel and switch to |mActionOptions| GPS
options screen. Select the COM port assigned to the GPS connection and click
the **[Connect]**. After a while a cursor indicating your position should
appear.

If QGIS can't receive GPS data, then you should restart your GPS device, wait
5-10 seconds then try to connect again. Usually this solution work. If you
receive again a connection error make sure you don't have another Bluetooth
receiver near you, paired with the same GPS unit.

Using GPSMAP 60cs
-----------------

MS Windows
..........

Easiest way to make it work is to use a middleware (freeware, not open) called
`GPSGate <http://update.gpsgate.com/install/GpsGateClient.exe>`_.

Launch the program, make it scan for GPS devices (works for both USB and BT
ones) and then in QGIS just click **[Connect]** in the Live tracking panel
using the |radiobuttonon| :guilabel:`Autodetect` mode.

Ubuntu/Mint GNU/Linux
.....................

As for Windows the easiest way is to use a server in the middle, in this case
GPSD, so

::

  sudo apt-get install gpsd

Then load the ``garmin_gps`` kernel module

::

  sudo modprobe garmin_gps

And then connect the unit. Then check with ``dmesg`` the actual device being
used bu the unit, for example ``/dev/ttyUSB0``. Now you can launch gpsd

::

  gpsd /dev/ttyUSB0

And finally connect with the QGIS live tracking tool.

Using BTGP-38KM datalogger (only Bluetooth)
-------------------------------------------

Using GPSD (under Linux) or GPSGate (under Windows) is effortless.

Using BlueMax GPS-4044 datalogger (both BT and USB)
---------------------------------------------------

MS Windows
..........

The live tracking works for both USB and BT modes, by using GPSGate or even
without it, just use the |radiobuttonon| :guilabel:`Autodetect` mode, or point
the tool the right port.


Ubuntu/Mint GNU/Linux
.....................

**For USB**

The live tracking works both with GPSD

::

  gpsd /dev/ttyACM3

or without it, by connecting the QGIS live tracking tool directly to the
device (for example ``/dev/ttyACM3``).

**For Bluetooth**

The live tracking works both with GPSD

::

  gpsd /dev/rfcomm0

or without it, by connecting the QGIS live tracking tool directly to the device
(for example ``/dev/rfcomm0``).
