.. only:: html

   |updatedisclaimer|

|LS| Useful QGIS Plugins
===============================================================================

Now that you can install, enable and disable plugins, let's see how this can
help you in practice by looking at some examples of useful plugins.

**The goal for this lesson:** To familiarize yourself with the plugin interface
and get acquainted with some useful plugins.

|basic| |FA| The QuickMapServices Plugin
-------------------------------------------------------------------------------

The QuickMapServices plugin is a simple and easy to use plugin that adds base maps
to your QGIS project. It has many different options and settings, let's start to
explore some of its features.

* Start a new map and add the :guilabel:`roads` layer from the :kbd:`training_data`
  Geopackage.
* Using the :guilabel:`Plugin Manager`, find a new plugin by entering the word
  :kbd:`QuickMapServices` in the :guilabel:`Filter` field.
* Select the QuickMapServices plugin from the filtered list:

  .. image:: img/qms_install.png
     :align: center

* Click the :guilabel:`Install plugin` button to install.
* When it's done, close the :guilabel:`Plugin Manager`.
* Open the plugin's search tab by clicking on :menuselection:`Web -->
  QuickMapServices --> Search QMS`.
* This option of the plugin allows you to filter the available base maps by the
  current extent of the map canvas. Click on the :guilabel:`Filter by extent`
  and you should see one service available. Click on the :guilabel:`Add` button
  next to the map to load it.
* The base map will be loaded and you will have a satellite background for the
  map

.. image:: img/qms_result.png
   :align: center

QuickMapServices plugin has a lot of available base maps available.

Close the :guilabel:`Search QMS` panel we open before and click again on
:menuselection:`Web --> QuickMapServices`. The first menu lists different map
providers with all the available maps:

.. image:: img/qms_menu.png
   :align: center

But there is more.

If the default maps are not enough for you, you can add other map providers.
Click on :menuselection:`Web --> QuickMapServices --> Settings` and go in the
:guilabel:`More services` tab. Read carefully the message of this tab and then click
on the :kbd:`Get Contributed pack` button.

If you open now the :menuselection:`Web --> QuickMapServices` menu you will see
a lot more providers available. Choose the one that best fit your needs!


|basic| |FA| The QuickOSM Plugin
-------------------------------------------------------------------------------

With an incredible simple interface, the QuickOSM plugin allows you to download
`OpenStreetMap <https://www.openstreetmap.org/>`_ data.

* Start a new empty project and add the :kbd:`roads` layer from the :kbd:`training_data`
  Geopackage.
* Using the :guilabel:`Plugin Manager`, find a new plugin by entering the word
  :kbd:`QuickOSM` in the :guilabel:`Filter` field.
* Select the plugin and click on :guilabel:`Install`.
* Once the process is finished, close the Plugin dialog.

QuickOSM plugin is available with two new buttons in the QGIS Toolbar or in the
:guilabel:`Vector --> Quick OSM` menu.

* Open the Quick OSM dialog. The plugin has many different tabs: we will use the
  :guilabel:`Quick Query` one.
* You can download specific features by selecting a generic ``Key`` or be more
  specific and choose a specific ``Key`` and ``Value`` pair.

  .. tip:: if you are not familiar with the ``Key`` and ``Values`` system, click
    on the :guilabel:`Help with key/value` button. It will open a web page with
    a complete description of this concept of OpenStreetMap

* Look for ``railway`` in the ``Key`` menu and let the ``Value`` empty: so we
  are downloading all the railway features without specifying specific values.
* Select :guilabel:`Extent of a layer` and choose :kbd:`roads`.
* Click on the :guilabel:`Run query` button.

.. image:: img/quickosm_setup.png
   :align: center

After some seconds the plugin will download all the features tagged in OpenStreetMap
as ``railway`` and load them directly into the map.

Nothing more! All the layers are loaded in the legend and are shown in the map
canvas.

.. image:: img/quickosm_result.png
   :align: center

.. warning:: QuickOSM creates temporary layer when downloading the data. If you
  want to save them permanently, right click on the layer in the legend and
  :guilabel:`Export --> Save Features As...` or open the :kbd:`Advanced` menu
  in QuickOSM and choose where to save the data in the :guilabel:`Directory`
  menu.

|hard| |FA| The QuickOSM Query engine
-------------------------------------------------------------------------------

The quickest way to download data from QuickOSM plugin is using the :guilabel:`Quick query`
tab and set some small parameters. But if you need some more specific data?

If you are an OpenStreetMap query master you can use QuickOSM plugin also with
your personal queries.

QuickOSM has an incredible data parser that, together with the amazing query engine
of Overpass, lets you download data with your specific needs.

For example: we want to download the mountain peaks that belongs into a specific
mountain area known as `Dolomites <https://en.wikipedia.org/wiki/Dolomites>`_.

You cannot achieve this task with the :guilabel:`Quick query` tab, you have to
be more specific and write your own query. Let's try to do this.

