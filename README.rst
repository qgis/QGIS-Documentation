

.. image:: https://travis-ci.org/qgis/QGIS-Documentation.svg?branch=master
    :target: https://travis-ci.org/qgis/QGIS-Documentation

This repository is meant to write and manage the Official Documentation of
`QGIS <https://qgis.org>`_, a free and Open Source Geographic Information System (GIS)
Software, under the `Open Source Geospatial (OSGeo) <https://www.osgeo.org>`_ foundation umbrella.

The latest documentation is available at https://docs.qgis.org/latest

Building the documentation
==========================

#. If not provided by your OS, you need to install:

   * git (https://git-scm.com/download/)
   * and Python3 (https://www.python.org/downloads/windows/)

   You can install both in default places and with default options.
#. Clone the repository (https://help.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository)
#. Go into that directory and follow the next instructions depending on your OS.

The best way to build the documentation is within a Python Virtual Environment (venv).

Build on Linux
--------------

To check/create the venv and use it in the build:

.. code-block:: bash

 make -f venv.mk html

The venv.mk will create/update a virtual env (if not available ) in current dir/venv AND run the html build in it.

You can also use that virtual environment later doing:

.. code-block:: bash

 source venv/bin/activate

to activate the venv and then run the build from within that venv:

.. code-block:: bash

 make html

If you want for some reason start from scratch:

.. code-block:: bash

 make -f venv.mk cleanall

Build PDFs
..........

In Linux, you can also build the PDF versions of the main documents

.. code-block:: bash

 make -f venv.mk pdf

Build on macOS or Linux
-----------------------

You can also use your own virtual env by creating it first:

.. code-block:: bash

 # you NEED python >3.6. Depending on distro either use `python3` or `python`
 # common name is 'venv' but call it whatever you like

 python3 -m venv venv  # using the venv module, create a venv named 'venv'

Then activate the venv:

.. code-block:: bash

 source ./venv/bin/activate

With 'activated' virtualenv, you should see 'venv' in the prompt.
Install the requirements via the REQUIREMENTS.txt:

.. code-block:: bash

 pip install -r REQUIREMENTS.txt

And run the build from within that venv:

.. code-block:: bash

 make html

Want to build your own language? Note that you will use the translations from the
po files from git! For example for 'nl' do:

.. code-block:: bash

 make LANG=nl html

If you want to build PDFs in another language, you can use a similar syntax:

.. code-block:: bash

 make LANG=fr html

For building PDFs, you may have to install the texlive extra package for your
specific language (e.g. ``texlive-lang-french``) or install them all
(``texlive-lang-french``).


Build on Windows
----------------

Create a virtual environment called 'venv' in that directory
(search the Internet for Python Virtual Env on Windows for more details), but in short:
use the module 'venv' to create a virtual environment called 'venv'

.. code-block:: bash

 # in dos box:
 python -m venv venv

Then activate the venv:

.. code-block:: bash

 venv\Scripts\activate.bat

With 'activated' virtualenv, you should see 'venv' in the prompt.
Install the requirements via the REQUIREMENTS.txt:

.. code-block:: bash

 pip install -r REQUIREMENTS.txt

And run the build from within that venv, using the make.bat script
with the html argument to locally build the docs:

.. code-block:: bash

 make.bat html

Want to build your own language? Note that you will use the translations from the
po files from git! For example 'nl' do:

.. code-block:: bash

 set SPHINXOPTS=-D language=nl
 make.bat html



Translating
===========

http://www.sphinx-doc.org/en/master/usage/advanced/intl.html

https://pypi.org/project/sphinx-intl/

https://docs.transifex.com/integrations/transifex-github-integration


To update the english po files (which are being used as SOURCE files in transifex):

.. code-block:: bash

 # FIRST create the pot files in build/gettext (po file be based on those pot files)
 make gettext
 # then update the english po files only:
 sphinx-intl update -p build/gettext -l en

To create the .tx/config to push/pull using tx client do:

.. code-block:: bash

 # Creating the txconfig is only to be once the first time (we have one now...)
 #sphinx-intl create-txconfig
 sphinx-intl update-txconfig-resources --transifex-project-name qgis-documentation

 # Then (only Transifex admin) can push the po source files to Transifex
 tx push -fs --no-interactive (push the source (-f) files forcing (-f) overwriting the ones their without asking (--no-interactive)


To update all po files of all languages (Which we do not use here! This is done by Transifex):

.. code-block:: bash

 export SPHINXINTL_LANGUAGE=de,nl, ...
 # is the same same as
 sphinx-intl <command> --language=de --language=nl ...

We created a script to create the transifex yaml files for github-transifex integrations.

BUT we do not do this yet as there were some technical issues...

.. code-block:: bash

 .\scripts\create_transifex_yaml.sh

