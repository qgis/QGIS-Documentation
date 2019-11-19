.. _writing_doc_guidelines:

*************************
Writing Guidelines
*************************

.. contents::
   :local:

In general, when creating reST documentation for the QGIS project, please follow
the `Python documentation style guidelines <https://devguide.python.org/documenting/>`_.
For convenience, we provide a set of general rules we rely on for writing
QGIS documentation below.


Writing Documentation
=====================


Headlines
---------

To each webpage of the documentation corresponds a ``.rst`` file.

Sections used to structure the text are identified through their title which
is underlined (and overlined for the first level).
Same level titles must use same character for underline adornment.
In QGIS Documentation, you should use following styles for chapter,
section, subsection and minisec.

.. code-block:: rst

   ********
   Chapter
   ********

   Section
   =======

   Subsection
   ----------

   Minisec
   .......

   Subminisec
   ^^^^^^^^^^

Lists
-----

Lists are useful for structuring the text.  Here are some simple rules
common to all lists:

* Start all list items with a capital letter

* Do not use punctuation after list items that only contain a single simple
  sentence

* Use period ( ``.`` ) as punctuation for list items that consist of several
  sentences or a single compound sentence

Inline Tags
-----------

You can use some tags inside the text to emphasize some items.

* **Menu GUI**: to mark a complete sequence of menu selections,
  including selecting submenus and choosing a specific operation,
  or any subsequence of such a sequence.

  .. code-block:: rst

     :menuselection:`menu --> submenu`

* **Dialog and Tab title**: Labels presented as part of an interactive user
  interface including window title, tab title, button and option labels.

  .. code-block:: rst

     :guilabel:`title`

* **Filename or directory**

  .. code-block:: rst

     :file:`README.rst`

* **Icon with popup text belonging to Icon**

  .. code-block:: rst

     |icon| :sup:`popup_text`

  (see `image`_ below).

* **Keyboard shortcuts**

  .. code-block:: rst

     :kbd:`Ctrl+B`

  will show :kbd:`Ctrl+B`
  
  When describing keyboard shortcuts, the following conventions
  should be used:
  
  * Letter keys are displayed using uppercase: :kbd:`S`
  * Special keys are displayed with an uppercase first letter: :kbd:`Esc`
  * Key combinations are displayed with a ``+`` sign between keys, without spaces: :kbd:`Shift+R`


* **User text**

  .. code-block:: rst

     ``label``


.. _my_anchor:

Label/reference
---------------

References are used to place anchors inside the text.
It then helps you create and call hyperlinks between sections or page.

The example below creates the anchor of a section (e.g., Label/reference title)

.. code-block:: rst

   .. _my_anchor:

   Label/reference
   ---------------

To call the reference in the **same page**, use

.. code-block:: rst

   see my_anchor_ for more information.

which will return:

see my_anchor_ for more information.

Notice how it will jump to the following line/thing following the 'anchor'.
Normally to declare this label you do not need to use apostrophes but
you do need to use empty lines before and after the anchor.

Another way to jump to the same place **from anywhere in the documentation**
is to use the ``:ref:`` role.

.. code-block:: rst

   see :ref:`my_anchor` for more information.

which will display the caption instead (in this case the title of this section!):

see :ref:`my_anchor` for more information.

So reference 1 (my_anchor_) and reference 2 (:ref:`my_anchor`).
Because the reference often displays a full caption, there is not really
the need to use the word *section*.
Note that you can also use a custom caption to describe the reference

.. code-block:: rst

   see :ref:`Label and reference <my_anchor>` for more information.

returning:

see :ref:`Label and reference <my_anchor>` for more information.


.. _`image`:

Figures and Images
------------------


Pictures
........

To insert an image, use

.. code-block:: rst

   .. image:: /static/common/logo.png
      :width: 10 em

which returns

.. image:: /static/common/logo.png
    :width: 10 em

Replacement
...........

You can put an image inside text or add an alias to use everywhere. To use an image
inside a paragraph, first create an alias in the :file:`source/substitutions.txt`
file:


.. code-block:: rst

   .. |nice_logo| image:: /static/common/logo.png
                  :width: 2 em

