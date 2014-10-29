Hydrological analysis
============================================================


.. note:: In this lesson we will perform some hydrological analysis. This analysis will be used in some of the following lessons, as it constitutes a very good example of an analysis workflow, and we will use it to demonstrate some advanced features.


In this lesson, we are going to do some hydrological analysis. Starting with a DEM, we are going to extract a channel network, delineate watersheds and calculate some statistics. 


The first thing is to load the project with the lesson data, which just contains a DEM.

.. image:: img/hydro/dem.png


The first module to execute is *Catchment area*. You can use anyone of  the others named *Catchment area*. They have different algorithms underneath, but the results are basically the same.

Select the DEM in the *Elevation* field, and leave the default values for the rest of parameters.

.. image:: img/hydro/catchmentarea.png

Some algorithm calculates many layers, but the *Catchment Area* one is the only one we will be using.

You can get rid of the other ones if you want.

The rendering of the layer is not very informative. 

.. image:: img/hydro/catchmentlayer.png

To know why, you can have a look at the histogram and you will see that values are not evenly distributed (there are a few cells with very high value, those corresponding to the channel network). Calculating the logarithm of the catchment area value yields a layer that conveys much more information (you can do it using the raster calculator).

.. image:: img/hydro/catchmentlayerlog.png

The catchment area (also known as flow accumulation), can be used to set a threshold for channel initiation. This can be done using the *Channel network* algorithm. Here is how you have to set it up (note the *Initiation threshold* *Greater than* 10.000.000).

.. image:: img/hydro/channelnetwork.png 


Use the original catchment area layer, not the logarithm one. That one was just for rendering purposes.

If you increase the *Initiation threshold* value, you will get a more sparse channel network. If you decrease it, you will get a denser one. With the proposed value, this is what you get.

.. image:: img/hydro/channelnetworklayer.png 


The image above shows just the resulting vector layer and the DEM, but there should be also a raster one with the same channel network. That raster one will be, in fact, the one we will be using.

Now, we will use the *Watersheds basins* algorithm to delineate the subbasins corresponding to that channel network, using as outlet points all the junctions in it. Here is how you have to set the corresponding parameters dialog.

.. image:: img/hydro/watersheds.png 


And this is what you will get.

.. image:: img/hydro/watershedslayer.png 

This is a raster result. You can vectorise it using the *Vectorise grid classes* algorithm.

.. image:: img/hydro/vectorising.png 

.. image:: img/hydro/watershedslayervector.png 


Now, let's try to compute statistics about the elevation values in one of the subbasins. The idea is to have a layer that just represents the elevation within that subbasin and then pass it to the module that calculates those statistics.

First, let's clip the original DEM with the polygon representing a subbasin. We will use the *Clip Grid with Polygon* algorithm. If we select a single subbasin polygon and then call the clipping algorithm, we can clip the DEM to the area covered by that polygon, since the algorithm is aware of the selection.

Select a polygon,

.. image:: img/hydro/selectedpolygon.png 

and call the clipping algorithm with the following parameters:

.. image:: img/hydro/clipgrid.png 

The element selected in the input field is, or course, the DEM we want to clip.

You will get something like this.

.. image:: img/hydro/clippeddem.png 


This layer is ready to be used in the *Raster layer statistics* algorithm.

.. image:: img/hydro/rasterstats.png 

The resulting statistic are the following ones.

.. image:: img/hydro/stats.png 

We will use both the basin calculations procedure and the statistics calculation in other lessons, to find out how other elements can help us automate both of them and work more effectively.
