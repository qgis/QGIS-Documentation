.. index::
   single: Python

.. _console:

*******************
QGIS Python console
*******************

.. only:: html

   .. contents::
      :local:

As you will see later in this chapter, QGIS has been designed with a plugin architecture.
Plugins can be written in Python, a very famous language in the geospatial world.

QGIS brings a Python API (see :ref:`PyQGIS Developer Cookbook <PyQGIS-Developer-Cookbook>`
for some code sample) to let the user interact with its objects (layers, feature or interface).
QGIS also has a Python console.

The QGIS Python Console is an interactive shell for Python command executions.
It also has a Python file editor that allows you to edit and save your Python scripts.
Both console and editor are based on PyQScintilla2 package.
To open the console go to :menuselection:`Plugins --> Python Console` (:kbd:`Ctrl+Alt+P`) or
click on the |pythonFile| :sup:`Python Console` icon in the :guilabel:`Plugins` toolbar.

.. _interactive_console:

The Interactive Console
=======================

The console is a Python interpreter that allows you to execute Python commands.
Modules from QGIS (analysis, core, gui, server, processing, 3d)
and Qt (QtCore, QtGui, QtNetwork, QtWidgets, QtXml)
as well as Python's math, os, re and sys modules are already imported
and can be used directly.

The interactive console is composed of a toolbar, an input area and an output one.

.. _figure_python_console:

.. figure:: img/python_console.png
   :align: center

   The Python Console

Toolbar
-------

The toolbar proposes the following tools:

* |clearConsole| :sup:`Clear Console` to wipe the output area;
* |start| :sup:`Run Command` available in the input area: same as
  pressing :kbd:`Enter`;
* |showEditorConsole| :sup:`Show Editor`: toggles :ref:`console_editor`
  visibility;
* |options| :sup:`Options...`: opens a dialog to configure :ref:`console properties
  <console_options>`;
* |helpContents| :sup:`Help...` provides a menu to access various documentation:

  * :ref:`Python Console Help <console>` (the current page)
  * :pyqgis:`PyQGIS API documentation <>`
  * :ref:`PyQGIS Cookbook <PyQGIS-Developer-Cookbook>`
* |dock| :sup:`Dock Code Editor` to dock or undock the panel in QGIS interface

Input area
----------

The Console input area main features are:

* Code completion, highlighting syntax and calltips for the following APIs:

  * Python
  * PyQGIS
  * PyQt6
  * QScintilla2
  * osgeo-gdal-ogr
  * osgeo-geos

* :kbd:`Ctrl+Alt+Space` to view the auto-completion list if enabled in the
  :ref:`console_options`;
* Execute code snippets from the input area by typing and pressing :kbd:`Enter`
  or :guilabel:`Run Command`;
* Execute code snippets from the output area using the :guilabel:`Enter Selected`
  from the contextual menu or pressing :kbd:`Ctrl+E`;
* Browse the command history from the input area using the :kbd:`Up` and
  :kbd:`Down` arrow keys and execute the command you want;
* :kbd:`Ctrl+Shift+Space` to view the command history: double-clicking a row
  will execute the command. The :guilabel:`Command History` dialog can also be
  accessed from context menu of input area;
* Save and clear the command history. The history will be saved into the
  :file:`console_history.txt` file under the active :ref:`user profile
  <user_profiles>` folder;

