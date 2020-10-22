.. index:: QGIS Server; WMS Server; WFS Server; WCS Server

.. _`label_qgisserver_tutorial`:

|LS| Install QGIS Server
===============================================================================

**The goal for this lesson:** To learn how to install **QGIS Server** on Debian
Stretch. With negligible variations you can also follow it for
any Debian based distribution like Ubuntu and its derivatives.

.. note:: In Ubuntu you can use your regular user, prepending ``sudo`` to
  commands requiring admin permissions. In Debian you can work as admin (``root``),
  without using ``sudo``.

|moderate| |FA| Install from packages
-------------------------------------------------------------------------------

In this lesson we're going to do only the install from packages as shown
`here <https://qgis.org/en/site/forusers/alldownloads.html#linux>`_ .

Install QGIS Server with:

.. code-block:: bash

 apt install qgis-server --no-install-recommends --no-install-suggests

 # if you want to install server plugins, also:
 apt install python-qgis

QGIS Server should be used in production without QGIS Desktop (with
the accompanying X Server) installed on the same machine.

|moderate| |FA| QGIS Server Executable
-------------------------------------------------------------------------------

The QGIS Server executable is ``qgis_mapserv.fcgi``. You can check where it has
been installed by running ``find / -name 'qgis_mapserv.fcgi'`` which
should output something like ``/usr/lib/cgi-bin/qgis_mapserv.fcgi``.

Optionally, if you want to do a command line test at this time you can run the
``/usr/lib/cgi-bin/qgis_mapserv.fcgi`` command which should output something
like:

::

 QFSFileEngine::open: No file name specified
 Warning 1: Unable to find driver ECW to unload from GDAL_SKIP environment variable.
 Warning 1: Unable to find driver ECW to unload from GDAL_SKIP environment variable.
 Warning 1: Unable to find driver JP2ECW to unload from GDAL_SKIP environment variable.
 Warning 1: Unable to find driver ECW to unload from GDAL_SKIP environment variable.
 Warning 1: Unable to find driver JP2ECW to unload from GDAL_SKIP environment variable.
 Content-Length: 206
 Content-Type: text/xml; charset=utf-8

 <ServiceExceptionReport version="1.3.0" xmlns="https://www.opengis.net/ogc">
  <ServiceException code="Service configuration error">Service unknown or unsupported</ServiceException>
 </ServiceExceptionReport>

This is a good thing, it tells you we're on the right track as the server is
saying that we haven't asked for a supported service. We'll see later on
how to make WMS requests.

|FA| HTTP Server Configuration
-------------------------------------------------------------------------------

In order to access on the installed QGIS server from an Internet Browser we
need to use an HTTP server.

In this lesson we're going to use the
`Apache HTTP server <https://httpd.apache.org>`_, colloquially called Apache.

First we need to install Apache by running the following command in a terminal::

 apt install apache2 libapache2-mod-fcgid

You can run QGIS server on your default website, or configure a virtualhost
specifically for this, as follows.

In the :file:`/etc/apache2/sites-available` directory let's create a file
called :file:`qgis.demo.conf`, with this content:

.. code-block:: apacheconf

 <VirtualHost *:80>
   ServerAdmin webmaster@localhost
   ServerName qgis.demo

   DocumentRoot /var/www/html

   # Apache logs (different than QGIS Server log)
   ErrorLog ${APACHE_LOG_DIR}/qgis.demo.error.log
   CustomLog ${APACHE_LOG_DIR}/qgis.demo.access.log combined

   # Longer timeout for WPS... default = 40
   FcgidIOTimeout 120

   FcgidInitialEnv LC_ALL "en_US.UTF-8"
   FcgidInitialEnv PYTHONIOENCODING UTF-8
   FcgidInitialEnv LANG "en_US.UTF-8"

   # QGIS log (different from apache logs) see https://docs.qgis.org/testing/en/docs/user_manual/working_with_ogc/ogc_server_support.html#qgis-server-logging
   FcgidInitialEnv QGIS_SERVER_LOG_FILE /var/log/qgis/qgisserver.log
   FcgidInitialEnv QGIS_SERVER_LOG_LEVEL 0

   FcgidInitialEnv QGIS_DEBUG 1

   # default QGIS project
   SetEnv QGIS_PROJECT_FILE /home/qgis/projects/world.qgs

   # QGIS_AUTH_DB_DIR_PATH must lead to a directory writeable by the Server's FCGI process user
   FcgidInitialEnv QGIS_AUTH_DB_DIR_PATH "/home/qgis/qgisserverdb/"
   FcgidInitialEnv QGIS_AUTH_PASSWORD_FILE "/home/qgis/qgisserverdb/qgis-auth.db"

   # See https://docs.qgis.org/testing/en/docs/user_manual/working_with_vector/supported_data.html#pg-service-file
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
configuration after doing ``nano /etc/apache2/sites-available/qgis.demo.conf``.

.. note:: See some of the configuration options are explained in the Server
 :ref:`server_env_variables` section.

Let's now create the directories that will store the QGIS Server logs and
the authentication database:

.. code-block:: bash

 mkdir /var/log/qgis/
 chown www-data:www-data /var/log/qgis

 mkdir /home/qgis/qgisserverdb
 chown www-data:www-data /home/qgis/qgisserverdb

