Installation
================================================================================

Where I can read this documentation
--------------------------------------------------------------------------------

It is possible to read the HTML version of the documentation for many languages 
here:

TODO: update

* English: http://documentation.qgis.org/user_guide/html/en
* French: http://documentation.qgis.org/user_guide/html/fr
* German: http://documentation.qgis.org/user_guide/html/de
* Italian: http://documentation.qgis.org/user_guide/html/it
* Japanese: http://documentation.qgis.org/user_guide/html/ja
* Portuguese: http://documentation.qgis.org/user_guide/html/pt
* Russian: http://documentation.qgis.org/user_guide/html/ru
* Spanish: http://documentation.qgis.org/user_guide/html/es

It is available also the subdomain docs.qgis.org, for example for the German 
language:
http://docs.qgis.org/user_guide/html/de/

It is possible to read the HTML English version of the documentation here:
http://readthedocs.org/docs/qgis/en/latest/

In the qgis.org site the documentation is scheduled to be built every 30 
minutes. In the readthedocs.org site it is built every time something is 
committed at this repository.

Quick Overview
--------------------------------------------------------------------------------

* install required tools
* git clone the QGIS Documentation project
* run pre_translate.sh
* translators edit their i18n files
* run post_translate.sh

Tools
--------------------------------------------------------------------------------

You will need the following tools (Werner, plz add if I missed something :-) ) 

* git (from packagemanager)
* sphinx (via 'sudo pip install sphinx')
* texlive (from packagemanager)
* texlive-fonts-recommended (from packagemanager0
* texi2pdf (from packagemanager, in Ubuntu in package 'texinfo')


Generation
--------------------------------------------------------------------------------

Git clone this project::

 git clone git@github.com:qgis/QGIS-Documentation.git
 # to later update your tree do
 git pull --rebase origin master

You should have a directory tree like this::

 ├── i18n               will hold the po files for all languages
 ├── Makefile           ? to be removed ?
 ├── output             ? will contain output (? not in github ?)
 ├── readme.rst         this file 
 ├── requirements.txt   ? to be removed ?
 ├── resources          containing all images for sources
 ├── scripts            containing buildscripts and conf.py
 ├── source             containing all rst sources
 ├── static             used for building, plz keep this here and clean
 └── themes             contains themes for output

Run pre_translate.sh script to create the gettext files (po, pot) in the i18n directory::

 cd QGIS-Documentation
 scripts/pre_translate.sh

Translators translate their i18n files using tools like linguist

Run post_translate.sh script to build all translated pdf and html files::

 cd QGIS-Documentation
 scripts/post_translate.sh


Translators edit workflow
--------------------------------------------------------------------------------

TODO: update this


Every time a new master document is released, the translators can start 
translating the .po files of competence.

Translators must edit the .po files using the web application, based on Pootle, 
or an offline editor, with `QtLinguist 
<http://qt-apps.org/content/show.php/Qt+Linguist+Download?content=89360>`_ being the 
highly recommended choice.

As soon as they finish editing one or more of the .po files, they should commit 
as soon as possible the edits to the git repository, in order to minimize the 
possibility of conflicts.

When a new version of the master document is released, the administrator must 
produce the new version of the template files (.pot).
At this point the administrator should also use the msgmerge command, for 
identifing the differences that each .po files has with the master document.

This is a basic usage of the msgmerge command::

	msgmerge source/translated/it/introduction.po \ 
		source/translated/pot/introduction.pot -U


