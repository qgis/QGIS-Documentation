Lesson: Installing and Managing Plugins
===============================================================================

To begin using plugins, you need to know how to download, install and activate
them. To do this, you will learn how to use the :guilabel:`Plugin Installer`
and :guilabel:`Plugin Manager`.

**The goal for this lesson:** To understand and use QGIS' plugin system.

:abbr:`★☆☆ (Basic level)` Follow Along: Managing Plugins
-------------------------------------------------------------------------------

#. To open the :guilabel:`Plugin Manager`, click on the menu item
   :menuselection:`Plugins --> Manage and Install Plugins`.
#. In the dialog that opens, find the :guilabel:`Processing` plugin:

   .. figure:: img/select_processing_plugin.png
      :align: center

#. Click in the box next to this plugin and uncheck it to deactivate it.
#. Click :guilabel:`Close`.
#. Looking at the menu, you will notice that the :guilabel:`Processing` menu is
   is now gone. This means that many of the processing functions you have been
   using before have disappeared! For example look at the :menuselection:`Vector
   -->` and :menuselection:`Raster -->` menus. This is because they are part of
   the :guilabel:`Processing` plugin, which needs to be activated to use them.
#. Open the :guilabel:`Plugin Manager` again and reactivate the
   :guilabel:`Processing` plugin by clicking in the checkbox next to it.
#. :guilabel:`Close` the dialog.
   The :guilabel:`Processing` menu and functions should be available again.


.. _plugin_installation:

:abbr:`★☆☆ (Basic level)` Follow Along: Installing New Plugins
-------------------------------------------------------------------------------

The list of plugins that you can activate and deactivate draws from the plugins
that you currently have installed. To install new plugins:

#. Select the :guilabel:`Not Installed` option in the :guilabel:`Plugin Manager`
   dialog. The plugins available for you to install will be listed here.
   This list will vary depending on your existing system setup.

   .. figure:: img/get_more_plugins.png
      :align: center

#. Find information about the plugin by selecting it in the list

   .. figure:: img/plugin_details.png
      :align: center

#. Install the one(s) you are interested in by clicking the :guilabel:`Install
   Plugin` button below the plugin information panel.

.. note:: if the plugin has some error it will be listed in the :guilabel:`Invalid`
  tab. You can then contact the plugin owner to fix the problem.

:abbr:`★☆☆ (Basic level)` Follow Along: Configuring Additional Plugin Repositories
------------------------------------------------------------------------------------

The plugins that are available to you for installation depend on which
plugin *repositories* you are configured to use.

QGIS plugins are stored online in repositories. By default, only the `official
repository <https://plugins.qgis.org>`_ is active, meaning that you can only
access plugins that are published there. Given the diversity of available tools,
this repository should meet most of your needs.

It is possible, however, to try out more plugins than the default ones. First,
you want to configure additional repositories. To do this:

#. Open the :guilabel:`Settings` tab in the :guilabel:`Plugin Manager` dialog

   .. figure:: img/plugin_manager_settings.png
      :align: center

#. Click :guilabel:`Add` to find and add a new repository.
#. Provide a Name and URL for the new repository you want to configure and make
   sure the :guilabel:`Enabled` checkbox is selected.

   .. figure:: img/new_plugins_setting.png
      :align: center

#. You will now see the new plugin repo listed in the list of configured
   Plugin Repositories

   .. figure:: img/new_plugin_added.png
      :align: center

#. You can also select the option to display Experimental Plugins by selecting
   the :guilabel:`Show also experimental plugins` checkbox.
#. If you now switch back to the :guilabel:`Not Installed` tab, you will see that
   additional plugins are available for installation.
#. To install a plugin, click on it in the list and then on the
   :guilabel:`Install plugin` button.

In Conclusion
-------------------------------------------------------------------------------

Installing plugins in QGIS should be straightforward and effective!

What's Next?
-------------------------------------------------------------------------------

Next we'll introduce you to some useful plugins as examples.
