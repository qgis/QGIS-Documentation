.. Purpose: This chapter aims to describe how the user starts to use QGIS. It
.. should be kept short with only few steps to get QGIS working with two layers.

.. _`label.getstarted`:

***************
Getting Started
***************

.. only:: html

   .. contents::
      :local:

This chapter provides a quick overview of installing QGIS, downloading QGIS
sample data, and running a first simple session visualizing raster and vector
data.

.. index:: Installation
.. _`label_installation`:

Installing QGIS
===============

QGIS project provides different ways to install QGIS depending on your platform.

Installing from binaries
------------------------

Standard installers are available for |win| MS Windows and |osx| macOS. Binary
packages (rpm and deb) or software repositories are provided for many flavors of
GNU/Linux |nix|.

For more information and instructions for your operating system check 
https://download.qgis.org.

Installing from source
----------------------

If you need to build QGIS from source, please refer to the installation
instructions. They are distributed with the QGIS source code in a file
called :file:`INSTALL`. You can also find them online at :source:`INSTALL.md`.


If you want to build a particular release and not the version in development,
you should replace ``master`` with the release branch (commonly in the
``release-X_Y`` form) in the above-mentioned link (installation instructions may differ).

Installing on external media
----------------------------

It is possible to install QGIS (with all plugins and settings) on a flash drive.
This is achieved by defining a :ref:`--profiles-path <profiles-path_option>` option
that overrides the default :ref:`user profile <user_profiles>` path and forces
**QSettings** to use this directory, too.
See section :ref:`env_options` for additional information.

.. Todo: Expand a bit on the process because the linked chapter does not tell
  more or find a more informative section.


.. index:: Data sample
.. _label_sampledata:

Downloading sample data
-----------------------

This user guide contains examples based on the QGIS sample dataset (also called
the ``Alaska dataset``).  Download the sample data from
https://github.com/qgis/QGIS-Sample-Data/archive/master.zip and unzip the archive
on any convenient location on your system.

The Alaska dataset includes all GIS data that are used for the examples and
screenshots in this user guide; it also includes a small GRASS database.
The projection for the QGIS sample datasets is Alaska Albers Equal Area with
units feet. The EPSG code is 2964.

::

  PROJCS["Albers Equal Area",
  GEOGCS["NAD27",
  DATUM["North_American_Datum_1927",
  SPHEROID["Clarke 1866",6378206.4,294.978698213898,
  AUTHORITY["EPSG","7008"]],
  TOWGS84[-3,142,183,0,0,0,0],
  AUTHORITY["EPSG","6267"]],
  PRIMEM["Greenwich",0,
  AUTHORITY["EPSG","8901"]],
  UNIT["degree",0.0174532925199433,
  AUTHORITY["EPSG","9108"]],
  AUTHORITY["EPSG","4267"]],
  PROJECTION["Albers_Conic_Equal_Area"],
  PARAMETER["standard_parallel_1",55],
  PARAMETER["standard_parallel_2",65],
  PARAMETER["latitude_of_center",50],
  PARAMETER["longitude_of_center",-154],
  PARAMETER["false_easting",0],
  PARAMETER["false_northing",0],
  UNIT["us_survey_feet",0.3048006096012192]]

If you intend to use QGIS as a graphical front end for GRASS, you can find a
selection of sample locations (e.g., Spearfish or South Dakota) at the
official GRASS GIS website, https://grass.osgeo.org/download/sample-data/.

.. index:: Start QGIS, Stop QGIS
.. _`label_startingqgis`:

Starting and stopping QGIS
==========================

QGIS can be started like any other application on your computer.
This means that you can launch QGIS by:

* using |nix| the Applications menu, |win| the Start menu, or |osx| the Dock
* double clicking the icon in your Applications folder or desktop shortcut
* double clicking an existing QGIS project file (with :file:`.qgz` or :file:`.qgs`
  extension). Note that this will also open the project.
* typing ``qgis`` in a command prompt (assuming that QGIS is added to your PATH
  or you are in its installation folder)

To stop QGIS, use:

* |nix| |win| the menu option :menuselection:`Project --> Exit QGIS` or use the
  shortcut :kbd:`Ctrl+Q`
* |osx| :menuselection:`QGIS --> Quit QGIS`, or use the shortcut :kbd:`Cmd+Q`
* or use the red cross at the top-right corner of the main interface of the application.


.. _samplesession:

Sample Session: Loading raster and vector layers
================================================

Now that you have :ref:`QGIS installed <label_installation>` and a :ref:`sample
dataset <label_sampledata>` available, we will demonstrate a first sample
session. In this example, we will visualize a raster and a vector layer.
We will use:

* the :file:`landcover` raster layer (:file:`qgis_sample_data/raster/landcover.img`)
* and the :file:`lakes` vector layer (:file:`qgis_sample_data/gml/lakes.gml`)

Where :file:`qgis_sample_data` represents the path to the unzipped dataset.

