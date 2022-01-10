*******
Plugins
*******

.. only:: html

   .. contents::
      :local:

List of plugins
===============

Plugins can also be installed on QGIS Server. They can add new features or alter existing ones from
QGIS Server.

Some plugins designed for server can be found on the official
`QGIS repository <https://plugins.qgis.org/plugins/server/>`_.

Location of plugins
===================

By default, on Debian based systems, QGIS Server will look for plugins located in
:file:`/usr/lib/qgis/plugins`. The default value is displayed when QGIS Server is starting, in the logs.
It's possible to set a custom path by defining the environment variable ``QGIS_PLUGINPATH``
in the web server configuration.

Installation
============

Manually with a ZIP
~~~~~~~~~~~~~~~~~~~

To install the **HelloWorld** example plugin for testing the server, using a specific
folder, you first have to create a directory to hold server plugins. This will be specified in
the virtual host configuration and passed on to the server through an
environment variable:

.. code-block:: bash

 mkdir -p /var/www/qgis-server/plugins
 cd /var/www/qgis-server/plugins
 wget https://github.com/elpaso/qgis-helloserver/archive/master.zip
 unzip master.zip
 mv qgis-helloserver-master HelloServer

With a command line tool
~~~~~~~~~~~~~~~~~~~~~~~~

If you need to install and regularly upgrade plugins which are stored in the QGIS plugin repository,
you may use the `QGIS-Plugin-Manager <https://github.com/3liz/qgis-plugin-manager>`_.
It's a tool to help you manage plugins from the command line.

The installation is using pip. Installing in a virtual environment is a good practice but not required:

.. code-block:: bash

 pip3 install qgis-plugin-manager

Then, you can use the ``qgis-plugin-manager`` executable from the command line:

.. code-block:: bash

 cd /var/www/qgis-server/plugins
 qgis-plugin-manager list

 QGIS server version 3.19.0
 List all plugins in /var/www/qgis-server/plugins

 ------------------------------------------------------------------------------------------------------------------------------------------------------
 |  Folder                  |  Name            |  Version  |  Experimental  |  QGIS min  |  QGIS max  |  Author                  |  Action ⚠          |
 ------------------------------------------------------------------------------------------------------------------------------------------------------
 |wfsOutputExtension        |wfsOutputExtension|1.6.2      |                |3.0         |            |3Liz                      |                    |
 |qgis_server_render_geojson|GeoJson Renderer  |v0.4       |                |3.4         |            |Matthias Kuhn (OPENGIS.ch)|                    |
 |DataPlotly                |Data Plotly       |3.7.1      |                |3.4         |3.98        |Matteo Ghetta (Faunalia)  |Upgrade to 3.8.1    |
 ------------------------------------------------------------------------------------------------------------------------------------------------------

We suggest you to read the full documentation in the
`readme file <https://github.com/3liz/qgis-plugin-manager/blob/master/README.md>`_ to know how to install or
upgrade plugins with this tool.

HTTP Server configuration
=========================

Apache
~~~~~~

To be able to use server plugins, FastCGI needs to know where to look. So, we
have to modify the Apache configuration file to indicate the
``QGIS_PLUGINPATH`` environment variable to FastCGI:

.. code-block:: apache

    FcgidInitialEnv QGIS_PLUGINPATH "/var/www/qgis-server/plugins"

Moreover, a basic HTTP authorization is necessary to play with the HelloWorld
plugin previously introduced. So we have to update the Apache configuration file
a last time:

.. code-block:: apache

    # Needed for QGIS HelloServer plugin HTTP BASIC auth
    <IfModule mod_fcgid.c>
        RewriteEngine on
        RewriteCond %{HTTP:Authorization} .
        RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]
    </IfModule>

Then, restart Apache:

.. code-block:: bash

 systemctl restart apache2 

How to use a plugin
===================

Test the server with the HelloWorld plugin:

.. code-block:: bash

 wget -q -O - "http://localhost/cgi-bin/qgis_mapserv.fcgi?SERVICE=HELLO"
  HelloServer!

You can have a look at the default GetCapabilities of the QGIS server at:

::

 http://localhost/cgi-bin/qgis_mapserv.fcgi?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetCapabilities
