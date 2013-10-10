|updatedisclaimer|


The SEXTANTE Commander
======================

SEXTANTE includes a practical tool that allows you to run algorithms without
having to use the toolbox, but just typing the name of the algorithm you want to
run.

This tools is known as the *SEXTANTE commander*, and it is just a simple text
box with autocompletion where you type the command you want to run.

.. _figure_commander_1:

.. only:: html

   **Figure SEXTANTE 28:**

.. figure:: /static/user_manual/processing/commander.png
   :align: center
   :width: 25em

   The SEXTANTE Commander |win|

The commander is started from the *Analysis* menu or, more practically, pressing
:kbd:`Shift + Ctrl + M` (you can change that default keyboard shortcut in the
QGIS configuration if you prefer a different one). Apart from executing SEXTANTE
algorithms, the commander gives you access to most of the functionality in QGIS,
which means that it gives you a practical and efficient way of running QGIS
tasks, and allows you to control QGIS reducing the usage of buttons and menus.

Moreover, the commander is configurable and you can add your custom commands and
have them just a few keystrokes away, making it a powerful tool to become more
productive in your daily work with QGIS

Available commands
------------------

The commands available in the commander fall in the following categories:

* SEXTANTE algorithms. They are shown as ``SEXTANTE algorithm: <name of the algorithm>``.
* Menu items. They are shown as ``Menu item: <menu entry text>``. All menus items
  available from the QGIS interface are available, even if they are included in
  a submenu.
* Python functions. You can create short Python functions that will be then
  included in the list of available commands. They are shown as
  ``Function: <function name>``

To run any of the above, just start typing and then select the corresponding
element from the list of available ones that appears after filtering the whole
list of commands with the text you have entered.

In the case of calling a Python function, you can select the entry in the list,
which is prefixed by ``Function:`` (for instance, ``Function: removeall), or
just directly type the function name (``removeall`` in the previous example).
There is no need to add brackets after the function name.

Creating custom functions
-------------------------

Custom functions are added by entering the corresponding Python code in the
``commands.py`` file that is found in the ``.qgis/sextante/commander directory``
in your user folder. It is just a simple Python file where you can add the
functions that you need.

The file is created the first time you open the commander, with a few example
functions. If you haven't launched the commander yet, you can create the file
yourself. To edit the commands file, use your favorite text editor. You can also
use a built-in editor by calling the ``edit`` command from the commander. It will
open the editor with the commands file, and you can edit it directly and then
save your changes.

For instance, you can add the following function, which removes all layers:

::

  from qgis.gui import *

  def removeall():
      mapreg = QgsMapLayerRegistry.instance()
      mapreg.removeAllMapLayers()

Once you have added the function, it will be available in the commander, and you
can invoke it by typing ``removeall``. There is no need to do anything apart
from writing the function itself.

Functions can receive parameters. Add ``*args`` to your function definition, to
receive argument. When calling the function from the commander, parameters have
to be passed separated by spaces.

Here is an example of a function that loads a layer and takes a parameter with
the filename of the layer to load.

::

  import sextante

  def load(*args):
    sextante.load(args[0])

If you want to load a layer in ``/home/myuser/points.shp``, type
``load /home/myuser/points.shp`` in the commander text box.
