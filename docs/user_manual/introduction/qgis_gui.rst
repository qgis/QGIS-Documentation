.. Purpose: This chapter aims to describe only the interface of the default
.. QGIS interface. Details should be written in other parts with a link toward it.

.. _`label_qgismainwindow`:

********
QGIS GUI
********

.. only:: html

   .. contents::
      :local:

.. index::
   single: Main window

The QGIS graphical user interface (GUI) is shown in the figure below
(the numbers 1 through 5 in yellow circles indicate important
elements of the QGIS GUI, and are discussed below).

.. _figure_startup:

.. figure:: img/startup.png
   :align: center

   QGIS GUI with Alaska sample data

.. note::
   Your window decorations (title bar, etc.) may appear different
   depending on your operating system and window manager.

The main QGIS GUI (:numref:`figure_startup`) consists of five components /
component types:

#. :ref:`Menu Bar <label_menubar>`
#. :ref:`Toolbars <sec_panels_and_toolbars>`
#. :ref:`Panels <sec_panels_and_toolbars>`
#. :ref:`Map View  <label_mapview>`
#. :ref:`Status Bar <label_statusbar>`

Scroll down for detailed explanations of these.

.. index:: Menu
.. _label_menubar:

Menu Bar
========

The Menu bar provides access to QGIS functions using standard
hierarchical menus.
The Menus, their options, associated icons and keyboard shortcuts are
described below.
The keyboard shortcuts can be reconfigured
(:menuselection:`Settings --> Keyboard Shortcuts`).

Most menu options have a corresponding tool and vice-versa.
However, the Menus are not organized exactly like the toolbars.
The locations of menu options in the toolbars are indicated below
in the table.
Plugins may add new options to Menus.
For more information about tools and toolbars, see
:ref:`label_toolbars`.

.. note:: QGIS is a cross-platform application.  Tools are generally
   available on all platforms, but they may be placed in different
   menus, depending on the operating systems.
   The lists below show the most common locations, including known
   variations.

.. index:: Project

Project
-------

The :menuselection:`Project` menu provides access and exit points for
:ref:`project files <sec_projects>`. It provides tools to:

* Create a :guilabel:`New` project file from scratch or use another
  project file as a template (see
  :ref:`Project files options <projectfiles_options>` for template
  configuration)
* :guilabel:`Open...` a project from a file, a GeoPackage, PostgreSQL
  or Oracle database
* :guilabel:`Close` a project or revert it to its last saved state
* :guilabel:`Save` a project in :file:`.qgs` or :file:`.qgz` file
  format, either as a file or within a GeoPackage, PostgreSQL or
  Oracle database
* Export the map canvas to different formats or use a
  :ref:`print layout <label_printlayout>` for more complex output
* Set project properties and snapping options for geometry editing.

.. list-table:: The Project menu items
   :header-rows: 1
   :widths: 40 20 10 30

   * - Menu Option
     - Shortcut
     - Toolbar
     - Reference
   * - |fileNew| :guilabel:`New`
     - :kbd:`Ctrl+N`
     - :guilabel:`Project`
     - :ref:`sec_projects`
   * - :menuselection:`New from template -->`
     -
     -
     - :ref:`sec_projects`
   * - |fileOpen| :guilabel:`Open...`
     - :kbd:`Ctrl+O`
     - :guilabel:`Project`
     - :ref:`sec_projects`
   * - :menuselection:`Open from -->`
     -
     -
     - :ref:`sec_projects`
   * - :menuselection:`--> GeoPackage...`
     -
     -
     - :ref:`sec_projects`
   * - :menuselection:`--> PostgreSQL...`
     -
     -
     - :ref:`sec_projects`
   * - :menuselection:`--> Oracle...`
     -
     -
     - :ref:`sec_projects`
   * - :menuselection:`Open Recent -->`
     - :kbd:`Alt+J` + :kbd:`R`
     -
     - :ref:`sec_projects`
   * - :menuselection:`--> Clear List`
     -
     -
     - :ref:`sec_projects` 
   * - :guilabel:`Close`
     -
     -
     - :ref:`sec_projects`
   * - |fileSave| :guilabel:`Save`
     - :kbd:`Ctrl+S`
     - :guilabel:`Project`
     - :ref:`sec_projects`
   * - |fileSaveAs| :guilabel:`Save As...`
     - :kbd:`Ctrl+Shift+S`
     - :guilabel:`Project`
     - :ref:`sec_projects`
   * - :menuselection:`Save to -->`
     -
     -
     - :ref:`sec_projects`
   * - :menuselection:`--> Templates...`
     -
     -
     - :ref:`sec_projects`
   * - :menuselection:`--> GeoPackage...`
     -
     -
     - :ref:`sec_projects`
   * - :menuselection:`--> PostgreSQL...`
     -
     -
     - :ref:`sec_projects`
   * - :guilabel:`Revert...`
     -
     -
     -
   * - |projectProperties| :guilabel:`Properties...`
     - :kbd:`Ctrl+Shift+P`
     -
     - :ref:`project_properties`
   * - :guilabel:`Snapping Options...`
     -
     -
     - :ref:`snapping_options`
   * - :menuselection:`Import/Export -->`
     -
     -
     -
   * - :menuselection:`-->` |saveMapAsImage|
       :guilabel:`Export Map to Image...`
     -
     -
     - :ref:`exportingmapcanvas`
   * - :menuselection:`-->` |saveAsPDF|
       :guilabel:`Export Map to PDF...`
     -
     -
     - :ref:`exportingmapcanvas`
   * - :menuselection:`--> Export Project to DXF...`
     -
     -
     - :ref:`create_dxf_files`
   * - :menuselection:`--> Import Layers from DWG/DXF...`
     -
     -
     - :ref:`import_dxfdwg`
   * - |newLayout| :guilabel:`New Print Layout...`
     - :kbd:`Ctrl+P`
     - :guilabel:`Project`
     - :ref:`label_printlayout`
   * - |newReport| :guilabel:`New Report...`
     -
     -
     - :ref:`create-reports`
   * - |layoutManager| :guilabel:`Layout Manager...`
     -
     - :guilabel:`Project`
     - :ref:`label_printlayout`
   * - :menuselection:`Layouts -->`
     -
     -
     - :ref:`label_printlayout`
   * - :menuselection:`Models -->`
     -
     -
     - :ref:`processing.modeler`
   * - |fileExit| :guilabel:`Exit QGIS`
     - :kbd:`Ctrl+Q`
     -
     -


Under |osx| macOS, the :guilabel:`Exit QGIS` command corresponds to
:menuselection:`QGIS --> Quit QGIS` (:kbd:`Cmd+Q`).

Edit
----

The :menuselection:`Edit` menu provides most of the native tools needed
to edit layer attributes or geometry. To enable :menuselection:`Edit`
menu options you need to switch to editing mode by clicking on |toggleEditing|
:sup:`Toggle editing` (see :ref:`editingvector` for details).

