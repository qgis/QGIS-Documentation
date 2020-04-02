

.. image:: https://travis-ci.org/qgis/QGIS-Documentation.svg?branch=release_3.4
    :target: https://travis-ci.org/qgis/QGIS-Documentation

This repository is meant to write and manage the Official Documentation of
`QGIS <https://qgis.org>`_, a free and Open Source Geographic Information System (GIS)
Software, under the `Open Source Geospatial (OSGeo) <https://www.osgeo.org>`_ foundation umbrella.

The latest documentation is available at https://docs.qgis.org/latest

<<<<<<< HEAD
To check/create the venv and use it in the build::
=======
Building the documentation
==========================

#. If not provided by your OS, you need to install:
>>>>>>> a69894433... Harmonize instructions to build docs within OS

   * git (https://git-scm.com/download/)
   * and Python3 (https://www.python.org/downloads/windows/)

<<<<<<< HEAD
The venv.mk will create/update a virt env (if not availablie ) in current dir/venv AND run the html build in it.
=======
   You can install both in default places and with default options.
#. Clone the repository (https://help.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository)
#. Go into that directory and follow the next instructions depending on your OS.

The best way to build the documentation is within a Python Virtual Environment (venv).

Build on Linux
--------------

To check/create the venv and use it in the build:
>>>>>>> a69894433... Harmonize instructions to build docs within OS

If you want for some reason start from scratch::

 make -f venv.mk html

The venv.mk will create/update a virtual env (if not available ) in current dir/venv AND run the html build in it.

You can also use that virtual environment later doing::

 source venv/bin/activate

to activate the venv and then run the build from within that venv::

 make html

If you want for some reason start from scratch:

.. code-block:: bash

<<<<<<< HEAD
You can also use your own virtual env by creating it using it first::
=======
 make -f venv.mk cleanall

Build on macOS or Linux
-----------------------

You can also use your own virtual env by creating it first:

.. code-block:: bash
>>>>>>> a69894433... Harmonize instructions to build docs within OS

 # you NEED python >3.6. Depending on distro either use `python3` or `python`
 # common name is 'venv' but call it whatever you like

 python3 -m venv venv  # using the venv module, create a venv named 'venv'

<<<<<<< HEAD
Then activate the venv and install the requirements via the REQUIRMENTS.txt::
=======
Then activate the venv:

.. code-block:: bash
>>>>>>> a69894433... Harmonize instructions to build docs within OS

 source ./venv/bin/activate

With 'activated' virtualenv, you should see 'venv' in the prompt.
Install the requirements via the REQUIREMENTS.txt:

.. code-block:: bash

 pip install -r REQUIREMENTS.txt

<<<<<<< HEAD
and run the build from within that venv::
=======
And run the build from within that venv:

.. code-block:: bash
>>>>>>> a69894433... Harmonize instructions to build docs within OS

 make html

Want to build your own language? Note that you will use the translations from the 
po files from git! For example for 'nl' do::

 make LANG=nl html

Build on Windows
----------------

<<<<<<< HEAD
Then create a virtual environment called 'venv' in that directory, and activate it (Google for Python Virtual Env on Windows for more details), but in short: use the module 'venv' to create a virtual environment called 'venv'
=======
Create a virtual environment called 'venv' in that directory
(search the Internet for Python Virtual Env on Windows for more details), but in short:
use the module 'venv' to create a virtual environment called 'venv'
>>>>>>> a69894433... Harmonize instructions to build docs within OS

::

 # in dos box:
 python -m venv venv
 
Then activate the venv:

.. code-block:: bash

 venv\Scripts\activate.bat

With 'activated' virtualenv, you should see 'venv' in the prompt.
Install the requirements via the REQUIREMENTS.txt:

::

 pip install -r REQUIREMENTS.txt

And run the build from within that venv, using the make.bat script
with the html argument to locally build the docs:

::

 make.bat html
 
Want to build your own language? Note that you will use the translations from the
po files from git! For example 'nl' do::

 set SPHINXOPTS=-D language=nl
 make.bat html



Translating
===========

http://www.sphinx-doc.org/en/master/usage/advanced/intl.html

https://pypi.org/project/sphinx-intl/

https://docs.transifex.com/integrations/transifex-github-integration

To update the english po files (which are being used as SOURCE files in transifex)::

 # FIRST create the pot files in build/gettext (po file be based on those pot files)
 make gettext
 # then update the english po files only:
 sphinx-intl update -p build/gettext -l en

To create the .tx/config to push/pull using tx client do::

 sphinx-intl create-txconfig
 sphinx-intl update-txconfig-resources --transifex-project-name qgisdoc


To update all po files (which we do not use if we do github-transifex integration!!!)::

 export SPHINXINTL_LANGUAGE=de,nl, ...
 # is the same same as
 sphinx-intl <command> --language=de --language=nl ...

We created a script to create the transifex yaml files for github-transifex integrations::

 .\scripts\create_transifex_yaml.sh




