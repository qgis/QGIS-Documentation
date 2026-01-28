.. index:: QGIS File Formats
.. _qgisfileformats_appendix:

Appendix C: QGIS File Formats
-----------------------------

.. index:: QGIS Project File
.. index:: QGS
.. index:: QGZ
.. index:: QGD
.. _qgisprojectfile:

.qgz or .qgs- The QGIS Project File Format
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

When you see a file with either .qgz or .qgs extension, those are QGIS project files.  

This file format does not itself contain any geodata, i.e., it does not contain aerial photos and it does not contain polygon or point features representing features on a map. It only contains data _about_ which layers to show and how to show them. 


When you edit the name of a mountain in the layer called mountains and click `Save Layers Edit`, then that change is saved to the layer source, which might be a local GeoJson file or a remote database. But nothing is changed to the qgis project file. 

When you change QGIS to show labels with those mountain names in blue and with Comic Sans, and you click "Save Project", this data about presentation is saved to the project file. 

Evolution from qgs to qgz
^^^^^^^^^^^^^^^^^^^^^^^^^

QGIS version 2 only knew of one project file format, which was XML with a .qgs extension. 

But XML has its limitations and eventually it was necessary to also store project data in other ways than plain XML. 

With the introduction of QGIS 3 the default file format was .qgz, which is a zip archive containing the .qgs file. But because it's a zip file, it can also contain other files, so called *sidecar files*. Currently there are two official types of sidecar files:

- .qgd (see section below)  
- XXXXXX_styles.db, (see section below)

Alternative: myproject.qgs with myproject_attachments.zip
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

It is however also possible to not use .qgz, and instead save a project to .qgs. If choosing so, any sidecar files will be saved to a separate zip file. E.g. when saving to myproject.qgs, the sidecar files will be written to the archive myproject_attachments.zip, placed in the same folder. 

One reason for choosing to use .qgs instead of .qgz is 
that it's better suited for running diff tools, e.g., if one wants to run version control on qgis project files. 

.qgs - The QGIS Project XML Format
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The .qgs is an XML format, which contains the most fundamental parts of the project. This includes:

- project title
- project CRS
- the layer tree
- snapping settings
- relations
- the map canvas extent
- project models
- legend
- mapview docks (2D and 3D)
- the layers with links to the underlying datasets (data sources) and other layer properties including extent, SRS, joins, styles, renderer, blend mode, opacity and more.
- project properties

.qgd - Sidecar for storing auxiliary data
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

One example of auxiliary data is when the project file contains data about individual features from a layer, i.e., data that is associated with a feature, and thus not simply associated with a layer. One example is if the user specifies label placement for individual features. 

If saving a project to foo.qgz, and the project contains any auxiliary data, then that aux data will be saved to foo.qgd which is added to the archive. If no auxiliary data is present, then this sidecar file won't be created. The d is short for database, and the file is an sqlite3 database. 

XXXXXX_styles.db - Sidecar file for storing style information
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

XXXXXX is a six character randomly generated string, so it could look like XiIaRN_styles.db or clnCHe_styles.db.

Typically there is just one such sidecar file, but there might be more. They are sqlite3 databases and contain information relevant to layer styling. 

QLR - The QGIS Layer Definition file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

A Layer Definition file (QLR) is an XML file that contains a pointer
to the layer data source in addition to QGIS style information for
the layer.

The use case for this file is simple: To have a single file for
opening a data source and bringing in all the related style
information.
QLR files also allow you to mask the underlying datasource in an
easy to open file.

An example of QLR usage is for opening MS SQL layers.
Rather than having to go to the MS SQL connection dialog, connect,
select, load and finally style, you can simply add a .qlr file that
points to the correct MS SQL layer with all the necessary style
included.

In the future a .qlr file may hold a reference to more than one layer.

.. _figure_qlrtop:

.. figure:: img/qlr.png
   :align: center
   
   The top level tags of a QLR file


.. index:: QGIS Style File
.. index:: QML
.. _qgisstylefile:

QML - The QGIS Style File Format
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

QML is an XML format for storing layer styling.

A QML file contains all the information QGIS can handle for the
rendering of feature geometries including symbol definitions,
sizes and rotations, labelling, opacity and blend mode and more.

The figure below shows the top level tags of a QML file (with
only ``renderer_v2`` and its ``symbol`` tag expanded).

.. _figure_qml:

.. figure:: img/qml.png
   :align: center

   The top level tags of a QML file (only the renderer_v2 tag
   with its symbol tag is expanded)
