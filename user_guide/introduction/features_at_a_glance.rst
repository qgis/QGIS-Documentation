..`feature_glance`:

=====================
Features at a Glance
=====================


.. when the revision of a section has been finalized,
.. comment out the following line:
.. \updatedisclaimer

After a first and simple sample session in Section :ref:`label.getstarted` we now
want to give you a more detailed overview of the features of QGIS.
Most features presented in the following chapters will be explained and described in
their own sections later in the manual.

.. _`label_startingqgis`:

Starting and Stopping QGIS
===========================

In Section :ref:`samplesession` you already learned how to start QGIS. We will
repeat this here and you will see that QGIS also provides further command line options.

* |nix| Assuming that QGIS is installed in the PATH, you can start QGIS
  by typing: ``qgis``  at a command prompt or by double clicking on the QGIS
  application link (or shortcut) on the desktop or in the application menu.
* |win| Start QGIS using the Start menu or desktop shortcut,
  or double click on a QGIS project file.
* |osx| Double click the icon in your Applications folder. If you need to start QGIS
  in a shell, run /path-to-installation-executable/Contents/MacOS/Qgis.


To stop QGIS, click the menu options |nix| |win| :menuselection:`File` |osx| :menuselection:`QGIS --> Quit`,
or use the shortcut :kbd:`Ctrl+Q`.

.. _`label_commandline`:

Command Line Options
********************
:index:`command line options`

|nix| QGIS supports a number of options when started from the command line. To
get a list of the options, enter ``qgis ---help`` on the command line.
The usage statement for QGIS is:

::

	qgis --help
	Quantum GIS - 1.7.0-Wroclaw 'Wroclaw' (exported)
	Quantum GIS (QGIS) is a viewer for spatial data sets, including
	raster and vector data.
	Usage: qgis [options] [FILES]
	  options:
	        [--snapshot filename]           emit snapshot of loaded datasets to given file
	        [--width width]                 width of snapshot to emit
	        [--height height]               height of snapshot to emit
	        [--lang language]               use language for interface text
	        [--project projectfile]         load the given QGIS project
	        [--extent xmin,ymin,xmax,ymax]  set initial map extent
	        [--nologo]                      hide splash screen
	        [--noplugins]                   don't restore plugins on startup
	        [--optionspath path]            use the given QSettings path
	        [--configpath path]             use the given path for all user configuration
	        [--help]                        this text

	  FILES:
	    Files specified on the command line can include rasters,
	    vectors, and QGIS project files (.qgs):
	     1. Rasters - Supported formats include GeoTiff, DEM
	        and others supported by GDAL
	     2. Vectors - Supported formats include ESRI Shapefiles
	        and others supported by OGR and PostgreSQL layers using
	        the PostGIS extension

.. note::
	**Example Using command line arguments**
	You can start QGIS by specifying one or more data files
	on the command line. For example, assuming you are in the
	qgis_sample_data directory, you could start QGIS with a vector layer
	and a raster file set to load on startup using the following command:
	``qgis ./raster/landcover.img ./gml/lakes.gml``

Command line option ``---snapshot``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This option allows you to create a snapshot in PNG format from the current view.
This comes in handy when you have a lot of projects and want to
generate snapshots from your data.

Currently it generates a PNG-file with 800x600 pixels. This can be adapted
using the ``---width`` and ``---height`` command line
arguments. A filename can be added after ``---snapshot``.

Command line option ``---lang``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Based on your locale QGIS, selects the correct localization. If you would like
to change your language, you can specify a language code. For example:
``---lang=it``
starts QGIS in italian localization. A list of currently supported
languages with language code and status is provided at
http://www.qgis.org/wiki/GUI_Translation_Progress

Command line option ``---project``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Starting QGIS with an existing project file is also possible. Just
add the command line option ``---project`` followed by your project
name and QGIS will open with all layers loaded described in the given file.

Command line option ``---extent``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To start with a specific map extent use this option. You need to add the bounding box of your extent in the following order separated by a comma::
	
	--extent xmin,ymin,xmax,ymax

Command line option ``---nologo``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This command line argument hides the splash screen when you start QGIS.

Command line option ``---noplugins``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you have trouble at startup with plugins, you can avoid loading them at startup. They will still be available in Plugins Manager afterwards.

Command line option ``---optionspath``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You can have multiple configurations and decide which one to use when starting 
QGIS using this option. See :ref:`subsec_gui_options` to check where does the 
operating system save the settings files. Presently there is no way to specify 
in which file where to write the settings, therefore you can create a copy of 
the original settings file and rename it.

Command line option ``---configpath``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This option is similar to the one above, but furthermore overrides the default 
path (~/.qgis) for user configuration and forces QSettings to use this directory, 
too. This allows users to e.g. carry QGIS installation on a flash drive together 
with all plugins and settings
 
.. `label_qgismainwindow`:

QGIS GUI
========

.. :index:`main window`

When QGIS starts, you are presented with the GUI as shown below
(the numbers 1 through 6 in yellow ovals refer to the six major areas of the
interface as discussed below):

.. `fig_startup`:

.. figure:: img/en/startup.png
   :align: center

   QGIS GUI with Alaska sample data (KDE)

.. note:: 
   **Note:** Your window decorations (title bar, etc.) may appear
   different depending on your operating system and window manager.

The QGIS GUI is divided into six areas:

+--------------+-----------------+
|1. Menu Bar   | 4. Map View     |
+--------------+-----------------+
|2. Tool Bar   | 5. Map Overview |
+--------------+-----------------+
|3. Map Legend | 6. Status Bar   |
+--------------+-----------------+

These six components of the QGIS interface are described in more detail in
the following sections. Two more sections present keyboard shortcuts and
context help.

.. `label_menubar`:

Menu Bar
*********

.. index::`menus`

The menu bar provides access to various QGIS features using a standard
hierarchical menu. The top-level menus and a summary of some of the
menu options are listed below, together with the icons of the corresponding
tools as they appear on the toolbar, as well as keyboard
shortcuts. [1]_
Although most menu options have a corresponding tool and vice-versa,
the menus are not organized quite like the toolbars.
The toolbar containing the tool is listed after each menu option as a checkbox
entry. For more information about tools and toolbars, see Section
:ref:`label_toolbars`.