* Type the following special commands:

  * ``?`` to show a help of the Python Console
  * ``_api`` to open :api:`QGIS C++ API <>` documentation
    or ``_api(object)`` for a specific object documentation
    (in QGIS C++ API or Qt API documentation)
  * ``_pyqgis`` to open :pyqgis:`QGIS Python API <>` documentation
    or ``_pyqgis(object)`` for a specific object documentation
    (in QGIS Python API or Qt API documentation)
  * ``_cookbook`` to open :ref:`PyQGIS Cookbook <PyQGIS-Developer-Cookbook>`.
  * ``!`` followed by a command to execute Shell commands from the Python Console.
    The console will start a subprocess, and forward its output to the Python Console Output.
    While the subprocess is running, the Python Console Input switches to STDIN mode
    and forwards entered character to the child process.
    This makes it possible to send confirmation when the child program asks for it.
    When the Console is in STDIN mode, pressing :kbd:`Ctrl+C` kills the subprocess.
    It is also possible to affect the result of a command to a variable with the syntax ``var = !cmd``

    .. code-block:: bash

      >>> !echo QGIS Rocks!
      QGIS Rocks

      >>> !gdalinfo --version
      GDAL 3.10.3, released 2025/04/01

      >>> !pip install black
      # Install black python formatter using pip (if available)

      >>> sql_formats = !ogrinfo --formats | grep SQL
      >>> sql_formats
      ['SQLite -vector- (rw+v): SQLite / Spatialite', '  MSSQLSpatial -vector- (rw+): Microsoft SQL Server Spatial Database', '  PostgreSQL -vector- (rw+): PostgreSQL/PostGIS', '  MySQL -vector- (rw+): MySQL', '  PGDUMP -vector- (w+v): PostgreSQL SQL dump']


.. tip:: **Reuse executed commands from the output panel**

 You can execute code snippets from the output panel by selecting some text and
 pressing :kbd:`Ctrl+E`. No matter if selected text contains the interpreter
 prompt (``>>>``, ``...``).


.. _console_editor:

The Code Editor
===============

Use the |showEditorConsole| :sup:`Show Editor` button in the Interactive Console to enable the editor widget.
It allows editing and saving Python scripts and offers advanced functionalities
to manage your code.
Depending on the :ref:`enabled settings <console_options>`,
it provides various capabilities for easier code writing,
such as code completion, highlighting syntax and calltips for supported APIs.
Automatic indentation, parenthesis insertion, code commenting and syntax checking are also available.

.. _figure_python_console_editor:

.. figure:: img/python_console_editor.png
   :align: center

   The Python Console editor

The code editor area allows to simultaneously work on different scripts, each in a specific tab.
Press |symbologyAdd| :sup:`New editor` to add a new tab.
You can run partially or totally a script from the :guilabel:`Code Editor`
and output the result in the Interactive Console output area.


.. tip:: Press :kbd:`Ctrl+Space` to view the auto-completion list.

At the top of the dialog, a toolbar provides access to a few commands.
Right-clicking the editor area provides some more options.
All available tools are described in the following table.

