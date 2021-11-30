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

   "GetCapabilities", "Returns XML metadata with information about the server"
   "GetTile", "Returns a tile"
   "GetFeatureInfo", "Retrieves data (geometry and values) for a pixel location"


.. _`qgisserver-wmts-getcapabilities`:

GetCapabilities
---------------

Standard parameters for the **GetCapabilities** request according to
the OGC WMTS 1.0.0 specifications:

.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   "SERVICE", "Yes", "Name of the service (WMTS)"
   "REQUEST", "Yes", "Name of the request (GetCapabilities)"


In addition to the standard ones, QGIS Server supports the following extra
parameters:


.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   "MAP", "Yes", "Specify the QGIS project file"


URL example:

.. code-block:: none

  http://localhost/qgisserver?
  SERVICE=WMTS
  &REQUEST=GetCapabilities
  &MAP=/home/qgis/projects/world.qgs


SERVICE
^^^^^^^

This parameter has to be ``WMTS`` in case of the **GetCapabilities**
request.


REQUEST
^^^^^^^

This parameter is ``GetCapabilities`` in case of the
**GetCapabilities** request.


MAP
^^^

This parameter allows to define the QGIS project file to use.


.. _`qgisserver-wmts-gettile`:

GetTile
-------

Standard parameters for the **GetTile** request according to the
OGC WMTS 1.0.0 specifications:

.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   "SERVICE", "Yes", "Name of the service (WMTS)"
   "REQUEST", "Yes", "Name of the request (GetTile)"
   "LAYER", "Yes", "Layer identifier"
   "FORMAT", "Yes", "Output format of the tile"
   "TILEMATRIXSET", "Yes", "Name of the pyramid"
   "TILEMATRIX", "Yes", "Meshing"
   "TILEROW", "Yes", "Row coordinate in the mesh"
   "TILECOL", "Yes", "Column coordinate in the mesh"


In addition to the standard ones, QGIS Server supports the following
extra parameters:


.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   "MAP", "Yes", "Specify the QGIS project file"


URL example:

.. code-block:: none

  http://localhost/qgisserver?
  SERVICE=WMTS
  &REQUEST=GetTile
  &MAP=/home/qgis/projects/world.qgs
  &LAYER=mylayer
  &FORMAT=image/png
  &TILEMATRIXSET=EPSG:4326
  &TILEROW=0
  &TILECOL=0


SERVICE
^^^^^^^

This parameter has to be ``WMTS`` in case of the **GetTile** request.


REQUEST
^^^^^^^

This parameter is ``GetTile`` in case of the **GetTile** request.


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

.. code-block:: none

  http://localhost/qgisserver?
  SERVICE=WMTS
  &REQUEST=GetTile
  &LAYER=mynickname
  &...

Moreover, there's a project option allowing to select layers by their
id in :menuselection:`OWS Server --> WMS capabilities` menu of the
:menuselection:`Project --> Project Properties` dialog. To activate
this option, the checkbox :guilabel:`Use layer ids as names` has to be
selected.

.. code-block:: none

  http://localhost/qgisserver?
  SERVICE=WMTS
  &REQUEST=GetTile
  &LAYER=mylayerid1
  &...


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


TILEMATRIXSET
^^^^^^^^^^^^^

This parameter defines the CRS to use when computing the underlying
pyramid. Format: ``EPSG:XXXX``.


TILEMATRIX
^^^^^^^^^^

This parameter allows to define the matrix to use for the output tile.


TILEROW
^^^^^^^

This parameter allows to select the row of the tile to get within the
matrix.


TILECOL
^^^^^^^

This parameter allows to select the column of the tile to get within
the matrix.


MAP
^^^

This parameter allows to define the QGIS project file to use.

As mentioned in :ref:`GetMap parameters table <qgisserver-wms-getmap>`,
``MAP`` is mandatory because a request needs a QGIS project to
actually work.
However, the ``QGIS_PROJECT_FILE`` environment variable may be used to
define a default QGIS project.
In this specific case, ``MAP`` is not longer a required parameter.
For further information you may refer to :ref:`server_env_variables`.


.. _`qgisserver-wmts-getfeatureinfo`:

GetFeatureInfo
--------------

Standard parameters for the **GetFeatureInfo** request according to
the OGC WMTS 1.0.0 specification:

.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   "SERVICE", "Yes", "Name of the service (WMTS)"
   "REQUEST", "Yes", "Name of the request (GetFeatureInfo)"
   "LAYER", "Yes", "Layer identifier"
   "INFOFORMAT", "No", "Output format"
   "I", "No", "X coordinate of a pixel"
   "J", "No", "Y coordinate of a pixel"
   "TILEMATRIXSET", "Yes", ":ref:`See GetTile <qgisserver-wmts-gettile>`"
   "TILEMATRIX", "Yes", ":ref:`See GetTile <qgisserver-wmts-gettile>`"
   "TILEROW", "Yes", ":ref:`See GetTile <qgisserver-wmts-gettile>`"
   "TILECOL", "Yes", ":ref:`See GetTile <qgisserver-wmts-gettile>`"


In addition to the standard ones, QGIS Server supports the following
extra parameters:


.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   "MAP", "Yes", "Specify the QGIS project file"


URL example:

.. code-block:: none

  http://localhost/qgisserver?
  SERVICE=WMTS
  &REQUEST=GetFeatureInfo
  &MAP=/home/qgis/projects/world.qgs
  &LAYER=mylayer
  &INFOFORMAT=image/html
  &I=10
  &J=5


SERVICE
^^^^^^^

This parameter has to be ``WMTS`` in case of the **GetFeatureInfo**
request.


REQUEST
^^^^^^^

This parameter is ``GetFeatureInfo`` in case of the
**GetFeatureInfo** request.


MAP
^^^

This parameter allows to define the QGIS project file to use.

As mentioned in :ref:`GetMap parameters table <qgisserver-wms-getmap>`,
``MAP`` is mandatory because a request needs a QGIS project to
actually work.
However, the ``QGIS_PROJECT_FILE`` environment variable may be used to
define a default QGIS project.
In this specific case, ``MAP`` is not longer a required parameter.
For further information you may refer to :ref:`server_env_variables`.


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

.. code-block:: none

  http://localhost/qgisserver?
  SERVICE=WMTS
  &REQUEST=GetFeatureInfo
  &LAYER=mynickname
  &...

Moreover, there's a project option allowing to select layers by their
id in :menuselection:`OWS Server --> WMS capabilities` menu of the
:menuselection:`Project --> Project Properties` dialog. To activate
this option, the checkbox :guilabel:`Use layer ids as names` has to be
selected.

.. code-block:: none

  http://localhost/qgisserver?
  SERVICE=WMTS
  &REQUEST=GetFeatureInfo
  &LAYER=mylayerid1
  &...


INFOFORMAT
^^^^^^^^^^

This parameter allows to define the output format of the result.
Available values are:

- ``text/xml``
- ``text/html``
- ``text/plain``
- ``application/vnd.ogc.gml``

The default value is ``text/plain``.


I
^

This parameter allows to define the X coordinate of the pixel for
which we want to retrieve underlying information.


J
^

This parameter allows to define the Y coordinate of the pixel for
which we want to retrieve underlying information.