+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| Menu Option                                                          | Shortcut            | Reference                              | Toolbar                         |
+======================================================================+=====================+========================================+=================================+
| |mActionFileNew| :guilabel:`File`                                                                                                                                     | 
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| :guilabel:`New Project`                                              | :kbd:`Ctrl+N`       | see Section :ref:`sec_projects`        | :guilabel:`File`                |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionFileOpen| :guilabel:`Open Project`                           | :kbd:`Ctrl+O`       | see Section :ref:`sec_projects`        | :guilabel:`File`                |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| :guilabel:`Open Recent Projects`                                     |                     | see Section :ref:`sec_projects`        |                                 |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionFileSave| :guilabel:`Save Project`                           | :kbd:`Ctrl+S`       | see Section :ref:`sec_projects`        | :guilabel:`File`                |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionFileSaveAs| :guilabel:`Save Project As`                      | :kbd:`Ctrl+Shift+S` | see Section :ref:`sec_projects`        | :guilabel:`File`                |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionSaveMapAsImage| :guilabel:`Save as Image`                    |                     | see Section :ref:`sec_output`          |                                 |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionNewComposer| :guilabel:`New Print Composer`                  | :kbd:`Ctrl+P`       | see Section :ref:`label_printcomposer` | :guilabel:`File`                |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionComposerManager| :guilabel:`Composer manager`                |                     | see Section :ref:`label_printcomposer` | :guilabel:`File`                |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| :guilabel:`Print Composers`                                          |                     | see Section :ref:`label_printcomposer` |                                 |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionFileExit| :guilabel:`Exit`                                   | :kbd:`Ctrl+Q`       |                                        |                                 |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| :guilabel:`Edit`                                                                                                                                                      |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionUndo| :guilabel:`Undo`                                       | :kbd:`Ctrl+Z`       | see Section :ref:`sec_advanced_edit`   | :guilabel:`Advanced Digitizing` |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionRedo| :guilabel:`Redo`                                       | :kbd:`Ctrl+Shift+Z` | see Section :ref:`sec_advanced_edit`   | :guilabel:`Advanced Digitizing` |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionEditCut| :guilabel:`Cut Features`                            | :kbd:`Ctrl+X`       | see Sec :ref:`sec_edit_existing_layer` | :guilabel:`Digitizing`          |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionEditCopy| :guilabel:`Copy Features`                          | :kbd:`Ctrl+C`       | see Sec :ref:`sec_edit_existing_layer` | :guilabel:`Digitizing`          |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionEditPaste| :guilabel:`Paste Features`                        | :kbd:`Ctrl+V`       | see Sec :ref:`sec_edit_existing_layer` | :guilabel:`Digitizing`          |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionEditPaste| :guilabel:`Move Feature`                          |                     | see Sec :ref:`sec_edit_existing_layer` | :guilabel:`Digitizing`          |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionDeleteSelected| :guolabel:`Delete Selected`                  |                     | see Sec :ref:`sec_edit_existing_layer` | :guilabel:`Digitizing`          |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionSimplify| :guilabel:`Simplify Feature`                       |                     | see Section :ref:`sec_advanced_edit`   | :guilabel:`Advanced Digitizing` |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionAddRing| :guilabel:`Add Ring`                                |                     | see Section :ref:`sec_advanced_edit`   | :guilabel:`Advanced Digitizing` |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionAddIsland| :guilabel:`Add Part`                              |                     | see Section :ref:`sec_advanced_edit`   | :guilabel:`Advanced Digitizing` |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionDeleteRing| :guilabel:`Delete Ring`                          |                     | see Section :ref:`sec_advanced_edit`   | :guilabel:`Advanced Digitizing` |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionDeletePart| :guilabel:`Delete Part`                          |                     | see Section :ref:`sec_advanced_edit`   | :guilabel:`Advanced Digitizing` |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionReshape| :guilabel:`Reshape Features`                        |                     | see Section :ref:`sec_advanced_edit`   | :guilabel:`Advanced Digitizing` |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionSplitFeatures| :guilabel:`Split Features`                    |                     | see Section :ref:`sec_advanced_edit`   | :guilabel:`Advanced Digitizing` |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionMergeFeat| :guilabel:`Merge selected Features`               |                     | see Section :ref:`sec_advanced_edit`   | :guilabel:`Advanced Digitizing` |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionMergeFeat| :guilabel:`Merge attributes of selected Features` |                     | see Section :ref:`sec_advanced_edit`   | :guilabel:`Advanced Digitizing` |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionNodeTool| :guilabel:`Node Tool`                              |                     | see Sec :ref:`sec_edit_existing_layer` | :guilabel:`Digitizing`          |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionRotatePointSymbols| :guilabel:`Rotate Point Symbols`         |                     | see Section :ref:`sec_advanced_edit`   | :guilabel:`Advanced Digitizing` |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+

After activating |mActionToggleEditing| :menuselection:`Toggle editing` mode 
for a layer, you will find a capture feature icon in the :menuselection:`Edit`
menu depending on the layer type (point, line or polygon).

+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| Menu Option                                                          | Shortcut            | Reference                              | Toolbar                         |
+======================================================================+=====================+========================================+=================================+
| |mActionCapturePoint| :guilabel:`Capture Point`                      |                     | see Sec :ref:`sec_edit_existing_layer` | :guilabel:`Digitizing`          |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionCaptureLine| :guilabel:`Capture Line`                        |                     | see Sec :ref:`sec_edit_existing_layer` | :guilabel:`Digitizing`          |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionCapturePolygon| :guilabel:`Capture Polygon`                  |                     | see Sec :ref:`sec_edit_existing_layer` | :guilabel:`Digitizing`          |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+


+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| Menu Option                                                          | Shortcut            | Reference                              | Toolbar                         |
+======================================================================+=====================+========================================+=================================+
| :guilabel:`View`                                                                                                                                                      |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionPan| :guilabel:`Pan Map`                                     |                     |                                        | :guilabel:`Map Navigation`      |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionZoomIn| :guilabel:`Zoom In`                                  | :kbd:`Ctrl++`       |                                        | :guilabel:`Map Navigation`      |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionZoomOut| :guilabel:`Zoom Out`                                | :kbd:`Ctrl+-`       |                                        | :guilabel:`Map Navigation`      |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| :guilabel:`Select`                                                   |                     | see Section :ref:`sec_selection`       | :guilabel:`Attributes`          |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionIdentify| :guilabel:`Identify Features`                      | :kbd:`Ctrl+Shift+I` |                                        | :guilabel:`Attributes`          |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| :guilabel:`Measure`                                                  |                     | see Section :ref:`sec_measure`         | :guilabel:`Attributes`          |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionZoomFullExtent| :guilabel:`Zoom Full`                        | :kbd:`Ctrl+Shift+F` |                                        | :guilabelb:`Map Navigation`     |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionZoomToLayer| :guilabel:`Zoom To Layer`                       |                     |                                        | :guilabel:`Map Navigation`      |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionZoomToSelected| :guilabel:`Zoom To Selection`                | :kbd:`Ctrl+J`       |                                        | :guilabel:`Map Navigation`      |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionZoomLast| :guilabel:`Zoom Last`                              |                     |                                        | :guilabel:`Map Navigation`      |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionZoomNext| :guilabel:`Zoom Next`                              |                     |                                        | :guilabel:`Map Navigation`      |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| :guilabel:`Zoom Actual Size`                                         |                     |                                        |                                 |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionMapTips| :guilabel:`Map Tips`                                |                     |                                        | :guilabel:`Attributes`          |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionNewBookmark| :guilabel:`New Bookmark`                        | :kbd:`Ctrl+B`       | see Section :ref:`sec_bookmarks`       | :guilabel:`Attributes`          |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionShowBookmarks| :guilabel:`Show Bookmarks`                    | :kbd:`Ctrl+Shift+B` | see Section :ref:`sec_bookmarks`       | :guilabel:`Attributes`          |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| |mActionDraw| :guilabel:`Refresh`                                    | :kbd:`Ctrl+R`       |                                        | :guilabel:`Map Navigation`      |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| :guilabel:`Tile scale slider`                                        |                     | see Section :ref:`sec_tilesets`        | :guilabel:`Tile scale`          |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+
| :guilabel:`Live GPS tracking`                                        |                     | see Section :ref:`sec_gpstracking`     | :guilabel:`GPS Information`     |
+----------------------------------------------------------------------+---------------------+----------------------------------------+---------------------------------+


