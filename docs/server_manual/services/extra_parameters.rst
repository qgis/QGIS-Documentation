.. _`extra-getmap-parameters`:

Extra parameters supported by all request types
===============================================

The following extra parameters are supported by all protocols.

* **FILE_NAME**: if set, the server response will be sent to the
  client as a file attachment with the specified file name.

.. note::

    Not available for WFS3.

* **MAP**: Similar to MapServer, the ``MAP`` parameter can be used to
  specify the path to the QGIS project file. You can specify an absolute
  path or a path relative to the location of the server executable
  (:file:`qgis_mapserv.fcgi`).
  If not specified, QGIS Server searches for .qgs files in the directory
  where the server executable is located.

  Example::

    http://localhost/cgi-bin/qgis_mapserv.fcgi?\
      REQUEST=GetMap&MAP=/home/qgis/projects/world.qgs&...

..  note::

    You can define a **QGIS_PROJECT_FILE** as an environment variable
    to tell the server executable where to find the QGIS project file.
    This variable will be the location where QGIS will look for the
    project file.
    If not defined it will use the MAP parameter in the request and
    finally look at the server executable directory.
