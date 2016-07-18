.. _r-syntax-table:

**************************************
R Syntax Summary table for Processing
**************************************

Module contributed by Matteo Ghetta - funded by `Scuola Superiore Sant'Anna <http://www.santannapisa.it/it/istituto/scienze-della-vita/agricultural-water-management>`_

Processing allows a lot of different input and output parameter that can be used
in the script body.
Here a summary table:

Input parameters
================

+----------------+----------------------------------+-------------------------------------------------------------------------------+
| Parameter      | Syntax example                   | Returning objects                                                             |
+================+==================================+===============================================================================+
| vector         | Layer = vector                   | SpatialDataFrame object, default object of ``rgdal`` package                  |
+----------------+----------------------------------+-------------------------------------------------------------------------------+
| vector point   | Layer = vector point             | SpatialPointDataFrame object, default object of ``rgdal`` package             |
+----------------+----------------------------------+-------------------------------------------------------------------------------+
| vector line    | Layer = vector line              | SpatialLineDataFrame object, default object of ``rgdal`` package              |
+----------------+----------------------------------+-------------------------------------------------------------------------------+
| vector polygon | Layer = vector polygon           | SpatialPolygonsDataFrame object, default object of ``rgdal`` package          |
+----------------+----------------------------------+-------------------------------------------------------------------------------+
| multiple vector| Layer = multiple vector          | SpatialDataFrame objects, default object of ``rgdal`` package                 |
+----------------+----------------------------------+-------------------------------------------------------------------------------+
| table          | Layer = table                    | dataframe conversion from csv, default object of ``read.csv`` function        |
+----------------+----------------------------------+-------------------------------------------------------------------------------+
| field          | Field = Field Layer              | name of the Field selected, e.g. ``"Area"``                                   |
+----------------+----------------------------------+-------------------------------------------------------------------------------+
| raster         | Layer = raster                   | RasterBrick object, default object of ``raster`` package                      |
+----------------+----------------------------------+-------------------------------------------------------------------------------+
| multiple raster| Layer = multiple raster          | RasterBrick objects, default object of ``raster`` package                     |
+----------------+----------------------------------+-------------------------------------------------------------------------------+
| number         | N = number                       | integer or floating number chosen                                             |
+----------------+----------------------------------+-------------------------------------------------------------------------------+
| string         | S = string                       | string added in the box                                                       |
+----------------+----------------------------------+-------------------------------------------------------------------------------+
| longstring     | LS = longstring                  | string added in the box, could be longer then the normal string               |
+----------------+----------------------------------+-------------------------------------------------------------------------------+
| selection      | S = selection first;second;third | string of the selected item chosen in the dropdown menu                       |
+----------------+----------------------------------+-------------------------------------------------------------------------------+
| crs            | C = crs                          | string of the resulting CRS chosen, in the format: ``"EPGS:4326"``            |
+----------------+----------------------------------+-------------------------------------------------------------------------------+
| extent         | E = extent                       | Extent object of the ``raster`` package, you can extract values as ``E@xmin`` |
+----------------+----------------------------------+-------------------------------------------------------------------------------+
| point          | P = point                        | when clicked on the map, you have the coordinates of the point                |
+----------------+----------------------------------+-------------------------------------------------------------------------------+
| file           | F = file                         | path of the file chosen, e.g. "/home/matteo/file.txt"                         |
+----------------+----------------------------------+-------------------------------------------------------------------------------+
| folder         | F = folder                       | path of the folder chosen, e.g. "/home/matteo/Downloads"                      |
+----------------+----------------------------------+-------------------------------------------------------------------------------+

Any of the input could be also **OPTIONAL**, that means that you have a handy
way to tell the script to ignore this parameter.

In order to set an input as optional, you just have to add the string ``optional``
**before** the input, e.g::

  ##Layer = vector
  ##Field1 = Field Layer
  ##Field2 = optional Field Layer


Output parameters
=================

Output parameters take the **Input** names you gave at the beginning of the script
and write the object you want.


+----------------+----------------------------------+
| Parameter      | Syntax example                   |
+================+==================================+
| vector         | Output = output vector           |
+----------------+----------------------------------+
| raster         | Output = output raster           |
+----------------+----------------------------------+
| table          | Output = output table            |
+----------------+----------------------------------+
| file           | Output = output file             |
+----------------+----------------------------------+

.. note:: for the plot input type, you can save the plot as ``png`` directly from
   the *Processing Result Viewer* or you can choose to save the plot directly
   from the algorithm interface.


Examples
========

In order to better understand all the input and output parameters, please have a
look at the :ref:`R Syntax chapter <r-syntax>`.
