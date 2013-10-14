.. |updatedisclaimer|

.. index::
   single:plugins

.. _plugins:

************
QGIS Plugins
************

QGIS has been designed with a plugin architecture. This allows many new
features/functions to be easily added to the application. Many of the features
in QGIS are actually implemented as either **core** or **external plugins**.

.. index::
   single:plugins;types

* **Core Plugins** are maintained by the QGIS Development Team and are
  automatically part of every QGIS distribution. They are written in one of two
  languages: C++ or Python. More information about core plugins are provided in
  Section :ref:`core_plugins`
* **External Plugins** are currently all written in Python. They are stored in
  external repositories and maintained by the individual authors. They can be
  added to QGIS in the |mActionShowPluginManager| :guilabel:`Get more` section
  the of :guilabel:`Plugin Manager`. More information about external plugins is
  provided in Section :ref:`load_external_plugin`.

.. :index::
    single:plugins;managing

.. _managing_plugins:

Managing Plugins
================

Managing plugins in general means loading or unloading them using the
:guilabel:`Plugin Manager`. To deactivate and reactivate external plugins,
the :guilabel:`Plugin Manager` is used again.

.. _load_core_plugin:

Loading a QGIS Core Plugin
--------------------------

Loading a QGIS Core Plugin is done from the main menu :menuselection:`Plugins -->`
|mActionShowPluginManager| :menuselection:`Manage and Install Plugins`.

.. index::
   single: plugins; manager

.. _figure_plugins_1:

.. only:: html

   **Figure Plugins 1:**

.. figure:: /static/user_manual/plugins/pluginmanager.png
   :align: center
   :width: 30em

   Plugin Manager |nix|

The |plugin| :guilabel:`Installed` menu of the :guilabel:`Plugin Manager` lists all the
available plugins and their status (loaded or unloaded), including all core plugins
and all external plugins that have been installed and automatically activated using
the |mActionShowPluginManager| :guilabel:`Get more` menu (see Section :ref:`load_external_plugin`). 
Those plugins that are already loaded have a check mark to the left of their name.
Figure_plugins_1_ shows the |plugin| :guilabel:`Installed` dialog. 

To enable a particular core plugin, click on the checkbox to the left of the plugin
name, and click **[OK]**. When you exit the application, a list of loaded plugins
is retained, and the plugins are automatically loaded.

.. _load_external_plugin:

Loading an external QGIS Plugin
-------------------------------

External QGIS plugins are written in Python. They are by default stored in either
the 'Official' QGIS Repository, or in various other external repositories
maintained by individual authors. You can find the external plugins in the 
|mActionShowPluginManager| :guilabel:`Get more` menu.

In the |plugin| :guilabel:`Installed` menu you can see the path if it is an external plugin.
External plugins are only installed in your home directory while core plugins
are stored in ``/usr`` . 

Detailed documentation about the usage, minimum QGIS version, homepage, authors,
and other important information are provided for the 'Official' QGIS Repository
at http://plugins.qgis.org/plugins/. For other external repositories, they might
be available with the external plugins themselves. In general it is not included
in this manual.

Currently there are over 150 external plugins available from the 'Official' QGIS
Repository. Some of these plugins offer functionality that will be required by
many users (for example: providing the user with the ability to view and edit
OpenStreetMap data, or to add GoogleMap layers) while others offer very
specialized functions (for example: Calculate economic pipe diameters for water
supply networks).

It is, however, quite straightforward to search through all the available external
plugins by providing keywords, choosing a named repository and/or filtering on
the status of plugins (currently installed or uninstalled in your system).
Searching and filtering is done from the QGIS Python Plugin Installer

.. tip:: **Add more repositories**

   To add external author repositories, open the Plugin Installer
   |mActionShowPluginManager| :menuselection:`Manage and Install Plugins`, go to the menu
   |mActionTransformSettings| :guilabel:`Settings`, and click **[Add]** (see figure_plugins_2_).
   If you do not want one or more of the added repositories, they can be disabled
   via the **[Edit...]** button, or completely removed with the **[Delete]** button.

As such, we cannot take any responsibility for them. You can also manage the
repository list manually, that is add, remove, and edit the entries. Temporarily
disabling a particular repository is possible by clicking the **[Edit ...]**
button.

.. _figure_plugins_2:

.. only:: html

   **Figure Plugins 2:**

.. figure:: /static/user_manual/plugins/pluginsettings.png
   :align: center
   :width: 30em

   Plugin Settings |nix|

.. tip:: **Check for updates**

   You can stay informed about plugins. Activate the checkbox |checkbox| 
   :guilabel:`Check for updates on startup` from the|mActionTransformSettings|
   :guilabel:`Settings` menu. QGIS will inform you whenever a plugin or plugin
   update is available.