* Start a new project.
* Open the QuickOSM plugin and click on the :guilabel:`Query` tab.
* Copy and paste the following code into the query canvas::

      <!--
    This shows all mountains (peaks) in the Dolomites.
    You may want to use the "zoom onto data" button. =>
    -->
    <osm-script output="json">
    <!-- search the area of the Dolomites -->
    <query type="area">
      <has-kv k="place" v="region"/>
      <has-kv k="region:type" v="mountain_area"/>
      <has-kv k="name:en" v="Dolomites"/>
    </query>
    <print mode="body" order="quadtile"/>
    <!-- get all peaks in the area -->
    <query type="node">
      <area-query/>
      <has-kv k="natural" v="peak"/>
    </query>
    <print mode="body" order="quadtile"/>
    <!-- additionally, show the outline of the area -->
    <query type="relation">
      <has-kv k="place" v="region"/>
      <has-kv k="region:type" v="mountain_area"/>
      <has-kv k="name:en" v="Dolomites"/>
    </query>
    <print mode="body" order="quadtile"/>
    <recurse type="down"/>
    <print mode="skeleton" order="quadtile"/>
    </osm-script>

  .. note:: this query is written in a ``xml`` like language. If you are more
    used to the ``Overpass QL`` you can write the query in this language.

and click on :guilabel:`Run Query`:

.. image:: img/quickosm_advanced_query.png
   :align: center

The mountain peaks layer will be downloaded and shown in QGIS:

.. image:: img/quickosm_advanced_result.png
   :align: center

You can write complex queries using the `Overpass Query language <https://wiki.openstreetmap.org/wiki/Overpass_API/Overpass_QL>`_.
Take a look at some example and try to explore the query language.

|basic| |FA| The DataPlotly Plugin
-------------------------------------------------------------------------------

DataPlotly plugin allows you to create `D3 <https://d3js.org/>`_ plots of vector
attributes data thanks to the `plotly <https://plot.ly/>`_ library.

* Start a new project and load the :kbd:`sample_point` layer from the :kbd:`training_data`
  Geopackage.
* Open the the :guilabel:`Plugins --> Manage and Install Plugins...` menu.
* Type :kbd:`Data Plotly` in the :guilabel:`Filter` field.
* Select the Data Plotly plugin and click on :guilabel:`Install` button.
* When it's done, close the :guilabel:`Plugin Manager`.

Open the plugin by clicking on the new icon in the toolbar or in the
:guilabel:`Plugins --> Data Plotly` menu.

In the following example we are creating a simple ``Scatter Plot`` of two fields
of :kbd:`sample_point` layer.

In the DataPlotly Panel choose :kbd:`sample_point` in the Layer filter, :kbd:`cl`
for the ``X Field`` and :kbd:`mg` for the ``Y Field``:

.. image:: img/dataplotly_setup.png
   :align: center

If you want you can change the colors, the marker type, the transparency and
many other settings: just try to change some parameters to create the plot as the
following picture. Once you set up all the parameters click on the
:guilabel:`Create Plot` button to create the plot:

.. image:: img/dataplotly_scatterplot.png
   :align: center

The plot is interactive: this means you can use all the upper buttons to resize,
move, or zoom in/out the plot canvas. Moreover, each element of the plot is interactive:
by clicking or selecting one or more point on the plot, the corresponding point(s)
will be selected in the plot canvas.

You can save the plot as a ``png`` static image or as an ``html`` file by clicking
on the |saveMapAsImage| or on the |addHtml| button in the lower right corner
of the plot.

There is more. Sometimes it can be useful to have two (or more) plots showing
different plot types with different variables on the same page. Let's do this!

* Go back to the main plot settings tab by clicking on the |symbology| button
  in the upper left corner of the plugin panel.
* Change the ``Plot Type`` to ``Box Plot``.
* Choose :kbd:`group` as ``Grouping Field`` and :kbd:`ph` as ``Y Field``.
* In the lower part of the Panel change the ``Type of Plot`` from ``SinglePlot``.
  to ``SubPlots`` and let the default option ``Plot in Rows`` selected:

.. image:: img/dataplotly_boxplot.png
   :align: center

* Once done click on the :guilabel:`Create Plot` button to draw the plot:

.. image:: img/dataplotly_subplots.png
   :align: center

Now both scatter plot and box plot are shown in the same plot page. You still
have the chance to click on each plot item and select the corresponding features
in the map canvas.

.. tip:: Each plot has its own manual page available in the |helpContents| tab.
  Try to explore all the plot types and see all the other settings available.

|IC|
-------------------------------------------------------------------------------

There are many useful plugins available for QGIS. Using the built-in tools for
installing and managing these plugins, you can find new plugins and make
optimum use of them.

|WN|
-------------------------------------------------------------------------------

Next we'll look at how to use layers that are hosted on remote servers in real
time.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |FA| replace:: Follow Along:
.. |IC| replace:: In Conclusion
.. |LS| replace:: Lesson:
.. |WN| replace:: What's Next?
.. |addHtml| image:: /static/common/mActionAddHtml.png
   :width: 1.5em
.. |basic| image:: /static/global/basic.png
.. |hard| image:: /static/global/hard.png
.. |helpContents| image:: /static/common/mActionHelpContents.png
   :width: 1.5em
.. |saveMapAsImage| image:: /static/common/mActionSaveMapAsImage.png
   :width: 1.5em
.. |symbology| image:: /static/common/symbology.png
   :width: 2em
.. |updatedisclaimer| replace:: :disclaimer:`Docs in progress for 'QGIS testing'. Visit http://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`
