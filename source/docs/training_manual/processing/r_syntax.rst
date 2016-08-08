.. _r-syntax:

*******************************
R Syntax in Processing scripts
*******************************

Module contributed by Matteo Ghetta - funded by `Scuola Superiore Sant'Anna <http://www.santannapisa.it/it/istituto/scienze-della-vita/agricultural-water-management>`_

Writing R scripts in Processing could be quite tricky because of the syntax that
has to be adopted.

Each script starts with the **Input** and **Output** preceded with ``##``.

Inputs
======

Before you specify teh inputs you can also set the algorithm group in which your
script will be put. If the group already exists, the algorithm will be added to
the other, else a new group will be automatically created:

1. group creation, ``##My Group=group``

Then you have to specify all the input types and eventually the additional
parameters. You can have different inputs:

1. vector, ``##Layer = vector``
2. vector Field, ``##F = Field Layer`` (where Layer is the name of the input Layer)
3. table, ``##Layer = raster``
4. number, ``##Num = number``
5. string, ``##Str = string``
6. boolean, ``##Bol = boolean``

you can also have a dropdown menu with all the parameters you want; the items
must be separated with semi columns ``;``:

7. ``##type=selection point;lines;point+lines``

Outputs
=======
As for the inputs, each output has to be defined at the beginning of the script:

1. vector, ``##output= output vector``
2. raster, ``##output= output raster``
3. table, ``##output= output raster``
4. plots, ``##showplots``
5. R output in the *Result Viewer*, just put **inside** the script ``>``
   **before** the output you want to display


Script body
===========

The script body follows an R style syntax and the **Log** panel can help you if
something went wrong with your script.

**Remember** that in the script you have to load all the additional libraries::

  library(sp)


Example with vector output
--------------------------

Let's take an algorithm from the online collection that creates random points from
the extent of an input layer::


  ##Point pattern analysis=group
  ##Layer=vector
  ##Size=number 10
  ##Output= output vector
  library(sp)
  pts=spsample(Layer,Size,type="random")
  Output=SpatialPointsDataFrame(pts, as.data.frame(pts))


and get through the lines:

1. ``Point pattern analysis`` is the group of the algorithm
2. ``Layer`` is the input **vector** layer
3. ``Size`` is the **numerical** parameter with a default value of 10
4. ``Output`` is the **vector** layer that will be created by the algorithm

5. ``library(sp)`` loads the **sp** library (that should be already installed in
   your computer and that installation has to be made **in R**)

6. call the ``spsample`` function of the ``sp`` library and pass it to all the input defined above
7. create the output vector with the ``SpatialPointsDataFrame`` function

That's it! Just run the algorithm with a vector layer you have in the QGIS Legend,
choose a number of the random point and you will get them in the QGIS Map Canvas.


Example with raster output
--------------------------

The following script will perform a basic ordinary kriging and will create a raster
map of the interpolated values::


  ##Basic statistics=group
  ##Layer=vector
  ##Field=Field Layer
  ##Output=output raster
  require("automap")
  require("sp")
  require("raster")
  table=as.data.frame(Layer)
  coordinates(table)= ~coords.x1+coords.x2
  c = Layer[[Field]]
  kriging_result = autoKrige(c~1, table)
  prediction = raster(kriging_result$krige_output)
  Output<-prediction


from a vector and its field in input the algorithm will use the ``autoKrige``
function of the ``automap`` R package and it will first calculate the kriging
model and then create a raster.

The raster is created with the ``raster`` function of the raster R package.


Example with table output
-------------------------

Let's edit the ``Summary Statistics`` algorithm so that the output is a table file (csv).

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
  sd(Layer[[Field]])),row.names=c("Sum:","Count:","Unique values:","Minimum value:","Maximum value:","Range:","Mean value:","Median value:","Standard deviation:"))
  colnames(Summary_statistics)<-c(Field)
  Stat<-Summary_statistics


The third line specifies the **Vector Field** in input and the fourth line tells
the algorithm that the output should be a table.

The last line will take the ``Stat`` object created in the script and convert it
into a ``csv`` table.

Example with console output
---------------------------

We can take the previous example and instead of creating a table, print the result
in the **Result Viewer**::

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


The script is exactly the same of above with just 2 edits:

#. no more output specified (the fourth line has been removed)
#. the last line begins with ``>`` that tells Processing to print the object
   in the result viewer


Example with plot
-----------------
Creating plots is very simple. You have to use the ``##showplots`` parameter as
the following script shows::


  ##Basic statistics=group
  ##Layer=vector
  ##Field=Field Layer
  ##showplots
  qqnorm(Layer[[Field]])
  qqline(Layer[[Field]])


the script takes a field of the vector layer in input and creates a *QQ Plot* to
test the normality of the distribution.

The plot is automatically added to the *Result Viewer* of Processing.
