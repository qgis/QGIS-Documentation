.. only:: html


.. Purpose: This chapter aims to describe how the user starts to use QGIS. It
.. should be kept short with only few steps to get QGIS working with two layers.

.. _`label.getstarted`:

***************
Getting Started
***************

.. only:: html

   .. contents::
      :local:

This chapter provides a quick overview of installing QGIS, downloading QGIS sample data,
and running a first simple session visualizing raster and vector data.

.. index:: Installation
.. _`label_installation`:

Installing QGIS
===============

Installing QGIS is easy. Standard installers are available
for MS Windows |win| and MacOS |osx|. Binary packages (rpm and deb) or
software repositories are provided for many flavors of GNU/Linux |nix|.

For more information and instructions for your operating system check 
https://download.qgis.org.

Installing from source
----------------------

If you need to build QGIS from source, please refer to the installation
instructions. They are distributed with the QGIS source code in a file
called :file:`INSTALL`. You can also find them online at
https://htmlpreview.github.io/?https://raw.github.com/qgis/QGIS/master/doc/INSTALL.html.

If you want to build a particular release, you should replace ``master`` by the
release branch (commonly in the ``release-X_Y`` form) in the above-mentioned
link because instructions may differ.

Installing on external media
----------------------------

It is possible to install QGIS (with all plugins and settings) on a flash drive.
This is achieved by defining a :ref:`--profiles-path <profiles-path_option>` option
that overrides the default :ref:`user profile <user_profiles>` path and forces
**QSettings** to use this directory, too.
See section :ref:`env_options` for additional information.


.. index:: Data sample
.. _label_sampledata:

Downloading sample data
-----------------------

This user guide contains examples based on the QGIS sample dataset.

|win| The Windows installer has an option to download the QGIS sample dataset.
If checked, the data will be downloaded to your :file:`Documents` folder and
placed in a folder called :file:`GIS Database`. You may use Windows Explorer to
move this folder to any convenient location. If you did not select the checkbox
to install the sample dataset during the initial QGIS installation,
you may do one of the following:

* Use GIS data that you already have
* Download sample data from
  https://qgis.org/downloads/data/qgis_sample_data.zip
* Uninstall QGIS and reinstall with the data download option checked (only recommended if
  the above solutions are unsuccessful)

|nix| |osx| For GNU/Linux and macOS, there are no dataset installation
packages available as rpm, deb or dmg. To use the sample dataset, download the
file :file:`qgis_sample_data` as a ZIP archive from
https://qgis.org/downloads/data/ and unzip the archive
on your system.

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

* |nix| |win| the menu option :menuselection:`Project --> Exit QGIS` or use the shortcut
  :kbd:`Ctrl+Q`
* |osx| :menuselection:`QGIS --> Quit QGIS`, or use the shortcut :kbd:`Cmd+Q`
* or use the red cross at the top-right corner of the main interface of the application.


.. _samplesession:

Sample Session: Loading raster and vector layers
================================================

Now that you have QGIS installed and a sample dataset available, we will demonstrate
a first sample session. In this example, we will visualize a raster and a vector layer.
We will use:

* the :file:`landcover` raster layer (:file:`qgis_sample_data/raster/landcover.img`)
* and the :file:`lakes` vector layer (:file:`qgis_sample_data/gml/lakes.gml`)


#. Start QGIS as seen in :ref:`label_startingqgis`.
#. To load the landcover data, click on the |dataSourceManager| :sup:`Open Data Source Manager` icon.
#. The Data Source Manager should open in Browser mode.
#. Browse to the folder :file:`qgis_sample_data/raster/`, select
   the ERDAS IMG file :file:`landcover.img` and double-click to open it.
   (The landcover layer is added in the background while the Data Source Manager window remains open.)
