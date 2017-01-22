.. _writing_doc_guidelines:

*************************
Documentation Guidelines
*************************

.. contents::
   :local:

Introduction
============

QGIS Documentation will
be built automatically on the server at 0, 8am, 4pm US/Pacific (Pacific Time).
The current status is available at http://docs.qgis.org.

QGIS Documentation is mainly written using the reStructuredText (reST) format syntax,
coupled with some scripts from the Sphinx toolset to post-process the HTML output.
See http://docutils.sourceforge.net/docs/ref/rst/restructuredtext.html
or http://sphinx.pocoo.org/markup/inline.html.

In general, when creating rst documentation for the QGIS project, please follow
the `Python documentation style guidelines
<http://docs.python.org/devguide/documenting.html>`_.
Below are exposed some general guidelines to follow when
using reST for the QGIS documentation writing.

If you are looking for general rules on contributing to QGIS project or managing
repositories, you may find help at
`Get Involved in the QGIS Community <http://qgis.org/en/site/getinvolved/index.html>`_.


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

::

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

Inline tags
-----------

You can use some tags inside the text to emphasize some items.

* **Menu gui**: to mark a complete sequence of menu selections,
  including selecting submenus and choosing a specific operation,
  or any subsequence of such a sequence.

  ::

     :menuselection:`menu --> submenu`

* **Dialog and Tab title**: Labels presented as part of an interactive user interface
  including window title, tab title and option labels.

  ::

     :guilabel:`title`

* **Button labels**

  ::

     **[Apply]**

* **Filename or directory**

  ::

     :file:`README.rst`

* **Icon with popup text belonging to Icon**

  ::

     |icon| :sup:`popup_text`

  (see `image`_ below).

* **Shorcut keyboard**

  ::

     :kbd:`ctrl B`

  will show :kbd:`Ctrl B`


* **User text**

  ::

     ``label``


.. _my_anchor:

Label/reference
---------------

References are used to place anchors inside the text.
It then helps you create and call hyperlinks between sections or page.

The example below creates the anchor of a section (e.g., Label/reference title)

::

   .. _my_anchor:

   Label/reference
   ---------------

To call the reference in the **same page**, use

::

   see my_anchor_ for more information.

which will return:

see my_anchor_ for more information.

Notice how it will jump to the following line/thing following the 'anchor'.
Normally to declare this label you do not need to use apastroph's but
you do need to use empty lines before and after the anchor.

Another way to jump to the same place **from anywhere in the documentation**
is to use the ``:ref:`` role.

::

   see :ref:`my_anchor` for more information.

which will display the caption instead (in this case the title of this section!):

see :ref:`my_anchor` for more information.

So reference 1 (my_anchor_) and reference 2 (:ref:`my_anchor`).
Because the reference often displays a full caption, there is not really
the need to use the word *section*.
Note that you can also use a custom caption to describe the reference

::

   see :ref:`Label and reference <my_anchor>` for more information.

returning:

see :ref:`Label and reference <my_anchor>` for more information.


.. _`image`:

Figure and image
----------------


Pictures
........

To insert an image, use

::

   .. image:: /static/common/qgislogo.png
      :width: 10 em

which returns

.. image:: /static/common/qgislogo.png
    :width: 10 em

Replacement
...........

You can put an image inside text or add an alias to use everywhere. To use an image
inside a paragraph, just create an alias somewhere.


::

   .. |nice_logo| image:: /static/common/qgislogo.png
                  :width: 2 em

and call it in your paragraph:

::

   my paragraph begins here with a nice logo |nice_logo|.

Here is how this example become:

.. |nice_logo| image:: /static/common/qgislogo.png
               :width: 2 em

my paragraph begins here with a nice logo |nice_logo|.

.. note::

   Currently, to ensure consistency and help in the use of QGIS icons
   a list of alias is built and available in :ref:`substitutions` chapter.

Figure
......

