.. index:: Map view
.. _`label_mapview`:

************
2D Map View
************

.. only:: html

   .. contents::
      :local:


The 2D map view (also called **Map canvas**) is the central place where maps are displayed.
QGIS opens by default with a single map view (called ``main map``),
showing layers in 2D, and tightly bound to the :guilabel:`Layers` panel.
That window reflects the rendering (symbology, labeling, visibilities...)
you applied to the loaded layers.


.. _figure_startup_bis:

.. figure:: ../introduction/img/startup.png
   :align: center

   QGIS GUI


.. index:: Zoom, Pan, Map navigation
.. _zoom_pan:

Exploring the map view
======================

When you add a layer (see e.g. :ref:`opening_data`), QGIS automatically
looks for its CRS. If a different CRS is set by default for the project
(see :ref:`project_crs`) then the layer extent is "on-the-fly"
translated to that CRS, and the map view is zoomed to that extent if
you start with a blank QGIS project.
If there are already layers in the project, no map canvas resize is
performed, so only features falling within the current map canvas extent
will be visible.

Click on the map view and you should be able to interact with it,
panning or zooming to different areas of the map.
Dedicated tools are provided in the :guilabel:`Navigation Toolbar` and
in the :menuselection:`View` menu, with handful shortcuts from the keyboard
or the mouse buttons.


.. list-table:: Map canvas navigation tools
   :header-rows: 1
   :widths: 20 75
   :class: longtable

   * - Tool
     - Usage
   * - |pan| :sup:`Pan Map`
     - * Single left click: the map is centered on the clicked point, at the same scale
       * Hold down the left mouse button and drag the map canvas.

   * - |zoomIn| :sup:`Zoom In`
     - * Single left click: the map is centered on the clicked point,
         while the scale gets doubled
       * Drag a rectangle on the map canvas with the left mouse button
         to zoom in to an area.
       * Hold the :kbd:`Alt` key to switch to the |zoomOut| :sup:`Zoom Out` tool.

   * - |zoomOut| :sup:`Zoom Out`
     - * Single left click: the map is centered on the clicked point,
         while the scale gets halved
       * Drag a rectangle on the map canvas with the left mouse button
         to zoom out from an area.
       * Hold the :kbd:`Alt` key to switch to the |zoomIn| :sup:`Zoom In` tool.

   * - |panToSelected| :sup:`Pan Map to Selection`
     - Pan the map to the selected features of all the selected layers in the
       :guilabel:`Layers` panel.
   * - |zoomToSelected| :sup:`Zoom To Selection`
     - Zoom to the selected features of all the selected layers in the
       :guilabel:`Layers` panel.

       *Also available in the layer contextual menu*
   * - |zoomToLayer| :sup:`Zoom To Layer(s)`
     - Zoom to the extent of all the selected layers in the
       :guilabel:`Layers` panel.

       *Also available in the layer contextual menu*
   * - |zoomFullExtent| :sup:`Zoom Full`
     - Zoom to the extent of all the layers in the project
       or to the :ref:`project full extent <project_full_extent>`.
   * - |zoomLast| :sup:`Zoom Last`
     - Zoom the map to the previous extent in history.
   * - |zoomNext| :sup:`Zoom Next`
     - Zoom the map to the next extent in history.
   * - |zoomActual| :sup:`Zoom to Native Resolution`
     - Zoom the map to a level where one pixel of the active raster layer covers
       one screen pixel.

       *Also available in the layer contextual menu*
   * - Mouse wheel
     - * Pan map: Hold and drag the mouse wheel.
       * Zoom: Roll the mouse wheel to zoom in or zoom out.
         With :kbd:`Ctrl` key pressed while rolling the mouse wheel
         results in a finer zoom.
       * Press the back or forward button to browse the map canvas zoom history.
   * - Keyboard
     - * Pan map: Hold down the :kbd:`Space` key and move the mouse.
         Press the arrow keys to pan up, down, left and right.
       * Zoom in: Press :kbd:`PgUp` or :kbd:`Ctrl++`
       * Zoom out: Press :kbd:`PgDown` or :kbd:`Ctrl+-`
       * Zoom to area: When certain map tools are active (Identify, Measure...),
         hold down :kbd:`Shift` and drag a rectangle on the map to zoom to that
         area. Not compatible with active selection or edit tools.

