|updatedisclaimer|

.. _`label.getstarted`:

***************
Getting Started
***************

This chapter gives a quick overview of installing |qg|, some sample data from
the |qg| web page, and running a first and simple session visualizing raster
and vector layers.

.. _`label_installation`:

Installation
============

.. :index::
    single:installation

Installation of |qg| is very simple. Standard installer packages are available
for MS Windows and Mac OS X. For many flavors of GNU/Linux, binary packages (rpm
and deb) or software repositories are provided to add to your installation manager. Get the latest information on binary packages at the |qg| website at
http://download.qgis.org.

Installation from source
........................

If you need to build |qg| from source, please refer to the installation
instructions. They are distributed with the |qg| source code in a file
called :file:`INSTALL`. You can also find them online at
http://htmlpreview.github.io/?https://raw.github.com/qgis/QGIS/master/doc/INSTALL.html

Installation on external media
..............................

|qg| allows you to define a ``--configpath`` option that overrides the default path for user configuration (e.g., :file:`~/.qgis2` under Linux) and forces
**QSettings** to use this directory, too. This allows you to, for instance, carry a
|qg| installation on a flash drive together with all plugins and settings. See section :ref:`env_options` for additional information.

.. _label_sampledata:

Sample Data
============

.. :index::
    single:data sample

The user guide contains examples based on the |qg| sample dataset.

|win| The Windows installer has an option to download the |qg| sample dataset.
If checked, the data will be downloaded to your :file:`My Documents` folder and
placed in a folder called :file:`GIS Database`. You may use Windows Explorer to
move this folder to any convenient location. If you did not select the checkbox
to install the sample dataset during the initial |qg| installation, you may do one of the following:

* Use GIS data that you already have
* Download sample data from
  http://download.osgeo.org/qgis/data/qgis_sample_data.zip
* Uninstall |qg| and reinstall with the data download option checked (only recommended if
  the above solutions are unsuccessful)

|nix| |osx| For GNU/Linux and Mac OS X, there are not yet dataset installation
packages available as rpm, deb or dmg. To use the sample dataset, download the
file :file:`qgis_sample_data` as a ZIP archive from
http://download.osgeo.org/qgis/data/qgis_sample_data.zip and unzip the archive
on your system.

The Alaska dataset includes all GIS data that are used for examples and
screenshots in the user guide; it also includes a small GRASS database.
The projection for the |qg| sample dataset is Alaska Albers Equal Area with
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

If you intend to use |qg| as a graphical front end for GRASS, you can find a
selection of sample locations (e.g., Spearfish or South Dakota) at the
official GRASS GIS website, http://grass.osgeo.org/download/sample-data/.

.. _samplesession:

Sample Session
==============

Now that you have |qg| installed and a sample dataset available, we would
like to demonstrate a short and simple |qg| sample session. We will visualize
a raster and a vector layer. We will use the :file:`landcover` raster layer,
:file:`qgis_sample_data/raster/landcover.img`, and the :file:`lakes` vector
layer, :file:`qgis_sample_data/gml/lakes.gml`.

Start QGIS
..........

* |nix| Start |qg| by typing "|qg|" at a command prompt, or if using a
  precompiled binary, by using the Applications menu.
* |win| Start |qg| using the Start menu or desktop shortcut, or double click on
  a |qg| project file.
* |osx| Double click the icon in your Applications folder.

.. _`fig_simple_session`:

.. /static/user_manual/introduction/simple_session.png
   :align: center

   A Simple |qg| Session

Load raster and vector layers from the sample dataset
.....................................................

#. Click on the |mActionAddRasterLayer| :sup:`Load Raster` icon.
#. Browse to the folder :file:`qgis_sample_data/raster/`, select
   the ERDAS IMG file :file:`landcover.img` and click **[Open]**.
#. If the file is not listed, check if the :guilabel:`Files of type`
   |selectstring| combo box at the bottom of the dialog is set on the right
   type, in this case "Erdas Imagine Images (*.img, *.IMG)".
#. Now click on the |mActionAddOgrLayer| :sup:`Load Vector` icon.
#. |radiobuttonon| :guilabel:`File` should be selected as :guilabel:`Source Type`
   in the new :guilabel:`Add vector layer` dialog. Now click **[Browse]** to
   select the vector layer.