::

   .. _figure_logo:

   .. figure:: /static/common/qgislogo.png
      :width: 20 em
      :align: center

      A caption: A logo I like


The result looks like this:

.. _figure_logo:

.. figure:: /static/common/qgislogo.png
   :width: 20 em
   :align: center

   A caption: A logo I like

To avoid possible conflict with another references, always begin figures
anchor with ``_figure_`` and prefer using terms that can easily refer to the
figure caption. While only the centered alignment is mandatory for the image,
feel free to use any other options for figure (such as ``width``,
``height``, ``scale``...) if needed.

The scripts will insert an automatical generated number before the caption of
the figure in pdf.

To use a caption (*see My caption*) just insert indented text after a blank line
in the figure block.

Referencing to the figure can be done using the reference label like this

::

   (see Figure_logo_).

It will show the anchor Figure_logo_. You can use uppercase if you want.
It can be used in the same :file:`.rst` document but not in others.
You can still use the ``:ref:`` role for reference from other files, but
keep in mind that this returns the full caption of the image.

::

   see :ref:`figure_logo`
   
returns:

see :ref:`figure_logo`


Tables
......

To create a simple table

::

   =======  =======  =======
   x        y        z
   =======  =======  =======
   1        2        3
   2        4
   =======  =======  =======

Use a ``\`` followed by an empty space to leave an empty space.

You can also use more complicated tables by drawing them using references and all

::

   .. _my_drawn_table:

   +---------------+--------------------+
   | Windows       | Mac OSX            |
   +---------------+--------------------+
   | |win|         | |osx|              |
   +---------------+--------------------+
   | and of course not to forget |nix|  |
   +------------------------------------+

   My drawn table, mind you this is unfortunately not regarded a caption

   You can reference to it like this my_drawn_table_.

The result:

.. _my_drawn_table:

+---------------+--------------------+
| Windows       | Mac OSX            |
+---------------+--------------------+
| |win|         | |osx|              |
+---------------+--------------------+
| and of course not to forget |nix|  |
+------------------------------------+

My drawn table, mind you this is unfortunately not regarded a caption

You can reference to it like this my_drawn_table_.


Index
-----


An index is a handy way to help the reader easily find an information in a doc.
QGIS documentation provides some essential indices.
There are few rules to follow in order to keep a set of indices that are really 
useful (coherent, consistent and really connected to each other):

* Index should be human readable, understandable and translatable; an index can
  be made from many words but you should avoid any unneeded ``_``, ``-``...
  characters to link them i.e., ``Loading layers`` instead of ``loading_layers``
  or ``loadingLayers``. 
* Always capitalize only the first letter of the index unless the word has a
  particular spelling, in which case keep using its spelling e.g., ``Loading layers``,
  ``Atlas generation``, ``WMS``, ``pgsql2shp``
* Keep an eye on the existing `Index list <http://docs.qgis.org/testing/en/genindex.html>`_
  in order to reuse the most convenient expression with the right spelling
  and avoid wrong duplicates.
 
Several index tags exist in RST. You can either use the inline ``:index:`` tag
within the normal text.

::

   QGIS allows to load several :index:`Vector formats` supported by GDAL/OGR ...

Or you can use the ``.. index::`` block-level markup which links to the
beginning of the next paragraph. Because of the rules mentioned above, it's
advised to use this latter tag as it's easier to fulfill them.

::

   .. index:: WMS, WFS, Loading layers

It's also recommanded to use index parameters such as ``single``, ``pair``, ``see``...
in order to build a more structured and interconnected table of index. See
http://www.sphinx-doc.org/en/stable/markup/misc.html#index-generating-markup
for more information on index creation.

Footnotes
---------

Please note: Footnotes are not recognized by any translation software and
it is also not converted to pdf format properly.
So, if possible don't use footnotes within any documentation.

This is for creating a footnote

::

   blabla [1]_

