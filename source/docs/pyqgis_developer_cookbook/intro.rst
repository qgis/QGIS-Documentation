.. only:: html


.. _introduction:

************
Introduction
************

This document is intended to be both a tutorial and a reference
guide. While it does not list all possible use cases, it should
give a good overview of the principal functionality.

.. contents::
   :local:

Python support was first introduced in QGIS 0.9.
Today, there are several ways to use Python in QGIS Desktop, they
are covered in the following sections:

* Issue commands in the Python console within QGIS
* Create and use plugins
* Automatically run Python code when QGIS starts
* Create custom applications based on the QGIS API

Python bindings are also available for QGIS Server, including
Python plugins (see :ref:`server_plugins`)
and Python bindings that can be used to embed QGIS Server into a
Python application.

.. index:: API

There is a `complete QGIS API <https://qgis.org/api/>`_ reference that
documents the classes from the QGIS libraries. `The Pythonic QGIS API
(pyqgis) <https://qgis.org/pyqgis>`_ is nearly identical to the C++ API.

A good resource for learning how to perform common tasks is to
download existing plugins from the
`plugin repository <https://plugins.qgis.org/>`_ and examine their
code.

.. index::
  pair: Python; Console

.. _pythonconsole:

Scripting in the Python Console
===============================

QGIS provides an integrated :ref:`Python console <console>` for scripting.
It can be opened from the :menuselection:`Plugins --> Python Console` menu:

.. figure:: img/console.png
   :align: center
   :width: 40em

   QGIS Python console

The screenshot above illustrates how to get the layer currently
selected in the layer list, show its ID and optionally, if it is a
vector layer, show the feature count.
For interaction with the QGIS environment, there is a :data:`iface`
variable, which is an instance of :class:`QgisInterface <qgis.gui.QgisInterface>`. This
interface allows access to the map canvas, menus, toolbars and other
parts of the QGIS application. 

For user convenience, the following statements are executed
when the console is started (in the future it will be possible to set
further initial commands)

::

  from qgis.core import *
  import qgis.utils

For those which use the console often, it may be useful to set a
shortcut for triggering the console (within
:menuselection:`Settings --> Configure shortcuts...`)

.. index:: Python; Plugins

Python Plugins
==============

The functionality of QGIS can be extended using plugins.
It is now also possible to use plugins written
in Python. The main advantage over C++ plugins is simplicity of
distribution (no compiling for each platform) and easier
development.

Many plugins covering various functionality have been written since
the introduction of Python support. The plugin installer allows users
to easily fetch, upgrade and remove Python plugins.
See the `Python Plugins <https://plugins.qgis.org/>`_ page for more
information about plugins and plugin development.

Creating plugins in Python is simple, see :ref:`developing_plugins`
for detailed instructions.

.. note::

    Python plugins are also available for QGIS server
    (:ref:`label_qgisserver`), see :ref:`server_plugins` for further
    details.


.. index::
  pair: Python; startup

Running Python code when QGIS starts
====================================

There are two distinct methods to run Python code every time QGIS
starts.

1. Creating a startup.py script

2. Setting the ``PYQGIS_STARTUP`` environment variable to an
   existing Python file

.. index::
  single: Python; startup.py

The :file:`startup.py` file
----------------------------

Every time QGIS starts, the user's Python home directory

* Linux: :file:`.local/share/QGIS/QGIS3/profiles/default/python`
* Windows: :file:`AppData\\Roaming\\QGIS\\QGIS3\\profiles\\default\\python`
* macOS: :file:`Library/Application Support/QGIS/QGIS3/profiles/default`

is searched for a file named :file:`startup.py`. If that file exists, it
is executed by the embedded Python interpreter.

.. note:: The default path depends on the operating system. To find the
  path that will work for you, open the Python Console and run
  ``QStandardPaths.standardLocations(QStandardPaths.AppDataLocation)``
  to see the list of default directories.

.. index::
  pair: Environment; PYQGIS_STARTUP

PYQGIS_STARTUP environment variable
-----------------------------------

You can run Python code just before QGIS initialization completes by
setting the ``PYQGIS_STARTUP`` environment variable to the path of an
existing Python file.

This code will run before QGIS initialization is complete.
This method is very useful for cleaning
sys.path, which may have undesireable paths, or for isolating/loading
the initial environ without requiring a virtual environment, e.g.
homebrew or MacPorts installs on Mac.

.. index::
  pair: Python; Custom applications
  pair: Python; Standalone scripts

.. _pythonapplications:

Python Applications
===================

It is often handy to create  scripts for automating processes.
With PyQGIS, this is perfectly possible --- import
the :mod:`qgis.core` module, initialize it and you are ready for the
processing.

Or you may want to create an interactive application that uses
GIS functionality --- perform measurements, export a map as PDF, or any
other functionality. The :mod:`qgis.gui` module brings various GUI
components, most notably the map canvas widget that can be
incorporated into the application with support for zooming, panning
and/or any further custom map tools.

PyQGIS custom applications or standalone scripts must be configured to
locate the QGIS resources such as projection information, providers
for reading vector and raster layers, etc. QGIS Resources are
initialized by adding a few lines to the beginning of your application
or script. The code to initialize QGIS for custom applications and
standalone scripts is similar. Examples of each are provided
below.

.. note::

     Do *not* use :file:`qgis.py` as a name for your test script
     Python will not be able to import the bindings as the script's
     name will shadow them.

