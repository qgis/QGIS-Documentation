.. index:: Plugins; Folder, Python; Developing plugins

.. _structuring_plugins:

**************************
Structuring Python Plugins
**************************

.. contents::
   :local:


In order to create a plugin, here are some steps to follow:

#. *Idea*: Have an idea about what you want to do with your new QGIS plugin.
   Why do you do it?
   What problem do you want to solve?
   Is there already another plugin for that problem?
#. *Create files*: some are essentials (see :ref:`plugin_files_architecture`)
#. *Write code*: Write the code in appropriate files
#. *Test*: :ref:`Reload your plugin <plugin_reloader_trick>` to check if
   everything is OK
#. *Publish*: Publish your plugin in QGIS repository or make your own
   repository as an "arsenal" of personal "GIS weapons".

.. index:: Plugins; Writing

Writing a plugin
================

Since the introduction of Python plugins in QGIS, a number of plugins have
appeared. The QGIS team maintains an :ref:`official_pyqgis_repository`.
You can use their source to learn more about programming with PyQGIS or
find out whether you are duplicating development effort.

.. _plugin_files_architecture:

Plugin files
------------

Here's the directory structure of our example plugin

::

  PYTHON_PLUGINS_PATH/
    MyPlugin/
      __init__.py    --> *required*
      mainPlugin.py  --> *core code*
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
* :file:`metadata.txt` = Contains general info, version, name and some other
  metadata used by plugins website and plugin infrastructure.

`Here <https://github.com/wonder-sk/qgis-minimal-plugin>`_
is a way of creating the basic files (skeleton) of a typical
QGIS Python plugin.

There is a QGIS plugin called
`Plugin Builder 3 <https://plugins.qgis.org/plugins/pluginbuilder3/>`_
that creates a plugin template for QGIS.
This is the recommended option, as it produces 3.x compatible sources.

.. warning::
    If you plan to upload the plugin to the :ref:`official_pyqgis_repository`
    you must check that your plugin follows some additional rules, required for
    plugin :ref:`official_pyqgis_repository_validation`


.. index:: Plugins; Writing code

Plugin content
==============

Here you can find information and examples about what to add in each of the
files in the file structure described above.

.. index:: Plugins; Metadata, metadata.txt

.. _plugin_metadata:

Plugin metadata
---------------

First, the plugin manager needs to retrieve some basic information about the
plugin such as its name, description etc. File :file:`metadata.txt` is the
right place to put this information.


.. note::
   All metadata must be in UTF-8 encoding.

.. _plugin_metadata_table:

=====================  ========  =======================================
Metadata name          Required  Notes
=====================  ========  =======================================
name                   True      a short string  containing the name of the plugin
qgisMinimumVersion     True      dotted notation of minimum QGIS version
qgisMaximumVersion     False     dotted notation of maximum QGIS version
description            True      short text which describes the plugin, no HTML allowed
about                  True      longer text which describes the plugin in details, no HTML allowed
version                True      short string with the version dotted notation
author                 True      author name
email                  True      email of the author, only shown on the website to logged in users,
                                 but visible in the Plugin Manager after the plugin is installed
changelog              False     string, can be multiline, no HTML allowed
experimental           False     boolean flag, `True` or `False` - `True` if this version is experimental
deprecated             False     boolean flag, `True` or `False`, applies to the whole plugin
                                 and not just to the uploaded version
tags                   False     comma separated list, spaces are allowed inside individual tags
homepage               False     a valid URL pointing to the homepage of your plugin
repository             True      a valid URL for the source code repository
tracker                False     a valid URL for tickets and bug reports
icon                   False     a file name or a relative path (relative to
                                 the base folder of the plugin's compressed
                                 package) of a web friendly image (PNG, JPEG)
category               False     one of `Raster`, `Vector`, `Database` and `Web`
plugin_dependencies    False     PIP-like comma separated list of other plugins to install
server                 False     boolean flag, `True` or `False`, determines if the
                                 plugin has a server interface
hasProcessingProvider  False     boolean flag, `True` or `False`, determines if
                                 the plugin provides processing algorithms
=====================  ========  =======================================