Which will point to:

 .. [1] Updates of core plugins

Managing Screenshots
===================

Add new Screenshots
-------------------

Here are some hints to create new, nice looking screenshots.
For the user guide they go into :file:`./resources/en/user_manual/`

* same environment for all the screen caps (same OS, same decoration, same font size).
  We have used Ubuntu with Unity and the default "ambience" theme.
  For screenshots of QGIS main window and composer we have set it to show menus on the window
  (not the default in unity).
* reduce the window to the minimal space needed to show the feature (taking the all screen
  for a small modal window > overkill)
* the less clutter, the better (no need to activate all the toolbars)
* don't resize them in an image editor, the size will be set into the rst files if necessary
  (downscaling the dimensions without properly upping the resolution > ugly)
* cut the background
* Set print size resolution to 135 dpi, eg in Gimp set the print resolution
  (image > print size) and save. This way, if no size is set in the rst files,
  images will be at original size in html and at a good print resolution in the PDF.
  You can use ImageMagick convert command to do a batch of images:

::

 convert -units PixelsPerInch input.png -density 135 output.png

* save them in png (no jpeg artifacts)
* the screenshot should show the content according to what is described in the text
* you can find some prepared QGIS-projects that were used before to create screenshots
  in :file:`./qgis-projects`.
  This makes it easier to reproduce screenshots for the next version of QGIS.
  These projects use the QGIS `Sample Data <http://qgis.org/downloads/data/>`_
  (aka Alaska Dataset), which should be placed in the same folder
  as the QGIS-Documentation Repository.
* Use the following command to remove the global menu function in Ubuntu
  to create smaller application screens with menu's:

::

  sudo apt-get autoremove appmenu-gtk appmenu-gtk3 appmenu-qt


Translate Screenshots
---------------------

Here are some hints to create screenshots for your translated user guide.
They will go into :file:`./resources/<your language>/user_manual/`

* same environment for all the screen caps (same OS, same decoration, same font size)
* use the QGIS -projects included in QGIS-Documentation repository (in :file:`./qgis_projects` ).
  These were used to produce the 'original' screenshots in the manual.
  The QGIS `Sample Data <http://qgis.org/downloads/data/>`_ (aka Alaska Dataset)
  should be placed in the same folder as the QGIS-Documentation Repository.
* same size as the english 'original' screenshots, otherwise they will be stretched
  and look ugly. If you need to have a different size due to longer ui strings,
  don't forget to change the dimension in the rst code of your language.
* reduce the window to the minimal space needed to show the feature
  (taking all the screen for a small modal window > overkill)
* the less clutter, the better (no need to activate all the toolbars)
* don't resize them in an image editor, the size will be set into the rst files
  (downscaling the dimensions without properly upping the resolution > ugly)
* cut the background
* save them in png (no jpeg artifacts)
* the screenshot should show the content according to what is described in the text


Documenting Processing algorithms
=================================

If you want to write documentation for Processing algorithms consider these guidelines:

* don't overwrite existing help files by files from other sources (e.g. QGIS
  source tree or Processing-Help repository), this files have different formats
* Processing algorithm help files are part of QGIS User Guide, so use same
  formatting as User Guide and other documentation
* avoid use "This algoritm does this and that..." as first sentence in algorithm
  description. Try to use more general words like in TauDEM or GRASS algoritms
  help
* add images if needed. Use PNG format and follow general guidelines for documentation.
* if necessary add links to additional information (e.g. publications or web-pages)
  to the "See also" section
* give clear explanation for algorithm parameters and outputs (again GRASS and
  TauDEM are good examples).
* don't edit parameter or output names. If you found typo or wrong spelling ---
  report this in bugracker, so developers can fix this in Processing code too
* don't list available options in algorithm description, options already listed
  in parameter description.
* don't add information vector geometry type in algorithm or parameter description
  without compelling reason as this information already available in parameter
  description

