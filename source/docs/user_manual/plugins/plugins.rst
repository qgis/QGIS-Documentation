.. only:: html

   |updatedisclaimer|

.. index:: Plugins

.. _plugins:

*************
QGIS Plugins
*************

.. only:: html

   .. contents::
      :local:

QGIS has been designed with a plugin architecture. This allows many new
features and functions to be easily added to the application. Some of the
features in QGIS are actually implemented as plugins.

Core and External plugins
=========================

QGIS plugins are implemented either as **Core Plugins** or **External Plugins**.

:ref:`Core Plugins <core_plugins>` are maintained by the QGIS Development Team
and are automatically part of every QGIS distribution. They are written in one
of two languages: **C++** or **Python**.

Most of External Plugins are currently written in Python. They are stored either
in the 'Official' QGIS Repository at http://plugins.qgis.org/plugins/ or in
external repositories and are maintained by the individual authors. Detailed
documentation about the usage, minimum QGIS version, home page, authors,and
other important information are provided for the plugins in the Official
repository. For other external repositories, documentation might be available
with the external plugins themselves. External plugins documentation is not
included in this manual.

To install or activate a plugin, go to :menuselection:`Plugins` menu and select:

* |showPluginManager| :menuselection:`Manage and install plugins...` using
  online repositories;
* or |installPluginFromZip| :menuselection:`Install plugin from ZIP...` using a
  local compressed file.

Installed external python plugins are placed under :file:`~/.qgis2/python/plugins`
folder. Home directory (denoted by above ``~``) on Windows is usually something
like :file:`C:\\Documents and Settings\\(user)` (on Windows XP or earlier)
or :file:`C:\\Users\\(user)`. On some platforms (e.g., macOS), the :file:`.qgis2`
folder is hidden by default.

Paths to Custom C++ plugins libraries can also be added under
:menuselection:`Settings --> Options --> System`.

.. note::

 According to the :ref:`plugin manager settings <setting_plugins>`, QGIS main
 interface can display a blue link in the status bar to inform you that there
 are updates for your installed plugins or new plugins available.

.. index::
   single: Plugins; Plugin manager

.. _managing_plugins:

The Plugins Dialog
===================

The menus in the Plugins dialog allow the user to install, uninstall and upgrade
plugins in different ways. Each plugin has some metadata displayed in the right
panel:

* information on whether the plugin is experimental
* description
* rating vote(s) (you can vote for your preferred plugin!)
* tags
* some useful links to the home page, tracker and code repository
* author(s)
* version available

At the top of the dialog, a :guilabel:`Search` function helps you find any
plugin using metadata information (author, name, description...). It is
available in nearly every menu (except |transformSettings| :guilabel:`Settings`).

.. _setting_plugins:

The Settings tab
----------------

In the |transformSettings| :guilabel:`Settings` tab, you can use the following
options:

* |checkbox| :guilabel:`Check for updates on startup`. Whenever a new plugin or
  a plugin update is available, QGIS will inform you 'every time QGIS starts',
  'once a day', 'every 3 days', 'every week', 'every 2 weeks' or 'every month'.
* |checkbox| :guilabel:`Show also experimental plugins`. QGIS will show you
  plugins in early stages of development, which are generally unsuitable for
  production use.
* |checkbox| :guilabel:`Show also deprecated plugins`. Because they use
  functions that are no longer available in QGIS, these plugins are set
  deprecated and generally unsuitable for production use. They appear among
  invalid plugins list.

To add external author repositories, click **[Add...]** in the :guilabel:`Plugin
repositories` section.
If you do not want one or more of the added repositories, they can be disabled
via the **[Edit...]** button, or completely removed with the **[Delete]** button.

The default QGIS repository is an open repository and you don't need any
authentication to access it. You can however deploy your own plugin repository
and require an authentication (basic authentication, PKI). You can get more
information on QGIS authentication support in :ref:`authentication` chapter.

.. _figure_plugins_settings:

.. figure:: /static/user_manual/plugins/plugins_settings.png
   :align: center

   The |transformSettings| :guilabel:`Settings` tab

The All tab
-----------

In the |showPluginManager| :guilabel:`All` tab,
all the available plugins are listed, including both core and external
plugins. Use **[Upgrade all]** to look for new versions of the plugins.
Furthermore, you can use **[Install plugin]** if a plugin is listed but not
installed, **[Uninstall plugin]** as well as **[Reinstall plugin]** if a plugin
is installed. An installed plugin can be temporarily de/activated using the
checkbox.

.. _figure_plugins_all:

.. figure:: /static/user_manual/plugins/plugins_all.png
   :align: center

   The |showPluginManager| :guilabel:`All` tab


The Installed tab
-----------------

In |pluginInstalled| :guilabel:`Installed` tab,
you can find only the installed plugins. The external plugins
can be uninstalled and reinstalled using the **[Uninstall plugin]** and
**[Reinstall plugin]** buttons. You can **[Upgrade all]** here as well.

.. _figure_plugins_installed:

.. figure:: /static/user_manual/plugins/plugins_installed.png
   :align: center

   The |pluginInstalled| :guilabel:`Installed` tab

The Not installed tab
---------------------

The |plugin| :guilabel:`Not installed` tab lists all plugins available that
are not installed.
You can use the **[Install plugin]** button to implement a plugin into QGIS.

.. _figure_plugins_not_installed:

.. figure:: /static/user_manual/plugins/plugins_not_installed.png
   :align: center

   The |plugin| :guilabel:`Not installed` tab

The Upgradeable and New tabs
----------------------------

The |pluginUpgrade| :guilabel:`Upgradeable` and |pluginNew| :guilabel:`New` tabs
are enabled when new plugins are added to the repository or a new
version of an installed plugin is released.
If you activated |checkbox| :guilabel:`Show also experimental plugins` in the
|transformSettings| :guilabel:`Settings` menu, those also appear in the list
giving you opportunity to early test upcoming tools.

Installation can be done with the **[Install plugin]**, **[Upgrade plugin]** or
**[Upgrade all]** buttons.

.. _figure_plugins_upgradeable:

.. figure:: /static/user_manual/plugins/plugins_upgradeable.png
   :align: center

   The |pluginUpgrade| :guilabel:`Upgradeable` tab

The Invalid tab
---------------

The |pluginInvalid| :guilabel:`Invalid` tab lists all installed plugins that are
currently broken for any reason (missing dependency, errors while loading,
incompatible functions with QGIS version...). 
You can try the **[Reinstall plugin]** button to fix an invalidated plugin but
most of the times the fix will be elsewhere (install some libraries, look for
another compatible plugin or help to upgrade the broken one).

.. _figure_plugins_invalid:

.. figure:: /static/user_manual/plugins/plugins_invalid.png
   :align: center

   The |pluginInvalid| :guilabel:`Invalid` tab

