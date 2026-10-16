.. index:: Settings; Reading, Settings; Storing

.. highlight:: python
   :linenothreshold: 5


.. testsetup:: settings

    iface = start_qgis()

    from qgis.core import QgsSettingsTree
    SETTINGS_NODE = QgsSettingsTree.createPluginTreeNode("my_plugin")

.. _settings:

****************************
Reading And Storing Settings
****************************


.. hint:: The code snippets on this page need the following imports if you're outside the pyqgis console:

  .. testcode:: settings

    from qgis.core import (
      Qgis,
      QgsProject,
      QgsSettingsEntryEnumFlag,
      QgsSettingsEntryInteger,
      QgsSettingsEntryString,
      QgsVectorLayer
    )

.. only:: html

   .. contents::
      :local:

Many times it is useful for a plugin to save some variables so that the user
does not have to enter or select them again next time the plugin is run.

We can differentiate between several types of settings:

.. index:: Settings; Global

* **global settings** --- they are bound to the user at a particular machine.
  QGIS itself stores a lot of global settings, for example, main window size or
  default snapping tolerance. They are described in :ref:`settings_global` below.

.. index:: Settings; Project

* **project settings** --- vary between different projects and therefore they
  are connected with a project file. Map canvas background color or destination
  coordinate reference system (CRS) are examples --- white background and WGS84
  might be suitable for one project, while yellow background and UTM projection
  are better for another one.

  An example of usage follows.

  .. testcode:: settings

    proj = QgsProject.instance()

    # store values
    proj.writeEntry("myplugin", "mytext", "hello world")
    proj.writeEntry("myplugin", "myint", 10)
    proj.writeEntryDouble("myplugin", "mydouble", 0.01)
    proj.writeEntryBool("myplugin", "mybool", True)

    # read values (returns a tuple with the value, and a status boolean
    # which communicates whether the value retrieved could be converted to
    # its type, in these cases a string, an integer, a double and a boolean
    # respectively)

    mytext, type_conversion_ok = proj.readEntry("myplugin",
                                                "mytext",
                                                "default text")
    myint, type_conversion_ok = proj.readNumEntry("myplugin",
                                                  "myint",
                                                  123)
    mydouble, type_conversion_ok = proj.readDoubleEntry("myplugin",
                                                        "mydouble",
                                                        123)
    mybool, type_conversion_ok = proj.readBoolEntry("myplugin",
                                                    "mybool",
                                                    123)

  As you can see, the :meth:`writeEntry() <qgis.core.QgsProject.writeEntry>`
  method is used for many data types (integer, string, list), but
  several methods exist for reading the setting value back, and the
  corresponding one has to be selected for each data type.

.. index:: Settings; Map layer

* **map layer settings** --- these settings are related to a particular
  instance of a map layer with a project. They are *not* connected with
  underlying data source of a layer, so if you create two map layer instances
  of one shapefile, they will not share the settings. The settings are stored
  inside the project file, so if the user opens the project again, the layer-related
  settings will be there again. The value for a given setting is retrieved using
  the :meth:`customProperty() <qgis.core.QgsMapLayer.customProperty>` method,
  and can be set using the
  :meth:`setCustomProperty() <qgis.core.QgsMapLayer.setCustomProperty>` one.

  .. testcode:: settings

   vlayer = QgsVectorLayer()
   # save a value
   vlayer.setCustomProperty("mytext", "hello world")

   # read the value again (returning "default text" if not found)
   mytext = vlayer.customProperty("mytext", "default text")


.. _settings_global:

Global settings
===============

Global settings are saved in the :file:`QGIS/QGIS4.ini` file of the active
:ref:`user profile <user_profiles>`. Each setting is declared once as a
settings entry, with its type, its default value and a description, and is
placed in the settings tree.


.. index:: Settings; Settings entries
.. _settings_entries:

Settings entries
----------------

A settings entry is an object describing a single setting: its name, its
parent node in the settings tree, its default value, a description and, for
some types, the accepted range of values.
There is one class per type of value, such as
:class:`QgsSettingsEntryString <qgis.core.QgsSettingsEntryString>` or
:class:`QgsSettingsEntryInteger <qgis.core.QgsSettingsEntryInteger>`.

Compared to reading and writing values by their key, settings entries:

* return values of the right type, without any conversion;
* define the default value in a single place;
* reject values outside of the accepted range;
* are listed, with their description and type, in the
  :guilabel:`Advanced Settings Editor` (see :ref:`optionsadvanced`),
  where they can be edited with a widget suited to their type.

The settings tree
.................

All the settings entries are organized in a tree,
:class:`QgsSettingsTree <qgis.core.QgsSettingsTree>`.
Each node of the tree is a
:class:`QgsSettingsTreeNode <qgis.core.QgsSettingsTreeNode>`.
QGIS settings live under nodes such as ``core``, ``gui`` or ``digitizing``,
and plugin settings live under ``plugins/<plugin_name>``.

A settings entry is attached to the tree as soon as it is created:
the second argument of its constructor is its parent node.
The key of the setting is made of the key of its parent node,
followed by the name of the setting.

