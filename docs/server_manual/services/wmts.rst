Web Map Tile Service (WMTS)
===========================

The **1.0.0** WMTS standard implemented in QGIS Server provides a HTTP
interface to request tiled map images generated from a QGIS project.
A typical WMTS request defined the QGIS project to use, some WMS
parameters like layers to render, as well as tile parameters.

Specifications document of the service:

- `WMTS 1.0.0 <http://portal.opengeospatial.org/files/?artifact_id=35326>`_

Standard requests provided by QGIS Server:

.. csv-table::
   :header: "Request", "Description"
   :widths: auto

   ":ref:`GetCapabilities <wmts_getcapabilities>`", "Returns XML metadata with information about the server"
   ":ref:`GetTile <wmts_gettile>`", "Returns a tile"
   ":ref:`GetFeatureInfo <wmts_getfeatureinfo>`", "Retrieves data (geometry and values) for a pixel location"


.. _wmts_getcapabilities:

GetCapabilities
---------------

Standard parameters for the **GetCapabilities** request according to
the OGC WMTS 1.0.0 specifications:

.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   ":ref:`SERVICE <wmts_service>`", "Yes", "Name of the service (**WMTS**)"
   ":ref:`REQUEST <wmts_getcapabilities_request>`", "Yes", "Name of the request (**GetCapabilities**)"


In addition to the standard ones, QGIS Server supports the following extra
parameters:


.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   ":ref:`MAP <wmts_map>`", "Yes", "Specify the QGIS project file"


URL example:

.. code-block:: bash

  http://localhost/?
  SERVICE=WMTS
  &REQUEST=GetCapabilities
  &MAP=/home/qgis/projects/world.qgs


.. _wmts_service:

SERVICE
^^^^^^^

This parameter has to be ``WMTS`` in case of the **WMTS** service.


.. _wmts_getcapabilities_request:

REQUEST
^^^^^^^

This parameter is ``GetCapabilities`` in case of the
**GetCapabilities** request.

.. _wmts_map:

MAP
^^^

This parameter allows to define the QGIS project file to use and is mandatory
because a request needs a QGIS project to actually work.  However, the
``QGIS_PROJECT_FILE`` environment variable may be used to define a default QGIS
project.  In this specific case, ``MAP`` is no longer a required parameter.
For further information you may refer to :ref:`server_env_variables`.


.. _wmts_gettile:

GetTile
-------

Standard parameters for the **GetTile** request according to the
OGC WMTS 1.0.0 specifications:

.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   ":ref:`SERVICE <wmts_service>`", "Yes", "Name of the service (**WMTS**)"
   ":ref:`REQUEST <wmts_gettile_request>`", "Yes", "Name of the request (**GetTile**)"
   ":ref:`LAYER <wmts_gettile_layer>`", "Yes", "Layer identifier"
   ":ref:`FORMAT <wmts_gettile_format>`", "Yes", "Output format of the tile"
   ":ref:`TILEMATRIXSET <wmts_gettile_tilematrixset>`", "Yes", "Name of the pyramid"
   ":ref:`TILEMATRIX <wmts_gettile_tilematrix>`", "Yes", "Meshing"
   ":ref:`TILEROW <wmts_gettile_tilerow>`", "Yes", "Row coordinate in the mesh"
   ":ref:`TILECOL <wmts_gettile_tilecol>`", "Yes", "Column coordinate in the mesh"


In addition to the standard ones, QGIS Server supports the following
extra parameters:


.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   ":ref:`MAP <wmts_map>`", "Yes", "Specify the QGIS project file"


URL example:

.. code-block:: bash

  http://localhost/?
  SERVICE=WMTS
  &REQUEST=GetTile
  &MAP=/home/qgis/projects/world.qgs
  &LAYER=mylayer
  &FORMAT=image/png
  &TILEMATRIXSET=EPSG:4326
  &TILEROW=0
  &TILECOL=0


.. _wmts_gettile_request:

REQUEST
^^^^^^^

This parameter is ``GetTile`` in case of the **GetTile** request.


.. _wmts_gettile_layer:

LAYER
^^^^^

This parameter allows to specify the layer to display on the tile.

In addition, QGIS Server introduced some options to select a layer
by:

* a short name
* the layer id

The short name of a layer may be configured through
:menuselection:`Properties --> Metadata` in layer menu. If the short
name is defined, then it's used by default instead of the layer's name:

.. code-block:: bash

  http://localhost/?
  SERVICE=WMTS
  &REQUEST=GetTile
  &LAYER=mynickname
  &...

Moreover, there's a project option allowing to select layers by their
id in :menuselection:`OWS Server --> WMS capabilities` menu of the
:menuselection:`Project --> Project Properties` dialog. To activate
this option, the checkbox :guilabel:`Use layer ids as names` has to be
selected.

