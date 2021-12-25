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

   ":ref:`SERVICE <services_basics_service>`", "Yes", "Name of the service (**WMTS**)"
   ":ref:`REQUEST <services_basics_request>`", "Yes", "Name of the request (**GetCapabilities**)"


In addition to the standard ones, QGIS Server supports the following extra
parameters:


.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   ":ref:`MAP <services_basics_map>`", "Yes", "QGIS project file"


URL example:

.. code-block:: bash

  http://localhost/?
  SERVICE=WMTS
  &REQUEST=GetCapabilities
  &MAP=/home/qgis/projects/world.qgs


.. _wmts_gettile:

GetTile
-------

Standard parameters for the **GetTile** request according to the
OGC WMTS 1.0.0 specifications:

.. csv-table::
   :header: "Parameter", "Required", "Description"
   :widths: auto

   ":ref:`SERVICE <services_basics_service>`", "Yes", "Name of the service (**WMTS**)"
   ":ref:`REQUEST <services_basics_request>`", "Yes", "Name of the request (**GetTile**)"
   ":ref:`LAYER <wms_layers>`", "Yes", "Layer identifier"
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

   ":ref:`MAP <services_basics_map>`", "Yes", "QGIS project file"


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

   ":ref:`SERVICE <services_basics_service>`", "Yes", "Name of the service (**WMTS**)"
   ":ref:`REQUEST <services_basics_request>`", "Yes", "Name of the request (**GetFeatureInfo**)"
   ":ref:`LAYER <wms_layers>`", "Yes", "Layer identifier"
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

   ":ref:`MAP <services_basics_map>`", "Yes", "QGIS project file"


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
