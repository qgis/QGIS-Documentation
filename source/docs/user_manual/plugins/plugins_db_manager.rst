|updatedisclaimer|


.. _dbmanager:

DB Manager Plugin
=================

The DB Manager Plugin is officially part of |qg| core and intends to replace the
SPIT Plugin and additionally to integrate all other
database formats supported by |qg| in one user interface. The |icon_dbmanager|
:sup:`DB Manager` Plugin provides several features. You can drag layers from the
QGIS Browser into the DB Manager and it will import your layer into your spatial
database. You can drag and drop tables between spatial databases and they will
get imported. You can also use the DB Manager to execute SQL queries against your
spatial database and then view the spatial output for queries by adding the
results to QGIS as a query layer.

.. _figure_db_manager:

.. only:: html

   **Figure DB Manager 1:**

.. figure:: /static/user_manual/plugins/db_manager.png
   :align: center
   :width: 30 em

   DB Manager dialog |nix|


The :menuselection:`Database` menu allows to connect to an existing database, to
start the SQL-window and to exit the DB Manager Plugin. The :menuselection:`Schema`
menu includes tools to create and delete (empty) schemas and, if topology is
available (e.g. PostGIS 2) to start a :guilabel:`TopoViewer`. The menu
:menuselection:`Table` allows to create and edit tables and to delete tables and
views. It is also possible to empty tables and to move tables from one to another
schema. Finally you can also run Vacuum Analyze and add Versioning Support to a
table.

The :guilabel:`Tree` window lists all existing databases supported by |qg|. With
a double-click you can connect to the database. With the right-mouse button you
can rename and delete existing schemas and tables. Tables can also be added to
the QGIS canvas with the context menu.

If connected to a database, the **main** window of the DB Manager offers three
tabs. The :guilabel:`Info` tab provides information about the table and its
geometry as well as about existing Fields, Constraints and Indexes. It also
allows to run Vacuum Analyze and to create a spatial index on a selected table,
if not already done. The :guilabel:`Table` tab shows all attributes and the
:guilabel:`Preview` tab renders the geometries as preview.

.. FIXME: the buttons 'Import layer/file' and 'Export file' have to be described