and then call it in your paragraph:

.. code-block:: rst

   My paragraph begins here with a nice logo |nice_logo|.

This is how the example will be displayed:

.. |nice_logo| image:: /static/common/logo.png
               :width: 2 em

My paragraph begins here with a nice logo |nice_logo|.

In order to render in GitHub a preview of the documentation that is the closest
to html rendering, you will also need to add the image replacement call at the
end of the file you changed. This can be done by copy-pasting it from the
:file:`substitutions.txt` or by executing the :file:`scripts/find_set_subst.py`
script.


.. note::

   Currently, to ensure consistency and help in the use of QGIS icons
   a list of aliases is built and available in the :ref:`substitutions` chapter.

Figure
......

.. code-block:: rst

   .. _figure_logo:

   .. figure:: /static/common/logo.png
      :width: 20 em
      :align: center

      A caption: A logo I like


The result looks like this:

.. _figure_logo:

.. figure:: /static/common/logo.png
   :width: 20 em
   :align: center

   A caption: A logo I like

To avoid possible conflict with other references, always begin figure
anchors with ``_figure_`` and prefer using terms that can easily refer to the
figure caption. While only the centered alignment is mandatory for the image,
feel free to use any other options for figures (such as ``width``,
``height``, ``scale``...) if needed.

The scripts will insert an automatically generated number before the caption of
the figure in the generated PDF version of the documentation.

To use a caption (*see My caption*) just insert indented text after a blank line
in the figure block.

Referencing to the figure can be done using the reference label like this

.. code-block:: rst

   (see Figure_logo_).

It will show the anchor Figure_logo_. You can use uppercase if you want.
It can be used in the same :file:`.rst` document but not in others.
You can still use the ``:ref:`` role for reference from other files, but
keep in mind that this returns the full caption of the image.

.. code-block:: rst

   see :ref:`figure_logo`

returns:

see :ref:`figure_logo`


Tables
......

To create a simple table

.. code-block:: rst

   =======  =======  =======
   x        y        z
   =======  =======  =======
   1        2        3
   2        4
   =======  =======  =======

Use a ``\`` followed by an empty space to leave an empty space.

You can also use more complicated tables by drawing them using references and all

.. code-block:: rst

   .. _my_drawn_table:

   +---------------+--------------------+
   | Windows       | macOS              |
   +---------------+--------------------+
   | |win|         | |osx|              |
   +---------------+--------------------+
   | and of course not to forget |nix|  |
   +------------------------------------+

   My drawn table, mind you this is unfortunately not regarded as a caption

   You can reference to it like this my_drawn_table_.

The result:

.. _my_drawn_table:

+---------------+--------------------+
| Windows       | macOS              |
+---------------+--------------------+
| |win|         | |osx|              |
+---------------+--------------------+
| and of course not to forget |nix|  |
+------------------------------------+

My drawn table, mind you this is unfortunately not regarded as a caption

You can reference to it like this my_drawn_table_.


Index
-----


An index is a handy way to help the reader easily find an information in a doc.
QGIS documentation provides some essential indices.
There are few rules to follow in order to keep a set of indices that are really
useful (coherent, consistent and really connected to each other):

* An index should be human readable, understandable and translatable; an index can
  be made from many words but you should avoid any unneeded ``_``, ``-``...
  characters to link them i.e., ``Loading layers`` instead of ``loading_layers``
  or ``loadingLayers``.
* Always capitalize only the first letter of the index unless the word has a
  particular spelling, in which case keep using its spelling e.g., ``Loading layers``,
  ``Atlas generation``, ``WMS``, ``pgsql2shp``.
* Keep an eye on the existing `Index list <https://docs.qgis.org/testing/en/genindex.html>`_
  in order to reuse the most convenient expression with the right spelling
  and avoid wrong duplicates.

Several index tags exist in RST. You can either use the inline ``:index:`` tag
within the normal text.

.. code-block:: rst

   QGIS allows to load several :index:`Vector formats` supported by GDAL/OGR ...

Or you can use the ``.. index::`` block-level markup which links to the
beginning of the next paragraph. Because of the rules mentioned above, it's
advised to use this latter tag as it's easier to fulfill them.

