.. index:: Settings; Reading, Settings; Storing

.. highlight:: python
   :linenothreshold: 5


.. testsetup:: settings

    iface = start_qgis()

.. _settings:

****************************
Reading And Storing Settings
****************************


.. hint:: The code snippets on this page need the following imports if you're outside the pyqgis console:

  .. testcode:: settings

    from qgis.core import (
      QgsProject,
      QgsSettings,
      QgsVectorLayer
    )

.. only:: html

   .. contents::
      :local:

Many times it is useful for a plugin to save some variables so that the user
does not have to enter or select them again next time the plugin is run.

These variables can be saved and retrieved with help of Qt and QGIS API. For each
variable, you should pick a key that will be used to access the variable ---
for user's favourite color you could use key "favourite_color" or any other
meaningful string. It is recommended to give some structure to naming of keys.

We can differentiate between several types of settings:

.. index:: Settings; Global

* **global settings** --- they are bound to the user at a particular machine.
  QGIS itself stores a lot of global settings, for example, main window size or
  default snapping tolerance. Settings are handled using the
  :class:`QgsSettings <qgis.core.QgsSettings>` class, through for example
  the :meth:`setValue() <qgis.core.QgsSettings.setValue>` and
  :meth:`value() <qgis.core.QgsSettings.value>` methods.

  Here you can see an example of how these methods are used.

  .. testcode:: settings

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
      nonexistent = s.value("myplugin/nonexistent", None)
      print(mytext)
      print(myint)
      print(myreal)
      print(nonexistent)

  The second parameter of the :meth:`value() <qgis.core.QgsSettings.value>`
  method is optional and specifies the default value that is returned
  if there is no previous value set for the passed setting name.

  For a method to pre-configure the default values of the global settings
  through the  :file:`qgis_global_settings.ini` file, see :ref:`deploying_organization`
  for further details.

.. index:: Settings; Project

* **project settings** --- vary between different projects and therefore they
  are connected with a project file. Map canvas background color or destination
  coordinate reference system (CRS) are examples --- white background and WGS84
  might be suitable for one project, while yellow background and UTM projection
  are better for another one.

  An example of usage follows.

  .. testcode:: settings

    proj = QgsProject.instance()

    # store values
    proj.writeEntry("myplugin", "mytext", "hello world")
    proj.writeEntry("myplugin", "myint", 10)
    proj.writeEntryDouble("myplugin", "mydouble", 0.01)
    proj.writeEntryBool("myplugin", "mybool", True)

    # read values (returns a tuple with the value, and a status boolean
    # which communicates whether the value retrieved could be converted to
    # its type, in these cases a string, an integer, a double and a boolean
    # respectively)

    mytext, type_conversion_ok = proj.readEntry("myplugin",
                                                "mytext",
                                                "default text")
    myint, type_conversion_ok = proj.readNumEntry("myplugin",
                                                  "myint",
                                                  123)
    mydouble, type_conversion_ok = proj.readDoubleEntry("myplugin",
                                                        "mydouble",
                                                        123)
    mybool, type_conversion_ok = proj.readBoolEntry("myplugin",
                                                    "mybool",
                                                    123)

  As you can see, the :meth:`writeEntry() <qgis.core.QgsProject.writeEntry>`
  method is used for many data types (integer, string, list), but
  several methods exist for reading the setting value back, and the
  corresponding one has to be selected for each data type.

.. index:: Settings; Map layer

* **map layer settings** --- these settings are related to a particular
  instance of a map layer with a project. They are *not* connected with
  underlying data source of a layer, so if you create two map layer instances
  of one shapefile, they will not share the settings. The settings are stored
  inside the project file, so if the user opens the project again, the layer-related
  settings will be there again. The value for a given setting is retrieved using
  the :meth:`customProperty() <qgis.core.QgsMapLayer.customProperty>` method,
  and can be set using the
  :meth:`setCustomProperty() <qgis.core.QgsMapLayer.setCustomProperty>` one.

  .. testcode:: settings

   vlayer = QgsVectorLayer()
   # save a value
   vlayer.setCustomProperty("mytext", "hello world")

   # read the value again (returning "default text" if not found)
   mytext = vlayer.customProperty("mytext", "default text")
