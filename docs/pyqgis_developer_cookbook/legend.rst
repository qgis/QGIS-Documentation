.. highlight:: python
   :linenothreshold: 5


.. testsetup:: legend

    from qgis.core import (
        QgsProject,
        QgsVectorLayer,
    )

    iface = start_qgis()

    # Load the countries layer
    if not QgsProject.instance().mapLayersByName("countries"):
        vlayer = QgsVectorLayer("/usr/share/qgis/resources/data/world_map.gpkg|layerName=countries", "countries", "ogr")
        assert vlayer.isValid()
        QgsProject.instance().addMapLayers([vlayer])

.. _legendpy:

*************************************
Accessing the Table Of Contents (TOC)
*************************************

.. hint:: The code snippets on this page need the following imports if you're outside the pyqgis console:

  .. testcode:: legend

    from qgis.core import (
        QgsProject,
        QgsVectorLayer,
    )

.. only:: html

   .. contents::
      :local:


You can use different classes to access all the loaded layers in the TOC and
use them to retrieve information:

* :class:`QgsProject <qgis.core.QgsProject>`
* :class:`QgsLayerTreeGroup <qgis.core.QgsLayerTreeGroup>`

The QgsProject class
====================

You can use :class:`QgsProject <qgis.core.QgsProject>` to retrieve information
about the TOC and all the layers loaded.

You have to create an ``instance`` of :class:`QgsProject <qgis.core.QgsProject>`
and use its methods to get the loaded layers.

The main method is :meth:`mapLayers() <qgis.core.QgsProject.mapLayers>`. It will
return a dictionary of the loaded layers:


.. testcode:: legend

  layers = QgsProject.instance().mapLayers()
  print(layers)

.. testoutput:: legend

  {'countries_89ae1b0f_f41b_4f42_bca4_caf55ddbe4b6': <QgsVectorLayer: 'countries' (ogr)>}

The dictionary ``keys`` are the unique layer ids while the ``values`` are the
related objects.

It is now straightforward to obtain any other information about the layers:

.. testcode:: legend

  # list of layer names using list comprehension
  l = [layer.name() for layer in QgsProject.instance().mapLayers().values()]
  # dictionary with key = layer name and value = layer object
  layers_list = {}
  for l in QgsProject.instance().mapLayers().values():
    layers_list[l.name()] = l

  print(layers_list)

.. testoutput:: legend

  {'countries': <QgsVectorLayer: 'countries' (ogr)>}


You can also query the TOC using the name of the layer:

.. testcode:: legend

    country_layer = QgsProject.instance().mapLayersByName("countries")[0]

.. note:: A list with all the matching layers is returned, so we index with
  ``[0]`` to get the first layer with this name.


QgsLayerTreeGroup class
=======================

The layer tree is a classical tree structure built of nodes. There are currently
two types of nodes: group nodes (:class:`QgsLayerTreeGroup <qgis.core.QgsLayerTreeGroup>`)
and layer nodes (:class:`QgsLayerTreeLayer <qgis.core.QgsLayerTreeLayer>`).

.. note:: for more information you can read these blog posts of Martin Dobias:
  `Part 1 <https://www.lutraconsulting.co.uk/blog/2014/07/06/qgis-layer-tree-api-part-1/>`_
  `Part 2 <https://www.lutraconsulting.co.uk/blog/2014/07/25/qgis-layer-tree-api-part-2/>`_
  `Part 3 <https://www.lutraconsulting.co.uk/blog/2015/01/30/qgis-layer-tree-api-part-3/>`_

The project layer tree can be accessed easily with the method :meth:`layerTreeRoot() <qgis.core.QgsProject.layerTreeRoot>`
of the :class:`QgsProject <qgis.core.QgsProject>` class:

.. testcode:: legend

    root = QgsProject.instance().layerTreeRoot()

``root`` is a group node and has *children*:

.. testcode:: legend

    root.children()

A list of direct children is returned. Sub group children should be accessed
from their own direct parent.

We can retrieve one of the children:

.. testcode:: legend

    child0 = root.children()[0]
    print(child0)

.. testoutput:: legend

    <QgsLayerTreeLayer: countries>

Layers can also be retrieved using their (unique) ``id``:

.. testcode:: legend

    ids = root.findLayerIds()
    # access the first layer of the ids list
    root.findLayer(ids[0])

And groups can also be searched using their names:

.. testcode:: legend

    root.findGroup('Group Name')


