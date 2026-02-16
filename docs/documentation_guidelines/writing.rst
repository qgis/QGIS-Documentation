.. _writing_doc_guidelines:

*************************
Writing Guidelines
*************************

.. only:: html

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
Precede section titles with a blank line.
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

Indentation
-----------

Indentation in reStructuredText should be aligned with the list or markup *marker*. It is
also possible to create block quotes with indentation. See the
`Specification <https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#indentation>`__

.. code-block:: rst

   #. In a numbered list, there should be
      three spaces when you break lines
   #. And next items directly follow

      * Nested lists
      * Are also possible
      * And when they also have
        a line that is too long,
        the text should be naturally
        aligned
      * and be in their own paragraph

   However, if there is an unindented paragraph, this will reset the numbering:

   #. This item starts at 1 again


Inline Tags
-----------

You can use tags to emphasize items.

* **Menu GUI**: to mark a complete sequence of menu selections,
  including selecting submenus and choosing a specific operation,
  or any subsequence of such a sequence.

  .. code-block:: rst

     :menuselection:`menu --> submenu`

* **Dialogs and Tab titles**: Labels presented as part of an interactive user
  interface including window titles, tab titles, button and option labels.

  .. code-block:: rst

     :guilabel:`title`

* **Filenames and directories**

  .. code-block:: rst

     :file:`README.rst`

* **Icons with popup text**

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
  * Key combinations are displayed with a ``+`` sign between keys,
    without spaces: :kbd:`Shift+R`

* **User text**

  .. code-block:: rst

     ``label``

* **Layers, databases, tables or columns names**

  When referring to layers, databases, tables or columns, format as inline code:

  .. code-block:: rst

     ``layer name``
     ``database_name``
     ``table_name``
     ``column_name``


.. _my_anchor:

Labels/references
-----------------

Anchors inside the text can be used to create hyperlinks to sections
or pages.

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

Notice that it will jump to the line/thing following the 'anchor'.
You do not need to use apostrophes, but you do need to have empty lines
after the anchor.

Another way to jump to the same place **from anywhere in the
documentation** is to use the ``:ref:`` role.

.. code-block:: rst

   see :ref:`my_anchor` for more information.

which will create a link with the caption instead (in this case the
title of this section!):

see :ref:`my_anchor` for more information.

So, reference 1 (my_anchor_) and reference 2 (:ref:`my_anchor`).
Because the reference often displays a full caption, it is not really
necessary to use the word *section*.
Note that you can also use a custom caption to describe the reference:

.. code-block:: rst

   see :ref:`Label and reference <my_anchor>` for more information.

which returns:

see :ref:`Label and reference <my_anchor>` for more information.


.. _`image`:

Figures and Images
------------------


Pictures
........

To insert an image, use

.. code-block:: rst

   .. figure:: /static/common/logo.png
      :width: 10 em

which returns

.. figure:: /static/common/logo.png
   :width: 10 em

Icon substitution
.................

You can add an image inside a text paragraph (e.g., as a tool icon).
To do so, you first need to create an alias (also named substitution),
which is a reference name used to display the icon.
To ensure consistency across the documents and help in the use of the icons,
we maintain a list in the :file:`substitutions.txt` file at the root of this repository.
Find more details in the :ref:`substitutions` chapter.

Using an icon substitution is usually achieved through these steps:

#. Add the icon substitution in the :file:`substitutions.txt` file as below.
   If a substitution already exists for the icon you want to use, then skip this step.

   .. code-block:: rst

      .. |logo| image:: /static/common/logo.png
         :width: 1 em

#. Call it in your paragraph:

   .. code-block:: rst

      My paragraph begins here with |logo|.

#. Add (again) the icon substitution at the end of the file you are modifying. 
   This helps connecting the replacement text with the actual image,
   and can be done by copy-pasting it from :file:`substitutions.txt`
   or by executing the :file:`scripts/find_set_subst.py` script.

   This is how the example will be displayed:

     My paragraph begins here with |logo|.

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

To avoid conflicts with other references, always begin figure
anchors with ``_figure_`` and use terms that easily connect to the
figure caption. While only the centered alignment is mandatory for the image,
feel free to use any other options for figures (such as ``width``,
``height``, ``scale``...) if needed.

The scripts will insert an automatically generated number before the caption of
the figure in the generated HTML and PDF versions of the documentation.

To use a caption (*see My caption*) just insert indented text after a blank line
in the figure block.

A figure can be referenced using the reference label like this:

.. code-block:: rst

   see :numref:`figure_logo`

renders like this:

see :numref:`figure_logo`

This is the preferred way of referencing figures.

.. note::

   For ``:numref:`` to work, the figure **must have a caption**.

It is possible to use ``:ref:`` instead of ``:numref:`` for reference, but
this returns the full caption of the image.

