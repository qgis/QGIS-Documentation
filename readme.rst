******************
QGIS Documentation
******************

It is possible to read the HTML version of the documentation here:

* English: http://documentation.qgis.org/2.0/html/en/docs/user_manual/index.html

From there you find the translations like:

* French: http://documentation.qgis.org/2.0/html/fr/docs/user_manual/index.html
* German: http://documentation.qgis.org/2.0/html/de/docs/user_manual/index.html
* Hindi: http://documentation.qgis.org/2.0/html/hi/docs/user_manual/index.html
* Italian: http://documentation.qgis.org/2.0/html/it/docs/user_manual/index.html
* Japanese: http://documentation.qgis.org/2.0/html/ja/docs/user_manual/index.html
* Portuguese: http://documentation.qgis.org/2.0/html/pt/docs/user_manual/index.html
* Russian: http://documentation.qgis.org/2.0/html/ru/docs/user_manual/index.html
* Spanish: http://documentation.qgis.org/2.0/html/es/docs/user_manual/index.html
* Dutch: http://documentation.qgis.org/2.0/html/nl/docs/user_manual/index.html

It is also available via the subdomain docs.qgis.org, 
for example for the German language: http://docs.qgis.org/2.0/html/de/docs/user_manual/index.html

In the docs.qgis.org site the documentation is scheduled to be built every 8 hours.

PDF versions of the manual are available here: http://documentation.qgis.org/2.0/pdf/

Tools you need to install, if you want to work on the documentation
-------------------------------------------------------------------

If you plan to update or translate the manual locally, you will need to create a
github account and install the following tools:

* ``git`` (from packagemanager) to clone/download the source from Github.com
* ``gettext`` (from packagemanager) for translation tools
* ``texlive`` (from packagemanager: on Arch, it is texlive-core and texlive-bin)
* ``texlive-fonts-recommended`` (Ubuntu: from packagemanager)
* in debian you'll need ``texlive-latex-extra``:
  ``sudo apt-get install texlive-latex-extra`` (``texlive-latexextra`` on Arch)
* ``python-pip`` python installation (via ``sudo apt-get install python-pip``)
* ``sphinx`` (via ``sudo pip install sphinx``; on Arch install ``python-sphinx``)
* ``texi2pdf`` (from packagemanager: in Ubuntu it is in package ``texinfo``)
* ``dvi2png`` (from packagemanager: in Ubuntu it is in package ``dvi2png``)

*****************************************
Working on the english QGIS Documentation
*****************************************

This section describes who to update/edit the english master documentation.

* get an account on github.com
* install required tools on your computer
* login to github and create a fork of the QGIS-Documentation master branch
* git clone your forked QGIS Documentation project to your computer
* run ``./scripts/post_translate.sh en`` locally to build the english docs
* edit/update the rst files with the english documentation from ``./source/docs/user_manual/``
* run ``./scripts/post_translate.sh en`` locally again to check your changes
* commit your changes to your forked repository
* create a pull request to merge your changes into the official QGIS-Documentation
  repository

If you are more experienced you can also ask for direct write access to the
official QGIS-Documentation repository at the community-team mailing list.

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

You can now edit the rst files in the folder ``./source/docs/user_manual/``, e.g.::

 cd source/docs/user_manual/preamble/
 gedit foreword.rst

After editing the rst file, run ``post_translate.sh en`` again to build the english
pdf and html files::

 cd QGIS-Documentation
 sh scripts/post_translate.sh en

.. note:: if you want to create docs in another language, use the locale code as
   parameter.

For example, to create italian docs::

 cd QGIS-Documentation
 sh scripts/post_translate.sh it

Now check, if the manual built correctly and commit and push your changes to your
forked repository::

 git commit source/docs/user_manual/preamble/foreword.rst -m 'updated foreword'
 git push

In your github account you can now open a pull request to merge your changes from
your forked to the official QGIS Documentation repository.

******************************************
Translating the english QGIS Documentation
******************************************

