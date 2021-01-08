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

 apt install qgis-server
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

|hard| HTTP Server Configuration
-------------------------------------------------------------------------------

In order to access on the installed QGIS server from an Internet Browser we need to use an HTTP server.
The Apache HTTP Server installation process is detailed in :ref:`httpserver` section.

.. note::

 If you installed QGIS Server without running an X Server (included in Linux
 Desktop) and if you also want to use the ``GetPrint`` command then you should
 install a fake X Server and tell QGIS Server to use it. You can do that by
 following the :ref:`Xvfb installation process <xvfb>`.


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
.. |hard| image:: /static/common/hard.png
