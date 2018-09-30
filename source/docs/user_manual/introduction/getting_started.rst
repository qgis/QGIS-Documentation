.. only:: html

   |updatedisclaimer|

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
http://download.qgis.org.

Installing from source
----------------------

If you need to build QGIS from source, please refer to the installation
instructions. They are distributed with the QGIS source code in a file
called :file:`INSTALL`. You can also find them online at
http://htmlpreview.github.io/?https://raw.github.com/qgis/QGIS/master/doc/INSTALL.html.

If you want to build a particular release, you should replace ``master`` by the
release branch (commonly in the ``release-X_Y`` form) in the above-mentioned
link because instructions may differ.

Installing on external media
----------------------------

It is possible to install QGIS (with all plugins and settings) on a flash drive.
This is achieved by defining a ``--configpath`` option that overrides the default
path for user configuration (e.g., :file:`~/.qgis2` under Linux) and forces
**QSettings** to use this directory, too. 
See section :ref:`env_options` for additional information.


.. index:: Data sample
.. _label_sampledata:

Downloading sample data
-----------------------

This user guide contains examples based on the QGIS sample dataset.

|win| The Windows installer has an option to download the QGIS sample dataset.
If checked, the data will be downloaded to your :file:`My Documents` folder and
placed in a folder called :file:`GIS Database`. You may use Windows Explorer to
move this folder to any convenient location. If you did not select the checkbox
to install the sample dataset during the initial QGIS installation,
you may do one of the following:

* Use GIS data that you already have
* Download sample data from
  http://qgis.org/downloads/data/qgis_sample_data.zip
* Uninstall QGIS and reinstall with the data download option checked (only recommended if
  the above solutions are unsuccessful)

|nix| |osx| For GNU/Linux and macOS, there are no dataset installation
packages available as rpm, deb or dmg. To use the sample dataset, download the
file :file:`qgis_sample_data` as a ZIP archive from
http://qgis.org/downloads/data/ and unzip the archive
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
official GRASS GIS website, http://grass.osgeo.org/download/sample-data/.

.. index:: Start QGIS, Stop QGIS

Launching QGIS
==============

.. _`label_startingqgis`:

Starting and stopping QGIS
--------------------------

QGIS can be started like any other application on your computer. 
This means that you can launch QGIS by:

* using |nix| the Applications menu, |win| the Start menu, or |osx| the Dock
* double clicking the icon in your Applications folder or desktop shortcut
* double clicking an existing QGIS project (``.qgs``) file. (Note that this will
  also open the project.)
* typing ``qgis`` in a command prompt (assuming that QGIS is added to your PATH
  or you are in its installation folder)

To stop QGIS, use:

* |nix| |win| the menu option :menuselection:`Project --> Exit QGIS` or use the shortcut
  :kbd:`Ctrl+Q`
* |osx| :menuselection:`QGIS --> Quit QGIS`, or use the shortcut :kbd:`Cmd+Q`
* or use the red cross at the right top corner of the main interface of the application.

The following section covers advanced command line options. 
Skip forward to :ref:`samplesession` to get started loading data into QGIS. 

.. index:: Command line options
.. _`label_commandline`:

Advanced command line options
-----------------------------

QGIS provides command line options for more advanced use cases. To
get a list of the options, enter ``qgis --help`` on the command line. The usage
statement for QGIS is::

  qgis --help

