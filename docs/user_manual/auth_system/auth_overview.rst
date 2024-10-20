.. _authentication_overview:

Authentication System Overview
==============================

.. only:: html

   .. contents::
      :local:

.. _figure_authsystem:

.. figure:: img/auth-system-overview.png
   :align: center

   Anatomy of authentication system


Authentication database
-----------------------

The authentication system stores authentication configurations in an
SQLite database file located, by default, at :file:`<profile directory>/qgis-auth.db`.

This authentication database can be moved between QGIS installations without
affecting other current QGIS user preferences, as it is completely separate from
normal QGIS settings. A configuration ID (a random 7-character alphanumeric
string) is generated when initially storing a configuration to the database.
This represents the configuration, thereby allowing the ID to be stored in plain
text application components, (such as project, plugin, or settings files)
without disclosure of its associated credentials.

.. note::

   The parent directory of the `qgis-auth.db` can be set using the following
   environment variable, ``QGIS_AUTH_DB_DIR_PATH``, or set on the command line
   during launch with the ``--authdbdirectory`` option.


Custom authentication databases
-------------------------------

QGIS can be configured to use a custom authentication database instead of the above
mentioned default SQLite one: any database suppported by the Qt SQL module can be
used (e.g. PostgreSQL, MySQL, etc), provided that the corresponding Qt SQL driver is
available in the system.

This can be useful in scenarios where a user wants to share the same authentication
database between multiple QGIS installations, or when a user wants to use a different
authentication database than the default SQLite one or when a centralized
authentication database is used by QGIS server.

The only way to configure a custom authentication database is by setting the
``QGIS_AUTH_DB_URI`` environment variable to the URI of the connection, the URI
is in the form of ``driver://username:password@hostname:port/database?options``.

Where:
    - ``driver`` is the name of the Qt SQL driver to use, e.g. ``QPSQL`` for PostgreSQL, ``QMYSQL`` for MySQL, etc.
    - ``username`` is the username to use to connect to the database
    - ``password`` is the password to use to connect to the database
    - ``hostname`` is the hostname of the database server
    - ``port`` is the port of the database server
    - ``database`` is the name of the database to use
    - ``options`` are the options to pass to the driver, e.g. ``sslmode=require`` for PostgreSQL

.. note::

    The ``schema`` can be specified in the URI options, e.g. ``QPSQL://username:password@hostname:port/database?schema=schema_name``

    The database must exist before starting QGIS, and the user must have the necessary
    permissions to connect to the database and to create the required tables if they
    do not exist.

.. warning::

    The password in the URI is stored in plain text in the environment variable,
    so it is recommended to use a passwordless user or a user with limited permissions
    to connect to the database.

.. warning::

    Any database not based on SQLite is considered to be read-only (this can be changed by Python plugins if necessary).


This is an advanced feature, designed to allow one or more custom authentication
databases or even custom Python implementations of credentials storages to be used by QGIS.

The system is also designed to allow for multiple authentication databases to be
used but there is currently no user facing interface to manage multiple credential storages
so its usage requires manual configuration and management, typically from a Python plugin.


Master password
---------------

To store or access sensitive information within the database, a user must define
a `master password`. A new master password is requested and verified when
initially storing any encrypted data to the database. When sensitive
information is accessed, the user is prompted for the master password. The password is
then cached for the remainder of the session (until application is quit), unless
the user manually chooses an action to clear its cached value. Some instances of
using the authentication system do not require input of the master password,
such as when selecting an existing authentication configuration, or applying a
configuration to a server configuration (such as when adding a WMS layer).

You can choose to save the password in the ``Wallet/Keyring`` of your
computer.

.. _figure_masterpass:

.. figure:: img/auth-password-new_enter.png
   :align: center

   Input new master password

.. note::

   A path to a file containing the master password can be set using the
   following environment variable, ``QGIS_AUTH_PASSWORD_FILE``.

Managing the master password
............................

