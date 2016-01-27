|updatedisclaimer|

.. index:: Work_with_Attribute_Table
.. _sec_attribute_table:

**********************************
 Working with the Attribute Table
**********************************

The :index:`attribute table` displays features of a selected layer. Each row
in the table represents one map feature, and each column contains a particular
piece of information about the feature. Features in the table can be searched,
selected, moved or even edited.

To open the attribute table for a vector layer, make the layer active by
clicking on it in the map legend area. Then, from the main
:menuselection:`Layer` menu, choose |mActionOpenTable| :menuselection:`Open Attribute
Table`. It is also possible to right click on the layer and choose
|mActionOpenTable| :menuselection:`Open Attribute Table` from the drop-down menu,
and to click on the |mActionOpenTable| :guilabel:`Open Attribute Table` button
in the Attributes toolbar.

This will open a new window that displays the feature attributes for the
layer (figure_attributes_1_). The number of features and the number of
selected features are shown in the attribute table title.

.. _figure_attributes_1:

.. only:: html

   **Figure Attributes 1:**

.. figure:: /static/user_manual/working_with_vector/vectorAttributeTable.png
   :align: center

   Attribute Table for regions layer |nix|

.. index:: Attribute_Table_Selection

Selecting features in an attribute table
========================================

**Each selected row** in the attribute table displays the attributes of a
selected feature in the layer. If the set of features selected in the main
window is changed, the selection is also updated in the attribute table.
Likewise, if the set of rows selected in the attribute table is changed, the
set of features selected in the main window will be updated.

Rows can be selected by clicking on the row number on the left side of the
row. **Multiple rows** can be marked by holding the :kbd:`Ctrl` key.
A **continuous selection** can be made by holding the :kbd:`Shift` key and
clicking on several row headers on the left side of the rows. All rows
between the current cursor position and the clicked row are selected.
Moving the cursor position in the attribute table, by clicking a cell in the
table, does not change the row selection. Changing the selection in the main
canvas does not move the cursor position in the attribute table.

The table can be sorted by any column, by clicking on the column header. A
small arrow indicates the sort order (downward pointing means descending
values from the top row down, upward pointing means ascending values from
the top row down).

For a **simple search by attributes** on only one column, choose the
:menuselection:`Column filter -->` from the menu in the bottom left corner.
Select the field (column) on which the search should be
performed from the drop-down menu, and hit the **[Apply]** button. Then, only
the matching features are shown in the attribute table.

To make a selection, you have to use the |mIconExpressionSelect| :sup:`Select features using an Expression`
icon on top of the attribute table.
|mIconExpressionSelect| :sup:`Select features using an Expression` allows you
to define a subset of a table using a :guilabel:`Function List` like in the
|mActionCalculateField| :sup:`Field Calculator` (see :ref:`vector_field_calculator`).
The query result can then be saved as a new vector layer.
For example, if you want to find regions that are boroughs from :file:`regions.shp`
of the |qg| sample data, you have to open the :guilabel:`Fields and Values` menu
and choose the field that you want to query. Double-click the field 'TYPE_2' and also
**[Load all unique values]** . From the list, choose and double-click 'Borough'.
In the :guilabel:`Expression` field, the following query appears:

::

 "TYPE_2"  =  'Borough'

Here you can also use the :menuselection:`Function list --> Recent (Selection)` to
make a selection that you used before. The expression builder remembers the last 20
used expressions.

The matching rows will be selected, and the total number of matching rows will
appear in the title bar of the attribute table, as well as in the status bar of
the main window. For searches that display only selected features on the map,
use the Query Builder described in section :ref:`vector_query_builder`.

To show selected records only, use :guilabel:`Show Selected Features` from the menu
at the bottom left.

The field calculator bar allows you to make calculations on the selected rows only.
For example, you can alter the number of the ID field of the file:`regions.shp` with
the expression

::

 ID+5

as shown in figure_attributes_1_ .

The other buttons at the top of the attribute table window provide the
following functionality:

* |mActionToggleEditing| :sup:`Toggle editing mode` to edit single values
  and to enable functionalities described below (also with :kbd:`Ctrl+E`)
* |mActionSaveEdits| :sup:`Save Edits` (also with :kbd:`Ctrl+S`)
* |mActionUnselectAttributes| :sup:`Unselect all` (also with :kbd:`Ctrl+U`)
* |mActionSelectedToTop| :sup:`Move selected to top` (also with :kbd:`Ctrl+T`)
* |mActionInvertSelection| :sup:`Invert selection` (also with :kbd:`Ctrl+R`)
* |mActionCopySelected| :sup:`Copy selected rows to clipboard` (also with
  :kbd:`Ctrl+C`)
* |mActionZoomToSelected| :sup:`Zoom map to the selected rows` (also with
  :kbd:`Ctrl+J`)
* |PanToSelected| :sup:`Pan map to the selected rows` (also with :kbd:`Ctrl+P`)
* |mActionDeleteSelected| :sup:`Delete selected features` (also with
  :kbd:`Ctrl+D`)
* |mActionNewAttribute| :sup:`New Column` for PostGIS layers and for OGR
  layers with GDAL version >= 1.6 (also with :kbd:`Ctrl+W`)
* |mActionDeleteAttribute| :sup:`Delete Column` for PostGIS layers and for OGR
  layers with GDAL version >= 1.9 (also with :kbd:`Ctrl+L`)
* |mActionCalculateField| :sup:`Open field calculator` (also with :kbd:`Ctrl+I`)

Below these buttons is the Field Calculator bar, which allows calculations
to be quickly applied attributes visible in the table. This bar uses the
same expressions as the |mActionCalculateField| :sup:`Field Calculator`
(see :ref:`vector_field_calculator`).

.. tip:: **Skip WKT geometry**

   If you want to use attribute data in external programs (such as Excel), use the
   |mActionCopySelected| :sup:`Copy selected rows to clipboard` button.
   You can copy the information without vector geometries if you deactivate
   :menuselection:`Settings --> Options -->` Data sources menu |checkbox|
   :guilabel:`Copy geometry in WKT representation from attribute table`.

Save selected features as new layer
===================================

The selected features can be saved as any OGR-supported vector format and
also transformed into another coordinate reference system (CRS). Just open
the right mouse menu of the layer and click on :menuselection:`Save
as` to define the name of the output file, its format and CRS (see section
:ref:`label_legend`). To save the selection ensure that the |checkbox|
:menuselection:`Save only selected features` is selected.
It is also possible to specify OGR creation options within the dialog.

.. _paste_into_layer:

Paste into new layer
====================

Features that are on the clipboard may be pasted into a new
layer.  To do this, first make a layer editable. Select some features,
copy them to the clipboard, and then paste them into a new layer using
:menuselection:`Edit --> Paste Features as` and choosing
:menuselection:`New vector layer` or :menuselection:`New memory
layer`.

This applies to features selected and copied within |qg| and
also to features from another source defined using well-known text (WKT).

.. index:: Non_Spatial_Attribute_Tables

Working with non spatial attribute tables
=========================================

|qg| allows you also to load non-spatial tables. This currently includes tables
supported by OGR and delimited text, as well as the PostgreSQL, MSSQL and Oracle provider.
The tables can be used for field lookups or just generally browsed and edited using the table
view. When you load the table, you will see it in the legend field. It can be
opened with the |mActionOpenTable| :sup:`Open Attribute Table` tool and
is then editable like any other layer attribute table.

As an example, you can use columns of the non-spatial table to define attribute
values, or a range of values that are allowed, to be added to a specific vector
layer during digitizing. Have a closer look at the edit widget in section
:ref:`vector_attributes_menu` to find out more.