By default, plugins are placed in the :menuselection:`Plugins` menu (we will see
in the next section how to add a menu entry for your plugin) but they can also
be placed into :menuselection:`Raster`, :menuselection:`Vector`,
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
  qgisMinimumVersion=3.0
  description=This is an example plugin for greeting the world.
      Multiline is allowed:
      lines starting with spaces belong to the same
      field, in this case to the "description" field.
      HTML formatting is not allowed.
  about=This paragraph can contain a detailed description
      of the plugin. Multiline is allowed, HTML is not.
  version=version 1.2
  tracker=http://bugs.itopen.it
  repository=http://www.itopen.it/repo
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
  homepage=https://www.itopen.it
  icon=icon.png

  ; experimental flag (applies to the single version)
  experimental=True

  ; deprecated flag (applies to the whole plugin and not only to the uploaded version)
  deprecated=False

  ; if empty, it will be automatically set to major version + .99
  qgisMaximumVersion=3.99

  ; Since QGIS 3.8, a comma separated list of plugins to be installed
  ; (or upgraded) can be specified.
  ; The example below will try to install (or upgrade) "MyOtherPlugin" version 1.12
  ; and any version of "YetAnotherPlugin"
  plugin_dependencies=MyOtherPlugin==1.12,YetAnotherPlugin


.. index:: Plugins; Initialisation

__init__.py
-----------

This file is required by Python's import system. Also, QGIS requires that this
file contains a :func:`classFactory()` function, which is called when the
plugin gets loaded into QGIS. It receives a reference to the instance of
:class:`QgisInterface <qgis.gui.QgisInterface>` and must return an object of your plugin's class from
the :file:`mainplugin.py` --- in our case it's called ``TestPlugin`` (see below).
This is how :file:`__init__.py` should look like

.. testcode:: plugins

  def classFactory(iface):
    from .mainPlugin import TestPlugin
    return TestPlugin(iface)

  # any other initialisation needed


mainPlugin.py
-------------

This is where the magic happens and this is how magic looks like:
(e.g. :file:`mainPlugin.py`)

.. code-block:: python

  from qgis.PyQt.QtGui import *
  from qgis.PyQt.QtWidgets import *

  # initialize Qt resources from file resources.py
  from . import resources

  class TestPlugin:

    def __init__(self, iface):
      # save reference to the QGIS interface
      self.iface = iface

    def initGui(self):
      # create action that will start plugin configuration
      self.action = QAction(QIcon(":/plugins/testplug/icon.png"),
                            "Test plugin",
                            self.iface.mainWindow())
      self.action.setObjectName("testAction")
      self.action.setWhatsThis("Configuration for test plugin")
      self.action.setStatusTip("This is status tip")
      self.action.triggered.connect(self.run)

      # add toolbar button and menu item
      self.iface.addToolBarIcon(self.action)
      self.iface.addPluginToMenu("&Test plugins", self.action)

      # connect to signal renderComplete which is emitted when canvas
      # rendering is done
      self.iface.mapCanvas().renderComplete.connect(self.renderTest)

    def unload(self):
      # remove the plugin menu item and icon
      self.iface.removePluginMenu("&Test plugins", self.action)
      self.iface.removeToolBarIcon(self.action)

      # disconnect form signal of the canvas
      self.iface.mapCanvas().renderComplete.disconnect(self.renderTest)

    def run(self):
      # create and show a configuration dialog or something similar
      print("TestPlugin: run called!")

    def renderTest(self, painter):
      # use painter for drawing to map canvas
      print("TestPlugin: renderTest called!")


The only plugin functions that must exist in the main plugin source file (e.g.
:file:`mainPlugin.py`) are:

* ``__init__`` which gives access to QGIS interface
* ``initGui()`` called when the plugin is loaded
* ``unload()`` called when the plugin is unloaded

In the above example, :meth:`addPluginToMenu <qgis.gui.QgisInterface.addPluginToMenu>` is used.
This will add the corresponding menu action to the :menuselection:`Plugins`
menu. Alternative methods exist to add the action to a different menu. Here is
a list of those methods:

