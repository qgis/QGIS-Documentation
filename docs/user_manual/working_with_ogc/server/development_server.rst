.. index::
    pair: Development; QGIS Server

.. _server_development_server:

**********************
Development Server
**********************


A production installation and deployment of QGIS Server usually involves setting
up a web server component (e.g. Apache or Nginx) that can forward the HTTP requests
coming from the clients to the QGIS Server FastCGI binary application.

If you want to quickly test QGIS Server on your local machine without configuring
and installing a full web server stack you can use the QGIS Development Standalone
server.

This is an independent application that provides a very simple web server ready
to serve your project files.

.. warning::

    The Standalone Development Server has not been developed with the purpose
    of being used in production, it was not checked for security vulnerabilities
    or for other stress conditions that normally will occur on a publicly exposed
    server.


To launch the server:

.. code-block:: bash

    $ qgis_mapserver

The default port the Development Server listens to is ``8000``. Example output:

.. code-block:: bash

    QGIS Development Server listening on http://localhost:8000
    CTRL+C to exit
    127.0.0.1 [lun gen 20 15:16:41 2020] 5140 103ms "GET /wfs3/?MAP=/tests/testdata/qgis_server/test_project.qgs HTTP/1.1" 200
    127.0.0.1 [lun gen 20 15:16:41 2020] 3298 2ms "GET /wfs3/static/jsonFormatter.min.js HTTP/1.1" 200
    127.0.0.1 [lun gen 20 15:16:41 2020] 1678 3ms "GET /wfs3/static/jsonFormatter.min.css HTTP/1.1" 200
    127.0.0.1 [lun gen 20 15:16:41 2020] 1310 5ms "GET /wfs3/static/style.css HTTP/1.1" 200
    127.0.0.1 [lun gen 20 15:16:43 2020] 4285 13ms "GET /wfs3/collections?MAP=/tests/testdata/qgis_server/test_project.qgs HTTP/1.1" 200

The server has a few options that can be passed as command line arguments.
You can see them all by invoking the server with ``-h``.

.. code-block:: bash

    Usage: qgis_mapserver [options] [address:port]
    QGIS Development Server

    Options:
    -h, --help        Displays this help.
    -v, --version     Displays version information.
    -l <logLevel>     Sets log level (default: 0)
                        0: INFO
                        1: WARNING
                        2: CRITICAL
    -p <projectPath>  Path to a QGIS project file (*.qgs or *.qgz),
                        if specified it will override the query string MAP argument
                        and the QGIS_PROJECT_FILE environment variable

    Arguments:
    addressAndPort    Listen to address and port (default: "localhost:8000")
                        address and port can also be specified with the environment
                        variables QGIS_SERVER_ADDRESS and QGIS_SERVER_PORT