.. code-block:: rst

   see :ref:`figure_logo`

renders like this:

see :ref:`figure_logo`


Tables
------

You can make a simple table like this:

.. code-block:: rst

   =======  =======  =======
   x        y        z
   =======  =======  =======
   1        2        3
   4                 5
   =======  =======  =======

It will render like this:

=======  =======  =======
x        y        z
=======  =======  =======
1        2        3
4                 5
=======  =======  =======

Tables should have a caption. You can use an explicit reST `"table" directive <https://docutils.sourceforge.io/docs/ref/rst/directives.html#table>`_
to add a caption to `simple tables <https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#simple-tables>`_
or `grid tables <https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#grid-tables>`_.
Add the caption on the same line as the directive and indent the table at least
one space.

You can also add a `hyperlink target <https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#hyperlink-targets>`_
before a table in order to reference it elsewhere.  To avoid conflicts with
other references, always begin hyperlink targets with ``_table_`` and use terms
relevant to the table caption.

Here is an example of a more complicated grid table with a caption and a
hyperlink target:

.. code-block:: rst

   .. _table-grid-caption:

   .. table:: Grid table with caption

      +---------------+--------------------+
      | Windows       | macOS              |
      +---------------+--------------------+
      | |win|         | |osx|              |
      +---------------+--------------------+
      | and of course not to forget |nix|  |
      +------------------------------------+

The result:

.. _table-grid-caption:

.. table:: Grid table with caption

   +---------------+--------------------+
   | Windows       | macOS              |
   +---------------+--------------------+
   | |win|         | |osx|              |
   +---------------+--------------------+
   | and of course not to forget |nix|  |
   +------------------------------------+

You may find it easier to use `list tables <https://docutils.sourceforge.io/docs/ref/rst/directives.html#list-table-1>`_
or `CSV tables <https://docutils.sourceforge.io/docs/ref/rst/directives.html#csv-table-1>`_
to make complex tables. Add the caption after the ``list-table`` or
``csv-table`` directive.

Here is an example of a list table with a caption and a hyperlink target:

.. code-block:: rst

   .. _table-list-caption:

   .. list-table:: List table with caption
      :header-rows: 1
      :widths: 20 20 20 40

      * - What
        - Purpose
        - Key word
        - Description
      * - **Test**
        - ``Useful test``
        - complexity
        - Geometry.  One of:

          * Point
          * Line

The result:

.. _table-list-caption:

.. list-table:: List table with caption
   :header-rows: 1
   :widths: 20 20 20 40

   * - What
     - Purpose
     - Key word
     - Description
   * - **Test**
     - ``Useful test``
     - complexity
     - Geometry.  One of:

       * Point
       * Line

Use ``:numref:`` roles to reference tables like this:

.. code-block:: rst

   see :numref:`table-grid-caption` or :numref:`table-list-caption`

The result:

   see :numref:`table-grid-caption` or :numref:`table-list-caption`

.. note::

   You must add a caption to your table in order to create a cross reference
   with the ``:numref:`` role.

Index
-----

An index is a handy way to help the reader find information in a document.
QGIS documentation provides some essential indices.
There are a few rules that help us provide a set of indices that are really
useful (coherent, consistent and really connected to each other):

* An index should be human readable, understandable and translatable; an index can
  be made from many words but you should avoid any unneeded ``_``, ``-``...
  characters to link them i.e., ``Loading layers`` instead of ``loading_layers``
  or ``loadingLayers``.
* Capitalize only the first letter of the index unless the word has a
  particular spelling. E.g., ``Loading layers``,
  ``Atlas generation``, ``WMS``, ``pgsql2shp``.
* Keep an eye on the existing `Index list <https://docs.qgis.org/testing/en/genindex.html>`_
  in order to reuse the most convenient expression with the right spelling
  and avoid unnecessary duplicates.

Several index tags exist in reST. You can use the inline ``:index:`` tag
within normal text:

.. code-block:: rst

   QGIS can load several :index:`Vector formats` supported by GDAL ...

Or you can use the ``.. index::`` block-level markup which links to the
beginning of the next paragraph. Because of the rules mentioned above, it
is recommended to use the block-level tag:

.. code-block:: rst

   .. index:: WMS, WFS, Loading layers

It is also recommended to use index parameters such as ``single``, ``pair``
and ``see``, in order to build a more structured and interconnected index table.
See `Index generating <https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.html#index-generating-markup>`_
for more information on index creation.


Special Comments
----------------

Sometimes, you may want to emphasize some points of the description, either to
warn, remind or give some hints to the user. In QGIS Documentation, we use reST
special directives such as ``.. warning::``, ``.. seealso::``, ``.. note::`` and ``.. tip::``.
These directives generate frames that highlight your comments. See `Paragraph Level markup
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

You may also want to give examples and insert code snippets. In this case,
write the comment below a line with the ``::`` directive inserted.  For
a better rendering, especially to apply color highlighting to code according
to its language, use the code-block directive, e.g. ``.. code-block:: xml``.
More details at
`Showing code <https://www.sphinx-doc.org/en/master/usage/restructuredtext/directives.html#showing-code-examples>`_.

