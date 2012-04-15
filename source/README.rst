===================================
Migration guide / convention style
===================================

Introduction
============

See also: http://sphinx.pocoo.org/markup/inline.html or convention.rst file.

Inline tags
===========

* Shorcut keyboard:
  ::
	
  	\keyboard{Ctrl B}

  move to::
  	
  	:kbd:`ctrl B`
  
  will show :kbd:`Ctrl B`

::
	
	\mainmenuopt{menu} \arrow \dropmenuopttwo{submenu} 

move to::
	
	:menuselection:`menu --> submenu`

::
	
	\filename{file} 

move to::
	
	:file:``

::
	
	\toolbtntwo{icon}{label} 

move to::
	
	|icon| :guilabel:`label` 
	
(see `image`_ below).

::
	
	\dialog{title}

move to::
	
	:guilabel:`title`

::
	
	\usertext{label} 

move to::
	
	``label``


Label/reference
================

This is for create a reference somewhere::
	
	.. _`my_anchor`:

This is call the reference::
	
	see section `my_anchor`_ for more information

.. _`image`:

Figure and image
=================

Figure::
	
	.. `fig_mylabel`:
	
	.. figure:: img/en/nix.png
	   :align: center
	   :width: 	12 em

	   My caption

To use caption juste insert text after a blanck line in the figure block.

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

Here is how this exemple become:

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

