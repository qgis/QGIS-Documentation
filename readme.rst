QGIS Testing Documentation
***************************

.. image:: https://travis-ci.org/qgis/QGIS-Documentation.svg?branch=master
    :target: https://travis-ci.org/qgis/QGIS-Documentation

QGIS Testing Documentation is build from corresponding branche and NOT translated.

Only the current stable branch is available for translation.

Latest stable documentation is on http://docs.qgis.org/2.8

Testing is http://docs.qgis.org/testing

- QGIS 2.6 docs http://docs.qgis.org/2.6
- QGIS 2.2 docs http://docs.qgis.org/2.2
- QGIS 2.0 docs http://docs.qgis.org/2.0
- QGIS 1.8 docs http://docs.qgis.org/1.8

Translations are also available via the docs.qgis.org language path:
for example for the German language: http://docs.qgis.org/2.6/de

PDF versions of the manual are available here: http://docs.qgis.org/2.8/pdf, http://docs.qgis.org/2.6/pdf/ http://docs.qgis.org/2.2/pdf/ 
http://docs.qgis.org/2.0/pdf/, http://docs.qgis.org/1.8/pdf/ and http://docs.qgis.org/testing/pdf


Documentation is static generated website using Sphinx (http://sphinx-doc.org/), 
based on restructured text sources (rst: http://docutils.sourceforge.net/rst.html)
and html (jinja2) templates.

Most sources are in source/docs. Only frontpage and landingpages are in theme/qgis-theme

Styling is in theme/qgis-theme. This theme is used for website and documentation builds. 
The Website version is the canonical one.

Partial / faster building
-------------------------

Because of the size of the documentation, the building of the full docs can take up a long time. 

You can decide to only build certain parts of the documentation by editing the source/conf.py file.

Uncomment the lines for the modules that you NOT want to build in this part of source/conf.py::

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
 # uncomment to exclude doc guides from build                                     
 #exclude_patterns += ['docs/documentation_guidelines/*']                         
 # uncomment to exclude gentle intro  from build                                  
 #exclude_patterns += ['docs/gentle_gis_introduction/*']                          
 # uncomment to exclude pyqgis dev book from build                                
 #exclude_patterns += ['docs/pyqgis_developer_cookbook/*'] 


Building the documentation using Make
-------------------------------------

Building is only tested on Linux systems using make, on windows we now started a Paver setup (see below)

To be able to run localisation targets you will need Sphinx 1.2 which comes with pip. 
Sphinx coming with most distro's is just 1.1.3. You will get an gettext error with those.

Best to run the make file in a virtual env ( http://www.virtualenv.org/ ):

Move to a directory (~/myvirtualenvs/) and create a virtualenv enabled dir::

    virtualenv sphinx  # one time action, only to create the environment
    cd sphinx

And activate this virtualenv::

    source bin/activate 
    # now you will see sphinx before your prompt:
    (sphinx)richard@mymachine

Now always activate your environment before building. To deactivate, you can do::

    deactivate

You can install all tools in on go via the REQUIREMENTS.txt here in root of this repo::

    pip install -r REQUIREMENTS.txt

Alternatively do it one by one:

Install sphinx 1.2 now in your virtual env::

    pip install sphinx==1.2

Sphinx intl extention ( https://pypi.python.org/pypi/sphinx-intl )::

    pip install sphinx-intl

Then build::

    make html (to build the english language)
    make LANG=nl html (to build the dutch version)

If you want add the QGIS-Documentation docs into the build, you either need to manually copy the sources, resources 
and po files into the website project. Or use the fullhtml target of make (which will checkout the 2.0 branch)::

    # to build english:
    make fullhtml
    # to build eg dutch:
    make LANG=nl fullhtml

To gather new strings in a pot (.po) file for your language, and merge them with 
existing translations in the po files (normally to be run by your language maintainer)::

    make pretranslate LANG=xx  # where xx is your language code

To add a new language (the scripts will need some directory structure)::

    make createlang LANG=xx

See the website in action: http://www.qgis.org


Building the Documentation using Docker
-------------------------------------

Docker is an open platform for distributed applications for developers and 
sysadmins (https://www.docker.com/).

Docker can be used on Linux, MacOS  and Windows.

In order to use a docker instance to build the documentation, you need first 
to create your local docker image.

- install Docker (see https://docs.docker.com/installation/#installation)

- clone the QGIS-sysadmin repository::

   git clone git@github.com:qgis/QGIS-Sysadmin.git

- build the docker image::

   cd QGIS-Sysadmin/docker/sphinx
   bash docker-build.sh

- then you can go to your local QGIS-Documentation repository to build the doc::

   cd QGIS-Documentation/
   docker-run.sh LANG=fr html

Building the Documentation using Paver
--------------------------------------

Paver is a python based Make-like tool (http://paver.github.io/paver/)

Paver can be used on Linux and Windows (somebody can test on OSX?)

There are two scripts available:

- bootstrap.py (for setting up the python related stuff)
- pavement.py (the config file for Paver)

General use::

    # first let bootstrap.py install all stuff    
    python bootstrap.py
    
    # if the script is complaining about easysetup missing:
    # download: https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py
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

To make tx.exe usable in the paver script, either put it IN this directory next to the pavement.py file, OR add it to your PATH

IMPORTANT: to be able to pull from transifex.com, you will need a credentials file. 
This file should be named: ``.transifexrc`` and easiest is to put it in your home dir C:/users/you. 
Another option is to put it in the root of this project, but be carefull to not put your credentials in Github :-)

The file should contain this::

	[https://www.transifex.com]
	hostname = https://www.transifex.com
	password = yourtransifexpassword
	token = 
	username = yourtransifexusername

With a working tx and a .transifexrc, you should be able to build for example the german version of docs via::	

        # german:
        paver html -l de
    
During the build you will see this command::

	tx pull --minimum-perc=1 --skip -f -l de
	
This will pull all german po files from transifex (based on the .tx/config file in the root of this project)


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
