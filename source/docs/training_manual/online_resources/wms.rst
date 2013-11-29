|LS| Web Mapping Services
===============================================================================

A Web Mapping Service (WMS) is a service hosted on a remote server. Similar to
a website, you can access it as long as you have a connection to the server.
Using QGIS, you can load a WMS directly into your existing map.

From the lesson on plugins, you will remember that it's possible to load a new
raster image from Google, for example.  However, this is a once-off
transaction: once you have downloaded the image, it doesn't change. A WMS is
different, in that it's a live service that will automatically refresh its view
if you pan or zoom on the map.

**The goal for this lesson:** To use a WMS and understand its limitations.

|basic| |FA| Loading a WMS Layer
-------------------------------------------------------------------------------

For this exercise, you can either use the basic map you made at the start of
the course, or just start a new map and load some existing layers into it. For
this example, we used the :guilabel:`places`, :guilabel:`new_solution` and
:guilabel:`important_roads` layers:

.. image:: ../_static/online_resources/001.png
   :align: center

* Load these layers into a new map, or use your original map with only these
  layers visible.

* Before starting to add the WMS layer, first deactivate "on the fly"
  projection.  This may cause the layers to no longer overlap properly, but
  don't worry: we'll fix that later.
* To add WMS layers, click on the :guilabel:`Add WMS Layer` button:

  .. image:: ../_static/online_resources/002.png
     :align: center

Remember how you connected to a SpatiaLite database at the beginning of the
course. The :guilabel:`rural`, :guilabel:`urban`, and :guilabel:`water` layers
are in that database. To use those layers, you first needed to connect to the
database. Using a WMS is similar, with the exception (of course) that the
layers are on a remote server.

* To create a new connection to a WMS, click on the :guilabel:`New` button.

You'll need a WMS address to continue. There are several free WMS servers
available on the Internet. One of these is `GIS-LAB.info
<http://irs.gis-lab.info/>`_, which makes use of the `OpenStreetMap
<http://wiki.openstreetmap.org/wiki/Main_Page>`_ dataset.

* To make use of this WMS, set it up in your current dialog, like this:

  .. image:: ../_static/online_resources/005.png
     :align: center

* The value of the :guilabel:`Name` field should be :kbd:`gis-lab`.
* The value of the :guilabel:`URL` field should be
  :kbd:`http://irs.gis-lab.info/`.
* Click :guilabel:`OK`. You should see the new WMS server listed:

  .. image:: ../_static/online_resources/006.png
     :align: center

* Click :guilabel:`Connect`. In the list below, you should now see these new
  entries loading:

  .. image:: ../_static/online_resources/007.png
     :align: center

  These are all the layers hosted by this WMS server.
* Click once on the :guilabel:`osm` layer (it stands for OpenStreetMap, which
  is the data we want).  It will display its :guilabel:`Coordinate Reference
  System`:

  .. image:: ../_static/online_resources/008.png
     :align: center

Since we're not using :kbd:`WGS 84` for our map, let's see all the CRSs we have
to choose from.

* Click the :guilabel:`Change` button. You will see a standard
  :guilabel:`Coordinate Reference System Selector` dialog.