* :meth:`addPluginToRasterMenu() <qgis.gui.QgisInterface.addPluginToRasterMenu>`
* :meth:`addPluginToVectorMenu() <qgis.gui.QgisInterface.addPluginToVectorMenu>`
* :meth:`addPluginToDatabaseMenu() <qgis.gui.QgisInterface.addPluginToDatabaseMenu>`
* :meth:`addPluginToWebMenu() <qgis.gui.QgisInterface.addPluginToWebMenu>`

All of them have the same syntax as the
:meth:`addPluginToMenu <qgis.gui.QgisInterface.addPluginToMenu>` method.

Adding your plugin menu to one of those predefined method is recommended to
keep consistency in how plugin entries are organized. However, you can add your
custom menu group directly to the menu bar, as the next example demonstrates:

.. testcode:: plugins

    def initGui(self):
        self.menu = QMenu(self.iface.mainWindow())
        self.menu.setObjectName("testMenu")
        self.menu.setTitle("MyMenu")

        self.action = QAction(QIcon(":/plugins/testplug/icon.png"),
                              "Test plugin",
                              self.iface.mainWindow())
        self.action.setObjectName("testAction")
        self.action.setWhatsThis("Configuration for test plugin")
        self.action.setStatusTip("This is status tip")
        self.action.triggered.connect(self.run)
        self.menu.addAction(self.action)

        menuBar = self.iface.mainWindow().menuBar()
        menuBar.insertMenu(self.iface.firstRightStandardMenu().menuAction(),
                           self.menu)

    def unload(self):
        self.menu.deleteLater()

Don't forget to set :class:`QAction` and :class:`QMenu` ``objectName`` to a name
specific to your plugin so that it can be customized.

.. index:: Plugins; Resource file, resources.qrc

Resource File
-------------

You can see that in :func:`initGui()` we've used an icon from the resource file
(called :file:`resources.qrc` in our case)

.. code-block:: xml

  <RCC>
    <qresource prefix="/plugins/testplug" >
       <file>icon.png</file>
    </qresource>
  </RCC>

It is good to use a prefix that will not collide with other plugins or any
parts of QGIS, otherwise you might get resources you did not want. Now you
just need to generate a Python file that will contain the resources. It's
done with :command:`pyrcc5` command:

::

  pyrcc5 -o resources.py resources.qrc

.. note::

    In Windows environments, attempting to run the :command:`pyrcc5` from
    Command Prompt or Powershell will probably result in the error "Windows
    cannot access the specified device, path, or file [...]".  The easiest
    solution is probably to use the OSGeo4W Shell but if you are comfortable
    modifying the PATH environment variable or specifiying the path to the
    executable explicitly you should be able to find it at
    :file:`<Your QGIS Install Directory>\\bin\\pyrcc5.exe`.

And that's all... nothing complicated :)

If you've done everything correctly you should be able to find and load
your plugin in the plugin manager and see a message in console when toolbar
icon or appropriate menu item is selected.

When working on a real plugin it's wise to write the plugin in another
(working) directory and create a makefile which will generate UI + resource
files and install the plugin into your QGIS installation.

.. index:: Plugins; Documentation, Plugins; Implementing help

Documentation
=============

The documentation for the plugin can be written as HTML help files. The
:mod:`qgis.utils` module provides a function, :func:`showPluginHelp` which
will open the help file browser, in the same way as other QGIS help.

The :func:`showPluginHelp` function looks for help files in the same
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

.. index:: Plugins; Code snippets, Plugins; Translation

Translation
===========

With a few steps you can set up the environment for the plugin localization so
that depending on the locale settings of your computer the plugin will be loaded
in different languages.

Software requirements
---------------------

The easiest way to create and manage all the translation files is to install
`Qt Linguist <https://doc.qt.io/qt-5/qtlinguist-index.html>`_.
In a Debian-based GNU/Linux environment you can install it typing::

  sudo apt install qttools5-dev-tools


Files and directory
-------------------

When you create the plugin you will find the ``i18n`` folder within the main
plugin directory.

**All the translation files have to be within this directory.**

.pro file
.........

First you should create a ``.pro`` file, that is a *project* file that can be
managed by **Qt Linguist**.

