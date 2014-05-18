|updatedisclaimer|

.. _dbmanager:

DB Manager Plugin
=================

The DB Manager Plugin is officially part of the |qg| core and is intended to replace the
SPIT Plugin and, additionally, to integrate all other
database formats supported by |qg| in one user interface. The |icon_dbmanager|
:sup:`DB Manager` Plugin provides several features. You can drag layers from the
|qg| Browser into the DB Manager, and it will import your layer into your spatial
database. You can drag and drop tables between spatial databases and they will
get imported. You can also use the DB Manager to execute SQL queries against your
spatial database and then view the spatial output for queries by adding the
results to |qg| as a query layer.

.. _figure_db_manager:

.. only:: html

   **Figure DB Manager 1:**

.. figure:: /static/user_manual/plugins/db_manager.png
   :align: center

   DB Manager dialog |nix|


The :menuselection:`Database` menu allows you to connect to an existing database, to
start the SQL window and to exit the DB Manager Plugin. Once you are connected to
an existing database, the menus :menuselection:`Schema` and :menuselection:`Table`
additionally appear.

The :menuselection:`Schema` menu includes tools to create and delete (empty)
schemas and, if topology is available (e.g., PostGIS 2), to start a
:guilabel:`TopoViewer`.

The :menuselection:`Table` menu allows you to create and edit tables and to
delete tables and views. It is also possible to empty tables and to move tables
from one schema to another. As further functionality, you can perform a VACUUM and
then an ANALYZE for each selected table. Plain VACUUM simply reclaims space and
makes it available for reuse. ANALYZE updates statistics to determine the
most efficient way to execute a query. Finally, you can import layers/files, if they
are loaded in |qg| or exist in the file system. And you can export database tables
to shape with the Export File feature.

The :guilabel:`Tree` window lists all existing databases supported by |qg|. With
a double-click, you can connect to the database. With the right mouse button, you
can rename and delete existing schemas and tables. Tables can also be added to
the |qg| canvas with the context menu.

If connected to a database, the **main** window of the DB Manager offers three
tabs. The :guilabel:`Info` tab provides information about the table and its
geometry, as well as about existing fields, constraints and indexes. It also
allows you to run Vacuum Analyze and to create a spatial index on a selected table,
if not already done. The :guilabel:`Table` tab shows all attributes, and the
:guilabel:`Preview` tab renders the geometries as preview.

