.. index:: QGIS Server; WMS Server; WFS Server; WCS Server

.. _`label_qgisserver_tutorial`:

|LS| Install QGIS Server
===============================================================================

**The goal for this lesson:** To learn how to install **QGIS Server** on Debian
Stretch. With negligible variations you can also follow it for any Debian based
distribution like Ubuntu and its derivatives.

|moderate| |FA| Install from packages
-------------------------------------------------------------------------------

In this lesson we're going to do only the install from packages as shown
`here <http://qgis.org/en/site/forusers/alldownloads.html#linux>`_ .

First add the QGIS repository by creating the
:file:`/etc/apt/sources.list.d/debian-qgis.list` file with the following
content:

.. code-block:: sourceslist

 # latest stable
 deb http://qgis.org/debian stretch main
 deb-src http://qgis.org/debian stretch main

After you add the qgis.org repository public key to your apt keyring (follow
the above link on how to do it) you can run the ``sudo apt-get update`` command
to refresh the packages list and ``sudo apt-get dist-upgrade`` to upgrade the
packages.

Install QGIS Server with:

.. code-block:: bash

 sudo apt-get install qgis-server python-qgis

Although QGIS Server should be used in production without QGIS Desktop (with
the accompagning X Server) installed on the same machine, we're going to
install it in this tutorial as it's easier for the audience:

.. code-block:: bash

 sudo apt-get install qgis

|moderate| |FA| QGIS Server Executable
-------------------------------------------------------------------------------

The QGIS Server executable is ``qgis_mapserv.fcgi``. You can check where it has
been installed by running ``sudo find / -name 'qgis_mapserv.fcgi'`` which
should output something like ``/usr/lib/cgi-bin/qgis_mapserv.fcgi``.

Optionally, if you want to do a command line test at this time you can run the
``/usr/lib/cgi-bin/qgis_mapserv.fcgi`` command which should output something
like:

.. code-block:: guess

 QFSFileEngine::open: No file name specified
 Warning 1: Unable to find driver ECW to unload from GDAL_SKIP environment variable.
 Warning 1: Unable to find driver ECW to unload from GDAL_SKIP environment variable.
 Warning 1: Unable to find driver JP2ECW to unload from GDAL_SKIP environment variable.
 Warning 1: Unable to find driver ECW to unload from GDAL_SKIP environment variable.
 Warning 1: Unable to find driver JP2ECW to unload from GDAL_SKIP environment variable.
 Content-Length: 206
 Content-Type: text/xml; charset=utf-8

 <ServiceExceptionReport version="1.3.0" xmlns="http://www.opengis.net/ogc">
  <ServiceException code="Service configuration error">Service unknown or unsupported</ServiceException>
 </ServiceExceptionReport>

This is a good thing, it tells you we're on the right track as the server is
saying that we haven't asked for a supported service. We'll see later on
how to make WMS requests.

|FA| HTTP Server Configuration
-------------------------------------------------------------------------------

In order to access on the installed QGIS server from an Internet Browser we
need to use a HTTP server.

In this lesson we're going to use the
`Apache HTTP server <http://httpd.apache.org>`_, colloquially called Apache.

First we need to install Apache by running the following command in a terminal:
``sudo apt-get install apache2 libapache2-mod-fcgid``.

Let's create a file called :file:`qgisplatform.demo.conf` in that directory
with this content:

