*******
Plugins
*******

.. only:: html

   .. contents::
      :local:


Installation
============

To install the HelloWorld example plugin for testing the servers, you firstly
have to create a directory to hold server plugins. This will be specified in
the virtual host configuration and passed on to the server through an
environment variable:

.. code-block:: bash

 sudo mkdir -p /opt/qgis-server/plugins
 cd /opt/qgis-server/plugins
 sudo wget https://github.com/elpaso/qgis-helloserver/archive/master.zip
 In case unzip was not installed before:
 sudo apt install unzip
 sudo unzip master.zip
 sudo mv qgis-helloserver-master HelloServer


HTTP Server configuration
=========================

Apache
~~~~~~

To be able to use server plugins, FastCGI needs to know where to look. So, we
have to modify the Apache configuration file to indicate the
**QGIS_PLUGINPATH** environment variable to FastCGI:

.. code-block:: apache

    FcgidInitialEnv QGIS_SERVER_LOG_FILE /tmp/qgis-000.log
    FcgidInitialEnv QGIS_SERVER_LOG_LEVEL 0
    FcgidInitialEnv QGIS_PLUGINPATH "/opt/qgis-server/plugins"

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

 sudo a2ensite 001-qgis-server
 sudo service apache2 restart

.. tip::

   If you work with a feature that has many nodes then modifying and adding a
   new feature will fail. In this case it is possible to insert the following
   code into the :file:`001-qgis-server.conf` file:

   .. code-block:: apache

     <IfModule mod_fcgid.c>
     FcgidMaxRequestLen 26214400
     FcgidConnectTimeout 60
     </IfModule>

How to use a plugin
===================

Test the server with the HelloWorld plugin:

.. code-block:: bash

 wget -q -O - "http://localhost/cgi-bin/qgis_mapserv.fcgi?SERVICE=HELLO"
  HelloServer!

You can have a look at the default GetCapabilities of the QGIS server at:
:file:`http://localhost/cgi-bin/qgis_mapserv.fcgi?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetCapabilities`