.. list-table:: The Edit menu items
   :header-rows: 1
   :widths: 45 18 13 24

   * - Menu Option
     - Shortcut
     - Toolbar
     - Reference
   * - |undo| :guilabel:`Undo`
     - :kbd:`Ctrl+Z`
     - :guilabel:`Digitizing`
     - :ref:`undoredo_edits`
   * - |redo| :guilabel:`Redo`
     - :kbd:`Ctrl+Shift+Z`
     - :guilabel:`Digitizing`
     - :ref:`undoredo_edits`
   * - |editCut| :guilabel:`Cut Features`
     - :kbd:`Ctrl+X`
     - :guilabel:`Digitizing`
     - :ref:`clipboard_feature`
   * - |editCopy| :guilabel:`Copy Features`
     - :kbd:`Ctrl+C`
     - :guilabel:`Digitizing`
     - :ref:`clipboard_feature`
   * - |editPaste| :guilabel:`Paste Features`
     - :kbd:`Ctrl+V`
     - :guilabel:`Digitizing`
     - :ref:`clipboard_feature`
   * - :menuselection:`Paste Features as -->`
     -
     -
     - :ref:`sec_attribute_table`
   * - :menuselection:`--> New Vector Layer...`
     -
     -
     - :ref:`sec_attribute_table`
   * - :menuselection:`--> Temporary Scratch Layer...`
     - :kbd:`Ctrl+Alt+V`
     -
     - :ref:`sec_attribute_table`
   * - |deleteSelectedFeatures| :guilabel:`Delete Selected`
     -
     - :guilabel:`Digitizing`
     - :ref:`delete_feature`
   * - :menuselection:`Select -->`
     -
     -
     - :ref:`sec_selection`
   * - :menuselection:`-->`
       |selectRectangle| :guilabel:`Select Feature(s)`
     -
     - :guilabel:`Selection`
     - :ref:`sec_selection`
   * - :menuselection:`-->`
       |selectPolygon| :guilabel:`Select Features by Polygon`
     -
     - :guilabel:`Selection`
     - :ref:`sec_selection`
   * - :menuselection:`-->`
       |selectFreehand| :guilabel:`Select Features by Freehand`
     -
     - :guilabel:`Selection`
     - :ref:`sec_selection`
   * - :menuselection:`-->`
       |selectRadius| :guilabel:`Select Features by Radius`
     -
     - :guilabel:`Selection`
     - :ref:`sec_selection`
   * - :menuselection:`-->`
       |formSelect| :guilabel:`Select Features by Value...`
     - :kbd:`F3`
     - :guilabel:`Selection`
     - :ref:`sec_selection`
   * - :menuselection:`-->` |expressionSelect|
       :guilabel:`Select Features by Expression...`
     - :kbd:`Ctrl+F3`
     - :guilabel:`Selection`
     - :ref:`sec_selection`
   * - :menuselection:`-->`
       |deselectAll| :guilabel:`Deselect Features from All Layers`
     - :kbd:`Ctrl+Alt+A`
     - :guilabel:`Selection`
     - :ref:`sec_selection`
   * - :menuselection:`-->`
       |deselectActiveLayer| :guilabel:`Deselect Features from the Current Active Layer`
     - :kbd:`Ctrl+Shift+A`
     - :guilabel:`Selection`
     - :ref:`sec_selection`
   * - :menuselection:`--> Reselect Features`
     -
     -
     - :ref:`sec_selection`
   * - :menuselection:`-->`
       |selectAll| :guilabel:`Select All Features`
     - :kbd:`Ctrl+A`
     - :guilabel:`Selection`
     - :ref:`sec_selection`
   * - :menuselection:`-->`
       |invertSelection| :guilabel:`Invert Feature Selection`
     -
     - :guilabel:`Selection`
     - :ref:`sec_selection`
   * - |newTableRow| :guilabel:`Add Record`
     - :kbd:`Ctrl+.`
     - :guilabel:`Digitizing`
     -
   * - |capturePoint| :guilabel:`Add Point Feature`
     - :kbd:`Ctrl+.`
     - :guilabel:`Digitizing`
     - :ref:`add_feature`
   * - |captureLine| :guilabel:`Add Line Feature`
     - :kbd:`Ctrl+.`
     - :guilabel:`Digitizing`
     - :ref:`add_feature`
   * - |capturePolygon| :guilabel:`Add Polygon Feature`
     - :kbd:`Ctrl+.`
     - :guilabel:`Digitizing`
     - :ref:`add_feature`
   * - |circularStringCurvePoint| :guilabel:`Add Circular String`
     -
     - :guilabel:`Shape Digitizing`
     - :ref:`add_circular_string`
   * - |circularStringRadius| :guilabel:`Add Circular String by Radius`
     -
     - :guilabel:`Shape Digitizing`
     - :ref:`add_circular_string`
   * - :menuselection:`Add Circle -->`
     -
     - :guilabel:`Shape Digitizing`
     - :ref:`draw_circles`
   * - :menuselection:`-->`
       |circle2Points| :guilabel:`Add Circle from 2 Points`
     -
     - :guilabel:`Shape Digitizing`
     - :ref:`draw_circles`
   * - :menuselection:`-->`
       |circle3Points| :guilabel:`Add Circle from 3 Points`
     -
     - :guilabel:`Shape Digitizing`
     - :ref:`draw_circles`
   * - :menuselection:`-->`
       |circle3Tangents| :guilabel:`Add Circle from 3 Tangents`
     -
     - :guilabel:`Shape Digitizing`
     - :ref:`draw_circles`
   * - :menuselection:`-->`
       |circle2TangentsPoint|
       :guilabel:`Add Circle from 2 Tangents and a Point`
     -
     - :guilabel:`Shape Digitizing`
     - :ref:`draw_circles`
   * - :menuselection:`-->`
       |circleCenterPoint|
       :guilabel:`Add Circle by a Center Point and Another Point`
     -
     - :guilabel:`Shape Digitizing`
     - :ref:`draw_circles`
   * - :menuselection:`Add Rectangle -->`
     -
     - :guilabel:`Shape Digitizing`
     - :ref:`draw_rectangles`
   * - :menuselection:`-->`
       |rectangleExtent| :guilabel:`Add Rectangle from Extent`
     -
     - :guilabel:`Shape Digitizing`
     - :ref:`draw_rectangles`
   * - :menuselection:`-->`
       |rectangleCenter|
       :guilabel:`Add Rectangle from Center and a Point`
     -
     - :guilabel:`Shape Digitizing`
     - :ref:`draw_rectangles`
   * - :menuselection:`-->`
       |rectangle3PointsProjected|
       :guilabel:`Add Rectangle from 3 Points (Distance from 2nd
       and 3rd point)`
     -
     - :guilabel:`Shape Digitizing`
     - :ref:`draw_rectangles`
   * - :menuselection:`-->`
       |rectangle3PointsDistance|
       :guilabel:`Add Rectangle from 3 Points (Distance from
       projected point on segment p1 and p2)`
     -
     - :guilabel:`Shape Digitizing`
     - :ref:`draw_rectangles`
   * - :menuselection:`Add Regular Polygon -->`
     -
     - :guilabel:`Shape Digitizing`
     - :ref:`draw_regular_polygons`
   * - :menuselection:`-->`
       |regularPolygonCenterPoint|
       :guilabel:`Add Regular Polygon from Center and a Point`
     -
     - :guilabel:`Shape Digitizing`
     - :ref:`draw_regular_polygons`
   * - :menuselection:`-->`
       |regularPolygonCenterCorner|
       :guilabel:`Add Regular Polygon from Center and a Corner`
     -
     - :guilabel:`Shape Digitizing`
     - :ref:`draw_regular_polygons`
   * - :menuselection:`-->`
       |regularPolygon2Points|
       :guilabel:`Add Regular Polygon from 2 Points`
     -
     - :guilabel:`Shape Digitizing`
     - :ref:`draw_regular_polygons`
   * - :menuselection:`Add Ellipse -->`
     -
     - :guilabel:`Shape Digitizing`
     - :ref:`draw_ellipses`
   * - :menuselection:`-->`
       |ellipseCenter2Points|
       :guilabel:`Add Ellipse from Center and 2 Points`
     -
     - :guilabel:`Shape Digitizing`
     - :ref:`draw_ellipses`
   * - :menuselection:`-->`
       |ellipseCenterPoint|
       :guilabel:`Add Ellipse from Center and a Point`
     -
     - :guilabel:`Shape Digitizing`
     - :ref:`draw_ellipses`
   * - :menuselection:`-->`
       |ellipseExtent| :guilabel:`Add Ellipse from Extent`
     -
     - :guilabel:`Shape Digitizing`
     - :ref:`draw_ellipses`
   * - :menuselection:`-->`
       |ellipseFoci| :guilabel:`Add Ellipse from Foci`
     -
     - :guilabel:`Shape Digitizing`
     - :ref:`draw_ellipses`
   * - :menuselection:`Add Annotation -->`
     -
     -
     - :ref:`sec_annotations`
   * - :menuselection:`-->` |textAnnotation| :menuselection:`Text Annotation`
     -
     - :guilabel:`Annotations`
     - :ref:`sec_annotations`
   * - :menuselection:`-->` |formAnnotation| :menuselection:`Form Annotation`
     -
     - :guilabel:`Annotations`
     - :ref:`sec_annotations`
   * - :menuselection:`-->` |htmlAnnotation| :menuselection:`HTML Annotation`
     -
     - :guilabel:`Annotations`
     - :ref:`sec_annotations`
   * - :menuselection:`-->` |svgAnnotation| :menuselection:`SVG Annotation`
     -
     - :guilabel:`Annotations`
     - :ref:`sec_annotations`
   * - :menuselection:`Edit Attributes -->`
     -
     -
     -
   * - :menuselection:`-->` |multiEdit|
       :guilabel:`Modify Attributes of Selected Features`
     -
     - :guilabel:`Digitizing`
     - :ref:`calculate_fields_values`
   * - :menuselection:`-->` |mergeFeatureAttributes|
       :guilabel:`Merge Attributes of Selected Features`
     -
     - :guilabel:`Advanced Digitizing`
     - :ref:`mergeattributesfeatures`
   * - :menuselection:`Edit Geometry -->`
     -
     -
     -
   * - :menuselection:`-->` |moveFeature| :guilabel:`Move Feature(s)`
     -
     - :guilabel:`Advanced Digitizing`
     - :ref:`move_feature`
   * - :menuselection:`-->` |moveFeatureCopy|
       :guilabel:`Copy and Move Feature(s)`
     -
     - :guilabel:`Advanced Digitizing`
     - :ref:`move_feature`
   * - :menuselection:`-->` |rotateFeature| :guilabel:`Rotate Feature(s)`
     -
     - :guilabel:`Advanced Digitizing`
     - :ref:`rotate_feature`
   * - :menuselection:`-->` |scaleFeature| :guilabel:`Scale Feature(s)`
     -
     - :guilabel:`Advanced Digitizing`
     - :ref:`scale_feature`
   * - :menuselection:`-->` |simplify| :guilabel:`Simplify Feature`
     -
     - :guilabel:`Advanced Digitizing`
     - :ref:`simplify_feature`
   * - :menuselection:`-->` |addRing| :guilabel:`Add Ring`
     -
     - :guilabel:`Advanced Digitizing`
     - :ref:`add_ring`
   * - :menuselection:`-->` |addPart| :guilabel:`Add Part`
     -
     - :guilabel:`Advanced Digitizing`
     - :ref:`add_part`
   * - :menuselection:`-->` |fillRing| :guilabel:`Fill Ring`
     -
     - :guilabel:`Advanced Digitizing`
     - :ref:`fill_ring`
   * - :menuselection:`-->` |deleteRing| :guilabel:`Delete Ring`
     -
     - :guilabel:`Advanced Digitizing`
     - :ref:`delete_ring`
   * - :menuselection:`-->` |deletePart| :guilabel:`Delete Part`
     -
     - :guilabel:`Advanced Digitizing`
     - :ref:`delete_part`
   * - :menuselection:`-->` |reshape| :guilabel:`Reshape Features`
     -
     - :guilabel:`Advanced Digitizing`
     - :ref:`reshape_feature`
   * - :menuselection:`-->` |offsetCurve| :guilabel:`Offset Curve`
     -
     - :guilabel:`Advanced Digitizing`
     - :ref:`offset_curve`
   * - :menuselection:`-->` |splitFeatures| :guilabel:`Split Features`
     -
     - :guilabel:`Advanced Digitizing`
     - :ref:`split_feature`
   * - :menuselection:`-->` |splitParts| :guilabel:`Split Parts`
     -
     - :guilabel:`Advanced Digitizing`
     - :ref:`split_part`
   * - :menuselection:`-->` |mergeFeatures| :guilabel:`Merge Selected Features`
     -
     - :guilabel:`Advanced Digitizing`
     - :ref:`mergeselectedfeatures`
   * - :menuselection:`-->` |vertexTool| :guilabel:`Vertex Tool (All Layers)`
     -
     - :guilabel:`Digitizing`
     - :ref:`vertex_tool`
   * - :menuselection:`-->` |vertexToolActiveLayer|
       :guilabel:`Vertex Tool (Current Layer)`
     -
     - :guilabel:`Digitizing`
     - :ref:`vertex_tool`
   * - :menuselection:`-->` |reverseLine| :guilabel:`Reverse Line`
     -
     - :guilabel:`Advanced Digitizing`
     - :ref:`reverse_line`
   * - :menuselection:`-->` |trimExtend| :guilabel:`Trim/extend Feature`
     -
     - :guilabel:`Advanced Digitizing`
     - :ref:`trim_extend_feature`
   * - |rotatePointSymbols| :guilabel:`Rotate Point Symbols`
     -
     - :guilabel:`Advanced Digitizing`
     - :ref:`rotate_symbol`
   * - |offsetPointSymbols| :guilabel:`Offset Point Symbols`
     -
     - :guilabel:`Advanced Digitizing`
     - :ref:`offset_symbol`


Tools that depend on the selected layer geometry type i.e. point,
polyline or polygon, are activated accordingly:

.. list-table:: The "Move feature" geometry based icons
   :header-rows: 1
   :widths: 40 15 15 15

   * - Menu Option
     - Point
     - Polyline
     - Polygon
   * - :guilabel:`Move Feature(s)`
     - |moveFeaturePoint|
     - |moveFeatureLine|
     - |moveFeature|
   * - :guilabel:`Copy and Move Feature(s)`
     - |moveFeatureCopyPoint|
     - |moveFeatureCopyLine|
     - |moveFeatureCopy|


.. _view_menu:

View
----

The map is rendered in map views. You can interact with these
views using the :menuselection:`View` tools. For example, you can:

* Create new 2D or 3D map views next to the main map canvas
* :ref:`Zoom or pan <zoom_pan>` to any place
* Query the attributes or geometry of the displayed features 
* Enhance the map view with preview modes, annotations or decorations
* Access any panel or toolbar

The menu also allows you to reorganize the QGIS interface itself using
actions like:

* :guilabel:`Toggle Full Screen Mode`: covers the whole screen
  while hiding the title bar
* :guilabel:`Toggle Panel Visibility`: shows or hides enabled
  :ref:`panels <panels_tools>` - useful when digitizing features (for
  maximum canvas visibility) as well as for (projected/recorded)
  presentations using QGIS main canvas
* :guilabel:`Toggle Map Only`: hides panels, toolbars, menus and status
  bar and only shows the map canvas. Combined with the full screen
  option, it makes your screen display only the map