.. table:: Python Console Editor Tools
  :widths: 20 60 20
  :class: longtable

  +-------------------------------------------------------+--------------------------------------------------------------------------------------+---------------------------+
  | Tool name                                             | Function                                                                             | Location                  |
  +=======================================================+======================================================================================+===========================+
  | |scriptOpen| :guilabel:`Open script…` (:kbd:`Ctrl+O`) | Loads a Python file in the code editor dialog, as a new tab                          | Toolbar                   |
  +-------------------------------------------------------+--------------------------------------------------------------------------------------+                           |
  | |showEditorConsole|                                   | Opens a saved Python script in the default external program                          |                           |
  | :guilabel:`Open in external editor…`                  | set for Python file editing                                                          |                           |
  +-------------------------------------------------------+--------------------------------------------------------------------------------------+                           |
  | |fileSave| :guilabel:`Save` (:kbd:`Ctrl+S`)           | Saves the current script                                                             |                           |
  +-------------------------------------------------------+--------------------------------------------------------------------------------------+                           |
  | |fileSaveAs| :guilabel:`Save as…`                     | Saves the current script as a new file                                               |                           |
  | (:kbd:`Ctrl+Shift+S`)                                 |                                                                                      |                           |
  +-------------------------------------------------------+--------------------------------------------------------------------------------------+---------------------------+
  | |start| :guilabel:`Run script` (:kbd:`Ctrl+Shift+E`)  | Executes the whole script in the Interactive console                                 | Toolbar & Contextual menu |
  |                                                       | (this creates a byte-compiled file with the extension :file:`.pyc`)                  |                           |
  +-------------------------------------------------------+--------------------------------------------------------------------------------------+                           |
  | |runSelected| :guilabel:`Run selection`               | Executes in the Interactive console the lines selected in the script                 |                           |
  | (:kbd:`Ctrl+E`)                                       |                                                                                      |                           |
  +-------------------------------------------------------+--------------------------------------------------------------------------------------+                           |
  | |editCut| :guilabel:`Cut` (:kbd:`Ctrl+X`)             | Cuts selected text to the clipboard                                                  |                           |
  +-------------------------------------------------------+--------------------------------------------------------------------------------------+                           |
  | |editCopy| :guilabel:`Copy` (:kbd:`Ctrl+C`)           | Copies selected text to the clipboard                                                |                           |
  +-------------------------------------------------------+--------------------------------------------------------------------------------------+                           |
  | |editPaste| :guilabel:`Paste` (:kbd:`Ctrl+V`)         | Pastes a cut or copied text                                                          |                           |
  +-------------------------------------------------------+--------------------------------------------------------------------------------------+                           |
  | |searchEditorConsole| :guilabel:`Find text`           | Allows to search and replace a text in the script.                                   |                           |
  |                                                       |                                                                                      |                           |
  |                                                       | * Use the default Desktop Environment shortcut to find next/previous                 |                           |
  |                                                       |   (:kbd:`Ctrl+G` and :kbd:`Shift+Ctrl+G`);                                           |                           |
  |                                                       | * Automatically find first match when typing in find box;                            |                           |
  |                                                       | * Set initial find string to selection when opening find;                            |                           |
  |                                                       | * Enable the |searchRegex| :guilabel:`Use Regular Expressions` option                |                           |
  |                                                       |   in the search bar to use regular expressions                                       |                           |
  |                                                       |   instead of plain text matching;                                                    |                           |
  |                                                       | * |replace| :sup:`Replace` the matching text with the text in the replace box.       |                           |
  |                                                       |   When using a regular expression, you can reference captured groups                 |                           |
  |                                                       |   (e.g. via ``\1``) in the replacement text.                                         |                           |
  |                                                       |   Use :guilabel:`Replace All` to replace all matches at once.                        |                           |
  |                                                       | * Pressing :kbd:`Esc` closes the find bar.                                           |                           |
  +-------------------------------------------------------+--------------------------------------------------------------------------------------+                           |
  | |commentEditorConsole| :guilabel:`Toggle comment`     | Comments out or uncomment selected lines, by adding or removing ``#`` character      |                           |
  | (:kbd:`Ctrl+:` on Windows, :kbd:`Ctrl+/` on other     | (potentially followed by a space) at the start of the lines.                         |                           |
  | platforms)                                            | If the selection contains both comments and actual commands,                         |                           |
  |                                                       | adds ``#`` at the start of each non empty line.                                      |                           |
  |                                                       | Pressing again the button reverts to the initial state.                              |                           |
  +-------------------------------------------------------+--------------------------------------------------------------------------------------+                           |
  | |formatCode| :guilabel:`Reformat code`                | Allows to manually apply various formatting rules                                    |                           |
  | (:kbd:`Ctrl+Alt+F`)                                   | (sort imports, indentation, line length,…) to the code,                              |                           |
  |                                                       | following :ref:`user-defined settings <python_code_formatting>`.                     |                           |
  |                                                       | This may require installation of additional Python modules.                          |                           |
  +-------------------------------------------------------+--------------------------------------------------------------------------------------+                           |
  | |classBrowserConsole| :guilabel:`Object inspector…`   | Shows and hides a dedicated browser with a tree structure                            |                           |
  |                                                       | for classes and functions available in the script.                                   |                           |
  |                                                       | Click an item fo a quick access to its definition.                                   |                           |
  |                                                       | The tool requires an activation from                                                 |                           |
  |                                                       | the :ref:`Python settings - Run and Debug <python_debugger>`.                        |                           |
  +-------------------------------------------------------+--------------------------------------------------------------------------------------+---------------------------+
  | :guilabel:`Hide editor`                               | Hides the Python code editor block.                                                  | Contextual menu           |
  |                                                       | To make it visible again, press |showEditorConsole| :sup:`Show editor button`        |                           |
  |                                                       | from the interactive console toolbar.                                                |                           |
  +-------------------------------------------------------+--------------------------------------------------------------------------------------+                           |
  | |syntaxErrorConsole| :guilabel:`Check syntax`         | Browses the code and reports syntax errors, such as missing parenthesis,             |                           |
  | (:kbd:`Ctrl+4`)                                       | colons, wrong indentation,…                                                          |                           |
  +-------------------------------------------------------+--------------------------------------------------------------------------------------+                           |
  | |undo| :guilabel:`Undo` (:kbd:`Ctrl+Z`)               | Undoes the latest action                                                             |                           |
  +-------------------------------------------------------+--------------------------------------------------------------------------------------+                           |
  | |redo| :guilabel:`Redo` (:kbd:`Ctrl+Shift+Z`)         | Reverts undone actions to a more recent                                              |                           |
  +-------------------------------------------------------+--------------------------------------------------------------------------------------+                           |
  | :guilabel:`Select all` (:kbd:`Ctrl+A`)                | Selects the whole script                                                             |                           |
  +-------------------------------------------------------+--------------------------------------------------------------------------------------+                           |
  | |codepadConsole| :guilabel:`Share on GitHub`          | Shares the script as a :guilabel:`Secret Gist` or :guilabel:`Public Gist` on GitHub, |                           |
  |                                                       | provided a :ref:`GitHub access token <github_token>`.                                |                           |
  +-------------------------------------------------------+--------------------------------------------------------------------------------------+                           |
  | |options| :guilabel:`Options…`                        | Opens the :ref:`console_options` dialog.                                             |                           |
  +-------------------------------------------------------+--------------------------------------------------------------------------------------+---------------------------+


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |classBrowserConsole| image:: /static/common/iconClassBrowserConsole.png
   :width: 1.5em
