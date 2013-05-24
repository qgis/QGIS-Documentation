
.. _QGIS-download:

================
Download QGIS
================

How to obtain QGIS?

QGIS is freely available on Windows, Linux, MacOS X, BSD, and Android.

Recommendend installers
------------------------

Windows
........

`Double-click installer <http://qgis.org/downloads/QGIS-OSGeo4W-1.8.0-2-Setup.exe>`_

`Virus check results <http://www.garyshood.com/virus/results.php?r=737a37f767c0b8d19a19e5360b467d62>`_

Linux
...............

Most linux distributions split QGIS into several packages; you can decide not to install qgis-python, qgis-grass (or qgis-plugin-grass), or qgis-mapserver if you do not need it.

Ubuntu
+++++++++

Get packages from the ubuntugis project for i386 and amd64 adding the appropriate lines to /etc/apt/sources.list:

Lucid::

 deb     http://qgis.org/debian lucid main
 deb-src http://qgis.org/debian lucid main

Natty::

 deb     http://qgis.org/debian natty main
 deb-src http://qgis.org/debian natty main

Oneiric::

 deb     http://qgis.org/debian oneiric main
 deb-src http://qgis.org/debian oneiric main

Precise::

 deb     http://qgis.org/debian precise main
 deb-src http://qgis.org/debian precise main

To add the the qgis.org repository public key to your apt keyring, type::

 gpg --keyserver keyserver.ubuntu.com --recv 997D3880
 gpg --export --armor 997D3880 | sudo apt-key add -

Add also updated dependencies by typing::

 sudo apt-get install python-software-properties
 sudo add-apt-repository ppa:ubuntugis/ubuntugis-unstable
 sudo apt-get update
 sudo apt-get install qgis python-qgis qgis-plugin-grass

Debian
+++++++++

Packages for Debian *Squeeze, Wheezy and Unstable* for i386 and amd64 are available at:

Squeeze::

 deb     http://qgis.org/debian squeeze main
 deb-src http://qgis.org/debian squeeze main

Wheezy::

 deb     http://qgis.org/debian wheezy main
 deb-src http://qgis.org/debian wheezy main

Unstable::

 deb     http://qgis.org/debian sid main
 deb-src http://qgis.org/debian sid main

To add the the http://qgis.org repository public key to your apt keyring, type::

 gpg --recv-key 997D3880
 gpg --export --armor 997D3880 | sudo apt-key add -

Then add the lines for one of the repositories to your ``/etc/apt/sources.list`` file (see below to choose the appropriate one) and type::

 sudo apt-get update
 sudo apt-get install qgis python-qgis qgis-plugin-grass

.. note:: Please remove all the QGIS and GRASS packages you may have installed from other repositories before doing the update.

Fedora
+++++++++++++

Get packages for Fedora 16 and 17 by typing::

 yum install qgis qgis-python qgis-grass qgis-mapserver

RHEL, CentOS, Scientific Linux, ...
+++++++++++++++++++++++++++++++++++++

Try the ELGIS repository: http://elgis.argeo.org/

.. note:: ELGIS requires the EPEL repo enabled, see http://wiki.osgeo.org/wiki/Enterprise_Linux_GIS#Note_about_Fedora.2C_ELGIS_and_EPEL

openSUSE
++++++++++++++++++

openSUSE packages for 11.2, 11.3, 11.4, 12.1, Factory Tumbleweed and SLE11 (32 and 64bit). Add the following repository to your installation manager. All packages include GRASS and Python support.

http://download.opensuse.org/repositories/Application:/Geo/<version>/

Mandriva
++++++++++++++++

Current::

 urpmi qgis-python qgis-grass

Slackware
+++++++++++++++++

Packages on http://qgis.gotslack.org

MacOS X
.............

Installing in OS X requires separate installation of `dependency frameworks <http://www.kyngchaos.com/software/frameworks>`_ (GDAL Complete and GSL). GRASS http://www.kyngchaos.com/software/grass is supported with this version.
Some common Python modules http://www.kyngchaos.com/software/python available for QGIS plugin requirements.
Single installer package are available for both OS X Lion (10.7) and Snow Leopard (10.6).

QGIS download page on KyngChaos http://www.kyngchaos.com/software/qgis (framework requirements listed here).

Android
.............

Alpha and nightly builds as well as further documentation can be obtained at http://android.qgis.org

freeBSD
.............

To compile QGIS from binary packages type::

 pkg_add -r qgis

Development version
----------------------

