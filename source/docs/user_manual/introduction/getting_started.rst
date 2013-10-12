.. |updatedisclaimer|
.. _`label.getstarted`:

***************
Getting Started
***************

This chapter gives a quick overview of installing |qg|, some sample
data from the |qg| web page and running a first and simple session
visualizing raster and vector layers.

.. _`label_installation`:

Installation
============

.. :index::
    single:installation

Installation of |qg| is very simple. Standard installer packages are
available for MS Windows and Mac OS X. For many flavors of GNU/Linux binary
packages (rpm and deb) or software repositories to add to your installation
manager are provided. Get the latest information on binary packages at the
|qg| website at http://download.qgis.org.

Installation from source
........................

If you need to build |qg| from source, please refer to the installation
instructions. They are distributed with the |qg| source code in a file
called 'INSTALL'. You can also find it online at
https://github.com/qgis/QGIS/blob/master/INSTALL

Installation on external media
..............................

QGIS allows to define a ``--configpath`` option that overrides the default path
(e.g. ~/.qgis under Linux) for user configuration and forces QSettings to use
this directory, too. This allows users to e.g. carry a QGIS installation on a
flash drive together with all plugins and settings.

.. _label_sampledata:

Sample Data
============

.. :index::
    single:data sample

The user guide contains examples based on the |qg| sample dataset.

|win| The Windows installer has an option to download the |qg| sample dataset.
If checked, the data will be downloaded to your :file:`My Documents`
folder and placed in a folder called :file:`GIS Database`.
You may use Windows Explorer to move this folder to any convenient location.
If you did not select the checkbox to install the sample dataset
during the initial |qg| installation, you can either

* use GIS data that you already have;
* download sample data from the qgis website at http://download.qgis.org/qgis/data/; or
* uninstall |qg| and reinstall with the data download option checked, only if
  the above solutions are unsuccessful.

|nix| |osx| For GNU/Linux and Mac OSX there are not yet dataset installation
packages available as rpm, deb or dmg. To use the sample dataset download the
file :file:`qgis_sample_data` as ZIP or TAR archive from
http://download.osgeo.org/qgis/data/ and unzip or untar the archive on
your system. The Alaska dataset includes all GIS data that are used as
examples and screenshots in the user guide, and also includes a small GRASS
database. The projection for the qgis sample dataset is Alaska Albers Equal
Area with unit feet. The EPSG code is 2964.

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

If you intend to use |qg| as graphical frontend for GRASS, you can find a
selection of sample locations (e.g. Spearfish or South Dakota) at the
official GRASS GIS website http://grass.osgeo.org/download/data.php.

.. _samplesession:

Sample Session
==============

Now that you have |qg| installed and a sample dataset available, we would
like to demonstrate a short and simple |qg| sample session. We will visualize
a raster and a vector layer. We will use the landcover raster
layer :file:`qgis_sample_data/raster/landcover.img` and the lakes
vector layer :file:`qgis_sample_data/gml/lakes.gml`.

Start QGIS
..........

* |nix| Start |qg| by typing: "|qg|" at a command prompt, or
  if using precompiled binary, using the Applications menu.
* |win| Start |qg| using the Start menu or desktop shortcut,
  or double click on a |qg| project file.
* |osx| Double click the icon in your Applications folder.

.. _`fig_simple_session`:

.. /static/user_manual/introduction/simple_session.png
   :align: center

   A Simple |qg| Session

Load raster and vector layers from the sample dataset
.....................................................

#. Click on the |mActionAddRasterLayer| :sup:`Load Raster` icon.
#. Browse to the folder :file:`qgis_sample_data/raster/`, select
   the ERDAS Img file :file:`landcover.img` and click **[Open]**.
#. If the file is not listed, check if the Filetype combobox at the
   bottom of the dialog is set on the right type, in this case
   "Erdas Imagine Images (:file:`*.img`, :file:`*.IMG`)".
#. Now click on the |mActionAddOgrLayer| :sup:`Load Vector` icon.
#. |radiobuttonon| :guilabel:`File` should be selected as Source Type in the new
   :guilabel:`Add Vector Layer` dialog. Now click **[Browse]** to select
   the vector layer.
#. Browse to the folder :file:`qgis_sample_data/gml/`, select "GML"
   from the filetype combobox, then select the GML file :file:`lakes.gml`
   and click **[Open]**, then in Add Vector dialog click **[OK]**.
#. Zoom in a bit to your favorite area with some lakes.
#. Double click the :file:`lakes` layer in the map legend to open the
   :guilabel:`Properties` dialog.
#. Click on the :guilabel:`Style` tab and select a blue as fill color.
#. Click on the :guilabel:`Labels` tab and check the |checkbox| :guilabel:`Label this layer with`
   checkbox to enable labeling and choose NAMES field as field containing labels.
#. To improve readability of labels, you can add a white buffer around them,
   by clicking "Buffer" in the list on the left, checking |checkbox| :guilabel:`Draw text buffer`
   and choosing 3 as buffer size.
#. Click **[Apply]**, check if the result looks good and finally
   click **[OK]**.

You can see how easy it is to visualize raster and vector layers in
|qg|. Let's move on to the sections that follow to learn more about the
available functionality, features and settings and how to use them.

.. _`label_startingqgis`:

Starting and Stopping QGIS
===========================

In Section :ref:`samplesession` you already learned how to start QGIS. We will
repeat this here and you will see that QGIS also provides further command line
options.

