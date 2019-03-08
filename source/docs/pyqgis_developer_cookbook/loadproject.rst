.. only:: html

   |updatedisclaimer|

.. _loadproject:

****************
Loading Projects
****************

Sometimes you need to load an existing project from a plugin or (more often)
when developing a standalone QGIS Python application (see: :ref:`pythonapplications`).


.. index::
  pair: Projects; Loading

To load a project into the current QGIS application you need to create
an instance of the :class:`QgsProject <qgis.core.QgsProject>` class.
This is a singleton class, so you must use its :meth:`instance() <qgis.core.QgsProject.instance>` method to do it..
With it, you can call its :meth:`read() <qgis.core.QgsProject.read>` method, passing the path of the project to be loaded::

.. code-block:: python

    # If you are not inside a QGIS console you first need to import
    # qgis and PyQt classes you will use in this script as shown below:
    from qgis.core import QgsProject
    # Get the project instance
    project = QgsProject.instance()
    # Print the current project file name (might be empty in case no projects have been loaded)
    print(project.fileName())
    '/home/user/projects/my_qgis_project.qgs'
    # Load another project
    project.read('/home/user/projects/my_other_qgis_project.qgs')
    print(project.fileName())
    '/home/user/projects/my_other_qgis_project.qgs'


If you need to make modifications to the project (for example to add or remove some layers)
and save your changes, call the :meth:`write() <qgis.core.QgsProject.write>` method of your project instance.
The :func:`write()` method also accepts an optional path for saving the project to a new location::

.. code-block:: python

    # Save the project to the same
    project.write()
    # ... or to a new file
    project.write('/home/user/projects/my_new_qgis_project.qgs')

Both :meth:`read() <qgis.core.QgsProject.read>` and
:meth:`write() <qgis.core.QgsProject.write>` functions
return a boolean value that you can use to check if the operation was successful.

.. note::

   If you are writing a QGIS standalone application, in order to synchronise the loaded project with
   the canvas you need to instantiate a :class:`QgsLayerTreeMapCanvasBridge <qgis.gui.QgsLayerTreeMapCanvasBridge>` as in the example below:

   .. code-block:: python

      bridge = QgsLayerTreeMapCanvasBridge( \
               QgsProject.instance().layerTreeRoot(), canvas)
      # Now you can safely load your project and see it in the canvas
      project.read('/home/user/projects/my_other_qgis_project.qgs')


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