Right-click over the map and you should be able to |editCopy|
:guilabel:`Copy coordinates` of the clicked point in the map CRS, in WGS84
or in a custom CRS. The copied information can then be pasted in an expression,
a script, text editor or spreadsheet...


.. index:: Rendering
   single: Rendering; Suspending
.. _`redraw_events`:

Controlling map rendering
=========================

By default, QGIS renders all visible layers whenever the map canvas is
refreshed. The events that trigger a refresh of the map canvas include:

* changing the visibility of a layer
* modifying symbology of a visible layer
* adding a layer
* panning or zooming
* resizing the QGIS window

QGIS allows you to control the rendering process in a number of ways.

* at the :ref:`global level <rendering_options>`
* per layer, using e.g. the :ref:`scale dependent rendering <label_scaledepend>`
* or with dedicated tools in the GUI.

To stop the map drawing, press the :kbd:`Esc` key. This will halt the refresh of
the map canvas and leave the map partially drawn. It may however take a bit of time
after pressing :kbd:`Esc` for the map drawing to halt.

To suspend rendering, click the |checkbox| :guilabel:`Render` checkbox in the
bottom-right corner of the status bar. When |checkbox| :guilabel:`Render`
is unchecked, QGIS does not redraw the canvas in response to any of
the usual triggers mentioned earlier. Examples of when you
might want to suspend rendering include:

* adding many layers and symbolizing them prior to drawing
* adding one or more large layers and setting scale dependency before drawing
* adding one or more large layers and zooming to a specific view before drawing
* any combination of the above

Checking the |checkbox| :guilabel:`Render` checkbox enables rendering and
causes an immediate refresh of the map canvas.


.. _additional_map_views:

Setting additional map views
============================

It is also possible to open additional map views whose content could diverge
from the :guilabel:`Layers` panel current state.
To add a new map view, go to :menuselection:`View -->` |newMap|
:menuselection:`New Map View`. A new floating widget, mimicking the main map
view's rendering, is added to QGIS. You can add as many map views as you need.
They can be kept floating, placed side by side or stacked on top of each
other.

.. _figure_mapviews:

.. figure:: img/map_views.png
   :align: center
   :width: 100%

   Multiple map views with different settings

At the top of an additional map canvas, there's a toolbar with the following
capabilities:

* |zoomFullExtent| :sup:`Zoom Full`, |zoomToSelected| :sup:`Zoom to Selection`
  and |zoomToLayer| :sup:`Zoom to Layer(s)` to navigate within the view
* |showPresets| :sup:`Set View Theme` to select the :ref:`map theme <map_themes>`
  to display in the map view. If set to ``(none)``, the view will follow
  the :guilabel:`Layers` panel changes.
* |options| :sup:`View settings` to configure the map view:

  * |radioButtonOn| :guilabel:`Synchronize view center with main map`:
    syncs the center of the map views without changing the scale.
    This allows you to have an overview style or magnified map which follows
    the main canvas center.
  * |radioButtonOff| :guilabel:`Synchronize view to selection`: same as
    zoom to selection
  * :guilabel:`Scale`
  * :guilabel:`Rotation`
  * :guilabel:`Magnification`
  * |unchecked| :guilabel:`Synchronize scale` with the main map scale.
    A :guilabel:`Scale factor` can then be applied, allowing you to have
    a view which is e.g. always 2x the scale of the main canvas.
  * |checkbox| :guilabel:`Show annotations`
  * |checkbox| :guilabel:`Show cursor position`
  * |unchecked| :guilabel:`Show main canvas extent`
  * |checkbox| :guilabel:`Show labels`: allows to hide labels regardless
    they are set in the displayed layers' properties
  * :guilabel:`Change map CRS...`
  * :guilabel:`Rename view...`


.. _maptimecontrol:

Time-based control on the map canvas
====================================