#. Start QGIS as seen in :ref:`label_startingqgis`.
#. To load the files in QGIS:

   #. Click on the |dataSourceManager| :sup:`Open Data Source Manager` icon.
      The Data Source Manager should open in Browser mode.
   #. Browse to the folder :file:`qgis_sample_data/raster/`
   #. Select the ERDAS IMG file :file:`landcover.img` and double-click it.
      The landcover layer is added in the background while the Data Source
      Manager window remains open.

      .. _figure_addstartraster:

      .. figure:: img/add_raster.png
         :align: center

         Adding data to a new project in QGIS

   #. To load the lakes data, browse to the folder :file:`qgis_sample_data/gml/`,
      and double-click the :file:`lakes.gml` file to open it.
   #. A :guilabel:`Coordinate Reference System Selector` dialog opens. In the
      :guilabel:`Filter` menu, type ``2964``, filtering the list of Coordinate
      Reference Systems below.

      .. _figure_selectCRS:

      .. figure:: img/selectCRS.png
         :align: center

         Select the Coordinate Reference System of data

   #. Select the :guilabel:`NAD27 / Alaska Albers` entry
   #. Click :guilabel:`OK`
   #. Close the Data Source Manager window

You now have the two layers available in your project in some random colours.
Let's do some customization on the lakes layer.

#. Select the |zoomIn| :sup:`Zoom In` tool on the :guilabel:`Navigation` toolbar
#. Zoom to an area with some lakes
#. Double-click the :file:`lakes` layer in the map legend to open the
   :guilabel:`Properties` dialog
#. To change the lakes color:

   #. Click on the |symbology| :guilabel:`Symbology` tab
   #. Select blue as fill color.

      .. _figure_selectColor:

      .. figure:: img/selectFillColor.png
         :align: center

         Selecting Lakes color

   #. Press :guilabel:`OK`. Lakes are now displayed in blue in the map canvas.
#. To display the name of the lakes:

   #. Reopen the :file:`lakes` layer :guilabel:`Properties` dialog
   #. Click on the |labelingSingle| :guilabel:`Labels` tab
   #. Select :guilabel:`Single labels` in the drop-down menu to enable labeling.
   #. From the :guilabel:`Label with` list, choose the ``NAMES`` field.

      .. _figure_showLabels:

      .. figure:: img/showLabels.png
         :align: center

         Showing Lakes names

   #. Press :guilabel:`Apply`. Names will now load over the boundaries.
#. You can improve readability of the labels by adding a white buffer around them:

   #. Click the :guilabel:`Buffer` tab in the list on the left
   #. Check |checkbox| :guilabel:`Draw text buffer`
   #. Choose ``3`` as buffer size
   #. Click :guilabel:`Apply`
   #. Check if the result looks good, and update the value if needed.
   #. Finally click :guilabel:`OK` to close the :guilabel:`Layer Properties`
      dialog and apply the changes.

Let's now add some decorations in order to shape the map and export it out of
QGIS:

#. Select :menuselection:`View --> Decorations --> Scale Bar` menu
#. In the dialog that opens, check |checkbox| :guilabel:`Enable Scale Bar` option 
#. Customize the options of the dialog as you want
#. Press :guilabel:`Apply`
#. Likewise, from the decorations menu, add more items (north arrow, copyright...)
   to the map canvas with custom properties.
#. Click :menuselection:`Project --> Import/Export -->` |saveMapAsImage|
   :menuselection:`Export Map to Image...`
#. Press :guilabel:`Save` in the opened dialog
#. Select a file location, a format and confirm by pressing :guilabel:`Save`
   again.
#. Press :menuselection:`Project -->` |fileSave| :menuselection:`Save...` to
   store your changes as a :file:`.qgz` project file.

That's it! You can see how easy it is to visualize raster and vector layers in
QGIS, configure them and generate your map in an image format you can use in
other softwares. Let's move on to learn more about the available functionality,
features and settings, and how to use them.

.. note::
 To continue learning QGIS through step-by-step exercises, follow the
 :ref:`Training manual <QGIS-training-manual-index-reference>`.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |checkbox| image:: /static/common/checkbox.png
   :width: 1.3em
.. |dataSourceManager| image:: /static/common/mActionDataSourceManager.png
   :width: 1.5em
.. |fileSave| image:: /static/common/mActionFileSave.png
   :width: 1.5em
.. |labelingSingle| image:: /static/common/labelingSingle.png
   :width: 1.5em
.. |nix| image:: /static/common/nix.png
   :width: 1em
.. |osx| image:: /static/common/osx.png
   :width: 1em
.. |saveMapAsImage| image:: /static/common/mActionSaveMapAsImage.png
   :width: 1.5em
.. |symbology| image:: /static/common/symbology.png
   :width: 2em
.. |win| image:: /static/common/win.png
   :width: 1em
.. |zoomIn| image:: /static/common/mActionZoomIn.png
   :width: 1.5em
