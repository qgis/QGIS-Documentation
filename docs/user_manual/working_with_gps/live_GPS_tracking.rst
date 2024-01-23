.. index:: GPS tracking
.. _`sec_gpstracking`:

Live GPS tracking
==================

.. only:: html

   .. contents::
      :local:

QGIS can help you do field mapping with a GPS receiver.
Such a live tracking operation is done using the :guilabel:`GPS Toolbar <gps_toolbar>`.
Some :ref:`device configuration <gps_options>` may be needed before
connecting QGIS and the GPS receiver.




.. _gps_toolbar:

GPS toolbar
-----------

The :guilabel:`GPS Toolbar` provides the main tools to control a live tracking session.
It can be activated from :menuselection:`View --> Toolbars --> GPS`.
It follows the state of the project, GPS, and current GPS track, and enables actions
only when they make sense.
Once a device is detected by QGIS, you will be able to interact with it:

* |gpsConnect| :sup:`Connect to GPS`
* |gpsDisconnect| :sup:`Disconnect from GPS`
* |recenter| :sup:`Recenter map on GPS location`: the map will immediately recenter on the current GPS position
  regardless of the :ref:`automatic recentering parameter <gps_recenter>`.

* |gpsDestinationLayer| :sup:`Set destination layer for GPS digitized features`:
  By default, QGIS will :guilabel:`Follow active layer` for feature digitizing,
  meaning that GPS digitizing tools will adapt to the layer selected in :guilabel:`Layers` panel
  and created features will be stored in it accordingly.
  While this may be useful in some contexts, it also implies careful interaction
  with other layers to avoid storing inadvertently features in undesired layers.
  This option allows you to explicitly indicate a layer for the data storage
  during the live tracking session, and you could switch depending on your needs.
  Exposed tools will adapt as well to the selected layer type.

  The GPS destination layer is made automatically editable when a feature is being created,
  and the user is notified accordingly.

* actions for feature creation:

  * |addTrackPoint| :sup:`Add vertex to GPS track using GPS current location`
  * |captureLine| :sup:`Create feature from track`
  * |capturePoint| :sup:`Create a new point feature at current GPS location`
  * |reset| :sup:`Reset track`

* |metadata| :sup:`Show GPS information`: opens the :guilabel:`GPS Information` panel

  .. todo: replace guilabel with a ref to the section when available, i.e
     * |metadata| :sup:`Show GPS information`: opens the :ref:`GPS Information``
     <gps_information_panel>` panel

* a display box for quick access to some GPS information components you may need:

  * |unchecked| :sup:`Show location`
  * |unchecked| :sup:`Show altitude (Geoid)`
  * |unchecked| :sup:`Show altitude (WGS 84 ellipsoid)`
  * |unchecked| :sup:`Show ground speed`
  * |unchecked| :sup:`Show bearing`
  * |unchecked| :sup:`Show total track length`
  * |unchecked| :sup:`Show distance from start of track`

.. _tracking_settings:

* The |options| :sup:`Settings` button opens a drop-down menu with common settings
  which are expected to be modified mid-session:

  * |unchecked| :guilabel:`Show location marker`
  * |unchecked| :guilabel:`Show bearing line`
  * |unchecked| :guilabel:`Rotate map to match GPS direction`

  .. _gps_recenter:

  * Options to control map recentering:

    * |radioButtonOff| :guilabel:`Always recenter map` when the GPS position is offset
      from the map canvas center by a certain distance (as a ratio of the map canvas extent)
    * |radioButtonOn| :guilabel:`Recenter map when leaving extent`
    * |radioButtonOff| :guilabel:`Never recenter`

  * |unchecked| :guilabel:`Automatically add track vertices`
    whenever new locations are received from the GPS device.
  * |unchecked| :guilabel:`Automatically save added features`:
    features created from GPS locations are immediately committed to their target layers
    (skipping the usual layer edit buffer)
  * :guilabel:`Time stamp destination` to adjust the field for time fix storage

  .. _gps_logging:

  * |unchecked| :guilabel:`Log to GeoPackage/SpatiaLite...`: When activated,
    the user will be prompted to select an existing GeoPackage/SpatiaLite file
    or enter a new file name.
    A ``gps_points`` and ``gps_tracks`` table will be created in the file
    with a predefined structure.

    All incoming GPS messages will be logged to the ``gps_points`` layer,
    along with speed, bearing, altitude and accuracy information from the GPS.

    When the GPS is disconnected (or QGIS closed), the entire recorded GPS track
    will be added to the ``gps_tracks`` table
    (along with some calculated information like track length, start and end times).

  * |unchecked| :guilabel:`Log NMEA sentences...`: enables logging all raw NMEA strings
    from the device to a text file
  * |options| :guilabel:`GPS settings...` to access the GPS :ref:`global options
    <gps_options>` dialog


.. tip:: **Live status bar information on position**

  When a GPS device is connected and the user moves the cursor over the map canvas,
  a live status bar message displays the distance and bearing from the cursor to the GPS position.
  Project distance and bearing settings are respected in this display.
  On a touch screen device, use a tap-and-hold event to trigger the live status bar message.


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
on :guilabel:`Configure` button.

Remember the number of the COM port assigned to the GPS connection as resulting
by the Bluetooth properties.

After the GPS has been recognized, make the pairing for the connection. Usually
the authorization code is ``0000``.

Now open :guilabel:`GPS information` panel and switch to |options| GPS
options screen. Select the COM port assigned to the GPS connection and click
the :guilabel:`Connect`. After a while a cursor indicating your position should
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
`GPSGate <https://gpsgate.com/gpsgate-splitter>`_.

Launch the program, make it scan for GPS devices (works for both USB and BT
ones) and then in QGIS just click :guilabel:`Connect` in the Live tracking panel
using the |radioButtonOn| :guilabel:`Autodetect` mode.

Ubuntu/Mint GNU/Linux
.....................

As for Windows the easiest way is to use a server in the middle, in this case
GPSD, so

::

  sudo apt install gpsd

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
without it, just use the |radioButtonOn| :guilabel:`Autodetect` mode, or point
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


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |addTrackPoint| image:: /static/common/mActionAddTrackPoint.png
   :width: 1.5em
.. |captureLine| image:: /static/common/mActionCaptureLine.png
   :width: 1.5em
.. |capturePoint| image:: /static/common/mActionCapturePoint.png
   :width: 1.5em
.. |gpsConnect| image:: /static/common/mIconGpsConnect.png
   :width: 1.5em
.. |gpsDestinationLayer| image:: /static/common/mIconGpsDestinationLayer.png
   :width: 1.5em
.. |gpsDisconnect| image:: /static/common/mIconGpsDisconnect.png
   :width: 1.5em
.. |gpsTrackBarChart| image:: /static/common/gpstrack_barchart.png
   :width: 1.5em
.. |metadata| image:: /static/common/metadata.png
   :width: 1.5em
.. |options| image:: /static/common/mActionOptions.png
   :width: 1em
.. |radioButtonOff| image:: /static/common/radiobuttonoff.png
   :width: 1.5em
.. |radioButtonOn| image:: /static/common/radiobuttonon.png
   :width: 1.5em
.. |recenter| image:: /static/common/mActionRecenter.png
   :width: 1.5em
.. |reset| image:: /static/common/mActionReset.png
   :width: 1.5em
.. |unchecked| image:: /static/common/unchecked.png
   :width: 1.3em
