.. _projectpy:

*************************************
Accessing the Table Of Contents (TOC)
*************************************

.. contents::
   :local:

If you’re outside the pyqgis console, the code snippets on this page need the
following imports:

.. testcode::

   from qgis.core import (QgsProject,
                          QgsLayerTreeGroup,
                          QgsLayerTreeLayer,
                          )

You can use different classes to access all the loaded layers in the TOC and
use them to retrieve information:

* :class:`QgsProject <qgis.core.QgsProject>`
* :class:`QgsLayerTreeGroup <qgis.core.QgsLayerTreeGroup>`

The QgsProject class
====================

You can use :class:`QgsProject <qgis.core.QgsProject>` to retrieve information
about the TOC and all the layer loaded.

You have to create an ``instance`` of :class:`QgsProject <qgis.core.QgsProject>`
and use its methods to get the loaded layers.

The main method is :meth:`mapLayers() <qgis.core.QgsProject.mapLayers>`. It will
return a dictionary of the loaded layers:

.. code-block:: python

  d = QgsProject.instance().mapLayers()
  d
  {'ne_10m_populated_places_82a2e342_f2a0_4496_b5bc_fdd5a2bea4d8': <qgis._core.QgsVectorLayer object at 0x7f1e98c438b8>, 'countries_d0c46c9f_2bd6_4745_9bbd_5bf265500431': <qgis._core.QgsVectorLayer object at 0x7f1e98c43828>, 'regions_77909407_0815_4c37_96e3_19e9f2aa2657': <qgis._core.QgsVectorLayer object at 0x7f1e98c43678>}

The dictionary ``keys`` are the unique layer ids while the ``values`` are the
related objects.

It is now straightforward to obtain any other information about the layers:

.. code-block:: python

  # list of layer names using list comprehension
  l = [layer.name() for layer in QgsProject.instance().mapLayers().values()]
  # dictionary with key = layer name and value = layer object
  d = {}
  for l in QgsProject.instance().mapLayers().values():
    d[l.name()] = l
  d
  {'ne_10m_populated_places': <qgis._core.QgsVectorLayer object at 0x7f1e98c438b8>, 'regions': <qgis._core.QgsVectorLayer object at 0x7f1e98c43678>, 'countries': <qgis._core.QgsVectorLayer object at 0x7f1e98c43828>}

You can also query the TOC using the name of the layer:

.. code-block:: python

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

.. code-block:: python

    root = QgsProject.instance().layerTreeRoot()

``root`` is a group node and has *children*:

.. code-block:: python

    root.children()

A list of direct children is returned. Sub group children should be accessed
from their own direct parent.

We can retrieve one of the children:

.. code-block:: python

    child0 = root.children()[0]
    child0
    <qgis._core.QgsLayerTreeGroup object at 0x7f1e1ea54168>

Layers can also be retrieved using their (unique) ``id``:

.. code-block:: python

    ids = root.findLayerIds()
    # access the first layer of the ids list
    root.findLayer(ids[0])

And groups can also be searched using their names:

.. code-block:: python

    root.findGroup('Group Name')


:class:`QgsLayerTreeGroup <qgis.core.QgsLayerTreeGroup>` has many other useful
methods that can be used to obtain more information about the TOC:

.. code-block:: python

    # list of all the checked layers in the TOC
    cl = root.checkedLayers()
    cl
    [<qgis._core.QgsVectorLayer object at 0x7f1e98c43678>]

Now let’s add some layers to the project’s layer tree. There are two ways of doing
that:

#. **Explicit addition** using the :meth:`addLayer() <qgis.core.QgsLayerTreeGroup.addLayer>`
   or :meth:`insertLayer() <qgis.core.QgsLayerTreeGroup.insertLayer>`
   functions:

   .. code-block:: python

      # create a temporary layer
      layer1 = QgsVectorLayer("path_to_layer", "Layer 1", "memory")
      # add the layer to the legend, last position
      root.addLayer(layer1)
      # add the layer at given position
      root.insertLayer(5, layer1)

#. **Implicit addition**: since the project's layer tree is connected to the
   layer registry it is enough to add a layer to the map layer registry:

   .. code-block:: python

       QgsProject.instance().addMapLayer(layer1)


You can switch between :class:`QgsVectorLayer <qgis.core.QgsVectorLayer>` and
:class:`QgsLayerTreeLayer <qgis.core.QgsLayerTreeLayer>` easily:

.. code-block:: python

    node_layer = root.findLayer(layer.id())
    node_layer
    <qgis._core.QgsLayerTreeLayer object at 0x7fecceb46ca8>
    node_layer.layer()
    <qgis._core.QgsVectorLayer object at 0x7fecceb46c18>

Groups can be added with the :meth:`addGroup() <qgis.core.QgsLayerTreeGroup.addGroup>`
method. In the example below, the former will add a group to the end of the TOC
while for the latter you can add another group within an existing one:

.. code-block:: python

    node_group1 = root.addGroup('Simple Group')
    # add a sub-group to Simple Group
    node_subgroup1 = node_group1.addGroup("I'm a sub group")


To moving nodes and groups there are many useful methods.

Moving an existing node is done in three steps:

#. cloning the existing node
#. moving the cloned node to the desired position
#. deleting the original node

.. code-block:: python

    # clone the group
    cloned_group1 = node_group1.clone()
    # move the node (along with sub-groups and layers) to the top
    root.insertChildNode(0, cloned_group1)
    # remove the original node
    root.removeChildNode(node_group1)

It is a little bit more *complicated* to move a layer around in the legend:

.. code-block:: python

    # get a QgsVectorLayer
    vl = QgsProject.instance().mapLayersByName("layer_name")[0]
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

.. code-block:: python

    # get a QgsVectorLayer
    vl = QgsProject.instance().mapLayersByName("layer_name")[0]
    # create a QgsLayerTreeLayer object from vl by its id
    myvl = root.findLayer(vl.id())
    # clone the myvl QgsLayerTreeLayer object
    myvlclone = myvl.clone()
    # create a new group
    group1 = root.addGroup('Group1')
    # get the parent. If None (layer is not in group) returns ''
    parent = myvl.parent()
    # move the cloned layer to the top (0)
    group1.insertChildNode(0, myvlclone)
    # remove the QgsLayerTreeLayer from its parent
    parent.removeChildNode(myvl)


Some other methods that can be used to modify the groups and layers:

.. code-block:: python

    # change the name of the group
    node_group1.setName("Group X")
    # change the name of the layer
    node_layer2.setLayerName("Layer X")
    # change the visibility of a layer
    node_group1.setVisible(True)
    node_layer2.setVisible(False)
    # expand/collapse the group view
    node_group1.setExpanded(True)
    node_group1.setExpanded(False)