.. code-block:: rst

   .. index:: WMS, WFS, Loading layers

It's also recommanded to use index parameters such as ``single``, ``pair``,
``see``... in order to build a more structured and interconnected table of index.
See `Index generating <https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.html#index-generating-markup>`_
for more information on index creation.

Special Comments
----------------

Sometimes, you may want to emphasize some points of the description, either to
warn, remind or give some hints to the user. In QGIS Documentation, we use reST
special directives such as ``.. warning::``, ``.. note::`` and ``.. tip::``
generating particular frames that highlight your comments. See `Paragraph Level markup
<https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.html#paragraph-level-markup>`_
for more information.
A clear and appropriate title is required for both warnings and tips.

.. code-block:: rst

 .. tip:: **Always use a meaningful title for tips**

  Begin tips with a title that summarizes what it is about. This helps
  users to quickly overview the message you want to give them, and
  decide on its relevance.

Code Snippets
-------------

You may also want to give examples and insert a code snippet. In this case,
write the comment below a line with the ``::`` directive inserted. However, for
a better rendering, especially to apply color highlighting to code according
to its language, use the code-block directive, e.g. ``.. code-block:: xml``.
More details at `Showing code <https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.html#showing-code-examples>`_.

.. note::

  While texts in note, tip and warning frames are translatable, be aware that
  code block frames do not allow translation. So avoid comments not related to
  code sample and keep this just as short as needed.

Footnotes
---------

Please note: Footnotes are not recognized by any translation software and
it is also not converted to pdf format properly.
So, if possible don't use footnotes within any documentation.

This is for creating a footnote (showing as example [1]_)

.. code-block:: rst

   blabla [1]_

Which will point to:

 .. [1] Updates of core plugins

Managing Screenshots
====================

Add new Screenshots
-------------------

Here are some hints to create new, nice looking screenshots.
The images should be placed in a :file:`img/` folder, in the same folder as the
referencing :file:`.rst` file.

* You can find some prepared QGIS-projects that are used to create screenshots
  in the :file:`./qgis-projects` folder of this repository.
  This makes it easier to reproduce screenshots for the next version of QGIS.
  These projects use the QGIS `Sample Data <https://qgis.org/downloads/data/>`_
  (aka Alaska Dataset), which should be placed in the same folder
  as the QGIS-Documentation Repository.
* Reduce the window to the minimal space needed to show the feature (taking the
  whole screen for a small modal window > overkill)
* The less clutter, the better (no need to activate all the toolbars)
* Don't resize them in an image editor; the size will be set into the :file:`.rst`
  files if necessary (downscaling the dimensions without properly upping the
  resolution > ugly)
* Cut the background
* Make the top corners transparent if the background is not white
* Set print size resolution to ``135 dpi`` (e.g. in Gimp set the print resolution
  :menuselection:`Image --> Print size` and save). This way, images will be at
  original size in html and at a good print resolution in the PDF.
  You can also use ImageMagick convert command to do a batch of images:

  .. code-block:: bash

    convert -units PixelsPerInch input.png -density 135 output.png

* Save them in :file:`.png` (no :file:`.jpeg` artifacts)
* The screenshot should show the content according to what is described in the
  text

.. tip:: If you are on Ubuntu, you can use the following command to remove the
  global menu function and create smaller application screens with menus:
  
  .. code-block:: bash
  
    sudo apt autoremove appmenu-gtk appmenu-gtk3 appmenu-qt


Translate Screenshots
---------------------

Here are some hints to create screenshots for your translated user guide.
Translated images should be placed in a :file:`img/<your_language>/` folder, in
the same folder as the referencing :file:`.rst` file.

* Use the QGIS projects included in QGIS-Documentation repository (in
  :file:`./qgis_projects`)
  These were used to produce the 'original' screenshots in the manual.
  The QGIS `Sample Data <https://qgis.org/downloads/data/>`_ (aka Alaska Dataset)
  should be placed in the same folder as the QGIS-Documentation Repository.
* Same filename as the english 'original' screenshot
* Reduce the window to the minimal space needed to show the feature (taking the
  whole screen for a small modal window > overkill)