:class:`QgsLayerTreeGroup <qgis.core.QgsLayerTreeGroup>` has many other useful
methods that can be used to obtain more information about the TOC:

.. testcode:: legend

    # list of all the checked layers in the TOC
    checked_layers = root.checkedLayers()
    print(checked_layers)

.. testoutput:: legend

    [<QgsVectorLayer: 'countries' (ogr)>]

Now let’s add some layers to the project’s layer tree. There are two ways of doing
that:

#. **Explicit addition** using the :meth:`addLayer() <qgis.core.QgsLayerTreeGroup.addLayer>`
   or :meth:`insertLayer() <qgis.core.QgsLayerTreeGroup.insertLayer>`
   functions:

   .. testcode:: legend

      # create a temporary layer
      layer1 = QgsVectorLayer("path_to_layer", "Layer 1", "memory")
      # add the layer to the legend, last position
      root.addLayer(layer1)
      # add the layer at given position
      root.insertLayer(5, layer1)

#. **Implicit addition**: since the project's layer tree is connected to the
   layer registry it is enough to add a layer to the map layer registry:

   .. testcode:: legend

       QgsProject.instance().addMapLayer(layer1)


You can switch between :class:`QgsVectorLayer <qgis.core.QgsVectorLayer>` and
:class:`QgsLayerTreeLayer <qgis.core.QgsLayerTreeLayer>` easily:


.. testcode:: legend

    node_layer = root.findLayer(country_layer.id())
    print("Layer node:", node_layer)
    print("Map layer:", node_layer.layer())

.. testoutput:: legend

    Layer node: <QgsLayerTreeLayer: countries>
    Map layer: <QgsVectorLayer: 'countries' (ogr)>


Groups can be added with the :meth:`addGroup() <qgis.core.QgsLayerTreeGroup.addGroup>`
method. In the example below, the former will add a group to the end of the TOC
while for the latter you can add another group within an existing one:

.. testcode:: legend

    node_group1 = root.addGroup('Simple Group')
    # add a sub-group to Simple Group
    node_subgroup1 = node_group1.addGroup("I'm a sub group")


To moving nodes and groups there are many useful methods.

Moving an existing node is done in three steps:

#. cloning the existing node
#. moving the cloned node to the desired position
#. deleting the original node

.. testcode:: legend

    # clone the group
    cloned_group1 = node_group1.clone()
    # move the node (along with sub-groups and layers) to the top
    root.insertChildNode(0, cloned_group1)
    # remove the original node
    root.removeChildNode(node_group1)

It is a little bit more *complicated* to move a layer around in the legend:

.. testcode:: legend

    # get a QgsVectorLayer
    vl = QgsProject.instance().mapLayersByName("countries")[0]
    # create a QgsLayerTreeLayer object from vl by its id
    myvl = root.findLayer(vl.id())
    # clone the myvl QgsLayerTreeLayer object
    myvlclone = myvl.clone()
    # get the parent. If None (layer is not in group) returns ''
    parent = myvl.parent()
    # move the cloned layer to the top (0)
    parent.insertChildNode(0, myvlclone)
    # remove the original myvl
    root.removeChildNode(myvl)

or moving it to an existing group:

.. testcode:: legend

    # get a QgsVectorLayer
    vl = QgsProject.instance().mapLayersByName("countries")[0]
    # create a QgsLayerTreeLayer object from vl by its id
    myvl = root.findLayer(vl.id())
    # clone the myvl QgsLayerTreeLayer object
    myvlclone = myvl.clone()
    # create a new group
    group1 = root.addGroup("Group1")
    # get the parent. If None (layer is not in group) returns ''
    parent = myvl.parent()
    # move the cloned layer to the top (0)
    group1.insertChildNode(0, myvlclone)
    # remove the QgsLayerTreeLayer from its parent
    parent.removeChildNode(myvl)


Some other methods that can be used to modify the groups and layers:

.. testcode:: legend

    node_group1 = root.findGroup("Group1")
    # change the name of the group
    node_group1.setName("Group X")
    node_layer2 = root.findLayer(country_layer.id())
    # change the name of the layer
    node_layer2.setName("Layer X")
    # change the visibility of a layer
    node_group1.setItemVisibilityChecked(True)
    node_layer2.setItemVisibilityChecked(False)
    # expand/collapse the group view
    node_group1.setExpanded(True)
    node_group1.setExpanded(False)
