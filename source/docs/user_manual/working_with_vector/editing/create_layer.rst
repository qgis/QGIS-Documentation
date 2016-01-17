|updatedisclaimer|

.. index:: Create_New_Layers, New_Shapefile_Layer, New_SpatiaLite_Layer, New_GPX_Layer

.. _sec_create_vector:

****************************
 Creating new Vector layers
****************************

|qg| allows you to create new shapefile layers, new SpatiaLite layers, new
GPX layers and New Temporary Scratch Layers. Creation of a new GRASS layer is supported within the GRASS plugin.
Please refer to section :ref:`creating_new_grass_vectors` for more information
on creating GRASS vector layers.

Creating a new Shapefile layer
==============================

To create a new shape layer for editing, choose :menuselection:`New -->`
|mActionNewVectorLayer| :menuselection:`New Shapefile Layer...` from the
:menuselection:`Layer` menu. The :guilabel:`New Vector Layer` dialog will be
displayed as shown in Figure_edit_5_. Choose the type of layer (point, line or
polygon) and the CRS (coordinate reference system).

Note that |qg| does not yet support creation of 2.5D features (i.e., features
with X,Y,Z coordinates).

.. _figure_edit_5:

.. only:: html

   **Figure Edit 5:**

.. figure:: /static/user_manual/working_with_vector/editNewVector.png
   :align: center

   Creating a new Shapefile layer Dialog |nix|

To complete the creation of the new shapefile layer, add the desired attributes
by clicking on the **[Add to attributes list]** button and specifying a name and type for the
attribute. A first 'id' column is added as default but can be removed, if not
wanted. Only :guilabel:`Type: real` |selectstring|, :guilabel:`Type: integer`
|selectstring|, :guilabel:`Type: string` |selectstring| and :guilabel:`Type:date` |selectstring|
attributes are supported. Additionally and according to the attribute type, you can also define
the width and precision of the new attribute column. Once you are happy with
the attributes, click **[OK]** and provide a name for the shapefile. |qg| will
automatically add a :file:`.shp` extension to the name you specify. Once the
layer has been created, it will be added to the map, and you can edit it in the
same way as described in section :ref:`sec_edit_existing_layer`.

.. index:: New_Spatialite_Layer

.. _vector_create_spatialite:

Creating a new SpatiaLite layer
===============================

To create a new SpatiaLite layer for editing, choose :menuselection:`New -->`
|mActionNewSpatiaLiteLayer| :menuselection:`New SpatiaLite Layer...` from the
:menuselection:`Layer` menu. The :guilabel:`New SpatiaLite Layer` dialog will
be displayed as shown in Figure_edit_6_.

.. _figure_edit_6:

.. only:: html

   **Figure Edit 6:**

.. figure:: /static/user_manual/working_with_vector/editNewSpatialite.png
   :align: center

   Creating a New SpatiaLite layer Dialog |nix|

The first step is to select an existing SpatiaLite database or to create a new
SpatiaLite database. This can be done with the browse button |browsebutton| to
the right of the database field. Then, add a name for the new layer, define
the layer type, and specify the coordinate reference system with **[Specify CRS]**.
If desired, you can select |checkbox| :guilabel:`Create an autoincrementing primary key`.

To define an attribute table for the new SpatiaLite layer, add the names of
the attribute columns you want to create with the corresponding column type, and
click on the **[Add to attribute list]** button. Once you are happy with the
attributes, click **[OK]**. |qg| will automatically add the new layer to the
legend, and you can edit it in the same way as described in section
:ref:`sec_edit_existing_layer` above.

Further management of SpatiaLite layers can be done with the DB Manager. See
:ref:`dbmanager`.

.. index:: New_GPX_Layer
.. _vector_create_gpx:

Creating a new GPX layer
========================

To create a new GPX file, you need to load the GPS plugin first. :menuselection:`Plugins -->`
|mActionShowPluginManager| :menuselection:`Plugin Manager...` opens the Plugin Manager Dialog.
Activate the |checkbox| :guilabel:`GPS Tools` checkbox.

When this plugin is loaded, choose :menuselection:`New -->` |icon_newgpx|
:menuselection:`Create new GPX Layer...` from the :menuselection:`Layer` menu.
In the :guilabel:`Save new GPX file as` dialog, you can choose where to save the
new GPX layer.

.. index:: New_Temporary_Scratch_Layer
.. _vector_new_scratch_layer:

Creating a new Temporary Scratch Layer
======================================

Empty, editable memory layers can be defined using :menuselection:`Layer --> Create Layer --> New Temporary Scratch Layer`.
Here you can even create |radiobuttonoff| :guilabel:`Multipoint`, |radiobuttonoff|:guilabel:`Multiline`
and |radiobuttonoff|:guilabel:`Multipolygon` Layers beneath |radiobuttonon|:guilabel:`Point`,
|radiobuttonoff|:guilabel:`Line` and |radiobuttonoff|:guilabel:`Polygon` Layers.
Temporary Scratch Layers are not saved and will be discarded when |qg| is closed.
See also :ref:`paste_into_layer` .