.. list-table:: The View menu items
   :header-rows: 1
   :widths: 42 22 12 24

   * - Menu Option
     - Shortcut
     - Toolbar
     - Reference
   * - |newMap| :guilabel:`New Map View`
     - :kbd:`Ctrl+M`
     - :guilabel:`Map Navigation`
     - :ref:`label_mapview`
   * - :menuselection:`3D Map Views -->`
     -
     -
     - :ref:`label_3dmapview`
   * - :menuselection:`-->` |new3DMap| :guilabel:`New 3D Map View`
     - :kbd:`Ctrl+Alt+M`
     - :guilabel:`Map Navigation`
     - :ref:`label_3dmapview`
   * - :menuselection:`--> Manage 3D Map Views`
     -
     -
     - :ref:`label_3dmapview`
   * - |pan| :guilabel:`Pan Map`
     -
     - :guilabel:`Map Navigation`
     - :ref:`zoom_pan`
   * - |panToSelected| :guilabel:`Pan Map to Selection`
     -
     - :guilabel:`Map Navigation`
     - :ref:`zoom_pan`
   * - |zoomIn| :guilabel:`Zoom In`
     - :kbd:`Ctrl+Alt++`
     - :guilabel:`Map Navigation`
     - :ref:`zoom_pan`
   * - |zoomOut| :guilabel:`Zoom Out`
     - :kbd:`Ctrl+Alt+-`
     - :guilabel:`Map Navigation`
     - :ref:`zoom_pan`
   * - |identify| :guilabel:`Identify Features`
     - :kbd:`Ctrl+Shift+I`
     - :guilabel:`Attributes`
     - :ref:`identify`
   * - :menuselection:`Measure -->`
     -
     - :guilabel:`Attributes`
     - :ref:`sec_measure`
   * - :menuselection:`-->` |measure|
       :guilabel:`Measure Line`
     - :kbd:`Ctrl+Shift+M`
     - :guilabel:`Attributes`
     - :ref:`sec_measure`
   * - :menuselection:`-->` |measureArea|
       :guilabel:`Measure Area`
     - :kbd:`Ctrl+Shift+J`
     - :guilabel:`Attributes`
     - :ref:`sec_measure`
   * - :menuselection:`-->` |measureBearing|
       :guilabel:`Measure Bearing`
     -
     - :guilabel:`Attributes`
     - :ref:`sec_measure`   
   * - :menuselection:`-->` |measureAngle|
       :guilabel:`Measure Angle`
     -
     - :guilabel:`Attributes`
     - :ref:`sec_measure`
   * - |sum| :guilabel:`Statistical Summary`
     -
     - :guilabel:`Attributes`
     - :ref:`statistical_summary`
   * - |newElevationProfile| :guilabel:`Elevation Profile`
     -
     -
     - :ref:`label_elevation_profile_view`
   * - |zoomFullExtent| :guilabel:`Zoom Full`
     - :kbd:`Ctrl+Shift+F`
     - :guilabel:`Map Navigation`
     - :ref:`zoom_pan`
   * - |zoomToSelected| :guilabel:`Zoom To Selection`
     - :kbd:`Ctrl+J`
     - :guilabel:`Map Navigation`
     - :ref:`zoom_pan`
   * - |zoomToLayer| :guilabel:`Zoom To Layer(s)`
     -
     - :guilabel:`Map Navigation`
     - :ref:`zoom_pan`
   * - |zoomActual| :guilabel:`Zoom To Native Resolution (100%)`
     -
     - :guilabel:`Map Navigation`
     - :ref:`zoom_pan`
   * - |zoomLast| :guilabel:`Zoom Last`
     -
     - :guilabel:`Map Navigation`
     - :ref:`zoom_pan`
   * - |zoomNext| :guilabel:`Zoom Next`
     -
     - :guilabel:`Map Navigation`
     - :ref:`zoom_pan`
   * - :menuselection:`Decorations -->`
     - :kbd:`Alt+V` + :kbd:`D`
     -
     - :ref:`decorations`
   * - :menuselection:`-->` |addGrid|
       :guilabel:`Grid...`
     -
     -
     - :ref:`grid_decoration`
   * - :menuselection:`-->` |scaleBar|
       :guilabel:`Scale Bar...`
     -
     -
     - :ref:`scalebar_decoration`
   * - :menuselection:`-->` |addImage|
       :guilabel:`Image...`
     -
     -
     - :ref:`image_decoration`
   * - :menuselection:`-->` |northArrow|
       :guilabel:`North Arrow...`
     -
     -
     - :ref:`northarrow_decoration`
   * - :menuselection:`-->` |titleLabel|
       :guilabel:`Title Label...`
     -
     -
     - :ref:`titlelabel_decoration`
   * - :menuselection:`-->` |copyrightLabel|
       :guilabel:`Copyright Label...`
     -
     -
     - :ref:`copyright_decoration`
   * - :menuselection:`-->` |addMap|
       :guilabel:`Layout Extents...`
     -
     -
     - :ref:`layoutextents_decoration`
   * - :menuselection:`Preview mode -->`
     -
     -
     -
   * - :menuselection:`--> Normal`
     -
     -
     -
   * - :menuselection:`--> Simulate Monochrome`
     -
     -
     -
   * - :menuselection:`--> Simulate Achromatopsia Color Blindness (Grayscale)`
     -
     -
     -
   * - :menuselection:`--> Simulate Protanopia Color Blindness (No Red)`
     -
     -
     -
   * - :menuselection:`--> Simulate Deuteranopia Color Blindness (No Green)`
     -
     -
     -
   * - :menuselection:`--> Simulate Tritanopia Color Blindness (No Blue)`
     -
     -
     -
   * - |mapTips| :guilabel:`Show Map Tips`
     -
     - :guilabel:`Attributes`
     - :ref:`maptips`
   * - |newBookmark| :guilabel:`New Spatial Bookmark...`
     - :kbd:`Ctrl+B`
     - :guilabel:`Map Navigation`
     - :ref:`sec_bookmarks`
   * - |showBookmarks| :guilabel:`Show Spatial Bookmarks`
     - :kbd:`Ctrl+Shift+B`
     - :guilabel:`Map Navigation`
     - :ref:`sec_bookmarks`
   * - |showBookmarks| :guilabel:`Show Spatial Bookmark Manager`
     -
     -
     - :ref:`sec_bookmarks`
   * - |refresh| :guilabel:`Refresh`
     - :kbd:`F5`
     - :guilabel:`Map Navigation`
     -
   * - :menuselection:`Layer Visibility -->`
     -
     -
     - :ref:`label_legend`
   * - :menuselection:`-->` |showAllLayers| :guilabel:`Show All Layers`
     - :kbd:`Ctrl+Shift+U`
     -
     - :ref:`label_legend`
   * - :menuselection:`-->` |hideAllLayers| :guilabel:`Hide All Layers`
     - :kbd:`Ctrl+Shift+H`
     -
     - :ref:`label_legend`
   * - :menuselection:`-->` |showSelectedLayers|
       :guilabel:`Show Selected Layers`
     -
     -
     - :ref:`label_legend`
   * - :menuselection:`-->` |hideSelectedLayers|
       :guilabel:`Hide Selected Layers`
     -
     -
     - :ref:`label_legend`
   * - :menuselection:`-->` |toggleSelectedLayers|
       :guilabel:`Toggle Selected Layers`
     -
     -
     - :ref:`label_legend`
   * - :menuselection:`-->` :guilabel:`Toggle Selected Layers Independently`
     -
     -
     - :ref:`label_legend`
   * - :menuselection:`-->` |hideDeselectedLayers|
       :guilabel:`Hide Deselected Layers`
     -
     -
     - :ref:`label_legend`
   * - :menuselection:`Panels -->`
     -
     -
     - :ref:`sec_panels_and_toolbars`
   * - :menuselection:`Toolbars -->`
     -
     -
     - :ref:`sec_panels_and_toolbars`
   * - :guilabel:`Toggle Full Screen Mode`
     - :kbd:`F11`
     -
     -
   * - :guilabel:`Toggle Panel Visibility`
     - :kbd:`Ctrl+Tab`
     -
     -
   * - :guilabel:`Toggle Map Only`
     - :kbd:`Ctrl+Shift+Tab`
     -
     -


Under |kde| Linux KDE, :menuselection:`Panels -->`,
:menuselection:`Toolbars -->` and :guilabel:`Toggle Full Screen Mode`
are in the :menuselection:`Settings` menu.

Layer
-----

The :menuselection:`Layer` menu provides a large set of tools to
:ref:`create <sec_create_vector>` new data sources,
:ref:`add <opening_data>` them to a project or
:ref:`save modifications <sec_edit_existing_layer>` to them.
Using the same data sources, you can also:

* :guilabel:`Duplicate` a layer to generate a copy where you can
  modify the name, style (symbology, labels, ...), joins, ...
  The copy uses the same data source as the original.
* :guilabel:`Copy` and :guilabel:`Paste` layers or groups from one
  project to another as a new instance whose properties can be
  modified independently.
  As for *Duplicate*, the layers are still based on the same data source.
* or :guilabel:`Embed Layers and Groups...` from another project, as
  read-only copies which you cannot modify (see :ref:`nesting_projects`)

The :menuselection:`Layer` menu also contains tools to configure,
copy or paste layer properties (style, scale, CRS...).


.. list-table:: The Layer menu items
   :header-rows: 1
   :widths: 37 18 18 27

   * - Menu Option
     - Shortcut
     - Toolbar
     - Reference
   * - |dataSourceManager| :guilabel:`Data Source Manager`
     - :kbd:`Ctrl+L`
     - :guilabel:`Data Source Manager`
     - :ref:`Opening Data <datasourcemanager>`
   * - :menuselection:`Create Layer -->`
     -
     -
     - :ref:`sec_create_vector`
   * - :menuselection:`-->` |newGeoPackageLayer|
       :guilabel:`New GeoPackage Layer...`
     - :kbd:`Ctrl+Shift+N`
     - :guilabel:`Data Source Manager`
     - :ref:`vector_create_geopackage`
   * - :menuselection:`-->` |newVectorLayer|
       :guilabel:`New Shapefile Layer...`
     -
     - :guilabel:`Data Source Manager`
     - :ref:`vector_create_shapefile`
   * - :menuselection:`-->` |newSpatiaLiteLayer|
       :guilabel:`New SpatiaLite Layer...`
     -
     - :guilabel:`Data Source Manager`
     - :ref:`vector_create_spatialite`
   * - :menuselection:`-->` |createMemory|
       :guilabel:`New Temporary Scratch Layer...`
     -
     - :guilabel:`Data Source Manager`
     - :ref:`vector_new_scratch_layer`
   * - :menuselection:`-->` |newMeshLayer|
       :guilabel:`New Mesh Layer...`
     -
     - :guilabel:`Data Source Manager`
     - :ref:`vector_create_mesh`
   * - :menuselection:`-->` |newGpx|
       :guilabel:`New GPX Layer...`
     -
     - :guilabel:`Data Source Manager`
     - :ref:`vector_create_gpx`
   * - :menuselection:`-->` |newVirtualLayer|
       :guilabel:`New Virtual Layer...`
     -
     - :guilabel:`Data Source Manager`
     - :ref:`vector_virtual_layers`
   * - :menuselection:`Add Layer -->`
     -
     -
     - :ref:`opening_data`
   * - :menuselection:`-->` |addOgrLayer|
       :guilabel:`Add Vector Layer......`
     - :kbd:`Ctrl+Shift+V`
     - :guilabel:`Manage Layers`
     - :ref:`loading_file`
   * - :menuselection:`-->` |addRasterLayer|
       :guilabel:`Add Raster Layer...`
     - :kbd:`Ctrl+Shift+R`
     - :guilabel:`Manage Layers`
     - :ref:`loading_file`
   * - :menuselection:`-->` |addMeshLayer|
       :guilabel:`Add Mesh Layer...`
     -
     - :guilabel:`Manage Layers`
     - :ref:`mesh_loading`
   * - :menuselection:`-->` |addDelimitedTextLayer|
       :guilabel:`Add Delimited Text Layer...`
     - :kbd:`Ctrl+Shift+T`
     - :guilabel:`Manage Layers`
     - :ref:`vector_loading_csv`
   * - :menuselection:`-->` |addPostgisLayer|
       :guilabel:`Add PostGIS Layer...`
     - :kbd:`Ctrl+Shift+D`
     - :guilabel:`Manage Layers`
     - :ref:`db_tools`
   * - :menuselection:`-->` |addSpatiaLiteLayer|
       :guilabel:`Add SpatiaLite Layer...`
     - :kbd:`Ctrl+Shift+L`
     - :guilabel:`Manage Layers`
     - :ref:`label_spatialite`
   * - :menuselection:`-->` |addMssqlLayer|
       :guilabel:`Add MS SQL Server Layer...`
     -
     - :guilabel:`Manage Layers`
     - :ref:`db_tools`
   * - :menuselection:`-->` |addOracleLayer|
       :guilabel:`Add Oracle Spatial Layer...`
     -
     - :guilabel:`Manage Layers`
     - :ref:`db_tools`
   * - :menuselection:`-->` |addHanaLayer|
       :guilabel:`Add SAP HANA Spatial Layer...`
     -
     - :guilabel:`Manage Layers`
     - :ref:`db_tools`
   * - :menuselection:`-->` |addVirtualLayer|
       :guilabel:`Add/Edit Virtual Layer...`
     -
     - :guilabel:`Manage Layers`
     - :ref:`vector_virtual_layers`
   * - :menuselection:`-->` |addWmsLayer|
       :guilabel:`Add WMS/WMTS Layer...`
     - :kbd:`Ctrl+Shift+W`
     - :guilabel:`Manage Layers`
     - :ref:`ogc-wms-layers`
   * - :menuselection:`-->` |addXyzLayer|
       :guilabel:`Add XYZ Layer...`
     -
     -
     - :ref:`xyz_tile`
   * - :menuselection:`-->` |addWcsLayer|
       :guilabel:`Add WCS Layer...`
     -
     - :guilabel:`Manage Layers`
     - :ref:`ogc-wcs`
   * - :menuselection:`-->` |addWfsLayer|
       :guilabel:`Add WFS / OGC API - Features Layer...`
     -
     - :guilabel:`Manage Layers`
     - :ref:`ogc-wfs`
   * - :menuselection:`-->` |addAfsLayer|
       :guilabel:`Add ArcGIS REST Server Layer...`
     -
     - :guilabel:`Manage Layers`
     - :ref:`arcgis_rest`
   * - :menuselection:`-->` |addVectorTileLayer|
       :guilabel:`Add Vector Tile Layer...`
     -
     -
     - :ref:`vector_tiles`
   * - :menuselection:`-->` |addPointCloudLayer|
       :guilabel:`Add Point Cloud Layer...`
     -
     -
     - :ref:`working_with_point_clouds`
   * - :menuselection:`-->` |addGpsLayer|
       :guilabel:`Add GPX Layer...`
     -
     -
     - :ref:`gps_data`
   * - :guilabel:`Embed Layers and Groups...`
     -
     -
     - :ref:`nesting_projects`
   * - :guilabel:`Add from Layer Definition File...`
     -
     -
     - :ref:`layer_definition_file`
   * - |georefRun| :guilabel:`Georeferencer...`
     -
     -
     - :ref:`georef`
   * - |editCopy| :guilabel:`Copy Style`
     -
     -
     - :ref:`save_layer_property`
   * - |editPaste| :guilabel:`Paste Style`
     -
     -
     - :ref:`save_layer_property`
   * - |editCopy| :guilabel:`Copy Layer`
     -
     -
     -
   * - |editPaste| :guilabel:`Paste Layer/Group`
     -
     -
     -
   * - |openTable| :guilabel:`Open Attribute Table`
     - :kbd:`F6`
     - :guilabel:`Attributes`
     - :ref:`sec_attribute_table`
   * - :menuselection:`Filter Attribute Table -->`
     -
     -
     - :ref:`sec_attribute_table`
   * - :menuselection:`-->` |openTableSelected| :menuselection:`Open Attribute Table (Selected Features)`
     - :kbd:`Shift+F6`
     - :guilabel:`Attributes`
     - :ref:`sec_attribute_table`
   * - :menuselection:`-->` |openTableVisible| :menuselection:`Open Attribute Table (Visible Features)`
     - :kbd:`Ctrl+F6`
     - :guilabel:`Attributes`
     - :ref:`sec_attribute_table`
   * - :menuselection:`-->` |openTableEdited| :menuselection:`Open Attribute Table (Edited and New Features)`
     -
     - :guilabel:`Attributes`
     - :ref:`sec_attribute_table`
   * - |toggleEditing| :guilabel:`Toggle Editing`
     -
     - :guilabel:`Digitizing`
     - :ref:`sec_edit_existing_layer`
   * - |fileSave| :guilabel:`Save Layer Edits`
     -
     - :guilabel:`Digitizing`
     - :ref:`save_feature_edits`
   * - |allEdits| :menuselection:`Current Edits -->`
     -
     - :guilabel:`Digitizing`
     - :ref:`save_feature_edits`
   * - :menuselection:`--> Save for Selected Layer(s)`
     -
     - :guilabel:`Digitizing`
     - :ref:`save_feature_edits`
   * - :menuselection:`--> Rollback for Selected Layer(s)`
     -
     - :guilabel:`Digitizing`
     - :ref:`save_feature_edits`
   * - :menuselection:`--> Cancel for Selected Layer(s)`
     -
     - :guilabel:`Digitizing`
     - :ref:`save_feature_edits`
   * - :menuselection:`--> Save for all Layers`
     -
     - :guilabel:`Digitizing`
     - :ref:`save_feature_edits`
   * - :menuselection:`--> Rollback for all Layers`
     -
     - :guilabel:`Digitizing`
     - :ref:`save_feature_edits`
   * - :menuselection:`--> Cancel for all Layers`
     -
     - :guilabel:`Digitizing`
     - :ref:`save_feature_edits`
   * - :guilabel:`Save As...`
     -
     -
     - :ref:`general_saveas`
   * - :guilabel:`Save As Layer Definition File...`
     -
     -
     - :ref:`layer_definition_file`
   * - |removeLayer| :guilabel:`Remove Layer/Group`
     - :kbd:`Ctrl+D`
     -
     -
   * - |duplicateLayer| :guilabel:`Duplicate Layer(s)`
     -
     -
     -
   * - :guilabel:`Set Scale Visibility of Layer(s)`
     -
     -
     - :ref:`label_scaledepend`
   * - :guilabel:`Set CRS of Layer(s)`
     - :kbd:`Ctrl+Shift+C`
     -
     - :ref:`layer_crs`
   * - :guilabel:`Set Project CRS from Layer`
     -
     -
     - :ref:`project_crs`
   * - :guilabel:`Layer Properties...`
     -
     -
     - * :ref:`vector <vector_properties_dialog>`
       * :ref:`raster <raster_properties_dialog>`
       * :ref:`mesh <label_meshproperties>`
       * :ref:`point cloud <point_clouds_properties>`
       * :ref:`vector tiles <vectortiles_properties>`
   * - :guilabel:`Filter...`
     - :kbd:`Ctrl+F`
     -
     - :ref:`vector_query_builder`
   * - |labelingSingle| :guilabel:`Labeling`
     -
     -
     - :ref:`vector_labels_tab`
   * - |inOverview| :guilabel:`Show in Overview`
     -
     -
     - :ref:`overview_panels`
   * - |addAllToOverview| :guilabel:`Show All in Overview`
     -
     -
     - :ref:`overview_panels`
   * - |removeAllFromOverview| :guilabel:`Hide All from Overview`
     -
     -
     - :ref:`overview_panels`


