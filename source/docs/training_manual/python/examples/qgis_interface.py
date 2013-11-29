Discovering the Interface object.

dir(qgis.utils.iface)
dir(qgis.utils.iface.legendInterface())
dir(qgis.utils.iface.legendInterface().layers())
for layer in qgis.utils.iface.legendInterface().layers(): print layer.source()


Get all the layers loaded in the legend by layer id using a list comprehension:

myIds = [layer.getLayerID() for layer in qgis.utils.iface.legendInterface().layers()]