.. note::

   Text in special comments will be translated, but text in code-block frames
   will not be translated. So keep comments in code blocks as short as possible
   and avoid comments unrelated to code.


Footnotes
---------


This is for creating a footnote (showing as example [1]_)

.. code-block:: rst

   blabla [1]_

Which will point to:

.. [1] Updates of core plugins

.. _managing_screenshots:

Managing Screenshots
====================

Add new Screenshots
-------------------

Here are some hints to create new, nice looking screenshots.
The images should be placed in an image (:file:`img/`) folder that
is located in the same folder as the referencing :file:`.rst` file.

* You can find some prepared QGIS projects that are used to create screenshots
  in the :file:`./qgis-projects` folder of this repository.
  This makes it easier to reproduce screenshots for the next version of QGIS.
  These projects use the QGIS `Sample Data <https://github.com/qgis/QGIS-Sample-Data/archive/master.zip>`_
  (aka Alaska Dataset), which should be unzipped and placed in the same folder
  as the QGIS-Documentation Repository.
* Reduce the window to the minimal space needed to show the feature (taking the
  whole screen for a small modal window > overkill)
* The less clutter, the better (no need to activate all the toolbars)
* Don't resize them in an image editor; the size will be set into the :file:`.rst`
  files if necessary (downscaling the dimensions without properly upping the
  resolution > ugly)
* Cut the background
* Make the top corners transparent if the background is not white
* Set print size resolution to ``135 dpi`` (e.g., in GIMP scale down the image
  using :menuselection:`Image --> Scale Image` and setting "X/Y" to ``135 pixels/in``,
  and export it through :menuselection:`File --> Export...`).
  This way, images will be at original size in HTML and at a good print
  resolution in the PDF.

  You can also use ImageMagick convert command to do a batch of images:

  .. code-block:: bash

    convert -units PixelsPerInch input.png -density 135 output.png

* Save them as :file:`.png` (to avoid :file:`.jpeg` artifacts)
* The screenshot should show the content according to what is described in the
  text

.. tip:: If you are on Ubuntu, you can use the following command to remove the
  global menu function and create smaller application screens with menus:

  .. code-block:: bash

    sudo apt autoremove appmenu-gtk appmenu-gtk3 appmenu-qt


Translated Screenshots
----------------------

Here are some additional hints for those that want to create
screenshots for a translated user guide:

Translated images should be placed in a :file:`img/<your_language>/`
folder. Use the same filename as the 'original' English screenshot.


Documenting Processing algorithms
=================================

If you want to write documentation for Processing algorithms, consider these
guidelines:

* Processing algorithm help files are part of QGIS User Guide, so use the same
  formatting as the User Guide and other documentation.

* Each algorithm documentation should be placed in the corresponding **provider**
  folder and **group** file, e.g. the algorithm `Voronoi polygon` belongs to the
  `QGIS` provider and to the group `vectorgeometry`. So the correct file to add
  the description is: :file:`source/docs/user_manual/processing_algs/qgis/vectorgeometry.rst`.

  .. note:: Before starting to write the guide, check if the algorithm is already
     described. In this case, you can enhance the existing description.

* It is **extremely** important that each algorithm has an *anchor* that corresponds
  to the provider name + the unique name of the algorithm itself. This allows the
  Help button to open the Help page of the correct section. The anchor should be
  placed **above** the title, e.g. (see also the :ref:`my_anchor` section):

  .. code-block:: rst

    .. _qgisvoronoipolygons:

    Voronoi polygons
    ----------------

  To find out the algorithm name you can just hover the mouse on the algorithm in
  the Processing toolbox.
* Avoid using "This algorithm does this and that..." as the first sentence in the
  algorithm description. Try to use more general expressions like:

  .. code-block:: rst

    Takes a point layer and generates a polygon layer containing the...

* Avoid describing what the algorithm does by replicating its name and please
  don't replicate the name of the parameter in the description of the parameter
  itself. For example if the algorithm is ``Voronoi polygon`` consider to describe
  the ``Input layer`` as ``Layer to calculate the polygon from``.
* Indicate in the description whether the algorithm has a default shortcut in
  QGIS or supports in-place editing.
* Add images! A picture is worth a thousand words! Use :file:`.png` format and follow the general
  guidelines for documentation (see the :ref:`image` section for more info).
  Put the image file in the correct folder, i.e. the :file:`img` folder next to
  the :file:`.rst` file you are editing.
