.. index::
    pair: Environment; QGIS Server

.. _server_env_variables:

**********************
Advanced configuration
**********************

.. only:: html

   .. contents::
      :local:
      :depth: 1

.. index::
    pair: Logging; QGIS Server

.. _qgis-server-logging:

Logging
=======

To log requests sent to the server, you have to set the following environment
variable:

- :ref:`QGIS_SERVER_LOG_STDERR <qgis_server_log_stderr>`

With the following variables the logging can be further customized:

- :ref:`QGIS_SERVER_LOG_LEVEL <qgis_server_log_level>`
- :ref:`QGIS_SERVER_LOG_PROFILE <qgis_server_log_profile>`


.. _`qgis-server-envvar`:

Environment variables
=====================

You can configure some aspects of QGIS Server by setting **environment
variables**.

According to the HTTP server and how you run QGIS Server, there are
several ways to define these variables. This is fully described in
:ref:`httpserver`.


.. list-table::
   :header-rows: 1
   :widths: 30 40 15 15

   * - Name
     - Description
     - Default
     - Services

   * - QGIS_OPTIONS_PATH
     - Specifies the path to the directory with settings. It works the same way as
       QGIS application ``--optionspath`` option. It is looking for settings file in
       ``<QGIS_OPTIONS_PATH>/QGIS/QGIS3.ini``.
     - ''
     - All

   * - QGIS_PLUGINPATH
     - Useful if you are using Python plugins for the server, this sets the folder
       that is searched for Python plugins.
     - ''
     - All

   * - QGIS_PROJECT_FILE
     - The ``.qgs`` or ``.qgz`` project file, normally passed as a parameter in the
       query string (with *MAP*), you can also set it as an environment variable (for
       example by using ``mod_rewrite`` Apache module).

       Note that you may also indicate a project stored in PostgreSQL, e.g.
       ``postgresql://localhost:5432?sslmode=disable&dbname=mydb&schema=myschema&project=myproject`` or inside a geopackage file, e.g. ``geopackage:/path/to/geopackage/file.gpkg?projectName=myProjectName``.
     - ''
     - All

   * - QGIS_SERVER_ALLOWED_EXTRA_SQL_TOKENS
     - Comma separated list of strings that represent the allowed extra SQL tokens accepted as components of a feature filter.
     - ''
     - WMS

   * - QGIS_SERVER_API_RESOURCES_DIRECTORY
     - Base directory for all OGC API (such as OAPIF/WFS3) static resources (HTML
       templates, CSS, JS, ...)
     - depends on packaging
     - OAPIF/WFS3

   * - QGIS_SERVER_APPLICATION_NAME
     - Name of the application to be used, for instance when connecting to a database to identify
       the QGIS server instance connected
     - QGIS3 server
     - All

   * - QGIS_SERVER_API_WFS3_MAX_LIMIT
     - Maximum value for ``limit`` in a OAPIF/WFS3 features request.
     - 10000
     - OAPIF/WFS3

   * - QGIS_SERVER_CACHE_DIRECTORY
     - Specifies the network cache directory on the filesystem.
     - ``cache`` in profile directory
     - All

   * - QGIS_SERVER_CACHE_SIZE
     - Sets the network cache size in MB.
     - 50 MB
     - All

   * - QGIS_SERVER_CAPABILITIES_CACHE_SIZE
     - The maximum number of project capabilities to cache.
     - 40
     - All

   * - QGIS_SERVER_DISABLE_GETPRINT
     - This is an option at the project level to improve project read time by disabling
       loading of layouts.

       Activating this option disables the QGIS WMS GetPrint request.
       Set this QGIS project flag to not load layouts.
     - false
     - WMS

   * - QGIS_SERVER_FORCE_READONLY_LAYERS
     - Force QGIS Server to open all layers in a read only mode
     - false
     - All

   * - QGIS_SERVER_IGNORE_BAD_LAYERS
     - "Bad" layers are layers that cannot be loaded. The default behavior of QGIS Server
       is to consider the project as not available if it contains a bad layer.

       The default behavior can be overridden by setting this variable to ``1`` or ``true``.
       In this case, "bad" layers will just be ignored, and the project will be considered
       valid and available.
     - false
     - All

   * - QGIS_SERVER_LANDING_PAGE_PREFIX
     - Prefix of the path component of the landing page base URL
     - ""
     - All

   * - .. _qgis_server_landing_page_projects_directories:

       QGIS_SERVER_LANDING_PAGE_PROJECTS_DIRECTORIES
     - Directories used by the landing page service to find .qgs and .qgz projects
     - ""
     - All

   * - .. _qgis_server_landing_page_projects_pg_connections:

       QGIS_SERVER_LANDING_PAGE_PROJECTS_PG_CONNECTIONS
     - PostgreSQL connection strings used by the landing page service to find projects
     - ""
     - All

   * - .. _qgis_server_log_file:

       QGIS_SERVER_LOG_FILE
     - Specify path and filename. Make sure that server has proper permissions for
       writing to file. File should be created automatically, just send some requests
       to server. If it's not there, check permissions.

       .. warning:: QGIS_SERVER_LOG_FILE is deprecated since QGIS 3.4, use QGIS_SERVER_LOG_STDERR instead.
         File logging support will be removed in QGIS 4.0.
     - ''
     - All

   * - .. _qgis_server_log_level:

       QGIS_SERVER_LOG_LEVEL
     - Specify desired log level. Available values are:

       * ``0`` or ``INFO`` (log all requests)
       * ``1`` or ``WARNING``
       * ``2`` or ``CRITICAL`` (log just critical errors, suitable for production purposes)
     - 0
     - All

   * - .. _qgis_server_log_profile:

       QGIS_SERVER_LOG_PROFILE
     - Add detailed profile information to the logs, only effective when QGIS_SERVER_LOG_LEVEL=0
     - false
     - All

   * - .. _qgis_server_log_stderr:

       QGIS_SERVER_LOG_STDERR
     - Activate logging to stderr. This variable  has no effect when ``QGIS_SERVER_LOG_FILE``
       is set.

       * ``0`` or ``false`` (case insensitive)
       * ``1`` or ``true`` (case insensitive)
     - false
     - All

   * - QGIS_SERVER_MAX_THREADS
     - Number of threads to use when parallel rendering is activated. If value is ``-1`` it
       uses the number of processor cores.
     - -1
     - All

   * - QGIS_SERVER_OVERRIDE_SYSTEM_LOCALE
     - Sets LOCALE to be used by QGIS server. The default value is empty (no override).

       Example: ``de_CH.utf8``
     - ''
     - All

   * - QGIS_SERVER_PARALLEL_RENDERING
     - Activates parallel rendering for WMS GetMap requests. It's disabled (``false``)
       by default. Available values are:

       * ``0`` or ``false`` (case insensitive)
       * ``1`` or ``true`` (case insensitive)
     - false
     - WMS

   * - QGIS_SERVER_PROJECT_CACHE_CHECK_INTERVAL
     - Controls the periodic strategy interval for cache invalidation, in milliseconds.
       Defaults to 0 which selects the legacy File system watcher.
     -
     - All

   * - QGIS_SERVER_PROJECT_CACHE_STRATEGY
     - Defines method for invalidating the project cache. Available strategies are:

       * ``filesystem``: uses the file system watcher strategy
       * ``periodic``: uses the last modified value of a project for checking changes
         on project configuration. Convenient on atypical file systems, such as NFS,
	 or when the project file is stored in a database system like PostgreSQL.
       * ``off``: disables internal cache invalidation completely
     - filesystem
     - All

   * - .. _qgis_server_service_url:

       QGIS_SERVER_SERVICE_URL
     - This is an option to set the service URL if it is not present in the project.

       The service URL is defined from (in order of precedence):

       * Value defined in the project per service
       * The ``QGIS_SERVER_<service>_SERVICE_URL`` environment variable
       * The ``QGIS_SERVER_SERVICE_URL`` environment variable
       * The ``X-Qgis-<service>-Service-Url`` header
       * The ``X-Qgis-Service-Url`` header
       * Build from the ``Forwarded`` header
       * Build from the ``X-Forwarded-Host`` and ``X-Forwarded-Proto`` headers
       * Build from the ``Host`` header and the server protocol
       * Build from the server name and the server protocol.

       In the last four cases, the resulting Service URL is based on the ``MAP`` parameter
       provided in the query string and on the incoming path request.
     - ''
     - All

   * - QGIS_SERVER_SHOW_GROUP_SEPARATOR
     - Defines whether a group separator (e.g. thousand separator) should be used for
       numeric values (e.g. in GetFeatureInfo responses). The default value is ``0``.

       * ``0`` or ``false`` (case insensitive)
       * ``1`` or ``true`` (case insensitive)
     - false
     - WMS

   * - QGIS_SERVER_TRUST_LAYER_METADATA
     - This is an option at the project level to improve project read time by using the vector
       layer extents defined in the project metadata and disabling the check for
       PostgreSQL/PostGIS layer primary key uniqueness.

       Trusting layer metadata can be forced by setting this variable to ``1`` or ``true``.
       The vector layer's extent will then be the one defined in the project, and the
       PostgreSQL/PostGIS layer's primary key defined in the data source is
       considered as unique without a check.

       Do not use it if layers' extent is not fixed during the project's use.
     - false
     - All

   * - QGIS_SERVER_WCS_SERVICE_URL
     - This is an option to set the service URL if it is not present in the project.
       See :ref:`QGIS_SERVER_SERVICE_URL <qgis_server_service_url>` for more information.
     - ''
     - WCS

   * - QGIS_SERVER_WFS_SERVICE_URL
     - This is an option to set the service URL if it is not present in the project.
       See :ref:`QGIS_SERVER_SERVICE_URL <qgis_server_service_url>` for more information.
     - ''
     - WFS

   * - QGIS_SERVER_WMS_MAX_HEIGHT / QGIS_SERVER_WMS_MAX_WIDTH
     - Maximum height/width for a WMS request. The most conservative between this and the project one is used.
       If the value is ``-1``, it means that there is no maximum set.
     - -1
     - WMS

   * - QGIS_SERVER_WMS_SERVICE_URL
     - This is an option to set the service URL if it is not present in the project.
       See :ref:`QGIS_SERVER_SERVICE_URL <qgis_server_service_url>` for more information.
     - ''
     - WMS

   * - QGIS_SERVER_WMTS_SERVICE_URL
     - This is an option to set the service URL if it is not present in the project.
       See :ref:`QGIS_SERVER_SERVICE_URL <qgis_server_service_url>` for more information.
     - ''
     - WMTS

   * - QUERY_STRING
     - The query string, normally passed by the web server. This variable can be
       useful while testing QGIS server binary from the command line.

       For example for testing a GetCapabilities request on the command line
       to a project that also requires a PostgreSQL connection defined in a
       pg_service.conf file:

       .. code-block:: bash

        PGSERVICEFILE=/etc/pg_service.conf \
	QUERY_STRING="MAP=/home/projects/world.qgs&SERVICE=WMS&REQUEST=GetCapabilities" \
	/usr/lib/cgi-bin/qgis_mapserv.fcgi

       The result should be either the content of the GetCapabilities response or,
       if something is wrong, an error message.
     - ''
     - All


