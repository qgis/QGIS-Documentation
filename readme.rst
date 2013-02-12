QGIS Documentation
===================

It is possible to read the HTML version of the documentation for many languages here:

* English: http://documentation.qgis.org/html/en/docs/user_manual/
* French: http://documentation.qgis.org/html/fr/docs/user_manual/
* German: http://documentation.qgis.org/html/de/docs/user_manual/
* Italian: http://documentation.qgis.org/html/it/docs/user_manual/
* Japanese: http://documentation.qgis.org/html/ja/docs/user_manual/
* Portuguese: http://documentation.qgis.org/html/pt/docs/user_manual/
* Russian: http://documentation.qgis.org/html/ru/docs/user_manual/
* Spanish: http://documentation.qgis.org/html/es/docs/user_manual/
* Dutch: http://documentation.qgis.org/html/nl/docs/user_manual/

In the qgis.org site the documentation is scheduled to be built every 8 hours. 
Pdf versions of the manual are available here: http://documentation.qgis.org/pdf/

Tools you need to install, if you want to work on the documentation
-------------------------------------------------------------------

If you plan to update or translate the manual locally, you will need to create a github account and install the following tools:

* git (from packagemanager) to clone/download the source from Github.com
* gettext (from packagemanager) for translation tools
* texlive (from packagemanager: on Arch, it is texlive-core and texlive-bin)
* texlive-fonts-recommended (Ubuntu: from packagemanager)
* in debian you'll need 'texlive-latex-extra': sudo apt-get install texlive-latex-extra (texlive-latexextra on Arch)
* python-pip python installation (via sudo apt-get install python-pip)
* sphinx (via 'sudo pip install sphinx'; on Arch install python-sphinx)
* texi2pdf (from packagemanager: in Ubuntu it is in package 'texinfo')
* dvi2png (from packagemanager: in Ubuntu it is in package 'dvi2png')

Working on the english QGIS Documentation
=========================================

This section describes who to update/edit the english master documentation.

* install required tools
* login to github and create a fork of the QGIS-Documentation master branch 
* git clone your forked QGIS Documentation project to your computer
* run './scripts/post_translate.sh en' locally to build the english docs
* edit/update the rst files with the english documentation from ./source/docs/user_manual/
* run './scripts/post_translate.sh en' locally again to check your changes
* commit your changes to your forked repository 
* create a pull request to merge your changes into the official QGIS-Documentation repository

If you are more experienced you can also ask for direct write access to the official QGIS-Documentation 
repository at the community-team mailing list.

Generation
----------
Git clone your personal forked project::

 git clone git@github.com:<user>/QGIS-Documentation.git
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

Run post_translate.sh script to build the documentation::

 cd QGIS-Documentation
 sh ./scripts/post_translate.sh en

You can now edit the rst files in the folder ./source/docs/user_manual/, e.g.::

 cd source/docs/user_manual/preamble/
 gedit foreword.rst

After editing the rst file, run 'post_translate.sh en' again to build the english pdf and html files::

 cd QGIS-Documentation
 sh scripts/post_translate.sh en

.. note:: if you want to create docs in another language, use the locale code as parameter.

For example, to create italian docs::

 cd QGIS-Documentation
 sh scripts/post_translate.sh it

Now check, if the manual built correctly and commit and push your changes to your forked repository::

 git commit source/docs/user_manual/preamble/foreword.rst -m 'updated foreword'
 git push 

In your github account you can now open a pull request to merge your changes from your forked to the 
official QGIS Documentation repository.

Translating the english QGIS Documentation
==========================================

Every language has it's own maintainer, please contact them, if you want to help. 
You find a list of current language maintainers in the `Project Organigram 
<http://hub.qgis.org/wiki/quantum-gis/Project_Organigram#QGIS-Manual-Translation>`_. 
If your language is not listed, please contact the `QGIS-Community-Team Mailinglist 
<http://lists.osgeo.org/mailman/listinfo/qgis-community-team>`_ and ask for help.

Howto for language maintainers
..............................

* get an account on github.com
* install git on your computer (On Ubuntu and with Linux systems you just need to write: sudo apt-get install git). For other OS, have a look at the github homepage (look for application section)
* on github.com search the repository of Qgis-Documentation and the branch you want to work with and `fork it <https://help.github.com/articles/fork-a-repo>`_, it just means that you create a copy of the original repository on your github account.

The maintainer should check the translations regularly. Therefore you should run the 
'scripts/pre_translate.sh <language>' and 'scripts/post_translate.sh <language>' script 
after every significant change in the documentation. This will generate and update the 
.po files needed for translations. If all is fine, take care, that the translation go 
into the master repository from time to time.

