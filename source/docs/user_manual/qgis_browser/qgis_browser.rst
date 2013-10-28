.. |updatedisclaimer|
.. _`label_qgis_browser`:

************
|qg| Browser
************

The |qg| Browser is a panel in |qg| that lets you easily navigate in your
database. You can have access to common vector files (e.g. ESRI shapefile or
MapInfo files), databases (e.g.PostGIS, Oracle, Spatialite or MSSQL Spatial)
and WMS/WFS connections. You can also view your GRASS data (to get the data
into |qg| see :ref:`sec_grass`).

.. index:: Browse_Maps, Import_Maps

.. _figure_browser_standalone_metadata:

.. only:: html

   **Figure browser 1:**

.. figure:: /static/user_manual/qgis_browser/browser_standalone_metadata.png
   :align: center
   :width: 40em

   |qg| browser as a standalone application |nix|

Use |qg| Browser to preview your data. The drag and drop function makes it easy
to get your data into the Map view and the Map legend.

#. Activate |qg| Browser: Right-click on the tool bar and click |checkbox|:guilabel:`Browser`
   or select from :menuselection:`Settings --> Panels`.
#. Drag the panel into the legend window.
#. Click on the :guilabel:`Browser` tab.
#. Browse in your database and choose the shapefile folder from qgis_sample_data.
#. Press the :kbd:`Shift` key and click on airports.shp and alaska.shp .
#. Press the left mouse button then drag and drop the files into the map canvas.
#. Right-click on a layer and choose :guilabel:`Set project CRS from layer`.
   For more information see :ref:`label_projections`.
#. Click on |mActionZoomFullExtent| :sup:`Zoom Full` to make the layers
   visible.

There is a second browser available under :menuselection:`Settings --> Panels`. Additional
functions like the |mActionAdd|:sup:`Add Selected Layers` and the |mActionFilter|:sup:`Filter files`
function were inserted.

#. Activate a second |qg| Browser: Right-click on the toolbar and click |checkbox|:guilabel:`Browser (2)` .
#. Drag the panel into the legend window.
#. Navigate to the :guilabel:`Browser (2)` tab and browse for a shapefile in your file system.
#. Select a file with the left mouse button. Now you can use the |mActionAdd|:sup:`Add Selected Layers` icon. Use the icon to be able to work with  a file in |qg| without much effort.

|qg| automatically looks for the Coordinate Reference System (CRS) and zooms to the layer extent if you work in a blank |qg| project. If there are already files in your project the file just will be added and in case it has the same extent and CRS it will be visualized. If the file has got another CRS and layer extent you must first right-click on the layer and choose :guilabel:`Set Project CRS from Layer`. Then choose :guilabel:`Zoom to Layer Extent`.

The |mActionFilter|:sup:`Filter files` function works on a directory level. Browse to the folder where you want to
filter files and give in a search word or a wildcard. The browser only shows matching filenames then, other data won't be
displayed then.

It's also possible to run |qg| Browser as a standalone application.

**Start QGIS browser**

* |nix| Type in "qbrowser" at a command prompt.
* |win| Start |qg| browser using the Start menu or desktop shortcut, or
  double click on a |qg| project file.
* |osx| |qg| browser is available from your your Applications folder.

In figure_browser_standalone_metadata_ you can see the enhanced functionality
of |qg| browser. The :guilabel:`Param` tab provides the details of your
connection based datasets like PostGIS or MSSQL Spatial. The :guilabel:`Metadata`
tab contains general information about the file (see :ref:`vectormetadatamenu`).
With the :guilabel:`Preview` tab you can have a look at your files without
importing them into your |qg| project. It's also possible to preview the
attributes of your files in the :guilabel:`Attributes` tab.


