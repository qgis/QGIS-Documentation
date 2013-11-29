|LS| Web Feature Services
===============================================================================

A Web Feature Service (WFS) provides its users with GIS data in formats that
can be loaded directly in QGIS. Unlike a WMS, which provides you only with a
map which you can't edit, a WFS gives you access to the features themselves.

**The goal for this lesson:** To use a WFS and understand how it differs from a
WMS.

|basic| |FA| Loading a WFS Layer
-------------------------------------------------------------------------------

* Start a new map. This is for demo purposes and won't be saved.
* Ensure that "on the fly" reprojection is switched off.
* Click the :guilabel:`Add WFS Layer` button:

  .. image:: ../_static/online_resources/017.png
     :align: center

* Click the :guilabel:`New` button.
* In the dialog that appears, enter the :guilabel:`Name` as :kbd:`nsidc.org`
  and the :guilabel:`URL` as
  :kbd:`http://nsidc.org/cgi-bin/atlas_south?version=1.1.0`.

  .. image:: ../_static/online_resources/019.png
     :align: center

* Click :guilabel:`OK`, and the new connection will appear in your
  :guilabel:`Server connections`.
* Click the :guilabel:`Connect`. A list of the available layers will appear:

  .. image:: ../_static/online_resources/020.png
     :align: center

* Find the layer :guilabel:`south_poles_wfs`.
* Click on the layer to select it:

  .. image:: ../_static/online_resources/021.png
     :align: center

* Click :guilabel:`Apply`.

It may take a while to load the layer. When it has loaded, it will appear in
the map. Here it is over the outlines of Antarctica (available on the same
server, and by the name of :guilabel:`antarctica_country_border`):

.. image:: ../_static/online_resources/022.png
   :align: center

How is this different from having a WMS layer? That will become obvious when
you see the layers' attributes.

* Open the :guilabel:`south_poles_wfs` layer's attribute table. You should see
  this:

.. image:: ../_static/online_resources/023.png
   :align: center

Since the points have attributes, doesn't that mean we can label them? Yes we
can, as well as changing their symbology. Here's an example:

.. image:: ../_static/online_resources/024.png
   :align: center

* Add labels to your layer to take advantage of the attribute data in this
  layer.

Differences from WMS layers
...............................................................................

A Web Feature Service returns the layer itself, not just a map rendered from
it. This gives you direct access to the data, meaning that you can change ts
symbology and run analysis functions on it. However, this is at the cost of
much more data being transmitted. This will be especially obvious if the layers
you're loading have complicated shapes, a lot of attributes, or many features;
or even if you're just loading a lot of layers. WFS layers typically take a
very long time to load because of this.

|moderate| |FA| Querying a WFS Layer
-------------------------------------------------------------------------------

Although it is, of course, possible to query a WFS layer after having loaded
it, it's often more efficient to query it before you load it. That way, you're
only requesting the features you want, meaning that you use far less bandwidth.

For example, on the WFS server we're currently using, there is a layer called
:guilabel:`countries (excluding Antarctica)`. Let's say that we want to know
where South Africa is relative to the :guilabel:`south_poles_wfs` layer (and
perhaps also the :guilabel:`antarctica_country_border` layer) that's already
been loaded.

There are two ways to do this. You can load the whole :guilabel:`countries ...`
layer, and then build a query as usual once it's loaded. However, transmitting
the data for all the countries in the world and then only using the data for
South Africa seems a bit wasteful of bandwidth. Depending on your connection,
this dataset can take several minutes to load.

The alternative is to build the query as a filter before even loading the layer
from the server.

* In the :guilabel:`Add WFS Layer ...` dialog, connect to the server we used
  before and you should see the list of available layers.
* Double-click next to the :guilabel:`countries ...` layer in the
  :guilabel:`Filter` field:

  .. image:: ../_static/online_resources/025.png
     :align: center

* In the dialog that appears, build the query :kbd:`"Countryeng" = 'South
  Africa'`:

  .. image:: ../_static/online_resources/026.png
     :align: center

* It will appear as the :guilabel:`Filter` value:

  .. image:: ../_static/online_resources/027.png
     :align: center

* Click :guilabel:`Apply` with the :guilabel:`countries` layer selected as
  above. Only the country with the :kbd:`Countryeng` value of :kbd:`South
  Africa` will load from that layer:

  .. image:: ../_static/online_resources/028.png
     :align: center

You don't have to, but if you tried both methods, you'll notice that this is a
lot faster than loading all the countries before filtering them!

Notes on WFS availability
...............................................................................

It is rare to find a WFS hosting features you need, if your needs are very
specific. The reason why Web Feature Services are relatively rare is because of
the large amounts of data that must be transmitted to describe a whole feature.
It is therefore not very cost-effective to host a WFS rather than a WMS, which
sends only images.

The most common type of WFS you'll encounter will therefore probably be on a
local network or even on your own computer, rather than on the Internet.

|IC|
-------------------------------------------------------------------------------

WFS layers are preferable over WMS layers if you need direct access to the
attributes and geometries of the layers. However, considering the amount of
data that needs to be downloaded (which leads to speed problems and also a lack
of easily available public WFS servers) it's not always possible to use a WFS
instead of a WMS.

|WN|
-------------------------------------------------------------------------------

Next, you'll see how to use QGIS as a frontend for the famous GRASS GIS.