QGIS can handle temporal control on loaded layers, i.e. modify the map canvas
rendering based on a time variation. To achieve this, you need:

#. Layers that have dynamic temporal properties set.
   QGIS supports temporal control for different data providers, with custom
   settings.
   It's mainly about setting the time range in which the layer would display:

   * :ref:`raster layers <raster_temporal>`: controls whether to display or
     not the layer.

   .. Todo: This option might need some tweak: I think WMS-T and Postgis raster layers
    enable more options and behaviour so, if someone can provide a better summary
    of the temporal setting on rasters and as well describe those in raster properties,
    it'd be very welcome!

   * :ref:`vector layers <vectortemporalmenu>`: features are filtered based
     on time values associated to their attributes
   * :ref:`mesh layers <meshtemporal>`: displays dynamically the active dataset
     groups values

   When dynamic temporal options are enabled for a layer, an |indicatorTemporal|
   icon is displayed next to the layer in the :guilabel:`Layers` panel to remind
   you that the layer is temporally controlled.
   Click the icon to update the temporal settings.

#. Enable the temporal navigation of the map canvas using the :ref:`Temporal
   controller panel <temporal_controller>`. The panel is activated:

   * using the |temporal| :sup:`Temporal controller panel` icon located in the
     :guilabel:`Map Navigation` toolbar
   * or from the :menuselection:`View --> Panels --> Temporal controller panel`
     menu

.. _temporal_controller:

The temporal controller panel
-----------------------------

The :guilabel:`Temporal controller` panel has the following modes:

.. figure:: img/temporal_controller_panel.png
   :align: center

   Temporal Controller Panel in navigation mode

* |temporalNavigationOff| :sup:`Turn off temporal navigation`: all the
  temporal settings are disabled and visible layers are rendered as usual
* |temporalNavigationFixedRange| :sup:`Fixed range temporal navigation`:
  a time range is set and only layers (or features) whose temporal range
  overlaps with this range are displayed on the map.
* |temporalNavigationAnimated| :sup:`Animated temporal navigation`:
  a time range is set, split into steps, and only layers (or features)
  whose temporal range overlaps with each frame are displayed on the map
* |settings| :sup:`Settings` for general control of the animation

  * :guilabel:`Frames rate`: number of steps that are shown per second

  * |unchecked| :guilabel:`Cumulative range`: all animation frames will
    have the same start date-time but different end dates and times.
    This is useful if you wish to accumulate data in your temporal
    visualization instead of showing a ‘moving time window’ across your data.

.. _`create_temporal_animation`:

Animating a temporal navigation
-------------------------------

An animation is based on a varying set of visible layers at particular times
within a time range.
To create a temporal animation:

#. Toggle on the |temporalNavigationAnimated| :sup:`Animated temporal
   navigation`, displaying the animation player widget
#. Enter the :guilabel:`Time range` to consider. Using the |refresh|
   button, this can be defined as:

   * :guilabel:`Set to full range` of all the time enabled layers
   * :guilabel:`Set to preset project range` as defined in the :ref:`project
     properties <project_temporal>`
   * :guilabel:`Set to single layer's range` taken from a time-enabled layer
#. Fill in the time :guilabel:`Step` to split the time range.
   Different units are supported, from ``seconds`` to ``centuries``.
   A ``source timestamps`` option is also available as step: when selected,
   this causes the temporal navigation to step between all available time ranges
   from layers in the project. It’s useful when a project contains layers with
   non-contiguous available times, such as a WMS-T service which provides images
   that are available at irregular dates. This option will allow you to only step
   between time ranges where the next available image is shown.

#. Click the |play| button to preview the animation.
   QGIS will generate scenes using the layers rendering at the set times.
   Layers display depends on whether they overlap any individual time frame.

   .. only:: html

      .. figure:: img/map_navigation.gif
         :align: center

         Temporal navigation through a layer

   The animation can also be previewed by moving the time slider.
   Keeping the |refresh| :sup:`Loop` button pressed will repeatedly run the
   animation while clicking |play| stops a running animation.
   A full set of video player buttons is available.

   Horizontal scrolling using the mouse wheel (where supported) with the
   cursor on the map canvas will also allow you to navigate, or “scrub”,
   the temporal navigation slider backwards and forwards.

