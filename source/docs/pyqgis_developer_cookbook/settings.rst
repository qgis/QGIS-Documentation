.. index:: settings; reading, settings; storing

.. settings:

****************************
Reading And Storing Settings
****************************

Many times it is useful for a plugin to save some variables so that the user
does not have to enter or select them again next time the plugin is run.

These variables can be saved and retrieved with help of Qt and QGIS API. For each
variable, you should pick a key that will be used to access the variable ---
for user's favourite color you could use key "favourite_color" or any other
meaningful string. It is recommended to give some structure to naming of keys.

We can make difference between several types of settings:

.. index:: settings; global

* **global settings** --- they are bound to the user at particular machine.
  QGIS itself stores a lot of global settings, for example, main window size or
  default snapping tolerance. This functionality is provided directly by Qt
  framework by the means of :class:`QSettings` class. By default, this class stores
  settings in system's "native" way of storing settings, that is --- registry
  (on Windows), .plist file (on Mac OS X) or .ini file (on Unix). The
  `QSettings documentation <http://doc.qt.io/qt-4.8/qsettings.html>`_
  is comprehensive, so we will provide just a simple example

  ::

    def store():
      s = QSettings()
      s.setValue("myplugin/mytext", "hello world")
      s.setValue("myplugin/myint",  10)
      s.setValue("myplugin/myreal", 3.14)

    def read():
      s = QSettings()
      mytext = s.value("myplugin/mytext", "default text")
      myint  = s.value("myplugin/myint", 123)
      myreal = s.value("myplugin/myreal", 2.71)


  The second parameter of the :func:`value()` method is optional and specifies
  the default value if there is no previous value set for the passed setting
  name.

.. index:: settings; project

* **project settings** --- vary between different projects and therefore they
  are connected with a project file. Map canvas background color or destination
  coordinate reference system (CRS) are examples --- white background and WGS84
  might be suitable for one project, while yellow background and UTM projection
  are better for another one. An example of usage follows

  ::

    proj = QgsProject.instance()

    # store values
    proj.writeEntry("myplugin", "mytext", "hello world")
    proj.writeEntry("myplugin", "myint", 10)
    proj.writeEntry("myplugin", "mydouble", 0.01)
    proj.writeEntry("myplugin", "mybool", True)

    # read values
    mytext = proj.readEntry("myplugin", "mytext", "default text")[0]
    myint = proj.readNumEntry("myplugin", "myint", 123)[0]

  As you can see, the :func:`writeEntry` method is used for all data types, but
  several methods exist for reading the setting value back, and the
  corresponding one has to be selected for each data type.

.. index:: settings; map layer

* **map layer settings** --- these settings are related to a particular
  instance of a map layer with a project. They are *not* connected with
  underlying data source of a layer, so if you create two map layer instances
  of one shapefile, they will not share the settings. The settings are stored
  in project file, so if the user opens the project again, the layer-related
  settings will be there again. This functionality has been added in QGIS v1.4.
  The API is similar to QSettings --- it takes and returns QVariant instances

  ::

   # save a value
   layer.setCustomProperty("mytext", "hello world")

   # read the value again
   mytext = layer.customProperty("mytext", "default text")