#. Browse to the folder :file:`qgis_sample_data/gml/`, select 'Geography Markup
   Language [GML] [OGR] (.gml,.GML)' from the :guilabel:`Files of type` |selectstring| combo box, then select the GML file :file:`lakes.gml` and
   click **[Open]**. In the :guilabel:`Add vector layer` dialog, click **[OK]**.
#. Zoom in a bit to your favorite area with some lakes.
#. Double click the :file:`lakes` layer in the map legend to open the
   :guilabel:`Properties` dialog.
#. Click on the :guilabel:`Style` tab and select a blue as fill color.
#. Click on the :guilabel:`Labels` tab and check the |checkbox|
   :guilabel:`Label this layer with` checkbox to enable labeling. Choose the
   "NAMES" field as the field containing labels.
#. To improve readability of labels, you can add a white buffer around them
   by clicking "Buffer" in the list on the left, checking |checkbox|
   :guilabel:`Draw text buffer` and choosing 3 as buffer size.
#. Click **[Apply]**. Check if the result looks good, and finally click **[OK]**.

You can see how easy it is to visualize raster and vector layers in |qg|. Let's
move on to the sections that follow to learn more about the available
functionality, features and settings, and how to use them.

.. _`label_startingqgis`:

Starting and Stopping |qg|
==========================

In section :ref:`samplesession` you already learned how to start |qg|. We will
repeat this here, and you will see that |qg| also provides further command line
options.

* |nix| Assuming that |qg| is installed in the PATH, you can start |qg|
  by typing ``qgis`` at a command prompt or by double clicking on the |qg|
  application link (or shortcut) on the desktop or in the Applications menu.
* |win| Start |qg| using the Start menu or desktop shortcut, or double click on
  a |qg| project file.
* |osx| Double click the icon in your Applications folder. If you need to
  start |qg| in a shell, run
  ``/path-to-installation-executable/Contents/MacOS/Qgis``.

To stop |qg|, click the menu option |nix| |win| :menuselection:`File` |osx|
:menuselection:`QGIS --> Quit`, or use the shortcut :kbd:`Ctrl+Q`.

.. _`label_commandline`:

Command Line Options
====================

.. index::
   single:command line options

|nix| |qg| supports a number of options when started from the command line. To
get a list of the options, enter ``qgis --help`` on the command line. The usage
statement for QGIS is:

::

  qgis --help
  QGIS - 2.2.0-Valmiera 'Valmiera' (exported)
  QGIS is a user friendly Open Source Geographic Information System.
  Usage: qgis [OPTION] [FILE]
  options:
   [--snapshot filename]           emit snapshot of loaded datasets to given file
   [--width width]                 width of snapshot to emit
   [--height height]               height of snapshot to emit
   [--lang language]               use language for interface text
   [--project projectfile]         load the given QGIS project
   [--extent xmin,ymin,xmax,ymax]  set initial map extent
   [--nologo]                      hide splash screen
   [--noplugins]                   don't restore plugins on startup
   [--nocustomization]             don't apply GUI customization
   [--customizationfile]           use the given ini file as GUI customization
   [--optionspath path]            use the given QSettings path
   [--configpath path]             use the given path for all user configuration
   [--code path]                   run the given python file on load
   [--help]                        this text

   FILES:
         Files specified on the command line can include rasters,
         vectors, and QGIS project files (.qgs):
         1. Rasters - Supported formats include GeoTiff, DEM
            and others supported by GDAL
         2. Vectors - Supported formats include ESRI Shapefiles
            and others supported by OGR and PostgreSQL layers using
            the PostGIS extension

.. tip::
        **Example Using command line arguments**

        You can start |qg| by specifying one or more data files on the command
        line. For example, assuming you are in the :file:`qgis_sample_data`
        directory, you could start |qg| with a vector layer and a raster file
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

Based on your locale, |qg| selects the correct localization. If you would like
to change your language, you can specify a language code. For example,
``--lang=it`` starts |qg| in italian localization. A list of currently supported
languages with language code and status is provided at
http://hub.qgis.org/wiki/quantum-gis/GUI_Translation_Progress.