Settings
--------

.. list-table:: The Settings menu items
   :header-rows: 1
   :widths: 50 50

   * - Menu Option
     - Reference
   * - :menuselection:`User Profiles -->`
     - :ref:`user_profiles`
   * - :menuselection:`--> default`
     - :ref:`user_profiles`
   * - :menuselection:`--> Open Active Profile Folder`
     - :ref:`user_profiles`
   * - :menuselection:`--> New Profile...`
     - :ref:`user_profiles`
   * - |styleManager| :guilabel:`Style Manager...`
     - :ref:`vector_style_manager`
   * - |customProjection| :guilabel:`Custom Projections...`
     - :ref:`sec_custom_projections`
   * - |keyboardShortcuts| :guilabel:`Keyboard Shortcuts...`
     - :ref:`shortcuts`
   * - |interfaceCustomization|
       :guilabel:`Interface Customization...`
     - :ref:`sec_customization`
   * - |options| :guilabel:`Options...`
     - :ref:`gui_options`


Under |kde| Linux KDE, you'll find more tools in the
:menuselection:`Settings` menu such as :menuselection:`Panels -->`,
:menuselection:`Toolbars -->` and :guilabel:`Toggle Full Screen Mode`.

Plugins
-------

.. list-table:: The Plugins menu items
   :header-rows: 1
   :widths: 36 17 17 30

   * - Menu Option
     - Shortcut
     - Toolbar
     - Reference
   * - |showPluginManager| :guilabel:`Manage and Install Plugins...`
     -
     -
     - :ref:`managing_plugins`
   * - "|pythonFile| :guilabel:`Python Console`
     - :kbd:`Ctrl+Alt+P`
     - :guilabel:`Plugins`
     - :ref:`console`


When starting QGIS for the first time not all core plugins are loaded.


Vector
------

This is what the :guilabel:`Vector` menu looks like if all core plugins
are enabled.

.. list-table:: The Vector menu items
   :header-rows: 1
   :widths: 40 15 10 35

   * - Menu Option
     - Shortcut
     - Toolbar
     - Reference
   * - |geometryChecker| :guilabel:`Check Geometries...`
     -
     -
     - :ref:`geometry_checker`
   * - |topologyChecker| :guilabel:`Topology Checker`
     -
     - :guilabel:`Vector`
     - :ref:`topology`
   * - :menuselection:`Geoprocessing Tools -->`
     - :kbd:`Alt+O` + :kbd:`G`
     -
     -
   * - :menuselection:`-->` |buffer| :menuselection:`Buffer...`
     -
     -
     - :ref:`qgisbuffer`
   * - :menuselection:`-->` |clip| :menuselection:`Clip...`
     -
     -
     - :ref:`qgisclip`
   * - :menuselection:`-->` |convexHull| :menuselection:`Convex Hull...`
     -
     -
     - :ref:`qgisconvexhull`
   * - :menuselection:`-->` |difference| :menuselection:`Difference...`
     -
     -
     - :ref:`qgisdifference`
   * - :menuselection:`-->` |dissolve| :menuselection:`Dissolve...`
     -
     -
     - :ref:`qgisdissolve`
   * - :menuselection:`-->` |intersect| :menuselection:`Intersection...`
     -
     -
     - :ref:`qgisintersection`
   * - :menuselection:`-->` |symmetricalDifference| :menuselection:`Symmetrical Difference...`
     -
     -
     - :ref:`qgissymmetricaldifference`
   * - :menuselection:`-->` |union| :menuselection:`Union...`
     -
     -
     - :ref:`qgisunion`
   * - :menuselection:`-->` |dissolve| :menuselection:`Eliminate Selected Polygons...`
     -
     -
     - :ref:`qgiseliminateselectedpolygons`
   * - :menuselection:`Geometry Tools -->`
     - :kbd:`Alt+O` + :kbd:`E`
     -
     -
   * - :menuselection:`-->` |centroids| :menuselection:`Centroids...`
     -
     -
     - :ref:`qgiscentroids`
   * - :menuselection:`-->` |collect| :menuselection:`Collect Geometries...`
     -
     -
     - :ref:`qgiscollect`
   * - :menuselection:`-->` |extractVertices| :menuselection:`Extract Vertices...`
     -
     -
     - :ref:`qgisextractvertices`
   * - :menuselection:`-->` |multiToSingle| :menuselection:`Multipart to Singleparts...`
     -
     -
     - :ref:`qgismultiparttosingleparts`
   * - :menuselection:`-->` |polygonToLine| :menuselection:`Polygons to Lines...`
     -
     -
     - :ref:`qgispolygonstolines`
   * - :menuselection:`-->` |simplify_2| :menuselection:`Simplify...`
     -
     -
     - :ref:`qgissimplifygeometries`
   * - :menuselection:`-->` |checkGeometry| :menuselection:`Check Validity...`
     -
     -
     - :ref:`qgischeckvalidity`
   * - :menuselection:`-->` |delaunay| :menuselection:`Delaunay Triangulation...`
     -
     -
     - :ref:`qgisdelaunaytriangulation`
   * - :menuselection:`-->` |processingAlgorithm| :menuselection:`Densify by Count...`
     -
     -
     - :ref:`qgisdensifygeometries`
   * - :menuselection:`-->` |addGeometryAttributes| :menuselection:`Add Geometry Attributes...`
     -
     -
     - :ref:`qgisexportaddgeometrycolumns`
   * - :menuselection:`-->` |lineToPolygon| :menuselection:`Lines to Polygons...`
     -
     -
     - :ref:`qgislinestopolygons`
   * - :menuselection:`-->` |voronoi| :menuselection:`Voronoi Polygons...`
     -
     -
     - :ref:`qgisvoronoipolygons`
   * - :menuselection:`Analysis Tools -->`
     - :kbd:`Alt+O` + :kbd:`A`
     -
     -
   * - :menuselection:`-->` |lineIntersections| :menuselection:`Line Intersection...`
     -
     -
     - :ref:`qgislineintersections`
   * - :menuselection:`-->` |meanCoordinates| :menuselection:`Mean Coordinate(s)...`
     -
     -
     - :ref:`qgismeancoordinates`
   * - :menuselection:`-->` |basicStatistics| :menuselection:`Basic Statistics for Fields...`
     -
     -
     - :ref:`qgisbasicstatisticsforfields`
   * - :menuselection:`-->` |sumPoints| :menuselection:`Count Points in Polygon...`
     -
     -
     - :ref:`qgiscountpointsinpolygon`
   * - :menuselection:`-->` |distanceMatrix| :menuselection:`Distance Matrix...`
     -
     -
     - :ref:`qgisdistancematrix`
   * - :menuselection:`-->` |uniqueValues| :menuselection:`List Unique Values...`
     -
     -
     - :ref:`qgislistuniquevalues`
   * - :menuselection:`-->` |nearestNeighbour| :menuselection:`Nearest Neighbour Analysis...`
     -
     -
     - :ref:`qgisnearestneighbouranalysis`
   * - :menuselection:`-->` |sumLengthLines| :menuselection:`Sum Line Lengths...`
     -
     -
     - :ref:`qgissumlinelengths`
   * - :menuselection:`Data Management Tools -->`
     - :kbd:`Alt+O` + :kbd:`D`
     -
     -
   * - :menuselection:`-->` |mergeLayers| :menuselection:`Merge Vector Layers...`
     -
     -
     - :ref:`qgismergevectorlayers`
   * - :menuselection:`-->` |processingAlgorithm| :menuselection:`Reproject Layer...`
     -
     -
     - :ref:`qgisreprojectlayer`
   * - :menuselection:`-->` |processingAlgorithm| :menuselection:`Create Spatial Index...`
     -
     -
     - :ref:`qgiscreatespatialindex`
   * - :menuselection:`-->` |processingAlgorithm| :menuselection:`Join Attributes by Location...`
     -
     -
     - :ref:`qgisjoinattributesbylocation`
   * - :menuselection:`-->` |splitLayer| :menuselection:`Split Vector Layer...`
     -
     -
     - :ref:`qgissplitvectorlayer`
   * - :menuselection:`Research Tools -->`
     - :kbd:`Alt+O` + :kbd:`R`
     -
     -
   * - :menuselection:`-->` |createGrid| :menuselection:`Create Grid...`
     -
     -
     - :ref:`qgiscreategrid`
   * - :menuselection:`-->` |extractLayerExtent| :menuselection:`Extract Layer Extent...`
     -
     -
     - :ref:`qgispolygonfromlayerextent`
   * - :menuselection:`-->` |randomPointsWithinExtent| :menuselection:`Random Points in Extent...`
     -
     -
     - :ref:`qgisrandompointsinextent`
   * - :menuselection:`-->` |randomPointsInPolygons| :menuselection:`Random Points in Polygons...`
     -
     -
     - :ref:`qgisrandompointsinpolygons`
   * - :menuselection:`-->` |randomPointsOnLines| :menuselection:`Random Points on Lines...`
     -
     -
     - :ref:`qgisrandompointsonlines`
   * - :menuselection:`-->` |selectLocation| :menuselection:`Select by Location...`
     -
     -
     - :ref:`qgisselectbylocation`
   * - :menuselection:`-->` |selectDistance| :menuselection:`Select Within Distance...`
     -
     -
     - :ref:`qgisselectwithindistance`
   * - :menuselection:`-->` |randomPointsWithinExtent| :menuselection:`Random Points in Layer Bounds...`
     -
     -
     - :ref:`qgisrandompointsinlayerbounds`
   * - :menuselection:`-->` |randomPointsWithinPolygon| :menuselection:`Random Points Inside Polygons...`
     -
     -
     - :ref:`qgisrandompointsinsidepolygons`
   * - :menuselection:`-->` |selectRandom| :menuselection:`Random Selection...`
     -
     -
     - :ref:`qgisrandomselection`
   * - :menuselection:`-->` |selectRandom| :menuselection:`Random Selection Within Subsets...`
     -
     -
     - :ref:`qgisrandomselectionwithinsubsets`
   * - :menuselection:`-->` |regularPoints| :menuselection:`Regular Points...`
     -
     -
     - :ref:`qgisregularpoints`


