QGIS Documentation
******************

.. image:: https://travis-ci.org/qgis/QGIS-Documentation.svg?branch=master
    :target: https://travis-ci.org/qgis/QGIS-Documentation

.. contents::
   :local:

Introduction
------------

This repository is meant to write and manage the Official Documentation of
`QGIS <https://qgis.org>`_, an Open Source GIS Software.

Latest stable documentation is on http://docs.qgis.org/3.4 and its PDF versions
are available at http://docs.qgis.org/3.4/pdf.

The ongoing work for future releases is published as QGIS Testing Documentation.
It's built from the ``master`` branch and NOT translated. QGIS Testing Documentation
is on http://docs.qgis.org/testing and http://docs.qgis.org/testing/pdf/

Previous releases are also available:

- QGIS 2.18 docs http://docs.qgis.org/2.18 and http://docs.qgis.org/2.18/pdf/
- QGIS 2.14 docs http://docs.qgis.org/2.14 and http://docs.qgis.org/2.14/pdf/
- QGIS 2.8 docs http://docs.qgis.org/2.8 and http://docs.qgis.org/2.8/pdf/

Translations of released docs are also available via the docs.qgis.org language path:
for example for the 3.4 German language: http://docs.qgis.org/3.4/de.
Note that only the current stable branch is available for translation.