Once set, the master password can be reset; the current master password will be
needed prior to resetting. During this process, there is an option to generate a
complete backup of the current database.

.. _figure_masterpass_reset:

.. figure:: img/auth-password-reset.png
   :align: center

   Resetting master password

If the user forgets the master password, there is no way to retrieve or override
it. There is also no means of retrieving encrypted information without knowing
the master password.

If a user inputs their existing password incorrectly three times, the dialog
will offer to erase the database.

.. _figure_masterpass_pwd:

.. figure:: img/auth-password-invalid-3times.png
   :align: center

   Password prompt after three invalid attempts

Authentication Configurations
-----------------------------

You can manage authentication configurations from :guilabel:`Configurations` in
the :guilabel:`Authentication` tab of the QGIS Options dialog
(:menuselection:`Settings --> Options`).

.. _figure_authconfigeditor:

.. figure:: img/auth-editor-configs2.png
   :align: center

   Configurations editor

Use the |symbologyAdd| button to add a new configuration, the |symbologyRemove| button
to remove configurations, and the |symbologyEdit| button to modify existing ones.

.. _figure_authconfigeditor_add:

.. figure:: img/auth-config-create_authcfg-id.png
   :align: center

   Adding config from within Configuration editor

The same type of operations for authentication configuration management (Add,
Edit and Remove) can be done when configuring a given service connection, such
as configuring an OWS service connection. For that, there are action buttons
within the configuration selector for fully managing configurations found
within the authentication database. In this case, there is no need to go to the
:guilabel:`configurations` in :guilabel:`Authentication` tab of QGIS options
unless you need to do more comprehensive configuration management.

.. _figure_authconfigeditor_wms:

.. figure:: img/auth-selector-wms-connection.png
   :align: center

   WMS connection dialog showing :guilabel:`Add`, :guilabel:`Edit`, and :guilabel:`Remove`
   authentication configuration buttons

When creating or editing an authentication configuration, the info required is
a name, an authentication method and any other info that the authentication
method requires (see more about the available authentication types in
:ref:`authentication_methods`).

.. _authentication_methods:

Authentication Methods
----------------------

Available authentications are provided by C++ plugins much in the same way data
provider plugins are supported by QGIS. The method of authentication that can
be selected is relative to the access needed for the resource/provider, e.g.
HTTP(S) or database, and whether there is support in both QGIS code and a
plugin. As such, some authentication method plugins may not be applicable
everywhere an authentication configuration selector is shown. A list of
available authentication method plugins and their compatible resource/providers
can be accessed going to :menuselection:`Settings --> Options` and, in the
:guilabel:`Authentication` tab, click the |options| :guilabel:`Installed Plugins`
button.

.. _figure_authmethod:

.. figure:: img/auth-method-listing.png
   :align: center

   Available method plugins list

Plugins can be created for new authentication methods that do not require QGIS
to be recompiled. Since the support for plugins is currently C++-only,
QGIS will need to be restarted for the new dropped-in plugin to become
available to the user. Ensure your plugin is compiled against the same target
version of QGIS if you intend to add it to an existing target install.

.. _figure_authmethod_http:

.. figure:: img/auth-config-create_basic-auth.png
   :align: center

   Basic HTTP authentication configs

.. _figure_authmethod_esritoken:

.. figure:: img/auth-config-create_esritoken.png
   :align: center

   ESRI Token authentication configs

.. _figure_authmethod_oauth2:

.. figure:: img/auth-config-create_oauth2.png
   :align: center

   OAuth2 authentication configs

.. _figure_authmethod_pki:

.. figure:: img/auth-config-create_pem-der-paths.png
   :align: center

   PKI paths authentication configs

.. _figure_authmethod_pkcs:

.. figure:: img/auth-config-create_pkcs12-paths.png
   :align: center

   PKI PKCS#12 file paths authentication configs

.. _figure_authmethod_stored:

.. figure:: img/auth-config-create_stored-identity2.png
   :align: center

   Stored Identity authentication configs

