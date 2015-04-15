|updatedisclaimer|

.. _qgis.documentation.whatsnew:

****************************
What's new in |qg| |CURRENT|
****************************

This release contains new features and extends the programmatic
interface over previous versions. We recommend that you use this version over
previous releases.

This release includes hundreds of bug fixes and many new features and
enhancements that will be described in this manual. You may also
review the visual changelog at
http://changelog.linfiniti.com/qgis/version/2.8/.


Application 
-----------

* **Map rotation**: A map rotation can be set in degrees from the status bar
* **Bookmarks**: You can share and transfer your bookmarks 
* **Expressions**:
  * when editing attributes in the attribute table or forms, you can now enter expressions
    directly into spin boxes
  * the expression widget is extended to include a function editor where you are able to
    create your own Python custom functions in a comfortable way
  * in any spinbox of the style menu you can enter expressions and evaluate them immediately
  * a get and transform geometry function was added for using expressions
  * a comment functionality was inserted if for example you want to work with data defined labeling
* **Joins**: You can specify a custom prefix for joins
* **Layer Legend**: Show rule-based renderer's legend as a tree
* **DB Manager**: Run only the selected part of a SQL query
* **Attribute Table**: support for calculations on selected rows through a 'Update Selected' button
* **Measure Tools**: change measurement units possible

Data Providers 
--------------

* **DXF Export tool improvements**: Improved marker symbol export
* **WMS Layers**: Support for contextual WMS legend graphics
* **Temporary Scratch Layers**: It is possible to create empty editable memory layers

Digitizing
----------

* **Advanced Digitizing**:
  * digitise lines exactly parallel or at right angles, lock lines
    to specific angles and so on with the advanced digitizing panel (CAD-like features)
  * simplify tool: specify with exact tolerance, simplify multiple features at once ...
* **Snapping Options**: new snapping mode 'Snap to all layers'

Map Composer 
------------
  
* **Composer GUI improvements**: hide bounding boxes, full screen mode for composer
  toggle display of panels
* **Grid improvements**: You now have finer control of frame and annotation display
* **Label item margins**: You can now control both horizontal and vertical margins
  for label items. You can now specify negative margins for label items.
* optionally store layer styles

   
Plugins
-------

* **Python Console**: You can now drag and drop python scripts into the |qg| window

QGIS Server 
-----------

* Python plugin support

Symbology 
---------
 
* live heatmap renderer creates dynamic heatmaps from point layers
* raster image symbol fill type
* more data-defined symbology settings: the data-defined option was moved next to
  each data definable property
* support for multiple styles per map layer, optionally store layer styles

User Interface 
--------------

* **Projection**: Improved/consistent projection selection. All dialogs now use a consistent
  projection selection widget, which allows for quickly selecting from recently used and standard
  project/|qg| projections


