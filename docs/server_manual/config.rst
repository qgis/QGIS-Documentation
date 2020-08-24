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
variables:

- **QGIS_SERVER_LOG_LEVEL**
- **QGIS_SERVER_LOG_FILE**
- **QGIS_SERVER_LOG_STDERR**

Take a look on :ref:`qgis-server-envvar` to understand their meanings.


.. _`qgis-server-envvar`:

Environment variables
=====================

You can configure some aspects of QGIS Server by setting **environment
variables**.

According to the HTTP server and how you run QGIS Server, there are
several ways to define these variables. This is fully described in
:ref:`httpserver`.


QGIS_OPTIONS_PATH
^^^^^^^^^^^^^^^^^

Specifies the path to the directory with settings. It works the same way as
QGIS application ``--optionspath`` option. It is looking for settings file in
``<QGIS_OPTIONS_PATH>/QGIS/QGIS3.ini``.


QUERY_STRING
^^^^^^^^^^^^

The query string, normally passed by the web server. This variable can be
useful while testing QGIS server binary from the command line.

For example for testing a GetCapabilities request on the command line
to a project that also requires a PostgreSQL connection defined in a
pg_service.conf file:

.. code-block:: bash

 PGSERVICEFILE=/etc/pg_service.conf QUERY_STRING="MAP=/home/qgis/projects/world.qgs&SERVICE=WMS&REQUEST=GetCapabilities" /usr/lib/cgi-bin/qgis_mapserv.fcgi

The result should be either the content of the GetCapabilities response or,
if something is wrong, an error message.

QGIS_PROJECT_FILE
^^^^^^^^^^^^^^^^^

The ``.qgs`` or ``.qgz`` project file, normally passed as a parameter in the
query string (with *MAP*), you can also set it as an environment variable (for
example by using ``mod_rewrite`` Apache module).

Note that you may also indicate a project stored in PostgreSQL, e.g.
``postgresql://localhost:5432?sslmode=disable&dbname=mydb&schema=myschema&project=myproject``.


QGIS_SERVER_LOG_FILE
^^^^^^^^^^^^^^^^^^^^

Specify path and filename. Make sure that server has proper permissions for
writing to file. File should be created automatically, just send some requests
to server. If it's not there, check permissions.

QGIS_SERVER_LOG_FILE is deprecated since QGIS 3.4. File logging support will
be removed in QGIS 4.0.

QGIS_SERVER_LOG_STDERR
^^^^^^^^^^^^^^^^^^^^^^

Activate logging to stderr. It's disabled by default. This variable
has no effect when ``QGIS_SERVER_LOG_FILE`` is set.

* ``0`` or ``false`` (case insensitive)
* ``1`` or ``true`` (case insensitive)

MAX_CACHE_LAYERS
^^^^^^^^^^^^^^^^

Specify the maximum number of cached layers (default: ``100``).


DISPLAY
^^^^^^^

This is used to pass (fake) X server display number (needed on Unix-like systems).


QGIS_PLUGINPATH
^^^^^^^^^^^^^^^

Useful if you are using Python plugins for the server, this sets the folder
that is searched for Python plugins.


QGIS_SERVER_LOG_LEVEL
^^^^^^^^^^^^^^^^^^^^^

Specify desired log level. Available values are:

* ``0`` or ``INFO`` (log all requests)
* ``1`` or ``WARNING``
* ``2`` or ``CRITICAL`` (log just critical errors, suitable for production purposes)


QGIS_SERVER_PARALLEL_RENDERING
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Activates parallel rendering for WMS GetMap requests. It's disabled (``false``)
by default. Available values are:

* ``0`` or ``false`` (case insensitive)
* ``1`` or ``true`` (case insensitive)


QGIS_SERVER_MAX_THREADS
^^^^^^^^^^^^^^^^^^^^^^^

Number of threads to use when parallel rendering is activated. Default value
is ``-1`` to use the number of processor cores.


QGIS_SERVER_CACHE_DIRECTORY
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Specifies the network cache directory on the filesystem. The default
directory is named ``cache`` and located in the profile directory.


QGIS_SERVER_CACHE_SIZE
^^^^^^^^^^^^^^^^^^^^^^

Sets the network cache size in MB. The default value is ``50`` MB.


QGIS_SERVER_OVERRIDE_SYSTEM_LOCALE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Sets LOCALE to be used by QGIS server. The default value is empty (no override).

