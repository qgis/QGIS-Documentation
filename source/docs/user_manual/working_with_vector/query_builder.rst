|updatedisclaimer|

.. index:: Query_Builder

.. _vector_query_builder:

Query Builder
=============

The Query Builder allows you to define a subset of a table using a SQL-like WHERE
clause and to display the result in the main window. The query result can then be
saved as a new vector layer.

Query
-----

Open the **Query Builder** by opening the Layer Properties and going to the :guilabel:`General` menu.
Under :guilabel:`Feature subset`, click on the **[Query Builder]** button to open the :guilabel:`Query builder`.
For example, if you have a ``regions`` layer with a ``TYPE_2`` field, you could
select only regions that are ``borough`` in the :guilabel:`Provider specific filter expression`
box of the Query Builder. Figure_attributes_2_ shows an example of the Query Builder
populated with the :file:`regions.shp` layer from the |qg| sample data.
The Fields, Values and Operators sections help you to construct the SQL-like
query.

.. _figure_attributes_2:

.. only:: html

   **Figure Attributes 2:**

.. figure:: /static/user_manual/working_with_vector/queryBuilder.png
   :align: center

   Query Builder |nix|

The **Fields list** contains all attribute columns of the attribute table to be
searched. To add an attribute column to the SQL WHERE clause field, double click
its name in the Fields list. Generally, you can use the various fields, values and
operators to construct the query, or you can just type it into the SQL box.

The **Values list** lists the values of an attribute table. To list all possible
values of an attribute, select the attribute in the Fields list and click
the **[all]** button. To list the first 25 unique values of an attribute column,
select the attribute column in the Fields list and click the
**[Sample]** button. To add a value to the SQL WHERE clause field, double
click its name in the Values list.

The **Operators section** contains all usable operators. To add an operator
to the SQL WHERE clause field, click the appropriate button. Relational
operators ( ``=`` , ``>`` , ...), string comparison operator (``LIKE``), and logical
operators (``AND``, ``OR``, ...) are available.

The **[Test]** button shows a message box with the number of features
satisfying the current query, which is useful in the process of query
construction. The **[Clear]** button clears the text in the SQL WHERE
clause text field. The **[OK]** button closes the window and selects
the features satisfying the query. The **[Cancel]** button closes the
window without changing the current selection.

.. index:: Select_using_Query

.. _sec_selection_query:


Save selected features as new layer
-----------------------------------

The selected features can be saved as any OGR-supported vector format and
also transformed into another coordinate reference system (CRS). Just open
the right mouse menu of the layer and click on
:menuselection:`Save selection as -->` to define the name of the output file,
its format and CRS (see section :ref:`label_legend`). It is also possible to
specify OGR creation options within the dialog.
