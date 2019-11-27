.. _symbol-selector:

********************
The Symbol Selector
********************

.. only:: html

   .. contents::
      :local:


The Symbol selector is the main dialog to design a symbol.
You can create or edit Marker, Line or Fill Symbols.

.. _figure_symbol_selector:

.. figure:: img/symbolselector.png
   :align: center

   Designing a Line symbol


Two main components structure the symbol selector dialog:

* the symbol tree, showing symbol layers that are combined afterwards to shape a
  new global symbol
* and settings to configure the selected symbol layer in the tree.

.. _symbol_tree:

The symbol layer tree
=====================

A symbol can consist of several :guilabel:`Symbol layers`. The symbol tree shows
the overlay of these symbol layers that are combined afterwards to shape a
new global symbol. Besides, a dynamic symbol representation is updated as soon as
symbol properties change.

Depending on the level selected in the symbol tree items, various tools are
made available to help you manage the tree:

* |signPlus| add new symbol layer: you can stack as many symbols as you want
* |signMinus| remove the selected symbol layer
* lock colors of symbol layer: a |locked| locked color stays unchanged when
  user changes the color at the global (or upper) symbol level
* |duplicateLayer| duplicate a (group of) symbol layer(s)
* move up or down the symbol layer

When a symbol layer is selected in the tree, you can also:

* control its visibility with the |checkbox| :guilabel:`Enable layer` option.
  Disabled symbol layers are not drawn, but are saved and can be enabled at a
  later stage. This makes it easier to customize parts of the symbol based on
  the feature attributes or to tweak symbol appearance without having to
  totally delete a symbol layer;
* apply :ref:`rendering effects <draw_effects>` using the |checkbox|
  :guilabel:`Draw effects` button.

.. _edit_symbol:

Configuring a symbol
====================

In QGIS, configuring a symbol is done in two steps: the symbol and then the
symbol layer.

The symbol
----------

At the top level of the tree, it depends on the layer geometry and can be of
**Marker**, **Line** or **Fill** type. Each symbol can embed one or
more symbols (including, of any other type) or symbol layers.

You can setup some parameters that apply to the global symbol:

* :guilabel:`Unit`: it can be **Millimeters**, **Points**, **Pixels**,
  **Meters at Scale**, **Map units** or **Inches** (see :ref:`unit_selector`
  for more details)
* :guilabel:`Opacity`
* :guilabel:`Color`: when this parameter is changed by the user, its value is
  echoed to all unlocked sub-symbols color
* :guilabel:`Size` and :guilabel:`Rotation` for marker symbols
* :guilabel:`Width` for line symbols

  .. tip::

    Use the :guilabel:`Size` (for marker symbols) or the :guilabel:`Width` (for
    line symbols) properties at the symbol level to proportionally resize all
    of its embedded :ref:`symbol layers <symbol_layer>` dimensions.

  .. note::

    The :ref:`Data-defined override <data_defined>` button next to the width, size
    or rotation parameters is inactive when setting the symbol from the Style manager
    dialog. When the symbol is connected to a map layer, this button helps you create
    :ref:`proportional or multivariate analysis <proportional_symbols>` rendering.

* A preview of the :ref:`symbols library <vector_style_manager>`: Symbols of the
  same type are shown and, through the editable drop-down list just above, can be
  filtered by free-form text or by :ref:`categories <group_symbols>`.
  You can also update the list of symbols using the
  |styleManager| :sup:`Style Manager` button and open the eponym dialog. There,
  you can use any capabilities as exposed in :ref:`vector_style_manager` section.

  The symbols are displayed either:

  * in an icon list (with thumbnail, name and associated tags) using the
    |openTable| :sup:`List View` button below the frame;
  * or as icon preview using the |iconView| :sup:`Icon View` button.

* Press the :guilabel:`Save Symbol` button to add the symbol being edited to the
  symbols library. 