* If necessary, add links in the "See also" section that provide additional information
  about the algorithm  (e.g., publications or web-pages).  Only add the "See also"
  section if there is really something to see. As a good practice, the "See also"
  section can be filled with links to similar algorithms.
* Give clear explanation for algorithm parameters and outputs: take inspiration
  from existing algorithms.
* Avoid duplicating detailed description of algorithm options. Add this information
  in the parameter description.
* Avoid adding information about the vector geometry type in the algorithm or parameter
  description, as this information is already available
  in the parameter descriptions.
* Add the default value of the parameter, e.g.:

  .. code-block:: rst

    * - **Number of points**
      - ``NUMBER_OF_POINTS``
      - [numeric: integer]

        Default: 1
      - Number of points to create

* Describe the *type* of input supported the parameters. There are several types
  available you can pick one from:

  ========================================  =========================  ====================
  Parameter/Output type                     Description                Visual indicator
  ========================================  =========================  ====================
  Point vector layer                        ``vector: point``          |pointLayer|
  Line vector layer                         ``vector: line``           |lineLayer|
  Polygon vector layer                      ``vector: polygon``        |polygonLayer|
  All spatial vector layers                 ``vector: geometry``
  Geometryless vector layer                 ``vector: table``          |tableLayer|
  Generic vector layer                      ``vector: any``
  Vector field numeric                      ``tablefield: numeric``    |fieldFloat|
  Vector field string                       ``tablefield: string``     |fieldText|
  Vector field generic                      ``tablefield: any``
  Raster layer                              ``raster``                 |rasterLayer|
  Raster band                               ``raster band``
  HTML file                                 ``html``
  Expression                                ``expression``             |expression|
  Line geometry                             ``geometry: line``
  Point geometry                            ``coordinates``
  Extent                                    ``extent``
  CRS                                       ``crs``                    |setProjection|
  Enumeration                               ``enumeration``            |selectString|
  List                                      ``list``
  Integer value                             ``numeric: integer``       |selectNumber|
  Decimal value                             ``numeric: double``        |selectNumber|
  String                                    ``string``                 |inputText|
  Boolean                                   ``boolean``                |checkbox|
  Folder path                               ``folder``
  File                                      ``file``
  Matrix                                    ``matrix``
  Layer                                     ``layer``
  Same output type as input type            ``same as input``
  Definition                                ``definition``
  Map layers                                ``layer`` ``list``
  Range                                     ``range``
  AuthConfig                                ``authconfig``
  Mesh                                      ``mesh``
  Layout                                    ``layout``
  LayoutItem                                ``layoutitem``
  Color                                     ``color``
  Scale                                     ``scale``
  Map theme                                 ``map theme``
  ========================================  =========================  ====================


* Study an existing and well documented algorithm, and copy
  all the useful layouts.
* When you are finished, just follow the guidelines described in :ref:`step_by_step`
  to commit your changes and make a Pull Request

Here is an example of an :ref:`existing algorithm <qgiscountpointsinpolygon>`
to help you with the layout and the description:

.. code-block:: rst

  .. _qgiscountpointsinpolygon:

  Count points in polygon
  -----------------------
  Takes a point and a polygon layer and counts the number of points from the
  point layer in each of the polygons of the polygon layer.
  A new polygon layer is generated, with the exact same content as the input
  polygon layer, but containing an additional field with the points count
  corresponding to each polygon.

  .. figure:: img/count_points_polygon.png
    :align: center

    The labels in the polygons show the point count

  An optional weight field can be used to assign weights to each point.
  Alternatively, a unique class field can be specified. If both options
  are used, the weight field will take precedence and the unique class field
  will be ignored.

  ``Default menu``: :menuselection:`Vector --> Analysis Tools`

  Parameters
  ..........

  .. list-table::
     :header-rows: 1
     :widths: 20 20 20 40
     :class: longtable

     * - Label
       - Name
       - Type
       - Description
     * - **Polygons**
       - ``POLYGONS``
       - [vector: polygon]
       - Polygon layer whose features are associated with the count of
         points they contain
     * - **Points**
       - ``POINTS``
       - [vector: point]
       - Point layer with features to count
     * - **Weight field**

         Optional
       - ``WEIGHT``
       - [tablefield: numeric]
       - A field from the point layer.
         The count generated will be the sum of the weight field of the
         points contained by the polygon.
     * - **Class field**

         Optional
       - ``CLASSFIELD``
       - [tablefield: any]
       - Points are classified based on the selected attribute and if
         several points with the same attribute value are within the
         polygon, only one of them is counted.
         The final count of the points in a polygon is, therefore, the
         count of different classes that are found in it.
     * - **Count field name**
       - ``FIELD``
       - [string]

         Default: 'NUMPOINTS'
       - The name of the field to store the count of points
     * - **Count**
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

     * - Label
       - Name
       - Type
       - Description
     * - **Count**
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
.. |logo| image:: /static/common/logo.png
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
