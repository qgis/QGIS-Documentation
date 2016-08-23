.. Purpose: This chapter aims to describe how the user start to use QGIS. It
.. should keep it short with only few step to get QGIS working with two layers.

|updatedisclaimer|

.. _`label.getstarted`:

***************
Getting Started
***************

.. only:: html

   .. contents::
      :local:

This chapter gives a quick overview of installing QGIS, some sample data from
the QGIS web page, and running a first and simple session visualizing raster
and vector layers.

.. _`label_installation`:

Installation
============

.. :index::
    single:installation

Installation of QGIS is very simple. Standard installer packages are available
for MS Windows and Mac OS X. For many flavors of GNU/Linux, binary packages (rpm
and deb) or software repositories are provided to add to your installation manager.
Get the latest information on binary packages at the QGIS website at
http://download.qgis.org.

Installation from source
------------------------

If you need to build QGIS from source, please refer to the installation
instructions. They are distributed with the QGIS source code in a file
called :file:`INSTALL`. You can also find them online at
http://htmlpreview.github.io/?https://raw.github.com/qgis/QGIS/master/doc/INSTALL.html

Installation on external media
-------------------------------

QGIS allows you to define a ``--configpath`` option that overrides the default
path for user configuration (e.g., :file:`~/.qgis2` under Linux) and forces
**QSettings** to use this directory, too. This allows you to, for instance, carry a
QGIS installation on a flash drive together with all plugins and settings.
See section :ref:`env_options` for additional information.

.. _label_sampledata:

Sample Data
-----------

.. :index::
    single:data sample

The user guide contains examples based on the QGIS sample dataset.

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

|nix| |osx| For GNU/Linux and Mac OS X, there are not yet dataset installation
packages available as rpm, deb or dmg. To use the sample dataset, download the
file :file:`qgis_sample_data` as a ZIP archive from
http://qgis.org/downloads/data/ and unzip the archive
on your system.

The Alaska dataset includes all GIS data that are used for examples and
screenshots in the user guide; it also includes a small GRASS database.
The projection for the QGIS sample dataset is Alaska Albers Equal Area with
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

Launching QGIS
==============

.. _`label_startingqgis`:

Starting and Stopping QGIS
--------------------------
Starting QGIS is done as you usually do for any other application on your
platform. It means that you can launch QGIS by:

* typing ``qgis`` at a command prompt, assuming that QGIS is added to your PATH
  or you're in its installation folder
* using |nix| the Applications menu if using a precompiled binary,
  |win| the Start menu or |osx| the Dock
* double clicking the icon in your Applications folder or desktop shortcut
* double clicking an existing QGIS project (``.qgs``) file. Note that this will
  also open the project


To stop QGIS, click:

* |nix| |win| the menu option :menuselection:`Project --> Exit QGIS` or use the shortcut
  :kbd:`Ctrl+Q`
* |osx| :menuselection:`QGIS --> Quit QGIS`, or use the shortcut :kbd:`Cmd+Q`
* or use the red cross at the right top corner of the main interface of the application.

.. _`label_commandline`:

Command Line Options
--------------------

.. index::
   single:command line options

In previous section you learned how to start QGIS.
You will see that QGIS also provides further command line options.

QGIS supports a number of options when started from the command line. To
get a list of the options, enter ``qgis --help`` on the command line. The usage
statement for QGIS is:

::

  qgis --help
  QGIS - 2.6.0-Brighton 'Brighton' (exported)
  QGIS is a user friendly Open Source Geographic Information System.
  Usage: /usr/bin/qgis.bin [OPTION] [FILE]
  OPTION:
    [--snapshot filename]   emit snapshot of loaded datasets to given file
    [--width width] width of snapshot to emit
    [--height height]       height of snapshot to emit
    [--lang language]       use language for interface text
    [--project projectfile] load the given QGIS project
    [--extent xmin,ymin,xmax,ymax]  set initial map extent
    [--nologo]      hide splash screen
    [--noversioncheck]      don't check for new version of QGIS at startup
    [--noplugins]   don't restore plugins on startup
    [--nocustomization]     don't apply GUI customization
    [--customizationfile]   use the given ini file as GUI customization
    [--optionspath path]    use the given QSettings path
    [--configpath path]     use the given path for all user configuration
    [--authdbdirectory path] use the given directory for authentication database
    [--code path]   run the given python file on load
    [--defaultui]   start by resetting user ui settings to default
    [--dxf-export filename.dxf]     emit dxf output of loaded datasets to given file
    [--dxf-extent xmin,ymin,xmax,ymax]      set extent to export to dxf
    [--dxf-symbology-mode none|symbollayer|feature] symbology mode for dxf output
    [--dxf-scale-denom scale]       scale for dxf output
    [--dxf-encoding encoding]       encoding to use for dxf output
    [--dxf-preset visiblity-preset] layer visibility preset to use for dxf output
    [--help]                this text
    [--]            treat all following arguments as FILEs

  FILE:
    Files specified on the command line can include rasters,
    vectors, and QGIS project files (.qgs):
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
* *--dxf-scale-deno*: the scale denominator of the symbology;
* *--dxf-encoding*: the file encoding;
* *--dxf-preset*: choose a visibility preset. These presets are defined in the
  layer tree, see :ref:`label_legend`.

.. _samplesession:

Sample Session: Load raster and vector layers
==============================================

Now that you have QGIS installed and a sample dataset available, we would
like to demonstrate a short and simple QGIS sample session. We will visualize
a raster and a vector layer. We will use:

* the :file:`landcover` raster layer i.e., :file:`qgis_sample_data/raster/landcover.img`
* and the :file:`lakes` vector layer i.e., :file:`qgis_sample_data/gml/lakes.gml`.


