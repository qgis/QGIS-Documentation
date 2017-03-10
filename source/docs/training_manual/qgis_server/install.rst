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