In this ``.pro`` file you have to specify all the files and forms you want to
translate. This file is used to set up the localization files and variables.
A possible project file, matching the structure of our
:ref:`example plugin <plugin_files_architecture>`:

::

  FORMS = ../form.ui
  SOURCES = ../your_plugin.py
  TRANSLATIONS = your_plugin_it.ts

Your plugin might follow a more complex structure, and it might be distributed
across several files. If this is the case, keep in mind that ``pylupdate5``,
the program we use to read the ``.pro`` file and update the translatable string,
does not expand wild card characters, so you need to place every file explicitly
in the ``.pro`` file.
Your project file might then look like something like this:

::

  FORMS = ../ui/about.ui ../ui/feedback.ui \
          ../ui/main_dialog.ui
  SOURCES = ../your_plugin.py ../computation.py \
            ../utils.py

Furthermore, the ``your_plugin.py`` file is the file that *calls* all the menu
and sub-menus of your plugin in the QGIS toolbar and you want to translate them
all.

Finally with the *TRANSLATIONS* variable you can specify the translation
languages you want.

.. warning::

   Be sure to name the ``ts`` file like ``your_plugin_`` + ``language`` + ``.ts``
   otherwise the language loading will fail! Use the 2 letter shortcut for the
   language (**it** for Italian, **de** for German, etc...)

.ts file
........

Once you have created the ``.pro`` you are ready to generate the ``.ts`` file(s)
for the language(s) of your plugin.

Open a terminal, go to ``your_plugin/i18n`` directory and type::

  pylupdate5 your_plugin.pro

you should see the ``your_plugin_language.ts`` file(s).

Open the ``.ts`` file with **Qt Linguist** and start to translate.

.qm file
........

When you finish to translate your plugin (if some strings are not completed the
source language for those strings will be used) you have to create the ``.qm``
file (the compiled ``.ts`` file that will be used by QGIS).

Just open a terminal cd in ``your_plugin/i18n`` directory and type::

  lrelease your_plugin.ts

now, in the ``i18n`` directory you will see the ``your_plugin.qm`` file(s).

Translate using Makefile
-------------------------

Alternatively you can use the makefile to extract messages from python code and
Qt dialogs, if you created your plugin with Plugin Builder.
At the beginning of the Makefile there is a LOCALES variable::

	LOCALES = en

Add the abbreviation of the language to this variable, for example for
Hungarian language::

	LOCALES = en hu

Now you can generate or update the :file:`hu.ts` file (and the :file:`en.ts` too)
from the sources by::

	make transup

After this, you have updated ``.ts`` file for all languages set in the LOCALES
variable.
Use **Qt Linguist** to translate the program messages.
Finishing the translation the ``.qm`` files can be created by the transcompile::

	make transcompile

You have to distribute ``.ts`` files with your plugin.

Load the plugin
---------------

In order to see the translation of your plugin, open QGIS, change the
language (:menuselection:`Settings --> Options --> General`) and restart QGIS.

You should see your plugin in the correct language.

.. warning::

   If you change something in your plugin (new UIs, new menu, etc..) you have to
   **generate again** the update version of both ``.ts`` and ``.qm`` file, so run
   again the command of above.


Tips and Tricks
===============


.. _plugin_reloader_trick:

Plugin Reloader
---------------

During development of your plugin you will frequently need to reload it in QGIS
for testing. This is very easy using the **Plugin Reloader** plugin. You can find it
with the :ref:`Plugin Manager <plugins>`.

Accessing Plugins
-----------------

You can access all the classes of installed plugins from within QGIS using python,
which can be handy for debugging purposes.

.. code-block:: python

	my_plugin = qgis.utils.plugins['My Plugin']

Log Messages
------------

Plugins have their own tab within the :ref:`log_message_panel`.

Share your plugin
-----------------
QGIS is hosting hundreds of plugins in the plugin repository. Consider sharing
yours! It will extend the possibilities of QGIS and people will be able to learn
from your code. All hosted plugins can be found and installed from within QGIS
with the Plugin Manager.

Information and requirements are here: `plugins.qgis.org <https://plugins.qgis.org/>`_.