By default, QGIS adds :ref:`Processing <sec_processing_intro>`
algorithms to the :guilabel:`Vector` menu, grouped by sub-menus.
This provides shortcuts for many common vector-based GIS tasks from
different providers.
If not all these sub-menus are available, enable the Processing plugin
in :menuselection:`Plugins --> Manage and Install Plugins...`.

Note that the list of algorithms and their menu can be modified/extended
with any Processing algorithms (read :ref:`processing.options`) or
some external :ref:`plugins <plugins>`.


Raster
------

This is what the :guilabel:`Raster` menu looks like if all core plugins
are enabled.


.. list-table:: The Raster menu items
   :header-rows: 1
   :widths: 40 15 8 38

   * - Menu Option
     - Shortcut
     - Toolbar
     - Reference
   * - |showRasterCalculator| :guilabel:`Raster calculator...`
     -
     -
     - :ref:`label_raster_calc`
   * - :guilabel:`Align Rasters...`
     -
     -
     - :ref:`qgisalignrasters`
   * - :menuselection:`Analysis -->`
     -
     -
     -
   * - :menuselection:`-->` |providerGdal| :menuselection:`Aspect...`
     -
     -
     - :ref:`gdalaspect`
   * - :menuselection:`-->` |providerGdal| :menuselection:`Fill nodata...`
     -
     -
     - :ref:`gdalfillnodata`
   * - :menuselection:`-->` |grid| :menuselection:`Grid (Moving Average)...`
     -
     -
     - :ref:`gdalgridaverage`
   * - :menuselection:`-->` |grid| :menuselection:`Grid (Data Metrics)...`
     -
     -
     - :ref:`gdalgriddatametrics`
   * - :menuselection:`-->` |grid| :menuselection:`Grid (Inverse Distance to a Power)...`
     -
     -
     - :ref:`gdalgridinversedistance`
   * - :menuselection:`-->` |grid| :menuselection:`Grid (Nearest Neighbor)...`
     -
     -
     - :ref:`gdalgridinversedistancenearestneighbor`
   * - :menuselection:`-->` |nearblack| :menuselection:`Near Black...`
     -
     -
     - :ref:`gdalnearblack`
   * - :menuselection:`-->` |providerGdal| :menuselection:`Hillshade...`
     -
     -
     - :ref:`gdalhillshade`
   * - :menuselection:`-->` |proximity| :menuselection:`Proximity (Raster Distance)...`
     -
     -
     - :ref:`gdalproximity`
   * - :menuselection:`-->` |providerGdal| :menuselection:`Roughness...`
     -
     -
     - :ref:`gdalroughness`
   * - :menuselection:`-->` |sieve| :menuselection:`Sieve...`
     -
     -
     - :ref:`gdalsieve`
   * - :menuselection:`-->` |providerGdal| :menuselection:`Slope...`
     -
     -
     - :ref:`gdalslope`
   * - :menuselection:`-->` |providerGdal| :menuselection:`Topographic Position Index (TPI)...`
     -
     -
     - :ref:`gdaltpitopographicpositionindex`
   * - :menuselection:`-->` |providerGdal| :menuselection:`Terrain Ruggedness Index (TRI)...`
     -
     -
     - :ref:`gdaltriterrainruggednessindex`
   * - :menuselection:`Projections -->`
     -
     -
     -
   * - :menuselection:`-->` |projectionAdd| :menuselection:`Assign Projection...`
     -
     -
     - :ref:`gdalassignprojection`
   * - :menuselection:`-->` |projectionExport| :menuselection:`Extract Projection...`
     -
     -
     - :ref:`gdalextractprojection`
   * - :menuselection:`-->` |warp| :menuselection:`Warp (Reproject)...`
     -
     -
     - :ref:`gdalwarpreproject`
   * - :menuselection:`Miscellaneous -->`
     -
     -
     -
   * - :menuselection:`-->` |vrt| :menuselection:`Build Virtual Raster...`
     -
     -
     - :ref:`gdalbuildvirtualraster`
   * - :menuselection:`-->` |rasterInfo| :menuselection:`Raster Information...`
     -
     -
     - :ref:`gdalgdalinfo`
   * - :menuselection:`-->` |merge| :menuselection:`Merge...`
     -
     -
     - :ref:`gdalmerge`
   * - :menuselection:`-->` |rasterOverview| :menuselection:`Build Overviews (Pyramids)...`
     -
     -
     - :ref:`gdaloverviews`
   * - :menuselection:`-->` |tiles| :menuselection:`Tile Index...`
     -
     -
     - :ref:`gdaltileindex`
   * - :menuselection:`Extraction -->`
     -
     -
     -
   * - :menuselection:`-->` |rasterClip| :menuselection:`Clip Raster by Extent...`
     -
     -
     - :ref:`gdalcliprasterbyextent`
   * - :menuselection:`-->` |rasterClip| :menuselection:`Clip Raster by Mask Layer...`
     -
     -
     - :ref:`gdalcliprasterbymasklayer`
   * - :menuselection:`-->` |contour| :menuselection:`Contour...`
     -
     -
     - :ref:`gdalcontour`
   * - :menuselection:`Conversion -->`
     -
     -
     -
   * - :menuselection:`-->` |8To24Bits| :menuselection:`PCT to RGB...`
     -
     -
     - :ref:`gdalpcttorgb`
   * - :menuselection:`-->` |polygonize| :menuselection:`Polygonize (Raster to Vector)...`
     -
     -
     - :ref:`gdalpolygonize`
   * - :menuselection:`-->` |rasterize| :menuselection:`Rasterize (Vector to Raster)...`
     -
     -
     - :ref:`gdalrasterize`
   * - :menuselection:`-->` |24To8Bits| :menuselection:`RGB to PCT...`
     -
     -
     - :ref:`gdalrgbtopct`
   * - :menuselection:`-->` |translate| :menuselection:`Translate (Convert Format)...`
     -
     -
     - :ref:`gdaltranslate`


By default, QGIS adds :ref:`Processing <sec_processing_intro>`
algorithms to the :guilabel:`Raster` menu, grouped by sub-menus.
This provides a shortcut for many common raster-based GIS tasks
from different providers.
If not all these sub-menus are available, enable the Processing
plugin in
:menuselection:`Plugins --> Manage and Install Plugins...`.

Note that the list of algorithms and their menu can be modified/extended
with any Processing algorithms (read :ref:`processing.options`) or
some external :ref:`plugins <plugins>`.


Database
--------

This is what the :guilabel:`Database` menu looks like if all the core
plugins are enabled.
If no database plugins are enabled, there will be no
:guilabel:`Database` menu.

.. list-table:: The Database menu items
   :header-rows: 1
   :widths: 40 15 15 30

   * - Menu Option
     - Shortcut
     - Toolbar
     - Reference
   * - :guilabel:`Offline editing...`
     - :kbd:`Alt+D` + :kbd:`O`
     -
     - :ref:`offlinedit`
   * - :menuselection:`-->`
       |offlineEditingCopy| :guilabel:`Convert to Offline Project...`
     -
     - :guilabel:`Database`
     - :ref:`offlinedit`
   * - :menuselection:`-->`
       |offlineEditingSync| :guilabel:`Synchronize`
     -
     - :guilabel:`Database`
     - :ref:`offlinedit`
   * - |dbManager| :guilabel:`DB Manager...`
     -
     - :guilabel:`Database`
     - :ref:`dbmanager`


When starting QGIS for the first time not all core plugins are loaded.


Web
---

This is what the :guilabel:`Web` menu looks like if all the core
plugins are enabled.
If no web plugins are enabled, there will be no :guilabel:`Web` menu.

.. list-table:: The Web menu items
   :header-rows: 1
   :widths: 30 15 15 40

   * - Menu Option
     - Shortcut
     - Toolbar
     - Reference
   * - :menuselection:`MetaSearch -->`
     - :kbd:`Alt+W` + :kbd:`M`
     -
     - :ref:`metasearch`
   * - :menuselection:`-->`
       |metasearch| :guilabel:`Metasearch`
     -
     - :guilabel:`Web`
     - :ref:`metasearch`
   * - :menuselection:`--> Help`
     -
     -
     - :ref:`metasearch`


When starting QGIS for the first time not all core plugins are loaded.


Mesh
----

The :menuselection:`Mesh` menu provides tools needed to manipulate
:ref:`mesh layers <label_meshdata>`.
Third-party plugins can add items to this menu.

.. list-table::  The Mesh menu items
   :header-rows: 1
   :widths: 40 15 15 30
   :stub-columns: 0

   * - Menu Option
     - Shortcut
     - Toolbar
     - Reference
   * - |showMeshCalculator| :menuselection:`Mesh Calculator...`
     -
     -
     - :ref:`mesh_calculator`
   * - |meshReindex| :menuselection:`Reindex Faces and Vertices`
     -
     -
     - :ref:`reindex_mesh`


Processing
----------

.. list-table:: The Processing menu items
   :header-rows: 1
   :widths: 30 20 10 40

   * - Menu Option
     - Shortcut
     - Toolbar
     - Reference
   * - |processingAlgorithm| :guilabel:`Toolbox`
     - :kbd:`Ctrl+Alt+T`
     -
     - :ref:`processing.toolbox`
   * - |processingModel| :guilabel:`Model Designer...`
     - :kbd:`Ctrl+Alt+G`
     -
     - :ref:`processing.modeler`
   * - |processingHistory| :guilabel:`History...`
     - :kbd:`Ctrl+Alt+H`
     -
     - :ref:`processing.history`
   * - |processingResult| :guilabel:`Results Viewer`
     - :kbd:`Ctrl+Alt+R`
     -
     - :ref:`processing.results`
   * - |processSelected| :guilabel:`Edit Features In-Place`
     -
     -
     - :ref:`processing_inplace_edit`