* With the :guilabel:`Advanced` |selectString| option, you can:

  * for line and fill symbols, :guilabel:`Clip features to canvas extent`.

    .. Todo: Explain what does advanced "clip features to canvas" option mean for the symbol?

  * for fill symbols, :guilabel:`Force right-hand rule orientation`: allows
    forcing rendered fill symbols to follow the standard "right hand rule" for ring
    orientation (i.e, polygons where the exterior ring is clockwise, and the interior
    rings are all counter-clockwise).

    The orientation fix is applied while rendering only, and the original feature
    geometry is unchanged. This allows for creation of fill symbols with consistent
    appearance, regardless of the dataset being rendered and the ring orientation
    of individual features.
  * Depending on the :ref:`symbology <vector_style_menu>` of the layer a symbol is
    being applied to, additional settings are available in the :guilabel:`Advanced`
    menu:

    * :ref:`Symbol levels... <Symbols_levels>` to define the order of symbols
      rendering
    * :ref:`Data-defined Size Legend <data_defined_size_legend>`
    * :guilabel:`Match to Saved Symbols...` and :guilabel:`Match to Symbols from
      File...` to automatically :ref:`assign symbols to classes <categorized_advanced_menu>`

.. _symbol_layer:

The symbol layer
----------------

At a lower level of the tree, you can customize the symbol layers. The available
symbol layer types depend on the upper symbol type. You can apply on the symbol
layer |paintEffects| :ref:`paint effects <draw_effects>` to enhance its rendering.

Because describing all the options of all the symbol layer types would not be
possible, only particular and significant ones are mentioned below.

Common parameters
.................

Some common options and widgets are available to build a symbol layer,
regardless it's of marker, line or fill sub-type:

* the :ref:`color selector <color-selector>` widget to ease color manipulation
* :guilabel:`Units`: it can be **Millimeters**, **Points**, **Pixels**,
  **Meters at Scale**, **Map units** or **Inches** (see :ref:`unit_selector`
  for more details)
* the |dataDefined| :sup:`data-defined override` widget near almost all options,
  extending capabilities of customizing each symbol (see :ref:`data_defined` for
  more information)

.. note::

 While the description below assumes that the symbol layer type is bound to the
 feature geometry, keep in mind that you can embed symbol layers in each others.
 In that case, the lower level symbol layer parameter (placement, offset...)
 might be bound to the upper-level symbol, and not to the feature geometry
 itself.

.. _vector_marker_symbols:

Marker Symbols
..............

Appropriate for point geometry features, marker symbols have several
:guilabel:`Symbol layer types`:

* **Simple marker** (default)

  .. _figure_simple_marker_symbol:

  .. figure:: img/simpleMarkerSymbol.png
     :align: center

     Designing a Simple Marker Symbol

* **Ellipse marker**: a simple marker symbol layer, with customizable width and
  height
* **Filled marker**: similar to the simple marker symbol layer, except that it
  uses a :ref:`fill sub symbol <vector_fill_symbols>` to render the marker.
  This allows use of all the existing QGIS fill (and stroke) styles for
  rendering markers, e.g. gradient or shapeburst fills.
* **Font marker**: use installed fonts as marker symbols
* **Geometry generator** (see :ref:`geometry_generator_symbol`)

.. _raster_image_marker:

* **Raster image marker**: use images (:file:`PNG`, :file:`JPG`, :file:`BMP`...)
  to render as marker symbol. The image can be a file on the disk, a remote URL
  or an embedded file encoded as a base64 string (:ref:`more details <svg_paths>`).
  Width and height of the image can be set independently or using the
  |lockedGray| :sup:`Lock aspect ratio`.
* **Vector Field marker** (see :ref:`vector_field_marker`)

.. _svg_marker:

* **SVG marker**: provides you with images from your SVG paths (set in
  :menuselection:`Settings --> Options... --> System` menu) to render as marker
  symbol. Width and height of the symbol can be set independently or using the
  |lockedGray| :sup:`Lock aspect ratio`. Each SVG file colors and stroke can
  also be adapted. The image can be a file on the disk, a remote URL or an
  embedded file encoded as a base64 string (:ref:`more details <svg_paths>`).

  .. note:: SVG version requirements

   QGIS renders SVG files that follow the `SVG Tiny 1.2 profile
   <https://www.w3.org/TR/SVGMobile12/>`_, intended for implementation on a
   range of devices, from cellphones and PDAs to laptop and desktop computers,
   and thus includes a subset of the features included in SVG 1.1 Full,
   along with new features to extend the capabilities of SVG.

   Some features not included in these specifications might not be rendered
   correctly in QGIS.

  .. tip:: Enable SVG marker symbol customization

   To have the possibility to change the colors of a :guilabel:`SVG marker`,
   you have to add the placeholders ``param(fill)`` for fill color,
   ``param(outline)`` for stroke color and ``param(outline-width)`` for stroke
   width. These placeholders can optionally be followed by a default value, e.g.:

   .. code-block:: xml

    <svg width="100%" height="100%">
    <rect fill="param(fill) #ff0000" stroke="param(outline) #00ff00" stroke-width="param(outline-width) 10" width="100" height="100">
    </rect>
    </svg>


