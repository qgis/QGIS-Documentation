.. _`plugin_gps`:

GPS Plugin
=================================

.. % when the revision of a section has been finalized,
.. % comment out the following line:
.. % \updatedisclaimer

.. _`whatsgps`:
What is GPS?
****************************

GPS, the Global Positioning System, is a satellite-based system that allows 
anyone with a GPS receiver to find their exact position anywhere in the world.  
It is used as an aid in navigation, for example in airplanes, in boats and by 
hikers.  The GPS receiver uses the signals from the satellites to calculate its 
latitude, longitude and (sometimes) elevation.  Most receivers also have the 
capability to store locations (known as *waypoints*), sequences of locations 
that make up a planned \emph{route} and a tracklog or *track* of the receivers 
movement over time.  Waypoints, routes and tracks are the three basic feature 
types in GPS data.  QGIS displays waypoints in point layers while routes and 
tracks are displayed in linestring layers.

.. _`label_loadgps`: 
Loading GPS data from a file
*************************************************

There are dozens of different file formats for storing GPS data.  The format 
that QGIS uses is called GPX (GPS eXchange format), which is a standard 
interchange format that can contain any number of waypoints, routes and tracks 
in the same file.

To load a GPX file you first need to load the plugin. 
:menuselection:`Plugins -->` |mActionShowPluginManager| :guilabel:`Plugin Manager...` --> |checkbox| :guilabel:`GPS Tools`. When this 
plugin is loaded a button with a small handheld GPS device will show up in the 
toolbar. An example GPX file is available in the QGIS sample dataset:
:file:`qgis_sample_data/gps/national_monuments.gpx`. See Section
:ref:`label_sampledata` for more information about the sample data.


#. Click on the |gps_importer|:guilabel:`GPS Tools` icon and open the
   :guilabel:`Load GPX file` tab (see figure `plugins/plugins_gps/loadgpx`_).
#. :guilabel:`Browse` to the folder :file:`qgis_sample_data/gps/`, select the 
    GPX file :file:`national_monuments.gpx` and click :guilabel:`Open`.

.. _`plugins/plugins_gps/loadgpx`:

.. figure:: img/en/plugins_gps/loadgpx.png
   :align: center
   :width: 30em

   The *GPS Tools* dialog window

.. \begin{figure}[ht]
..   \centering
..   \includegraphics[clip=true, width=12cm]{loadgpx}
..   \caption{The \emph{GPS Tools} dialog window \nixcaption}\label{gpxloader}
.. \end{figure}

Use the browse button |browsebutton| to select the GPX file, then use the
checkboxes to select the feature types you want to load from that GPX file.
Each feature type will be loaded in a separate layer when you click 
:guilabel:`OK`.  The file :file:`national_monuments.gpx` only includes waypoints.

GPSBabel
********

Since QGIS uses GPX files you need a way to convert other GPS file formats to 
GPX. This can be done for many formats using the free program GPSBabel, which is 
available at http://www.gpsbabel.org.  This program can also transfer GPS 
data between your computer and a GPS device.  QGIS uses GPSBabel to do these 
things, so it is recommended that you install it.  However, if you just want to 
load GPS data from GPX files you will not need it. Version 1.2.3 of GPSBabel is 
known to work with QGIS, but you should be able to use later versions without
any problems.

Importing GPS data
******************

To import GPS data from a file that is not a GPX file, you use the tool |tab|
:guilabel:`Import other file` in the GPS Tools dialog. Here you select the file 
that you want to import (and the file type), which feature type you want to 
import from it, where you want to store the converted GPX file and what the name 
of the new layer should be.  Note that not all GPS data formats will support all 
three feature types, so for many formats you will only be able to choose between 
one or two types.

Downloading GPS data from a device
**********************************

QGIS can use GPSBabel to download data from a GPS device directly as new vector 
layers. For this we use the |tab| :guilable:`Download from GPS` tab of the GPS 
Tools dialog (see Figure :ref:`figure_download`). Here, we select the type of 
GPS device, the port that it is connected to (or usb if your GPS supports this), 
the feature type that you want to download, the GPX file where the data should 
be stored, and the name of the new layer.

.. \begin{figure}[ht]
..   \centering
..   \includegraphics[clip=true, width=12cm]{download}
..   \caption{The download tool \nixcaption}\label{figure_download}
.. \end{figure}

The device type you select in the GPS device menu determines how GPSBabel tries 
to communicate with your GPS device. If none of the available types work with 
your GPS device you can create a new type (see section 
:ref:`defining-new-device`).

The port may be a file name or some other name that your operating system uses 
as a reference to the physical port in your computer that the GPS device is 
connected to. It may also be simply usb, for usb enabled GPS units. |nix| On 
Linux this is something like /dev/ttyS0 or /dev/ttyS1 and on |win| Windows it's 
COM1 or COM2.

When you click :guilabel:`OK` the data will be downloaded from the device and 
appear as a layer in QGIS.

Uploading GPS data to a device
******************************

You can also upload data directly from a vector layer in QGIS to a GPS device 
using the |tab| :guilabel:`Upload to GPS` tab of the GPS Tools dialog. To do 
this you simply select the layer that you want to upload (which must be a GPX 
layer), your GPS device type, and the port (or usb) that it is connected to.
Just as with the download tool you can specify new device types if your device 
isn't in the list.

This tool is very useful in combination with the vector editing capabilities of 
QGIS. It allows you to load a map, create waypoints and routes, and then upload 
them and use them on your GPS device.

.. _`defining-new-device`:
Defining new device types
********************************************************

There are lots of different types of GPS devices. The QGIS developers can't 
test all of them, so if you have one that does not work with any of the device 
types listed in the |tab| :guilabel:`Download from GPS` and |tab| 
:guilabel:`Upload to GPS` tools you can define your own device type for it.  
You do this by using the GPS device editor, which you start by clicking the 
:guilabel:`Edit devices` button in the download or the upload tabs.

To define a new device you simply click the :guilabel:`New device` button, 
enter a name, a download command and an upload command for your device, and 
click the :guilabel:`Update device` button.  The name will be listed in the 
device menus in the upload and download windows, and can be any string.  The 
download command is the command that is used to download data from the device 
to a GPX file.  This will probably be a GPSBabel command, but you can use any 
other command line program that can create a GPX file.  QGIS will replace the 
keywords ``type``, ``in``, and ``out`` when it runs the command.

``type`` will be replaced by ``-w`` if you are downloading waypoints, 
``-r`` if you are downloading routes and ``-t`` if you are downloading tracks.
These are command line options that tell GPSBabel which feature type to download.

``in`` will be replaced by the port name that you choose in the download window 
and ``out`` will be replaced by the name you choose for the GPX file that the 
downloaded data should be stored in. So if you create a device type with the 
download command ``gpsbabel type -i garmin -o gpx in out`` (this is actually 
the download command for the predefined device type :selectstring: 
:guilabel:`GPS device: Garmin serial`)and then use it to download waypoints from port ``/dev/ttyS0`` to the file ``output.gpx``, QGIS will replace the keywords and run the command ``gpsbabel -w -i garmin -o gpx /dev/ttyS0 output.gpx``.

The upload command is the command that is used to upload data to the device.
The same keywords are used, but ``in`` is now replaced by the name of 
the GPX file for the layer that is being uploaded, and ``out`` is 
replaced by the port name.

You can learn more about GPSBabel and it's available command line options at 
http://www.gpsbabel.org .

Once you have created a new device type it will appear in the device lists for 
the download and upload tools.
