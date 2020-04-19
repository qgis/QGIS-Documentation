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

 mkdir -p /var/www/qgis-server/plugins
 cd /var/www/qgis-server/plugins
 wget https://github.com/elpaso/qgis-helloserver/archive/master.zip
 unzip master.zip
 mv qgis-helloserver-master HelloServer


HTTP Server configuration
=========================

Apache
~~~~~~

To be able to use server plugins, FastCGI needs to know where to look. So, we
have to modify the Apache configuration file to indicate the
**QGIS_PLUGINPATH** environment variable to FastCGI:

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
