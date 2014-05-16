|updatedisclaimer|

.. _qgis.documentation.whatsnew:

****************************
What's new in |qg| |CURRENT|
****************************

Please note that this is a release in our 'cutting edge' release
series. As such, it contains new features and extends the programmatic
interface over |qg| 2.0.  We recommend that you use this version over
previous releases.

This release includes hundreds of bug fixes and many new features and
enhancements that will be described in this manual. You may also
review the visual changelog at
http://changelog.linfiniti.com/qgis/version/21/.

Application and Project Options 
-------------------------------

* **Support for measurement in nautical miles**: You can now measure
  distances using nautical miles. To enable this, use the
  :menuselection:`Settings --> Options --> Map Tools` option panel.

Data Providers 
--------------

* **One-to-many relations support**: This release supports the ability
  to define 1:n relations. The relations are defined in the
  :guilabel:`project properties` dialog. Once relations exist for a
  layer, a new user interface element in the form view (e.g., when
  identifying a feature and opening its form) will list the related
  entities. This provides a powerful way to express, for instance, the
  inspection history on a length of pipeline or road segment.

* **DXF Export tool**: A new tool for exporting DXFs has been added to
  the :menuselection:`Project` menu.

* **Paste as new vector layer**: It is a common activity in a GIS to
  create a sub-selection and then to create a new layer from the
  selection. In QGIS you can already do Save Selection As to save a
  layer from your selection; now, functionality is offered that allows
  you to create a new file or memory layer from whatever is in your
  clipboard. Simply select some features, copy them to your clipboard
  and then do :menuselection:`Edit --> Paste Features As` and choose
  either 'New Vector Layer' or 'New Memory Layer' from the
  submenu. The best part of this new feature is that if you have some
  Well Known Text (WKT) features in your clipboard from another app,
  you can simply paste them into QGIS as a new layer now.

* **WMS legend graphic in table of contents and composer**: Prior to
  QGIS 2.2 the WMS data provider was not able to display a legend in
  the table of contents' layer list. Similarly no legend could be
  displayed in the map composer. QGIS 2.2 addresses both of these
  issues.

Digitising 
----------

* **Fill ring digitizing tool**: This new tool is used to cut holes in
  polygons and automatically fill them with new features. If you hold
  down :kbd:`Ctrl` when finalising the feature, the attributes will be
  taken from the parent feature.

General 
-------

* **Recent expressions saved**: The expression builder will now
  remember the last 20 used expressions.

* **Paste WKT from clipboard**: QGIS can now paste and create a new
  feature based on WKT that is found in the clipboard. Simply copy
  some WKT and paste into an editable layer. You can also create a new
  layer by selecting :menuselection:`Edit --> Paste As --> New Memory
  Layer`.

Map Composer 
------------

* **Zebra map border improvements**: You can now set the colours of
  the Zebra border on the map element in the map composer.

* **Element rotation support**: Every type of element in the composer
  can now be rotated, including scale bars, tables and legends. For
  example, you can rotate a label on the composition so that it fits
  into your page layout better (as illustrated). Resizing of rotated
  elements has also been improved.

* **Composer scale added and ruler improvements**: The appearance of
  rulers has been improved by adjusting the scale logic and by adding
  smaller ruler divisions, and by making vertical rulers use rotated
  text. There is also a new composer action for hiding/showing
  rulers. You can now quickly zoom to 100% page scale using the new
  Zoom to 100% tool on the toolbar. The composer window now lets you
  quickly switch the page scaling via a new scale combobox in the
  status bar. In addition, a new indicator has been added to show you
  the precise pixel position of your cursor. The **\[Close\]** and
  **\[Help\]** buttons have been removed from the bottom of the
  composer window to give you the maximum amount of screen space for
  working with your compositions.

* **World file generation**: In the composer, you can now create
  georeferenced maps! Simply ensure that you choose the correct map
  element in the Composition tab and then export your map as a PNG
  file. An accompanying world file will be written, allowing you to
  load your exported composition in QGIS as a raster layer.

* **Working with multiple items**: Support has been added for moving
  and resizing multiple items simultaneously. You can now hold
  :kbd:`Shift` while resizing to maintain an item's ratio while
  resizing, or hold :kbd:`Ctrl` to resize from the item's
  centre. These shortcut keys also apply to moving items, so holding
  :kbd:`Shift` while moving an item constrains the movement to
  horizontal or vertical movement, and holding :kbd:`Ctrl` temporarily
  disables item snapping. You can also hold :kbd:`Shift` while
  pressing a cursor key to shift all selected items by a larger
  amount.

* **Atlas enhancements**: You can now preview the individual pages of
  the map atlas that will be generated in the composer. While in atlas
  preview mode, you can output the current page without outputting the
  entire atlas. You can also tweak the map extent or scale for each
  feature while previewing the atlas page. Atlas map settings have
  been moved from the atlas panel to the map properties panel, so now,
  more than one map can be controlled by the atlas generation. There's
  a new option to automatically centre an overview map, which comes in
  handy when creating atlas-based maps. More context information is
  also now available so that you can adjust your symbology based on
  whether the feature is the current atlas feature or not.

