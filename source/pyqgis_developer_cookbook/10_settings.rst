.. index:: settings; reading, settings; storing

.. settings:

Reading And Storing Settings
============================

Many times it is useful for a plugin to save some variables so that the user does not have to enter or select them again next time the plugin is run.

These variables can be saved a retrieved with help of Qt and QGIS API. For each variable, you should pick a key that will be used to access the
variable - for user's favourite color you could use key "favourite_color" or any other meaningful string. It is recommended to give some structure
to naming of keys.

We can make difference between several types of settings:

.. index:: settings; global

* **global settings** - they are bound to the user at particular machine. QGIS itself stores a lot of global settings,
  for example, main window size or default snapping tolerance. This functionality is provided directly by Qt framework by the means of QSettings class.
  By default, this class stores settings in system's "native" way of storing settings, that is - registry (on Windows), .plist file (on Mac OS X) or .ini file (on Unix).
  The `QSettings documentation <http://doc.qt.nokia.com/stable/qsettings.html>`_ is comprehensive, so we will provide just a simple example::

    def store():
      s = QSettings()
      s.setValue("myplugin/mytext", "hello world")
      s.setValue("myplugin/myint",  10)
      s.setValue("myplugin/myreal", 3.14)

    def read():
      s = QSettings()
      mytext = s.value("myplugin/mytext", "default text").toString()
      myint  = s.value("myplugin/myint", 123).toInt()[0]
      myreal = s.value("myplugin/myreal", 2.71).toDouble()[0]
  
  Qt uses QVariant instances for variable values in setValue() and value() methods. Your values are automagically converted from Python to QVariant
  instances, however the conversion from QVariant to Python is not automatic: that's why we use the to*() methods. Few more things to note here:

  * the second parameter to value() method is optional and states the default value if there is no previous value set
  * toString() returns a QString instance, not a Python string
  * toInt() and toDouble() return tuples (value, ok) - the second item indicates True
    if whether the conversion from QVariant to the number went fine - in this example we ignore that indicator and only take the value.
  
.. index:: settings; project

* **project settings** vary between different projects and therefore they are connected with a project file.
  Map canvas background or destination coordinate reference system (CRS) are examples - white background and WGS84 might be suitable for one project,
  while yellow background and UTM projection for another one. An example of usage follows::

    proj = QgsProject.instance()

    # store values
    proj.writeEntry("myplugin", "mytext", "hello world")
    proj.writeEntry("myplugin", "myint", 10)

    # read values
    mytext = proj.readEntry("myplugin", "mytext", "default text")[0]
    myint = proj.readNumEntry("myplugin", "myint", 123)[0]

  Hopefully the QgsProject class will be updated in future to provide API similar to the one of QSettings class. Due to some limitations of
  Python bindings, it is not possible to save floating point numbers.

.. index:: settings; map layer

* **map layer settings** - these settings are related to a particular instance of a map layer with a project. They are *not* connected with underlying
  data source of a layer, so if you create two map layer instances of one shapefile, they will not share the settings. The settings are stored in project
  file, so if the user opens the project again, the layer-related settings will be there again. This functionality has been
  added in QGIS v1.4. The API is similar to QSettings - it takes and returns QVariant instances::

   # save a value
   layer.setCustomProperty("mytext", "hello world")

   # read the value again
   mytext = layer.customProperty("mytext", "default text").toString()


**TODO:**
   Keys for settings that can be shared among plugins