#. Start QGIS as seen in :ref:`label_startingqgis`
#. Click on the |addRasterLayer| :sup:`Add Raster Layer` icon.
#. Browse to the folder :file:`qgis_sample_data/raster/`, select
   the ERDAS IMG file :file:`landcover.img` and click **[Open]**.
#. If the file is not listed, check if the :guilabel:`Files of type`
   |selectString| combo box at the bottom of the dialog is set on the right
   type, in this case **Erdas Imagine Images (\*.img \*.IMG)**.
#. Now click on the |addOgrLayer| :sup:`Add Vector Layer` icon.
#. |radioButtonOn| :guilabel:`File` should be selected as :guilabel:`Source Type`
   in the new :guilabel:`Add vector layer` dialog. Now click **[Browse]** to
   select the vector layer.
#. Browse to the folder :file:`qgis_sample_data/gml/`, select **Geography Markup
   Language [GML] [OGR] (*.gml *.GML)** from the :guilabel:`Filter` |selectstring|
   combo box, then select the GML file :file:`lakes.gml` and
   click **[Open]**. In the :guilabel:`Add vector layer` dialog, click **[OK]**.
   The :guilabel:`Coordinate Reference System Selector` dialog opens with
   :guilabel:`NAD27 / Alaska Alberts` selected, click **[OK]**.
#. Zoom in a bit to your favourite area with some lakes.
#. Double click the :file:`lakes` layer in the map legend to open the
   :guilabel:`Properties` dialog.
#. Click on the :guilabel:`Style` tab and select a blue as fill color.
#. Click on the :guilabel:`Labels` tab and select :guilabel:`Show labels for
   this layer` in the drop-down menu to enable labeling. Then from the
   :guilabel:`Label with` list, choose the ``NAMES`` field as the field containing labels.
#. To improve readability of labels, you can add a white buffer around them
   by clicking :guilabel:`Buffer` in the list on the left, checking |checkbox|
   :guilabel:`Draw text buffer` and choosing 3 as buffer size.
#. Click **[Apply]**. Check if the result looks good, and finally click **[OK]**.

You can see how easy it is to visualize raster and vector layers in QGIS. Let's
move on to the sections that follow to learn more about the available
functionality, features and settings, and how to use them.

.. _sec_projects:

Projects
========

The state of your QGIS session is considered a project. QGIS works on one
project at a time. Settings are considered as being either per-project or as a
default for new projects (see section :ref:`gui_options`). QGIS can save the
state of your workspace into a project file using the menu options
:menuselection:`Project -->` |fileSave| :menuselection:`Save`
or :menuselection:`Project -->` |fileSaveAs| :menuselection:`Save As...`.
If the loaded project file on disk was meanwhile changed, by default, QGIS will
ask you if you want to overwrite the changes into the project file. This behavior
is set by checking |checkbox| :guilabel:`Prompt to save project and data source
changes when required` under :menuselection:`Settings --> Options --> General`
menu .

Load saved projects into a QGIS session using :menuselection:`Project -->`
|fileOpen| :menuselection:`Open...`,
:menuselection:`Project --> New from template` or
:menuselection:`Project --> Open Recent -->`.

At startup, a list of screenshot with the name and path of each of the most recent
projects (up to ten) is shown instead of a white and empty map canvas. This is
a handy and quicker way to remember what a project was about and double-click
a row opens the selected project.
If you're willing to create a new project, just add new layers and the list disappears.

If you wish to clear your session and start fresh, choose
:menuselection:`Project -->` |fileNew| :menuselection:`New`.
Either of these menu options will prompt you to save the existing project if
changes have been made since it was opened or last saved.

The kinds of information saved in a project file include:

* Layers added
* Which layers can be queried
* Layer properties, including symbolization and styles
* Projection for the map view
* Last viewed extent
* Print Composers
* Print Composer elements with settings
* Print Composer atlas settings
* Digitizing settings
* Table Relations
* Project Macros
* Project default styles
* Plugins settings
* QGIS Server settings from the OWS settings tab in the Project properties
* Queries stored in the DB Manager


The project file is saved in XML format, so it is possible to edit the file
outside QGIS if you know what you are doing. The file format has been updated several
times compared with earlier QGIS versions. Project files from older QGIS versions
may not work properly any more. To be made aware of this, in the
:guilabel:`General` tab under :menuselection:`Settings --> Options` you should
tick |checkbox| :guilabel:`Warn when opening a project file saved with an older
version of QGIS`.

Whenever you save a project in QGIS a backup of the project file is made with the
extension ``.qgs~``.

.. _`sec_output`:

Output
======

.. index::
   single:output save as image
.. index::
   single:print composer quick print

There are several ways to generate output from your QGIS session. We have
discussed one already in section :ref:`sec_projects`, saving as a project file.
Here is a sampling of other ways to produce output files:

* Menu option :menuselection:`Project -->` |saveMapAsImage| :menuselection:`Save
  as Image...` opens a file dialog where you select the name, path and type of
  image (PNG, JPG and many other formats). A world file with extension ``PNGW``
  or ``JPGW`` saved in the same folder georeferences the image.
* Menu option :menuselection:`Project --> DXF Export...` opens
  a dialog where you can define the 'Symbology mode', the 'Symbology scale' and
  vector layers you want to export to DXF. Through the 'Symbology mode' symbols
  from the original QGIS Symbology can be exported with high fidelity.
* Menu option :menuselection:`Project -->` |newComposer|
  :menuselection:`New Print Composer...` opens a dialog where you can layout and
  print the current map canvas (see section :ref:`label_printcomposer`).
