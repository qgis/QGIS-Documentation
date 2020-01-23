.. index::
    single: Style manager

.. _vector_style_manager:

*******************
 The Style Manager
*******************


.. only:: html

   .. contents::
      :local:


The Style Manager dialog
========================

The :guilabel:`Style Manager` is the place where you can manage and create
generic style items. These are symbols, color ramps, text formats or label
settings that can be used to symbolize features, layers or print layouts.
They are stored in the :file:`symbology-style.db` database under the active
:ref:`user profile <user_profiles>` and shared with all the project files
opened with that profile.
Style items can also be shared with others thanks to the export/import
capabilities of the :guilabel:`Style Manager` dialog.

You can open that modeless dialog either:

* from the :menuselection:`Settings -->` |styleManager| :menuselection:`Style
  Manager...` menu
* with the |styleManager| :sup:`Style Manager` button from the Project toolbar
* or with the |styleManager| :sup:`Style Manager` button from a vector
  :menuselection:`Layer Properties -->` menu (while :ref:`configuring
  a symbol <symbol-selector>` or :ref:`formatting a text <showlabels>`).

.. _figure_style_manager:

.. figure:: img/stylemanager.png
   :align: center

   The Style Manager


.. index:: Style items
.. _group_symbols:

Organizing style items
----------------------

The :guilabel:`Style Manager` dialog displays in its center a frame with
previewed items organized into tabs:

* :guilabel:`All` for a complete collection of point, linear and surface symbols
  and label settings as well as predefined color ramps and text formats;
* |pointLayer| :guilabel:`Marker` for point symbols only;
* |lineLayer| :guilabel:`Line` for linear symbols only;
* |polygonLayer| :guilabel:`Fill` for surface symbols only;
* |color| :guilabel:`Color ramp`;
* |text| :guilabel:`Text format` to manage :ref:`text formats <text_format>`,
  which store the font, color, buffers, shadows, and backgrounds of texts
  (i.e. all the formatting parts of the label settings, which for instance can
  be used in layouts);
* |labeling| :guilabel:`Label settings` to manage :ref:`label settings
  <showlabels>`, which include the text formats and some layer-type specific
  settings such as label placement, priority, callouts, rendering...


For each family of items, you can organize the elements into different categories,
listed in the panel on the left:

* **Favorites**: displayed by default when configuring an item, it shows an
  extensible set of items;
* **All**: lists all the available items for the active type;
* **Tags**: shows a list of labels you can use to identify the items.
  An item can be tagged more than once. Select a tag in the list and the tabs
  are updated to show only their items that belong to it.
  To create a new tag you could later attach to a set of items, use the
  :guilabel:`Add Tag...` button or select the |signPlus| :guilabel:`Add Tag...`
  from any tag contextual menu;
* **Smart Group**: a smart group dynamically fetches its symbols according to
  conditions set (see eg, figure_smart_group_). Click the :guilabel:`Add Smart Group...`
  button to create smart groups. The dialog box allows you to enter an expression
  to filter the items to select (has a particular tag, have a string in its name,
  etc.). Any symbol, color ramp, text format or label setting that satisfies
  the entered condition(s) is automatically added to the smart group.


.. _figure_smart_group:

.. figure:: img/create_smartgroup.png
   :align: center

   Creating a Smart Group

Tags and smart groups are not mutually exclusive: they are simply two different
ways to organize your style elements. 
Unlike the smart groups that automatically fetch their belonged items based on
the input constraints, tags are filled by the user. To edit any of those
categories, you can either:

* select the items, right-click and choose :menuselection:`Add to Tag -->`
  and then select the tag name or create a new tag;
* select the tag and press :menuselection:`Modify group... --> Attach Selected Tag
  to Symbols`. A checkbox appears next to each item to help you select
  or deselect it. When selection is finished, press :menuselection:`Modify
  group... --> Finish Tagging`.
* select the smart group, press :menuselection:`Modify group... --> Edit smart
  group...` and configure a new set of constraints in the :guilabel:`Smart Group
  Editor` dialog.
  This option is also available in the contextual menu of the smart group.

To remove a tag or a smart group, right-click on it and select the |signMinus|
:guilabel:`Remove` button. Note that this does not delete the items grouped in the
category.

Adding, editing or removing an item
-----------------------------------

As seen earlier, style elements are listed under different tabs whose
contents depend on the active category (tag, smart group, favorites...).
When a tab is enabled, you can:

* Add new items: press the |signPlus| :sup:`Add item` button and configure the
  item following :ref:`symbols <symbol-selector>`, :ref:`color ramps
  <color-ramp>` or :ref:`text format and label <showlabels>` builder description.
* Modify an existing item: select an item and press |symbologyEdit| :sup:`Edit
  item` button and configure as mentioned above. 
* Delete existing items: to delete an element you no longer need, select it and
  click |signMinus| :sup:`Remove item` (also available through right-click).
  The item will be deleted from the local database.

Note that the :guilabel:`All` tab provides access to these options for every type
of item.

Right-clicking over a selection of items also allows you to:

* :guilabel:`Add to Favorites`;
* :guilabel:`Remove from Favorites`;
* :menuselection:`Add to Tag -->` and select the appropriate tag or create a new
  one to use; the currently assigned tags are checked;
* :guilabel:`Clear Tags`: detaching the symbols from any tag;
* :guilabel:`Remove Item(s)`;
* :guilabel:`Edit Item`: applies to the item you right-click over;
* :guilabel:`Copy Item`;
* :guilabel:`Paste Item ...`: pasting to one of the categories of the style manager
  or elsewhere in QGIS (symbol or color buttons) 
* :guilabel:`Export Selected Symbol(s) as PNG...` (only available with symbols);
* :guilabel:`Export Selected Symbol(s) as SVG...` (only available with symbols);

.. _share_symbols:

Sharing style items
-------------------

The |sharing| :guilabel:`Import/Export` tool, at the left bottom of the Style
Manager dialog, offers options to easily share symbols, color ramps, text
formats and label settings with
others. These options are also available through right-click over the items.

Exporting items
...............

You can export a set of items to an :file:`.XML` file:

#. Expand the |sharing| :guilabel:`Import/Export` drop-down menu and select
   |fileSave| :guilabel:`Export Item(s)...`
#. Choose the items you'd like to integrate. Selection
   can be done with the mouse or using a tag or a group previously set.
#. Press :guilabel:`Export` when ready. You'll be prompted to indicate the
   destination of the saved file. The XML format generates a single file
   containing all the selected items. This file can then be imported in
   another user's style library.

.. _figure_symbol_export:

.. figure:: img/export_styles.png
   :align: center

   Exporting style items

When symbols are selected, you can also export them to :file:`.PNG` or
:file:`.SVG`. Exporting to :file:`.PNG` or :file:`.SVG` (both not available for
other style item types)
creates a file for each selected symbol in a given folder. The SVG folder can be
added to the :guilabel:`SVG paths` in :menuselection:`Settings --> Options -->
System` menu of another user, allowing him direct access to all these symbols.

.. _import_style_items:

Importing items
...............

You can extend your style library by importing new items:

#. Expand the |sharing| :guilabel:`Import/Export` drop-down menu and select
   |fileOpen| :guilabel:`Import Item(s)` at the left bottom of the dialog.
#. In the new dialog, indicate the source of the style items (it can be an
   :file:`.xml` file on the disk or a url).
#. Set whether to |unchecked| :guilabel:`Add to favorites` the items to import.
#. Check |unchecked| :guilabel:`Do not import embedded tags` to avoid the import
   of tags associated to the items being imported.
#. Give the name of any :guilabel:`Additional tag(s)` to apply to the new items.
#. Select from the preview the symbols you want to add to your library.
#. And press :guilabel:`Import`.

.. _figure_symbol_import:

.. figure:: img/import_styles.png
   :align: center

   Importing style items

.. index::
   pair: Browser; Style items

Using the Browser panel
.......................

It's also possible to import style items into the active user profile style
database directly from the :guilabel:`Browser` panel:
   
#. Select the style :file:`.xml` file in the browser
#. Drag-and-drop it over the map canvas or right-click and select
   :guilabel:`Import Style...`