This returns::

  QGIS - 3.4.0-Madeira 'Madeira' (307d082e3d)
  QGIS is a user friendly Open Source Geographic Information System.
  Usage: /usr/bin/qgis.bin [OPTION] [FILE]
  OPTION:
    [--snapshot filename]	emit snapshot of loaded datasets to given file
    [--width width]	width of snapshot to emit
    [--height height]	height of snapshot to emit
    [--lang language]	use language for interface text
    [--project projectfile]	load the given QGIS project
    [--extent xmin,ymin,xmax,ymax]	set initial map extent
    [--nologo]	hide splash screen
    [--noversioncheck]	don't check for new version of QGIS at startup
    [--noplugins]	don't restore plugins on startup
    [--nocustomization]	don't apply GUI customization
    [--customizationfile path]	use the given ini file as GUI customization
    [--globalsettingsfile path]	use the given ini file as Global settings (defaults)
    [--authdbdirectory path] use the given directory for authentication database
    [--code path]	run the given python file on load
    [--defaultui]	start by resetting user ui settings to default
    [--hide-browser]	hide the browser widget
    [--dxf-export filename.dxf]	emit dxf output of loaded datasets to given file
    [--dxf-extent xmin,ymin,xmax,ymax]	set extent to export to dxf
    [--dxf-symbology-mode none|symbollayer|feature]	symbology mode for dxf output
    [--dxf-scale-denom scale]	scale for dxf output
    [--dxf-encoding encoding]	encoding to use for dxf output
    [--dxf-map-theme maptheme]	map theme to use for dxf output
    [--profile name]	load a named profile from the user profiles folder
    [--profiles-path path]	path to store user profile folders. Will create profile inside a {path}\profiles folder
    [--version-migration]	forces the settings migration from older version if found
    [--help]		this text
    [--]		treat all following arguments as FILEs

  FILE:
    Files specified on the command line can include rasters,
    vectors, and QGIS project files (.qgs and .qgz):
     1. Rasters - supported formats include GeoTiff, DEM
        and others supported by GDAL
     2. Vectors - supported formats include ESRI Shapefiles
        and others supported by OGR and PostgreSQL layers using
        the PostGIS extension

.. tip::
        **Example Using command line arguments**

        You can start QGIS by specifying one or more data files on the command
        line. For example, assuming you are in the :file:`qgis_sample_data`
        directory, you could start QGIS with a vector layer and a raster file
        set to load on startup using the following command:
        ``qgis ./raster/landcover.img ./gml/lakes.gml``

**Command line option** ``--snapshot``

This option allows you to create a snapshot in PNG format from the current view.
This comes in handy when you have a lot of projects and want to generate
snapshots from your data.

Currently, it generates a PNG file with 800x600 pixels. This can be adjusted
using the ``--width`` and ``--height`` command line arguments. A filename can
be added after ``--snapshot``.

**Command line option** ``--lang``

Based on your locale, QGIS selects the correct localization. If you would like
to change your language, you can specify a language code. For example,
``qgis --lang it`` starts QGIS in Italian localization.

**Command line option** ``--project``

Starting QGIS with an existing project file is also possible. Just add the
command line option ``--project`` followed by your project name and QGIS will
open with all layers in the given file loaded.

**Command line option** ``--extent``

To start with a specific map extent use this option. You need to add the
bounding box of your extent in the following order separated by a comma:

::

    --extent xmin,ymin,xmax,ymax

**Command line option** ``--nologo``

This command line argument hides the splash screen when you start QGIS.

**command line option** ``--noversioncheck``

Don't check for new version of QGIS at startup.

**Command line option** ``--noplugins``

If you have trouble at start-up with plugins, you can avoid loading them at
start-up with this option. They will still be available from the Plugins Manager afterwards.

.. _custom_commandline:

**Command line option** ``--customizationfile``

Using this command line argument, you can define a GUI customization file, that will
be used at startup.

**Command line option** ``--nocustomization``

Using this command line argument, existing GUI customization will not be applied
at startup.

**Command line option** ``--optionspath``

You can have multiple configurations and decide which one to use when starting
QGIS with this option. See :ref:`gui_options` to confirm where the
operating system saves the settings files. Presently, there is no way to specify
a file to write settings to; therefore, you can create a copy of
the original settings file and rename it. The option specifies path to directory
with settings. For example, to use :file:`/path/to/config/QGIS/QGIS2.ini` settings file,
use option:

::

    --optionspath /path/to/config/

**Command line option** ``--configpath``

