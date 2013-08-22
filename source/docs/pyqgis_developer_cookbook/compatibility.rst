***************************************
Compatibility with older QGIS versions
***************************************


Plugin menu
===========

If you place your plugin menu entries into one of the
new menus (`Raster`, `Vector`, `Database` or `Web`), you should modify the code
of the ``initGui()`` and ``unload()`` functions. Since these new menus are
available only in QGIS 2.0, the first step is to check that the running QGIS
version has all necessary functions. If the new menus are available, we will
place our plugin under this menu, otherwise we will use the old `Plugins` menu.
Here is an example for `Raster` menu::

    def initGui(self):
      # create action that will start plugin configuration
      self.action = QAction(QIcon(":/plugins/testplug/icon.png"), "Test plugin", self.iface.mainWindow())
      self.action.setWhatsThis("Configuration for test plugin")
      self.action.setStatusTip("This is status tip")
      QObject.connect(self.action, SIGNAL("triggered()"), self.run)

      # check if Raster menu available
      if hasattr(self.iface, "addPluginToRasterMenu"):
        # Raster menu and toolbar available
        self.iface.addRasterToolBarIcon(self.action)
        self.iface.addPluginToRasterMenu("&Test plugins", self.action)
      else:
        # there is no Raster menu, place plugin under Plugins menu as usual
        self.iface.addToolBarIcon(self.action)
        self.iface.addPluginToMenu("&Test plugins", self.action)

      # connect to signal renderComplete which is emitted when canvas rendering is done
      QObject.connect(self.iface.mapCanvas(), SIGNAL("renderComplete(QPainter *)"), self.renderTest)

    def unload(self):
      # check if Raster menu available and remove our buttons from appropriate
      # menu and toolbar
      if hasattr(self.iface, "addPluginToRasterMenu"):
        self.iface.removePluginRasterMenu("&Test plugins",self.action)
        self.iface.removeRasterToolBarIcon(self.action)
      else:
        self.iface.removePluginMenu("&Test plugins",self.action)
        self.iface.removeToolBarIcon(self.action)

      # disconnect from signal of the canvas
      QObject.disconnect(self.iface.mapCanvas(), SIGNAL("renderComplete(QPainter *)"), self.renderTest)