.. note::

   The Resource URL is currently an *unimplemented* feature that will eventually
   allow a particular configuration to be auto-chosen when connecting to
   resources at a given URL.

Master Password and Auth Config Utilities
-----------------------------------------

Under the Options menu (:menuselection:`Settings --> Options`) in the
:guilabel:`Authentication` tab, there are several utility actions to manage the
authentication database and configurations:

.. _figure_authconfiutils:

.. figure:: img/auth-editor-configs_utilities-menu.png
   :align: center

   Utilities menu

* **Input master password**: opens the master password input dialog, independent
  of performing any authentication database command
* **Clear cached master password**: unsets the master password if it has been
  set
* **Reset master password**: opens a dialog to change the master password (the
  current password must be known) and optionally back up the current database
* **Clear network authentication access cache**: clears the authentication cache
  of all connections
* **Automatically clear network authentication access cache on SSL errors**: the
  connection cache stores all authentication data for connections, also when the
  connection fails. If you change authentication configurations or certification authorities,
  you should clear the authentication cache
  or restart QGIS. When this option is checked, the authentication cache will be
  automatically cleared every time an SSL error occurs and you choose to abort
  the connection
* **Integrate master password with your Wallet/Keyring**: adds the master
  password to your personal Wallet/Keyring
* **Store/update the master password in your Wallet/Keyring**: updates the
  changed master password in your Wallet/Keyring
* **Clear the master password from your Wallet/Keyring**: deletes the master
  password from your Wallet/Keyring
* **Enable password helper debug log**: enables a debug tool that will contain
  all the log information of the authentication methods
* **Clear cached authentication configurations**: clears the internal lookup cache
  for configurations, used to speed up network connections. This does not clear
  QGIS’s core network access manager’s cache, which requires a relaunch of QGIS.
* **Remove all authentication configurations**: clears the database of all
  configuration records, without removing other stored records.
* **Erase authentication database**: schedules a backup of the current database
  and complete rebuild of the database table structure. The actions are
  scheduled for a later time, to ensure that other operations, like project
  loading, do not interrupt the operation or cause errors due to a temporarily
  missing database.

  .. _figure_authconfiutilsdb:

  .. figure:: img/auth-db-erase.png
     :align: center

     DB erase verification menu

Using authentication configurations
-----------------------------------

Typically, an authentication configuration is selected in a configuration dialog
for a network services (such as WMS). However, the selector widget can be
embedded anywhere authentication is needed or in non-core functionality, like in
third-party PyQGIS or C++ plugins.

When using the selector, :guilabel:`No authentication` is displayed in the
pop-up menu control when nothing is selected, when there are no configurations
to choose from, or when a previously assigned configuration can no longer be
found in the database. The :guilabel:`Type` and :guilabel:`Id` fields are
read-only and provide a description of the authentication method and the
config’s ID respectively.

.. _figure_authconfigselector:

.. figure:: img/auth-selector-no-authentication.png
   :align: center

   Authentication configuration selector with no authentication

.. _figure_authconfigselector_pkcs:

.. figure:: img/auth-selector-pkcs12-authentication.png
   :align: center

   Authentication configuration selector with selected config

Python bindings
---------------

All classes and public functions have sip bindings, except ``QgsAuthCrypto``,
since management of the master password hashing and auth database encryption
should be handled by the main app, and not via Python.

Once the master password is entered, the API is open to access authentication
configs in the authentication database, similar to how Firefox works.
However, no wall against PyQGIS access has been defined.
This may lead to issues where a user downloads/installs a malicious PyQGIS plugin
or standalone app that gains access to authentication credentials.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |options| image:: /static/common/mActionOptions.png
   :width: 1em
.. |symbologyAdd| image:: /static/common/symbologyAdd.png
   :width: 1.5em
.. |symbologyEdit| image:: /static/common/symbologyEdit.png
   :width: 1.5em
.. |symbologyRemove| image:: /static/common/symbologyRemove.png
   :width: 1.5em