.. |clearConsole| image:: /static/common/iconClearConsole.png
   :width: 1.5em
.. |codepadConsole| image:: /static/common/iconCodepadConsole.png
   :width: 1.5em
.. |commentEditorConsole| image:: /static/common/iconCommentEditorConsole.png
   :width: 1.5em
.. |dock| image:: /static/common/dock.png
   :width: 1.5em
.. |editCopy| image:: /static/common/mActionEditCopy.png
   :width: 1.5em
.. |editCut| image:: /static/common/mActionEditCut.png
   :width: 1.5em
.. |editPaste| image:: /static/common/mActionEditPaste.png
   :width: 1.5em
.. |fileSave| image:: /static/common/mActionFileSave.png
   :width: 1.5em
.. |fileSaveAs| image:: /static/common/mActionFileSaveAs.png
   :width: 1.5em
.. |formatCode| image:: /static/common/iconFormatCode.png
   :width: 1.5em
.. |helpContents| image:: /static/common/mActionHelpContents.png
   :width: 1.5em
.. |options| image:: /static/common/mActionOptions.png
   :width: 1em
.. |pythonFile| image:: /static/common/mIconPythonFile.png
   :width: 1.5em
.. |redo| image:: /static/common/mActionRedo.png
   :width: 1.5em
.. |replace| image:: /static/common/mActionReplace.png
   :width: 1.5em
.. |runSelected| image:: /static/common/mActionRunSelected.png
   :width: 1.5em
.. |scriptOpen| image:: /static/common/mActionScriptOpen.png
   :width: 1.5em
.. |searchEditorConsole| image:: /static/common/iconSearchEditorConsole.png
   :width: 1.5em
.. |searchRegex| image:: /static/common/mIconSearchRegex.png
   :width: 1.5em
.. |showEditorConsole| image:: /static/common/iconShowEditorConsole.png
   :width: 1.5em
.. |start| image:: /static/common/mActionStart.png
   :width: 1.5em
.. |symbologyAdd| image:: /static/common/symbologyAdd.png
   :width: 1.5em
.. |syntaxErrorConsole| image:: /static/common/iconSyntaxErrorConsole.png
   :width: 1.5em
.. |undo| image:: /static/common/mActionUndo.png
   :width: 1.5em
