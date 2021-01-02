.. index:: Plugins; Developing, Python; Developing plugins

.. _developing_plugins:

*************************
Developing Python Plugins
*************************

.. toctree::
   :maxdepth: 2

   plugins
   snippets
   ide_debugging
   releasing
   
It is possible to create plugins in the Python programming language.
In comparison with classical plugins written in C++ these should be easier to
write, understand, maintain and distribute due to the dynamic nature of the
Python language.

Python plugins are listed together with C++ plugins in QGIS plugin manager.
They are searched for in :file:`~/(UserProfile)/python/plugins` and these paths:

* UNIX/Mac: :file:`(qgis_prefix)/share/qgis/python/plugins`
* Windows: :file:`(qgis_prefix)/python/plugins`

For definitions of ``~`` and ``(UserProfile)`` see :ref:`core_and_external_plugins`.

.. note::

    By setting `QGIS_PLUGINPATH` to an existing directory path, you can add this
    path to the list of paths that are searched for plugins.
