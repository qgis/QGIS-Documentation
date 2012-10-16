Installation
================================================================================

Where I can read this documentation
--------------------------------------------------------------------------------

It is possible to read the HTML version of the documentation for many languages 
here:

TODO: update

* English: http://documentation.qgis.org/html/en/user_manual/
* French: http://documentation.qgis.org/html/fr/user_manual/
* German: http://documentation.qgis.org/html/de/user_manual/
* Italian: http://documentation.qgis.org/html/it/user_manual/
* Japanese: http://documentation.qgis.org/html/ja/user_manual/
* Portuguese: http://documentation.qgis.org/html/pt/user_manual/
* Russian: http://documentation.qgis.org/html/ru/user_manual/
* Spanish: http://documentation.qgis.org/html/es/user_manual/
* Dutch: http://documentation.qgis.org/html/nl/user_manual/

It is also available via the subdomain docs.qgis.org, for example for the German 
language:
http://docs.qgis.org/html/de/user_manual/

In the qgis.org site the documentation is scheduled to be built every 6 hours.


Quick Overview
--------------------------------------------------------------------------------

* install required tools
* git clone the QGIS Documentation project
* run pre_translate.sh (if you want to update ALL translation files)
* translators edit their i18n files
* run 'post_translate.sh en' if you only want english docs (without locale for all)

Tools
--------------------------------------------------------------------------------

You will need the following tools

* git (from packagemanager)
* sphinx (via 'sudo pip install sphinx')
* texlive (from packagemanager)
* texlive-fonts-recommended (from packagemanager0
* texi2pdf (from packagemanager: in Ubuntu it is in package 'texinfo')


Generation
--------------------------------------------------------------------------------

Git clone this project::

 git clone git@github.com:qgis/QGIS-Documentation.git
 # to later update your tree do
 git pull --rebase origin master

You should have a directory tree like this::

 ├── i18n               will hold the po files (translated strings) for all languages
 ├── output             will contain output (? not in github ?)
 ├── readme.rst         this file
 ├── resources          containing all images for sources
 ├── scripts            containing buildscripts and conf.py
 ├── source             containing all rst sources
 └── themes             contains themes for output

Run pre_translate.sh script to create the gettext files (po, pot) in the i18n directory::

 cd QGIS-Documentation
 scripts/pre_translate.sh

Translators translate their i18n files using tools like linguist

Run 'post_translate.sh' script to build all translated pdf and html files::

 cd QGIS-Documentation
 scripts/post_translate.sh

NOTE: if you only want to create docs in one language, use the locale code as parameter.
Eg to only create english docs::

 cd QGIS-Documentation
 scripts/post_translate.sh en




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


New Language workflow
--------------------------------------------------------------------------------

- add your locale code in the pre_translate.sh script in the line with 'LOCALE='

- run 'scripts/pre_translate.sh'. There will be a new directory in the
i18n directory for your language, containing the po-files for all source files

- create an empty(!) directory in the resources directory for your language
The idea is to ONLY put images in exact the same directory structure if you want
an image to be 'translated'. As default the english one will be used from the
'en' directory, and only if there is an translated one it wil be found and used.

- add your locale code in the post_translate.sh script in the line with 'LOCALE='

