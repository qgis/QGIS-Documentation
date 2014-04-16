Other programs
===================

.. note:: This chapter shows how to use additional programs from inside Processing. To complete it, you must have installed, with the tools of your operating system, the relevant packages.

.. warning:: To be done

R
--

GRASS
------

OTB
----

* How to configure the application paths

In a standard OSgeo4W Windows installation, the paths will be::

  OTB application folder    C:\OSGeo4W\apps\orfeotoolbox\applications
  OTB command line tools folder C:\OSGeo4W\bin

On Debian and derivatives, it will be :kbd:`/usr/bin`

Comparison among backends
---------------------------

Buffers and distances
.......................

Let's load ``punti.shp`` and type ``buf`` in the filter of the Toolbox, then double click on:

- :menuselection:`Fixed distance buffer`: Distance 10000
- :menuselection:`Variable distance buffer`: Distance field LARGH
- :menuselection:`v.buffer.distance`: distance 10000
- :menuselection:`v.buffer.column`: bufcolumn LARGH
- :menuselection:`Shapes Buffer`: fixed value 10000 (dissolve and not), attribute field (with scaling)

See how speed is quite different, and different options are available.

Now, raster buffers and distances:

- first, load and rasterize the vector ``fiumi.shp`` with :menuselection:`GRASS --> v.to.rast.value`; beware: cell size must be set to 100 m, otherwise the computation time will be enormous; resulting map will have 1 and NULLs
- same, with :menuselection:`SAGA --> Shapes to Grid --> COUNT` (resulting map: 6 to 60)
- then, :menuselection:`proximity` (value= 1 per GRASS, una lista degli ID dei fiumi per SAGA), :menuselection:`r.buffer` with parameters 1000,2000,3000, :menuselection:`r.grow.distance` (the first of the two maps).

Dissolve
..........

Dissolve features based on a common attribute:

- :menuselection:`GRASS --> v.dissolve` comuni.shp on PROVINCIA
- :menuselection:`QGIS --> Dissolve` comuni.shp on PROVINCIA
- :menuselection:`SAGA --> Polygon Dissolve` comuni.shp on PROVINCIA (**NB:** the same attribute has to be chosen 3 times); **NB:** a fake polygon remains, SAGA bug