.. _vector_line_symbols:

Line Symbols
............

Appropriate for line geometry features, line symbols have following symbol
layer types:

* **Simple line** (default): available settings are:

  * :guilabel:`Color`
  * :guilabel:`Stroke width`
  * :guilabel:`Stroke style`
  * :guilabel:`Join style`
  * :guilabel:`Cap style`
  * :guilabel:`Offset`
  * |checkbox| :guilabel:`Use custom dash pattern`: overrides the :guilabel:`Stroke
    style` setting with a custom dash.

.. _arrow_symbol:

* **Arrow**: draws lines as curved (or not) arrows with a single or a double
  head with configurable width, length and thickness. To create a curved arrow
  the line feature must have at least three vertices. It also uses a
  :ref:`fill symbol <vector_fill_symbols>` such as gradients or shapeburst
  to render the arrow body. Combined with the geometry generator, this type of
  layer symbol helps you representing flow maps;
* **Geometry generator** (see :ref:`geometry_generator_symbol`);
* **Marker line**: displays a marker symbol along the line. It can be at
  a regular distance or based on its geometry: first, last or each vertex, on
  central point or on every curve point. You can set an offset along the line
  for the marker symbol, or offset the line itself. The :guilabel:`Rotate
  marker` option allows you to set whether the marker symbol should follow the
  line orientation or not.

.. _vector_fill_symbols:

Fill Symbols
............

Appropriate for polygon geometry features, fill symbols have also several
symbol layer types:

* **Simple fill** (default): the following settings are available:

  * :guilabel:`Fill color` using all the capabilities of the :ref:`color-selector`
    widget, extended by a shortcut to apply a :guilabel:`Transparent fill`
  * :guilabel:`Fill style`
  * :guilabel:`Stroke color` using all the capabilities of the color selector
    widget, extended by a shortcut to apply a :guilabel:`Transparent stroke`
  * :guilabel:`Stroke width`
  * :guilabel:`Stroke style`
  * :guilabel:`Join style`
  * :guilabel:`Offset`: You can shift the symbol in the :guilabel:`X` or
    :guilabel:`Y` direction;

* **Centroid fill**: places a marker symbol at the centroid of the visible
  feature. The position of the marker may however not be the real centroid
  of the feature because calculation takes into account the polygon(s)
  clipped to area visible in map canvas for rendering and ignores holes.
  Use the geometry generator symbol if you want the exact centroid. 
  
  The marker can be placed on every part of a multi-part feature or
  only on its biggest part, and forced to be inside the polygon;

* **Geometry generator** (see :ref:`geometry_generator_symbol`);
* **Gradient fill**: uses a radial, linear or conical gradient, based on either
  simple two color gradients or a predefined :ref:`gradient color ramp
  <color-ramp>` to fill polygon layers. Gradient can be rotated and applied on
  a single feature basis or across the whole map extent. Also start and end
  points can be set via coordinates or using the centroid (of feature or map);
* **Line pattern fill**: fills the polygon with a hatching pattern of line
  symbol layer. You can set the spacing between lines and an offset from the
  feature boundary;
* **Point pattern fill**: fills the polygon with a hatching pattern of marker
  symbol layer. You can set the spacing between lines and an offset from the
  feature boundary; 
* **Raster image fill**: you can fill polygons with a tiled raster image.
  Options include (data defined) file name, opacity, image size (in pixels, mm
  or map units), coordinate mode (feature or view) and rotation;