#. Click the |fileSave| :sup:`Export animation` button if you want to generate
   a series of images representing the scene. They can be later combined in a
   video editor software:

   .. figure:: img/saveTimeAnimation.png
      :align: center

      Exporting map canvas animation scenes to images

   * The filename :guilabel:`Template`: the ``####`` are replaced with frame
     sequence number
   * The :guilabel:`Output directory`
   * Under :guilabel:`Map settings`, you can:

     * redefine the :ref:`spatial extent <extent_selector>` to use
     * control the :guilabel:`Resolution` of the image
       (:guilabel:`Output width` and :guilabel:`Output height`)
     * :guilabel:`Draw active decorations`: whether active :ref:`decorations
       <decorations>` should be kept in the output
   * Under :guilabel:`Temporal settings`, you can redefine:

     * the time :guilabel:`Range` for the animation
     * the :guilabel:`Step (frame length)` in the unit of your choice


.. _`exportingmapcanvas`:

Exporting the map view
======================

Maps you make can be layout and exported to various formats using the
advanced capabilities of the
:ref:`print layout or report <label_printlayout>`.
It's also possible to directly export the current rendering, without
a layout.
This quick "screenshot" of the map view has some convenient features.

To export the map canvas with the current rendering:

#. Go to :menuselection:`Project --> Import/Export`
#. Depending on your output format, select either

   * |saveMapAsImage| :guilabel:`Export Map to Image...`
   * or |saveAsPDF| :guilabel:`Export Map to PDF...`

The two tools provide you with a common set of options.
In the dialog that opens:

.. _figure_savemapimage:

.. figure:: img/saveMapAsImage.png
   :align: center

   The Save Map as Image dialog

#. Choose the :guilabel:`Extent` to export: it can be the current
   view extent (the default), the extent of a layer or a custom extent
   drawn over the map canvas.
   Coordinates of the selected area are displayed and manually editable.
#. Enter the :guilabel:`Scale` of the map or select it from the
   :ref:`predefined scales <predefinedscales>`: changing the scale will
   resize the extent to export (from the center).
#. Set the :guilabel:`Resolution` of the output
#. Control the :guilabel:`Output width` and :guilabel:`Output height`
   in pixels of the image: based by default on the current resolution
   and extent, they can be customized and will resize the map extent
   (from the center).
   The size ratio can be locked, which may be particularly convenient
   when drawing the extent on the canvas.
#. |checkbox| :guilabel:`Draw active decorations`: in use
   :ref:`decorations <decorations>` (scale bar, title, grid, north
   arrow...) are exported with the map
#. |checkbox| :guilabel:`Draw annotations` to export any :ref:`annotation
   <sec_annotations>`
#. |checkbox| :guilabel:`Append georeference information (embedded or
   via world file)`: depending on the output format, a world file of
   the same name (with extension ``PNGW`` for ``PNG`` images, ``JPGW``
   for ``JPG``, ...) is saved in the same folder as your image.
   The ``PDF`` format embeds the information in the PDF file.
#. When exporting to PDF, more options are available in the
   :guilabel:`Save map as PDF...` dialog:

   .. _figure_savemappdf:

   .. figure:: img/saveMapAsPDF.png
      :align: center

      The Save Map as PDF dialog

   * |checkbox| :guilabel:`Export RDF metadata` of the document such
     as the title, author, date, description...
   * |unchecked| :guilabel:`Create Geospatial PDF (GeoPDF)`: Generate a
     `georeferenced PDF file <https://gdal.org/drivers/raster/pdf.html>`_.
     You can:

     * Choose the GeoPDF :guilabel:`Format`
     * |checkbox| :guilabel:`Include vector feature information` in the
       GeoPDF file: will include all the geometry and attribute
       information from features visible within the map in the output
       GeoPDF file.

     .. note::

       A GeoPDF file can also be used as a data source.
       For more on GeoPDF support in QGIS, see
       https://north-road.com/2019/09/03/qgis-3-10-loves-geopdf/.

   * :guilabel:`Rasterize map`
   * |checkbox| :guilabel:`Simplify geometries to reduce output file
     size`:
     Geometries will be simplified while exporting the map by removing
     vertices that are not discernibly different at the export
     resolution (e.g. if the export resolution is ``300 dpi``, vertices
     that are less than ``1/600 inch`` apart will be removed).
     This can reduce the size and complexity of the export file (very
     large files can fail to load in other applications).
   * Set the :guilabel:`Text export`: controls whether text labels are
     exported as proper text objects (:guilabel:`Always export texts
     as text objects`) or as paths only (:guilabel:`Always export texts
     as paths`).
     If they are exported as text objects then they can be edited in
     external applications (e.g. Inkscape) as normal text.
     BUT the side effect is that the rendering quality is decreased,
     AND there are issues with rendering when certain text settings
     like buffers are in place.
     That’s why exporting as paths is recommended.

