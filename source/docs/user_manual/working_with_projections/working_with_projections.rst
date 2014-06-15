|updatedisclaimer|

.. _`label_projections`:

************************
Working with Projections
************************

.. index:: Projections, CRS, Coordinate_Reference_System

|qg| allows users to define a global and project-wide CRS (coordinate
reference system) for layers without a pre-defined CRS. It also allows the user
to define custom coordinate reference systems and supports on-the-fly (OTF)
projection of vector and raster layers. All of these features allow the user to
display layers with different CRSs and have them overlay properly.

.. index:: EPSG, IGNF, European_Petroleom_Search_Group, Institut_Geographique_National_de_France

Overview of Projection Support
==============================

|qg| has support for approximately 2,700 known CRSs. Definitions for each CRS are stored in a SQLite database that is installed with |qg|. Normally,
you do not need to manipulate the database directly. In fact, doing so may
cause projection support to fail. Custom CRSs are stored in a user database. See
section :ref:`sec_custom_projections` for information on managing your custom
coordinate reference systems.

The CRSs available in |qg| are based on those defined by the European Petroleum
Search Group (EPSG) and the Institut Geographique National de France (IGNF) and
are largely abstracted from the spatial reference tables used in GDAL. EPSG
identifiers are present in the database and can be used to specify a CRS in
|qg|.

In order to use OTF projection, either your data must contain information about its
coordinate reference system or you will need to define a global, layer or
project-wide CRS. For PostGIS layers, |qg| uses the spatial reference identifier
that was specified when the layer was created. For data supported by OGR, |qg|
relies on the presence of a recognized means of specifying the CRS. In the case
of shapefiles, this means a file containing the well-known text (:index:`WKT`)
specification of the CRS. This projection file has the same base name as the
shapefile and a :file:`.prj` extension. For example, a shapefile named
:file:`alaska.shp` would have a corresponding projection file named
:file:`alaska.prj`.

Whenever you select a new CRS, the layer units will automatically be
changed in the :guilabel:`General` tab of the |mActionOptions|
:guilabel:`Project Properties` dialog under the :guilabel:`Project` (Gnome,
OS X) or :guilabel:`Settings` (KDE, Windows) menu.

.. index:: default_CRS

Global Projection Specification
===============================

|qg| starts each new project using the global default projection. The global
default CRS is EPSG:4326 - WGS 84 (``proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs``),
and it comes predefined in |qg|. This default can be changed via the
**[Select...]** button in the first section, which is used to define the default
coordinate reference system for new projects, as shown in
figure_projection_1_. This choice will be saved for use in subsequent |qg|
sessions.

.. _figure_projection_1:

.. only:: html

   **Figure Projection 1:**

.. figure:: /static/user_manual/working_with_projections/crsdialog.png
   :align: center

   CRS tab in the |qg| Options Dialog |nix|

When you use layers that do not have a CRS, you need to define how |qg|
responds to these layers. This can be done globally or project-wide in the
:guilabel:`CRS` tab under :menuselection:`Settings -->` |mActionOptions|
:guilabel:`Options`.

The options shown in figure_projection_1_ are:

* |radiobuttonon| :guilabel:`Prompt for CRS`
* |radiobuttonoff| :guilabel:`Use project CRS`
* |radiobuttonoff| :guilabel:`Use default CRS displayed below`

If you want to define the coordinate reference system for a certain layer
without CRS information, you can also do that in the :guilabel:`General` tab
of the raster and vector properties dialog (see :ref:`label_generaltab` for rasters and :ref:`vectorgeneralmenu` for vectors). If your layer already has a CRS
defined, it will be displayed as shown in :ref:`figure_vector_properties_1`.

.. tip:: **CRS in the Map Legend**

   Right-clicking on a layer in the Map Legend (section :ref:`label_legend`)
   provides two CRS shortcuts. :guilabel:`Set layer CRS` takes you directly
   to the Coordinate Reference System Selector dialog (see figure_projection_2_).
   :guilabel:`Set project CRS from Layer` redefines the project CRS using
   the layer's CRS.

Define On The Fly (OTF) Reprojection
====================================

|qg| supports OTF reprojection for both raster and vector data. However, OTF is
not activated by default. To use OTF projection, you must activate the
|checkbox| :guilabel:`Enable on the fly CRS transformation` checkbox in the
:guilabel:`CRS` tab of the |mActionProjectProperties| :menuselection:`Project
Properties` dialog.

**There are three ways to do this:**

#. Select |mActionOptions| :menuselection:`Project Properties` from the
   :menuselection:`Project` (Gnome, OSX) or :menuselection:`Settings` (KDE,
   Windows) menu.
#. Click on the |geographic| :sup:`CRS status` icon in the lower right-hand
   corner of the status bar.
#. Turn OTF on by default in the :guilabel:`CRS` tab of the
   :guilabel:`Options` dialog by selecting |checkbox|
   :guilabel:`Enable 'on the fly' reprojection by default` or :guilabel:`Automatically enable 'on the fly' reprojection if layers have different CRS`.