.. code-block:: apacheconf

 <VirtualHost *:80>
   ServerAdmin webmaster@localhost
   ServerName qgisplatform.demo

   DocumentRoot /var/www/html

   # Apache logs (different than QGIS Server log)
   ErrorLog ${APACHE_LOG_DIR}/qgisplatform.demo.error.log
   CustomLog ${APACHE_LOG_DIR}/qgisplatform.demo.access.log combined

   # Longer timeout for WPS... default = 40
   FcgidIOTimeout 120

   FcgidInitialEnv LC_ALL "en_US.UTF-8"
   FcgidInitialEnv PYTHONIOENCODING UTF-8
   FcgidInitialEnv LANG "en_US.UTF-8"

   # QGIS log (different from apache logs) see http://docs.qgis.org/testing/en/docs/user_manual/working_with_ogc/ogc_server_support.html#qgis-server-logging
   FcgidInitialEnv QGIS_SERVER_LOG_FILE /logs/qgisserver.log
   FcgidInitialEnv QGIS_SERVER_LOG_LEVEL 0

   FcgidInitialEnv QGIS_DEBUG 1

   # default QGIS project
   SetEnv QGIS_PROJECT_FILE /home/qgis/projects/world.qgs

   # QGIS_AUTH_DB_DIR_PATH must lead to a directory writeable by the Server's FCGI process user
   FcgidInitialEnv QGIS_AUTH_DB_DIR_PATH "/home/qgis/qgisserverdb/"
   FcgidInitialEnv QGIS_AUTH_PASSWORD_FILE "/home/qgis/qgisserverdb/qgis-auth.db"

   # See http://docs.qgis.org/testing/en/docs/user_manual/working_with_vector/supported_data.html#pg-service-file
   SetEnv PGSERVICEFILE /home/qgis/.pg_service.conf
   FcgidInitialEnv PGPASSFILE "/home/qgis/.pgpass"

   # Tell QGIS Server instances to use a specific display number
   FcgidInitialEnv DISPLAY ":99"

   # if qgis-server is installed from packages in debian based distros this is usually /usr/lib/cgi-bin/
   # run "locate qgis_mapserv.fcgi" if you don't know where qgis_mapserv.fcgi is
   ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/
   <Directory "/usr/lib/cgi-bin/">
     AllowOverride None
     Options +ExecCGI -MultiViews -SymLinksIfOwnerMatch
     Order allow,deny
     Allow from all
     Require all granted
   </Directory>

  <IfModule mod_fcgid.c>
  FcgidMaxRequestLen 26214400
  FcgidConnectTimeout 60
  </IfModule>

 </VirtualHost>

You can do the above in a linux Desktop system by pasting and saving the above
configuration after doing ``sudo gedit /etc/apache2/sites-available/qgisplatform.demo.conf``.

.. note::

 See some of the configuration options in the Server
 :ref:`server_env_variables` section.

Let's now create the directories that will store the QGIS Server logs and
the authentication database:

.. code-block:: bash

 sudo mkdir /logs
 sudo chown www-data:www-data /logs

 mkdir /home/qgis/qgisserverdb
 sudo chown www-data:www-data /home/qgis/qgisserverdb

.. note::

 ``www-data`` is the Apache user on Debian based systems and we need Apache to have access to
 those locations or files.
 The ``chown www-data...`` commands changes the owner of the respective directories/files
 to ``www-data``.

We can now enable the `virtual host <https://httpd.apache.org/docs/2.4/vhosts>`_,
enable the ``fcgid`` mod if it's not already enabled and restart the ``apache2.service``:

.. code-block:: bash

 sudo a2enmod fcgid
 sudo a2ensite qgisplatform.demo.conf
 sudo systemctl restart apache2.service

.. note::

 If you installed QGIS Server without running an X Server (included in Linux
 Desktop) and if you also want to use the ``GetPrint`` command then you should
 install a fake X Server and tell QGIS Server to use it. You can do that by
 running the following commands.

 Install xvfb with ``sudo apt-get install xvfb -y``

 Create the service file:

 .. code-block:: bash

  sudo sh -c \
  "echo \
  '[Unit]
  Description=X Virtual Frame Buffer Service
  After=network.target

  [Service]
  ExecStart=/usr/bin/Xvfb :99 -screen 0 1024x768x24 -ac +extension GLX +render -noreset

  [Install]
  WantedBy=multi-user.target' \
  > /etc/systemd/system/xvfb.service"

 Enable, start and check the status of the ``xvfb.service``:

 .. code-block:: bash

   sudo systemctl enable xvfb.service
   sudo systemctl start xvfb.service
   sudo systemctl status xvfb.service

 In the above configuration file there's a ``FcgidInitialEnv DISPLAY ":99"``
 that tells QGIS Server instances to use display no. 99. If you're running the
 Server in Desktop then there's no need to install xvfb and you should simply
 comment with ``#`` this specific setting in the configuration file.
 More info at http://www.itopen.it/qgis-server-setup-notes/.