* The less clutter, the better (no need to activate all the toolbars)
* Don't resize them in an image editor; the size will be set into the :file:`.rst`
  files if necessary (downscaling the dimensions without properly upping the
  resolution > ugly)
* Cut the background
* Save them in :file:`.png` (no :file:`.jpeg` artifacts)
* The screenshot should show the content according to what is described in the
  text


Documenting Processing algorithms
=================================

If you want to write documentation for Processing algorithms consider these
guidelines:

* Processing algorithm help files are part of QGIS User Guide, so use the same
  formatting as User Guide and other documentation.

* Each algorithm documentation should be placed in the corresponding **provider**
  folder and **group** file, e.g. the algorithm `Voronoi polygon` belongs to the
  `QGIS` provider and to the group `vectorgeometry`. So the correct file to add
  the description is: :file:`source/docs/user_manual/processing_algs/qgis/vectorgeometry.rst`.

  .. note:: Before starting to write the guide, check if the algorithm is already
    described. In this case, you can enhance the existing description.

* It is **extremely** important that each algorithm has an *anchor* that corresponds
  to the provider name + the unique name of the algorithm itself. This allows the
  Help button to open the Help page to the correct section. The anchor should be
  placed **above** the title, e.g. (see also the :ref:`my_anchor` section)::

    .. _qgisvoronoipolygons:

    Voronoi polygons
    ----------------

  To find out the algorithm name you can just hover the mouse on the algorithm in
  the Processing toolbox.
* Avoid use "This algorithm does this and that..." as first sentence in algorithm
  description. Try to use more general expressions like::
  
    Takes a point layer and generates a polygon layer containing the...

* Avoid to describe what the algorithm does by replicating its name and please
  don't replicate the name of the parameter in the description of the parameter
  itself. For example if the algorithm is ``Voronoi polygon`` consider to describe
  the ``Input layer`` like ``Layer to calculate the polygon from``.
* Indicate in the description whether the algorithm has a default shortcut in
  QGIS or supports in-place editing.
* Add images! A picture is worth a thousand words! Use :file:`.png` format and follow general
  guidelines for documentation (see the :ref:`image` section for more info).
  Put the image file in the correct folder, i.e. the :file:`img` folder next to
  the :file:`.rst` file you are editing.
* If necessary, add links to the "See also" section that provides additional information
  about the algorithm  (e.g., publications or web-pages).  Only add the "See also"
  section if there is really something to see. As a good practice, the "See also"
  section can be filled with links to similar algorithms.
* Give clear explanation for algorithm parameters and outputs: take inspiration
  from existing algorithms.
* Avoid to duplicate algorithm options detailed description. Add these information
  in the parameter description.
* Avoid to add information about the vector geometry type in algorithm or parameter
  description without compelling reason as this information is already available
  in parameter description.
* Add the default value of the parameter in *italic*, e.g.::

    ``Number of points`` [number]
      Number of points to create

      Default: *1*

* Describe the *type* of input supported the parameters. There are several types
  available you can pick one from:

  ========================================  =========================  ====================
  Parameter/Output type                     Description                Visual indicator
  ========================================  =========================  ====================
  Point vector layer                        ``vector: point``          |pointLayer|
  Line vector layer                         ``vector: line``           |lineLayer|
  Polygon vector layer                      ``vector: polygon``        |polygonLayer|
  Generic vector layer                      ``vector: any``
  Vector field numeric                      ``tablefield: numeric``    |fieldFloat|
  Vector field string                       ``tablefield: string``     |fieldText|
  Vector field generic                      ``tablefield: any``
  Raster layer                              ``raster``                 |rasterLayer|
  Raster band                               ``raster band``
  HTML file                                 ``HTML``
  Table layer                               ``table``                  |tableLayer|
  Expression                                ``expression``             |expression|
  Point geometry                            ``coordinates``
  Extent                                    ``extent``
  CRS                                       ``crs``                    |setProjection|
  Enumeration                               ``enumeration``            |selectString|
  List                                      ``list``
  Number                                    ``number``                 |selectNumber|
  String                                    ``string``                 |inputText|
  Boolean                                   ``boolean``                |checkbox|
  Folder path                               ``folder``
  ========================================  =========================  ====================