Settings summary
================

When QGIS Server is starting, you have a summary of all configurable parameters
thanks to environment variables. Moreover, the value currently used and
the origin is also displayed.

For example with spawn-fcgi:

.. code-block:: bash

 export QGIS_OPTIONS_PATH=/home/user/.local/share/QGIS/QGIS3/profiles/default/
 export QGIS_SERVER_LOG_STDERR=1
 export QGIS_SERVER_LOG_LEVEL=2
 spawn-fcgi -f /usr/lib/cgi-bin/qgis_mapserv.fcgi -s /tmp/qgisserver.sock -U www-data -G www-data -n

  QGIS Server Settings:

    - QGIS_OPTIONS_PATH / '' (Override the default path for user configuration): '/home/user/.local/share/QGIS/QGIS3/profiles/default/' (read from ENVIRONMENT_VARIABLE)

    - QGIS_SERVER_PARALLEL_RENDERING / '/qgis/parallel_rendering' (Activate/Deactivate parallel rendering for WMS getMap request): 'true' (read from INI_FILE)

    - QGIS_SERVER_MAX_THREADS / '/qgis/max_threads' (Number of threads to use when parallel rendering is activated): '4' (read from INI_FILE)

    - QGIS_SERVER_LOG_LEVEL / '' (Log level): '2' (read from ENVIRONMENT_VARIABLE)

    - QGIS_SERVER_LOG_STDERR / '' (Activate/Deactivate logging to stderr): '1' (read from ENVIRONMENT_VARIABLE)

    - QGIS_PROJECT_FILE / '' (QGIS project file): '' (read from DEFAULT_VALUE)

    - MAX_CACHE_LAYERS / '' (Specify the maximum number of cached layers): '100' (read from DEFAULT_VALUE)

    - QGIS_SERVER_CACHE_DIRECTORY / '/cache/directory' (Specify the cache directory): '/root/.local/share/QGIS/QGIS3/profiles/default/cache' (read from DEFAULT_VALUE)

    - QGIS_SERVER_CACHE_SIZE / '/cache/size' (Specify the cache size): '52428800' (read from INI_FILE)

  Ini file used to initialize settings: /home/user/.local/share/QGIS/QGIS3/profiles/default/QGIS/QGIS3.ini

