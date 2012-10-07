
.. _`plugin_gps`:

GPS Plugin
==========


.. _`whatsgps`:

What is GPS?
------------


GPS, the Global Positioning System, is a satellite-based system that allows 
anyone with a GPS receiver to find their exact position anywhere in the world.  
It is used as an aid in navigation, for example in airplanes, in boats and by 
hikers.  The GPS receiver uses the signals from the satellites to calculate its 
latitude, longitude and (sometimes) elevation.  Most receivers also have the 
capability to store locations (known as *waypoints*), sequences of locations 
that make up a planned *route* and a tracklog or *track* of the receivers 
movement over time.  Waypoints, routes and tracks are the three basic feature 
types in GPS data.  QGIS displays waypoints in point layers while routes and 
tracks are displayed in linestring layers.

.. _`label_loadgps`: 

Loading GPS data from a file
----------------------------


There are dozens of different file formats for storing GPS data. The format 
that QGIS uses is called GPX (GPS eXchange format), which is a standard 
interchange format that can contain any number of waypoints, routes and tracks 
in the same file.

To load a GPX file you first need to load the plugin. 
:menuselection:`Plugins -->` |mActionShowPluginManager| 
:menuselection:`Plugin Manager...` opens the Plugin Manager Dialog. 
Activate the |checkbox| :guilabel:`GPS Tools` checkbox. When this plugin 
is loaded a button with a small handheld GPS device will show up in the 
toolbar. An example GPX file is available in the QGIS sample dataset:
:file:`qgis_sample_data/gps/national_monuments.gpx`. See Section
:ref:`label_sampledata` for more information about the sample data.


1. Click on the |gps_importer| :sup:`GPS Tools` icon and open the
   :guilabel:`Load GPX file` tab (see figure_gps_1_).
2. :guilabel:`Browse` to the folder :file:`qgis_sample_data/gps/`, 
   select the GPX file :file:`national_monuments.gpx` and click **[Open]**.

.. _figure_gps_1:

.. figure:: /static/user_manual/working_with_gps/loadgpx.png
   :align: center
   :width: 40em

   Figure GPS 1: The *GPS Tools* dialog window

Use the browse button |browsebutton| to select the GPX file, then use the
checkboxes to select the feature types you want to load from that GPX file.
Each feature type will be loaded in a separate layer when you click 
**[OK]**.  The file :file:`national_monuments.gpx` only includes waypoints.

.. note::  
   GPS units allow to store data in different coordinate systems. 
   When downloading a GPX file (from your GPS unit or a web site) and then 
   loading it in Quantum GIS, be sure that the data stored in the GPX file 
   uses WGS84 (latitude/longitude). Quantum GIS expects this and it is 
   the official GPX specification. See http://www.topografix.com/GPX/1/1/

GPSBabel
--------


Since QGIS uses GPX files you need a way to convert other GPS file formats to 
GPX. This can be done for many formats using the free program GPSBabel, which is 
available at http://www.gpsbabel.org.  This program can also transfer GPS 
data between your computer and a GPS device.  QGIS uses GPSBabel to do these 
things, so it is recommended that you install it.  However, if you just want to 
load GPS data from GPX files you will not need it. Version 1.2.3 of GPSBabel is 
known to work with QGIS, but you should be able to use later versions without
any problems.

Importing GPS data
------------------

To import GPS data from a file that is not a GPX file, you use the tool
:guilabel:`Import other file` in the GPS Tools dialog. Here you select the file 
that you want to import (and the file type), which feature type you want to 
import from it, where you want to store the converted GPX file and what the name 
of the new layer should be.  Note that not all GPS data formats will support all 
three feature types, so for many formats you will only be able to choose between 
one or two types.

Downloading GPS data from a device
----------------------------------


QGIS can use GPSBabel to download data from a GPS device directly as new vector 
layers. For this we use the :guilabel:`Download from GPS` tab of the GPS 
Tools dialog (see Figure_gps_2_). Here, we select the type of 
GPS device, the port that it is connected to (or usb if your GPS supports this), 
the feature type that you want to download, the GPX file where the data should 
be stored, and the name of the new layer.

.. _figure_gps_2:

.. figure::  /static/user_manual/working_with_gps/download.png
   :align: center
   :width: 40em

   Figure GPS 2: The download tool

The device type you select in the GPS device menu determines how GPSBabel tries 
to communicate with your GPS device. If none of the available types work with 
your GPS device you can create a new type (see section :ref:`defining-new-device`).

The port may be a file name or some other name that your operating system uses 
as a reference to the physical port in your computer that the GPS device is 
connected to. It may also be simply usb, for usb enabled GPS units. 

  * |nix| On Linux this is something like /dev/ttyS0 or /dev/ttyS1 
  * |win| On Windows it is COM1 or COM2.

When you click **[OK]** the data will be downloaded from the device and 
appear as a layer in QGIS.

Uploading GPS data to a device
------------------------------


You can also upload data directly from a vector layer in QGIS to a GPS device 
using the :guilabel:`Upload to GPS` tab of the GPS Tools dialog. To do 
this you simply select the layer that you want to upload (which must be a GPX 
layer), your GPS device type, and the port (or usb) that it is connected to.
Just as with the download tool you can specify new device types if your device 
isn't in the list.

This tool is very useful in combination with the vector editing capabilities of 
QGIS. It allows you to load a map, create waypoints and routes, and then upload 
them and use them on your GPS device.

.. _defining-new-device:

Defining new device types
-------------------------


There are lots of different types of GPS devices. The QGIS developers can't 
test all of them, so if you have one that does not work with any of the device 
types listed in the :guilabel:`Download from GPS` and :guilabel:`Upload to GPS` 
tools you can define your own device type for it.  
You do this by using the GPS device editor, which you start by clicking the 
**[Edit devices]** button in the download or the upload tabs.

To define a new device you simply click the **[New device]** button, 
enter a name, a download command and an upload command for your device, and 
click the **[Update device]** button.  The name will be listed in the 
device menus in the upload and download windows, and can be any string.  The 
download command is the command that is used to download data from the device 
to a GPX file.  This will probably be a GPSBabel command, but you can use any 
other command line program that can create a GPX file.  QGIS will replace the 
keywords ``%type``, ``%in``, and ``%out`` when it runs the command.

``%type`` will be replaced by ``-w`` if you are downloading waypoints, 
``-r`` if you are downloading routes and ``-t`` if you are downloading tracks.
These are command line options that tell GPSBabel which feature type to download.

``%in`` will be replaced by the port name that you choose in the download window 
and ``%out`` will be replaced by the name you choose for the GPX file that the 
downloaded data should be stored in. So if you create a device type with the 
download command ``gpsbabel %type -i garmin -o gpx %in %out`` (this is actually 
the download command for the predefined device type :guilabel:`GPS device:` Garmin 
serial |selectstring|) and then use it to download waypoints from port ``/dev/ttyS0`` 
to the file ``output.gpx``, QGIS will replace the keywords and run the command 
``gpsbabel -w -i garmin -o gpx /dev/ttyS0 output.gpx``.

The upload command is the command that is used to upload data to the device.
The same keywords are used, but ``%in`` is now replaced by the name of 
the GPX file for the layer that is being uploaded, and ``%out`` is 
replaced by the port name.

You can learn more about GPSBabel and it's available command line options at 
http://www.gpsbabel.org.

Once you have created a new device type it will appear in the device lists for 
the download and upload tools.
