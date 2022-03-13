.. index:: Image, Picture, Layout; Image item, Layout; North arrow

The Marker, Picture and North Arrow Items
======================================================================

.. only:: html

.. contents::
   :local:

Along with the map or legend items in the print layout, you may want to
decorate your realization with images or annotations.
QGIS provides different tools to achieve this:

* the :ref:`picture item <layout_picture_item>`: decorates the layout with
  an image raster or SVG file (e.g. logos, pictures, north arrows, ...)
* the :ref:`north arrow item <layout_northarrow_item>`: a picture item
  predefined with a north arrow image
* the :ref:`marker item <layout_marker_item>`: decorates the layout with
  QGIS vector :ref:`symbols <symbol-selector>`. It can be used to place
  markers over a map item or for creation of advanced custom legends.

.. _layout_picture_item:

The Picture Item
----------------

You can add a picture by dragging it from your file manager onto the
canvas, pasting it directly into the layout by using :kbd:`Ctrl+V` or
:menuselection:`Edit --> Paste` and by using the |addImage| :sup:`Add Picture`,
following :ref:`items creation instructions <create_layout_item>`.
Then you can manipulate it, as explained in
:ref:`interact_layout_item`.

.. index:: Picture database, Rotated north arrow

When using |addImage| :sup:`Add Picture`, the picture item will be a
blank frame that you can customize using its
:guilabel:`Item Properties` panel.
Other than the :ref:`items common properties <item_common_properties>`,
this feature has the following functionalities:

Main properties
...............

.. _figure_layout_image:

.. figure:: img/picture_mainproperties.png
   :align: center

   Picture Item Properties panel

The picture item supports two types of images:

* :guilabel:`Raster Image`: a file selector widget can be used to fetch
  the data. Use the :guilabel:`...` :sup:`Browse` button to select a file
  on your computer or enter the path directly in the text field.
  You can even provide a remote URL that points to a picture.
  The associated image can also be :ref:`embedded <embedded_file_selector>`
  in the layout.

  Use the |dataDefine| :sup:`data defined override` button to set
  the image source from a feature attribute or using a regular expression.
* :guilabel:`SVG Image`: using by default the SVG libraries provided in
  :menuselection:`Settings --> Options --> System --> SVG Paths`.
  You can however use any other file, and the file selection follows the same
  rules as for the raster image. The SVG parameters can as well be set dynamic.

  .. _parameterized_svg:

  The QGIS provided (default) :file:`.SVG` files are customizable,
  meaning that you can easily apply other :guilabel:`Fill color`,
  :guilabel:`Stroke color` (including opacity) and
  :guilabel:`Stroke width` than the original, using their
  corresponding feature in the :guilabel:`SVG Parameters` group.
  These properties can also be :ref:`data-defined <data_defined>`.

  If you add an :file:`.SVG` file that does not enable these properties,
  you may need to add the following tags to the file in order to add
  support e.g. for transparency:

  * `fill-opacity="param(fill-opacity)"`
  * `stroke-opacity="param(outline-opacity)"`

  More details at :ref:`svg_symbol`.

.. note:: Drag-and-drop an image file (raster or SVG) into the layout page
 will create a layout picture item with corresponding settings.


Size and placement
...................

.. _figure_layout_picture_sizeplacement:

.. figure:: img/picture_sizeplacement.png
   :align: center

   Layout pictures size and placement properties

With the :guilabel:`Resize mode` option, you can set how the image is
displayed when the frame is resized:

* ``Zoom``: enlarges/reduces the image to the frame while maintaining
  the aspect ratio of picture
* ``Stretch``: stretches the image to fit inside the frame
* ``Clip``: use this mode for raster images only, it sets the size of
  the image to the original image size without scaling, and the frame
  is used to clip the image.
  So only the part of the image that is inside the frame will be
  visible.
* ``Zoom and resize frame``: enlarges the image to fit the frame, and
  then resizes frame to fit the resulting image dimensions
* ``Resize frame to image size``: sets the size of the frame to match
  the original size of the image (no scaling)

Depending on the selected :guilabel:`Resize mode`, the
:guilabel:`Placement` and :guilabel:`Image rotation` options may be
disabled.
:guilabel:`Placement` lets you select the position of the image
inside its frame (top/middle/bottom and left/center/right).

.. _layout_images_rotation:

Image rotation
...............

Images can be rotated with the :guilabel:`Image rotation` field.
Activating the |checkbox| :guilabel:`Sync with map` checkbox
synchronizes the rotation of the image with the rotation applied to the
selected map item.
This is a convenient feature to make any picture behave as a north arrow.
The :guilabel:`North alignment` can be:

* **Grid north**: the direction of a grid line which is parallel to
  the central meridian of the national/local grid
* **True north**: direction of a meridian of longitude.

You can also apply a declination :guilabel:`Offset` to the picture rotation.

.. _figure_layout_picture_imagerotation:

.. figure:: img/picture_imagerotation.png
   :align: center

   Layout pictures image rotation properties


.. index:: North arrow
.. _layout_northarrow_item:

The North Arrow Item
--------------------

You can add a north arrow with the |northArrow|
:sup:`Add North Arrow` button, following
:ref:`items creation instructions <create_layout_item>` and
manipulate it the same way as exposed in :ref:`interact_layout_item`.

Since north arrows are images, the :guilabel:`North Arrow` item has
the same properties as the :ref:`picture item <layout_picture_item>`.
The main differences are:

* A default north arrow is used when adding the item, instead of a
  blank frame
* The north arrow item is synced with a map item by default: the
  :guilabel:`Sync with map` property is the map over which the north
  arrow item is drawn.
  If none, it falls back to the :ref:`reference map <reference_map>`.
   
.. note::

   Many of the north arrows do not have an 'N' added in the north
   arrow.
   This is done on purpose, since there are languages that do not use
   an 'N' for North.

.. _figure_layout_image_north:

.. figure:: img/north_arrows.png
   :align: center

   North arrows available for selection in provided SVG library

.. _layout_marker_item:

The Marker Item
----------------

To add a marker item, select the |addMarker| :sup:`Add Marker` button,
and click on the page. A default point marker symbol is added.
Then you can manipulate it, as explained in :ref:`interact_layout_item`.
But note that unlike most of the other items, you resize the item
given that its size is controlled by the embedded symbols properties.

The marker item can be customized from the :guilabel:`Item Properties` panel.
Other than the :ref:`items common properties <item_common_properties>`, you
can also:

* modify the :guilabel:`Symbol`, relying on all the symbol :ref:`widget
  capabilities <symbol-selector>`
* sync the marker item rotation with the map's (see :ref:`layout_images_rotation`),
  acting as a north arrow. The map rotation is added to any existing marker symbol
  level rotation (so .e.g if you have to rotate the triangle marker 90° to get it
  pointing straight up, it will still work nicely in north arrow mode!)

.. _figure_layout_marker:

.. figure:: img/marker_mainproperties.png
   :align: center

   The marker item custom properties

.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |addImage| image:: /static/common/mActionAddImage.png
   :width: 1.5em
.. |addMarker| image:: /static/common/mActionAddMarker.png
   :width: 1.5em
.. |checkbox| image:: /static/common/checkbox.png
   :width: 1.3em
.. |dataDefine| image:: /static/common/mIconDataDefine.png
   :width: 1.5em
.. |northArrow| image:: /static/common/north_arrow.png
   :width: 1.5em
