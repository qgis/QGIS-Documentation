QGIS Testing Documentation
***************************

QGIS Testing Documentation is build from corresponding branche and NOT translated.

Only the current stable branch is translated.

Stable documentation is on http://docs.qgis.org/2.2

Testing is http://docs.qgis.org/testing

QGIS 2.0 docs http://docs.qgis.org/2.0
QGIS 1.8 docs http://docs.qgis.org/1.8

Translations are also available via the docs.qgis.org language path:
for example for the German language: http://docs.qgis.org/2.2/de

PDF versions of the manual are available here: http://docs.qgis.org/2.2/pdf/ 
http://docs.qgis.org/2.0/pdf/, http://docs.qgis.org/1.8/pdf/ and http://docs.qgis.org/testing/pdf


Documentation is static generated website using Sphinx (http://sphinx-doc.org/), 
based on restructured text sources (rst: http://docutils.sourceforge.net/rst.html)
and html (jinja2) templates.

Most sources are in source/docs. Only frontpage and landingpages are in theme/qgis-theme

Styling is in theme/qgis-theme. This theme is used for website and documentation builds. 
The Website version is the canonical one.


Building the documentation using Make
-------------------------------------

Building is only tested on Linux systems using make, on windows we now started a Paver setup (see below)

To be able to run localisation targets you will need Sphinx 1.2 which comes with pip. 
Sphinx coming with most distro's is just 1.1.3. You will get an gettext error with those.

Best to run the make file in a virtual env ( http://www.virtualenv.org/ ):

Move to a directory (~/myvirtualenvs/) and create a virtualenv enabled dir:

    virtualenv sphinx  # one time action, only to create the environment
    cd sphinx

And activate this virtualenv

    source bin/activate 
    # now you will see sphinx before your prompt:
    (sphinx)richard@mymachine

Now always activate your environment before building. To deactivate, you can do:

    deactivate

You can install all tools in on go via the REQUIREMENTS.txt here in root of this repo:

    pip install -r REQUIREMENTS.txt

Alternatively do it one by one:

Install sphinx 1.2 now in your virtual env:

    pip install sphinx==1.2

Sphinx intl extention ( https://pypi.python.org/pypi/sphinx-intl ):

    pip install sphinx-intl

Then build:

    make html (to build the english language)
    make LANG=nl html (to build the dutch version)

If you want add the QGIS-Documentation docs into the build, you either need to manually copy the sources, resources 
and po files into the website project. Or use the fullhtml target of make (which will checkout the 2.0 branch):

    # to build english:
    make fullhtml
    # to build eg dutch:
    make LANG=nl fullhtml

To gather new strings in a pot (.po) file for your language, and merge them with 
excisting translations in the po files (normally to be ran by your language maintainer):

    make pretranslate LANG=xx  # where xx is your language code

To add a new language (the scripts will need some directory structure):

    make createlang LANG=xx

See the website in action: http://www.qgis.org


Building the website using Paver
--------------------------------

Paver is a python based Make-like tool (http://paver.github.io/paver/)

Paver can be used on Linux and Windows (somebody can test on OSX?)

There are two scripts available:

- bootstrap.py (for setting up the python related stuff)
- pavement.py (the config file for Paver)

General use:

    # first let bootstrap.py install all stuff    
    python bootstrap.py
    
    # if the script is complaining about easysetup missing:
    # download: https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py
    # and install that first:
    python ez_setup.py

    # after succesfull running of bootstrap.py you have all wheels on place to
    # 1) create a virtual environment with all Sphinx related python machinery
    # 2) run the actual script to build the website
    
    # to go into the virtual environment:
    # on Windows:
    virtualenv\Scripts\activate
    # on Linux:
    source virtualenv/bin/activate
    
    # now build (only website, no included Documentation yet):
    # eg english only:
    paver html
    # or the dutch version:
    paver html -l nl
    # german:
    paver html -l de
    


Translating the english QGIS Documentation
******************************************

Translating of the Documentation is handled via transifex: http://www.transifex.com

ONLY the current stable branch is translated. 

If you want to help translating: create an account and join one of the translation
teams of the qgis project: https://www.transifex.com/organization/qgis

Every language has it's own maintainer, please contact them, if you want to help.
You find a list of current language maintainers at the end of this document. If
your language is not listed, please contact the `QGIS-Community-Team Mailinglist
<http://lists.osgeo.org/mailman/listinfo/qgis-community-team>`_ and ask for help.


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