#. Click :guilabel:`Save` to select file location, name and format.

   When exporting to image, it's also possible to
   :guilabel:`Copy to clipboard` the expected result of the above
   settings and paste the map in another application such as
   LibreOffice, GIMP...


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |checkbox| image:: /static/common/checkbox.png
   :width: 1.3em
.. |editCopy| image:: /static/common/mActionEditCopy.png
   :width: 1.5em
.. |fileSave| image:: /static/common/mActionFileSave.png
   :width: 1.5em
.. |indicatorTemporal| image:: /static/common/mIndicatorTemporal.png
   :width: 1.5em
.. |newMap| image:: /static/common/mActionNewMap.png
   :width: 1.5em
.. |options| image:: /static/common/mActionOptions.png
   :width: 1em
.. |pan| image:: /static/common/mActionPan.png
   :width: 1.5em
.. |panToSelected| image:: /static/common/mActionPanToSelected.png
   :width: 1.5em
.. |play| image:: /static/common/mActionPlay.png
   :width: 1.5em
.. |radioButtonOff| image:: /static/common/radiobuttonoff.png
   :width: 1.5em
.. |radioButtonOn| image:: /static/common/radiobuttonon.png
   :width: 1.5em
.. |refresh| image:: /static/common/mActionRefresh.png
   :width: 1.5em
.. |saveAsPDF| image:: /static/common/mActionSaveAsPDF.png
   :width: 1.5em
.. |saveMapAsImage| image:: /static/common/mActionSaveMapAsImage.png
   :width: 1.5em
.. |settings| image:: /static/common/settings.png
   :width: 1.5em
.. |showPresets| image:: /static/common/mActionShowPresets.png
   :width: 1.5em
.. |temporal| image:: /static/common/temporal.png
   :width: 1.5em
.. |temporalNavigationAnimated| image:: /static/common/mTemporalNavigationAnimated.png
   :width: 1.5em
.. |temporalNavigationFixedRange| image:: /static/common/mTemporalNavigationFixedRange.png
   :width: 1.5em
.. |temporalNavigationOff| image:: /static/common/mTemporalNavigationOff.png
   :width: 1.5em
.. |unchecked| image:: /static/common/unchecked.png
   :width: 1.3em
.. |zoomActual| image:: /static/common/mActionZoomActual.png
   :width: 1.5em
.. |zoomFullExtent| image:: /static/common/mActionZoomFullExtent.png
   :width: 1.5em
.. |zoomIn| image:: /static/common/mActionZoomIn.png
   :width: 1.5em
.. |zoomLast| image:: /static/common/mActionZoomLast.png
   :width: 1.5em
.. |zoomNext| image:: /static/common/mActionZoomNext.png
   :width: 1.5em
.. |zoomOut| image:: /static/common/mActionZoomOut.png
   :width: 1.5em
.. |zoomToLayer| image:: /static/common/mActionZoomToLayer.png
   :width: 1.5em
.. |zoomToSelected| image:: /static/common/mActionZoomToSelected.png
   :width: 1.5em
