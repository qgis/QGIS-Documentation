.. _gps_data:

Introducing GNSS/GPS Data
===========================

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

#. Open the :guilabel:`GPS` tab in the :guilabel:`Data Source Manager` dialog, i.e.:

   * Click the |dataSourceManager| :sup:`Open Data Source Manager` button on the toolbar
     (or press :kbd:`Ctrl+L`) and enable the target tab
   * Or select :menuselection:`Layer --> Add Layer -->` |addGpsLayer|
     :menuselection:`Add GPX Layer...`
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

.. note::
   GPS units allow you to store data in different coordinate systems.
   When downloading a GPX file (from your GPS unit or a web site) and then loading it in QGIS,
   be sure that the data stored in the GPX file uses WGS 84 (latitude/longitude).
   QGIS expects this, and it is the official GPX specification.
   See `GPX 1.1 Schema Documentation <https://www.topografix.com/GPX/1/1/>`_.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |addGpsLayer| image:: /static/common/mActionAddGpsLayer.png
   :width: 1.5em
.. |dataSourceManager| image:: /static/common/mActionDataSourceManager.png
   :width: 1.5em