.. code-block:: bash

  http://localhost/?
  SERVICE=WMTS
  &REQUEST=GetTile
  &LAYER=mylayerid1
  &...


.. _wmts_gettile_format:

FORMAT
^^^^^^

This parameter may be used to specify the format of tile image.
Available values are:

- ``jpg``
- ``jpeg``
- ``image/jpeg``
- ``image/png``

If the ``FORMAT`` parameter is different from one of these values, then
the default format PNG is used instead.


.. _wmts_gettile_tilematrixset:

TILEMATRIXSET
^^^^^^^^^^^^^

This parameter defines the CRS to use when computing the underlying
pyramid. Format: ``EPSG:XXXX``.


.. _wmts_gettile_tilematrix:

TILEMATRIX
^^^^^^^^^^

This parameter allows to define the matrix to use for the output tile.


.. _wmts_gettile_tilerow:

TILEROW
^^^^^^^

This parameter allows to select the row of the tile to get within the
matrix.


.. _wmts_gettile_tilecol:

TILECOL
^^^^^^^

This parameter allows to select the column of the tile to get within
the matrix.



.. _wmts_getfeatureinfo:

GetFeatureInfo
--------------

Standard parameters for the **GetFeatureInfo** request according to
the OGC WMTS 1.0.0 specification:

.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   ":ref:`SERVICE <wmts_service>`", "Yes", "Name of the service (**WMTS**)"
   ":ref:`REQUEST <wmts_getfeatureinfo_request>`", "Yes", "Name of the request (**GetFeatureInfo**)"
   ":ref:`LAYER <wmts_getfeatureinfo_layer>`", "Yes", "Layer identifier"
   ":ref:`INFOFORMAT <wmts_getfeatureinfo_infoformat>`", "No", "Output format"
   ":ref:`I <wmts_getfeatureinfo_i>`", "No", "X coordinate of a pixel"
   ":ref:`J <wmts_getfeatureinfo_j>`", "No", "Y coordinate of a pixel"
   ":ref:`TILEMATRIXSET <wmts_gettile_tilematrixset>`", "Yes", "Name of the pyramid"
   ":ref:`TILEMATRIX <wmts_gettile_tilematrix>`", "Meshing"
   ":ref:`TILEROW <wmts_gettile_tilerow>`", "Yes", "Row coordinate in the mesh"
   ":ref:`TILECOL <wmts_gettile_tilecol>`", "Yes", "Column coordinate in the mesh"


In addition to the standard ones, QGIS Server supports the following
extra parameters:


.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   ":ref:`MAP <wmts_map>`", "Yes", "Specify the QGIS project file"


URL example:

.. code-block:: bash

  http://localhost/?
  SERVICE=WMTS
  &REQUEST=GetFeatureInfo
  &MAP=/home/qgis/projects/world.qgs
  &LAYER=mylayer
  &INFOFORMAT=image/html
  &I=10
  &J=5


.. _wmts_getfeatureinfo_request:

REQUEST
^^^^^^^

This parameter is ``GetFeatureInfo`` in case of the **GetFeatureInfo** request.


.. _wmts_getfeatureinfo_layer:

LAYER
^^^^^

This parameter allows to specify the layer to display on the tile.

In addition, QGIS Server introduced some options to select a layer by:

* a short name
* the layer id

The short name of a layer may be configured through
:menuselection:`Properties --> Metadata` in layer menu. If the short
name is defined, then it's used by default instead of the layer's
name:

.. code-block:: bash

  http://localhost/?
  SERVICE=WMTS
  &REQUEST=GetFeatureInfo
  &LAYER=mynickname
  &...

Moreover, there's a project option allowing to select layers by their
id in :menuselection:`OWS Server --> WMS capabilities` menu of the
:menuselection:`Project --> Project Properties` dialog. To activate
this option, the checkbox :guilabel:`Use layer ids as names` has to be
selected.

.. code-block:: bash

  http://localhost/?
  SERVICE=WMTS
  &REQUEST=GetFeatureInfo
  &LAYER=mylayerid1
  &...


.. _wmts_getfeatureinfo_infoformat:

INFOFORMAT
^^^^^^^^^^

This parameter allows to define the output format of the result.
Available values are:

- ``text/xml``
- ``text/html``
- ``text/plain``
- ``application/vnd.ogc.gml``

The default value is ``text/plain``.


.. _wmts_getfeatureinfo_i:

I
^

This parameter allows to define the X coordinate of the pixel for
which we want to retrieve underlying information.


.. _wmts_getfeatureinfo_j:

J
^

This parameter allows to define the Y coordinate of the pixel for
which we want to retrieve underlying information.
