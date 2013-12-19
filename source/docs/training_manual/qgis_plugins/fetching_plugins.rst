|LS| Installing and Managing Plugins
===============================================================================

To begin using plugins, you need to know how to download, install and activate
them. To do this, you will learn how to use the :guilabel:`Plugin Installer`
and :guilabel:`Plugin Manager`.

**The goal for this lesson:** To understand and use QGIS' plugin system.

|basic| |FA| Managing Plugins
-------------------------------------------------------------------------------

* To open the :guilabel:`Plugin Manager`, click on the menu item
  :menuselection:`Plugins --> Manage and Install Plugins`.
* In the dialog that opens, find the :guilabel:`Processing` plugin:

  .. image:: /static/training_manual/qgis_plugins/001.png
     :align: center

* Click in the box next to this plugin and uncheck it.
* Click :guilabel:`Close`.
* Looking at the menu, you will notice that the :guilabel:`Processing` menu is
  is now gone. This means that many of the processing
  functions you have been using before have disappeared! This is because they
  are part of the :guilabel:`Processing` plugin, which needs to be activated for
  you to use them.
* Open the :guilabel:`Plugin Manager` again and reactivate the
  :guilabel:`Processing` plugin by clicking in the checkbox next to it and clicking
  :guilabel:`Close`..
* The :guilabel:`Processing` menu should be available again.

Importantly, however, the list of plugins that you can activate and deactivate
only draws from the plugins that you currently have installed. To install new
plugins, you need to use the :guilabel:`Get More` option in the
:guilabel:`Plugin Manager` dialog.

|basic| |FA| Installing New Plugins
-------------------------------------------------------------------------------

* To install new plugins, select the :guilabel:`Get More` option in the 
  :guilabel:`Plugin Manager` dialog. The plugins available for you to install
  will be listed here. This list will vary depending on your existing system
  setup.

  .. image:: /static/training_manual/qgis_plugins/002.png
     :align: center

You can find information about each plugin by selecting it in the list of
plugins displayed.

  .. image:: /static/training_manual/qgis_plugins/003.png
     :align: center

The plugins that are available to you for installation depend on which
plugin *repositories* you are configured to use.

QGIS plugins are stored online in repositories. By default, only the official
repositories are active, meaning that you can only access official plugins.
These are usually the first plugins you want, because they have been tested
thoroughly and are often included in QGIS by default.



It is possible, however, to try out more plugins than the default ones. First,
you want to check in all available repositories. To do this:

* Open the :guilabel:`Repositories` tab on the :guilabel:`Plugin Installer`
  dialog:
  
  .. image:: /static/training_manual/qgis_plugins/002.png
     :align: center

* Click the :guilabel:`Add 3rd party repositories` button. A disclaimer will
  appear.
* Click :guilabel:`OK` to find and add these extra repositories:

  .. image:: /static/training_manual/qgis_plugins/003.png
     :align: center

However, even with these extra repositories enabled, you won't see the plugins
that they contain, unless you allow these plugins to be displayed.

* Open the :guilabel:`Options` tab:

  .. image:: /static/training_manual/qgis_plugins/004.png
     :align: center

* Select the option :guilabel:`Show all plugins except those marked as
  experimental`.
* If you now switch back to the :guilabel:`Plugins` tab, you will see that many
  more plugins are now available for installation.
* To install a plugin, simply click on it in the list and then click the
  :guilabel:`Install plugin` button.

|IC|
-------------------------------------------------------------------------------

Installing plugins in QGIS is simple and effective!

|WN|
-------------------------------------------------------------------------------

Next we'll introduce you to some useful plugins as examples.
