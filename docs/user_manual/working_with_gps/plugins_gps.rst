.. _gps_data:

Introducing GPS Data
=====================

.. only:: html

   .. contents::
      :local:

.. _`whatsgps`:

What is GPS?
------------

GPS, the **Global Positioning System**, is a satellite-based system that allows
anyone with a GPS receiver to find their exact position anywhere in the world.
GPS is used as an aid in navigation, for example in airplanes, in boats and by hikers.
The GPS receiver uses the signals from the satellites to calculate its latitude,
longitude and (sometimes) elevation.
Most receivers also have the capability to store:

* locations (known as **waypoints**)
* sequences of locations that make up a planned **route**
* and a **track** log of the receiver's movement over time.

Waypoints, routes and tracks are the three basic feature types in GPS data.
QGIS displays waypoints in point layers, while routes and tracks are displayed in linestring layers.

.. note:: QGIS supports also GNSS receivers. But we keep using the term GPS in this documentation.

Defining GPS device types
-------------------------

There are lots of different types of GPS devices.
QGIS allows you to define your own device type and set parameters of use
under :menuselection:`Settings --> Options --> GPS --> GPSBabel` tab.
Read :ref:`defining_new_device` for more details.

Once you have created a new device type, it will appear in the device lists for
the download and upload tools.

.. _`label_loadgps`:

Transferring or loading GPS data
--------------------------------

There are dozens of different file formats for storing GPS data.
The format that QGIS uses is called GPX (GPS eXchange format),
which is a standard interchange format that can contain any number of waypoints,
routes and tracks in the same file.

To load a :file:`GPX` file:

#. Open the :guilabel:`GPS` tab in the :guilabel:`Data Source Manager` dialog,
   i.e. click the |dataSourceManager| :sup:`Open Data Source Manager` button
   (or press :kbd:`Ctrl+L`) and enable the target tab
#. Use the :guilabel:`...` :sup:`Browse` button next to the :guilabel:`GPX dataset` option
   to select the GPX file
#. Use the check boxes to select the :guilabel:`Feature types` you want to load from the file.
   Each feature type (:guilabel:`Waypoints`, :guilabel:`Tracks` or :guilabel:`Routes`)
   will be loaded in a separate layer.

.. figure:: ../managing_data_source/img/gps_datasource.png
   :align: center

   Loading GPS Data dialog


Since QGIS uses GPX files, you need a way to convert other GPS file formats to GPX.
This can be done for many formats using the free program `GPSBabel <https://www.gpsbabel.org>`_.
This program can also transfer GPS data between your computer and a GPS device.
QGIS relies on GPSBabel to do these things and provides you with convenient Processing algorithms
available under the :ref:`GPS group <gps_algorithms>`.

Download of points/tracks from GPS units
----------------------------------------

As described in previous sections QGIS uses GPSBabel to download points/tracks
directly in the project. QGIS comes out of the box with a pre-defined profile
to download from Garmin devices. Unfortunately there is a `bug #6318
<https://issues.qgis.org/issues/6318>`_ that does not allow create other profiles,
so downloading directly in QGIS using the GPS Tools is at the moment limited to
Garmin USB units.

Garmin GPSMAP 60cs
..................

**MS Windows**

Install the Garmin USB drivers from
https://www8.garmin.com/support/download_details.jsp?id=591

Connect the unit. Open GPS Tools and use ``type=garmin serial`` and ``port=usb:``
Fill the fields :guilabel:`Layer name` and :guilabel:`Output file`. Sometimes
it seems to have problems saving in a certain folder, using something like
``c:\temp`` usually works.

**Ubuntu/Mint GNU/Linux**

It is first needed an issue about the permissions of the device, as described
at https://wiki.openstreetmap.org/wiki/USB_Garmin_on_GNU/Linux. You can try to
create a file :file:`/etc/udev/rules.d/51-garmin.rules` containing this rule

::

  ATTRS{idVendor}=="091e", ATTRS{idProduct}=="0003", MODE="666"

After that is necessary to be sure that the ``garmin_gps`` kernel module is not
loaded

::

  rmmod garmin_gps

and then you can use the GPS Tools. Unfortunately there seems to be a `bug #7182
<https://issues.qgis.org/issues/7182>`_ and usually QGIS freezes several times
before the operation work fine.

BTGP-38KM datalogger (only Bluetooth)
.....................................

**MS Windows**

The already referred bug does not allow to download the data from within QGIS,
so it is needed to use GPSBabel from the command line or using its interface.
The working command is

::

  gpsbabel -t -i skytraq,baud=9600,initbaud=9600 -f COM9 -o gpx -F C:/GPX/aaa.gpx

**Ubuntu/Mint GNU/Linux**

Use same command (or settings if you use GPSBabel GUI) as in Windows. On Linux
it maybe somehow common to get a message like

::

  skytraq: Too many read errors on serial port

it is just a matter to turn off and on the datalogger and try again.

BlueMax GPS-4044 datalogger (both BT and USB)
.............................................

**MS Windows**

.. note::
   GPS units allow you to store data in different coordinate systems.

   It needs to install its drivers before using it on Windows 7. See in the
   manufacturer site for the proper download.

Downloading with GPSBabel, both with USB and BT returns always an error like

::

  gpsbabel -t -i mtk -f COM12 -o gpx -F C:/temp/test.gpx
  mtk_logger: Can't create temporary file data.bin
  Error running gpsbabel: Process exited unsuccessfully with code 1

**Ubuntu/Mint GNU/Linux**

**With USB**

After having connected the cable use the ``dmesg`` command to understand what
port is being used, for example ``/dev/ttyACM3``. Then as usual use GPSBabel
from the CLI or GUI

::

  gpsbabel -t -i mtk -f /dev/ttyACM3 -o gpx -F /home/user/bluemax.gpx

**With Bluetooth**

Use Blueman Device Manager to pair the device and make it available through a
system port, then run GPSBabel

::

  gpsbabel -t -i mtk -f /dev/rfcomm0 -o gpx -F /home/user/bluemax_bt.gpx
   When downloading a GPX file (from your GPS unit or a web site) and then loading it in QGIS,
   be sure that the data stored in the GPX file uses WGS 84 (latitude/longitude).
   QGIS expects this, and it is the official GPX specification.
   See `GPX 1.1 Schema Documentation <https://www.topografix.com/GPX/1/1/>`_.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |dataSourceManager| image:: /static/common/mActionDataSourceManager.png
   :width: 1.5em
