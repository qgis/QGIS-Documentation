.. loadproject:

****************
Loading Projects
****************

Sometimes you need to load an existing project from a plugin or (more often)
when developing a stand-alone QGIS Python application (see: :ref:`pythonapplications`).


.. index::
  pair: projects; loading

To load a project into the current QGIS application you need a :class:`QgsProject`
:func:`instance()` object and call its :func:`read()` method passing to it a
:class:`QFileInfo` object that contains the path from where the project will
be loaded::

    # If you are not inside a QGIS console you first need to import
    # qgis and PyQt4 classes you will use in this script as shown below:
    from qgis.core import QgsProject
    from PyQt4.QtCore import QFileInfo
    # Get the project instance
    project = QgsProject.instance()
    # Print the current project file name (might be empty in case no projects have been loaded)
    print project.fileName
    u'/home/user/projects/my_qgis_project.qgs'
    # Load another project
    project.read(QFileInfo('/home/user/projects/my_other_qgis_project.qgs'))
    print project.fileName
    u'/home/user/projects/my_other_qgis_project.qgs'


In case you need to make some modifications to the project (for example
add or remove some layers) and save your changes, you can call the :func:`write()`
method of your project instance. The :func:`write()` method also accepts an optional
:class:`QFileInfo` that allows you to specify a path where the project will be saved::

    # Save the project to the same
    project.write()
    # ... or to a new file
    project.write(QFileInfo('/home/user/projects/my_new_qgis_project.qgs'))

Both :func:`read()` and :func:`write()` funtions return a boolean value that you can
use to check if the operation was successful.

.. note::

   If you are writing a |QG| standalone application, in order to synchronise the loaded project with
   the canvas you need to instanciate a :class:`QgsLayerTreeMapCanvasBridge` as in the example below::

      bridge = QgsLayerTreeMapCanvasBridge( \
               QgsProject.instance().layerTreeRoot(), canvas)
      # Now you can safely load your project and see it in the canvas
      project.read(QFileInfo('/home/user/projects/my_other_qgis_project.qgs'))