If you have already loaded a layer and you want to enable OTF projection, the
best practice is to open the :guilabel:`CRS` tab of the :guilabel:`Project
Properties` dialog, select a CRS, and activate the |checkbox|
:guilabel:`Enable 'on the fly' CRS transformation` checkbox.
The |geographic| :sup:`CRS status` icon will no longer be greyed out, and all
layers will be OTF projected to the CRS shown next to the icon.

.. index:: Proj4, Proj4_text

.. only:: html

   **Figure Projection 2:**

.. _figure_projection_2:

.. figure:: /static/user_manual/working_with_projections/projectionDialog.png
   :align: center

   Project Properties Dialog |nix|

The :guilabel:`CRS` tab of the :guilabel:`Project Properties` dialog contains
five important components, as shown in Figure_projection_2_ and described below:

#. **Enable 'on the fly' CRS transformation** --- This checkbox is used to
   enable or disable OTF projection. When off, each layer is drawn using the
   coordinates as read from the data source, and the components described below
   are inactive. When on, the coordinates in each layer are projected to the
   coordinate reference system defined for the map canvas.
#. **Filter** --- If you know the EPSG code, the identifier, or the name for a
   coordinate reference system, you can use the search feature to find it.
   Enter the EPSG code, the identifier or the name.
#. **Recently used coordinate reference systems** --- If you have certain CRSs
   that you frequently use in your everyday GIS work, these will be displayed
   in this list. Click on one of these items to select the associated CRS.
#. **Coordinate reference systems of the world** --- This is a list of all CRSs
   supported by |qg|, including Geographic, Projected and Custom coordinate
   reference systems. To define a CRS, select it from the list by expanding
   the appropriate node and selecting the CRS. The active CRS is preselected.
#. **PROJ.4 text** --- This is the CRS string used by the PROJ.4 projection
   engine. This text is read-only and provided for informational purposes.

.. tip:: **Project Properties Dialog**

   If you open the :guilabel:`Project Properties` dialog from the
   :menuselection:`Project` menu, you must click on the :guilabel:`CRS` 
   tab to view the CRS settings.

   Opening the dialog from the |geographic| :sup:`CRS status` icon will
   automatically bring the :guilabel:`CRS` tab to the front.

.. _sec_custom_projections:

Custom Coordinate Reference System
==================================

.. index:: Custom_CRS

If |qg| does not provide the coordinate reference system you need, you can
define a custom CRS. To define a CRS, select |mActionCustomProjection|
:guilabel:`Custom CRS...` from the :menuselection:`Settings` menu. Custom CRSs
are stored in your |qg| user database. In addition to your custom CRSs, this
database also contains your spatial bookmarks and other custom data.

.. _figure_projection_3:

.. only:: html

   **Figure Projection 3:**

.. figure:: /static/user_manual/working_with_projections/customProjectionDialog.png
   :align: center

   Custom CRS Dialog |nix|

.. index:: Proj.4

Defining a custom CRS in |qg| requires a good understanding of the PROJ.4
projection library. To begin, refer to "Cartographic Projection Procedures
for the UNIX Environment - A User's Manual" by Gerald I. Evenden, U.S.
Geological Survey Open-File Report 90-284, 1990 (available at
ftp://ftp.remotesensing.org/proj/OF90-284.pdf).

This manual describes the use of the ``proj.4`` and related command line
utilities. The cartographic parameters used with ``proj.4`` are described in
the user manual and are the same as those used by |qg|.

The :guilabel:`Custom Coordinate Reference System Definition` dialog requires
only two parameters to define a user CRS:

#. A descriptive name
#. The cartographic parameters in PROJ.4 format

To create a new CRS, click the |mIconNew| :sup:`Add new CRS` button and enter a
descriptive name and the CRS parameters.

Note that the :guilabel:`Parameters` must begin with a ``+proj=`` block,
to represent the new coordinate reference system.

You can test your CRS parameters to see if they give sane results. To do this,
enter known WGS 84 latitude and longitude values in :guilabel:`North` and
:guilabel:`East` fields, respectively. Click on **[Calculate]**, and compare the
results with the known values in your coordinate reference system.

Default datum transformations
=============================

.. index:: Datum_transformation

OTF depends on being able to transform data into a 'default CRS', and
|qg| uses WGS84. For some CRS there are a number of transforms
available. |qg| allows you to define the transformation used otherwise
|qg| uses a default transformation.

In the :guilabel:`CRS` tab under :menuselection:`Settings -->` |mActionOptions|
:guilabel:`Options` you can:

* set |qg| to ask you when it needs define a transformation using |radiobuttonon| :guilabel:`Ask for datum transformation when no default is defined` 
* edit a list of user defaults for transformations.

|qg| asks which transformation to use by opening a dialogue box
displaying PROJ.4 text describing the source and destination
transforms. Further information may be found by hovering over a
transform. User defaults can be saved by selecting
|radiobuttonon| :guilabel:`Remember selection`.