.. _standalonescript:

Using PyQGIS in standalone scripts
----------------------------------

To start a standalone script, initialize the QGIS resources at the
beginning of the script similar to the following code:

::

  from qgis.core import *

  # supply path to qgis install location
  QgsApplication.setPrefixPath("/path/to/qgis/installation", True)

  # create a reference to the QgsApplication, setting the
  # second argument to False disables the GUI
  qgs = QgsApplication([], False)

  # load providers
  qgs.initQgis()

  # Write your code here to load some layers, use processing
  # algorithms, etc.

  # When your script is complete, call exitQgis() to remove the
  # provider and layer registries from memory

  qgs.exitQgis()

We begin by importing the :mod:`qgis.core` module and then configuring
the prefix path. The prefix path is the location where QGIS is
installed on your system. It is configured in the script by calling
the :meth:`setPrefixPath <qgis.core.QgsApplication.setPrefixPath>` method. The
second argument of meth:`setPrefixPath <qgis.core.QgsApplication.setPrefixPath>`
is set to ``True``, which controls whether the default paths are
used.

The QGIS install path varies by platform; the easiest way to find it
for your system is to use the :ref:`pythonconsole` from within
QGIS and look at the output from running
``QgsApplication.prefixPath()``.

After the prefix path is configured, we save a reference to
``QgsApplication`` in the variable ``qgs``. The second argument is set
to ``False``, which indicates that we do not plan to use the GUI since
we are writing a standalone script. With the ``QgsApplication``
configured, we load the QGIS data providers and layer registry by
calling the ``qgs.initQgis()`` method. With QGIS initialized, we are
ready to write the rest of the script. Finally, we wrap up by calling
``qgs.exitQgis()`` to remove the data providers and layer registry
from memory.


Using PyQGIS in custom applications
-----------------------------------

The only difference between :ref:`standalonescript` and a custom PyQGIS
application is the second argument when instantiating the ``QgsApplication``.
Pass ``True`` instead of ``False`` to indicate that we plan to
use a GUI.

::

  from qgis.core import *

  # supply path to qgis install location
  QgsApplication.setPrefixPath("/path/to/qgis/installation", True)

  # create a reference to the QgsApplication
  # setting the second argument to True enables the GUI, which we need
  # to do since this is a custom application

  qgs = QgsApplication([], True)

  # load providers
  qgs.initQgis()

  # Write your code here to load some layers, use processing
  # algorithms, etc.

  # When your script is complete, call exitQgis() to remove the
  # provider and layer registries from memory
  qgs.exitQgis()


Now you can work with the QGIS API --- load layers and do some processing or fire
up a GUI with a map canvas. The possibilities are endless :-)


.. index::
  pair: Custom applications; Running

Running Custom Applications
---------------------------

You will need to tell your system where to search for QGIS libraries and
appropriate Python modules if they are not in a well-known location ---
otherwise Python will complain::

  >>> import qgis.core
  ImportError: No module named qgis.core

This can be fixed by setting the ``PYTHONPATH`` environment variable. In
the following commands, ``<qgispath>`` should be replaced with your actual
QGIS installation path:

* on Linux: :command:`export PYTHONPATH=/<qgispath>/share/qgis/python`
* on Windows: :command:`set PYTHONPATH=c:\\<qgispath>\\python`
* on macOS: :command:`export PYTHONPATH=/<qgispath>/Contents/Resources/python`

The path to the PyQGIS modules is now known, however they depend on
the ``qgis_core`` and ``qgis_gui`` libraries (the Python modules serve
only as wrappers). The path to these libraries is typically unknown
to the operating system, so you get an import error again (the message
might vary depending on the system)::

  >>> import qgis.core
  ImportError: libqgis_core.so.3.2.0: cannot open shared object file:
    No such file or directory

Fix this by adding the directories where the QGIS libraries reside to search
path of the dynamic linker:

* on Linux: :command:`export LD_LIBRARY_PATH=/<qgispath>/lib`
* on Windows: :command:`set PATH=C:\\<qgispath>\\bin;C:\\<qgispath>\\apps\\<qgisrelease>\\bin;%PATH%`
  where ``<qgisrelease>`` should be replaced with the type of release
  you are targeting (eg, ``qgis-ltr``, ``qgis``, ``qgis-dev``)

These commands can be put into a bootstrap script that will take care of
the startup. When deploying custom applications using PyQGIS, there are
usually two possibilities:

* require the user to install QGIS on his platform prior to installing your
  application. The application installer should look for default locations
  of QGIS libraries and allow user to set the path if not found. This
  approach has the advantage of being simpler, however it requires the user
  to do more steps.

* package QGIS together with your application. Releasing the application
  may be more challenging and the package will be larger, but the user will
  be saved from the burden of downloading and installing additional pieces
  of software.

The two deployment models can be mixed - deploy standalone application on
Windows and macOS, for Linux leave the installation of QGIS up to user
and his package manager.

Technical notes on PyQt and SIP
===============================

We've decided for Python as it's one of the most favoured languages for
scripting. PyQGIS bindings in QGIS 3 depend on SIP and PyQt5.
The reason for using SIP instead of more widely used SWIG is that the
QGIS code depends on Qt libraries. Python bindings for Qt (PyQt) are
also done using SIP and this allows seamless integration of PyQGIS with
PyQt.