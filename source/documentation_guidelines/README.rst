***********************************
Migration guide / convention style
***********************************

Introduction
============

See also: http://sphinx.pocoo.org/markup/inline.html or convention.rst file.

In general, when creating rst documentation for the QGIS project, please follow 
the `Python documentation style guide lines 
<http://docs.python.org/devguide/documenting.html>`_.


Using headlines
===============

Adding new haedlines, you should use following styles for chapter, section, 
subsection and minisec.

* headlines::

  ********
  Chapter
  ********

  Section
  =======

  Subsection
  ----------
	
  Minisec
  .......

Inline tags
===========

* Shorcut keyboard:
  ::
	
  	\keyboard{Ctrl B}

  move to::
  	
  	:kbd:`ctrl B`
  
  will show :kbd:`Ctrl B`

* Menu gui::
  	
  	\mainmenuopt{menu} \arrow \dropmenuopttwo{submenu} 
  
  move to::
  	
  	:menuselection:`menu --> submenu`

* Filename::
  	
  	\filename{file} 
  
  move to::
  	
  	:file:``

* Gui label with icon::
  	
  	\toolbtntwo{icon}{label} 
  
  move to::
  	
  	|icon| :guilabel:`label` 
  	
  (see `image`_ below).

* Dialog and Tab title::
  	
  	\dialog{title}
	\tab{title}
  
  move to::
  	
  	:guilabel:`title`

* User text::
  	
  	\usertext{label} 
  
  move to::
  	
  	``label``

Footnotes
=========

This is for creating a footnote::
	
	blabla [1]_
	
Which will point to :

	.. [1] Updates of core plugins

.. _my_anchor:

Label/reference
===============

This is used to create a reference somewhere::
	
	.. _my_anchor:

	Label/reference
	===============

This will call the reference in the **same page**::
	
	see my_anchor_ for more information. Notice how it will jump to 
        the following line/thing following the 'anchor'. 
        Normally to declare this label you do not need to use apastroph's but 
        you do need to use empty lines before and after the anchor. If you use 
        :ref:`my_anchor` it will display the caption instead 
        (In this case the title of this section!)

So reference 1 (my_anchor_) and reference 2 :ref:`my_anchor`
 
Here is a reference preferably not to use::

       .. _`another.anchor`:
  
Because the reference often displays a full caption, there is not really the need
to use the word section::

        see :ref:`my_anchor`


.. _`image`:

Figure and image
=================

Figure::
	
	.. _fig_readme_1:
	.. figure:: img/en/nix.png
	   :align: center
	   :width: 12 em

	   Figure Readme 1: My caption


Notice that with figures you do not need to use a blank line behind the anchor. This is the 
only exception I know.

To use a caption (see My caption) just insert indented text after a blank line 
in the figure block.

Referencing to the figure can be done in two ways first using the reference label like this::

           (see fig_readme_1_). 


It will show the anchor fig_readme1_.
It can be used in the same :file:`.rst` document but not in other .rst documents.

You can also use the reference like this::

           (see :ref:`fig_readme_1`)


You can use this reference to show the full caption instead (see :ref:`fig_readme_1`).  

This reference can be used from the same :file:`.rst` and from other :file:`.rst` documents!

Tables
------

a simple table::

     =======  =======  =======
     x        y        z 
     =======  =======  =======
     1        2        3 
     2        4        \
     =======  =======  =======

Use a ``\`` followed by an empty space ``\\ `` to leave an empty space.

You can also use more complicated tables by drawing them using refences and all::

  .. _my_drawn_table_1:

  +---------------+--------------------+
  | Windows       | Mac OSX            |
  +---------------+--------------------+
  | |win|         | |osx|              |
  +---------------+--------------------+
  | and of course not to forget |nix|  |              
  +------------------------------------+

  Table 1: My drawn table, mind you this is unfortunately not regarded a caption 

  You can reference to it like this my_drawn_table1_. 

Pictures
--------

Image::
	
	.. image:: img/en/nix.png
	   :width: 12 em


Replacement
-----------

You can put an image inside text or add an alias to use everywhere. To use an image 
inside a paragraph, just create an alias somewhere::
	
	.. |label| image:: img/en/nix.png

and call it in your paragraph::

	my paragraph begins here with a nice picture |label|.

Here is how this example become:

.. |label| image:: img/en/nix.png

my paragraph begins here with a nice picture |label|.

Index
=====
Several index tag exists in RST. Here the easiest one::
	
	.. index:: `my index`

Available
=========

::
	
	:download:

