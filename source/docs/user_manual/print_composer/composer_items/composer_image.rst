.. only:: html

   |updatedisclaimer|

.. _image_item:

The Image Item
===============

To add an image, click the |addImage| :sup:`Add image` icon and drag a rectangle onto the Composer
canvas with the left mouse button. You can then position and customize
its appearance in the image :guilabel:`Item Properties` panel.

.. index:: Picture database, Rotated north arrow

The image :guilabel:`Item Properties` tab provides the following functionalities
(see figure_composer_image_):

.. _Figure_composer_image:

.. figure:: img/image_mainproperties.png
   :align: center

   Image Item Properties panel


You first have to select the image you want to display. There are several ways
to set the :guilabel:`image source` in the **Main properties** area.

#. Use the browse button |browseButton| of :guilabel:`image source` to select a
   file on your computer using the browse dialog. The browser will start in the
   SVG-libraries provided with QGIS. Besides :file:`SVG`, you can also select
   other image formats like :file:`.png` or :file:`.jpg`.
#. You can enter the source directly in the :guilabel:`image source` text field.
   You can even provide a remote URL-address to an image.
#. From the **Search directories** area you can also select an image from
   :guilabel:`loading previews ...` to set the image source.
#. Use the data defined button |dataDefined| to set the image source from a
   record or using a regular expression.

With the :guilabel:`Resize mode` option, you can set how the image is displayed
when the frame is changed, or choose to resize the frame of the image item so
it matches the original size of the image.

You can select one of the following modes:

* Zoom: Enlarges the image to the frame while maintaining aspect ratio of picture.
* Stretch: Stretches image to fit inside the frame, ignores aspect ratio.
* Clip: Use this mode for raster images only, it sets the size of the image to
  original image size without scaling and the frame is used to clip the image,
  so only the part of the image inside the frame is visible.
* Zoom and resize frame: Enlarges image to fit frame, then resizes frame to fit
  resultant image.
* Resize frame to image size: Sets size of frame to match original size of image
  without scaling.

Selected resize mode can disable the item options 'Placement' and 'Image rotation'.
The :guilabel:`Image rotation` is active for the resize mode 'Zoom' and 'Clip'.

With :guilabel:`Placement` you can select the position of the image inside its
frame. The **Search directories** area allows you to add and remove directories
with images in SVG format to the picture database. A preview of the pictures
found in the selected directories is shown in a pane and can be used to select
and set the image source.

.. _parameterized_svg:

It is possible to change SVG fill/outline color and outline width when using
parameterized SVG files such as those included with QGIS. If you add a SVG file
you should add the following tags in order to add support for transparency:

* `fill-opacity="param(fill-opacity)"`
* `stroke-opacity="param(outline-opacity)"`

You can read this `blog post
<http://blog.sourcepole.ch/2011/06/30/svg-symbols-in-qgis-with-modifiable-colors/>`_
to see an example.

Images can be rotated with the :guilabel:`Image rotation` field.
Activating the |checkbox| :guilabel:`Sync with map` checkbox synchronizes the
rotation of the image (i.e., a rotated north arrow) with the rotation applied to
the selected map item.

It is also possible to select a north arrow directly. If you first select a
north arrow image from **Search directories** and then use the browse button
|browseButton| of the field :guilabel:`Image source`, you can now select one of
the north arrow from the list as displayed in figure_composer_image_north_.

.. note::

   Many of the north arrows do not have an 'N' added in the north arrow, this is
   done on purpose for languages that do not use an 'N' for North, so they can
   use another letter.

.. _Figure_composer_image_north:

.. figure:: img/north_arrows.png
   :align: center

   North arrows available for selection in provided SVG library



.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |addImage| image:: /static/common/mActionAddImage.png
   :width: 1.5em
.. |browseButton| image:: /static/common/browsebutton.png
   :width: 2.3em
.. |checkbox| image:: /static/common/checkbox.png
   :width: 1.3em
.. |dataDefined| image:: /static/common/mIconDataDefine.png
   :width: 1.5em
.. |updatedisclaimer| replace:: :disclaimer:`Docs for 'QGIS testing'. Visit http://docs.qgis.org/2.18 for QGIS 2.18 docs and translations.`