* We want a *projected* CRS, so let's choose :guilabel:`WGS 84 / World
  Mercator`.
* Click :guilabel:`OK`.
* Click :guilabel:`Add` and the new layer will appear in your map as
  :guilabel:`osm`.
* In the :guilabel:`Layers list`, click and drag it to the bottom of the list.

You will notice that your layers aren't located correctly. (For example, the
:guilabel:`places` layer puts Bonnievale in the Gulf of Guinea.) This is
obviously because "on the fly" projection is disabled. Let's enable it again,
but using the same projection as the :guilabel:`osm` layer, which is
:guilabel:`WGS 84 / World Mercator`.

* Enable "on the fly" projection.
* In the :guilabel:`CRS` tab (:guilabel:`Project Properties` dialog), enter the
  value :kbd:`world` in the :guilabel:`Filter` field:

  .. image:: ../_static/online_resources/009.png
     :align: center

* Choose :guilabel:`WGS 84 / World Mercator` from the list.
* Click :guilabel:`OK`.
* Now right-click on one of your own layers in the :guilabel:`Layers list` and
  click :guilabel:`Zoom to layer extent`. You should see the Swellendam area:

  .. image:: ../_static/online_resources/010.png
     :align: center

Note how the WMS layer's streets and our own streets overlap. That's a good
sign!

The nature and limitations of WMS
...............................................................................

By now you may have noticed that this WMS layer actually has many layers in it.
It has streets, rivers, nature reserves, and so on. What's more, even though it
looks like it's made up of vectors, it seems to be a raster. But you can't even
change its symbology! Why is that?

This is how a WMS works: it's a map, similar to a normal map on paper, that you
receive as an image. What usually happens is that you have vector layers, which
QGIS renders as a map. But using a WMS, those vector layers are on the WMS
server, which renders it as a map and sends that map to you as an image.  QGIS
can display this image, but can't change its symbology, because all that is
handled on the server.

This has several advantages, because you don't need to worry about the
symbology. It's already worked out, and should be nice to look at on any
competently designed WMS.

On the other hand, you can't change the symbology if you don't like it, and if
things change on the WMS server, then they'll change on your map as well. This
is why you sometimes want to use a Web Feature Service (WFS) instead, which
gives you vector layers separately, and not as part of a WMS-style map.

This will be covered in the next lesson, however. First, let's add another WMS
layer from the :guilabel:`gis-lab` WMS server.

.. _backlink-wms-1:

|basic| |TY|
-------------------------------------------------------------------------------

* Hide the :guilabel:`osm` layer in the :guilabel:`Layers list`.
* Load the :guilabel:`landsat` layer into the map (use the :guilabel:`Add WMS
  Layer` button as before). Remember to check that it's in the same
  :guilabel:`WGS 84 / World Mercator` projection as the rest of your map!
* You might want to set its :guilabel:`Encoding` to :guilabel:`JPEG` and its
  :guilabel:`Tile size` option to :kbd:`200` by :kbd:`200`, so that it loads
  faster:

  .. image:: ../_static/online_resources/011.png
     :align: center

:ref:`Check your results <wms-1>`


.. _backlink-wms-2:

|moderate| |TY|
-------------------------------------------------------------------------------

* Hide all other WMS layers to prevent them rendering unnecessarily in the
  background.
* Add the "ICEDS" WMS server at this URL:
  :kbd:`http://iceds.ge.ucl.ac.uk/cgi-bin/icedswms`
* Add the :guilabel:`bluemarble` layer.

:ref:`Check your results <wms-2>`


.. _backlink-wms-3:

|hard| |TY|
-------------------------------------------------------------------------------

Part of the difficulty of using WMS is finding a good (free) server.

* Find a new WMS at `MapMatters.org <http://www.mapmatters.org/>`_ (or
  elsewhere online). It must not have associated fees or restrictions, and must
  have coverage over the Swellendam study area.

  Remember that what you need in order to use a WMS is only its URL (and
  preferably some sort of description).

:ref:`Check your results <wms-3>`


|IC|
-------------------------------------------------------------------------------

Using a WMS, you can add inactive maps as backdrops for your existing map data.

|FR|
-------------------------------------------------------------------------------

- `MapMatters.org <http://www.mapmatters.org/>`_
- `Geopole.org <http://geopole.org/>`_
- `OpenStreetMap.org list of WMS servers
  <http://wiki.openstreetmap.org/wiki/WMS>`_

|WN|
-------------------------------------------------------------------------------

Now that you've added an inactive map as a backdrop, you'll be glad to know
that it's also possible to add features (such as the other vector layers you
added before). Adding features from remote servers is possible by using a Web
Feature Service (WFS). That's the topic of the next lesson.