+---------------------------------------------------------------------+----------------------+----------------------------------------+---------------------------------+
| Menu Option                                                         | Shortcut             | Reference                              | Toolbar                         |
+=====================================================================+======================+========================================+=================================+
|  :guilabel:`Layer`                                                                                                                                                    |
+---------------------------------------------------------------------+----------------------+----------------------------------------+---------------------------------+
| :guilabel:`New`                                                     |                      | see Section :ref:`sec_create shape`    | :guilabel:`Manage Layers`       |
+---------------------------------------------------------------------+----------------------+----------------------------------------+---------------------------------+
| |mActionAddNonDbLayer| :guilabel:`Add Vector Layer`                 | :kbd:`Ctrl+Shift+V`  | see Section :ref:`label_workingvector` | :guilabel:`Manage Layers`       |
+---------------------------------------------------------------------+----------------------+----------------------------------------+---------------------------------+
| |mActionAddRasterLayer| :guilabel:`Add Raster Layer`                | :kbd:`Ctrl+Shift+R`  | see Section :ref:`label_raster`        | :guilabel:`Manage Layers`       |
+---------------------------------------------------------------------+----------------------+----------------------------------------+---------------------------------+
| |mActionAddLayer| :guilabel:`Add PostGIS Layer`                     | :kbd:`Ctrl+Shift+D`  | see Section :ref:`label_postgis`       | :guilabel:`Manage Layers`       |
+---------------------------------------------------------------------+----------------------+----------------------------------------+---------------------------------+
| |mActionAddSpatiaLiteLayer| :guilabel:`Add SpatiaLite Layer`        | :kbd:`Ctrl+Shift+L`  | see Section :ref:`label_spatialite`    | :guilabel:`Manage Layers`       |
+---------------------------------------------------------------------+----------------------+----------------------------------------+---------------------------------+
| |mActionAddWmsLayer| :guilabel:`Add WMS Layer`                      | :kbd:`Ctrl+Shift+W`  | see Section :ref:`sec_ogc-wms`         | :guilabel:`Manage Layers`       |
+---------------------------------------------------------------------+----------------------+----------------------------------------+---------------------------------+
| |mActionOpenTable| :guilabel:`Open Attribute Table`                 |                      |                                        | :guilabel:`Attributes`          |
+---------------------------------------------------------------------+----------------------+----------------------------------------+---------------------------------+
| |mActionFileSave| :guilabel:`Save edits`                            |                      |                                        | :guilabel:`Digitizing`          |
+---------------------------------------------------------------------+----------------------+----------------------------------------+---------------------------------+
| |mActionToggleEditing| :guilabel:`Toggle editing`                   |                      |                                        | :guilabel:`Digitizing`          |
+---------------------------------------------------------------------+----------------------+----------------------------------------+---------------------------------+
| :guilabel:`Save as...`                                                                                                                                                |
+---------------------------------------------------------------------+----------------------+----------------------------------------+---------------------------------+
| :guilabel:`Save selection as vector file...`                        |                      | See :ref:`sec_attribute table`         |                                 |
+---------------------------------------------------------------------+----------------------+----------------------------------------+---------------------------------+
| |mActionRemoveLayer| :guilabel:`Remove Layer`                       | :kbd:`Ctrl+D`        |                                        |                                 |
+---------------------------------------------------------------------+----------------------+----------------------------------------+---------------------------------+
| :guilabel:`Set CRS of Layer(s)`                                     | :kbd:`Ctrl+Shift+C`  |                                        |                                 |
+---------------------------------------------------------------------+----------------------+----------------------------------------+---------------------------------+
| :guilabel:`Set project CRS from Layer`                              |                                                                                                 |
+---------------------------------------------------------------------+----------------------+----------------------------------------+---------------------------------+
| :guilabel:`Properties`                                              |                                                                                                 |
+---------------------------------------------------------------------+----------------------+----------------------------------------+---------------------------------+
| :guilabel:`Query...`                                                                                                                                                  |
+---------------------------------------------------------------------+----------------------+----------------------------------------+---------------------------------+
| |labeling| :guilabel:`Labeling`                                     |                      |                                        |                                 |
+---------------------------------------------------------------------+----------------------+----------------------------------------+---------------------------------+
| |mActionInOverview| :guilabel:`Add to Overview`                     | :kbd:`Ctrl+Shift+O`  |                                        | :guilabel:`Manage Layers`       |
+---------------------------------------------------------------------+----------------------+----------------------------------------+---------------------------------+
| |mActionAddAllToOverview| :guilabel:`Add All To Overview`           |                      |                                        |                                 |
+---------------------------------------------------------------------+----------------------+----------------------------------------+---------------------------------+
| |mActionRemoveAllFromOverview| :guilabel:`Remove All From Overview` |                      |                                        |                                 |
+---------------------------------------------------------------------+----------------------+----------------------------------------+---------------------------------+
| |mActionShowAllLayers| :guilabel:`Show All Layers`                  | :kbd:`Ctrl+Shift+U`  |                                        | :guilabel:`Manage Layers`       |
+---------------------------------------------------------------------+----------------------+----------------------------------------+---------------------------------+
| |mActionHideAllLayers| :guilabel:`Hide All Layers`                  | :kbd:`Ctrl+Shift+H`  |                                        | :guilabel:`Manage Layers`       |
+---------------------------------------------------------------------+----------------------+----------------------------------------+---------------------------------+


+-------------------------------------------------------------------+----------------------+------------------------------------------+---------------------------------+
| Menu Option                                                       | Shortcut             | Reference                                | Toolbar                         |
+===================================================================+======================+==========================================+=================================+
| :guilabel:`Settings`                                                                                                                                                  |
+-------------------------------------------------------------------+----------------------+------------------------------------------+---------------------------------+
| :guilabel:`Panels`                                                |                      |                                          |                                 |
+-------------------------------------------------------------------+----------------------+------------------------------------------+---------------------------------+
| :guilabel:`Toolbars`                                              |                      |                                          |                                 |
+-------------------------------------------------------------------+----------------------+------------------------------------------+---------------------------------+
| :guilabel:`Toggle Full Screen Mode`                               | :kbd:`Ctrl-F`        |                                          |                                 |
+-------------------------------------------------------------------+----------------------+------------------------------------------+---------------------------------+
| |mActionProjectProperties| :guilabel:`Project Properties`         | :kbd:`Ctrl+Shift+P`  | see Section :ref:`sec_projects`          |                                 |
+-------------------------------------------------------------------+----------------------+------------------------------------------+---------------------------------+
| |mActionCustomProjection| :guilabel:`Custom CRS`                  |                      | see Section :ref:`sec_customprojections` | :guilabel:`Style Manager`       |
+-------------------------------------------------------------------+----------------------+------------------------------------------+---------------------------------+
| |mActionOptions| :guilabel:`Configure shortcuts`                  |                      |                                          |                                 |
+-------------------------------------------------------------------+----------------------+------------------------------------------+---------------------------------+
| |mActionOptions| :guilabel:`Options`                              |                      | see Section :ref:`subsec_gui_options`    |                                 |
+-------------------------------------------------------------------+----------------------+------------------------------------------+---------------------------------+
| :guilabel:`Snapping Options`                                      |                      |                                          |                                 |
+-------------------------------------------------------------------+----------------------+------------------------------------------+---------------------------------+