The plugin settings node
........................

Since QGIS 4.2, when a Python plugin is started, QGIS creates a settings node
for it and makes it available as the ``SETTINGS_NODE`` attribute of the plugin
package. The key of this node is ``plugins/<plugin_name>``, where
``<plugin_name>`` is the name of the plugin folder. When the plugin is
unloaded, QGIS removes the node and the settings entries declared under it.
The stored values are kept, and are found again the next time the plugin is
loaded.

A plugin which does not declare any settings is not affected: the node
only exists in memory, and nothing is written to the settings file until a
value is set.

It is good practice to declare all the settings of a plugin in a dedicated
module, for example :file:`settings.py`:

.. code-block:: python

  # my_plugin/settings.py
  from qgis.core import QgsSettingsEntryBool, QgsSettingsEntryString

  from . import SETTINGS_NODE

  GREETING = QgsSettingsEntryString(
      "greeting", SETTINGS_NODE, "Hello", "Message displayed by the plugin"
  )
  LOUD = QgsSettingsEntryBool(
      "loud", SETTINGS_NODE, False, "Display the message in upper case"
  )

The other modules of the plugin import this module and use the settings
entries directly:

.. code-block:: python

  # my_plugin/my_plugin.py
  from qgis.core import Qgis, QgsMessageLog

  from . import settings


  class MyPlugin:
      def __init__(self, iface):
          self.iface = iface

      def initGui(self):
          pass

      def unload(self):
          pass

      def say_hello(self):
          msg = settings.GREETING.value()
          if settings.LOUD.value():
              msg = msg.upper() + "!!!"
          QgsMessageLog.logMessage(msg, "MyPlugin", Qgis.MessageLevel.Info)

          # write a setting back
          settings.LOUD.setValue(not settings.LOUD.value())

.. warning:: QGIS imports the plugin package first and sets ``SETTINGS_NODE``
   only just before calling :func:`classFactory`.
   The module declaring the settings must therefore not be imported at the top
   of :file:`__init__.py`: import the plugin class inside :func:`classFactory`
   instead.

   .. code-block:: python

     # my_plugin/__init__.py
     def classFactory(iface):
         from .my_plugin import MyPlugin
         return MyPlugin(iface)

.. note:: ``SETTINGS_NODE`` requires QGIS 4.2, so set ``qgisMinimumVersion=4.2``
   in the :ref:`metadata <plugin_metadata>` of the plugin.

Reading and writing values
..........................

The snippets below use the ``SETTINGS_NODE`` of a plugin.
A setting can only be declared once in a node: declaring it a second
time raises a :class:`QgsSettingsException <qgis.core.QgsSettingsException>`.

The value of a setting is read with
:meth:`value() <qgis.core.QgsSettingsEntryBaseTemplateintBase.value>`
and written with
:meth:`setValue() <qgis.core.QgsSettingsEntryBaseTemplateintBase.setValue>`.
As long as no value is stored, the default value is returned.

.. testcode:: settings

  MAX_FEATURES = QgsSettingsEntryInteger(
      "max-features",
      SETTINGS_NODE,
      1000,
      "Maximum number of features to process",
      minValue=1,
  )

  print(MAX_FEATURES.key())
  print(MAX_FEATURES.value())  # no value stored yet: the default value

  MAX_FEATURES.setValue(500)
  print(MAX_FEATURES.value())

  # values outside of the accepted range are rejected
  print(MAX_FEATURES.setValue(0))
  print(MAX_FEATURES.value())

  # remove the stored value: the default value applies again
  MAX_FEATURES.remove()
  print(MAX_FEATURES.exists())
  print(MAX_FEATURES.value())

.. testoutput:: settings

  /plugins/my_plugin/max-features
  1000
  500
  False
  500
  False
  1000

Settings entries also provide
:meth:`defaultValue() <qgis.core.QgsSettingsEntryBaseTemplateintBase.defaultValue>`
and
:meth:`valueWithDefaultOverride() <qgis.core.QgsSettingsEntryBaseTemplateintBase.valueWithDefaultOverride>`,
which returns the stored value or, if there is none, the given default value.

Available types
...............

The following settings entries are available.
Their constructor takes the name of the setting, its parent node, the default
value, a description and options, followed by the arguments specific to the type.

.. list-table::
   :header-rows: 1
   :widths: auto

   * - Class
     - Type of value
     - Specific arguments
   * - :class:`QgsSettingsEntryBool <qgis.core.QgsSettingsEntryBool>`
     - ``bool``
     -
   * - :class:`QgsSettingsEntryInteger <qgis.core.QgsSettingsEntryInteger>`
     - ``int``
     - ``minValue``, ``maxValue``
   * - :class:`QgsSettingsEntryDouble <qgis.core.QgsSettingsEntryDouble>`
     - ``float``
     - ``minValue``, ``maxValue``, ``displayDecimals``
   * - :class:`QgsSettingsEntryString <qgis.core.QgsSettingsEntryString>`
     - ``str``
     - ``minLength``, ``maxLength``
   * - :class:`QgsSettingsEntryStringList <qgis.core.QgsSettingsEntryStringList>`
     - ``list`` of ``str``
     -
   * - :class:`QgsSettingsEntryColor <qgis.core.QgsSettingsEntryColor>`
     - ``QColor``
     - ``allowAlpha``
   * - :class:`QgsSettingsEntryVariantMap <qgis.core.QgsSettingsEntryVariantMap>`
     - ``dict``
     -
   * - :class:`QgsSettingsEntryVariant <qgis.core.QgsSettingsEntryVariant>`
     - any value which can be stored in a ``QVariant``
     -
   * - :class:`QgsSettingsEntryEnumFlag <qgis.core.PyQgsSettingsEntryEnumFlag>`
     - a member of an enum or a flag
     -