* To update the master repository, you have to do a pull request on github. It means that you send a request to the owners of the repository you forked (so Qgis-Documentation) asking them to accept your translations and move them to the "original repository". For doing that go on github.com, browse on the directory of your repository and click pull request (https://help.github.com/articles/using-pull-requests).

Howto for translators
.....................

A thorough explanation for translators is written here:
http://docs.qgis.org/html/en/docs/documentation_guidelines/do_translations.html


.. temporarily commented the following part out:

.. Translators work locally and use an offline editor. `QtLinguist 
.. <http://qt-apps.org/content/show.php/Qt+Linguist+Download?content=89360>`_ being the 
.. highly recommended choice.
.. 
.. 
.. *If you want to translate locally*
.. 
.. * clone the forked repository from your language maintainer (this step copies the repository to your computer)
.. * now that you have all the files on your computer just translate them! (suggested softwares are qt linguist, lokalize, but you can use the software you want)
.. * files translated need to be "synchronized"  with the old ones in the directory of the forked repo
.. * if you are linux users, open the terminal and get in the directory of the forked repo, and just write git add * , this simple command updates the files of the forked repository
.. * now you have to commit the files writing git commit in the bash
.. * at this point the translated files are on your computer only. You need then to upload them on the forked github account. Open the terminal and write git push origin master. Now if you look at your github page the files are updated with the translations.
.. * your language maintainer will take care that every significant translation go into the master repository. 
.. * Generally, as soon as you finish editing one or more .po files, you should commit as soon as possible the edits to the git repository, in order to minimize the possibility of conflicts.
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

Authors and translators
--------------------------------------------------------------------------------

The English QGIS manual (Master Document) and its translation is managed by the Community Assistant (Manual Team Lead) and supported by additional language specific teams.

English Manual (Master Document)
................................................................................

* Community Assistant (Manual Team Lead): ??

  * Contributor : Otto Dassau < dassau[at]gbd-consult.de >
  * Contributor : Larissa Junek < junek[at]gbd-consult.de >

Manual and Application Translations
................................................................................

* Community Assistant (Manual Team Lead): ??

  * Dutch Team Lead : Richard Duivenvoorde < richard[at]duif.net >
  * French Team Lead : Marie Silvestre < marie_silvestre[at]yahoo.fr >
  * German Team Lead : Otto Dassau < dassau[at]gbd-consult.de >
  * Greek Team Lead : Dr. Nicolas Karanikolas (not confirmed)
  * Italian Team Lead : Paolo Cavallini < cavallini[at]faunalia.it >

    * Contributor : Matteo Ghetta
    * Contributor : Iacopo Zetti
    * Contributor : Pasquale Di Donato
    * Contributor : Giuseppe Patti < geognu[at]infinito.it >
    * Contributor : Simona Santini

  * Japanese Team Lead: Kayam Yoichi < yoichi.kayama[at]gmail.com >
  * Lao Team Lead: Anousak Souphavanh < anousak at gmail.com >
  * Lithuanian Team Lead : Kestas M < m.kestas[at]gmail.com >
  * Polish Team Lead : Robert Szczepanek < robert[at]szczepanek.pl >

    * Contributor : Andrzej Swiader < andrzej.swiader[at]uj.edu.pl >

  * Portuguese (pt_BR) Team Lead: Arthur Nanni < comunidade[at]qgisbrasil.org >

    * Contributor : Rodrigo Sperb
    * Contributor : Sidney Goveia

  * Portuguese (pt_PT) Team Lead: Giovanni Manghi < giovanni.manghi[at]faunalia.pt >

    * Contributor : Vânia Neves < vania.neves[at]faunalia.pt >
    * Contributor : Alexandre Neto < senhor.neto[at]gmail.com >
    * Contributor : Zara Teixeira < zarafani[at]gmail.com >

  * Russian Team Lead: Alex Bruy < alexander.bruy[at]gmail.com >
  * Spanish Team Lead : Mario Pisa < mario.pisa[at]gmail.com >

    * Contributor : Carlos Dávila < cdavilam[at]jemila.jazztel.es >


QGIS Website and Website Translation 
--------------------------------------------------------------------------------

QGIS Website and Website Translation is managed by the Community Assistant (Website Team Lead) and supported by numerous contributors.

* Community Assistant (Website and  Website Translation Team Lead): Werner Macho <werner.macho[at]gmail.com>

  * Contributor : Otto Dassau  <dassau[at]gbd-consult.de>

* German Translation

  * Contributor: Horst Düster  <Horst.Duester at bd.so.ch>
  * Contributor: Otto Dassau  <dassau[at]gbd-consult.de>