* **SVG fill**: fills the polygon using :ref:`SVG markers <svg_marker>`;
* **Shapeburst fill**: this option buffered a gradient fill, where a gradient
  is drawn from the boundary of a polygon towards the polygon's centre.
  Configurable parameters include distance from the boundary to shade, use of
  color ramps or simple two color gradients, optional blurring of the fill and
  offsets;
* **Outline: Arrow**: uses a line :ref:`arrow symbol <arrow_symbol>` layer to
  represent the polygon boundary;
* **Outline: Marker line**: uses a marker line symbol layer to represent the
  polygon boundary;
* **Outline: simple line**: uses a simple line symbol layer to represent the
  polygon boundary. The :guilabel:`Draw line only inside polygon` option helps
  polygon borders inside the polygon and can be useful to clearly represent
  adjacent polygon boundaries.

.. note::

 When geometry type is polygon, you can choose to disable the automatic
 clipping of lines/polygons to the canvas extent. In some cases this clipping
 results in unfavourable symbology (e.g. centroid fills where the centroid must
 always be the actual feature's centroid).

.. _geometry_generator_symbol: 
 
The Geometry Generator
......................

Available with all types of symbols, the :guilabel:`geometry generator` symbol
layer allows to use :ref:`expression syntax <functions_list>` to generate a
geometry on the fly during the rendering process. The resulting geometry does
not have to match with the original geometry type and you can add several
differently modified symbol layers on top of each other.

Some examples:

::

  -- render the centroid of a feature
  centroid( $geometry ) 

  -- visually overlap features within a 100 map units distance from a point
  -- feature, i.e generate a 100m buffer around the point
  buffer( $geometry, 100 )

  -- Given polygon layer1( id1, layer2_id, ...) and layer2( id2, fieldn...)
  -- render layer1 with a line joining centroids of both where layer2_id = id2
  make_line( centroid( $geometry ),
             centroid( geometry( get_feature( 'layer2', 'id2', attribute(
                 $currentfeature, 'layer2_id') ) )
           ) 

  -- Create a nice radial effect of points surrounding the central feature
  -- point when used as a MultiPoint geometry generator
  collect_geometries(
    array_foreach(
      generate_series( 0, 330, 30 ),
        project( $geometry, .2, radians( @element ) )
    )
  )

.. _vector_field_marker:

The Vector Field Marker
.......................

The vector field marker is used to display vector field data such as earth
deformation, tidal flows, and the like. It displays the vectors as lines
(preferably arrows) that are scaled and oriented according to selected
attributes of data points. It can only be used to render point data; line and
polygon layers are not drawn by this symbology.

The vector field is defined by attributes in the data, which can represent the
field either by:

* **cartesian** components (``x`` and ``y`` components of the field)
* or **polar** coordinates: in this case, attributes define ``Length`` and
  ``Angle``. The angle may be measured either clockwise from north, or
  Counterclockwise from east, and may be either in degrees or radians.
* or as **height only** data, which displays a vertical arrow scaled using an
  attribute of the data. This is appropriate for displaying the vertical
  component of deformation, for example.

The magnitude of field can be scaled up or down to an appropriate size for
viewing the field.


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |checkbox| image:: /static/common/checkbox.png
   :width: 1.3em
.. |dataDefined| image:: /static/common/mIconDataDefine.png
   :width: 1.5em
.. |duplicateLayer| image:: /static/common/mActionDuplicateLayer.png
   :width: 1.5em
.. |iconView| image:: /static/common/mActionIconView.png
   :width: 1.5em
.. |locked| image:: /static/common/locked.png
   :width: 1.5em
.. |lockedGray| image:: /static/common/lockedGray.png
   :width: 1.2em
.. |openTable| image:: /static/common/mActionOpenTable.png
   :width: 1.5em
.. |paintEffects| image:: /static/common/mIconPaintEffects.png
   :width: 1.5em
.. |selectString| image:: /static/common/selectstring.png
   :width: 2.5em
.. |signMinus| image:: /static/common/symbologyRemove.png
   :width: 1.5em
.. |signPlus| image:: /static/common/symbologyAdd.png
   :width: 1.5em
.. |styleManager| image:: /static/common/mActionStyleManager.png
   :width: 1.5em
