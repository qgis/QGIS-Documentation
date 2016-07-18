|updatedisclaimer|

.. index::
   single:plugins

.. _plugins:

*************
QGIS Plugins
*************

.. only:: html

   .. contents::
      :local:

QGIS has been designed with a plugin architecture. This allows many new
features and functions to be easily added to the application. Many of the features
in QGIS are actually implemented as plugins.

Core and External plugins
=========================

QGIS plugins are implemented either as **Core Plugins** or **External Plugins**.

:ref:`Core Plugins <core_plugins>` are maintained by the QGIS Development Team and are
automatically part of every QGIS distribution. They are written in one of two
languages: C++ or Python.

Most of External Plugins are currently written in Python. They are stored either in the
'Official' QGIS Repository at http://plugins.qgis.org/plugins/ or in external
repositories and are maintained by the individual authors.
Detailed documentation about the usage, minimum QGIS version, home page, authors,
and other important information are provided for the plugins in the Official repository.
For other external repositories, documentation might
be available with the external plugins themselves. In general, external plugins
documentation is not included in this manual.

Installed external python plugins are placed under :file:`~/.qgis2/python/plugins`
folder. Home directory (denoted by above ``~``) on Windows is usually something
like :file:`C:\\Documents and Settings\\(user)` (on Windows XP or earlier)
or :file:`C:\\Users\\(user)`.

Paths to Custom C++ plugins libraries can also be added under
:menuselection:`Settings --> Options --> System`.

You can manage your plugins in the plugin dialog which can be opened with
:guilabel:`Plugins > Manage and install plugins ...`.

When a plugin needs to be updated, and if plugins settings have been set up
accordingly, QGIS main interface will display a blue link in the status bar
to inform you that there are updates for your plugins waiting to be applied.

.. :index::
    single:plugins;managing

.. _managing_plugins:

The Plugins Dialog
===================

The menus in the Plugins dialog allow the user to install, uninstall and upgrade plugins in
different ways. Each plugin has some metadata displayed in the right panel:

* information on whether the plugin is experimental
* description
* rating vote(s) (you can vote for your preferred plugin!)
* tags
* some useful links to the home page, tracker and code repository
* author(s)
* version available

You can use the filter to find a specific plugin.

|showPluginManager| :guilabel:`All`

Here, all the available plugins are listed, including both core and external plugins.
Use **[Upgrade all]** to look for new versions of the plugins. Furthermore,
you can use **[Install plugin]** if a plugin is listed but not installed,
**[Uninstall plugin]** as well as **[Reinstall plugin]** if a plugin is installed.
An installed plugin can be temporarily de/activated using the checkbox.

.. _figure_plugins_1:

.. only:: html

   **Figure Plugins 1:**

.. figure:: /static/user_manual/plugins/plugins_all.png
   :align: center

   The |showPluginManager| :guilabel:`All` menu


|pluginInstalled| :guilabel:`Installed`

In this menu, you can find only the installed plugins. The external plugins
can be uninstalled and reinstalled using the **[Uninstall plugin]** and
**[Reinstall plugin]** buttons. You can **[Upgrade all]** here as well.

.. _figure_plugins_2:

.. only:: html

   **Figure Plugins 2:**

.. figure:: /static/user_manual/plugins/plugins_installed.png
   :align: center

   The |pluginInstalled| :guilabel:`Installed` menu


|plugin| :guilabel:`Not installed`

This menu lists all plugins available that are not installed.
You can use the **[Install plugin]** button to implement a plugin into QGIS.

.. _figure_plugins_3:

.. only:: html

   **Figure Plugins 3:**

.. figure:: /static/user_manual/plugins/plugins_not_installed.png
   :align: center

   The |plugin| :guilabel:`Not installed` menu


|pluginUpgrade| :guilabel:`Upgradeable`

If you activated |checkbox| :guilabel:`Show also experimental plugins` in the
|transformSettings| :guilabel:`Settings` menu, you can use this menu
to look for more recent plugin versions. This can be done with the **[Upgrade plugin]** or
**[Upgrade all]** buttons.

.. _figure_plugins_4:

.. only:: html

   **Figure Plugins 4:**

.. figure:: /static/user_manual/plugins/plugins_upgradeable.png
   :align: center

   The |pluginUpgrade| :guilabel:`Upgradeable` menu

.. _setting_plugins:

|transformSettings| :guilabel:`Settings`

In this menu, you can use the following options:

* |checkbox| :guilabel:`Check for updates on startup`. Whenever a new plugin or
  a plugin update is available, QGIS will inform you 'every time QGIS starts', 'once a day',
  'every 3 days', 'every week', 'every 2 weeks' or 'every month'.
* |checkbox| :guilabel:`Show also experimental plugins`. QGIS will show you
  plugins in early stages of development, which are generally unsuitable for production
  use.
* |checkbox| :guilabel:`Show also deprecated plugins`. These plugins are deprecated
  and generally unsuitable for production use.

To add external author repositories, click **[Add...]** in the :guilabel:`Plugin
repositories` section.
If you do not want one or more of the added repositories, they can be disabled
via the **[Edit...]** button, or completely removed with the **[Delete]** button.

Note that you can use an authentication (basic authentication, PKI) to access
to a plugin repository. The default QGIS repository is an open repository and
you don't need any authentication. You should deploy your own plugin
repository. You can get more information on QGIS authentication support in
:ref:`authentication` chapter.

.. _figure_plugins_5:

.. only:: html

   **Figure Plugins 5:**

.. figure:: /static/user_manual/plugins/plugins_settings.png
   :align: center

   The |transformSettings| :guilabel:`Settings` menu

The :guilabel:`Search` function is available in nearly every menu
(except |transformSettings| :guilabel:`Settings`).
Here, you can look for specific plugins.


