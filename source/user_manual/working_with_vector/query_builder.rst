.. index:: Query_Builder

.. _vector_query_builder:

Query Builder
=============

The **[Advanced search...]** button opens the Query Builder and allows you to 
define a subset of a table using a SQL-like WHERE clause, display the result 
in the main window and save it as a Shapefile. For example, if you have a
``towns`` layer with a ``population`` field you could select only larger towns 
by entering ``population > 100000`` in the SQL box of the query builder. 
Figure_attributes_2_ shows an example of the query builder populated with data 
from a PostGIS layer with attributes stored in PostgreSQL. The Fields, Values 
and Operators sections help the user to construct the SQL-like query.

.. _figure_attributes_2:

.. only:: html
   
   **Figure Attributes 2:** 

.. figure:: /static/user_manual/working_with_vector/queryBuilder.png
   :width: 40em
   :align: center

   Query Builder |nix|

The **Fields list** contains all attributes of the attribute table to be 
searched. To add an attribute to the SQL where clause field, double click its 
name in the Fields list. Generally you can use the various fields, values and 
operators to construct the query or you can just type it into the SQL box.

The **Values list** lists the values of an attribute. To list all possible 
values of an attribute, select the attribute in the Fields list and click 
the **[all]** button. To list all values of an attribute that are present in 
the sample table, select the attribute in the Fields list and click the 
**[Sample]** button. To add a value to the SQL where clause field, double 
click its name in the Values list.

The **Operators section** contains all usable operators. To add an operator 
to the SQL where clause field, click the appropriate button. Relational 
operators ( = , > , ...), string comparison operator ( LIKE ), logical 
operators ( AND , OR, ...) are available.

The **[Test]** button shows a message box with the number of features 
satisfying the current query, which is usable in the process of query 
construction. The **[Clear]** button clears the text in the SQL where 
clause text field. The **[Save]** and **[Load]** button allow to save 
and load SQL queries. The **[OK]** button closes the window and selects 
the features satisfying the query. The **[Cancel]** button closes the 
window without changing the current selection.

.. _tip_sql_layer_definition:

.. tip:: **Changing the Layer Definition**

   You can change the layer definition after it is loaded by altering the 
   SQL query used to define the layer. To do this, open the vector 
   :guilabel:`Layer Properties` dialog by double-clicking on the layer in 
   the legend and click on the **[Query Builder]** button on the 
   :guilabel:`General` tab. See Section :ref:`vector_properties_dialog` for 
   more information.

.. index:: Select_using_Query

.. _sec_select_by_query:

Select by query
---------------

With |qg| it is possible also to select features using a similar query 
builder interface to that used in :ref:`vector_query_builder`. In the above 
section the purpose of the query builder is to only show features meeting 
the filter criteria as a 'virtual layer' / subset. The purpose of the select 
by query function is to highlight all features that meet a particular 
criteria. Select by query can be used with all vector data providers.

To do a 'select by query' on a loaded layer, click on the button 
|mActionOpenTable| :sup:`Open Table` to open the attribute table of the layer. 
Then click the **[Advanced...]** button at the bottom. This starts the Query 
Builder that allows to define a subset of a table and display it as described 
in Section :ref:`vector_query_builder`.

Save selected features as new layer
-----------------------------------

The selected features can be saved as any OGR supported vector format and 
also transformed into another Coordinate Reference System (CRS). Just open 
the right mouse menu of the layer and click on 
:menuselection:`Save selection as -->` to define the name of the output file, 
its format and CRS (see Section :ref:`label_legend`). It is also possible to 
specify OGR creation options within the dialog.