This option is similar to the one above, but furthermore overrides the default
path for user configuration (:file:`~/.qgis2`) and forces **QSettings** to use
this directory, too. This allows users to, for instance, carry a QGIS installation on a
flash drive together with all plugins and settings.

**Command line option** ``--authdbdirectory``

Again, this option is similar to the one above but define the path to the
directory where the authentication database will be stored.

**Command line option** ``--code``

This option can be used to run a given python file directly after QGIS has started.

For example, when you have a python file named :file:`load_alaska.py` with following content:

::

  from qgis.utils import iface
  raster_file = "/home/gisadmin/Documents/qgis_sample_data/raster/landcover.img"
  layer_name = "Alaska"
  iface.addRasterLayer(raster_file, layer_name)

Assuming you are in the directory where the file :file:`load_alaska.py` is located, you
can start QGIS, load the raster file :file:`landcover.img` and give the layer the name
'Alaska' using the following command:
``qgis --code load_alaska.py``


**Command line options** ``--dxf-*``

These options can be used to export QGIS project into a DXF file. Several
options are available:

* *--dxf-export*: the DXF filename into which to export the layers;
* *--dxf-extent*: the extent of the final DXF file;
* *--dxf-symbology-mode*: several values can be used here: none (no symbology),
  symbollayer (Symbol layer symbology), feature (feature symbology);
* *--dxf-scale-denom*: the scale denominator of the symbology;
* *--dxf-encoding*: the file encoding;
* *--dxf-map-theme*: choose a :ref:`map theme <map_themes>` from the layer tree
  configuration.

.. _samplesession:

Sample Session: Loading raster and vector layers
================================================

Now that you have QGIS installed and a sample dataset available, we will demonstrate 
a first sample session. In this example, we will visualize a raster and a vector layer. 
We will use:

* the :file:`landcover` raster layer i.e., :file:`qgis_sample_data/raster/landcover.img`
* and the :file:`lakes` vector layer i.e., :file:`qgis_sample_data/gml/lakes.gml`.


#. Start QGIS as seen in :ref:`label_startingqgis`.
#. To load the landcover data, click on the |dataSourceManager| :sup:`Open Data Source Manager` icon.
#. The Data Source Manager should open in Browser mode.
#. Browse to the folder :file:`qgis_sample_data/raster/`, select
   the ERDAS IMG file :file:`landcover.img` and double-click to open it. 
   (The landcover layer is added in the background while the Data Source Manager window remains open.)
#. To load the lakes data, browse to the folder :file:`qgis_sample_data/gml/`, 
   and double-click on the file :file:`lakes.gml` to open it.
   The :guilabel:`Coordinate Reference System Selector` dialog opens with
   :guilabel:`NAD27 / Alaska Alberts` selected, click **[OK]**.
#. Close the Data Source Manager window.
#. Zoom to your favourite area with some lakes.
#. Double click the :file:`lakes` layer in the map legend to open the
   :guilabel:`Properties` dialog.
