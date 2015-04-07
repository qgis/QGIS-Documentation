Other programs
===================

Module contributed by Paolo Cavallini - `Faunalia <http://www.faunalia.eu>`_ 

.. note:: This chapter shows how to use additional programs from inside Processing. To complete it, you must have installed, with the tools of your operating system, the relevant packages.

GRASS
------

GRASS_ is a free and open source GIS software suite for geospatial data management and analysis, image processing, graphics and maps production, spatial modeling, and visualization.

It is installed by default on Windows through the OSGeo4W standalone installer (32 and 64 bit), and it is packaged for all major Linux distributions.

R
--

R_ is a free and open source software environment for statistical computing and graphics.

It has to be installed separately, together with a few necessary libraries (**LIST**).

The beauty of Processing implementation is that you can add your own scripts, simple or complex ones, and they may then be used as any other module, piped into more complex workflows, etc.

Test some of the preinstalled examples, if you have R_ already installed (remember to activate R modules from the General configuration of Processing).

OTB
----

OTB_ (also known as Orfeo ToolBox) is a free and open source library of image processing algorithms. It is installed by deafult on Windows through the OSGeo4W standalone installer (32 bit). Paths should be configured in Processing.

In a standard OSgeo4W Windows installation, the paths will be::

  OTB application folder    C:\OSGeo4W\apps\orfeotoolbox\applications
  OTB command line tools folder C:\OSGeo4W\bin

On Debian and derivatives, it will be :kbd:`/usr/bin`

Others
-------

TauDEM_ is a suite of Digital Elevation Model (DEM) tools for the extraction and analysis of hydrologic information. Availability in various operating system varies.

LASTools_ is a set of mixed, free and proprietary commands to process and analyze LiDAR data. Availability in various operating system varies.

More tools are available through additional plugins, e.g.:

* LecoS_:  a suite for land cover statistics and landscape ecology
* lwgeom_: formerly part of PostGIS, this library brings a few useful tools for geometry cleanup
* Animove_: tools to analyse the home range of animals.

More will come.

Comparison among backends
---------------------------

Buffers and distances
.......................

Let's load ``points.shp`` and type ``buf`` in the filter of the Toolbox, then double click on:

- :menuselection:`Fixed distance buffer`: Distance 10000
- :menuselection:`Variable distance buffer`: Distance field SIZE
- :menuselection:`v.buffer.distance`: distance 10000
- :menuselection:`v.buffer.column`: bufcolumn SIZE
- :menuselection:`Shapes Buffer`: fixed value 10000 (dissolve and not), attribute field (with scaling)

See how speed is quite different, and different options are available.

**Exercise for the reader**: find the differences in geometry output between different methods.

Now, raster buffers and distances:

- first, load and rasterize the vector ``rivers.shp`` with :menuselection:`GRASS --> v.to.rast.value`; **beware:** cell size must be set to 100 m, otherwise the computation time will be enormous; resulting map will have 1 and NULLs
- same, with :menuselection:`SAGA --> Shapes to Grid --> COUNT` (resulting map: 6 to 60)
- then, :menuselection:`proximity` (value= 1 for GRASS, a list of rivers ID for SAGA), :menuselection:`r.buffer` with parameters 1000,2000,3000, :menuselection:`r.grow.distance` (the first of the two maps). 

Dissolve
..........

Dissolve features based on a common attribute:

- :menuselection:`GRASS --> v.dissolve` ``municipalities.shp`` on PROVINCIA
- :menuselection:`QGIS --> Dissolve` ``municipalities.shp`` on PROVINCIA
- :menuselection:`SAGA --> Polygon Dissolve` ``municipalities.shp`` on PROVINCIA (**NB:** the same attribute has to be chosen 3 times)

.. warning:: The last one is broken in SAGA <=2.10

**Exercise for the reader**: find the differences (geometry and attributes) between different methods.

.. _GRASS: http://grass.osgeo.org/
.. _R: http://www.r-project.org/
.. _OTB: http://orfeo-toolbox.org
.. _TauDEM: http://hydrology.usu.edu/taudem/taudem5/
.. _LASTools: http://rapidlasso.com/lastools/
.. _LecoS: http://conservationecology.wordpress.com/qgis-plugins-and-scripts/lecos-land-cover-statistics/
.. _lwgeom: https://plugins.qgis.org/plugins/processinglwgeomprovider/
.. _Animove: http://www.faunalia.eu/en/animove.html