|

* The best option is studying an existing and well documented algorithm and copy
  all the useful layouts
* If the algorithm does not provide any output just skip that section
* When you are finished just follow the guidelines described in :ref:`step_by_step`
  to commit your changes and make a Pull Request

Here is an example of an :ref:`existing algorithm <qgiscountpointsinpolygon>`
to help you with the layout and the description::

  .. _qgiscountpointsinpolygon:

  Count points in polygon
  -----------------------
  Takes a point and a polygon layer and counts the number of points from the
  point layer in each of the polygons of the polygon layer.
  A new polygon layer is generated, with the exact same content as the input polygon
  layer, but containing an additional field with the points count corresponding to
  each polygon.
  .. figure:: img/count_points_polygon.png
    :align: center

    The labels in the polygons show the point count
  
  An optional weight field can be used to assign weights to each point. Alternatively,
  a unique class field can be specified. If both options are used, the weight field
  will take precedence and the unique class field will be ignored.
  
  ``Default menu``: :menuselection:`Vector --> Analysis Tools`

  Parameters
  ..........

    .. list-table::
     :header-rows: 1
     :widths: 20 20 20 40
     :stub-columns: 0
  
     *  - Label
        - Name
        - Type
        - Description
     *  - **Polygons**
        - ``POLYGONS``
        - [vector: polygon]
        - Polygon layer whose features are associated with the count of
          points they contain
     *  - **Points**
        - ``POINTS``
        - [vector: point]
        - Point layer with features to count
     *  - **Weight field**
          
          Optional
        - ``WEIGHT``
        - [tablefield: numeric]
        - A field from the point layer.
          The count generated will be the sum of the weight field of the
          points contained by the polygon.
     *  - **Class field**
          
          Optional
        - ``CLASSFIELD``
        - [tablefield: any]
        - Points are classified based on the selected attribute and if
          several points with the same attribute value are within the
          polygon, only one of them is counted.
          The final count of the points in a polygon is, therefore, the
          count of different classes that are found in it.
     *  - **Count field name**
        - ``FIELD``
        - [string]
          
          Default: 'NUMPOINTS'
        - The name of the field to store the count of points
     *  - **Count**
        - ``OUTPUT``
        - [vector: polygon]
          
          Default: [Create temporary layer]
        - Specification of the output layer type (temporary, file,
          GeoPackage or PostGIS table).
          Encoding can also be specified.


  Outputs
  .......

  .. list-table::
     :header-rows: 1
     :widths: 20 20 20 40
     :stub-columns: 0
  
     *  - Label
        - Name
        - Type
        - Description
     *  - **Count**
        - ``OUTPUT``
        - [vector: polygon]
        - Resulting layer with the attribute table containing the
          new column with the points count


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |checkbox| image:: /static/common/checkbox.png
   :width: 1.3em
.. |expression| image:: /static/common/mIconExpression.png
   :width: 1.5em
.. |fieldFloat| image:: /static/common/mIconFieldFloat.png
   :width: 1.5em
.. |fieldText| image:: /static/common/mIconFieldText.png
   :width: 1.5em
.. |inputText| image:: /static/common/inputtext.png
.. |lineLayer| image:: /static/common/mIconLineLayer.png
   :width: 1.5em
.. |nix| image:: /static/common/nix.png
   :width: 1em
.. |osx| image:: /static/common/osx.png
   :width: 1em
.. |pointLayer| image:: /static/common/mIconPointLayer.png
   :width: 1.5em
.. |polygonLayer| image:: /static/common/mIconPolygonLayer.png
   :width: 1.5em
.. |rasterLayer| image:: /static/common/mIconRasterLayer.png
   :width: 1.5em
.. |selectNumber| image:: /static/common/selectnumber.png
   :width: 2.8em
.. |selectString| image:: /static/common/selectstring.png
   :width: 2.5em
.. |setProjection| image:: /static/common/mActionSetProjection.png
   :width: 1.5em
.. |tableLayer| image:: /static/common/mIconTableLayer.png
   :width: 1.5em
.. |win| image:: /static/common/win.png
   :width: 1em