Example: ``de_CH.utf8``


QGIS_SERVER_SHOW_GROUP_SEPARATOR
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Defines whether a group separator (e.g. thousand separator) should be used for
numeric values (e.g. in GetFeatureInfo responses). The default value is ``0``.

* ``0`` or ``false`` (case insensitive)
* ``1`` or ``true`` (case insensitive)


QGIS_SERVER_IGNORE_BAD_LAYERS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

"Bad" layers are layers that cannot be loaded. The default behavior of QGIS Server
is to consider the project as not available if it contains a bad layer.

The default behavior can be overridden by setting this variable to ``1`` or ``true``.
In this case, "bad" layers will just be ignored, and the project will be considered
valid and available.

QGIS_SERVER_TRUST_LAYER_METADATA
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This is an option at the project level to improve project read time by using the vector
layer extents defined in the project metadata and disabling the check for
PostgreSQL/PostGIS layer primary key uniqueness.

The trust layer metadata can be forced by setting this variable to ``1`` or ``true``.
In this case, the vector layer's extent will be the one defined in the project and Postgres/Postgis layers' primary key defined in the datasource are considered as unique without check.

Do not use it if layers' extent is not fixed during the project's use.


Settings summary
================

When QGIS Server is starting, you have a summary of all configurable parameters
thanks to environment variables. Moreover, the value currently used and
the origin is also displayed.

For example with spawn-fcgi:

.. code-block:: bash

 export QGIS_OPTIONS_PATH=/home/user/.local/share/QGIS/QGIS3/profiles/default/
 export QGIS_SERVER_LOG_FILE=/home/user/qserv.log
 export QGIS_SERVER_LOG_LEVEL=2
 spawn-fcgi -f /usr/lib/cgi-bin/qgis_mapserv.fcgi -s /tmp/qgisserver.sock -U www-data -G www-data -n

  QGIS Server Settings:

    - QGIS_OPTIONS_PATH / '' (Override the default path for user configuration): '/home/user/.local/share/QGIS/QGIS3/profiles/default/' (read from ENVIRONMENT_VARIABLE)

    - QGIS_SERVER_PARALLEL_RENDERING / '/qgis/parallel_rendering' (Activate/Deactivate parallel rendering for WMS getMap request): 'true' (read from INI_FILE)

    - QGIS_SERVER_MAX_THREADS / '/qgis/max_threads' (Number of threads to use when parallel rendering is activated): '4' (read from INI_FILE)

    - QGIS_SERVER_LOG_LEVEL / '' (Log level): '2' (read from ENVIRONMENT_VARIABLE)

    - QGIS_SERVER_LOG_FILE / '' (Log file): '/tmp/qserv.log' (read from ENVIRONMENT_VARIABLE)

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


Short name for layers, groups and project
=========================================

A number of elements have both a ``<Name>`` and a ``<Title>``.
The **Name** is a text string used for machine-to-machine
communication while the **Title** is for the benefit of humans.

For example, a dataset might have the descriptive Title
“Maximum Atmospheric Temperature” and be requested using the abbreviated
Name “ATMAX”. User can already set title for layers, groups and project.

OWS name is based on the name used in layer tree. This name is more a label
for humans than a name for machine-to-machine communication.

QGIS Server supports:

* short name line edits to layers properties
  You can change this by right clicking on a layer, choose
  :menuselection:`Properties --> Metadata tab --> Description --> Short name`.

* WMS data dialog to layer tree group (short name, title, abstract)

  By right clicking on a layer group and selecting the :guilabel:`Set Group WMS data` option you will get:

  .. _figure_group_wms_data:

  .. figure:: img/set_group_wms_data.png
     :align: center

     Set group WMS data dialog

* short name line edits to project properties - add a regexp validator
  ``"^[A-Za-z][A-Za-z0-9\._-]*"`` to short name line edit accessible through a
  static method
* add a regexp validator ``"^[A-Za-z][A-Za-z0-9\._-]*"`` to short name line
  edit accessible through a static method

  You can choose a short name for the project root by going to :menuselection:`Project properties -->
  OWS Server --> Service capabilities --> Short name`.

* add a ``TreeName`` element in the ``fullProjectSettings``

If a short name has been set for layers, groups or project it is used by
QGIS Sever as the layer name.

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
