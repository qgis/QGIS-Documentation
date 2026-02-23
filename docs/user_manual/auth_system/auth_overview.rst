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

.. _authentication_configurations:

Authentication Configurations
-----------------------------

You can manage authentication configurations from :guilabel:`Configurations` in
the :guilabel:`Authentication` tab of the QGIS Options dialog
(:menuselection:`Settings --> Options`).

.. _figure_authconfigeditor:

.. figure:: img/options_authentication.png
   :align: center

   Configurations editor

To create a new authentication configuration:

#. Press the |symbologyAdd| :sup:`Add a new authentication configuration`
#. Provide a :guilabel:`Name` and optional :guilabel:`Resource` URL
#. A seven-characters :guilabel:`ID` will be assigned to the configuration for identification purpose.
   It can be customized after you pressed the |locked| :sup:`Unlock to edit ID` button.
   Be aware that updating that ID may break things.
#. Select the :ref:`target method <authentication_methods>` and fill the corresponding connection details
#. Once done, click :guilabel:`Save` to save the configuration.
   The saved configuration appears in the list of authentication configurations
   and can be used with supported connections.

The saved configuration can later be edited using |symbologyEdit| :sup:`Edit selected configuration`
or removed using |symbologyRemove| :sup:`Delete selected configuration`.

.. _figure_authconfigeditor_add:

.. figure:: img/auth-config-create_authcfg-id.png
   :align: center

   Adding config from within Configuration editor

The same type of operations for authentication configuration management (Add,
Edit and Remove) can be done when configuring a given service connection, such
as configuring an OWS service connection. For that, there are action buttons
within the :ref:`configuration selector <authentication>` for fully managing configurations found
within the authentication database. In this case, there is no need to go to the
:guilabel:`configurations` in :guilabel:`Authentication` tab of QGIS options
unless you need to do more comprehensive configuration management.

.. _figure_authconfigeditor_wms:

.. figure:: ../working_with_ogc/img/add_connection_wms.png
   :align: center

   WMS connection dialog showing authentication configuration widget

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

API Header Authentication
.........................
The API Header authentication method allows you to connect to services
that require custom HTTP headers, such as API keys.
For example, if a WMS service requires an API key sent as a header
(e.g. ``X-API-KEY``), you can use this method to provide it.

You can add one or more headers with the |symbologyAdd| button; provide a
:guilabel:`Header Name` and :guilabel:`Header Value` for each entry. Use
|symbologyRemove| to delete the selected header or the :guilabel:`Clear`
button to remove all entries.

.. _figure_authmethod_api:

.. figure:: img/auth-method-api-header.png
   :align: center

   API Header authentication configs

AWS S3 Authentication
.....................

The AWS S3 authentication method allows you to connect to Amazon S3 resources by providing
a :guilabel:`Name`, :guilabel:`Resource`, :guilabel:`Username`, :guilabel:`Password`, and :guilabel:`Region`.

.. _figure_authmethod_awss3:

.. figure:: img/auth-method-awss3.png
   :align: center

   AWS S3 authentication configs

Basic Authentication
....................

The Basic authentication method is used for services that require standard HTTP authentication
with a :guilabel:`Username`, :guilabel:`Password` and :guilabel:`Realm`.

.. _figure_authmethod_http:

.. figure:: img/auth-method-basic-auth.png
   :align: center

   Basic HTTP authentication configs

ESRI Token Authentication
.........................

The ESRI token authentication method is used for :ref:`ArcGIS REST Servers <arcgis_rest>` that require token-based authentication.

.. _figure_authmethod_esritoken:

.. figure:: img/auth-method-esritoken.png
   :align: center

   ESRI Token authentication configs

Identity certificate authentication
...................................

The Identity certificate authentication method allows you to connect using a client :ref:`identity certificate <authentication_identities>`.

.. _figure_authmethod_identitycert:

.. figure:: img/auth-method-identity-cert.png
   :align: center

   Identity-cert authentication configs

MapTiler HMAC-SHA256 Authentication
...................................

The MapTiler HMAC-SHA256 authentication method is used to connect to MapTiler services that require HMAC-SHA256 authorization.

.. _figure_authmethod_maptiler:

.. figure:: img/auth-method-maptiler.png
   :align: center

   MapTiler HmacSha256 authentication configs

OAuth2 Authentication
.....................

The OAuth2 authentication method is used to connect to services that require OAuth2 2.0 authorization,
allowing secure access using client credential and token-based authentication.

It supports using ``localhost`` as the redirect host,
providing compatibility with services that do not accept ``http://127.0.0.1`` redirects (for example, Microsoft SharePoint).

An advanced OAuth2 configuration option, :guilabel:`Extra token header(s)`,
allows attaching additional tokens returned by the OAuth2 token endpoint as HTTP(S) request headers.

.. _figure_authmethod_oauth2:

.. figure:: img/auth-method-oauth2.png
   :align: center

   OAuth2 authentication configs

PKI-Paths Authentication
........................