#. Click on the :guilabel:`Symbology` tab and select a blue as fill color.
#. Click on the :guilabel:`Labels` tab and select :guilabel:`Show labels for
   this layer` in the drop-down menu to enable labeling. Then from the
   :guilabel:`Label with` list, choose the ``NAMES`` field as the field containing labels.
#. To improve readability of labels, you can add a white buffer around them
   by clicking :guilabel:`Buffer` in the list on the left, checking |checkbox|
   :guilabel:`Draw text buffer` and choosing 3 as buffer size.
#. Click **[Apply]**. Check if the result looks good, and finally click **[OK]**.

You can see how easy it is to visualize raster and vector layers in QGIS. Let's
move on to learn more about the available functionality, features and settings, 
and how to use them.

.. index:: Projects
.. _sec_projects:

Introducing QGIS projects
=========================

The state of your QGIS session is called a project. QGIS works on one
project at a time. Any settings can be project-specific or an application-wide
default for new projects (see section :ref:`gui_options`). QGIS can save the
state of your workspace into a project file using the menu options
:menuselection:`Project -->` |fileSave| :menuselection:`Save`
or :menuselection:`Project -->` |fileSaveAs| :menuselection:`Save As...`.

.. note::
  
  If the project you loaded has been modified in the meantime, by default, QGIS
  will ask you if you want to overwrite the changes. This behavior is controlled
  by the |checkbox| :guilabel:`Prompt to save project and data source changes when
  required` setting under :menuselection:`Settings --> Options --> General` menu.

You can load existing projects into QGIS using :menuselection:`Project -->`
|fileOpen| :menuselection:`Open...`,
:menuselection:`Project --> New from template` or
:menuselection:`Project --> Open Recent -->`.

At startup, a list of recently opened project including screenshots, names and file paths 
(for up to ten projects) is displayed. This is a handy quick way to access recently used projects.
Double-click an entry in this list to open the corresponding project.
If you instead want to create a new project, just add any layer and the list disappears, giving
way to the map canvas.

If you want to clear your session and start fresh, go to
:menuselection:`Project -->` |fileNew| :menuselection:`New`.
This will prompt you to save the existing project if
changes have been made since it was opened or last saved.

The information saved in a project file includes:

* Layers added
* Which layers can be queried
* Layer properties, including symbolization and styles
* Projection for the map view
* Last viewed extent
* Print layouts
* Print layout elements with settings
* Print layout atlas settings
* Digitizing settings
* Table Relations
* Project Macros
* Project default styles
* Plugins settings
* QGIS Server settings from the OWS settings tab in the Project properties
* Queries stored in the DB Manager

The project file is saved in XML format. This means that it is possible to edit the file
outside of QGIS if you know what you are doing. The file format has been updated several
times compared with earlier QGIS versions. Project files from older QGIS versions
may not work properly any more. 

.. note::

  By default, QGIS will warn you of version differences. 
  This behavior is controlled in :menuselection:`Settings --> Options`. On the 
  :guilabel:`General` tab, you should tick |checkbox| 
  :guilabel:`Warn when opening a project file saved with an older version of QGIS`.

Whenever you save a project in QGIS a backup of the project file is created with the
extension ``.qgs~`` and stored in the same directory as the project file.

The default extension for QGIS projects is ``.qgs`` but a project may be
zipped in a ``.qgz`` file too. Actually, the ``.qgs`` file is just embedded
in an archive, so you still have the possibility to unzip it in order to
manually edit XML information in a text editor. These ``.qgz`` files can also
be opened like default ``.qgs`` files. To zip a project, the corresponding
extension has just to be selected in
:menuselection:`Project -->` |fileSaveAs| :menuselection:`Save As...`. Once
zipped, a :menuselection:`Project -->` |fileSave| :menuselection:`Save` action
automatically zip your current project.

.. note::

  A zipped project may be particularly useful with the
  :ref:`vector_auxiliary_storage` mechanism in order to embed the underlying
  database.
  
Projects can also be saved/loaded to/from a PostgreSQL database using the
following Project menu items:

* :menuselection:`Project --> Open from`
* :menuselection:`Project --> Save to`

Both menu items have a sub-menu with list of extra project storage implementations 
(currently just PostgreSQL). Clicking the action will open a dialog to pick
a PostgreSQL connection name, schema name and project.

Projects stored in PostgreSQL can be also loaded from the QGIS browser panel 
(the entries are located within the schema they are stored in), either by 
double-clicking them or by dragging them to the map canvas.

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
.. |newLayout| image:: /static/common/mActionNewLayout.png
   :width: 1.5em
.. |nix| image:: /static/common/nix.png
   :width: 1em
.. |osx| image:: /static/common/osx.png
   :width: 1em
.. |saveMapAsImage| image:: /static/common/mActionSaveMapAsImage.png
   :width: 1.5em
.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit http://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
.. |win| image:: /static/common/win.png
   :width: 1em
