.. index::
   single:Browse_Maps
.. index::
   single:Import_Maps

.. _`label_qgis_browser`:

*************
QGIS Browser
*************

The QGIS Browser is a new panel in QGIS that lets you easily navigate in your database. You can have access to common vector files (e.g. ESRI shapefile or MapInfo files), databases (e.g.PostGIS or MSSQL Spatial), WMS/WFS connections. You can also view your GRASS data (to get the data into QGIS see :ref:`sec_grass`).

Use QGIS Browser to preview your data. The drag and drop function makes it easy to get your data into the Map view and the Map legend.

#.Activate QGIS Browser: Right-click on the tool bar and click |checkbox|:guilabel:`Browser`.
#.Drag the panel into the legend window.
#.Klick on the :guilabel:`Browser` tab.
#.Browse in your database and choose the shapefile folder from qgis_sample_data.
#.Press the :kbd:`Shift` key and klick on airports.shp and alaska.shp .  
#.Press the left mouse button and drag the files into the map canvas.
#.Right-click on a layer and choose :guilabel:`Set project CRS from layer`. For more information see :ref:`...` .


It's also possible to run QGIS Browser as a standalone application.

**Start qgis browser**

* |nix| Type in "qbrowser" at a command prompt.
.. * |win| Start QGIS browser using the Start menu or desktop shortcut, or 
  double click on a QGIS project file.
* |osx| QGIS browser is not available yet from your your Applications folder. 
  However it can easily be made available:     

    In Finder use :menuselection:`Go --> Go to map...` and use it to find 
    the folder ``/Applications/QGIS.app/Contents/MacOS/bin``

    Use the key combination :kbd:`option - command` and drag **qbrowser.app** 
    while holding down the left mouse button to the Applications folder. 
    This will create a link that you can use to start QGIS browser.

   

  