Every language has it's own maintainer, please contact them, if you want to help.
You find a list of current language maintainers at the end of this document. If
your language is not listed, please contact the `QGIS-Community-Team Mailinglist
<http://lists.osgeo.org/mailman/listinfo/qgis-community-team>`_ and ask for help.

Howto for language maintainers
------------------------------

* get an account on github.com
* install required tools on your computer
* login to github and create a fork of the QGIS-Documentation translation branch,
  e.g. ``manual_en_v1.8`` that other translators can work with.

Translators now can create their own fork from the forked repository of the
maintainer, commit their translations to their own forked repository and send
pull request to the language maintainer's repository. Once the maintainer receives
a pull request, he should check the changes, accept the pull request and merge
the changes with the official QGIS Documentation repository.

If the maintainer needs to add a new language workflow
------------------------------------------------------

* add your locale code in the pre_translate.sh script in the line with ``LOCALE=``
* run ``scripts/pre_translate.sh``. There will be a new directory in the i18n
  directory for your language, containing the po-files for all source files
* create an empty(!) directory in the resources directory for your language. The
  idea is to ONLY put images in exact the same directory structure if you want an
  image to be 'translated'. As default the english one will be used from the ``en``
  directory, and only if there is an translated one it wil be found and used.
* add your locale code in the post_translate.sh script in the line with ``LOCALE=``

Howto for translators
---------------------

* get an account on github.com
* install required tools on your computer
* login to github and create a fork of the QGIS-Documentation translation branch,
  e.g. ``manual_en_v1.8`` from your language maintainer.
* git clone your forked QGIS Documentation project to your computer
* run ``./scripts/pre_translate.sh <language>`` locally to build the translation
  files
* translate the .po files locally and use an offline editor. `QtLinguist
  <http://qt-apps.org/content/show.php/Qt+Linguist+Download?content=89360>`_ being
  the highly recommended choice.with the english documentation from ./source/docs/user_manual/
* run ``./scripts/post_translate.sh <language>`` locally again to check your translation
* files translated need to be "synchronized"  with the ones in the directory of
  the forked repo. Commit your changes to your private forked repository and
  create a pull request on github. It means that you send a request to the owners
  of the repository you forked (language maintainer) asking him to accept your
  translations and move them to the "original repository". For doing that go on
  github.com, browse on the directory of your repository and click pull request
  (https://help.github.com/articles/using-pull-requests).
* your language maintainer will take care that every significant translation go
  into the master repository.
* Generally, as soon as you finish editing one or more .po files, you should
  commit as soon as possible the edits to the git repository, in order to minimize
  the possibility of conflicts.

The maintainer and translator should update and check the translations regularly.
Therefore you should ``git pull`` when you start to work and run the
``scripts/pre_translate.sh <language>`` and  ``scripts/post_translate.sh <language>``
script after every significant change in the documentation. This will generate
and update the .po files needed for translations. If all is fine, take care, that
the translation go into the repository of your language maintainer.

A thorough explanation for translators working with locally with linguist is
written here: http://docs.qgis.org/html/en/docs/documentation_guidelines/do_translations.html

***********************
Authors and translators
***********************

The English QGIS manual (Master Document) and its translation is managed by the
Community Assistant (Manual Team Lead) and supported by additional language
specific teams.

English Manual (Master Document)
--------------------------------

* Community Assistant (Manual Team Lead): ??

  * Contributor : Otto Dassau < dassau[at]gbd-consult.de >
  * Contributor : Larissa Junek < junek[at]gbd-consult.de >

Manual and Application Translations
-----------------------------------

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
------------------------------------

QGIS Website and Website Translation is managed by the Community Assistant (Website
Team Lead) and supported by numerous contributors.

* Community Assistant (Website and  Website Translation Team Lead): Werner Macho <werner.macho[at]gmail.com>

  * Contributor : Otto Dassau  <dassau[at]gbd-consult.de>

* German Translation

  * Contributor: Horst Düster  <Horst.Duester at bd.so.ch>
  * Contributor: Otto Dassau  <dassau[at]gbd-consult.de>

* Russian Translation

  * Contributor: Alexander Bruy  <alexander.bruy[at]gmail.com>