+-------------------------------------------------------------------+----------------------+------------------------------------------+---------------------------------+
| Menu Option                                                       | Shortcut             | Reference                                | Toolbar                         |
+===================================================================+======================+==========================================+=================================+
| :guilabel:`Plugins` - (Futher menu items are added by plugins as they are loaded.)                                                                                    |
+-------------------------------------------------------------------+----------------------+------------------------------------------+---------------------------------+
| |mActionShowPluginManager| :guilabel:`Manage Plugins`             |                      | see Section :ref:sec_managing_plugins`   | :guilabel:`Plugins`             |
+-------------------------------------------------------------------+----------------------+------------------------------------------+---------------------------------+
| :guilabel:`Python Console`                                        |                      |                                          |                                 |
+-------------------------------------------------------------------+----------------------+------------------------------------------+---------------------------------+

*  \mainmenuopt{Raster}
\begin{tabbing}
\hspace{5cm}\=\hspace{3cm}\=\hspace{3.5cm}\= \kill
\mainmenuopt{Raster calculator}
        \>
        \> see Section \ref{sec:raster_calc}
        \>  \\
\end{tabbing}

*  \mainmenuopt{Help}
\begin{tabbing}
\hspace{5cm}\=\hspace{3cm}\=\hspace{3.5cm}\= \kill
\dropmenuopttwo{mActionHelpContents}{Help Contents}
	\> \keystroke{F1}
	\>
	\> \dropmenucheck{Help}\\
\mainmenuopt{API Documentation}
        \>
        \> 
        \>  \\
\dropmenuopttwo{mActionQgisHomePage}{QGIS Home Page}
	\> \keystroke{Ctrl+H}
	\>
	\\
\dropmenuopttwo{mActionCheckQgisVersion}{Check QGIS Version}
	\\
\dropmenuopttwo{mActionHelpAbout}{About}
	\\
\dropmenuopttwo{mActionHelpSponsors}{QGIS Sponsors}
	\\
\end{tabbing}




.. note::
	**Note:** |nix| The Menu Bar items listed above are the default ones in KDE window
	manager. In GNOME, Settings menu is missing and its items are to be found
	there:

+-----------------------------------------------------------+------------------------+
| |mActionProjectProperties| :guilabel:`Project Properties` | :guilabel:`File menu`  |
+-----------------------------------------------------------+------------------------+
| |mActionOptions| :guilabel:`Options`                      | :guilabel:`Edit`       |
+-----------------------------------------------------------+------------------------+
| |mActionOptions| :guilabel:`Configure Shortcuts`          | :guilabel:`Edit`       |
+-----------------------------------------------------------+------------------------+
| :guilabel:`Style Manager`                                 | :guilabel:`Edit`       |
+-----------------------------------------------------------+------------------------+
| |mActionCustomProjection| :guilabel:`Custom CRS`          | :guilabel:`Edit`       |
+-----------------------------------------------------------+------------------------+
| :guilabel:`Panels`                                        | :guilabel:`View`       |
+-----------------------------------------------------------+------------------------+
| :guilabel:`Toolbars`                                      | :guilabel:`View`       |
+-----------------------------------------------------------+------------------------+
| :guilabel:`Toggle Full Screen Mode`                       | :guilabel:`View`       |
+-----------------------------------------------------------+------------------------+
| :guilabel:`Tile scale slider`                             | :guilabel:`View`       |
+-----------------------------------------------------------+------------------------+
| :guilabel:`Live GPS tracking`	                            | :guilabel:`View`       |
+-----------------------------------------------------------+------------------------+


.. See Appendix :ref:`app_menu` for complete descriptions of the menu items.

.. _`label_toolbars`:

Toolbars
*********

.. index::`toolbars`

The toolbars provide access to most of the same functions as the menus,
plus additional tools for interacting with the map. Each toolbar item has
popup help available. Hold your mouse over the item and a short description of
the tool's purpose will be displayed.

Every menubar can be moved around according to your needs. Additionally every
menubar can be switched off using your right mouse button context menu holding
the mouse over the toolbars.

.. index::`layout!toolbars`

.. note::
	**Restoring toolbars** 
	If you have accidentally hidden all your toolbars, you can get them
	back by choosing menu option :menuselection:`Settings --> Toolbars`.

.. _`label_legend`:

Map Legend
**********

.. index::`legend`

The map legend area lists all the layers in the project.
The checkbox in each legend entry can be used to show or hide the layer 
.. index::`layer!visibility`
A layer can be selected and dragged up or down in the legend to change the
z-ordering. Z-ordering means that layers listed nearer the top of the legend are
drawn over layers listed lower down in the legend.

Layers in the legend window can be organised into groups. To do so, right click
in the legend window and choose :guilabel:`Add group`. Type in a name for the
group and press :kbd:`Enter`. Now click on an existing layer and drag it
onto the group. Also, if new layers are added to the project while a group is
selected, they will automatically be placed in the group.

To bring a layer out of a group you can drag it out, or right click on it and 
choose :guilabel:`Make to toplevel item`.
Groups can be nested inside other groups.

The checkbox for a group will show or hide all the layers in the group
with one click.

The content of the right mouse button context menu depends on whether the selected legend item
is a raster or a vector layer. For GRASS vector layers :guilabel:`toggle editing` is not
available. See section :ref:`grass_digitising` for information on editing GRASS vector layers.

* **Right mouse button menu for raster layers**

  *  :menuselection:`Zoom to layer extent`
  *  :menuselection:`Zoom to best scale (100 %)`
  *  :menuselection:`Show in overview`
  *  :menuselection:`Remove}`
  *  :menuselection:`Properties`
  *  :menuselection:`Rename`
  *  :menuselection:`Add Group`
  *  :menuselection:`Expand all`
  *  :menuselection:`Collapse all`

.. *  :menuselection:`Show file groups`

* **Right mouse button menu for vector layers**

  *  :menuselection:`Zoom to layer extent`
  *  :menuselection:`Show in overview`
  *  :menuselection:`Remove`
  *  :menuselection:`Open attribute table`
  *  :menuselection:`Toggle editing (not available for GRASS layers)`
  *  :menuselection:`Save as`
  *  :menuselection:`Save selection as`
  *  :menuselection:`Query`
  *  :menuselection:`Properties`
  *  :menuselection:`Rename`
  *  :menuselection:`Add Group`
  *  :menuselection:`Expand all`
  *  :menuselection:`Collapse all`

.. * :menuselection:`Make to toplevel item`
.. * :menuselection:`Show file groups`

* **Right mouse button menu for layer groups**

  *  :menuselection:`Zoom to group`
  *  :menuselection:`Remove`
  *  :menuselection:`Set group CRS`
  *  :menuselection:`Rename`
  *  :menuselection:`Add Group`
  *  :menuselection:`Expand all`
  *  :menuselection:`Collapse all`

.. *  :menuselection:`Show file groups`


It is possible to select more than one Layer or Group at the same time 
by holding down the :kbd:`Ctrl`-Key while selecting the Layers with the 
left mouse button. You can than move all selected Layers to a new Group at 
the same time.

You are also able to delete more than one Layer or Group at once by selecting 
several Layers with the :kbd:`Ctrl`-Key and pressing :kbd:`Ctrl D` afterwards.
This way all selected Layers or Groups will be removed from the Layerlist.

.. isn't included in Titan anymore, except for an "toggle overview"
.. %Each legend entry can show the following mini icons:
..%
..%\includegraphics[width=0.7cm]{pyramid} This is a raster
..%that has pyramids built for it to improve rendering efficiency (see
..%Section \ref{raster_pyramids}).\\
..%\includegraphics[width=0.7cm]{no_pyramid} This is a
..%raster that has no pyramid layers (see Section \ref{raster_pyramids}).\\
..%\includegraphics[width=0.7cm]{inoverview} This layer is
..%shown in the overview map area as well as in the main map window.\\
..%\includegraphics[width=0.7cm]{editable} This is a vector
..%layer that is currently enabled for editing.\\

.. _`label_mapview`:

Map View
*********

.. index::`map!view`

This is the 'business end' of QGIS - maps are displayed in this area! The
map displayed in this window will depend on the vector and raster layers you
have chosen to load (see sections that follow for more information on how to
load layers). The map view can be panned (shifting the focus of the map display
to another region) and zoomed in and out. Various other operations can be
performed on the map as described in the toolbar description above.  The map
view and the legend are tightly bound to each other - the maps in view reflect
changes you make in the legend area.

.. note::
	**Zooming the Map with the Mouse Wheel**

    .. index::`zoom!mouse wheel`
    You can use the mouse wheel to zoom in and out on the map. Place
    the mouse cursor inside the map area and roll the wheel forward (away from you) to
    zoom in and backwards (towards you) to zoom out. The mouse cursor position is the
    center where the zoom occurs. You can customize the behavior of the mouse
    wheel zoom using the |tab| :menuselection:`Map tools` tab under the :menuselection:`Settings --> Options` menu.

.. note::
	**Panning the Map with the Arrow Keys and Space Bar**

    .. index::`pan!arrow keys`
    You can use the arrow keys to pan in the map. Place the mouse cursor
    inside the map area and click on the right arrow key to pan East, left arrow
    key to pan West, up arrow key to pan North and down arrow key to pan South.
    You can also pan the map using the space bar: just move the mouse while
    holding down space bar.

.. _`label_mapoverview`:

Map Overview 
*************

.. index::`map!overview`

The map overview panel provides a full extent view of layers added to it. It
can be selected under the menu :menuselection:`Settings --> Panels`.
Within the view is a rectangle showing the current map extent. This allows
you to quickly determine which area of the map you are currently viewing. Note
that labels are not rendered to the map overview even if the layers in the
map overview have been set up for labeling.

You can add a single layer to the overview by right-clicking on it in the
legend and select |checkbox| Show in overview. You can also add layers to,
or remove all layers from the overview using the Overview tools on the toolbar.

If you click and drag the red rectangle in the overview that shows your
current extent, the main map view will update accordingly.

.. _`label_statusbar`:

Status Bar
***********

The status bar shows you your current position in map coordinates (e.g.
meters or decimal degrees) as the mouse pointer is moved across the map view.
To the left of the coordinate display in the status bar is a small button that
will toggle between showing coordinate position or the view extents of the
map view as you pan and zoom in and out.

A progress bar in the status bar shows progress of rendering
as each layer is drawn to the map view. In some cases, such as the gathering
of statistics in raster layers, the progress bar will be used to show the
status of lengthy operations.

If a new plugin or a plugin update is available, you will see a message in the
status bar. On the right side of the status bar is a small
checkbox which can be used to temporarily prevent layers being rendered to the
map view (see Section :ref:`redraw_events` below). The icon |mIconStopRendering| immediately stops the 
current map rendering process. 

At the far right of the status bar you find the EPSG code of the current 
project CRS and a projector icon. Clicking on this opens the projection properties 
for the current project.

.. note::
	**Calculating the correct Scale of your Map Canvas**

    .. index::`scale!calculate`
    When you start QGIS, degrees is the default unit, and it tells QGIS
    that any coordinate in your layer is in degrees. To get correct scale values,
    you can either change this to meter manually in the |tab| General tab under
    :menuselection:`Settings` --> :menuselection:`Project Properties` or you can select a project
    Coordinate Reference System (CRS) clicking on the
    |mIconProjectionDisabled| `CRS status`
    icon in the lower right-hand corner of the statusbar. In the last case, the
    units are set to what the project projection specifies, e.g. '+units=m'.

.. _`shorcuts`:

Keyboard shortcuts
*******************

.. index::`Keyboard shortcuts`

QGIS provides default keyboard shortcuts for many features. You find them in
Section :ref:`label_menubar` below. Additionally the menu option :menuselection:`Settings` -->
:menuselection:`Configure Shortcuts` allows to change the default keyboard
shortcuts and to add new keyboard shortcuts to QGIS features.

\begin{figure}[ht]
   \centering
   \includegraphics[clip=true, width=8cm]{shortcuts}
   \caption{Define shortcut options \nixcaption (KDE)} \label{fig:shortcuts}
\end{figure}

Configuration is very simple. Just select a feature from the list and click
on :guilabel:`Change`, :guilabel:`Set none` or :guilabel:`Set default`. Once you have
found your configuration, you can save it as XML file and load it to another
QGIS installation.

.. _`context_help`:

Context help
*************

.. index::`Context help`

When you need help on a specific topic, you can access context help via the :guilabel:`Help`
button available in most dialogs - please note that third-party plugins can point to
dedicated web pages.

.. _`subsect:redraw_events`:

Rendering
===========
.. index::`rendering`

By default, QGIS renders all visible layers whenever the map canvas must be
refreshed. The events that trigger a refresh of the map canvas include:

*  Adding a layer
*  Panning or zooming
*  Resizing the QGIS window
*  Changing the visibility of a layer or layers

QGIS allows you to control the rendering process in a number of ways.

.. `label_scaledepend`:

Scale Dependent Rendering
*************************
.. index::`rendering!scale dependent`

Scale dependent rendering allows you to specify the minimum and maximum
scales at which a layer will be visible.  To set scale dependency rendering,
open the :guilabel:`Properties` dialog by double-clicking on the layer in the
legend. On the |tab|`General` tab, set the minimum and maximum scale values and then
click on the :guilabel`Use scale dependent rendering` checkbox.

You can determine the scale values by first zooming to the level you want
to use and noting the scale value in the QGIS status bar.

.. index::`scale`

.. _`label_controlmap`:

Controlling Map Rendering 
***************************

Map rendering can be controlled in the following ways:

.. _`label_suspendrender`:

a) Suspending Rendering
~~~~~~~~~~~~~~~~~~~~~~~
.. index::`rendering!suspending`

To suspend rendering, click the |checkbox| Render checkbox in the lower right
corner of the statusbar. When the |checkbox| Render box is not checked, QGIS
does not redraw the canvas in response to any of the events described in
Section :ref:`redraw_events`. Examples of when you might want to suspend
rendering include:

* Add many layers and symbolize them prior to drawing
* Add one or more large layers and set scale dependency before drawing
* Add one or more large layers and zoom to a specific view before drawing
* Any combination of the above

Checking the |checkbox| Render box enables rendering and causes an immediate
refresh of the map canvas.

.. _`label_settinglayer`:

b) Setting Layer Add Option 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. index::`rendering!options`
.. index::`layers!initial visibility`

You can set an option to always load new layers without drawing them. This
means the layer will be added to the map, but its visibility checkbox in the
legend will be unchecked by default. To set this option, choose
menu option :menuselection:`Settings --> Options` and click on the
|tab| Rendering tab. Uncheck the \\
|checkbox| :guilabel:`By default new layers added to the map should be displayed` checkbox.
Any layer added to the map will be off (invisible) by default.

.. Stopping Rendering
.. ~~~~~~~~~~~~~~~~~~
.. index::`rendering!halting`

.. \label{label_stoprender}
..
.. To stop the map drawing, press the ESC key. This will halt the refresh of
.. the map canvas and leave the map partially drawn. It may take a bit of time
.. between pressing ESC and the time the map drawing is halted.
.. 
.. **NOTE**: It is currently not possible to stop rendering - this was disabled
.. in qt4 port because of User Interface (UI) problems and crashes.

.. _`label_updatemap`:

c) Updating the Map Display During Rendering
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. index::`rendering!update during drawing`

You can set an option to update the map display as features are drawn. By
default, QGIS does not display any features for a layer until the entire
layer has been rendered. To update the display as features are read from the
datastore, choose menu option :menuselection:`Settings --> Options`
click on the |tab| :menuselection:`Rendering` tab. Set the feature count to an
appropriate value to update the display during rendering. Setting a value of 0
disables update during drawing (this is the default). Setting a value too low
will result in poor performance as the map canvas is continually updated
during the reading of the features. A suggested value to start with is 500.

.. _`label_renderquality`:

d) Influence Rendering Quality
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. index::`rendering!quality`

To influence the rendering quality of the map you have 3 options. Choose menu
option :menuselection:`Settings --> Options` click on the
|tab| :menuselection:`Rendering` tab and select or deselect following checkboxes.


* |checkbox| :guilabel:`Make lines appear less jagged at the expense of some drawing performance`
* |checkbox| :guilabel:`Fix problems with incorrectly filled polygons`

.. _`sec_measure`:

Measuring 
==========
.. index::`measure`

Measuring works within projected coordinate systems (e.g., UTM) and 
unprojected data. If the loaded map is defined with a geographic coordinate system
(latitude/longitude), the results from line or area measurements will be
incorrect. To fix this you need to set an appropriate map coordinate system
(See Section :ref:`label_projections`). All measuring modules also use the
snapping settings from the digitizing module. This is useful, if you want to
measure along lines or areas in vector layers.

To select a measure tool click on |mActionMeasure| and select the tool you want to use.

Measure length, areas and angles
********************************

.. index::`measure:line length`
.. index::`measure:areas`
.. index::`measure:angles`

|mActionMeasure|

QGIS is able to measure real distances between given points according to 
a defined ellipsoid. To configure this, choose menu option
:menuselection:`Settings --> Options`,
click on the |tab| Map tools tab and choose the appropriate ellipsoid. There
you can also define a rubberband color and your preferred measurement units
(meters or feet) and angle units (degrees, radians and gon). The tools then 
allows you to click points on the map. Each segment-length as well as the total 
shows up in the measure-window. To stop measuring click your right mouse button. \\
|mActionMeasureArea| Areas can also be measured.
In the measure window the accumulated area-size appears  \\
In addition, the measuring tool will snap to the currently selected layer, provided that layer has its snapping tolerance set. (See Section~\ref{snapping_tolerance}). So if you want to measure exactly along a line feature, or around a polygon feature, first set its snapping tolerance, then select the layer. Now, when using the measuring tools, each mouse click (within the tolerance setting) will snap to that layer. \\
|mActionMeasureAngle|
You can also measure angles, selecting Measure Angle tool. The cursor becomes
cross-shaped. Click to draw the first segment of the angle you wish to
measure, then move the the cursor to draw the desired angle. The measure
is displayed in a popup dialog.

\begin{figure}[ht]
\centering
   \subfloat[Measure lines] {\label{subfig:measure_line}\includegraphics[clip=true, width=0.3\textwidth]{measure_line}}
     \hspace{0.33cm}
   \subfloat[Measure areas]{\label{subfig:measure_area}\includegraphics[clip=true, width=0.3\textwidth]{measure_area}}
     \hspace{0.33cm}
   \subfloat[Measure angles]{\label{subfig:measure_angle}\includegraphics[clip=true, width=0.3\textwidth]{measure_angle}}
   \caption{Measure tools in action \nixcaption} \label{fig:measure}
\end{figure}

.. _`sec_selection`:

Select and deselect features 
******************************


The QGIS toolbar provides several tools to select features in the map canvas. 
To select one or several features just click on 
|mActionSelect| and select your tool:

* |mActionSelect| :guilabel:`Select features`
* |mActionSelectRectangle| :guilabel:`Select features by rectangle`
* |mActionSelectPolygon| :guilabel:`Select features by polygon`
* |mActionSelectFreehand| :guilabel:`Select features by freehand`
* |mActionSelectRadius| :guilabel:`Select features by radius`

To deselect all selected features click on |mActionDeselectAll|.

.. _`sec_projets`:

Projects
=========
.. index::`projects`

The state of your QGIS session is considered a Project.  QGIS
works on one project at a time.  Settings are either considered
as being per-project, or as a default for new projects (see
Section :ref:`gui_options`). QGIS can save the state of your
workspace into a project file using the menu options
:menuselection:`File` --> |mActionFileSave| :menuselection:`Save Project`
or :menuselection:`File` |mActionFileSaveAs| :menuselection:`Save Project As`.

Load saved projects into a QGIS session using
:menuselection:`File` --> |mActionFileOpen| :menuselection:`Open Project`
or :menuselection:`File --> Open Recent Project`.

If you wish to clear your session and start fresh, choose
:menuselection:`File` --> |mActionFileNew| :menuselection:`New Project`.
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
in the |tab| General tab under :menuselection:`Settings --> Options`
you can select: \\

|checkbox| :guilabel:`Prompt to save project changes when required` \\
|checkbox| :guilabel:`Warn when opening a project file saved with an older version of QGIS`

Project Properties
~~~~~~~~~~~~~~~~~~

In the properties window for the project under |nix| :menuselection:`File -->
Project Properties` or |win| :menuselection:`Settings -->
Project Properties` you set project specific options. These
include:

* In the |tab| :guilabel:`General` tab the project title, selection and background
  color, layer units, precision, and the option to save relative paths to
  layers can be defined. You can define the layer units (only used when CRS 
  transformation is disabled) and the precision of decimal places to use.  
* The |tab| :guilabel:`CRS Coordinate Reference System` tab enables you to choose the
  CRS for this project, and to enable on-the-fly reprojection of raster and vector 
  layers when displaying layers from a different CRS.
* With the third |tab| :guilabel:`Identifiable layers` tab you set (or disable) which
  layers will respond to the identify tool. (See the Map tools paragraph from
  the :ref:`gui_options` section to enable identifying of multiple layers.)
* The tab |tab| :guilabel:`WMS Server` allows to define information about the QGIS 
  mapserver Service Capabilities, the Extent and the CRS Restrictions. Activating 
  the |checkbox| :guilabel:`Add WKT geometry to feature info response` will allow to query the 
  WMS layers.

.. _`sec_output`:

Output 
=======

.. index::`output!save as image!print composer!quick print`

There are several ways to generate output from your QGIS session. We have
discussed one already in Section \ref{sec:projects}: saving as a project file.
Here is a sampling of other ways to produce output files:

* Menu option |mActionSaveMapAsImage| :menuselection:`Save as Image` opens
  a file dialog where you select the name, path and type of image (PNG or JPG
  format). A world file with extension PNGW or JPGW saved in the same folder
  georeferences the image.
* Menu option |mActionNewComposer| :menuselection:`New Print Composer` opens a
  dialog where you can layout and print the current map canvas (see
  Section :ref:`label_printcomposer`).

.. `subsec_gui_options`:

GUI Options 
=============


|mActionOptions| Some basic options
for QGIS can be selected using the :guilabel:`Options` dialog. Select the
menu option :menuselection:`Settings` --> |mActionOptions| :menuselection:`Options`. The tabs where you can
optmize your options are:

General Tab
~~~~~~~~~~~

* |checkbox| :guilabel:`Prompt to save project changes when required`
* |checkbox| :guilabel:`Warn when opening a project file saved with an older version of QGIS`
* Change Selection and background Color
* Change the icon theme (choose between default, classic, gis and newgis)
* Change icon size between 16, 24 and 32 pixel.
* Define double click action in legend (choose between 'open layer properties' 
  and 'open ') attribute table.
* |checkbox| :guilabel:`Capitalise layer names in legend`
* |checkbox| :guilabel:`Display classification attribute names in legend`
* |checkbox| :guilabel:`Create raster icons in legend`
* |checkbox| :guilabel:`Hide splash screen at startup`
* |checkbox| :guilabel:`Open identify results in a dock window (QGIS restart
  required)`
* |checkbox| :guilabel:`Open snapping options in a dock window (QGIS restart
  required)`
* |checkbox| :guilabel:`Open attribute table in a dock window`
* |checkbox| :guilabel:`Add PostGIS layers with double click and select in extended mode`
* |checkbox| :guilabel:`Add new layers to selected group`
* Attribute table behavior (choose between Show all features (default), Show selected features,
  show features in current canvas)
* Define representation for NULL values
* Add path(s) to search for additional C++ plugin libraries. 

Rendering Tab
~~~~~~~~~~~~~

* |checkbox| :guilabel:`By default new layers added to the map should be displayed`
* Define number of features to draw before updating the display.
* |checkbox| :guilabel:`Use render caching where possible to speed up redraws`
* |checkbox| :guilabel:`Make lines appear less jagged at the expense of some drawing
  performance`
* |checkbox| :guilabel:`Fix problems with incorrectly filled polygons`
* |checkbox| :guilabel:`Use new generation symbology for rendering`
* Add/remove path(s) to search for Scalable Vector Graphics (SVG) symbols


Additionally you can define whether to save the path for svg textures
absolute or relative in the |tab| :guilabel:`General` tab of the
:menuselection:`Settings --> Project Properties` menu.

Map tools Tab
~~~~~~~~~~~~~


* The Mode setting determines which layers will be shown by the Identify
  tool. By switching to ``Top down`` or ``Top down, stop at
  first`` instead of ``Current layer`` attributes for all identifiable
  layers (see the Project properties section under: :ref:`projects` to set
  which layers are identifiable) will be shown with the Identify tool.
* |checkbox| :guilabel:`Open feature form, if a single feature is identified`
* Define search radius for identifying and displaying map tips as a
  percentage of the map width
* Define ellipsoid for distance calculations
* Define rubberband color for measure tools
* Define decimal places
* |checkbox| :guilabel:`Keep base unit`
* |radiobuttonon| :guilabel:`Define preferred measurement units (meters or feet)`
* |radiobuttonon| :guilabel:`Define preferred angle units (Degrees, Radians or Gon)`
* Define Mouse wheel action (Zoom, Zoom and recenter, Zoom to mouse
  cursor, Nothing)
* Define Zoom factor for wheel mouse


Overlays Tab
~~~~~~~~~~~~

* Define placement algorithm for labels (choose between central point
  (standard), chain, popmusic tabu chain, popmusic tabu and popmusic chain)


Digitizing Tab
~~~~~~~~~~~~~~

* Define Rubberband line color and line width
* Define default snap mode (to vertex, to segment, to vertex and segment)
* Define default snapping tolerance in map units or pixel
* Define search radius for vertex edits in map units or pixel
* |checkbox|:guilabel:`Show markers only for selected features`
* Define vertex marker style (cross (default), semi transparent circle or
  none) and vertex marker size.
* |checkbox| :guilabel:`Reuse last entered attribute values`
* |checkbox| :guilabel:`Suppress attributes pop-up windows after each created feature`


CRS Tab
~~~~~~~

The CRS tab is devided in two areas. The first area allows to define the default 
CRS for new projects.


* Select a CRS and always start new projects with this CRS.
* |checkbox| :guilabel:`Enable on the fly reprojecion by default`

The second area allows to define the action, when a new layer is created, or when a 
layer without CRS is loaded.

* |radiobuttonoff| :guilabel:`Prompt for Coordinate Reference System (CRS)`
* |radiobuttonoff| :guilabel:`Project wide default Coordinate Reference System (CRS) will be used`
* |radiobuttonon| :guilabel`Global default Coordinate Reference System (CRS) displayed below will be used`

Locale Tab
~~~~~~~~~~

* |checkbox| :guilabel:`Overwrite system locale and use defined locale instead`
* Information about active system locale


Network Tab
~~~~~~~~~~~

.. _`fig_proxy-settings`:

.. figure::img/en/proxy-settings.png
   
   Proxy-settings in |qg|

* |checkbox| :guilabel:`Use proxy for web access` and define host, port, user, and password.
* Set the \dropmenuopt{Proxy type} according to your needs

  * :menuselection:`Default Proxy`: Proxy is determined based on the application proxy set using
  * :menuselection:`Socks5Proxy`: Generic proxy for any kind of connection. Supports TCP, UDP, binding to a port (incoming connections) and authentication.
  * :menuselection:`HttpProxy`: Implemented using the "CONNECT" command, supports only outgoing TCP connections; supports authentication.
  * :menuselection:`HttpCachingProxy`: Implemented using normal HTTP commands, it is useful only in the context of HTTP requests
  * :menuselection:`FtpCachingProxy`: Implemented using an FTP proxy, it is useful only in the context of FTP requests
 
* Define Cache settings (path and size)
* Define WMS search adress, default is ``http://geopole.org/wms/search?search=\%1\&type=rss``
* Define timeout for network requests in ms - default is 60000

Excluding some URLs can be added to the textbox below the proxy-settings (see
fig. \ref{fig:proxy-settings}) by pressing the \button{Add}-button. After that
double-click into the just created URL-field and enter the URL you would like
to exclude from using the proxy. Obviously the button :guilabel:`Remove` removes the selected
entry.

If you need more detailed information about the different proxy-settings,
please refer to the manual of the unterlaying QT-library-documentation at
http://doc.trolltech.com/4.5/qnetworkproxy.html#ProxyType-enum.

.. tip::
      **Using Proxies**
      Using proxies can sometimes be tricky. It is useful to 'trial and
      error' the above proxy types and check if they succeed in your case.

You can modify the options according to your needs. Some of the changes may
require a restart of QGIS before they will be effective.

*  |nix| settings are saved in a texfile: \$HOME/.config/QuantumGIS/qgis.conf
*  |osx| you can find your settings in: \$HOME/Library/Preferences/org.qgis.qgis.plist
*  |win| settings are stored in the registry under:
::

	\\HKEY\CURRENT_USER\Software\QuantumGISqgis


.. _`sec_annotations`:

Annotation Tools 
==================

:index:`annotations`
:index:`text annotation|\see{annotations}`

The |mActionTextAnnotation| text
annotation tools in the attribute toolbar provides the possibility to
place formatted text in a balloon on the QGIS map canvas. Use the text
annotation tool and click into the map canvas.

\begin{figure}[ht]
   \centering
   \includegraphics[clip=true, width=12cm]{annotation}
   \caption{Annotation text dialog \nixcaption}
   \label{fig:annotation}
\end{figure}

Double click on the item opens a dialog with various options. There is the
text editor to enter the formated text and other item settings. E.g. there
is the choice of having the item placed on a map position (displayed by
a marker symbol) or to have the item on a screen position (not related
to the map). The item can be moved by map position (drag the map marker)
or by moving only the balloon. The icons are part of gis theme, and are used
by default in the other themes too.

The |mActionAnnotation| move annotation
tool allows to move the annotation on the map canvas.

Form annotations
****************
.. index::`annotations`
.. index::`form annotation|\see{annotations}`

Additionally you can also create your own annotation forms. The
|mActionFormAnnotation| form annotation
tool is useful to display attributes of a vector layer in a customised qt
designer form (see Figure \ref{fig:custom-annotations}). It is similar to the
designer forms for the identify tool, but displayed in an annotation item.
Also see QGIS blog http://blog.qgis.org/node/143 for more information.

\begin{figure}[ht]
   \centering
   \includegraphics[clip=true, width=10cm]{custom_annotation}
   \caption{Customized qt designer annotation form \nixcaption}
   \label{fig:custom-annotations}
\end{figure}

.. note::
	**Note: If you press :kbd:`Ctrl+T`** while an annotation tool is active 
	(move annotation, text annotation, form annotation), the visibility states 
	of the items are inverted.

.. _`sec_bookmarks`:

Spatial Bookmarks
==================

.. index::`bookmarks`
.. index::`spatial bookmarks|\see{bookmarks}`

Spatial Bookmarks allow you to ``bookmark'' a geographic location and return to it later.

Creating a Bookmark
*******************

To create a bookmark:


#.  Zoom or pan to the area of interest.
#.  Select the menu option :menuselection:`View --> New Bookmark` or press :kbd:`Ctrl-B`.
#.  Enter a descriptive name for the bookmark (up to 255 characters).
#.  Click |button| :menuselection:`OK` to add the bookmark or |button| :menuselection:`Cancel` to exit without adding the bookmark.



Note that you can have multiple bookmarks with the same name.

Working with Bookmarks
**********************

To use or manage bookmarks, select the menu
option :menuselection:`View --> Show Bookmarks`. The \\
:menuselection:`Geospatial Bookmarks` dialog allows you to zoom to or delete a bookmark.
You can not edit the bookmark name or coordinates.

Zooming to a Bookmark
*********************

From the :menuselection:`Geospatial Bookmarks` dialog, select the desired bookmark by clicking on it,
then click |button| :menuselection:`Zoom To`.
You can also zoom to a bookmark by double-clicking on it.

Deleting a Bookmark
*******************

To delete a bookmark from the :guilabel:`Geospatial Bookmarks`
dialog, click on it then click :guilabel:`Delete`.
Confirm your choice by clicking :guilabel:`Yes` or cancel the
delete by clicking :guilabel:`No`.

.. _`sec_gpstracking`:

Live GPS tracking
==================


To activate Live GPS tracking in QGIS you need to select
:menuselection:`View --> Live GPS tracking`. You will get a new
docked Window on the left side of the canvas.

There are 4 possible screens in this GPS tracking window
(see Figure \ref{fig:gpstrack_live} and Figure \ref{fig:gpstrack_options}).

\begin{description}
 \item[(a)] \includegraphics[width=0.5cm,clip=true]{mActionToggleEditing}
GPS position coordinates and for manually entering Vertices and Features
 \item[(b)] \includegraphics[width=0.5cm,clip=true]{gpstrack_barchart}
GPS signal strength of satellite connections
 \item[(c)] \includegraphics[width=0.5cm,clip=true]{gpstrack_polarchart}
GPS polar screen showing number and polar position of satellites
 \item[(d)] \includegraphics[width=0.5cm,clip=true]{mActionOptions}
GPS options screen (see Figure \ref{fig:gpstrack_options}).
\end{description}

With a plugged in GPS receiver (has to be supported by your operating system)
a simple click on |button| :menuselection:`Connect`connects the GPS to QGIS. A second click
(now |button| :menuselection:`Disconnect`) disconnects the GPS-Reciever from your Computer. For 
GNU/Linux gpsd support is integrated to support connection to most GPS 
receivers. Therefore you first have to configure gpsd properly to connect QGIS to it.

.. warning::
	[ IMPORTANT ]: If you want to record your position to the canvas you have to
	create a new vector layer first and switch it to editable status to be able
	to record your track.

\begin{figure}[ht]
\centering
   \subfloat[Position coordinates] {\label{subfig:gpstrack_main}\includegraphics[clip=true, width=0.3\textwidth]{gpstrack_main}}
     \hspace{0.33cm}
   \subfloat[GPS signal strenght]{\label{subfig:gpstrack_stren}\includegraphics[clip=true, width=0.3\textwidth]{gpstrack_stren}}
     \hspace{0.33cm}
   \subfloat[GPS polar window]{\label{subfig:gpstrack_polar}\includegraphics[clip=true, width=0.3\textwidth]{gpstrack_polar}}
\caption{Live GPS tracking \nixcaption} \label{fig:gpstrack_live}
\end{figure}

\begin{figure}[ht]
   \centering
   \includegraphics[clip=true, width=4cm]{gpstrack_options}
   \caption{GPS tracking options window \nixcaption}
   \label{fig:gpstrack_options}
\end{figure}

Position coordinates
********************

|mActionToggleEditing| If the GPS is
recieving signals from satellites you will see your position in latitude,
longitude and elevation as you can see in Figure \ref{subfig:gpstrack_main}

GPS signal strength
*******************

|gpstrack_barchart| Here you can see
the signal strenght of the satellites you are revieving signals from
(Figure \ref{subfig:gpstrack_stren}).

GPS polar window
****************

|gpstrack_polarchart| If you want
to know where in the sky all the connected satellites are, you have to
switch to the polar screen (Figure \ref{subfig:gpstrack_polar}).
You can also see the ID numbers of the satellites you are recieving signals from.

GPS options
***********

|mActionOptions| In case of connection
problems you can switch from |radiobuttonon| :menuselection:`Autodetect` to |radiobuttonon| :menuselection:`Use
path/port below` and select the path/port your GPS receiver is connected to.
A click on |button| :menuselection:`Connect` again initiates the connection to the GPS
receiver.

With the slider |slider| :menuselection:`GPS Cursor Size` you can shrink and grow the position
cursor on the canvas. Activating |radiobuttonon| :menuselection:`Auto-add vertices` within GPS
digitizing your track will automatically be recorded in the active vector layer
(of course the layer has to be in edit mode).

With GPS map recenter you can decide in which way the canvas will be
updated if your recorded coordinates start either to move out of canvas
or there is any change at all.

Track color and width sets the color of and the width of your drawn track.

If you want to set a feature manually you have to go back to
|mActionToggleEditing| ''Position Coordinates''
and click on |button| :menuselection:`Add feature`.

.. [1] Keyboard shortcuts can now be configured manually
   (shortcuts presented in this section are the defaults), using the Configure
   Shortcuts tool under Settings Menu.