In this particular case, we know that **QGIS_SERVER_MAX_THREADS** and
**QGIS_SERVER_PARALLEL_RENDERING** values are read from the ini file found in
**QGIS_OPTIONS_PATH** directory (which is defined through an environment variable).
The corresponding entries in the ini file are **/qgis/max_threads** and
**/qgis/parallel_rendering** and their values are **true** and **4** threads.


Connection to service file
==========================

In order to make apache aware of the PostgreSQL service file (see the
:ref:`pg-service-file` section) you need to make
your :file:`*.conf` file look like:

.. code-block:: apache

   SetEnv PGSERVICEFILE /home/web/.pg_service.conf

   <Directory "/home/web/apps2/bin/">
     AllowOverride None
   .....


.. _add_fonts:

Add fonts to your linux server
==============================

Keep in mind that you may use QGIS projects that point to fonts that
may not exist by default on other machines. This means that if you share the project,
it may look different on other machines (if the fonts don't exist on the target machine).

In order to ensure this does not happen you just need to install the missing fonts on the target machine.
Doing this on desktop systems is usually trivial (double clicking the fonts).

For linux, if you don't have a desktop environment installed (or you prefer the command line) you need to:

* On Debian based systems:

  .. code-block:: bash

   sudo su
   mkdir -p /usr/local/share/fonts/truetype/myfonts && cd /usr/local/share/fonts/truetype/myfonts

   # copy the fonts from their location
   cp /fonts_location/* .

   chown root *
   cd .. && fc-cache -f -v

* On Fedora based systems:

  .. code-block:: bash

   sudo su
   mkdir /usr/share/fonts/myfonts && cd /usr/share/fonts/myfonts

   # copy the fonts from their location
   cp /fonts_location/* .

   chown root *
   cd .. && fc-cache -f -v
