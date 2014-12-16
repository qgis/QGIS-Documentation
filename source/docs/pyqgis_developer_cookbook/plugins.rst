.. index:: plugins; developing, Python; developing plugins

.. _developing_plugins:

*************************
Developing Python Plugins
*************************

It is possible to create plugins in Python programming language. In comparison
with classical plugins written in C++ these should be easier to write,
understand, maintain and distribute due the dynamic nature of the Python
language.

Python plugins are listed together with C++ plugins in QGIS plugin manager.
They are searched for in these paths:

* UNIX/Mac: :file:`~/.qgis/python/plugins` and :file:`(qgis_prefix)/share/qgis/python/plugins`
* Windows: :file:`~/.qgis/python/plugins` and :file:`(qgis_prefix)/python/plugins`

Home directory (denoted by above :file:`~`) on Windows is usually something
like :file:`C:\\Documents and Settings\\(user)` (on Windows XP or earlier) or
:file:`C:\\Users\\(user)`. Since Quantum GIS is using Python 2.7,
subdirectories of these paths have to contain an __init__.py file to be
considered Python packages that can be imported as plugins.

Steps:

#. *Idea*: Have an idea about what you want to do with your new QGIS plugin.
   Why do you do it?
   What problem do you want to solve?
   Is there already another plugin for that problem?
#. *Create files*: Create the files described next.
   A starting point (:file:`__init__.py`).
   Fill in the :ref:`plugin_metadata` (:file:`metadata.txt`)
   A main python plugin body (:file:`mainplugin.py`).
   A form in QT-Designer (:file:`form.ui`), with its :file:`resources.qrc`.
#. *Write code*: Write the code inside the :file:`mainplugin.py`
#. *Test*: Close and re-open QGIS and import your plugin again. Check if
   everything is OK.
#. *Publish*: Publish your plugin in QGIS repository or make your own
   repository as an "arsenal" of personal "GIS weapons".

.. index:: plugins; writing

Writing a plugin
================

Since the introduction of Python plugins in QGIS, a number of plugins have
appeared - on `Plugin Repositories wiki page <http://www.qgis.org/wiki/Python_Plugin_Repositories>`_
you can find some of them, you can use their source to learn more about
programming with PyQGIS or find out whether you are not duplicating development
effort. The QGIS team also maintains an :ref:`official_pyqgis_repository`.
Ready to create a plugin but no idea what to do? `Python Plugin Ideas wiki
page <http://www.qgis.org/wiki/Python_Plugin_Ideas>`_ lists wishes from the
community!

Plugin files
------------

Here's the directory structure of our example plugin

::

  PYTHON_PLUGINS_PATH/
    MyPlugin/
      __init__.py    --> *required*
      mainPlugin.py  --> *required*
      metadata.txt   --> *required*
      resources.qrc  --> *likely useful*
      resources.py   --> *compiled version, likely useful*
      form.ui        --> *likely useful*
      form.py        --> *compiled version, likely useful*

What is the meaning of the files:

* :file:`__init__.py` = The starting point of the plugin. It has to have the
  :func:`classFactory` method and may have any other initialisation code.
* :file:`mainPlugin.py` = The main working code of the plugin. Contains all
  the information about the actions of the plugin and the main code.
* :file:`resources.qrc` = The .xml document created by Qt Designer. Contains
  relative paths to resources of the forms.
* :file:`resources.py` = The translation of the .qrc file described above to
  Python.
* :file:`form.ui` = The GUI created by Qt Designer.
* :file:`form.py` = The translation of the form.ui described above to Python.
* :file:`metadata.txt` = Required for QGIS >= 1.8.0. Containts general info,
  version, name and some other metadata used by plugins website and plugin
  infrastructure. Since QGIS 2.0 the metadata from :file:`__init__.py` are not
  accepted anymore and the :file:`metadata.txt` is required.

`Here <http://www.dimitrisk.gr/qgis/creator/>`_
is an online automated way of creating the basic files (skeleton) of a typical
QGIS Python plugin.

Also there is a QGIS plugin called `Plugin Builder <http://geoapt.net/pluginbuilder/>`_
that creates plugin template from QGIS and doesn't require internet connection.
This is the recommended option, as it produces 2.0 compatible sources.

.. warning::
    If you plan to upload the plugin to the :ref:`official_pyqgis_repository`
    you must check that your plugin follows some additional rules, required for
    plugin :ref:`official_pyqgis_repository_validation`


.. index:: plugins; writing code

Plugin content
==============

Here you can find information and examples about what to add in each of the
files in the file structure described above.

.. index:: plugins; metadata.txt

.. _plugin_metadata:

Plugin metadata
---------------

First, plugin manager needs to retrieve some basic information about the
plugin such as its name, description etc. File :file:`metadata.txt` is the
right place to put this information.


