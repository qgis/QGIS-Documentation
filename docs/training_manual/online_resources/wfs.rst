Lesson: Web Feature Services
===============================================================================

A Web Feature Service (WFS) provides its users with GIS data in formats that
can be loaded directly in QGIS. Unlike a WMS, which provides you only with a
map which you can't edit, a WFS gives you access to the features themselves.

**The goal for this lesson:** To use a WFS and understand how it differs from a
WMS.

:abbr:`★☆☆ (Basic level)` Follow Along: Loading a WFS Layer
-------------------------------------------------------------------------------

#. Start a new map. This is for demo purposes and won't be saved.
#. Click the |dataSourceManager| :sup:`Open Data Source Manager` button.
#. Enable the |wfs| :guilabel:`WFS / OGC API - Features` tab.
#. Click the :guilabel:`New` button.
#. In the dialog that appears, enter the :guilabel:`Name` as ``nsidc.org``
   and the :guilabel:`URL` as
   ``https://nsidc.org/cgi-bin/atlas_south?version=1.1.0``.

   .. figure:: img/new_wfs_connection.png
      :align: center

#. Click :guilabel:`OK`, and the new connection will appear in your
   :guilabel:`Server connections`.
#. Click the :guilabel:`Connect`. A list of the available layers will appear:

   .. figure:: img/wfs_connection_layers.png
      :align: center

#. Uncheck the :guilabel:`Only request features overlapping the view extent` option
   below the layers list, since your current map canvas may not cover our area of
   interest: Antarctica.
#. Find the layer :guilabel:`antarctica_country_border`.
   You can use the :guilabel:`Filter` box at the top.
#. Click on the layer to select it:
#. Find and select also the layer :guilabel:`south_poles_wfs`.
   You might need to hold :kbd:`Ctrl`.

   .. figure:: img/south_poles_wfs.png
      :align: center

#. Click :guilabel:`Add`.

   It may take a while to load the layers. When they are loaded, they will appear in
   the map, showing the outlines of Antarctica and a few points over.

   .. figure:: img/antarctica_border.png
      :align: center

   How is this different from having a WMS layer?

#. Select any of the layers and you'll notice that feature selection and
   attribute table tools are enabled. These are vector layers.
#. Select the :guilabel:`south_poles_wfs` layer and open its attribute table.
   You should see this:

   .. figure:: img/poles_attribute_table.png
      :align: center

   Since the points have attributes, we are able to label them,
   as well as change their symbology. Here's an example:

   .. figure:: img/labelling_example.png
      :align: center


Differences from WMS layers
...............................................................................

A Web Feature Service returns the layer itself, not just a map rendered from
it. This gives you direct access to the data, meaning that you can change its
symbology and run analysis functions on it. However, this is at the cost of
much more data being transmitted. This will be especially obvious if the layers
you're loading have complicated shapes, a lot of attributes, or many features;
or even if you're just loading a lot of layers. WFS layers typically take a
very long time to load because of this.

:abbr:`★★☆ (Moderate level)` Follow Along: Querying a WFS Layer
-------------------------------------------------------------------------------

Although it is of possible to query a WFS layer after having loaded
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

#. Enable the :guilabel:`WFS / OGC API Features` tab in the
   :guilabel:`Data Source Manager` dialog
#. Connect to the server we used before and you should see the list of available layers.
#. Find and double-click the :guilabel:`countries (excluding Antarctica)` layer.
   The layer name is ``country_borders_excluding_antarctica``.
   You can also select the layer and press :guilabel:`Build query` button at
   the bottom of the dialog:

   .. figure:: img/select_country_filter.png
      :align: center

#. In the dialog that appears, type the following
   ``SELECT * FROM country_borders_excluding_antarctica WHERE "Countryeng" = 'South Africa'``
   query in the :guilabel:`SQL Statement` box.

   .. figure:: img/country_sa_builder.png
      :align: center

#. Press :guilabel:`OK`.
#. The expression used will appear as the :guilabel:`Sql` value of the target layer:

   .. figure:: img/country_filter_enabled.png
      :align: center

#. Click :guilabel:`Add` with the layer selected as above.
   Only the country with the ``Countryeng`` value of ``South Africa`` will load from
   that layer:

   .. figure:: img/antarctica_sa.png
      :align: center

   Did you notice the |indicatorFilter| icon next to the
   ``country_borders_excluding_antarctica`` layer? It indicates that the loaded
   layer is filtered and does not display in the project all of its features.
#. You don't have to, but if you tried both methods, you'll notice that this is a
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

In Conclusion
-------------------------------------------------------------------------------

WFS layers are preferable over WMS layers if you need direct access to the
attributes and geometries of the layers. However, considering the amount of
data that needs to be downloaded (which leads to speed problems and also a lack
of easily available public WFS servers) it's not always possible to use a WFS
instead of a WMS.

What's Next?
-------------------------------------------------------------------------------

Next, you'll see how to use QGIS Server to provide OGC services.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |dataSourceManager| image:: /static/common/mActionDataSourceManager.png
   :width: 1.5em
.. |indicatorFilter| image:: /static/common/mIndicatorFilter.png
   :width: 1.5em
.. |wfs| image:: /static/common/mIconWfs.png
   :width: 1.5em
