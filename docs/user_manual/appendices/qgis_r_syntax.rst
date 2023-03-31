.. index::
   pair: R; Syntax
.. _r-syntax:

********************************
Appendix D: QGIS R script syntax
********************************

Contributed by Matteo Ghetta - funded by `Scuola Superiore Sant'Anna
<https://www.santannapisa.it/en/istituto/scienze-della-vita/istituto-di-scienze-della-vita>`_

Writing R scripts in Processing is a bit tricky because of the
special syntax.

A Processing R script starts with defining its **Inputs** and
**Outputs**, each preceded with double hash characters (``##``).

Before the inputs, the group to place the algoritm in can be
specified.
If the group already exists, the algorithm will be added to it,
if not, the group will be created.
In the example below, the name of the group is *My group*:

``##My Group=group``


Inputs
======

All input data and parameters have to be specified.
There are several types of inputs:

* vector: ``##Layer = vector``
* vector field: ``##F = Field Layer`` (where `Layer` is the name of an
  input vector layer the field belongs to)
* raster: ``##r = raster``
* table: ``##t = table``
* number: ``##Num = number``
* string: ``##Str = string``
* boolean: ``##Bol = boolean``

* elements in a dropdown menu.
  The items must be separated with semicolons ``;``:
  ``##type=selection point;lines;point+lines``

Outputs
=======

As for the inputs, each output has to be defined at the beginning of
the script:

* vector: ``##output= output vector``
* raster: ``##output= output raster``
* table: ``##output= output table``
* plots: ``##output_plots_to_html`` (##showplots in earlier versions)
* To show R output in the *Result Viewer*, put ``>`` in 
  front of the command whose output you would like to show.


.. index::
   pair: R; Syntax summary
.. _r-syntax-table:

Syntax Summary for QGIS R scripts
=================================

.. :note: Module contributed by Matteo Ghetta - funded by
   `Scuola Superiore Sant'Anna <http://www.santannapisa.it/it/istituto/scienze-della-vita/agricultural-water-management>`_

A number of input and output parameter types are offered.

Input parameter types
---------------------

