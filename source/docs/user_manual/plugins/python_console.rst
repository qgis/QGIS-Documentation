.. only:: html

   |updatedisclaimer|

.. index::
   single: Python

.. _console:

*******************
QGIS Python console
*******************

.. only:: html

   .. contents::
      :local:

As you will see later in this chapter, QGIS has been designed with a plugin
architecture. Plugins are written in Python, a very famous language in the
geospatial world.

QGIS brings a Python API to let the user interact with its objects (layers,
feature or interface). To help the user, QGIS has a Python console. To open the
console go to :menuselection:`Plugins --> Python Console` (:kbd:`Ctrl+Alt+P`).

The QGIS Python Console is an interactive shell for the python command
executions. It also has a python file editor that allows you to edit and save
your python scripts. Both console and editor are based on PyQScintilla2
package.

The Interactive Console
=======================

The interactive console is composed of a toolbar, an input area and an output one.

Toolbar
-------

The toolbar proposes the following tools:

* |iconClearConsole| :guilabel:`Clear console` to wipe the output area;
* |iconClassConsole| :guilabel:`Import class`: **Processing**, **PyQt4.QtCore**
  or **PyQt4.QtGui** class;
* |iconRunConsole| :guilabel:`Run command` available in the input area: same as
  pressing :kbd:`Enter`;
* |iconeShowEditorConsole| :guilabel:`Show editor`: toggles :ref:`console_editor`
  visibility;
* |iconSettingsConsole| :guilabel:`Options...`;
* |iconHelpConsole| :guilabel:`Help...`.


Console
-------

The console main features are:

* Code completion, highlighting syntax and calltips for the following APIs:

  * Python
  * PyQGIS
  * PyQt4
  * QScintilla2
  * osgeo-gdal-ogr

* :kbd:`Ctrl+Alt+Space` to view the auto-completion list if enabled in the
  :ref:`console_options`;
* Execute code snippets from the input area by typing and pressing :kbd:`Enter`
  or :guilabel:`Run Command`;
* Execute code snippets from the output area using the :guilabel:`Enter selected`
  from the contextual menu or pressing :kbd:`Ctrl+E`;
* Browse the command history from the input area using the :kbd:`Up` and
  :kbd:`Down` arrow keys and execute the command you want;
* :kbd:`Ctrl+Shift+Space` to view the command history: double-clicking a row
  will execute the command. The :guilabel:`Command History` dialog can also be
  accessed from context menu of input area;
* Save and clear the command history. The history will be saved into the file
  :file:`~/.qgis2/console_history.txt`;
* Open QGIS API documentation by typing ``_api``;
* Open PyQGIS Cookbook by typing ``_pyqgis``.

.. tip:: **Reuse executed commands from the output panel**

 You can execute code snippets from the output panel by selecting some text and
 pressing :kbd:`Ctrl+E`. No matter if selected text contains the interpreter
 prompt (``>>>``, ``...``).
  
.. _figure_python_console:

.. figure:: /static/user_manual/plugins/python_console.png
   :align: center

   The Python Console

.. _console_editor:

The Code Editor
===============

Use the |iconeShowEditorConsole| :sup:`Show editor` button to enable the editor
widget. It allows editing and saving Python files and offers advanced
functionalities to manage your code (comment and uncomment code, check syntax,
share the code via codepad.org and much more). Main features are:

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
    (:kbd:`Ctrl+G` and :kbd:`Shift+Ctrl+G`);
  * Automatically find first match when typing in find box;
  * Set initial find string to selection when opening find;
  * Pressing :kbd:`Esc` closes the find bar.

* Object inspector: a class and function browser;
* Go to an object definition with a mouse click (from Object inspector);
* Execute code snippets with the :guilabel:`Enter selected` command;
* Execute the whole script with the :guilabel:`Run script` command (this
  creates a byte-compiled file with the extension :file:`.pyc`).

.. note::

 Running partially or totally a script from the :guilabel:`Code Editor`
 outputs the result in the Console output area.

.. _figure_python_console_editor:

.. figure:: /static/user_manual/plugins/python_console_editor.png
   :align: center

   The Python Console editor

.. _console_options:

Options
=======

Accessible either from the Console toolbar or the contextual menu of Console
output panel or Code Editor, this adds further settings to manage and control
the Python console behavior:

* **Autocompletion:** If checked the code completion is enabled. You can get
  autocompletion from current document, from installed APIs and both from APIs
  and current document.

* **Autocompletion threshold:** Sets the threshold to display the autocompletion list
  (in chars typed).

* **Automatic parentheses insertion:** If checked enables the autoclosing for bracket.

* **Auto-save script before running:** Allows you to save automatically the script to
  be executed in order to avoid to save it after any modification. This action
  will store a temporary file into the temporary system directory that will be
  automatically deleted after running.

* **Using preloaded APIs file:** You can choose whether use the preload APIs file or
  load some APIs files saved on your system.

* **Using prepared APIs file:** If checked the ``*.pap`` file will be used for code
  completion. To generate a prepared APIs file you have to load at least an ``*.api``
  file and then compile it by clicking on **[Compile Apis...]** button.

.. tip:: **Save the options**

   To save the state of console's widgets you have to close the Python
   Console from the close button. This allows you to save the geometry to be
   restored to the next start.