* |nix| Assuming that QGIS is installed in the PATH, you can start QGIS
  by typing: ``qgis``  at a command prompt or by double clicking on the QGIS
  application link (or shortcut) on the desktop or in the application menu.
* |win| Start QGIS using the Start menu or desktop shortcut,
  or double click on a QGIS project file.
* |osx| Double click the icon in your Applications folder. If you need to
  start QGIS in a shell, run
  /path-to-installation-executable/Contents/MacOS/Qgis.


To stop QGIS, click the menu options |nix| |win| :menuselection:`File` |osx|
:menuselection:`QGIS --> Quit`, or use the shortcut :kbd:`Ctrl+Q`.

.. _`label_commandline`:

Command Line Options
====================

.. index::
   single:command line options

|nix| QGIS supports a number of options when started from the command line. To
get a list of the options, enter ``qgis --help`` on the command line.
The usage statement for QGIS is:

::

        qgis --help
        QGIS - 2.0.1-Dufour 'Dufour' (exported)
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
            [--optionspath path]            use the given QSettings path
            [--configpath path]             use the given path for all user configuration
            [--code path]   		run the given python file on load
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

        You can start QGIS by specifying one or more data files
        on the command line. For example, assuming you are in the
        qgis_sample_data directory, you could start QGIS with a vector layer
        and a raster file set to load on startup using the following command:
        ``qgis ./raster/landcover.img ./gml/lakes.gml``

**Command line option** ``--snapshot``


This option allows you to create a snapshot in PNG format from the current view.
This comes in handy when you have a lot of projects and want to
generate snapshots from your data.

Currently it generates a PNG-file with 800x600 pixels. This can be adapted
using the ``--width`` and ``--height`` command line
arguments. A filename can be added after ``--snapshot``.

**Command line option** ``--lang``


Based on your locale QGIS, selects the correct localization. If you would like
to change your language, you can specify a language code. For example:
``--lang=it``
starts QGIS in italian localization. A list of currently supported
languages with language code and status is provided at
http://hub.qgis.org/wiki/quantum-gis/GUI_Translation_Progress

**Command line option** ``--project``


Starting QGIS with an existing project file is also possible. Just
add the command line option ``--project`` followed by your project
name and QGIS will open with all layers loaded described in the given file.

**Command line option** ``--extent``


To start with a specific map extent use this option. You need to add the
bounding box of your extent in the following order separated by a comma::

    --extent xmin,ymin,xmax,ymax

**Command line option** ``--nologo``


This command line argument hides the splash screen when you start QGIS.

**Command line option** ``--noplugins``


If you have trouble at startup with plugins, you can avoid loading them at startup.
They will still be available in Plugins Manager after-wards.

**Command line option** ``--nocustomization``


Using this command line argument existing GUI customization will not be applied
at startup.

**Command line option** ``--optionspath``

You can have multiple configurations and decide which one to use when starting
QGIS using this option. See :ref:`gui_options` to check where does the
operating system save the settings files. Presently there is no way to specify
in which file where to write the settings, therefore you can create a copy of
the original settings file and rename it.

**Command line option** ``--configpath``


This option is similar to the one above, but furthermore overrides the default
path (~/.qgis) for user configuration and forces QSettings to use this directory,
too. This allows users to e.g. carry QGIS installation on a flash drive together
with all plugins and settings.

.. _sec_projects:

Projects
=========

The state of your QGIS session is considered a Project.  QGIS
works on one project at a time.  Settings are either considered
as being per-project, or as a default for new projects (see
Section :ref:`gui_options`). QGIS can save the state of your
workspace into a project file using the menu options
:menuselection:`Project -->` |mActionFileSave| :menuselection:`Save`
or :menuselection:`Project -->` |mActionFileSaveAs| :menuselection:`Save As`.

Load saved projects into a QGIS session using
:menuselection:`Project -->` |mActionFileOpen| :menuselection:`Open ...`, :menuselection:`Project --> New from template` or 
:menuselection:`Project --> Open Recent`.

If you wish to clear your session and start fresh, choose
:menuselection:`Project -->` |mActionFileNew| :menuselection:`New`.
Either of these menu options will prompt you to save the existing project
if changes have been made since it was opened or last saved.

The kinds of information saved in a project file include:

* Layers added
* Layer properties, including symbolization
* Projection for the map view
* Last viewed extent

The project file is saved in XML format, so it is possible to edit
the file outside QGIS if you know what you are doing. The file format
was updated several times compared to earlier QGIS versions. Project files
from older QGIS versions may not work properly anymore. To be made aware of this,
in the :guilabel:`General` tab under :menuselection:`Settings --> Options`
you can select:

|checkbox| :guilabel:`Prompt to save project and data source changes when required`

|checkbox| :guilabel:`Warn when opening a project file saved with an older
version of QGIS`

.. _`sec_output`:

Output
=======

.. index::
   single:output save as image
.. index::
   single:print composer quick print

There are several ways to generate output from your QGIS session. We have
discussed one already in Section :ref:`sec_projects` saving as a project file.
Here is a sampling of other ways to produce output files:

* Menu option :menuselection:`Project -->` |mActionSaveMapAsImage| :sup:`Save as Image`
  opens a file dialog where you select the name, path and type of image (PNG or
  JPG format). A world file with extension PNGW or JPGW saved in the same folder
  georeferences the image.
* Menu option :menuselection:`Project -->` |mActionNewComposer| :menuselection:`New
  Print Composer` opens a dialog where you can layout and print the current map
  canvas (see Section :ref:`label_printcomposer`).
