.. only:: html

   |updatedisclaimer|

.. index:: Settings; Reading, Settings; Storing

.. settings:

****************************
Reading And Storing Settings
****************************

.. warning:: |outofdate|

Many times it is useful for a plugin to save some variables so that the user
does not have to enter or select them again next time the plugin is run.

These variables can be saved and retrieved with help of Qt and QGIS API. For each
variable, you should pick a key that will be used to access the variable ---
for user's favourite color you could use key "favourite_color" or any other
meaningful string. It is recommended to give some structure to naming of keys.

We can make difference between several types of settings:

.. index:: Settings; Global

* **global settings** --- they are bound to the user at particular machine.
  QGIS itself stores a lot of global settings, for example, main window size or
  default snapping tolerance. Setting are handled using the :class:`QgsSettings <qgis.core.QgsSettings>` class.
  The :meth:`setValue() <qgis.core.QgsSettings.setValue>` and :meth:`value() <qgis.core.QgsSettings.value>` methods from this class provide

  Here you can see an example of how this methods are used.

  .. code-block:: python

    def store():
      s = QgsSettings()
      s.setValue("myplugin/mytext", "hello world")
      s.setValue("myplugin/myint",  10)
      s.setValue("myplugin/myreal", 3.14)

    def read():
      s = QgsSettings()
      mytext = s.value("myplugin/mytext", "default text")
      myint  = s.value("myplugin/myint", 123)
      myreal = s.value("myplugin/myreal", 2.71)


  The second parameter of the :meth:`value() <qgis.core.QgsSettings.value>` method is optional and specifies
  the default value that is returned if there is no previous value set for the passed setting
  name.

.. index:: Settings; Project

* **project settings** --- vary between different projects and therefore they
  are connected with a project file. Map canvas background color or destination
  coordinate reference system (CRS) are examples --- white background and WGS84
  might be suitable for one project, while yellow background and UTM projection
  are better for another one.

  An example of usage follows.

 .. code-block:: python

    proj = QgsProject.instance()

    # store values
    proj.writeEntry("myplugin", "mytext", "hello world")
    proj.writeEntry("myplugin", "myint", 10)
    proj.writeEntry("myplugin", "mydouble", 0.01)
    proj.writeEntry("myplugin", "mybool", True)

    # read values
    mytext = proj.readEntry("myplugin", "mytext", "default text")[0]
    myint = proj.readNumEntry("myplugin", "myint", 123)[0]

  As you can see, the :meth:`writeEntry() <qgis.core.QgsProject.writeEntry>` method is used for all data types, but
  several methods exist for reading the setting value back, and the
  corresponding one has to be selected for each data type.

.. index:: Settings; Map layer

* **map layer settings** --- these settings are related to a particular
  instance of a map layer with a project. They are *not* connected with
  underlying data source of a layer, so if you create two map layer instances
  of one shapefile, they will not share the settings. The settings are stored
  in project file, so if the user opens the project again, the layer-related
  settings will be there again. The value for a given setting is retrieved using
  the :meth:`customProperty() <qgis.core.QgsMapLayer.customProperty>` method, and can be set using the :meth:`setCustomProperty() <qgis.core.QgsMapLayer.setCustomProperty>` one.

 .. code-block:: python

   # save a value
   layer.setCustomProperty("mytext", "hello world")

   # read the value again
   mytext = layer.customProperty("mytext", "default text")


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |outofdate| replace:: `Despite our constant efforts, information beyond this line may not be updated for QGIS 3. Refer to https://qgis.org/pyqgis/master for the python API documentation or, give a hand to update the chapters you know about. Thanks.`
.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit https://docs.qgis.org/3.4 for QGIS 3.4 docs and translations.`