#. Fill the :guilabel:`Import Items` dialog following :ref:`import_style_items`
#. Press :guilabel:`Import` and the selected style items are added to the
   style database

Double-clicking the style file in the browser opens the :guilabel:`Style
Manager` dialog showing the items in the file. You can select them and press
:guilabel:`Copy to Default Style...` to import them into the active style
database. Tags can be assigned to items. Also available through right-click,
:guilabel:`Open Style...` command.

.. _figure_symbol_open:

.. figure:: img/open_style_file.png
   :align: center

   Opening a style items file

The dialog also allows to export single symbols as :file:`.PNG` or :file:`.SVG`
files.

.. _color-ramp:

Setting a Color Ramp
====================

.. index:: Colors
   single: Colors; Color ramp
   single: Colors; Gradient color ramp
   single: Colors; Color brewer
   single: Colors; Custom color ramp

The Color ramp tab in the :guilabel:`Style Manager` dialog helps you preview
different color ramps based on the category selected in the left panel.

To create a custom color ramp, activate the Color ramp tab and click the
|signPlus| :sup:`Add item` button. The button reveals a drop-down list to
choose the ramp type:

* :guilabel:`Gradient`: given a start and end colors, generate a color ramp which
  can be **continuous** or **discrete**. With double-clicking the ramp preview, you
  can add as many intermediate color stops as you want.

.. _figure_color_custom_ramp:

.. figure:: img/customColorRampGradient.png
   :align: center

   Example of custom gradient color ramp with multiple stops

* :guilabel:`Color presets`: allows to create a color ramp consisting of a list of
  colors selected by the user;
* :guilabel:`Random`: creates a random set of colors based on range of values for
  :guilabel:`Hue`, :guilabel:`Saturation`, :guilabel:`Value` and :guilabel:`Opacity`
  and a number of colors (:guilabel:`Classes`);
* :guilabel:`Catalog: ColorBrewer`: a set of predefined discrete color gradients
  you can customize the number of colors in the ramp;
* or :guilabel:`Catalog: cpt-city`: an access to a whole catalog of color gradients to
  locally :guilabel:`save as standard gradient`. The cpt-city option opens a new
  dialog with hundreds of themes included 'out of the box'.

.. _figure_color_cpt_city:

.. figure:: img/cpt-cityColorRamps.png
   :align: center

   cpt-city dialog with hundreds of color ramps

.. tip:: **Easily adjust the color stops of the gradient color ramp**

 Double-clicking the ramp preview or drag-and-drop a color from the color spot onto
 the ramp preview adds a new color stop. Each color stop can be tweaked using the
 :ref:`color-selector` widgets or by plotting each of its parameters. You can also 
 reposition it using the mouse, the arrow keys (combine with :kbd:`Shift` key for
 a larger move) or the :guilabel:`Relative position` spinbox. Pressing :guilabel:`Delete
 stop` as well as :kbd:`DEL` key removes the selected color stop. 


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |color| image:: /static/common/color.png
.. |fileOpen| image:: /static/common/mActionFileOpen.png
   :width: 1.5em
.. |fileSave| image:: /static/common/mActionFileSave.png
   :width: 1.5em
.. |labeling| image:: /static/common/labelingSingle.png
   :width: 1.5em
.. |lineLayer| image:: /static/common/mIconLineLayer.png
   :width: 1.5em
.. |pointLayer| image:: /static/common/mIconPointLayer.png
   :width: 1.5em
.. |polygonLayer| image:: /static/common/mIconPolygonLayer.png
   :width: 1.5em
.. |sharing| image:: /static/common/mActionSharing.png
   :width: 1.5em
.. |signMinus| image:: /static/common/symbologyRemove.png
   :width: 1.5em
.. |signPlus| image:: /static/common/symbologyAdd.png
   :width: 1.5em
.. |styleManager| image:: /static/common/mActionStyleManager.png
   :width: 1.5em
.. |symbologyEdit| image:: /static/common/symbologyEdit.png
   :width: 1.5em
.. |text| image:: /static/common/text.png
   :width: 1.5em
.. |unchecked| image:: /static/common/checkbox_unchecked.png
   :width: 1.3em