When starting QGIS for the first time not all core plugins are loaded.

Help
----

.. list-table:: The Help menu items
   :header-rows: 1
   :widths: 40 15 15 30

   * - Menu Option
     - Shortcut
     - Toolbar
     - Reference
   * - |helpContents| :guilabel:`Help Contents`
     - :kbd:`F1`
     - :guilabel:`Help`
     -
   * - :guilabel:`API Documentation`
     -
     -
     -
   * - :menuselection:`Plugins -->`
     -
     -
     -
   * - :guilabel:`Report an Issue`
     -
     -
     -
   * - :guilabel:`Need commercial support?`
     -
     -
     -
   * - |qgisHomePage| :guilabel:`QGIS Home Page`
     - :kbd:`Ctrl+H`
     -
     -
   * - |success| :guilabel:`Check QGIS Version`
     -
     -
     -
   * - |logo| :guilabel:`About`
     -
     -
     -
   * - |helpSponsors| :guilabel:`QGIS Sustaining Members`
     -
     -
     -


QGIS
-----

This menu is only available under |osx| macOS and contains some OS
related commands.

.. csv-table::  The QGIS menu items
   :header: "Menu Option", "Shortcut"
   :widths: auto

   ":guilabel:`Preferences`"
   ":guilabel:`About QGIS`"
   ":guilabel:`Hide QGIS`"
   ":guilabel:`Show All`"
   ":guilabel:`Hide Others`"
   ":guilabel:`Quit QGIS`", ":kbd:`Cmd+Q`"


:guilabel:`Preferences` corresponds to :menuselection:`Settings --> Options`,
:guilabel:`About QGIS` corresponds to :menuselection:`Help --> About`
and :guilabel:`Quit QGIS` corresponds to :menuselection:`Project --> Exit QGIS`
for other platforms.


.. _sec_panels_and_toolbars:

Panels and Toolbars
===================

From the :menuselection:`View` menu (or |kde| :menuselection:`Settings`),
you can switch QGIS widgets (:menuselection:`Panels -->`)
and toolbars (:menuselection:`Toolbars -->`) on and off.
To (de)activate any of them, right-click the menu bar or toolbar and
choose the item you want.
Panels and toolbars can be moved and placed wherever you like within
the QGIS interface.
The list can also be extended with the activation of :ref:`Core or
external plugins <plugins>`.


.. index:: Toolbars
.. _`label_toolbars`:

Toolbars
--------

The toolbars provide access to most of the functions in the
menus, plus additional tools for interacting with the map.
Each toolbar item has pop-up help available.
Hover your mouse over the item and a short description of the tool's
purpose will be displayed.

Available toolbars are:

.. csv-table:: QGIS Toolbars
   :header: "Toolbar name", "Main Reference for tools"
   :widths: auto

   ":guilabel:`Advanced Digitizing`", ":ref:`sec_advanced_edit`"
   ":guilabel:`Annotations`", ":ref:`sec_annotations`"
   ":guilabel:`Attributes`", ":ref:`sec_attribute_table`, :ref:`general_tools`"
   ":guilabel:`Data Source Manager`", ":ref:`manage_data_source`"
   ":guilabel:`Database`", ":ref:`dbmanager`"
   ":guilabel:`Digitizing`", ":ref:`sec_edit_existing_layer`"
   ":guilabel:`GPS`", ":ref:`sec_gpstracking`"
   ":guilabel:`GRASS`", ":ref:`sec_grass`"
   ":guilabel:`Help`"
   ":guilabel:`Label`", ":ref:`label_toolbar`"
   ":guilabel:`Manage Layers`", ":ref:`opening_data`"
   ":guilabel:`Map Navigation`", ":ref:`zoom_pan`"
   ":guilabel:`Mesh Digitizing`", ":ref:`editing_mesh`"
   ":guilabel:`Plugins`", ":ref:`plugins.index`"
   ":guilabel:`Project`", ":ref:`project_files`, :ref:`label_printlayout`, :ref:`vector_symbol_library`"
   ":guilabel:`Processing Algorithms`", ":ref:`processing.options`"
   ":guilabel:`Raster`", ":ref:`plugins.index`"
   ":guilabel:`Selection`",":ref:`sec_selection`"
   ":guilabel:`Shape digitizing`", ":ref:`shape_edit`"
   ":guilabel:`Snapping`",":ref:`snapping_tolerance`"
   ":guilabel:`Vector`", ":ref:`plugins.index`"
   ":guilabel:`Web`", ":ref:`plugins.index`, :ref:`metasearch`"

.. note:: Third-party plugins can extend the default toolbar with their own tools
 or provide their own toolbar.

.. index::
   single: Toolbars; Layout

.. tip:: **Restoring toolbars**

   If you have accidentally hidden a toolbar, you can get it
   back using :menuselection:`View --> Toolbars -->`
   (or |kde| :menuselection:`Settings --> Toolbars -->`).
   If, for some reason, a toolbar (or any other widget) totally
   disappears from the interface, you'll find tips to get it back at
   :ref:`restoring initial GUI <tip_restoring_configuration>`.


.. index:: Panels
.. _panels_tools:

Panels
------

QGIS provides many panels.
Panels are special widgets that you can interact with (selecting
options, checking boxes, filling values...) to perform more complex tasks.

Below is a list of the default panels provided by QGIS:

.. list-table:: QGIS Panels
   :header-rows: 1
   :widths: auto

   * - Panel name
     - Shortcut
     - Reference
   * - :guilabel:`Advanced Digitizing`
     - :kbd:`Ctrl+4`
     - :ref:`advanced_digitizing_panel`
   * - :guilabel:`Browser`
     - :kbd:`Ctrl+2`
     - :ref:`browser_panel`
   * - :guilabel:`Browser (2)`
     -
     - :ref:`browser_panel`
   * - :guilabel:`Debugging/Development Tools`
     - :kbd:`F12`
     - :ref:`debug_dev_tools`
   * - :guilabel:`Elevation Profile`
     -
     -
   * - :guilabel:`Geometry Validation`
     -
     - :ref:`digitizingmenu`
   * - :guilabel:`GPS Information`
     - :kbd:`Ctrl+0`
     - :ref:`sec_gpstracking`
   * - :guilabel:`GRASS Tools`
     -
     - :ref:`sec_grass`
   * - :guilabel:`Layer Order`
     - :kbd:`Ctrl+9`
     - :ref:`layer_order`
   * - :guilabel:`Layer Styling`
     - :kbd:`Ctrl+3`
     - :ref:`layer_styling_panel`
   * - :guilabel:`Layers`
     - :kbd:`Ctrl+1`
     - :ref:`label_legend`
   * - :guilabel:`Log Messages`
     -
     - :ref:`log_message_panel`
   * - :guilabel:`Overview`
     - :kbd:`Ctrl+8`
     - :ref:`overview_panels`
   * - :guilabel:`Processing Toolbox`
     -
     - :ref:`processing.toolbox`
   * - :guilabel:`Results Viewer`
     -
     - :ref:`processing.toolbox`
   * - :guilabel:`Snapping and Digitizing Options`
     -
     - :ref:`snapping_tolerance`
   * - :guilabel:`Spatial Bookmark Manager`
     - :kbd:`Ctrl+7`
     - :ref:`sec_bookmarks`
   * - :guilabel:`Statistics`
     - :kbd:`Ctrl+6`
     - :ref:`statistical_summary`
   * - :guilabel:`Temporal Controller`
     -
     - :ref:`temporal_controller`
   * - :guilabel:`Tile Scale`
     -
     - :ref:`tilesets`
   * - :guilabel:`Undo/Redo`
     - :kbd:`Ctrl+5`
     - :ref:`undo_redo_panel`
   * - :guilabel:`Vertex Editor`
     -
     - :ref:`vertex_editor_panel`


.. _`label_statusbar`:

Status Bar
==========

The status bar provides you with general information about the map
view and processed or available actions, and offers you tools to
manage the map view.

.. _`locator_bar`:

Locator bar
-----------

On the left side of the status bar, the locator bar, a quick search
widget, helps you find and run any feature or options in QGIS:

#. Click in the text widget to activate the locator search bar or press
   :kbd:`Ctrl+K`.
#. Type a text associated with the item you are looking for
   (name, tag, keyword, ...).
   By default, results are returned for the enabled locator filters, but
   you can limit the search to a certain scope by prefixing your text
   with the :ref:`locator filters <locator_options>` prefix,
   ie. typing ``l cad`` will return only the layers whose name contains ``cad``.

   The filter can also be selected with a double-click in the menu that shows
   when accessing the locator widget.

#. Click on a result to execute the corresponding action, depending on the type
   of item.

.. tip:: **Limit the lookup to particular field(s) of the active layer**

  By default, a search with the "active layer features" filter (``f``) runs
  through the whole attribute table of the layer. You can limit the search to
  a particular field using the ``@`` prefix. E.g., ``f @name sal`` or
  ``@name sal`` returns only the features whose "name" attribute contains 'sal'.
  Text autocompletion is active when writing and the suggestion can be applied
  using :kbd:`Tab` key.

  A more advanced control on the queried fields is possible from the layer
  :guilabel:`Fields` tab. Read :ref:`vector_fields_menu` for details.

Searching is handled using threads, so that results always become available as
quickly as possible, even if slow search filters are installed.
They also appear as soon as they are encountered by a
filter, which means that e.g. a file search filter will show results one by one
as the file tree is scanned. This ensures that the UI is always responsive, even
if a very slow search filter is present (e.g. one which uses an online service).

.. note:: The Nominatim locator tool may behave differently (no autocompletion
  search, delay of fetching results, ...) with respect to the OpenStreetMap
  Nominatim `usage policy <https://operations.osmfoundation.org/policies/nominatim/>`_.


.. tip:: **Quick access to the locator's configurations**

  Click on the |search| icon inside the locator widget on the status bar to
  display the list of filters you can use and a :guilabel:`Configure` entry that
  opens the :guilabel:`Locator` tab of the :menuselection:`Settings -->
  Options...` menu.


Reporting actions
-----------------

In the area next to the locator bar, a summary of actions you've
carried out will be shown when needed  (such as selecting features in
a layer, removing layer, pan distance and direction) or a long description of the tool you are
hovering over (not available for all tools).

In case of lengthy operations, such as gathering of statistics in
raster layers, executing Processing algorithms or rendering several
layers in the map view, a progress bar is displayed in the status bar.

Control the map canvas
----------------------

The |tracking| :guilabel:`Coordinate` option shows the current
position of the mouse, following it while moving across the map view.
You can set the units (and precision) in the
:menuselection:`Project --> Properties... --> General` tab.
Click on the small button at the left of the textbox to toggle between
the Coordinate option and the |extents| :guilabel:`Extents` option
that displays the coordinates of the current bottom-left and top-right
corners of the map view in map units.

Next to the coordinate display you will find the :guilabel:`Scale` display.
It shows the scale of the map view. There is a scale selector, which
allows you to choose between
:ref:`predefined and custom scales <predefinedscales>`.

.. index:: Magnification
.. _magnifier:

On the right side of the scale display, press the |lockedGray| button
to lock the scale to use the magnifier to zoom in or out.
The magnifier allows you to zoom in to a map without altering the map
scale, making it easier to tweak the positions of labels and symbols
accurately.
The magnification level is expressed as a percentage.
If the :guilabel:`Magnifier` has a level of 100%, then the current map
is not magnified, i.e. is rendered at accurate scale relative to the monitor's resolution (DPI).
A default magnification value can be defined within
:menuselection:`Settings --> Options --> Rendering --> Rendering Behavior`,
which is very useful for high-resolution screens to enlarge small
symbols. In addition, a setting in :menuselection:`Settings --> Options --> Canvas & Legend --> DPI` 
controls whether QGIS respects each monitor's physical DPI or uses the overall system logical DPI.

To the right of the magnifier tool you can define a current clockwise
rotation for your map view in degrees.

On the right side of the status bar, the |checkbox| :guilabel:`Render`
checkbox can be used to temporarily suspend the map view rendering
(see section :ref:`redraw_events`).

To the right of the |checkbox| :guilabel:`Render` function, you find the
|projectionEnabled| :guilabel:`EPSG:code` button showing the current project CRS.
Clicking on this opens the :guilabel:`Project Properties` dialog and lets you
reproject the map view or adjust any other project property.

.. index::
   single: Scale calculate

