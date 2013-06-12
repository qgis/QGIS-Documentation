Installation
================================================================================

Where I can read this documentation
--------------------------------------------------------------------------------

It is possible to read the HTML version of the documentation for many languages
here:

* English: http://documentation.qgis.org/1.8/html/en/docs/user_manual/
* French: http://documentation.qgis.org/1.8/html/fr/docs/user_manual/
* German: http://documentation.qgis.org/1.8/html/de/docs/user_manual/
* Italian: http://documentation.qgis.org/1.8/html/it/docs/user_manual/
* Japanese: http://documentation.qgis.org/1.8/html/ja/docs/user_manual/
* Portuguese: http://documentation.qgis.org/1.8/html/pt/docs/user_manual/
* Russian: http://documentation.qgis.org/1.8/html/ru/docs/user_manual/
* Spanish: http://documentation.qgis.org/1.8/html/es/docs/user_manual/
* Dutch: http://documentation.qgis.org/1.8/html/nl/docs/user_manual/

It is also available via the subdomain docs.qgis.org, for example for the German
language:
http://docs.qgis.org/1.8/html/de/docs/user_manual/

In the qgis.org site the documentation is scheduled to be built every 6 hours.

Pdf versions of the manual are available here:
http://documentation.qgis.org/1.8/pdf/



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

* git (from packagemanager) to clone/download the source from Github.com
* gettext (from packagemanager) for translation tools
* texlive (from packagemanager: on Arch, it is texlive-core and texlive-bin)
* texlive-fonts-recommended (Ubuntu: from packagemanager)
* in debian you'll need 'texlive-latex-extra': sudo apt-get install
  texlive-latex-extra (texlive-latexextra on Arch)
* python-pip python installation (via sudo apt-get install python-pip)
* sphinx (via 'sudo pip install sphinx'; on Arch install python-sphinx)
* texi2pdf (from packagemanager: in Ubuntu it is in package 'texinfo')
* dvi2png (from packagemanager: in Ubuntu it is in package 'dvi2png')


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

Run pre_translate.sh script to create the gettext files (po, pot) in the i18n
directory::

 cd QGIS-Documentation
 scripts/pre_translate.sh

Translators now can translate their local i18n files using tools like linguist
or via a website.

Another option is to download a .po file from Github, translate it and sent it
back to a language maintainer.

Run 'post_translate.sh' script to build all translated pdf and html files::

 cd QGIS-Documentation
 scripts/post_translate.sh

.. note:: if you only want to create docs in one language, use the locale code
   as parameter.

For example, to create english docs::

 cd QGIS-Documentation
 scripts/post_translate.sh en


Document Translators edit workflow
--------------------------------------------------------------------------------

Every language has it's own maintainer, please contact them, if you want to help.
You find a list of current language maintainers in the `Project Organigram
<http://hub.qgis.org/wiki/quantum-gis/Project_Organigram#QGIS-Manual-Translation>`_.
If your language is not listed, please contact the `QGIS-Community-Team Mailinglist
<http://lists.osgeo.org/mailman/listinfo/qgis-community-team>`_ and ask for help.

Howto for language maintainers
..............................

* get an account on github.com
* install git on your computer (On Ubuntu and with Linux systems you just need
  to write: sudo apt-get install git). For other OS, have a look at the github
  homepage (look for application section)
* on github.com search the repository of Qgis-Documentation and `fork it
  <https://help.github.com/articles/fork-a-repo>`_, it just means that you create
  a copy of the original repository on your github account.

The maintainer should check the translations regularly. Therefore you should run
the 'scripts/pre_translate.sh <language>' and 'scripts/post_translate.sh <language>'
script after every significant change in the documentation. This will generate
and update the .po files needed for translations. If all is fine, take care, that
the translation go into the master repository from time to time.

* To update the master repository, you have to do a pull request on github. It
  means that you send a request to the owners of the repository you forked (so
  Qgis-Documentation) asking them to accept your translations and move them to
  the "original repository". For doing that go on github.com, browse on the
  directory of your repository and click pull request
  (https://help.github.com/articles/using-pull-requests).

Howto for translators
.....................

A thorough explanation for translators is written here:
http://docs.qgis.org/1.8/html/en/docs/documentation_guidelines/do_translations.html


.. temporarily commented the following part out:

.. Translators work locally and use an offline editor. `QtLinguist
.. <http://qt-apps.org/content/show.php/Qt+Linguist+Download?content=89360>`_ being the
.. highly recommended choice.
..
..
.. *If you want to translate locally*
..
.. * clone the forked repository from your language maintainer (this step copies
..   the repository to your computer)
.. * now that you have all the files on your computer just translate them!
..   (suggested softwares are qt linguist, lokalize, but you can use the software
..   you want)
.. * files translated need to be "synchronized"  with the old ones in the
..   directory of the forked repo
.. * if you are linux users, open the terminal and get in the directory of the
..   forked repo, and just write git add * , this simple command updates the files
..   of the forked repository
.. * now you have to commit the files writing git commit in the bash
.. * at this point the translated files are on your computer only. You need then
..   to upload them on the forked github account. Open the terminal and write git
..   push origin master. Now if you look at your github page the files are updated
..   with the translations.
.. * your language maintainer will take care that every significant translation
..   go into the master repository.
.. * Generally, as soon as you finish editing one or more .po files, you should
..   commit as soon as possible the edits to the git repository, in order to
..   minimize the possibility of conflicts.
..
.. New Language workflow
.. ----------------------
..
.. - add your locale code in the pre_translate.sh script in the line with 'LOCALE='
..
.. - run 'scripts/pre_translate.sh'. There will be a new directory in the
.. i18n directory for your language, containing the po-files for all source files
..
.. - create an empty(!) directory in the resources directory for your language
.. The idea is to ONLY put images in exact the same directory structure if you want
.. an image to be 'translated'. As default the english one will be used from the
.. 'en' directory, and only if there is an translated one it wil be found and used.
..
.. - add your locale code in the post_translate.sh script in the line with 'LOCALE='

