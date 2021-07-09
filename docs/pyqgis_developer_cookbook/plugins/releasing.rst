.. index:: Plugins; Releasing

***********************
 Releasing your plugin
***********************

.. only:: html

   .. contents::
      :local:

Once your plugin is ready and you think the plugin could be helpful for
some people, do not hesitate to upload it to :ref:`official_pyqgis_repository`.
On that page you can also find packaging guidelines about how to prepare the
plugin to work well with the plugin installer. Or in case you would like
to set up your own plugin repository, create a simple XML file that will
list the plugins and their metadata.

Please take special care to the following suggestions:

Metadata and names
-------------------

* avoid using a name too similar to existing plugins
* if your plugin has a similar functionality to an existing plugin, please explain the differences in the About field, so the user will know which one to use without the need to install and test it
* avoid repeating "plugin" in the name of the plugin itself
* use the description field in metadata for a 1 line description, the About field for more detailed instructions
* include a code repository, a bug tracker, and a home page; this will greatly enhance the possibility of collaboration, and can be done very easily with one of the available web infrastructures (GitHub, GitLab, Bitbucket, etc.)
* choose tags with care: avoid the uninformative ones (e.g. vector) and prefer the ones already used by others (see the plugin website)
* add a proper icon, do not leave the default one; see QGIS interface for a suggestion of the style to be used

Code and help
--------------

* do not include generated file (ui_*.py, resources_rc.py, generated help files…) and useless stuff (e.g. .gitignore) in repository
* add the plugin to the appropriate menu (Vector, Raster, Web, Database)
* when appropriate (plugins performing analyses), consider adding the plugin as a subplugin of Processing framework: this will allow users to run it in batch, to integrate it in more complex workflows, and will free you from the burden of designing an interface
* include at least minimal documentation and, if useful for testing and understanding, sample data.

.. _official_pyqgis_repository:

Official Python plugin repository
---------------------------------

You can find the *official* Python plugin repository at
`<https://plugins.qgis.org/>`_.

In order to use the official repository you must obtain an OSGEO ID from the
`OSGEO web portal <https://www.osgeo.org/community/getting-started-osgeo/osgeo_userid/>`_.

Once you have uploaded your plugin it will be approved by a staff member and
you will be notified.

**TODO:**
   Insert a link to the governance document

.. index:: Plugins; Official python plugin repository


Permissions
...........

These rules have been implemented in the official plugin repository:

* every registered user can add a new plugin
* *staff* users can approve or disapprove all plugin versions
* users which have the special permission `plugins.can_approve` get the
  versions they upload automatically approved
* users which have the special permission `plugins.can_approve` can approve
  versions uploaded by others as long as they are in the list of the plugin
  *owners*
* a particular plugin can be deleted and edited only by *staff* users and
  plugin *owners*
* if a user without `plugins.can_approve` permission uploads a new version,
  the plugin version is automatically unapproved.


Trust management
................

Staff members can grant *trust* to selected plugin creators setting
`plugins.can_approve` permission through the front-end application.

The plugin details view offers direct links to grant trust to the plugin
creator or the plugin *owners*.

.. _official_pyqgis_repository_validation:

Validation
..........

Plugin's metadata are automatically imported and validated from the compressed
package when the plugin is uploaded.

Here are some validation rules that you should aware of when you want to upload
a plugin on the official repository:

#. the name of the main folder containing your plugin must contain only
   ASCII characters (A-Z and a-z), digits and the characters
   underscore (_) and minus (-), also it cannot start with a digit
#. :file:`metadata.txt` is required
#. all required metadata listed in :ref:`metadata table<plugin_metadata_table>`
   must be present
#. the `version` metadata field must be unique

Plugin structure
................

Following the validation rules the compressed (.zip) package of your plugin
must have a specific structure to validate as a functional plugin. As the
plugin will be unzipped inside the users plugins folder it must have it's own
directory inside the .zip file to not interfere with other plugins. Mandatory
files are: :file:`metadata.txt` and :file:`__init__.py`. But it would be nice
to have a :file:`README` and of course an icon to represent the plugin
(:file:`resources.qrc`). Following is an example of how a plugin.zip should
look like.

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
    |-- README
    |-- resources.qrc
    |-- resources_rc.py
    `-- ui_Qt_user_interface_file.ui

