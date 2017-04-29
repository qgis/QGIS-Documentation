.. only:: html

   |updatedisclaimer|

.. index::
   single: Pyhon

.. _console:

*******************
QGIS Python console
*******************

.. only:: html

   .. contents::
      :local:

As you will see later in this chapter, QGIs has been designed with a plugin
architecture. Plugin are written in Python, a very famous langage in the
geospatial world.

QGIS brings a Python API to let the user to interact with its object (layers,
feature or interface). To help the user, QGIS has a Python console. To open the
console go to :menuselection:`Plugins --> Pytnon console`` (:kbd:`Ctrl+Alt+P`).

The QGIS Python Console is an interactive shell for the python command
executions. It also has a python file editor that allows you to edit and save
your python scripts. Both console and editor are based on PyQScintilla2
package.

The console is split in two main panels, top and bottom one resizable by using
the horizontal splitter. Output area panel is a widget read-only which shows the
commands output. You can drag and drop or copy and paste text into input area
and execute code snippets from the output panel by selecting some text and
clicking on the Enter selected command from the context menu. No matter if
selected text contains the interpreter prompt (>>>, ...). Input area panel is
the interactive python shell for input commands.


Toolbar
========

Toolbar propose the following tools:

* |iconClearConsole| :guilabel:`Clear console`
* |iconClassConsole| :guilabel:`Import class`: Processing class, PyQt4.QtCore
  class or PyQt4.QtGui class
* |iconRunConsole| :guilabel:`Run command` (like Enter key pressed)
* |iconeShowEditorConsole| :guilabel:`Show editor`: The editor allows editing
  and saving python files and it offers basic functionality for managing your
  code (comment and uncomment code, check syntax, share the code via
  codepad.org and much more).
* |iconSettingsConsole| :guilabel:`Options`
* |iconHelpConsole| :guilabel:`Help`


Console
=======

Main features are:

* Code completion, highlighting syntax and calltips for the following APIs:

  * Python
  * PyQGIS
  * PyQt4
  * QScintilla2
  * osgeo-gdal-ogr

* Ctrl+Alt+Space to view the auto-completion list.
* Ctrl+Shift+Space to view the command history list.
* Execute code snippets with the Enter selected command from output panel.
* Open QGIS API documentation by typing _api.
* Open PyQGIS Cookbook by typing _pyqgis.
* Save and clear the command history accessing from context menu of input panel.
  The history will be saved into the file ~/.qgis2/console_history.txt.

.. _figure_python_console:

.. figure:: /static/user_manual/plugins/python_console.png
   :align: center

   The Python console

Editor
======

Main features are:

* Code completion, highlighting syntax and calltips for the following APIs:

  * Python
  * PyQGIS
  * PyQt4
  * QScintilla2
  * osgeo-gdal-ogr

* :kbd:`Ctrl+Space` to view the auto-completion list.
* Sharing code snippets via codepad.org.
* :kbd:`Ctrl+4` Syntax check.
* Search bar (open it with the default Desktop Environement shorcut, usually
  :kbd:`Ctrl+F`):

  * Use the default Desktop Environment shortcut to find next/previous
    (:kbd:`Ctrl+G` and :kbd:`Shift+Ctrl+G`).
  * Automatically find first match when typing in find box.
  * Set initial find string to selection when opening find
  * Pressing Escape closes the find bar

* Object inspector: a class and function browser.
* Go to an object definition with a mouse click (from Object inspector).
* Execute code snippets with the Enter selected command.
* Execute the whole script with the Run script command (this creates
  a byte-compiled file with the extension .pyc).

.. _figure_python_console_editor:

.. figure:: /static/user_manual/plugins/python_console_editor.png
   :align: center

   The Python console editor

Options
=======

This add further settings for python console:

**Autocompletion:** If checked the code completion is enabled. You can get
autocompletion from current document, from installed APIs and both from APIs
and current document.

**Autocompletion threshold:** Sets the threshold to display the autocompletion list
(in chars typed).

**Automatic parentheses insertion:** If checked enables the autoclosing for bracket.

**Auto-save script before running:** Allows you to save automatically the script to
be executed in order to avoid to save it after any modification. This action
will store a temporary file into the temporary system directory that will be
automatically deleted after running.

**Using preloaded APIs file:** You can choose whether use the preload APIs file or
load some APIs files saved on your system.

**Using prepared APIs file:** If checked the \*.pap file will be used for code
completion. To generate a prepared APIs file you have to load least an \*.api
file and then compile it by clicking on Compile Apis... button.

.. tip:: **Save the options**

   To save the state of console's widgets you have to close the Python
   Console from the close button. This allows you to save the geometry to be
   restored to the next start.