Now that Apache knows that he should answer requests to http://qgisplatform.demo
we also need to setup the linux system so that it knows who ``qgisplatform.demo``
is. We do that by adding ``127.0.0.1 qgisplatform.demo`` in the
`hosts <https://en.wikipedia.org/wiki/Hosts_%28file%29>`_ file. We can do it
with ``sudo sh -c "echo '127.0.0.1 qgisplatform.demo' >> /etc/hosts"``.

We can test one of the installed qgis servers with a http request from command
line with ``curl http://qgisplatform.demo/cgi-bin/qgis_mapserv.fcgi`` which
should output:

.. code-block:: xml

  <ServiceExceptionReport version="1.3.0" xmlns="http://www.opengis.net/ogc">
  <ServiceException code="Service configuration error">Service unknown or unsupported</ServiceException>
  </ServiceExceptionReport>

.. note::

 curl can be installed with ``sudo apt-get install curl -y``.

Apache is now configured.

|moderate| |TY| Create another virtual host
-------------------------------------------------------------------------------

Let's create another Apache virtual host pointing to QGIS Server. You can
choose whatever name you like (``coco.bango``, ``super.duper.training``,
``example.com``, etc.) but for simplicity sake we're going to use ``myhost``.

* Let's set up the ``myhost`` name to point to the localhost IP by adding
  ``127.0.0.1 x`` to the :file:`/etc/hosts` with the following command:
  ``sudo sh -c "echo '127.0.0.1 myhost' >> /etc/hosts"`` or by manually
  editing the file with ``sudo gedit /etc/hosts``.
* We can check that ``myhost`` points to the localhost by running in the terminal
  the  ``ping myhost`` command which should output:

  .. code-block:: guess

   qgis@qgis:~$ ping myhost
   PING myhost (127.0.0.1) 56(84) bytes of data.
   64 bytes from localhost (127.0.0.1): icmp_seq=1 ttl=64 time=0.024 ms
   64 bytes from localhost (127.0.0.1): icmp_seq=2 ttl=64 time=0.029 ms
   ..

* Let's try if we can access QGIS Server from the ``myhost`` site by doing:
  ``curl http://myhost/cgi-bin/qgis_mapserv.fcgi`` or by accessing the url from
  your Debian box browser. You will probably get:

  .. code-block:: html

   <!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
   <html><head>
   <title>404 Not Found</title>
   </head><body>
   <h1>Not Found</h1>
   <p>The requested URL /cgi-bin/qgis_mapserv.fcgi was not found on this server.</p>
   <hr>
   <address>Apache/2.4.25 (Debian) Server at myhost Port 80</address>
   </body></html>

* Apache doesn't know that he's supposed to answer requests pointing to the server
  named ``myhost``. In order to setup the virtual host the simplest way would
  be to make a ``myhost.conf`` file in the :file:`/etc/apache/sites-available`
  directory that has the same content as file:`qgisplatform.demo.conf` except
  for the ``ServerName`` line that should be ``ServerName myhost``. You could
  also change where the logs go as otherwise the logs for the two virtual hosts
  would be shared but this is optional.
* Let's now enable the virtual host with ``sudo apt-get a2ensite myhost.conf``
  and then reload the Apache service with ``sudo systemctl reload apache2``.
* If you try again to access the http://myhost/cgi-bin/qgis_mapserv.fcgi url
  you'll notice everything is working now!

  .. note::

   Remember that both the :file:`myhost.conf` and :file:`/etc/hosts` files should
   be configured for our setup to work.
   You can also test the access to your QGIS Server from other clients on the
   network (e.g. Windows or Macos machines) by going to their :file:`/etc/hosts`
   file and point the `myhost` name to whatever IP the server machine has on the
   network. You can be sure that that specific IP is not ``127.0.0.1`` as that's
   the local IP, only accessible from the local machine.

|IC|
-------------------------------------------------------------------------------

You learned how to install different QGIS Server versions from packages,
how to configure Apache with QGIS Server, on Debian based Linux distros.

|WN|
-------------------------------------------------------------------------------

Now that you've installed QGIS Server and it's accesible through the HTTP
protocol, we need to learn how to access some of the services it can offer.
The topic of the next lesson is to learn how to access QGIS Server WMS services.