The PKI-Paths authentication method allows you to connect using separate certificate and key files stored on your system.

.. _figure_authmethod_pki:

.. figure:: img/auth-method-pem-der-paths.png
   :align: center

   PKI paths authentication configs

PKI-PKCS#12 Authentication
..........................

The PKI-PKCS#12 authentication method allows you to connect using a single bundle file
containing both the certificate and private key, with an optional passphrase for the key.

.. _figure_authmethod_pkcs:

.. figure:: img/auth-method-pkcs12-paths.png
   :align: center

   PKI PKCS#12 file paths authentication configs

Microsoft Planetary Computer Authentication
...........................................

The Microsoft Planetary Computer authentication method allows QGIS to access Microsoft Planetary Computer data. It supports two modes:

* `Open Planetary Computer <https://planetarycomputer.microsoft.com/>`_ - uses SAS tokens to sign assets for access.
* `Planetary Computer Pro <https://learn.microsoft.com/azure/planetary-computer/configure-qgis>`_ - requires SAS signing plus OAuth2 authentication.

.. _figure_authmethod_planetary:

.. figure:: img/auth-method-planetaries.png
   :align: center

   Microsoft Planetary Computer authentication configs


This method can be applied to STAC connections or directly to individual GDAL or point cloud layers. 
When a layer is added, the authentication configuration is appended to its URI so QGIS uses it for network requests. 
Support for encoding/decoding this configuration is also available for point cloud layers.

Master Password and Auth Config Utilities
-----------------------------------------

Under the Options menu (:menuselection:`Settings --> Options`) in the
:guilabel:`Authentication` tab, there are several utility actions to manage the
authentication database and configurations:

.. _figure_authconfiutils:

.. figure:: img/auth-editor-configs_utilities-menu.png
   :align: center

   Utilities menu

* :guilabel:`Input master password…`: opens the master password input dialog, independent
  of performing any authentication database command
* :guilabel:`Clear cached master password`: unsets the master password if it has been
  set
* :guilabel:`Reset master password…`: opens a dialog to change the master password (the
  current password must be known) and optionally back up the current database
* :guilabel:`Clear network authentication access cache`: clears the authentication cache
  of all connections
* :guilabel:`Automatically clear network authentication access cache on SSL errors`: the
  connection cache stores all authentication data for connections, also when the
  connection fails. If you change authentication configurations or certification authorities,
  you should clear the authentication cache
  or restart QGIS. When this option is checked, the authentication cache will be
  automatically cleared every time an SSL error occurs and you choose to abort
  the connection
* :guilabel:`Integrate master password with the Wallet`: adds the master
  password to your personal Wallet/Keyring
* :guilabel:`Clear the master password from the Wallet…`: deletes the master
  password from your Wallet/Keyring
* :guilabel:`Enable password helper debug log`: enables a debug tool that will contain
  all the log information of the authentication methods
* :guilabel:`Clear cached authentication configurations`: clears the internal lookup cache
  for configurations, used to speed up network connections. This does not clear
  QGIS’s core network access manager’s cache, which requires a relaunch of QGIS.
* :guilabel:`Remove all authentication configurations…`: clears the database of all
  configuration records, without removing other stored records.
* :guilabel:`Import authentication configurations from file…`: imports from an :file:`.XML` file
  details for creating custom authentication configurations.
* :guilabel:`Export selected authentication configurations to file…`: exports the selected
  items to a possibly encrypted :file:`.XML` file.
* :guilabel:`Erase authentication database…`: schedules a backup of the current database
  and complete rebuild of the database table structure. The actions are
  scheduled for a later time, to ensure that other operations, like project
  loading, do not interrupt the operation or cause errors due to a temporarily
  missing database.


Using authentication configurations
-----------------------------------

Typically, an authentication configuration is selected in a configuration dialog
for a network services (such as WMS). However, the selector widget can be
embedded anywhere authentication is needed or in non-core functionality, like in
third-party PyQGIS or C++ plugins.

When using the selector, :guilabel:`No authentication` is displayed in the
pop-up menu control when nothing is selected, when there are no configurations
to choose from, or when a previously assigned configuration can no longer be
found in the database. Use the drop-down menu to select an existing authentication
configuration or press |symbologyAdd| :sup:`Create a new autentication configuration`
to create a configuration you could use.
More details at :ref:`authentication`.

.. _figure_authconfigselector:

.. figure:: img/authentication-selector-set.png
   :align: center

   Authentication configuration selector with selected config

Python bindings
---------------

All classes and public functions have sip bindings, except :api:`QgsAuthCrypto <classQgsAuthCrypto.html>`,
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

.. |locked| image:: /static/common/locked.png
   :width: 1.5em
.. |options| image:: /static/common/mActionOptions.png
   :width: 1em
.. |symbologyAdd| image:: /static/common/symbologyAdd.png
   :width: 1.5em
.. |symbologyEdit| image:: /static/common/symbologyEdit.png
   :width: 1.5em
.. |symbologyRemove| image:: /static/common/symbologyRemove.png
   :width: 1.5em