.. note::

 ``www-data`` is the Apache user on Debian based systems and we need Apache to have access to
 those locations or files.
 The ``chown www-data...`` commands changes the owner of the respective directories and files
 to ``www-data``.

We can now enable the `virtual host <https://httpd.apache.org/docs/2.4/vhosts>`_,
enable the ``fcgid`` mod if it's not already enabled and restart the ``apache2`` service:

.. code-block:: bash

 a2enmod fcgid
 a2ensite qgis.demo
 systemctl restart apache2

.. note::

 If you installed QGIS Server without running an X Server (included in Linux
 Desktop) and if you also want to use the ``GetPrint`` command then you should
 install a fake X Server and tell QGIS Server to use it. You can do that by
 running the following commands.

 Install xvfb:

.. code-block:: bash

 apt install xvfb

Create the service file:

.. code-block:: bash

  sh -c \
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

   systemctl enable xvfb.service
   systemctl start xvfb.service
   systemctl status xvfb.service

In the above configuration file there's a ``FcgidInitialEnv DISPLAY ":99"``
that tells QGIS Server instances to use display no. 99. If you're running the
Server in Desktop then there's no need to install xvfb and you should simply
comment with ``#`` this specific setting in the configuration file.
More info at https://www.itopen.it/qgis-server-setup-notes/.

Now that Apache knows that he should answer requests to http://qgis.demo
we also need to setup the client system so that it knows who ``qgis.demo``
is. We do that by adding ``127.0.0.1 qgis.demo`` in the
`hosts <https://en.wikipedia.org/wiki/Hosts_%28file%29>`_ file. We can do it
with ``sh -c "echo '127.0.0.1 qgis.demo' >> /etc/hosts"``.
Replace ``127.0.0.1`` with the IP of your server.

.. note::

   Remember that both the :file:`myhost.conf` and :file:`/etc/hosts` files should
   be configured for our setup to work.
   You can also test the access to your QGIS Server from other clients on the
   network (e.g. Windows or macOS machines) by going to their :file:`/etc/hosts`
   file and point the ``myhost`` name to whatever IP the server machine has on the
   network. You can be sure that that specific IP is not ``127.0.0.1`` as that's
   the local IP, only accessible from the local machine.  On ``*nix`` machines the
   :file:`hosts` file is located in :file:`/etc`, while on Windows it's under
   the :file:`C:\\Windows\\System32\\drivers\\etc` directory. Under Windows you
   need to start your text editor with administrator privileges before opening
   the hosts file.

We can test one of the installed qgis servers with a http request from command
line with ``curl http://qgis.demo/cgi-bin/qgis_mapserv.fcgi`` which
should output:

.. code-block:: xml

  <ServiceExceptionReport version="1.3.0" xmlns="https://www.opengis.net/ogc">
  <ServiceException code="Service configuration error">Service unknown or unsupported</ServiceException>
  </ServiceExceptionReport>

.. note::

 curl can be installed with ``apt install curl``.

Apache is now configured.

Also, from your web browser you can check the capabilities of the server:

http://qgis.demo/cgi-bin/qgis_mapserv.fcgi?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetCapabilities

|moderate| |FA| Create another virtual host
-------------------------------------------------------------------------------

Let's create another Apache virtual host pointing to QGIS Server. You can
choose whatever name you like (``coco.bango``, ``super.duper.training``,
``example.com``, etc.) but for simplicity sake we're going to use ``myhost``.

* Let's set up the ``myhost`` name to point to the localhost IP by adding
  ``127.0.0.1 x`` to the :file:`/etc/hosts` with the following command:
  ``sh -c "echo '127.0.0.1 myhost' >> /etc/hosts"`` or by manually
  editing the file with ``gedit /etc/hosts``.
* We can check that ``myhost`` points to the localhost by running in the terminal
  the  ``ping myhost`` command which should output:

.. code-block:: bash

   qgis@qgis:~$ ping myhost
   PING myhost (127.0.0.1) 56(84) bytes of data.
   64 bytes from localhost (127.0.0.1): icmp_seq=1 ttl=64 time=0.024 ms
   64 bytes from localhost (127.0.0.1): icmp_seq=2 ttl=64 time=0.029 ms

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
  be to make a ``myhost.conf`` file in the :file:`/etc/apache2/sites-available`
  directory that has the same content as :file:`qgis.demo.conf` except
  for the ``ServerName`` line that should be ``ServerName myhost``. You could
  also change where the logs go as otherwise the logs for the two virtual hosts
  would be shared but this is optional.
* Let's now enable the virtual host with ``a2ensite myhost.conf``
  and then reload the Apache service with ``service apache2 reload``.
* If you try again to access the http://myhost/cgi-bin/qgis_mapserv.fcgi url
  you'll notice everything is working now!

|IC|
-------------------------------------------------------------------------------

You learned how to install different QGIS Server versions from packages,
how to configure Apache with QGIS Server, on Debian based Linux distros.

|WN|
-------------------------------------------------------------------------------

Now that you've installed QGIS Server and it's accessible through the HTTP
protocol, we need to learn how to access some of the services it can offer.
The topic of the next lesson is to learn how to access QGIS Server WMS services.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |FA| replace:: Follow Along:
.. |IC| replace:: In Conclusion
.. |LS| replace:: Lesson:
.. |WN| replace:: What's Next?
.. |moderate| image:: /static/common/moderate.png