Documentation is static generated website using Sphinx (http://sphinx-doc.org/),
based on restructured text sources (rst: http://docutils.sourceforge.net/rst.html)
and html (jinja2) templates.

Most sources are in source/docs. Only frontpage and landing pages are in theme/qgis-theme

Styling is in theme/qgis-theme. This theme is used for website and documentation builds.
The website version is the canonical one.

Partial / faster building
-------------------------

Because of the size of the documentation, the building of the full docs can take up a long time.

You can decide to only build certain parts of the documentation by editing the source/conf.py file.

Uncomment the lines for the modules that you do NOT want to build in this part of source/conf.py::

 # List of patterns, relative to source directory, that match files and
 # directories to ignore when looking for source files.
 exclude_patterns = ['../output', "../i18n", "../resources", "../scripts"]
 # for faster builds, you can exclude certain parts from the build
 # uncomment one or more lines below, or construct such line yourself
 # uncomment to exclude the processing algs from build
 #exclude_patterns += ['docs/user_manual/processing_algs/*']
 # uncomment to exclude the user manual from build
 #exclude_patterns += ['docs/user_manual/*']
 # uncomment to exclude training manual from build
 #exclude_patterns += ['docs/training_manual/*']
 # uncomment to exclude dev guides from build
 #exclude_patterns += ['docs/developers_guide/*']
 # uncomment to exclude doc guides from build
 #exclude_patterns += ['docs/documentation_guidelines/*']
 # uncomment to exclude gentle intro  from build
 #exclude_patterns += ['docs/gentle_gis_introduction/*']
 # uncomment to exclude pyqgis dev book from build
 #exclude_patterns += ['docs/pyqgis_developer_cookbook/*']


Building the documentation using Make
-------------------------------------

Building is only tested on Linux systems using make, on windows we now started a Paver setup (see below)

* ``make -f venv.mk html`` to build the english language
* ``make -f venv.mk LANG=nl html`` to build the dutch version

Note that with option ``-f venv.mk``, ``make`` will create and use a Python3 virtual environment with
required dependencies in ``/venv`` folder on the fly. Once created you can activate this virtual environment
using::

   source venv/bin/activate

No need to use option ``-f venv.mk`` after that.

Speed up the documentation build
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Running ``make html`` generates **from scratch** the full english documentation.
You can see from the output that after it removes the content from static it runs the
``sphinx-build -nW -b html -d output/doctrees  -D language=en -A language=en source output/html/en`` command.
If you change something in the documentation source and you want to preview the changes you shouldn't reuse
``make html`` command as it will fully rebuild everything. This takes a lot of time.
It's far better to use the ``sphinx-build`` command so it only builds the parts from the files that have been
changed. This ensures a very short build time (several seconds). Pay attention that if you add images in the
``resources`` directory they won't be copied  into the ``static`` directory if you don't use the ``make``
command. This means that your ``sphinx-build`` command won't find the new images. If you still want to build
fast you should copy the new images from ``resources`` to their correspondant location under ``static``.
Keep in mind that different options of the ``make`` command (presented down the page) are outputting different
``sphinx-build`` commands.

You should also be aware that the ``make ..`` commands are made for production purposes which translates that
the build will stop at the first inconsitency because of the ``sphinx-build -nW ..`` command. You should drop
the ``-W`` option if you want your build to fully complete (with warnings of course)
(e.g. ``sphinx-build -n -b html -d output/doctrees  -D language=en -A language=en source output/html/en``).


If you want add the QGIS-Documentation docs into the build, you either need
to manually copy the sources, resources and po files into the website project.
Or use the fullhtml target of make (which will checkout the branch)::

    # to build english:
    make fullhtml
    # to build eg dutch:
    make LANG=nl fullhtml

Trying to build a fullhtml you might get an Exception: ``No user credentials found for host https://www.transifex.com``.
To fix this, add a ``~/.transifexrc`` file stored in the user's home directory with following information::

    [https://www.transifex.com]
    username = user
    token =
    password = p@ssw0rd
    hostname = https://www.transifex.com

To gather new strings in a pot (.po) file for your language, and merge them with
existing translations in the po files (normally to be run by your language maintainer)::

    make pretranslate LANG=xx  # where xx is your language code

To add a new language (the scripts will need some directory structure)::

    make createlang LANG=xx

See the website in action: http://www.qgis.org

Building PDF
^^^^^^^^^^^^

You will need to install **texi2pdf** by doing:

* ``sudo apt-get install texinfo`` on Debian based systems
* ``sudo yum install texinfo-tex`` on Fedora based systems

Alike the html build command, you need to run make with the option to build pdf
(pdf also builds the html output):

``make LANG=xx pdf``


Building the Documentation using Docker
-------------------------------------

Docker is an open platform for distributed applications for developers and
sysadmins (https://www.docker.com/).

Docker can be used on Linux, MacOS  and Windows.

In order to use a Docker instance to build the documentation, you can use
one of the scripts provided with QGIS-Documentation. The image will be installed
if not already present.

- install Docker (see https://docs.docker.com/engine/installation/)

- go to your local QGIS-Documentation repository to build the doc::

   cd QGIS-Documentation/
   ./docker-run.sh LANG=fr html

Building the Documentation using Paver
--------------------------------------

Paver is a python based Make-like tool (http://paver.readthedocs.io/en/latest/)

Paver can be used on Linux and Windows (somebody can test on OSX?)

There are two scripts available:

- bootstrap.py (for setting up the python related stuff)
- pavement.py (the config file for Paver)

General use::

    # first let bootstrap.py install all stuff
    python bootstrap.py

    # if the script is complaining about easysetup missing:
    # download: http://setuptools.readthedocs.io/en/latest/easy_install.html
    # and install that first:
    python ez_setup.py

    # after succesfull running of bootstrap.py you have all wheels on place, the script has created a virtual
    environment (called "virtualenv") with all Sphinx related python machinery. Now you just need to:
    # 1) activate the virtual environment with all Sphinx related python machinery
    # 2) run the actual script to build the documentation

    # to go into the virtual environment:
    # on Windows:
    virtualenv\Scripts\activate
    # on Linux:
    source virtualenv/bin/activate

    # now build :) (make sure that you are in the QGIS-Documentation root folder)
    # eg english only (for testing, only QGIS stable is being translated)
    paver html

To be able to build localized versions of the Documentation with paver the
'Transifex-client (tx)' is needed.

On linux, install with::

	# note that we use a slightly older version of tx
	pip install transifex-client==0.9

On Windows, you should download it from: http://files.transifex.com/transifex-client/0.10/tx.exe
see http://support.transifex.com/customer/portal/articles/998120-client-on-windows

To make tx.exe usable in the paver script, either put it IN this directory
next to the pavement.py file, OR add it to your PATH

IMPORTANT: to be able to pull from transifex.com, you will need a credentials file.
This file should be named: ``.transifexrc`` and easiest is to put it in your home dir C:/users/you.
Another option is to put it in the root of this project, but be carefull to not put your credentials in Github :-)

The file should contain this::

	[https://www.transifex.com]
	hostname = https://www.transifex.com
	password = yourtransifexpassword
	token =
	username = yourtransifexusername

With a working tx and a .transifexrc, you should be able to build
for example the german version of docs via::

        # german:
        paver html -l de

During the build you will see this command::

	tx pull --minimum-perc=1 --skip -f -l de

This will pull all german po files from transifex (based on the
.tx/config file in the root of this project)


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

  * Romanian Team Lead: Sorin Călinică < sorin.calinica[at]gmail.com >, Tudor Bărăscu < tudor.barascu[at]qtibia.ro >

    * Contributor: Georgiana Ioanovici
    * Contributor: Alex Bădescu

  * Russian Team Lead: Alex Bruy < alexander.bruy[at]gmail.com >

  * Spanish Team Lead : Carlos Dávila < cdavilam[at]orangecorreo.es >


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

* Romanian Translation

  * Contributor: Sorin Călinică < sorin.calinica[at]gmail.com >
  * Contributor: Tudor Bărăscu < tudor.barascu[at]qtibia.ro >


Testing Python snippets
***********************

To test Python code snippets, you need a *QGIS* installation, for this there are many options:

You can use your system *QGIS* installation with *Sphinx* from Python virtual environment::

   make -f venv.mk doctest

You can use a manually built installation of *QGIS*, to do so, you need to create a custom ``Makefile``
extension on top of the ``venv.mk`` file, for example a ``user.mk`` file with the following content::

   # Root installation forder
   QGIS_PREFIX_PATH = /home/user/apps/qgis-master

   # Or build output folder
   QGIS_PREFIX_PATH = /home/user/dev/QGIS-build-master/output

   include venv.mk

Then use it to run target ``doctest``::

   make -f user.mk doctest

Or you can run target ``doctest`` inside the official *QGIS* docker image::

   make -f docker.mk doctest

Note that only code blocks with directive ``testcode`` are tested and it is possible to run tests setup code
which does not appear in documentation with directive ``testsetup``, for example::

   .. testsetup::

      from qgis.core import QgsCoordinateReferenceSystem

   .. testcode::

      # PostGIS SRID 4326 is allocated for WGS84
      crs = QgsCoordinateReferenceSystem(4326, QgsCoordinateReferenceSystem.PostgisCrsId)
      assert crs.isValid()

For more information see *Sphinx* doctest extension documentation:
https://www.sphinx-doc.org/en/master/usage/extensions/doctest.html
