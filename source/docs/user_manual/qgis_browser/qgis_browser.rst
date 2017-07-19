.. only:: html

   |updatedisclaimer|

.. index:: Browse data
.. _`label_qgis_browser`:

************************
QGIS Standalone Browser
************************

.. contents::
   :local:


QGIS Browser is available as a standalone application and as a panel in QGIS
Desktop. It lets you easily navigate in your filesystem and manage geodata.
You can have access to common vector files (e.g., ESRI shapefiles or MapInfo files),
databases (e.g., PostGIS, Oracle, SpatiaLite or MS SQL Spatial) and
OWS/WCS|WMS|WFS connections. You can also view GRASS data (to get the data
into QGIS, see :ref:`sec_grass`).

QGIS Browser Panel description is available at :ref:`browser_panel` section so
only the standalone browser is treated below.

Like the Browser panel, the standalone Browser helps you navigate through your
filesystem and manage geodata. It also helps you preview or create them
and open them in a QGIS project by drag-and-drop.

**Start the QGIS browser**

* |nix| Type in "qbrowser" at a command prompt.
* |win| Start the QGIS Browser using the Start menu or desktop shortcut.
* |osx| The QGIS Browser is available from your Applications folder.


.. _figure_browser_standalone_metadata:

.. figure:: /static/user_manual/qgis_browser/browser_standalone_metadata.png
   :align: center

   QGIS Browser as a standalone application

In figure_browser_standalone_metadata_, you can see the enhanced functionality
of the standalone QGIS Browser. The :guilabel:`Param` tab provides the details of
your connection-based datasets, like PostGIS or MSSQL Spatial. The
:guilabel:`Metadata` tab contains general information about the file (see
:ref:`vectormetadatamenu`). With the :guilabel:`Preview` tab, you can have a
look at your files without importing them into your QGIS project. It's also
possible to preview the attributes of your files in the :guilabel:`Attributes`
tab.
