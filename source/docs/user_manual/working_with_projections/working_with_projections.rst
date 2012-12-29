.. comment out this Section (by putting '|updatedisclaimer|' on top) if file is not uptodate with release

.. _`label_projections`:

*************************
Working with Projections 
*************************

.. index:: Projections, CRS, Coordinate_Reference_System

QGIS allows users to define a global and project-wide CRS (Coordinate
Reference System) for layers without a pre-defined CRS. It also allows
the user to define custom coordinate reference systems and supports
on-the-fly (OTF) projection of vector and raster layers. All these
features allow the user to display layers with different CRS and have
them overlay properly.

.. _`label_projoverview`:

Overview of Projection Support
===============================

QGIS has support for approximately 2,700 known CRS. Definitions for
each of these CRS are stored in a SQLite database that is installed with
QGIS. Normally you do not need to manipulate the database directly. In fact,
doing so may cause projection support to fail. Custom CRS are stored in a
user database. See Section :ref:`sec_custom_projections` for
information on managing your custom coordinate reference systems.

.. index:: EPSG, IGNF, European_Petroleom_Search_Group
.. index:: Institut_Geographique_National_de_France

The CRS available in QGIS are based on those defined by the European
Petroleum Search Group (EPSG) and the Institut Geographique
National de France (IGNF) and are largely abstracted 
from the spatial reference tables used in GDAL. EPSG identifiers 
are present in the database and can be used to specify a CRS in QGIS.

In order to use OTF projection, your data must contain information about its
coordinate reference system or you have to define a global, layer or
project-wide CRS. For PostGIS layers QGIS uses the spatial reference
identifier that was specified when the layer was created. For data supported
by OGR, QGIS relies on the presence of a recognized means of specifying
the CRS. In the case of shapefiles, this means a file containing the Well
Known Text (:index:`WKT`) specification of the CRS. This projection file
has the same base name as the shapefile and a prj extension. For example, a
shapefile named :file:`alaska.shp` would have a corresponding projection
file named :file:`alaska.prj`.

Whenever you select a new CRS, the used layer units will automatically be
changed in the :guilabel:`General` tab of the
|mActionOptions| :guilabel:`Project Properties` dialog under the
:guilabel:`Edit` (Gnome, OSX) or :guilabel:`Settings` (KDE, Windows)
menu.

.. index:: default_CRS

Specifying a Projection
=======================

QGIS starts each new project using the global default projection.The
global default CRS is EPSG:4326 - WGS 84 
(``proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs``) and comes predefined in
QGIS. This default can be changed using the **[Select...]** button 
in the first section, used to defining the Default Coordinate Reference System to use when starting new projects, as shown in figure_projection_1_. 
This choice will be saved for use in subsequent QGIS sessions.

.. _figure_projection_1:

.. only:: html

   **Figure Projection 1:**

.. figure:: /static/user_manual/working_with_projections/crsdialog.png
   :align: center
   :width: 40em

   CRS tab in the QGIS Options Dialog |osx|


When you use layers that do not have a CRS, you need to define how
QGIS responds to these layers. This can be done globally or
project-wide in the :guilabel:`CRS` tab under :menuselection:`Edit -->` |mActionOptions| :guilabel:`Options` (Gnome, OSX) or
:menuselection:`Settings -->`  |mActionOptions| :guilabel:`Options`
(KDE, Windows).

The options shown in figure_projection_1_ are:

* |radiobuttonoff| :guilabel:`Prompt for CRS` 
* |radiobuttonoff| :guilabel:`Use project CRS`
* |radiobuttonon| :guilabel:`Use default CRS displayed below`

If you want to define the coordinate reference system for a certain
layer without CRS information, you can also do that in the :guilabel:`General` tab of the raster (see :ref:`label_generaltab`) and
vector (see :ref:`vectorgeneraltab`) properties dialog. If your
layer already has a CRS defined, it will be displayed as shown in
:ref:`figure_vector_properties_1` .

.. tip:: **CRS in the Map Legend** 

   Right clicking on a layer in the Map Legend (Section :ref:`label_legend`) 
   provides two CRS short cuts.

   * :guilabel:`Set layer CRS` takes you directly to the Coordinate
     Reference System Selector dialog (see figure_projection_2_). Which you also get to by the
     **[Select]** button on the :guilabel:`General` tab of the layer
     properties dialog.
   * :guilabel:`Set project CRS from Layer` redefines the project
     CRS using the layer's CRS

  .. _figure_projection_2:

  .. only:: html

     **Figure Projection 2**
 
  .. figure:: /static/user_manual/working_with_projections/crs_selector.png
      :align: center
      :width: 40em

      The CRS selector dialog |nix|

.. index:: OTF, On_The_Fly_Projection

.. _`label_projstart`:

Define On The Fly (OTF) Reprojection
====================================

QGIS supports OTF reprojection for both raster and vector
data. However, OTF is not activated by default. To use OTF projection,
you must activate the |checkbox| :guilabel:`Enable on the fly CRS transformation` checkbox
in the :guilabel:`CRS` tab of the |mActionProjectProperties|
:menuselection:`Project Properties` dialog.

There are three ways to achieve this end:

