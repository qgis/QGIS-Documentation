
.. highlight:: python
   :linenothreshold: 5

.. testsetup:: loadproject

    iface = start_qgis()

    canvas = iface.mapCanvas()

The code snippets on this page need the following imports if you're outside the pyqgis console:

.. testcode:: loadproject

    from qgis.core import (
        QgsProject,
        QgsPathResolver
    )

    from qgis.gui import (
        QgsLayerTreeMapCanvasBridge,
    )


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
This is a singleton class, so you must use its :meth:`instance() <qgis.core.QgsProject.instance>` method to do it.
You can call its :meth:`read() <qgis.core.QgsProject.read>` method, passing the path of the project to be loaded:


.. testcode:: loadproject

    # If you are not inside a QGIS console you first need to import
    # qgis and PyQt classes you will use in this script as shown below:
    from qgis.core import QgsProject
    # Get the project instance
    project = QgsProject.instance()
    # Print the current project file name (might be empty in case no projects have been loaded)
    # print(project.fileName())

    # Load another project
    project.read('testdata/01_project.qgs')
    print(project.fileName())

.. testoutput:: loadproject

    testdata/01_project.qgs


If you need to make modifications to the project (for example to add or remove some layers)
and save your changes, call the :meth:`write() <qgis.core.QgsProject.write>` method of your project instance.
The :meth:`write() <qgis.core.QgsProject.write>` method also accepts an optional
path for saving the project to a new location:

.. testcode:: loadproject

    # Save the project to the same
    project.write()
    # ... or to a new file
    project.write('testdata/my_new_qgis_project.qgs')

Both :meth:`read() <qgis.core.QgsProject.read>` and
:meth:`write() <qgis.core.QgsProject.write>` functions
return a boolean value that you can use to check if the operation was successful.

.. note::

   If you are writing a QGIS standalone application, in order to synchronise the loaded project with
   the canvas you need to instantiate a :class:`QgsLayerTreeMapCanvasBridge <qgis.gui.QgsLayerTreeMapCanvasBridge>` as in the example below:

   .. testcode:: loadproject

    bridge = QgsLayerTreeMapCanvasBridge( \
             QgsProject.instance().layerTreeRoot(), canvas)
    # Now you can safely load your project and see it in the canvas
    project.read('testdata/my_new_qgis_project.qgs')


Resolving bad paths
===================

It can happen that layers loaded in the project are moved to another location.
When the project is loaded again all the layer paths are broken. 

The :class:`QgsPathResolver <qgis.core.QgsPathResolver>` class with the 
:meth:`setPathPreprocessor() <qgis.core.QgsPathResolver.setPathPreprocessor>` 
allows setting a custom path pre-processor function, which allows for 
manipulation of paths and data sources prior to resolving them to file references 
or layer sources.

The processor function must accept a single string argument (representing the
original file path or data source) and return a processed version of this path.

The path pre-processor function is called **before** any bad layer handler. 

Some use cases:

#. replace an outdated path:

   .. testcode:: loadproject

        def my_processor(path):
            return path.replace('c:/Users/ClintBarton/Documents/Projects', 'x:/Projects/')

        QgsPathResolver.setPathPreprocessor(my_processor)

#. replace a database host address with a new one:

   .. testcode:: loadproject

        def my_processor(path):
            return path.replace('host=10.1.1.115', 'host=10.1.1.116')

        QgsPathResolver.setPathPreprocessor(my_processor)

#. replace stored database credentials with new ones:

   .. testcode:: loadproject

        def my_processor(path):
            path= path.replace("user='gis_team'", "user='team_awesome'")
            path = path.replace("password='cats'", "password='g7as!m*'")
            return path

        QgsPathResolver.setPathPreprocessor(my_processor)
