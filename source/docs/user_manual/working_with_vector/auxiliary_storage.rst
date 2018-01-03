.. only:: html

   |updatedisclaimer|

.. index:: Auxiliary Storage

.. _vector_auxiliary_storage:

*****************
Auxiliary storage
*****************

.. only:: html

   .. contents::
      :local:


The regular way to customize styling and labeling is to use data-defined
properties as described in :ref:`data_defined`. However, it may not be
possible if the underlying data is read only. Moreover, configuring these
data-defined properties may be very time consuming or not desirable! For
example, if you want to fully use map tools coming with :ref:`label_toolbar`,
then you need to add and configure more than 20 fields in you original data
source (x and y positions, rotation angle, font style, color and so on).

The Auxiliary Storage mechanism provides the solution to these limitations
and awkward configurations. Actually, auxiliary fields are a roundabout
mean to automatically manage and store these data-defined properties in a
SQLite database thanks to editable joins. This way, data source doesn't even
need to be editable!

A tab is available in vector layer properties dialog to manage Auxiliary
Storage:

.. figure:: /static/user_manual/working_with_vector/auxiliary_storage_tab.png
   :align: center

   Auxiliary Storage tab

.. _vector_auxiliary_storage_key:

Labeling
========

Considering that the data source may be customized thanks to data-defined
properties without being editable, labeling map tools described in
:ref:`label_toolbar` are always available as soon as labeling is activated.

Actually, an auxiliary layer is needed to store these properties. Its creation
process is run the first time you click on the map while a labeling map tool
is currently activated. Then, a window is displayed, allowing to indicate the
primary key to use for joining:

.. _figure_auxiliary_layer_creation:

.. figure:: /static/user_manual/working_with_vector/auxiliary_storage_key.png
   :align: center

   Auxiliary Layer creation dialog


As soon as an auxiliary layer is configured for the current data source, you can
retrieve its information in the tab:

.. figure:: /static/user_manual/working_with_vector/auxiliary_storage_tabkey.png
   :align: center

   Auxiliary Layer key


For now, we can see that:

* the primary key used is well ``id``
* there's ``0`` feature using an auxiliary field
* there's ``0`` auxiliary field

Now that the auxiliary layer is well created, we just have to edit our labels.
If we click on a label while the |changeLabelProperties| :sup:`Change Label`
map tool is activated, then we're able to update styling properties like sizes,
colors and so on. Then, the corresponding data-defined properties are created
and can be retrieved:

.. figure:: /static/user_manual/working_with_vector/auxiliary_storage_fields.png
   :align: center

   Auxiliary Fields


As we are seeing in the previous figure, ``21`` fields have been automatically
created and configured for labeling. For example, the ``Color``
auxiliary field type is a ``String`` and is named ``labeling_color`` in the
underlying SQLite database. Moreover, we observe that there's ``1`` feature
which is currently using these auxiliary fields.

By the way, considering that auxiliary fields are linked to data-defined
properties, we can observe that data-defined override options are setup
correctly because of the icon |dataDefineOn| in the labeling tab:

.. figure:: /static/user_manual/working_with_vector/auxiliary_storage_dd.png
   :align: center

   Data-defined properties automatically created


Otherwise, there's another way to create an auxiliary field for a specific
property thanks to the |dataDefined| :sup:`data-defined override` button.
For example, by clicking on this button for the :guilabel:`Opacity` field (not
automatically created by the |changeLabelProperties| :sup:`Change Label`
map tool), the next dialog is displayed:

.. figure:: /static/user_manual/working_with_vector/auxiliary_storage_store.png
   :align: center

   Data-defined property menu


Thus, by clicking on :guilabel:`Store data in the project`, an auxiliary field
is automatically created for the :guilabel:`Opacity` field. If you click on
this button whereas the auxiliary layer is not created yet, then the window
:ref:`figure_auxiliary_layer_creation` is firstly displayed to select the
primary key to use for joining.


Symbology
=========

In the same way than for customising labels, auxiliary fields may be used to
stylize symbols too. To do this, you just have to click on
:guilabel:`Store data in the project` for a specific symbol property. For
example for the :guilabel:`Fill color` field:

.. figure:: /static/user_manual/working_with_vector/auxiliary_storage_symbol.png
   :align: center

   Data-defined property menu for symbol


However, there's still a slight difference compared to labeling because a name
has to be provided. A name is needed in case of symbology because a same
property may be needed for several symbols, so a unique name is necessary.
Thus, by clicking on :guilabel:`Store data in the project`, a window is
displayed, indicating the :guilabel:`Type` of the field and providing a way
to give a unique name. For the :guilabel:`Fill color` field, the next window
is opened:

.. figure:: /static/user_manual/working_with_vector/auxiliary_storage_symbol_name.png
   :align: center

   Auxiliary field symbol name


Once created, the auxiliary field can be retrieved in the auxiliary storage
tab:

.. figure:: /static/user_manual/working_with_vector/auxiliary_storage_symbol_field.png
   :align: center

   Auxiliary field symbol


Attribute table and widgets
===========================

Once created, auxiliary fields may be edited through the
:ref:`attribute table <sec_attribute_table>`. However, there's some subtlety
about widgets of auxiliary fields.

For example, auxiliary fields which may be edited through an external tool
are not visible in the attribute table. This way, as the :guilabel:`Rotation`
may be edited through |changeLabelProperties| :sup:`Change Label` or
|rotateLabel| :sup:`Rotate Label`, the auxiliary widget is **Hidden** by
default (see :ref:`edit_widgets`). However, as the :guilabel:`Opacity`
field cannot be edited thanks to map tools, the corresponding widget is not
**Hidden**. Moreover, auxiliary fields representing a ``Color`` have a
widget **Color** set by default.

Then, the underlying form will look like the next figure:

.. figure:: /static/user_manual/working_with_vector/auxiliary_storage_widgets.png
   :align: center

   Form with auxiliary fields


Management
==========

Some actions are available to manage auxiliary layers thanks to the next
combobox:

.. figure:: /static/user_manual/working_with_vector/auxiliary_storage_actions.png
   :align: center

   Auxiliary layer management


The first item :guilabel:`Create` is disabled in this case because the auxiliary
layer is already created. But in case of a fresh work, you can use this action to
create an auxiliary layer. As explained in :ref:`vector_auxiliary_storage_key`,
a primary key will be needed then.

The :guilabel:`Clear` action allows to keep all auxiliary fields, but remove
their contents. This way, the number of features using these fields will fall to
``0``.

The :guilabel:`Delete` action completely removes the auxiliary layer. In other
words, the corresponding table is deleted from the underlying SQLite database.

Finally, the :guilabel:`Export` action allows to export the auxiliary layer
thanks to the same tool than in case of :ref:`general_saveas`. Note that
geometries are not stored in auxiliary storage. However, in this case,
geometries are exported from the original data source too.


Database
========

When you save your project with the ``.qgs`` format, the SQLite database
used for auxiliary storage is saved at the same place but with the extension
``.qgd``.

For conveniance, an archive may be used instead thanks to the ``.qgz`` format.
In this case, ``.qgd`` and  ``.qgs`` files are both embedded in the archive.