#. Select |mActionOptions| :menuselection:`Project Properties` from the
   :menuselection:`Edit` (Gnome, OSX) or :menuselection:`Settings` (KDE, Windows) 
   menu.
#. Click on the |geographic| :sup:`CRS status` icon in the lower 
   right-hand corner of the statusbar.
#. Turn OTF on by default, by selecting the :guilabel:`CRS` tab of the 
   :guilabel:`Options` dialog and selecting |checkbox| 
   :guilabel:`Enable 'on the fly' reprojection by default`


If you have already loaded a layer, and want to enable OTF projection, the
best practice is to open the :guilabel:`Coordinate Reference System` 
tab of the :guilabel:`Project Properties` dialog, select a CRS, and 
activate the |checkbox| :guilabel:`Enable on the fly CRS transformation` checkbox. 
The |geographic| :sup:`CRS status` icon will no longer be greyed-out
and all layers will be OTF projected to the CRS shown next to the icon.

The :guilabel:`Coordinate Reference System` tab of the 
:guilabel:`Project Properties` dialog contains five important components as 
shown in Figure_projection_3_ and described below.

.. following picture has an external reference from working with ogc, so 
   the reference of this figure needs a capture!

.. only:: html

   **Figure Projection 3:**

.. _figure_projection_3:

.. figure:: /static/user_manual/working_with_projections/projectionDialog.png
   :align: center
   :width: 40em

   Projection Dialog |win|

.. index:: Proj4, Proj4_text

#. **Enable on the fly CRS transformation** -
   this checkbox is used to enable or disable OTF projection. When off, each
   layer is drawn using the coordinates as read from the data source and the 
   components described below are inactive. When on, the coordinates in each 
   layer are projected to the coordinate reference system defined for the map canvas.
#. **Coordinate Reference System** - this is a list of all CRS
   supported by QGIS, including Geographic, Projected and Custom coordinate
   reference systems. To define a CRS,  select it from the list by expanding
   the appropriate node and selecting the CRS. The active CRS is preselected.
#. **Proj4 text** - this is the CRS string used by the Proj4
   projection engine. This text is read-only and provided for informational
   purposes.
#. **Search** - if you know the EPSG code, the identifier or the name
   for a Coordinate Reference System, you can use the search feature to find it.
   Enter the identifier and click on **[Find]**. Use the |checkbox| 
   :guilabel:`Hide deprecated CRSs` checkbox to show only the currently valid 
   projections.
#. **Recently used CRS** - if you have certain CRS that you frequently
   use in your everyday GIS work, these will be displayed in the table
   at the bottom of the Projection Dialog. Click on one of these buttons to select
   the associated CRS.


.. tip:: **Project Properties Dialog**

   If you open the :guilabel:`Project Properties` dialog from the
   :menuselection:`Edit` (Gnome, OSX) or :menuselection:`Settings`
   (KDE, Windows) menu, you must click on the 
   :guilabel:`Coordinate Reference System` tab to view the CRS settings. 

   Opening the dialog from the |geographic| :guilabel:`CRS status` icon 
   will automatically bring the :guilabel:`Coordinate Reference System` 
   tab to the front.

.. _sec_custom_projections:

Custom Coordinate Reference System
===================================

.. index:: Custom_CRS

If QGIS does not provide the coordinate reference system you need, you
can define a custom CRS. To define a CRS, select |mIconNew|:guilabel:`Custom CRS` from the :menuselection:`Edit` (Gnome, OSX) or 
:menuselection:`Settings` (KDE, Windows) menu.  Custom CRS are stored in your 
QGIS user database. In addition to your custom CRS, this database also contains 
your spatial bookmarks and other custom data.


.. _figure_projection_4:

.. only:: html

   **Figure Projection 4:**

.. figure:: /static/user_manual/working_with_projections/customProjectionDialog.png
   :align: center
   :width: 30em

   Custom CRS Dialog |nix|

.. index:: Proj.4

Defining a custom CRS in QGIS requires a good understanding of the Proj.4
projection library. To begin, refer to the Cartographic Projection Procedures
for the UNIX Environment - A User's Manual by Gerald I. Evenden, U.S.
Geological Survey Open-File Report 90-284, 1990 (available at 
ftp://ftp.remotesensing.org/proj/OF90-284.pdf.

This manual describes the use of the ``proj.4`` and related command line
utilities. The cartographic parameters used with ``proj.4`` are
described in the user manual and are the same as those used by QGIS.

The :guilabel:`Custom Coordinate Reference System Definition` dialog requires
only two parameters to define a user CRS:

#. a descriptive name and
#. the cartographic parameters in PROJ.4 format.

To create a new CRS, click the |mIconNew| :sup:`New` button and enter a
descriptive name and the CRS parameters. After that you can save your CRS by
clicking the |mActionFileSave| :sup:`Save` button.

Note that the :guilabel:`Parameters` must begin with a ``+proj=``-block,
to represent the new coordinate reference system.

You can test your CRS parameters to see if they give sane results by
clicking on the **[Calculate]** button inside the :guilabel:`Test` block
and pasting your CRS parameters into the :guilabel:`Parameters` field. Then enter 
known WGS 84 latitude and longitude values in :guilabel:`North` and :guilabel:`East` 
fields respectively. Click on **[Calculate]** and compare the results with the 
known values in your coordinate reference system.
