

.. image:: https://travis-ci.org/qgis/QGIS-Documentation.svg?branch=release_3.10
    :target: https://travis-ci.org/qgis/QGIS-Documentation

Build on Linux
==============

Best to build in a Python Virtual Environment

To check/create the venv and use it in the build::

 make -f venv.mk html

The venv.mk will create/update a virt env (if not availablie ) in current dir/venv AND run the html build in it.

If you want for some reason start from scratch::

 make -f venv.mk cleanall

You can also use that virtual environment later doing::

 source venv/bin/activate

to activate the venv and then run the build from within that venv::

 make html

Alternative
...........

You can also use your own virtual env by creating it using it first::

 # you NEED python >3.6. Depending on distro either use `python3` or `python`
 # common name is 'venv' but call it whatever you like

 python3 -m venv venv  # using the venv module, create a venv named 'venv'

Then activate the venv and install the requirements via the REQUIRMENTS.txt::

 source ./venv/bin/activate
 pip install -r REQUIREMENTS.txt

and run the build from within that venv::

 make html

Want to build your own language? Note that you will use the translations from the 
po files from git! For example for 'nl' do::

 make LANG=nl html

Build on Windows
================

You need to install git (https://git-scm.com/download/win) and Python3 (https://www.python.org/downloads/windows/)

Install both in default places and with default options.

Clone the repository, and go into that directory.

Then create a virtual environment called 'venv' in that directory, and activate it (Google for Python Virtual Env on Windows for more details), but in short: use the module 'venv' to create a virtual environment called 'venv'

::

 # in dos box:
 python -m venv venv
 venv\Scripts\activate.bat

Now install (with 'activated' virtualenv, you should see 'venv' in the prompt), install all requirements

::

 pip install -r REQUIREMENTS.txt

Now use the make.bat script with the html argument to locally build the docs:

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
 sphinx-intl update-txconfig-resources --transifex-project-name qgis-documentation


To update all po files (which we do not use if we do github-transifex integration!!!)::

 export SPHINXINTL_LANGUAGE=de,nl, ...
 # is the same same as
 sphinx-intl <command> --language=de --language=nl ...

We created a script to create the transifex yaml files for github-transifex integrations::

 .\scripts\create_transifex_yaml.sh




