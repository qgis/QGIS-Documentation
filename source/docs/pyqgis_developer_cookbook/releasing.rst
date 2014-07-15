***********************
Releasing your plugin
***********************

Once your plugin is ready and you think the plugin could be helpful for
some people, do not hesitate to upload it to :ref:`official_pyqgis_repository`.
On that page you can find also packaging guidelines about how to prepare the
plugin to work well with the plugin installer. Or in case you would like
to set up your own plugin repository, create a simple XML file that will
list the plugins and their metadata, for examples see other `plugin repositories <http://www.qgis.org/wiki/Python_Plugin_Repositories>`_.

.. index:: plugins;


.. _official_pyqgis_repository:

Official python plugin repository
---------------------------------

You can find the *official* python plugin repository at `<http://plugins.qgis.org/>`_.

In order to use the official repository you must obtain an OSGEO ID from the `OSGEO web portal <http://www.osgeo.org/osgeo_userid/>`_.

Once you have uploaded your plugin it will be approved by a staff member and you will be notified.

.. todo::
   Insert a link to the governance document

.. index:: plugins; official python plugin repository


Permissions
...........

These rules have been implemented in the official plugin repository:
    * every registered user can add a new plugin
    * *staff* users can approve or disapprove all plugin versions
    * users which have the special permission `plugins.can_approve` get the versions they upload automatically approved
    * users which have the special permission `plugins.can_approve` can approve versions uploaded by others as long as they are in the list of the plugin *owners*
    * a particular plugin can be deleted and edited only by *staff* users and plugin *owners*
    * if a user without `plugins.can_approve` permission uploads a new version, the plugin version is automatically unapproved.


Trust management
................

Staff members can grant *trust* to selected plugin creators setting `plugins.can_approve` permission through the front-end application.

The plugin details view offers direct links to grant trust to the plugin creator or the plugin *owners*.

.. _official_pyqgis_repository_validation:

Validation
..........

Plugin's metadata are automatically imported and validated from the compressed package when the plugin is uploaded.

Here are some validation rules that you should aware of when you want to upload a plugin
on the official repository:

#. the name of the main folder containing your plugin must contain only contains ASCII characters (A-Z and a-z), digits and the characters underscore (_) and minus (-), also it cannot start with a digit
#. :file:`metadata.txt` is required
#. all required metadata listed in :ref:`metadata table<plugin_metadata_table>` must be present
#. the `version` metadata field must be unique

Plugin structure
................

Following the validation rules the compressed (.zip) package of your plugin must have a specific structure
to validate as a functional plugin.
As the plugin will be unzipped inside the users plugins folder it must have it's own directory inside the .zip file to not interfere with other plugins.
Mandatory files are: metadata.txt and __init__.py
But it would be nice to have a README.py and of course an icon to represent the plugin (resources.qrc).
Following is an example of how a plugin.zip should look like.
::

  plugin.zip
    pluginfolder/
    |-- i18n
    |   |-- translation_file_de.ts
    |-- img
    |   |-- icon.png
    |   `-- iconsource.svg
    |-- __init__.py
    |-- Makefile
    |-- metadata.txt
    |-- more_code.py
    |-- main_code.py
    |-- README.md
    |-- resources.qrc
    |-- resources_rc.py
    `-- ui_Qt_user_interface_file.ui
