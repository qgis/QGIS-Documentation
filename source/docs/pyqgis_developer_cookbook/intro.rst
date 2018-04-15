.. _introduction:

************
Introduction
************

The PyQGIS Developer Cookbook aims to be both a tutorial and a reference guide.
While it does not list all possible use cases, it should give a good overview
of the principal functionality.

.. contents::
   :local:

Python support was first introduced in QGIS 0.9. Today, there are several ways 
to use Python in QGIS Desktop, they are covered
in detail in the following sections:

* Scripting in the Python console
* Creating plugins 
* Automatically running Python code when QGIS starts
* Creating custom applications based on the QGIS API

Python bindings are also available for QGIS Server, including Python plugins
(see :ref:`Server Python Plugins <server_plugins>`) and Python bindings that 
can be used to embed QGIS Server into a Python application.

.. index:: API

There is a `complete QGIS API <http://python.qgis.org/master/>`_ reference that documents
the classes from the QGIS libraries. 

A good resource to learn how to perform common tasks is to download existing plugins from
`plugin repository <http://plugins.qgis.org/>`_ and examine their code.


.. index::
  pair: Python; Console

.. _pythonconsole:
  
Scripting in the Python console
===============================

QGIS provides an integrated Python console for scripting.
It can be opened from menu: :menuselection:`Plugins --> Python Console`:

.. figure:: img/console.png
   :align: center
   :width: 40em

   QGIS Python console

For convenience, the following statements are automatically executed when
the console is started:

::

  from qgis.core import *
  import qgis.utils


.. index:: Python; Plugins

Developing Python plugins
=========================

QGIS can be extended using plugins. 
Creating plugins in Python is covered in :ref:`developing_plugins`.

.. note::

    Python plugins are also available in QGIS server (:ref:`label_qgisserver`),
    see :ref:`server_plugins` for further details.


Running Python code when QGIS starts
====================================

There are two distinct methods to run Python code every time QGIS starts:

1. Creating a startup.py script
2. Setting the ``PYQGIS_STARTUP`` environment variable to an existing Python file

.. index::
  single: Python; startup.py

The :file:`startup.py` file
----------------------------

Every time QGIS starts, the user's Python home directory 
is searched for a file named :file:`startup.py` and if that file exists,
it is executed by the embedded Python interpreter.

.. index::
  pair: Environment; PYQGIS_STARTUP

PYQGIS_STARTUP environment variable
-----------------------------------

You can run Python code just before QGIS initialization completes by setting the
``PYQGIS_STARTUP`` environment variable  to the path of an existing Python file.

This code will run before QGIS initialization is complete. Therefore this method is
very useful, for example, to clean sys.path, which may have undesireable paths, or for
isolating/loading the initial environment without requiring a virtual environment, e.g.
homebrew or MacPorts installs on Mac.


.. index::
  pair: Python; Custom applications
  pair: Python; Standalone scripts

.. _pythonapplications:

Developing standalone Python applications
==========================================

It is often handy to create  scripts for automating processes.
With PyQGIS, this is perfectly possible --- import the :mod:`qgis.core`
module, initialize it and you are ready for the processing.
Or you may want to create an interactive application that uses GIS
functionality --- perform measurements, export a map in PDF, or any other
functionality. The :mod:`qgis.gui` module additionally brings various GUI
components, most notably the map canvas widget that can be 
incorporated into the application with support for zooming, panning and/or
any further custom map tools.

Creating standalone scripts and applications covered in :ref:`standalone`.


Technical notes on PyQt and SIP
===============================

We've decided for Python as it's one of the most favourite
languages for scripting. PyQGIS bindings in QGIS 3 depend on SIP and PyQt5. 
The reason for using SIP instead of more widely used SWIG is that the whole QGIS code
depends on Qt libraries. Python bindings for Qt (PyQt) are done also using
SIP and this allows seamless integration of PyQGIS with PyQt.