.. tip::
   **Calculating the Correct Scale of Your Map Canvas**

   When you start QGIS, the default CRS is ``WGS 84 (EPSG 4326)`` and
   units are degrees. This means that QGIS will interpret any
   coordinate in your layer as specified in degrees.
   To get correct scale values, you can either manually change this
   setting in the :guilabel:`General` tab under
   :menuselection:`Project --> Properties...` (e.g. to meters), or you
   can use the |projectionEnabled| :sup:`EPSG:code` icon seen above.
   In the latter case, the units are set to what the project projection
   specifies (e.g., ``+units=us-ft``).

   Note that CRS choice on startup can be set in
   :menuselection:`Settings --> Options --> CRS Handling`.

Messaging
---------

The |messageLog| :sup:`Messages` button next to it opens the
:guilabel:`Log Messages Panel` which has information on underlying
processes (QGIS startup, plugins loading, processing tools...)


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |24To8Bits| image:: /static/common/24-to-8-bits.png
   :width: 1.5em
.. |8To24Bits| image:: /static/common/8-to-24-bits.png
   :width: 1.5em
.. |addAfsLayer| image:: /static/common/mActionAddAfsLayer.png
   :width: 1.5em
.. |addAllToOverview| image:: /static/common/mActionAddAllToOverview.png
   :width: 1.5em
.. |addDelimitedTextLayer| image:: /static/common/mActionAddDelimitedTextLayer.png
   :width: 1.5em
.. |addGeometryAttributes| image:: /static/common/mAlgorithmAddGeometryAttributes.png
   :width: 1.5em
.. |addGpsLayer| image:: /static/common/mActionAddGpsLayer.png
   :width: 1.5em
.. |addGrid| image:: /static/common/add_grid.png
   :width: 1.5em
.. |addHanaLayer| image:: /static/common/mActionAddHanaLayer.png
   :width: 1.5em
.. |addImage| image:: /static/common/mActionAddImage.png
   :width: 1.5em
.. |addMap| image:: /static/common/mActionAddMap.png
   :width: 1.5em
.. |addMeshLayer| image:: /static/common/mActionAddMeshLayer.png
   :width: 1.5em
.. |addMssqlLayer| image:: /static/common/mActionAddMssqlLayer.png
   :width: 1.5em
.. |addOgrLayer| image:: /static/common/mActionAddOgrLayer.png
   :width: 1.5em
.. |addOracleLayer| image:: /static/common/mActionAddOracleLayer.png
   :width: 1.5em
.. |addPart| image:: /static/common/mActionAddPart.png
   :width: 1.5em
.. |addPointCloudLayer| image:: /static/common/mActionAddPointCloudLayer.png
   :width: 1.5em
.. |addPostgisLayer| image:: /static/common/mActionAddPostgisLayer.png
   :width: 1.5em
.. |addRasterLayer| image:: /static/common/mActionAddRasterLayer.png
   :width: 1.5em
.. |addRing| image:: /static/common/mActionAddRing.png
   :width: 2em
.. |addSpatiaLiteLayer| image:: /static/common/mActionAddSpatiaLiteLayer.png
   :width: 1.5em
.. |addVectorTileLayer| image:: /static/common/mActionAddVectorTileLayer.png
   :width: 1.5em
.. |addVirtualLayer| image:: /static/common/mActionAddVirtualLayer.png
   :width: 1.5em
.. |addWcsLayer| image:: /static/common/mActionAddWcsLayer.png
   :width: 1.5em
.. |addWfsLayer| image:: /static/common/mActionAddWfsLayer.png
   :width: 1.5em
.. |addWmsLayer| image:: /static/common/mActionAddWmsLayer.png
   :width: 1.5em
.. |addXyzLayer| image:: /static/common/mActionAddXyzLayer.png
   :width: 1.5em
.. |allEdits| image:: /static/common/mActionAllEdits.png
   :width: 1.5em
.. |basicStatistics| image:: /static/common/mAlgorithmBasicStatistics.png
   :width: 1.5em
.. |buffer| image:: /static/common/mAlgorithmBuffer.png
   :width: 1.5em
.. |captureLine| image:: /static/common/mActionCaptureLine.png
   :width: 1.5em
.. |capturePoint| image:: /static/common/mActionCapturePoint.png
   :width: 1.5em
.. |capturePolygon| image:: /static/common/mActionCapturePolygon.png
   :width: 1.5em
.. |centroids| image:: /static/common/mAlgorithmCentroids.png
   :width: 1.5em
.. |checkGeometry| image:: /static/common/mAlgorithmCheckGeometry.png
   :width: 1.5em
.. |checkbox| image:: /static/common/checkbox.png
   :width: 1.3em
.. |circle2Points| image:: /static/common/mActionCircle2Points.png
   :width: 1.5em
.. |circle2TangentsPoint| image:: /static/common/mActionCircle2TangentsPoint.png
   :width: 1.5em
.. |circle3Points| image:: /static/common/mActionCircle3Points.png
   :width: 1.5em
.. |circle3Tangents| image:: /static/common/mActionCircle3Tangents.png
   :width: 1.5em
.. |circleCenterPoint| image:: /static/common/mActionCircleCenterPoint.png
   :width: 1.5em
.. |circularStringCurvePoint| image:: /static/common/mActionCircularStringCurvePoint.png
   :width: 1.5em
.. |circularStringRadius| image:: /static/common/mActionCircularStringRadius.png
   :width: 1.5em
.. |clip| image:: /static/common/mAlgorithmClip.png
   :width: 1.5em
.. |collect| image:: /static/common/mAlgorithmCollect.png
   :width: 1.5em
.. |contour| image:: /static/common/contour.png
   :width: 1.5em
.. |convexHull| image:: /static/common/mAlgorithmConvexHull.png
   :width: 1.5em
.. |copyrightLabel| image:: /static/common/copyright_label.png
   :width: 1.5em
.. |createGrid| image:: /static/common/mAlgorithmCreateGrid.png
   :width: 1.5em
.. |createMemory| image:: /static/common/mActionCreateMemory.png
   :width: 1.5em
.. |customProjection| image:: /static/common/mActionCustomProjection.png
   :width: 1.5em
.. |dataSourceManager| image:: /static/common/mActionDataSourceManager.png
   :width: 1.5em
.. |dbManager| image:: /static/common/dbmanager.png
   :width: 1.5em
.. |delaunay| image:: /static/common/mAlgorithmDelaunay.png
   :width: 1.5em
.. |deletePart| image:: /static/common/mActionDeletePart.png
   :width: 2em
.. |deleteRing| image:: /static/common/mActionDeleteRing.png
   :width: 2em
.. |deleteSelectedFeatures| image:: /static/common/mActionDeleteSelectedFeatures.png
   :width: 1.5em
.. |deselectActiveLayer| image:: /static/common/mActionDeselectActiveLayer.png
   :width: 1.5em
.. |deselectAll| image:: /static/common/mActionDeselectAll.png
   :width: 1.5em
.. |difference| image:: /static/common/mAlgorithmDifference.png
   :width: 1.5em
.. |dissolve| image:: /static/common/mAlgorithmDissolve.png
   :width: 1.5em
.. |distanceMatrix| image:: /static/common/mAlgorithmDistanceMatrix.png
   :width: 1.5em
.. |duplicateLayer| image:: /static/common/mActionDuplicateLayer.png
   :width: 1.5em
.. |editCopy| image:: /static/common/mActionEditCopy.png
   :width: 1.5em
.. |editCut| image:: /static/common/mActionEditCut.png
   :width: 1.5em
.. |editPaste| image:: /static/common/mActionEditPaste.png
   :width: 1.5em
.. |ellipseCenter2Points| image:: /static/common/mActionEllipseCenter2Points.png
   :width: 1.5em
.. |ellipseCenterPoint| image:: /static/common/mActionEllipseCenterPoint.png
   :width: 1.5em
.. |ellipseExtent| image:: /static/common/mActionEllipseExtent.png
   :width: 1.5em
.. |ellipseFoci| image:: /static/common/mActionEllipseFoci.png
   :width: 1.5em
.. |expressionSelect| image:: /static/common/mIconExpressionSelect.png
   :width: 1.5em
.. |extents| image:: /static/common/extents.png
   :width: 1.5em
.. |extractLayerExtent| image:: /static/common/mAlgorithmExtractLayerExtent.png
   :width: 1.5em
.. |extractVertices| image:: /static/common/mAlgorithmExtractVertices.png
   :width: 1.5em
.. |fileExit| image:: /static/common/mActionFileExit.png
.. |fileNew| image:: /static/common/mActionFileNew.png
   :width: 1.5em
.. |fileOpen| image:: /static/common/mActionFileOpen.png
   :width: 1.5em
.. |fileSave| image:: /static/common/mActionFileSave.png
   :width: 1.5em
.. |fileSaveAs| image:: /static/common/mActionFileSaveAs.png
   :width: 1.5em
.. |fillRing| image:: /static/common/mActionFillRing.png
   :width: 1.5em
.. |formAnnotation| image:: /static/common/mActionFormAnnotation.png
   :width: 1.5em
.. |formSelect| image:: /static/common/mIconFormSelect.png
   :width: 1.5em
.. |geometryChecker| image:: /static/common/geometrychecker.png
   :width: 1.5em
.. |georefRun| image:: /static/common/mGeorefRun.png
   :width: 1.5em
.. |grid| image:: /static/common/grid.png
   :width: 1.5em
.. |helpContents| image:: /static/common/mActionHelpContents.png
   :width: 1.5em
.. |helpSponsors| image:: /static/common/mActionHelpSponsors.png
   :width: 1.5em
.. |hideAllLayers| image:: /static/common/mActionHideAllLayers.png
   :width: 1.5em
.. |hideDeselectedLayers| image:: /static/common/mActionHideDeselectedLayers.png
   :width: 1.5em
.. |hideSelectedLayers| image:: /static/common/mActionHideSelectedLayers.png
   :width: 1.5em
.. |htmlAnnotation| image:: /static/common/mActionHtmlAnnotation.png
   :width: 1.5em
.. |identify| image:: /static/common/mActionIdentify.png
   :width: 1.5em
.. |inOverview| image:: /static/common/mActionInOverview.png
   :width: 1.5em
.. |interfaceCustomization| image:: /static/common/mActionInterfaceCustomization.png
   :width: 1.5em
.. |intersect| image:: /static/common/mAlgorithmIntersect.png
   :width: 1.5em
.. |invertSelection| image:: /static/common/mActionInvertSelection.png
   :width: 1.5em
.. |kde| image:: /static/common/kde.png
   :width: 1.5em
.. |keyboardShortcuts| image:: /static/common/mActionKeyboardShortcuts.png
   :width: 1.5em
.. |labelingSingle| image:: /static/common/labelingSingle.png
   :width: 1.5em
.. |layoutManager| image:: /static/common/mActionLayoutManager.png
   :width: 1.5em
.. |lineIntersections| image:: /static/common/mAlgorithmLineIntersections.png
   :width: 1.5em
.. |lineToPolygon| image:: /static/common/mAlgorithmLineToPolygon.png
   :width: 1.5em
.. |lockedGray| image:: /static/common/lockedGray.png
   :width: 1.2em
.. |logo| image:: /static/common/logo.png
   :width: 1.5em
.. |mapTips| image:: /static/common/mActionMapTips.png
   :width: 1.5em
.. |meanCoordinates| image:: /static/common/mAlgorithmMeanCoordinates.png
   :width: 1.5em
.. |measure| image:: /static/common/mActionMeasure.png
   :width: 1.5em
.. |measureAngle| image:: /static/common/mActionMeasureAngle.png
   :width: 1.5em
.. |measureArea| image:: /static/common/mActionMeasureArea.png
   :width: 1.5em
.. |measureBearing| image:: /static/common/mActionMeasureBearing.png
   :width: 1.5em
.. |merge| image:: /static/common/merge.png
   :width: 1.5em
.. |mergeFeatureAttributes| image:: /static/common/mActionMergeFeatureAttributes.png
   :width: 1.5em
.. |mergeFeatures| image:: /static/common/mActionMergeFeatures.png
   :width: 1.5em
.. |mergeLayers| image:: /static/common/mAlgorithmMergeLayers.png
   :width: 1.5em
.. |meshReindex| image:: /static/common/mActionMeshReindex.png
   :width: 1.5em
.. |messageLog| image:: /static/common/mMessageLog.png
   :width: 1.5em