.. important::
    All metadata must be in UTF-8 encoding.

.. _plugin_metadata_table:

=====================  ========  =======================================
Metadata name          Required  Notes
=====================  ========  =======================================
name                   True      a short string  containing the name of the plugin
qgisMinimumVersion     True      dotted notation of minimum QGIS version
qgisMaximumVersion     False     dotted notation of maximum QGIS version
description            True      short text which describes the plugin, no HTML allowed
about                  False     longer text which describes the plugin in details, no HTML allowed
version                True      short string with the version dotted notation
author                 True      author name
email                  True      email of the author, will *not* be shown on the web site
changelog              False     string, can be multiline, no HTML allowed
experimental           False     boolean flag, `True` or `False`
deprecated             False     boolean flag, `True` or `False`, applies to the whole plugin and not just to the uploaded version
tags                   False     comma separated list, spaces are allowed inside individual tags
homepage               False     a valid URL pointing to the homepage of your plugin
repository             False     a valid URL for the source code repository
tracker                False     a valid URL for tickets and bug reports
icon                   False     a file name or a relative path (relative to the base folder of the plugin's compressed package)
category               False     one of `Raster`, `Vector`, `Database` and `Web`
=====================  ========  =======================================

By default, plugins are placed in the `Plugins` menu (we will see in the next
section  how to add a menu entry for your plugin) but they can also be placed
the  into :menuselection:`Raster`, :menuselection:`Vector`,
:menuselection:`Database` and :menuselection:`Web` menus.

A corresponding "category" metadata entry exists to specify that, so the plugin
can be classified accordingly. This metadata entry is used as tip for users and
tells them where (in which menu) the plugin can be found. Allowed values for
"category" are: Vector, Raster, Database or Web. For example, if your plugin
will be available from `Raster` menu, add this to :file:`metadata.txt`

::

  category=Raster

.. note::
   If `qgisMaximumVersion` is empty, it will be automatically set to the major
   version plus `.99` when uploaded to the :ref:`official_pyqgis_repository`.


An example for this metadata.txt

::

  ; the next section is mandatory

  [general]
  name=HelloWorld
  email=me@example.com
  author=Just Me
  qgisMinimumVersion=2.0
  description=This is an example plugin for greeting the world.
      Multiline is allowed:
      lines starting with spaces belong to the same
      field, in this case to the "description" field.
      HTML formatting is not allowed.
  about=This paragraph can contain a detailed description
      of the plugin. Multiline is allowed, HTML is not.
  version=version 1.2
  ; end of mandatory metadata

  ; start of optional metadata
  category=Raster
  changelog=The changelog lists the plugin versions
      and their changes as in the example below:
      1.0 - First stable release
      0.9 - All features implemented
      0.8 - First testing release

  ; Tags are in comma separated value format, spaces are allowed within the
  ; tag name.
  ; Tags should be in English language. Please also check for existing tags and
  ; synonyms before creating a new one.
  tags=wkt,raster,hello world

  ; these metadata can be empty, they will eventually become mandatory.
  homepage=http://www.itopen.it
  tracker=http://bugs.itopen.it
  repository=http://www.itopen.it/repo
  icon=icon.png

  ; experimental flag (applies to the single version)
  experimental=True

  ; deprecated flag (applies to the whole plugin and not only to the uploaded version)
  deprecated=False

  ; if empty, it will be automatically set to major version + .99
  qgisMaximumVersion=2.0


.. index:: plugins; metadata.txt, metadata, metadata.txt

__init__.py
-----------
This file is required by Python's import system. Also, QGIS requires that this
file contains a :func:`classFactory()` function, which is called when the
plugin gets loaded to QGIS. It receives reference to instance of
:class:`QgisInterface` and must return instance of your plugin's class from the
:file:`mainplugin.py` --- in our case it's called ``TestPlugin`` (see below).
This is how :file:`__init__.py` should look like

::

  def classFactory(iface):
    from mainPlugin import TestPlugin
    return TestPlugin(iface)

  ## any other initialisation needed


mainPlugin.py
-------------

This is where the magic happens and this is how magic looks like:
(e.g. :file:`mainPlugin.py`)

::

  from PyQt4.QtCore import *
  from PyQt4.QtGui import *
  from qgis.core import *

  # initialize Qt resources from file resources.py
  import resources

  class TestPlugin:

    def __init__(self, iface):
      # save reference to the QGIS interface
      self.iface = iface

    def initGui(self):
      # create action that will start plugin configuration
      self.action = QAction(QIcon(":/plugins/testplug/icon.png"), "Test plugin", self.iface.mainWindow())
      self.action.setObjectName("testAction")
      self.action.setWhatsThis("Configuration for test plugin")
      self.action.setStatusTip("This is status tip")
      QObject.connect(self.action, SIGNAL("triggered()"), self.run)

      # add toolbar button and menu item
      self.iface.addToolBarIcon(self.action)
      self.iface.addPluginToMenu("&Test plugins", self.action)

      # connect to signal renderComplete which is emitted when canvas
      # rendering is done
      QObject.connect(self.iface.mapCanvas(), SIGNAL("renderComplete(QPainter *)"), self.renderTest)

    def unload(self):
      # remove the plugin menu item and icon
      self.iface.removePluginMenu("&Test plugins", self.action)
      self.iface.removeToolBarIcon(self.action)

      # disconnect form signal of the canvas
      QObject.disconnect(self.iface.mapCanvas(), SIGNAL("renderComplete(QPainter *)"), self.renderTest)

    def run(self):
      # create and show a configuration dialog or something similar
      print "TestPlugin: run called!"

    def renderTest(self, painter):
      # use painter for drawing to map canvas
      print "TestPlugin: renderTest called!"


The only plugin functions that must exist in the main plugin source file (e.g.
:file:`mainPlugin.py`) are:

* ``__init__``    --> which gives access to Quantum GIS' interface
* ``initGui()``   --> called when the plugin is loaded
* ``unload()``    --> called when the plugin is unloaded

You can see that in the above example, the :func:`addPluginToMenu` is used.
This will add the corresponding menu action to the :menuselection:`Plugins`
menu. Alternative methods exist to add the action to a different menu. Here is
a list of those methods:

* :func:`addPluginToRasterMenu()`
* :func:`addPluginToVectorMenu()`
* :func:`addPluginToDatabaseMenu()`
* :func:`addPluginToWebMenu()`

All of them have the same syntax as the :func:`addPluginToMenu` method.

Adding your plugin menu to one of those predefined method is recommended to
keep consistency in how plugin entries are organized. However, you can add your
custom menu group directly to the menu bar, as the next example demonstrates:

::

    def initGui(self):
        self.menu = QMenu(self.iface.mainWindow())
        self.menu.setObjectName("testMenu")
        self.menu.setTitle("MyMenu")

        self.action = QAction(QIcon(":/plugins/testplug/icon.png"), "Test plugin", self.iface.mainWindow())
        self.action.setObjectName("testAction")
        self.action.setWhatsThis("Configuration for test plugin")
        self.action.setStatusTip("This is status tip")
        QObject.connect(self.action, SIGNAL("triggered()"), self.run)
        self.menu.addAction(self.action)

        menuBar = self.iface.mainWindow().menuBar()
        menuBar.insertMenu(self.iface.firstRightStandardMenu().menuAction(), self.menu)

    def unload(self):
        self.menu.deleteLater()

Don't forget to set :class:`QAction` and :class:`QMenu` ``objectName`` to a name
specific to your plugin so that it can be customized.

.. index:: plugins; resource file, resources.qrc

Resource File
-------------

You can see that in :func:`initGui()` we've used an icon from the resource file
(called :file:`resources.qrc` in our case)

::

  <RCC>
    <qresource prefix="/plugins/testplug" >
       <file>icon.png</file>
    </qresource>
  </RCC>

It is good to use a prefix that will not collide with other plugins or any
parts of QGIS, otherwise you might get resources you did not want. Now you
just need to generate a Python file that will contain the resources. It's
done with :command:`pyrcc4` command

::

  pyrcc4 -o resources.py resources.qrc

And that's all... nothing complicated :)

If you've done everything correctly you should be able to find and load
your plugin in the plugin manager and see a message in console when toolbar
icon or appropriate menu item is selected.

When working on a real plugin it's wise to write the plugin in another
(working) directory and create a makefile which will generate UI + resource
files and install the plugin to your QGIS installation.

.. index:: plugins; documentation, plugins; implementing help

Documentation
=============

The documentation for the plugin can be written as HTML help files. The
:mod:`qgis.utils` module provides a function, :func:`showPluginHelp` which
will open the help file browser, in the same way as other QGIS help.

The :func:`showPluginHelp`` function looks for help files in the same
directory as the calling module. It will look for, in turn,
:file:`index-ll_cc.html`, :file:`index-ll.html`, :file:`index-en.html`,
:file:`index-en_us.html` and :file:`index.html`, displaying whichever it finds
first. Here ``ll_cc`` is the QGIS locale. This allows multiple translations of
the documentation to be included with the plugin.

The :func:`showPluginHelp` function can also take parameters packageName,
which identifies a specific plugin for which the help will be displayed,
filename, which can replace "index" in the names of files being searched,
and section, which is the name of an html anchor tag in the document
on which the browser will be positioned.

.. index:: plugins; code snippets