Enum and flag settings are stored by the name of their member rather than
by its integer value, which keeps the settings file readable.
Use the ``Qgis.SettingsOption.SaveEnumFlagAsInt`` option to store the
integer value instead.

.. testcode:: settings

  DISTANCE_UNIT = QgsSettingsEntryEnumFlag(
      "distance-unit",
      SETTINGS_NODE,
      Qgis.DistanceUnit.Meters,
      "Unit used to display distances",
  )

  DISTANCE_UNIT.setValue(Qgis.DistanceUnit.Kilometers)
  print(DISTANCE_UNIT.value().name)

.. testoutput:: settings

  Kilometers

The ``Qgis.SettingsOption.SaveFormerValue`` option keeps the previous value
of the setting each time it changes. The previous value is then returned by
:meth:`formerValue() <qgis.core.QgsSettingsEntryBaseTemplateQStringBase.formerValue>`.

Organizing settings
...................

To group related settings, create child nodes with
:meth:`createChildNode() <qgis.core.QgsSettingsTreeNode.createChildNode>`:

.. testcode:: settings

  EXPORT_NODE = SETTINGS_NODE.createChildNode("export")
  EXPORT_FORMAT = QgsSettingsEntryString("format", EXPORT_NODE, "GPKG")

  print(EXPORT_FORMAT.key())

.. testoutput:: settings

  /plugins/my_plugin/export/format

When the same group of settings must be stored for several items, whose names
are only known at runtime, use a named list node
(:class:`QgsSettingsTreeNamedListNode <qgis.core.QgsSettingsTreeNamedListNode>`),
created with
:meth:`createNamedListNode() <qgis.core.QgsSettingsTreeNode.createNamedListNode>`.
This is for instance the case of the connections to several servers,
each with its own URL and user name.
The settings declared under a named list node take the name of the item as an
additional argument, which is the dynamic part of their key.

.. testcode:: settings

  SERVERS_NODE = SETTINGS_NODE.createNamedListNode("servers")
  SERVER_URL = QgsSettingsEntryString("url", SERVERS_NODE, "")
  SERVER_USER = QgsSettingsEntryString("user", SERVERS_NODE, "")

  SERVER_URL.setValue("https://alpha.example.com", "alpha")
  SERVER_USER.setValue("jane", "alpha")
  SERVER_URL.setValue("https://beta.example.com", "beta")

  print(SERVERS_NODE.items())
  print(SERVER_URL.value("beta"))
  print(SERVER_URL.key("alpha"))

  # remove all the settings of an item
  SERVERS_NODE.deleteItem("alpha")
  print(SERVERS_NODE.items())

.. testoutput:: settings

  ['alpha', 'beta']
  https://beta.example.com
  /plugins/my_plugin/servers/items/alpha/url
  ['beta']

Named list nodes can be nested. The dynamic part of the key is then given as a
list of names, from the outermost to the innermost item.
Created with the ``Qgis.SettingsTreeNodeOption.NamedListSelectedItemSetting``
option, a named list node also stores which of its items is selected, with
:meth:`setSelectedItem() <qgis.core.QgsSettingsTreeNamedListNode.setSelectedItem>`
and
:meth:`selectedItem() <qgis.core.QgsSettingsTreeNamedListNode.selectedItem>`.

Conventions
...........

These conventions are the ones followed by QGIS itself
(see the :ref:`QGIS coding standards <settings_coding_standards>`):

* declare each setting once, at the module level, and use it from everywhere
  else;
* use ``kebab-case`` for the names of settings and nodes, for example
  ``max-features`` rather than ``maxFeatures`` or ``max_features``;
* give each setting a description, which is displayed in the
  :guilabel:`Advanced Settings Editor`;
* group related settings in child nodes, rather than putting ``/``
  in the names of the settings.

A plugin which used to store its values with :class:`QgsSettings <qgis.core.QgsSettings>`
can move them to the new keys with
:meth:`copyValueFromKey() <qgis.core.QgsSettingsEntryBase.copyValueFromKey>`.
The value is only copied if the old key exists and the new one does not, so
this can safely be run each time the plugin is loaded:

.. testcode:: settings

  GREETING = QgsSettingsEntryString("greeting", SETTINGS_NODE, "Hello")
  # move the value stored by an older version of the plugin, if any
  GREETING.copyValueFromKey("myplugin/greeting", removeSettingAtKey=True)