.. |metasearch| image:: /static/common/MetaSearch.png
   :width: 1.5em
.. |moveFeature| image:: /static/common/mActionMoveFeature.png
   :width: 1.5em
.. |moveFeatureCopy| image:: /static/common/mActionMoveFeatureCopy.png
   :width: 1.5em
.. |moveFeatureCopyLine| image:: /static/common/mActionMoveFeatureCopyLine.png
   :width: 1.5em
.. |moveFeatureCopyPoint| image:: /static/common/mActionMoveFeatureCopyPoint.png
   :width: 1.5em
.. |moveFeatureLine| image:: /static/common/mActionMoveFeatureLine.png
   :width: 1.5em
.. |moveFeaturePoint| image:: /static/common/mActionMoveFeaturePoint.png
   :width: 1.5em
.. |multiEdit| image:: /static/common/mActionMultiEdit.png
   :width: 1.5em
.. |multiToSingle| image:: /static/common/mAlgorithmMultiToSingle.png
   :width: 1.5em
.. |nearblack| image:: /static/common/nearblack.png
   :width: 1.5em
.. |nearestNeighbour| image:: /static/common/mAlgorithmNearestNeighbour.png
   :width: 1.5em
.. |new3DMap| image:: /static/common/mActionNew3DMap.png
   :width: 1.5em
.. |newBookmark| image:: /static/common/mActionNewBookmark.png
   :width: 1.5em
.. |newElevationProfile| image:: /static/common/mActionNewElevationProfile.png
   :width: 1.5em
.. |newGeoPackageLayer| image:: /static/common/mActionNewGeoPackageLayer.png
   :width: 1.5em
.. |newGpx| image:: /static/common/mActionNewGpx.png
   :width: 1.5em
.. |newLayout| image:: /static/common/mActionNewLayout.png
   :width: 1.5em
.. |newMap| image:: /static/common/mActionNewMap.png
   :width: 1.5em
.. |newMeshLayer| image:: /static/common/mActionNewMeshLayer.png
   :width: 1.5em
.. |newReport| image:: /static/common/mActionNewReport.png
   :width: 1.5em
.. |newSpatiaLiteLayer| image:: /static/common/mActionNewSpatiaLiteLayer.png
   :width: 1.5em
.. |newTableRow| image:: /static/common/mActionNewTableRow.png
   :width: 1.5em
.. |newVectorLayer| image:: /static/common/mActionNewVectorLayer.png
   :width: 1.5em
.. |newVirtualLayer| image:: /static/common/mActionNewVirtualLayer.png
   :width: 1.5em
.. |northArrow| image:: /static/common/north_arrow.png
   :width: 1.5em
.. |offlineEditingCopy| image:: /static/common/offline_editing_copy.png
   :width: 1.5em
.. |offlineEditingSync| image:: /static/common/offline_editing_sync.png
   :width: 1.5em
.. |offsetCurve| image:: /static/common/mActionOffsetCurve.png
   :width: 1.5em
.. |offsetPointSymbols| image:: /static/common/mActionOffsetPointSymbols.png
   :width: 1.5em
.. |openTable| image:: /static/common/mActionOpenTable.png
   :width: 1.5em
.. |openTableEdited| image:: /static/common/mActionOpenTableEdited.png
   :width: 1.5em
.. |openTableSelected| image:: /static/common/mActionOpenTableSelected.png
   :width: 1.5em
.. |openTableVisible| image:: /static/common/mActionOpenTableVisible.png
   :width: 1.5em
.. |options| image:: /static/common/mActionOptions.png
   :width: 1em
.. |osx| image:: /static/common/osx.png
   :width: 1em
.. |pan| image:: /static/common/mActionPan.png
   :width: 1.5em
.. |panToSelected| image:: /static/common/mActionPanToSelected.png
   :width: 1.5em
.. |polygonToLine| image:: /static/common/mAlgorithmPolygonToLine.png
   :width: 1.5em
.. |polygonize| image:: /static/common/polygonize.png
   :width: 1.5em
.. |processSelected| image:: /static/common/mActionProcessSelected.png
   :width: 1.5em
.. |processingAlgorithm| image:: /static/common/processingAlgorithm.png
   :width: 1.5em
.. |processingHistory| image:: /static/common/history.png
   :width: 1.5em
.. |processingModel| image:: /static/common/processingModel.png
   :width: 1.5em
.. |processingResult| image:: /static/common/processingResult.png
   :width: 1.5em
.. |projectProperties| image:: /static/common/mActionProjectProperties.png
   :width: 1.5em
.. |projectionAdd| image:: /static/common/projection-add.png
   :width: 1.5em
.. |projectionEnabled| image:: /static/common/mIconProjectionEnabled.png
   :width: 1.5em
.. |projectionExport| image:: /static/common/projection-export.png
   :width: 1.5em
.. |providerGdal| image:: /static/common/providerGdal.png
   :width: 1.5em
.. |proximity| image:: /static/common/proximity.png
   :width: 1.5em
.. |pythonFile| image:: /static/common/mIconPythonFile.png
   :width: 1.5em
.. |qgisHomePage| image:: /static/common/mActionQgisHomePage.png
   :width: 1.5em
.. |randomPointsInPolygons| image:: /static/common/mAlgorithmRandomPointsInPolygons.png
   :width: 1.5em
.. |randomPointsOnLines| image:: /static/common/mAlgorithmRandomPointsOnLines.png
   :width: 1.5em
.. |randomPointsWithinExtent| image:: /static/common/mAlgorithmRandomPointsWithinExtent.png
   :width: 1.5em
.. |randomPointsWithinPolygon| image:: /static/common/mAlgorithmRandomPointsWithinPolygon.png
   :width: 1.5em
.. |rasterClip| image:: /static/common/raster-clip.png
   :width: 1.5em
.. |rasterInfo| image:: /static/common/raster-info.png
   :width: 1.5em
.. |rasterOverview| image:: /static/common/raster-overview.png
   :width: 1.5em
.. |rasterize| image:: /static/common/rasterize.png
   :width: 1.5em
.. |rectangle3PointsDistance| image:: /static/common/mActionRectangle3PointsDistance.png
   :width: 1.5em
.. |rectangle3PointsProjected| image:: /static/common/mActionRectangle3PointsProjected.png
   :width: 1.5em
.. |rectangleCenter| image:: /static/common/mActionRectangleCenter.png
   :width: 1.5em
.. |rectangleExtent| image:: /static/common/mActionRectangleExtent.png
   :width: 1.5em
.. |redo| image:: /static/common/mActionRedo.png
   :width: 1.5em
.. |refresh| image:: /static/common/mActionRefresh.png
   :width: 1.5em
.. |regularPoints| image:: /static/common/mAlgorithmRegularPoints.png
   :width: 1.5em
.. |regularPolygon2Points| image:: /static/common/mActionRegularPolygon2Points.png
   :width: 1.5em
.. |regularPolygonCenterCorner| image:: /static/common/mActionRegularPolygonCenterCorner.png
   :width: 1.5em
.. |regularPolygonCenterPoint| image:: /static/common/mActionRegularPolygonCenterPoint.png
   :width: 1.5em
.. |removeAllFromOverview| image:: /static/common/mActionRemoveAllFromOverview.png
   :width: 1.5em
.. |removeLayer| image:: /static/common/mActionRemoveLayer.png
   :width: 1.5em
.. |reshape| image:: /static/common/mActionReshape.png
   :width: 1.5em
.. |reverseLine| image:: /static/common/mActionReverseLine.png
   :width: 1.5em
.. |rotateFeature| image:: /static/common/mActionRotateFeature.png
   :width: 1.5em
.. |rotatePointSymbols| image:: /static/common/mActionRotatePointSymbols.png
   :width: 1.5em
.. |saveAsPDF| image:: /static/common/mActionSaveAsPDF.png
   :width: 1.5em
.. |saveMapAsImage| image:: /static/common/mActionSaveMapAsImage.png
   :width: 1.5em
.. |scaleBar| image:: /static/common/mActionScaleBar.png
   :width: 1.5em
.. |scaleFeature| image:: /static/common/mActionScaleFeature.png
   :width: 1.5em
.. |search| image:: /static/common/search.png
   :width: 1.5em
.. |selectAll| image:: /static/common/mActionSelectAll.png
   :width: 1.5em
.. |selectDistance| image:: /static/common/mAlgorithmSelectDistance.png
   :width: 1.5em
.. |selectFreehand| image:: /static/common/mActionSelectFreehand.png
   :width: 1.5em
.. |selectLocation| image:: /static/common/mAlgorithmSelectLocation.png
   :width: 1.5em
.. |selectPolygon| image:: /static/common/mActionSelectPolygon.png
   :width: 1.5em
.. |selectRadius| image:: /static/common/mActionSelectRadius.png
   :width: 1.5em
.. |selectRandom| image:: /static/common/mAlgorithmSelectRandom.png
   :width: 1.5em
.. |selectRectangle| image:: /static/common/mActionSelectRectangle.png
   :width: 1.5em
.. |showAllLayers| image:: /static/common/mActionShowAllLayers.png
   :width: 1.5em
.. |showBookmarks| image:: /static/common/mActionShowBookmarks.png
   :width: 1.5em
.. |showMeshCalculator| image:: /static/common/mActionShowMeshCalculator.png
   :width: 1.5em
.. |showPluginManager| image:: /static/common/mActionShowPluginManager.png
   :width: 1.5em
.. |showRasterCalculator| image:: /static/common/mActionShowRasterCalculator.png
   :width: 1.5em
.. |showSelectedLayers| image:: /static/common/mActionShowSelectedLayers.png
   :width: 1.5em
.. |sieve| image:: /static/common/sieve.png
   :width: 1.5em
.. |simplify| image:: /static/common/mActionSimplify.png
   :width: 1.5em
.. |simplify_2| image:: /static/common/mAlgorithmSimplify.png
   :width: 1.5em
.. |splitFeatures| image:: /static/common/mActionSplitFeatures.png
   :width: 1.5em
.. |splitLayer| image:: /static/common/mAlgorithmSplitLayer.png
   :width: 1.5em
.. |splitParts| image:: /static/common/mActionSplitParts.png
   :width: 1.5em
.. |styleManager| image:: /static/common/mActionStyleManager.png
   :width: 1.5em
.. |success| image:: /static/common/mIconSuccess.png
   :width: 1em
.. |sum| image:: /static/common/mActionSum.png
   :width: 1.2em
.. |sumLengthLines| image:: /static/common/mAlgorithmSumLengthLines.png
   :width: 1.5em
.. |sumPoints| image:: /static/common/mAlgorithmSumPoints.png
   :width: 1.5em
.. |svgAnnotation| image:: /static/common/mActionSvgAnnotation.png
   :width: 1.5em
.. |symmetricalDifference| image:: /static/common/mAlgorithmSymmetricalDifference.png
   :width: 1.5em
.. |textAnnotation| image:: /static/common/mActionTextAnnotation.png
   :width: 1.5em
.. |tiles| image:: /static/common/tiles.png
   :width: 1.5em
.. |titleLabel| image:: /static/common/title_label.png
   :width: 1.5em
.. |toggleEditing| image:: /static/common/mActionToggleEditing.png
   :width: 1.5em
.. |toggleSelectedLayers| image:: /static/common/mActionToggleSelectedLayers.png
   :width: 1.5em
.. |topologyChecker| image:: /static/common/mActionTopologyChecker.png
   :width: 1.5em
.. |tracking| image:: /static/common/tracking.png
   :width: 1.5em
.. |translate| image:: /static/common/translate.png
   :width: 1.5em
.. |trimExtend| image:: /static/common/mActionTrimExtend.png
   :width: 1.5em
.. |undo| image:: /static/common/mActionUndo.png
   :width: 1.5em
.. |union| image:: /static/common/mAlgorithmUnion.png
   :width: 1.5em
.. |uniqueValues| image:: /static/common/mAlgorithmUniqueValues.png
   :width: 1.5em
.. |vertexTool| image:: /static/common/mActionVertexTool.png
   :width: 1.5em
.. |vertexToolActiveLayer| image:: /static/common/mActionVertexToolActiveLayer.png
   :width: 1.5em
.. |voronoi| image:: /static/common/mAlgorithmVoronoi.png
   :width: 1.5em
.. |vrt| image:: /static/common/vrt.png
   :width: 1.5em
.. |warp| image:: /static/common/warp.png
   :width: 1.5em
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
