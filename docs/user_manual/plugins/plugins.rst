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

.. _core_and_external_plugins:

Core and External plugins
=========================

QGIS plugins are implemented either as **Core Plugins** or **External Plugins**.

:ref:`Core Plugins <core_plugins>` are maintained by the QGIS Development Team
and are automatically part of every QGIS distribution. They are written in one
of two languages: **C++** or **Python**.

Most of External Plugins are currently written in Python. They are stored either
in the 'Official' QGIS Repository at https://plugins.qgis.org/plugins/ or in
external repositories and are maintained by the individual authors. Detailed
documentation about the usage, minimum QGIS version, home page, authors, and
other important information are provided for the plugins in the Official
repository. For other external repositories, documentation might be available
with the external plugins themselves. External plugins documentation is not
included in this manual.

To install or activate a plugin, go to :menuselection:`Plugins` menu and select
|showPluginManager| :menuselection:`Manage and install plugins...`.
Installed external python plugins are placed under the :file:`python/plugins`
folder of the active :ref:`user profile <user_profiles>` path.

Paths to Custom C++ plugins libraries can also be added under
:menuselection:`Settings --> Options --> System`.


.. index::
   single: Plugins; Plugin manager

.. _managing_plugins:

The Plugins Dialog
===================

.. _setting_plugins:

The Settings tab
----------------

At the bottom of the left panel, the |transformSettings| :guilabel:`Settings` tab
is the main place you can configure which plugins can be displayed in your application.
You can use the following options:

* |checkbox| :guilabel:`Check for Updates on Startup`. Whenever an installed
  plugin has update available, QGIS will inform you :guilabel:`Every Time QGIS
  starts`, :guilabel:`Once a Day`, :guilabel:`Every 3 Days`, :guilabel:`Every
  Week`, :guilabel:`Every 2 Weeks` or :guilabel:`Every month`.
* |checkbox| :guilabel:`Show also Experimental Plugins`. QGIS will show you
  plugins in early stages of development, which are generally unsuitable for
  production use. For these plugins, you can install either the stable or
  the experimental version, and at any moment switch from one to the other.
* |checkbox| :guilabel:`Show also Deprecated Plugins`. These plugins are
  usually unmaintained because they have replacement functions in QGIS,
  a lack of maintainers, they rely on functions that are no longer available
  in QGIS... They are generally unsuitable for production use and appear
  grayed in the plugins list.

By default, in the :guilabel:`Plugin Repositories` section, QGIS provides
you with its official plugin repository with the URL
``https://plugins.qgis.org/plugins/plugins.xml?qgis=version``
(where ``<version>`` represents the exact QGIS version you are running).
To add external author repositories, click |symbologyAdd| :guilabel:`Add...`
and fill in the :guilabel:`Repository Details` form with a name and the URL.
The URL can be of ``http://`` or ``file://`` protocol type.

The default QGIS repository is an open repository and you don't need any
authentication to access it. You can however deploy your own plugin repository
and require an authentication (basic authentication, PKI). You can get more
information on QGIS authentication support in :ref:`authentication` chapter.

If you do not want one or more of the added repositories, they can be disabled
from the Settings tab via the |symbologyEdit| :guilabel:`Edit...` button,
or completely removed with the |symbologyRemove| :guilabel:`Delete` button.

.. _figure_plugins_settings:

.. figure:: img/plugins_settings.png
   :align: center

   The |transformSettings| :guilabel:`Settings` tab

Browsing the plugins
--------------------

The tabs
........

The upper tabs in the :guilabel:`Plugins` dialog provide you with lists of plugins
based on their install, creation or update status. Depending on the plugins settings,
available tabs can be:

* |showPluginManager| :guilabel:`All`: shows all the available plugins in
  the enabled repositories
* |pluginInstalled| :guilabel:`Installed`: shows both the plugins you installed
  and the core plugins that are installed by default and you can not uninstall
* |plugin| :guilabel:`Not installed`: shows uninstalled or not yet installed
  plugins in the enabled repositories
* |plugin-new| :guilabel:`New`: shows plugins released since the last
  :guilabel:`Check for Updates on Startup`
* |plugin-upgrade| :guilabel:`Upgradeable`: shows installed plugins that have
  published a more recent version in the repository
