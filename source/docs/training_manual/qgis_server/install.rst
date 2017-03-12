.. index:: QGIS Server; WMS Server; WFS Server; WCS Server

.. _`label_qgisserver_tutorial`:

|LS| Install QGIS Server
===============================================================================

**The goal for this lesson:** To learn how to install **QGIS Server** on Debian
Stretch. With negligible variations you can also follow it for any Debian based
distribution like Ubuntu and its derivatives.

Install Options
---------------

As on other systems, among the main methods to install **QGIS Server** on
GNU/Linux are the following:

* **install from packages**

  The greatest advantage installing from packages is easyness. Another derived
  advantage is that is far easier to keep deployment consistency. By having the
  same GNU/Linux flavor pointing to the same software repositories users have
  obvious advantages: they can share workflows, narrow down problems etc. far
  easier than otherwise.

  There are also disadvantages. You may have a GNU/linux distribution that
  doesn't provide QGIS in its software repositories. Also, due to licensing
  purposes some proprietary third party libraries cannot be provided with the
  other QGIS packages so you're stuck with building from source.

* **build from source**

  This provides the most flexible way of installing QGIS. Although it has the
  disadvantage of being a little harder once you get used to the process you
  have multiple advantages. For example, if you want to connect to Oracle,
  ECW or MrSid data sources on your GNU/Linux box you need to build from source
  as the software repositories don't provide binaries for these proprietary
  third party libraries. Another advantage would be that you can install and
  run multiple versions of QGIS (consequently QGIS Server) at the same time.
  Also, you can build QGIS on top of other components versions (e.g. newer
  GDAL, GEOS etc.) which could get you new features or help you narrow down
  bugs. Furthermore, if you're a developper and you want to do some changes
  to the code or you want to test some code from others or go to a certain
  code version, building from source is the way to go.

Install from packages
---------------------

In this lesson we're going to do only the install from packages as building
from source is outside the scope of this module.

First add the QGIS repository by creating the
:file:`/etc/apt/sources.list.d/debian-qgis.list` file with the following
content::

 # latest stable
 deb http://qgis.org/debian stretch main
 deb-src http://qgis.org/debian stretch main

 # latest ltr
 #deb http://qgis.org/debian-ltr stretch main
 #deb-src http://qgis.org/debian-ltr stretch main

 # master
 #deb http://qgis.org/debian-nightly stretch main
 #deb-src http://qgis.org/debian-nightly stretch main

.. note::

 One way of creating the above file is to run a terminal, then type in it
 ``sudo gedit /etc/apt/sources.list.d/debian-qgis.list``, which opens the
 gedit text editor. Add the content in the editor window and save.

.. note::

 In the above example the latest QGIS stable repository is active, while the
 others are disabled (commented out with ``#``).
 This is for exemplification purposes. Depending on which QGIS version you want you can
 comment out the latest stable repo and enable another one. You can find more on the
 available options `here <http://qgis.org/en/site/forusers/alldownloads.html#linux>`_ .
 If you're using Debian Jessie then you could simply replace ``stretch`` with ``jessie``
 in the above file.

Run these commands to add the qgis.org repository public key to your apt keyring::

 sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key 073D307A618E5811

You can now run the ``sudo apt-get update`` command to refresh the packages list and
``sudo apt-get dist-upgrade`` to upgrade the packages.

Install QGIS Server with::

 sudo apt-get install qgis-server python-qgis

.. note::

 If you play around and change different versions of QGIS you may end up in the
 situation where the QGIS version is newer than the one you want to install.
 For example, you tested the ``2.18`` version but you want the ``2.14`` version.
 In this case, simply doing a ``sudo apt-get install qgis-server python-qgis``
 won't work as the package manager may encounter dependencies problems when
 installing older versions of a package if there's a newer one already installed.
 So, you need to uninstall the existing one before installing the older one.
 Something like ``sudo apt-get uninstall qgis-server python-qgis`` should do it.

Although QGIS Server works without QGIS Desktop (with the accompagning X Server)
we're going to install it in this tutorial as it's easier for the audience::

 sudo apt-get install qgis

QGIS Server Test
----------------

The QGIS Server executable is ``qgis_mapserv.fcgi``. You can check where it has
been installed by running ``sudo find / -name 'qgis_mapserv.fcgi'`` which
should output something like ``/usr/lib/cgi-bin/qgis_mapserv.fcgi``.

Optionally, if you want to do a command line test at this time you can run ``/usr/lib/cgi-bin/qgis_mapserv.fcgi``
which should output something like::

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

This is a good thing, it tells you we're on the right track.

HTTP Server Configuration
-------------------------

In order to access on the WEB the installed QGIS server we need to use a http
server.

In this lesson we're going to use the
`Apache HTTP server <http://httpd.apache.org>`_, colloquially called Apache.

First we need to install Apache by doing
``sudo apt-get install apache2 libapache2-mod-fcgid`` in a terminal.

Let's create a file called :file:`qgisplatform.demo.conf` in that directory
with this content::

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

   # QGIS_AUTH_DB_DIR_PATH must lead to a directory writeable by the Server's FCGI process user
   FcgidInitialEnv QGIS_AUTH_DB_DIR_PATH "/home/qgis/qgiscustomserver/"
   FcgidInitialEnv QGIS_AUTH_PASSWORD_FILE "/home/qgis/qgiscustomserver/qgis-auth.db"

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

Let's now create the directories that will store the QGIS Server logs and
the authentication database::

 sudo mkdir /logs
 sudo chown www-data:www-data /logs
 
 mkdir /home/qgis/qgiscustomserver
 sudo chown www-data:www-data /home/qgis/qgiscustomserver

We can now enable the `virtual host <https://httpd.apache.org/docs/2.4/vhosts>`_,
enable the ``fcgid`` mod if it's not already enabled and restart the ``apache2.service``::

 sudo a2enmod fcgid
 sudo a2ensite qgisplatform.demo.conf
 sudo systemctl restart apache2.service

.. note::

 If you installed QGIS Server without running an X Server (included in Linux
 Desktop) and if you also want to use the ``GetPrint`` command then you should
 install a fake X Server and tell QGIS Server to use it. You can do that by
 running the following commands.
 
 Install xvfb with ``sudo apt-get install xvfb -y``

 Create the service file::

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
 
 Enable, start and check the status of the ``xvfb.service``::

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
is. We do that by adding ``127.0.0.1 qgisplatform.demo` in the
`hosts <https://en.wikipedia.org/wiki/Hosts_%28file%29>`_ file. We can do it by::

 sudo sh -c \
 "echo '127.0.0.1 qgisplatform.demo' >> /etc/hosts"

We can test one of the installed qgis servers with a http request from command
line with ``curl http://qgisplatform.demo/cgi-bin/qgis_mapserv.fcgi`` which
should output::

 <ServiceExceptionReport version="1.3.0" xmlns="http://www.opengis.net/ogc">
 <ServiceException code="Service configuration error">Service unknown or unsupported</ServiceException>
 </ServiceExceptionReport>

.. note::

 curl can be installed with ``sudo apt-get install curl -y``.

Apache is now configured.