**Warning**: Development versions from master are provided for some platforms in addition to the released version. *Master* contains unreleased software that is currently being worked on. As such they are unsupported and only provided for testing purposes to early adopters to check if bugs have been resolved and that no new bugs have been introduced. At any given time it may not work, or may do bad things to your data. Use at your own risk. You have been warned!

Windows
........

**OSGeo4W Installer**: The OSGeo4W repository contains a lot of software from OSGeo projects. QGIS and all dependencies are included, along with Python, GRASS, GDAL, etc. The installer is able to install from internet or just download all needed packages beforehand. The downloaded files are kept in a local directory for future installations. Steps are:

* Download OSGEO4W Installer
* Start it
* Select **Advanced Install** and then the *qgis-dev* package from the Desktop section. Also other libraries can be selected.

Linux
...............

Ubuntu
+++++++++++++

* On plain ubuntu

Nightly builds of the Master are available from following repository (i386 and amd64):

Precise::

 deb     http://qgis.org/debian-nightly precise main
 deb-src http://qgis.org/debian-nightly precise main

Quantal::

 deb     http://qgis.org/debian-nightly quantal main
 deb-src http://qgis.org/debian-nightly quantal main

To add the the qgis.org repository public key to your apt keyring, type::

 gpg --keyserver keyserver.ubuntu.com --recv 997D3880
 gpg --export --armor 997D3880 | sudo apt-key add -

* ubuntugis

There are also nightly builds that depend on updated dependencies found in ubuntugis:

Lucid::

 deb     http://qgis.org/ubuntugis-nightly lucid main
 deb-src http://qgis.org/ubuntugis-nightly lucid main
 deb     http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu lucid main

Oneiric::

 deb     http://qgis.org/ubuntugis-nightly oneiric main
 deb-src http://qgis.org/ubuntugis-nightly oneiric main
 deb     http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu oneiric main

Precise::

 deb     http://qgis.org/ubuntugis-nightly precise main
 deb-src http://qgis.org/ubuntugis-nightly precise main
 deb     http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu precise main

To add the the qgis.org repository public key to your apt keyring, type::

 gpg --keyserver keyserver.ubuntu.com --recv 997D3880
 gpg --export --armor 997D3880 | sudo apt-key add -

Debian
+++++++++++

Nightly builds of the Master are available from following repository (i386 and amd64):

Squeeze::

 deb     http://qgis.org/debian-nightly squeeze main
 deb-src http://qgis.org/debian-nightly squeeze main

Wheezy::

 deb     http://qgis.org/debian-nightly wheezy main
 deb-src http://qgis.org/debian-nightly wheezy main

Unstable::

 deb     http://qgis.org/debian-nightly sid main
 deb-src http://qgis.org/debian-nightly sid main

Although the nightly builds can be used to test newer versions, they are mainly meant to test, if the newer qgis versions still build fine on the various distributions using the various (older) versions of libraries found there. Therefore it is not intended to build versions that depend on more current libraries. That means if you need current qgis version with more uptodate libraries you will have to build them yourself.

Fedora
+++++++++++

A newer version might be available in the testing repository -- usually around one week::

 yum install --enablerepo=updates-testing qgis qgis-python qgis-grass qgis-mapserver

RHEL, CentOS, Scientific Linux, ...
+++++++++++++++++++++++++++++++++++++

If you want to try the cutting edge: http://elgis.argeo.org/repos/testing/6/elgis/

They're happy if you provide feedback on their mailing list.

If it does not work for you, you can try to rebuild the Fedora SRPM. The Fedora 15 version of QGIS builds in Mock for EPEL 6. Notice, this package will not support GRASS, because there is no GRASS package in RHEL/EPEL.

argeo.org has a wiki on rebuilding their packages. For a more general quick guide in rebuilding, you can also take a look at http://zabbix.org/wiki/Docs/howto/rebuild_rpms

More info from: Volker Fröhlich <volker27 AT gmx DOT at>

Mac OS X
.................

KyngChaos Qgis download page http://www.kyngchaos.com/software/qgis

Requirements and support same as for Mac OS X Release, above. Builds for OS X Mountain Lion (10.8) and OS X Lion (10.7), and separate one for OS X Snow Leopard (10.6). All are compiled for 64-bit Macs.

Nightly build at http://qgis.dakotacarto.com provided by Dakota Cartography.

freeBSD
.............

To compile QGIS from sources in FreeBSD you need to type::

 cd /usr/ports/graphics/qgis
 make install clean
