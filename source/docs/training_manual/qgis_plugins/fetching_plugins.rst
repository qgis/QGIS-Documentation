.. only:: html

   |updatedisclaimer|

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

  .. image:: img/select_processing_plugin.png
     :align: center

* Click in the box next to this plugin and uncheck it to uninstall it.
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


|basic| |FA| Installing New Plugins
-------------------------------------------------------------------------------

The list of plugins that you can activate and deactivate draws from the plugins
that you currently have installed. 

* To install new plugins, select the :guilabel:`Not Installed` option in the
  :guilabel:`Plugin Manager` dialog. The plugins available for you to install
  will be listed here. This list will vary depending on your existing system
  setup.

  .. image:: img/get_more_plugins.png
     :align: center

* You can find information about each plugin by selecting it in the list of
  plugins displayed.

  .. image:: img/plugin_details.png
     :align: center

* A plugin can be installed by clicking the :guilabel:`Install Plugin` button
  below the plugin information panel.

|basic| |FA| Configuring Additional Plugin Repositories 
-------------------------------------------------------------------------------

The plugins that are available to you for installation depend on which
plugin *repositories* you are configured to use.

QGIS plugins are stored online in repositories. By default, only the official
repositories are active, meaning that you can only access official plugins.
These are usually the first plugins you want, because they have been tested
thoroughly and are often included in QGIS by default.

It is possible, however, to try out more plugins than the default ones. First,
you want to configure additional repositories. To do this:

* Open the :guilabel:`Settings` tab in the :guilabel:`Plugin Manager`
  dialog:
  
  .. image:: img/plugin_manager_settings.png
     :align: center

* Click :guilabel:`Add` to find and add a new repository.

* Provide a Name and URL for the new repository you want to configure and make
  sure the :guilabel:`Enabled` checkbox is selected. 

  .. image:: img/new_plugins_setting.png
     :align: center

* You will now see the new plugin repo listed in the list of configured
  Plugin Repositories

  .. image:: img/new_plugin_added.png
     :align: center

* You can also select the option to display Experimental Plugins by selecting
  the :guilabel:`Show also experimental plugins` checkbox.

* If you now switch back to the :guilabel:`Get More` tab, you will see that
  additional plugins are now available for installation.

* To install a plugin, simply click on it in the list and then click the
  :guilabel:`Install plugin` button.

|IC|
-------------------------------------------------------------------------------

Installing plugins in QGIS is simple and effective!

|WN|
-------------------------------------------------------------------------------

Next we'll introduce you to some useful plugins as examples.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |FA| replace:: Follow Along:
.. |IC| replace:: In Conclusion
.. |LS| replace:: Lesson:
.. |WN| replace:: What's Next?
.. |basic| image:: /static/global/basic.png
.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit http://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