* **Improved item selection**: You can now select more than one item
  by clicking and dragging a box to select multiple items, and there
  are shortcuts for adding to a selection (holding :kbd:`Shift` while
  dragging), subtracting from a selection (holding :kbd:`Ctrl` while
  dragging) and switching to "within" selection mode (holding
  :kbd:`Alt` while dragging). Shift-clicking an already-selected item
  will remove it from the selection. There are also shortcuts and menu
  items for selecting all items, clearing a selection, and inverting a
  selection. It's also now possible to select items that are hidden
  below other items by Ctrl-clicking an item, or by using 'Select Next
  Item Above/Below' in the new composer Edit menu.

* **Better navigation of compositions**: QGIS 2.2 includes many
  improvements to help you navigate your compositions. You can now
  zoom in or out from a composition by using the mouse scroll wheel. A
  dedicated pan tool has been added, which allows you to drag the
  composition around, and you can also switch immediately to pan mode
  by holding the space bar or by holding the mouse scroll
  wheel. There's also a new zoom tool, which allows you to precisely
  zoom to a specific area of your composition. You can also switch to
  zoom mode at any time by pressing and holding Ctrl-Space and drawing
  a zoom region on the composition.

* **Improved styling of pages and shapes**: You can now control the
  style of the composition background using the full range of QGIS'
  symbology options. It's now possible to export compositions with a
  transparent (or semi-transparent) background. Shape items
  (rectangles, triangles and ellipses) can also be styled using the
  same options as polygon map layers. You can even style the page
  background or shapes by using data-defined settings based on the
  current atlas feature! There's also a new option for rounding the
  corners of rectangle shapes.

QGIS Server 
-----------

* **WCS Support added to QGIS Server**: QGIS Server already supports
  various standards, including Web Map Service (WMS version 1.3.0 and
  1.1.1), Web Feature Service (WFS version 1.0.0) and Web Feature
  Service with Transaction (WFS-T). With this new release of QGIS, you
  can now serve raster layers using the Web Coverage Service (WCS
  version 1.0.0) standard.

Symbology 
---------

* **Gradient fill support**: The new gradient fill feature lets you
  create better cartography than ever before. The feature has numerous
  options providing for great flexibility in how you apply gradients
  to your features. These include:

  * Two-colour or ramp-based fills
  * Canvas- or object-based origin for your gradients
  * Gradients originating from the centroid of a feature
  * Conical, linear and radial gradient types
  * Data-defined options (i.e., to use an expression or a table
  column) for all gradient properties

* **Label support for palleted rasters**: Rasters that use a fixed
  colour pallette (for instance, a land cover map) can now have
  category labels assigned which will be shown in the map legend and
  in the composer legend.

* **Colour ramps can be inverted**: A new option has been added to
  symbology dialogs that deal with colour ramps to allow you to invert
  the colour ramp when it is created.

* **Copy and Paste in rule-based renderer**: In the rule-based
  renderer, you can now right-click on a rule and then copy and paste
  the rule as a new rule.

* **On-the-fly feature generalisation**: QGIS 2.2 introduces support
  for on-the-fly feature generalisation. This can improve rendering
  times when drawing many complex features at small scales. This
  feature can be enabled or disabled in the layer settings. There is
  also a new global setting that enables generalisation by default for
  newly added layers. **Note**: Feature generalisation may introduce
  artefacts into your rendered output in some cases. These may include
  slivers between polygons and inaccurate rendering when using
  offset-based symbol layers.

* **Anchor points can be set for marker layers**: When defining
  symbology with marker layers (e.g., a point layer symbolized with
  SVG markers) you can now specify what part of the image should
  correspond to the 'anchor point'. For example, you can indicate that
  the bottom-left corner of the image should coincide with the
  position of the feature. You can also use the **data-defined
  properties** to have this property set at render time based on an
  attribute in the data table for that layer (or an arbitrary
  expression).

* **Thematic maps based on expressions**: Categorized and graduated
  thematic maps can now be created using the result of an
  expression. In the Properties dialog for vector layers, the
  attribute chooser has been augmented with an expression builder. So
  now, you no longer need to write the classification attribute to a
  new column in your attribute table if you want the classification
  attribute to be a composite of multiple fields, or a formula of some
  sort.

* **Expression support in symbol diagrams for size and attributes**:
  You can now use an expression to define the size and attributes when
  using the diagramming capabilities of QGIS.

* **Else rule in rule-based renderer**: The rule-based renderer now
  supports an Else rule that will be run if none of the other rules on
  that level match. Else rules can be nested just like any other
  rules. An example might be:

  ::

	type = 'water' (style grey) ELSE (style red)
	
	
* **Inner stroke support for polygons**: Support has been added for
  polygon strokes to be limited to the interior of the polygon (so as
  not to overflow into a neighbouring polygon).

User Interface 
--------------

* **Improved properties dialogs**: All properties dialogs have had
  their main property menus updated so that they look slicker, with an
  inverse-coloured side bar. This is purely cosmetic but should make
  it easier to know what your current context is in a dialog.

* **Expression dialog improvements**: We have made some tweaks to the
  expression dialog - power users can now hide the operator
  buttons. There are also now splitters between the function list and
  function help areas, and between the expression and function list
  area.

* **New keybindings**: We have updated the keyboard shortcuts in QGIS
  to make it more efficient to carry out repetitive tasks.

  * :kbd:`Ctrl-d`: Remove selected layers in table of contents
  * :kbd:`>`: Select next vertex when using the node tool
  * :kbd:`<`: Select previous vertex when using the node tool
  * :kbd:`Delete` or :kbd:`Backspace`: Delete the selected features
    (you can undo these actions), or nodes when using the node tool
  * :kbd:`F5`: Update the canvas (instead of Ctrl-r)