+----------------+----------------------------------+-------------------------------------------------------------------------------------+
| Parameter      | Syntax example                   | Returning objects                                                                   |
+================+==================================+=====================================================================================+
| vector         | Layer = vector                   | sf object (or SpatialDataFrame object, if ##load_vector_using_rgdal is specified)   |
+----------------+----------------------------------+-------------------------------------------------------------------------------------+
| vector point   | Layer = vector point             | sf object (or SpatialDataFrame object, if ##load_vector_using_rgdal is specified)   |
+----------------+----------------------------------+-------------------------------------------------------------------------------------+
| vector line    | Layer = vector line              | sf object (or SpatialDataFrame object, if ##load_vector_using_rgdal is specified)   |
+----------------+----------------------------------+-------------------------------------------------------------------------------------+
| vector polygon | Layer = vector polygon           | sf object (or SpatialPolygonsDataFrame object, if ##load_vector_using_rgdal is used)|
+----------------+----------------------------------+-------------------------------------------------------------------------------------+
| multiple vector| Layer = multiple vector          | sf object (or SpatialDataFrame objects if ##load_vector_using_rgdal is specified)   |
+----------------+----------------------------------+-------------------------------------------------------------------------------------+
| table          | Layer = table                    | dataframe conversion from csv, default object of ``read.csv`` function              |
+----------------+----------------------------------+-------------------------------------------------------------------------------------+
| field          | Field = Field Layer              | name of the Field selected, e.g. ``"Area"``                                         |
+----------------+----------------------------------+-------------------------------------------------------------------------------------+
| raster         | Layer = raster                   | RasterBrick object, default object of ``raster`` package                            |
+----------------+----------------------------------+-------------------------------------------------------------------------------------+
| multiple raster| Layer = multiple raster          | RasterBrick objects, default object of ``raster`` package                           |
+----------------+----------------------------------+-------------------------------------------------------------------------------------+
| number         | N = number                       | integer or floating number chosen                                                   |
+----------------+----------------------------------+-------------------------------------------------------------------------------------+
| string         | S = string                       | string added in the box                                                             |
+----------------+----------------------------------+-------------------------------------------------------------------------------------+
| longstring     | LS = longstring                  | string added in the box, could be longer then the normal string                     |
+----------------+----------------------------------+-------------------------------------------------------------------------------------+
| selection      | S = selection first;second;third | string of the selected item chosen in the dropdown menu                             |
+----------------+----------------------------------+-------------------------------------------------------------------------------------+
| crs            | C = crs                          | string of the resulting CRS chosen, in the format: ``"EPSG:4326"``                  |
+----------------+----------------------------------+-------------------------------------------------------------------------------------+
| extent         | E = extent                       | Extent object of the ``raster`` package, you can extract values as ``E@xmin``       |
+----------------+----------------------------------+-------------------------------------------------------------------------------------+
| point          | P = point                        | when clicked on the map, you have the coordinates of the point                      |
+----------------+----------------------------------+-------------------------------------------------------------------------------------+
| file           | F = file                         | path of the file chosen, e.g. "/home/matteo/file.txt"                               |
+----------------+----------------------------------+-------------------------------------------------------------------------------------+
| folder         | F = folder                       | path of the folder chosen, e.g. "/home/matteo/Downloads"                            |
+----------------+----------------------------------+-------------------------------------------------------------------------------------+

A parameter can be **OPTIONAL**, meaning that it can be ignored.

In order to set an input as optional, you add the string ``optional``
**before** the input, e.g::

  ##Layer = vector
  ##Field1 = Field Layer
  ##Field2 = optional Field Layer


Output parameter types
----------------------

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

.. note:: You can save plots as ``png``
   from the *Processing Result Viewer*, or you can choose to
   save the plot directly from the algorithm interface.



Script body
-----------

The script body follows R syntax and the **Log** panel can
help you if there is something wrong with your script.

**Remember** that you have to load all additional libraries
in the script::

  library(sp)

.. index::
   pair: R scripts; Examples

Examples
========

Example with vector output
--------------------------

Let's take an algorithm from the online collection that creates
random points from the extent of an input layer::

  ##Point pattern analysis=group
  ##Layer=vector polygon
  ##Size=number 10
  ##Output=output vector
  library(sp)
  spatpoly = as(Layer, "Spatial")
  pts=spsample(spatpoly,Size,type="random")
  spdf=SpatialPointsDataFrame(pts, as.data.frame(pts))
  Output=st_as_sf(spdf)

Explanation (per line in the script):

1. ``Point pattern analysis`` is the group of the algorithm
2. ``Layer`` is the input **vector** layer
3. ``Size`` is a **numerical** parameter with a default value of 10
4. ``Output`` is the **vector** layer that will be created by the
   algorithm
5. ``library(sp)`` loads the **sp** library
6. ``spatpoly = as(Layer, "Spatial")`` translate to an sp object
7. Call the ``spsample`` function of the ``sp`` library and run it
   using the input defined above (``Layer`` and ``Size``)
8. Create a *SpatialPointsDataFrame* object using the
   ``SpatialPointsDataFrame`` function
9. Create the output vector layer using the ``st_as_sf``
   function

That's it! Just run the algorithm with a vector layer you have in the
QGIS Legend, choose the number of random point.
The resulting layer will be added to your map.


Example with raster output
--------------------------

The following script will perform basic ordinary kriging to
create a raster map of interpolated values from a specified field
of the input point vector layer by using the ``autoKrige``
function of the ``automap`` R package.
It will first calculate the kriging model and then create a
raster.
The raster is created with the ``raster`` function of the raster R
package::

  ##Basic statistics=group
  ##Layer=vector point
  ##Field=Field Layer
  ##Output=output raster
  ##load_vector_using_rgdal
  require("automap")
  require("sp")
  require("raster")
  table=as.data.frame(Layer)
  coordinates(table)= ~coords.x1+coords.x2
  c = Layer[[Field]]
  kriging_result = autoKrige(c~1, table)
  prediction = raster(kriging_result$krige_output)
  Output<-prediction

By using ``##load_vector_using_rgdal``, the input vector layer
will be made available as a ``SpatialDataFrame`` objects,
so we avoid having to translate it from an ``sf`` object.

Example with table output
-------------------------

Let's edit the ``Summary Statistics`` algorithm so that the output is
a table file (csv).

The script body is the following::

  ##Basic statistics=group
  ##Layer=vector
  ##Field=Field Layer
  ##Stat=Output table
  Summary_statistics<-data.frame(rbind(
      sum(Layer[[Field]]),
      length(Layer[[Field]]),
      length(unique(Layer[[Field]])),
      min(Layer[[Field]]),
      max(Layer[[Field]]),
      max(Layer[[Field]])-min(Layer[[Field]]),
      mean(Layer[[Field]]),
      median(Layer[[Field]]),
      sd(Layer[[Field]])),
    row.names=c("Sum:","Count:","Unique values:","Minimum value:","Maximum value:","Range:","Mean value:","Median value:","Standard deviation:"))
  colnames(Summary_statistics)<-c(Field)
  Stat<-Summary_statistics


The third line specifies the **Vector Field** in input and the fourth
line tells the algorithm that the output should be a table.

The last line will take the ``Stat`` object created in the script and
convert it into a ``csv`` table.

Example with console output
---------------------------

We can use the previous example and instead of creating a table,
print the result in the **Result Viewer**::

  ##Basic statistics=group
  ##Layer=vector
  ##Field=Field Layer
  Summary_statistics<-data.frame(rbind(
  sum(Layer[[Field]]),
  length(Layer[[Field]]),
  length(unique(Layer[[Field]])),
  min(Layer[[Field]]),
  max(Layer[[Field]]),
  max(Layer[[Field]])-min(Layer[[Field]]),
  mean(Layer[[Field]]),
  median(Layer[[Field]]),
  sd(Layer[[Field]])),row.names=c("Sum:","Count:","Unique values:","Minimum value:","Maximum value:","Range:","Mean value:","Median value:","Standard deviation:"))
  colnames(Summary_statistics)<-c(Field)
  >Summary_statistics


The script is exactly the same as the one above except for two edits:

#. no output specified (the fourth line has been removed)
#. the last line begins with ``>``, telling Processing to make the
   object available through the result viewer


Example with plot
-----------------
To create plots, you have to use the ``##output_plots_to_html``
parameter as in the following script::

  ##Basic statistics=group
  ##Layer=vector
  ##Field=Field Layer
  ##output_plots_to_html
  ####output_plots_to_html
  qqnorm(Layer[[Field]])
  qqline(Layer[[Field]])

The script uses a field (``Field``) of a vector layer (``Layer``) as
input, and creates a *QQ Plot* (to test the normality of the
distribution).

The plot is automatically added to the Processing *Result Viewer*.