#. To load the lakes data, browse to the folder :file:`qgis_sample_data/gml/`,
   and double-click on the file :file:`lakes.gml` to open it.
   The :guilabel:`Coordinate Reference System Selector` dialog opens with
   :guilabel:`NAD27 / Alaska Alberts` selected, click :guilabel:`OK`.
#. Close the Data Source Manager window.
#. Zoom to your favorite area with some lakes.
#. Double click the :file:`lakes` layer in the map legend to open the
   :guilabel:`Properties` dialog.
#. Click on the |symbology| :guilabel:`Symbology` tab and select blue as fill color.
#. Click on the |labeling| :guilabel:`Labels` tab and select :guilabel:`Single labels`
   in the drop-down menu to enable labeling. Then from the :guilabel:`Label with`
   list, choose the ``NAMES`` field to label each lake with its name.
#. To improve readability of labels, you can add a white buffer around them
   by clicking :guilabel:`Buffer` in the list on the left, checking |checkbox|
   :guilabel:`Draw text buffer` and choosing ``3`` as buffer size.
#. Click :guilabel:`Apply`. Check if the result looks good, and finally click
   :guilabel:`OK`.
#. Select :menuselection:`View --> Decorations --> Scale Bar`, and in the
   dialog that opens, check |checkbox| :guilabel:`Enable Scale Bar` and
   press :guilabel:`Apply` (you can customize some options of the dialog if
   you want).
#. Likewise, from the decorations menu, add more items (north arrow, copyright...)
   to the map canvas
#. Click :menuselection:`Project --> Import/Export -->` |saveMapAsImage|
   :menuselection:`Export Map to Image...` and press :guilabel:`Save` in the
   opened dialog. Select a file location, a format and confirm by pressing
   :guilabel:`Save` again.
#. Use :menuselection:`Project -->` |fileSave| :menuselection:`Save...` to
   store your changes as a :file:`.qgz` project file.

That's it! You can see how easy it is to visualize raster and vector layers in
QGIS, configure them and generate your map in an image format you can use in
other softwares. Let's move on to learn more about the available functionality,
features and settings, and how to use them.


.. _`sec_output`:

Generating output
=================

.. index:: Print layout, Quick print, World file
   single: Output; Save as image

There are several ways to generate output from your QGIS session. We have
already discussed saving as a project file in :ref:`sec_projects`.
Other ways to produce output files are:

* Creating images: :menuselection:`Project --> Import/Export -->` |saveMapAsImage|
  :menuselection:`Export Map
  to Image...` opens a file dialog where you select the name, path and type of
  image (PNG, JPG and many other formats). This will also create a world file
  (with extension ``PNGW`` or ``JPGW``) that is saved in the same folder as your
  image. This world file is used to georeference the image.
* Exporting to DXF files: :menuselection:`Project --> Import/Export --> Export
  Project to DXF...` opens
  a dialog where you can define the 'Symbology mode', the 'Symbology scale' and
  vector layers you want to export to DXF. Through the 'Symbology mode' symbols
  from the original QGIS Symbology can be exported with high fidelity
  (see section :ref:`create_dxf_files`).
* Designing print maps: :menuselection:`Project -->` |newLayout|
  :menuselection:`New Print Layout...` opens a dialog where you can layout and
  print the current map canvas (see section :ref:`label_printlayout`).


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |checkbox| image:: /static/common/checkbox.png
   :width: 1.3em
.. |dataSourceManager| image:: /static/common/mActionDataSourceManager.png
   :width: 1.5em
.. |fileNew| image:: /static/common/mActionFileNew.png
   :width: 1.5em
.. |fileOpen| image:: /static/common/mActionFileOpen.png
   :width: 1.5em
.. |fileSave| image:: /static/common/mActionFileSave.png
   :width: 1.5em
.. |fileSaveAs| image:: /static/common/mActionFileSaveAs.png
   :width: 1.5em
.. |labeling| image:: /static/common/labelingSingle.png
   :width: 1.5em
.. |newLayout| image:: /static/common/mActionNewLayout.png
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