* |pluginIncompatible| :guilabel:`Invalid`: shows all installed plugins that are
  currently broken for any reason (missing dependency, errors while loading,
  incompatible functions with QGIS version...)

At the top of the tabs, a :guilabel:`Search` function helps you find any
plugin using metadata information (author, name, description, tag,...).

.. _figure_plugins_all:

.. figure:: img/plugins_all.png
   :align: center

   Searching a plugin from the |showPluginManager| :guilabel:`All` tab

The Plugins
...........

Select a plugin and you will have some metadata displayed in the right panel:

* information on whether the plugin is experimental or has an experimental
  version available (if :guilabel:`Show also Experimental Plugins` is checked)
* summary and description
* rating vote(s) (you can vote for your preferred plugin!)
* tags
* some useful links to the home page, tracker and code repository
* author(s)
* version(s) available with link to download page in the repository, or path to
  local folder for installed plugins

The :guilabel:`Plugin Manager` dialog allows you to interact with the latest
version of the plugins. When enabled, the experimental version can be shown
only if it is more recent than the latest stable version.
Depending on the active tab, whether the selected plugin is installed,
you will be given some of the following options:

* :guilabel:`Install`: installs the latest stable version of the selected plugin
* :guilabel:`Install Experimental Plugin`: installs the experimental version
  of the selected plugin
* :guilabel:`Reinstall Plugin`: installs the same stable version of the plugin
  e.g. after it has failed to load
* :guilabel:`Reinstall Experimental Plugin`: installs the same stable version
  of the plugin e.g. after it has failed to load
* :guilabel:`Upgrade Plugin`: upgrades selected plugin to its latest stable version
* :guilabel:`Upgrade Experimental Plugin`: upgrades selected plugin to its
  experimental version
* :guilabel:`Upgrade All`: upgrades all installed plugins to their more recent
  stable or experimental version (depending on whether their previously installed
  version was stable or experimental).
* :guilabel:`Downgrade Plugin`: moves from the experimental version of the plugin
  to its previous stable version
* :guilabel:`Downgrade Experimental Plugin`: moves from an experimental version
  of the plugin to its latest published experimental version. This may occur
  when playing with a not yet published version.
* :guilabel:`Uninstall Plugin`: removes the installed plugin from the user profile

An installed plugin displays a |checkbox| checkbox on its left.
Uncheck it to temporarily deactivate the plugin.

Right-click on a plugin in the list and you will be able to sort the plugins list
by various metadata. The new order applies to all the tabs. Sort options are:

* :guilabel:`Sort by Name`
* :guilabel:`Sort by Downloads`
* :guilabel:`Sort by Vote`
* :guilabel:`Sort by Status`
* :guilabel:`Sort by Date Created`
* :guilabel:`Sort by Date Updated`


The Install from ZIP tab
------------------------

The |installPluginFromZip| :guilabel:`Install from ZIP` tab provides a file
selector widget to import plugins in a zipped format, e.g. plugins downloaded
directly from their repository. Encrypted files are supported.

.. _figure_plugins_install_zip:

.. figure:: img/plugins_install_zip.png
   :align: center

   The |installPluginFromZip| :guilabel:`Install from zip` tab

.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |checkbox| image:: /static/common/checkbox.png
   :width: 1.3em
.. |installPluginFromZip| image:: /static/common/mActionInstallPluginFromZip.png
   :width: 1.5em
.. |plugin| image:: /static/common/plugin.png
   :width: 1.5em
.. |plugin-new| image:: /static/common/plugin-new.png
   :width: 1.5em
.. |plugin-upgrade| image:: /static/common/plugin-upgrade.png
   :width: 1.5em
.. |pluginIncompatible| image:: /static/common/plugin-incompatible.png
   :width: 1.5em
.. |pluginInstalled| image:: /static/common/plugin-installed.png
   :width: 1.5em
.. |showPluginManager| image:: /static/common/mActionShowPluginManager.png
   :width: 1.5em
.. |symbologyAdd| image:: /static/common/symbologyAdd.png
   :width: 1.5em
.. |symbologyEdit| image:: /static/common/symbologyEdit.png
   :width: 1.5em
.. |symbologyRemove| image:: /static/common/symbologyRemove.png
   :width: 1.5em
.. |transformSettings| image:: /static/common/mActionTransformSettings.png
   :width: 1.5em