**Command line option** ``--project``

Starting QGIS with an existing project file is also possible. Just add the
command line option ``--project`` followed by your project name and |qg| will
open with all layers in the given file loaded.

**Command line option** ``--extent``

To start with a specific map extent use this option. You need to add the
bounding box of your extent in the following order separated by a comma:

::

    --extent xmin,ymin,xmax,ymax

**Command line option** ``--nologo``

This command line argument hides the splash screen when you start |qg|.

**Command line option** ``--noplugins``

If you have trouble at start-up with plugins, you can avoid loading them at
start-up with this option. They will still be available from the Plugins Manager afterwards.

**Command line option** ``--customizationfile``

Using this command line argument, you can define a GUI customization file, that will 
be used at startup.

**Command line option** ``--nocustomization``

Using this command line argument, existing GUI customization will not be applied
at startup.

**Command line option** ``--optionspath``

You can have multiple configurations and decide which one to use when starting
|qg| with this option. See :ref:`gui_options` to confirm where the
operating system saves the settings files. Presently, there is no way to specify
a file to write settings to; therefore, you can create a copy of
the original settings file and rename it. The option specifies path to directory 
with settings. For example, to use /path/to/config/QGIS/QGIS2.ini settings file, 
use option:

::

    --optionspath /path/to/config/

**Command line option** ``--configpath``

This option is similar to the one above, but furthermore overrides the default
path for user configuration (:file:`~/.qgis2`) and forces **QSettings** to use
this directory, too. This allows users to, for instance, carry a |qg| installation on a
flash drive together with all plugins and settings.

.. _sec_projects:

Projects
========

The state of your |qg| session is considered a project. |qg| works on one
project at a time. Settings are considered as being either per-project or as a
default for new projects (see section :ref:`gui_options`). |qg| can save the
state of your workspace into a project file using the menu options
:menuselection:`Project -->` |mActionFileSave| :menuselection:`Save`
or :menuselection:`Project -->` |mActionFileSaveAs| :menuselection:`Save As...`.

Load saved projects into a |qg| session using :menuselection:`Project -->`
|mActionFileOpen| :menuselection:`Open...`,
:menuselection:`Project --> New from template` or
:menuselection:`Project --> Open Recent -->`.

If you wish to clear your session and start fresh, choose
:menuselection:`Project -->` |mActionFileNew| :menuselection:`New`.
Either of these menu options will prompt you to save the existing project if
changes have been made since it was opened or last saved.

The kinds of information saved in a project file include:

* Layers added
* Layer properties, including symbolization
* Projection for the map view
* Last viewed extent

The project file is saved in XML format, so it is possible to edit the file
outside |qg| if you know what you are doing. The file format has been updated several
times compared with earlier |qg| versions. Project files from older |qg| versions
may not work properly anymore. To be made aware of this, in the
:guilabel:`General` tab under :menuselection:`Settings --> Options` you can
select:

* |checkbox| :guilabel:`Prompt to save project and data source changes when
  required`
* |checkbox| :guilabel:`Warn when opening a project file saved with an older
  version of QGIS`

Whenever you save a project in |qg| 2.2 now a backup of the project file is made. 

.. _`sec_output`:

Output
======

.. index::
   single:output save as image
.. index::
   single:print composer quick print

There are several ways to generate output from your |qg| session. We have
discussed one already in section :ref:`sec_projects`, saving as a project file.
Here is a sampling of other ways to produce output files:

* Menu option :menuselection:`Project -->` |mActionSaveMapAsImage| :sup:`Save
  as Image` opens a file dialog where you select the name, path and type of
  image (PNG or JPG format). A world file with extension PNGW or JPGW saved
  in the same folder georeferences the image.
* Menu option :menuselection:`Project -->` :guilabel:`DXF Export ...` opens
  a dialog where you can define the 'Symbology mode', the 'Symbology scale' and
  vector layers you want to export to DXF.
* Menu option :menuselection:`Project -->` |mActionNewComposer|
  :menuselection:`New Print Composer` opens a dialog where you can lay out and
  print the current map canvas (see section :ref:`label_printcomposer`).
