.. index:: QGIS Server; WMS Server; WFS Server; WCS Server

.. _`label_qgisserver_tutorial`:

Lesson: Install QGIS Server
===============================================================================

**The goal for this lesson:** To learn how to install **QGIS Server** on Debian
Stretch. With negligible variations you can also follow it for
any Debian based distribution like Ubuntu and its derivatives.

.. note:: In Ubuntu you can use your regular user, prepending ``sudo`` to
  commands requiring admin permissions. In Debian you can work as admin (``root``),
  without using ``sudo``.

:abbr:`★★☆ (Moderate level)` Follow Along: Install from packages
-------------------------------------------------------------------------------

In this lesson we're going to do only the install from packages as shown
`here <https://qgis.org/en/site/forusers/alldownloads.html#linux>`_ .

Install QGIS Server with:

.. code-block:: bash

 apt install qgis-server --no-install-recommends --no-install-suggests

 # if you want to install server plugins, also:
 apt install python3-qgis

QGIS Server should be used in production without QGIS Desktop (with
the accompanying X Server) installed on the same machine.

:abbr:`★★☆ (Moderate level)` Follow Along: QGIS Server Executable
-------------------------------------------------------------------------------

The QGIS Server executable is ``qgis_mapserv.fcgi``. You can check where it has
been installed by running ``find / -name 'qgis_mapserv.fcgi'`` which
should output something like ``/usr/lib/cgi-bin/qgis_mapserv.fcgi``.

Optionally, if you want to do a command line test at this time you can run the
``/usr/lib/cgi-bin/qgis_mapserv.fcgi --version`` command which should output something
like:

::

 QGIS 3.21.0-Master 'Master' (1c70953f1e)
 QGIS code revision 1c70953f1e
 Qt version 5.15.2
 Python version 3.9.5
 GDAL/OGR version 3.2.2
 PROJ version 7.2.1
 EPSG Registry database version v10.008 (2020-12-16)
 GEOS version 3.9.0-CAPI-1.16.2
 SQLite version 3.34.1
 OS Ubuntu 21.04


We'll see later on how to make WMS requests.

:abbr:`★★★ (Advanced level)` HTTP Server Configuration
-------------------------------------------------------------------------------

In order to access on the installed QGIS server from an Internet Browser we need to use an HTTP server.
The Apache HTTP Server installation process is detailed in :ref:`httpserver` section.

.. note::

 If you installed QGIS Server without running an X Server (included in Linux
 Desktop) and if you also want to use the ``GetPrint`` command then you should
 install a fake X Server and tell QGIS Server to use it. You can do that by
 following the :ref:`Xvfb installation process <xvfb>`.


:abbr:`★★☆ (Moderate level)` Follow Along: Create another virtual host
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

In Conclusion
-------------------------------------------------------------------------------

You learned how to install different QGIS Server versions from packages,
how to configure Apache with QGIS Server, on Debian based Linux distros.

What's Next?
-------------------------------------------------------------------------------

Now that you've installed QGIS Server and it's accessible through the HTTP
protocol, we need to learn how to access some of the services it can offer.
The topic of the next lesson is to learn how to access QGIS Server WMS services.
