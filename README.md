[![HTML Build](https://github.com/qgis/QGIS-Documentation/workflows/HTML%20build/badge.svg?branch=master)](https://github.com/qgis/QGIS-Documentation/actions?query=branch%3Amaster+workflow%3A%22HTML+build%22)
[![Doctest Build](https://github.com/qgis/QGIS-Documentation/workflows/Doctest%20build/badge.svg?branch=master)](https://github.com/qgis/QGIS-Documentation/actions?query=branch%3Amaster+workflow%3A%22Doctest+build%22)
[![Read the documentation](https://img.shields.io/badge/Read-the%20docs-green.svg)](https://docs.qgis.org/testing/)


This repository is meant to write and manage the Official Documentation of [QGIS](https://qgis.org),
a free and Open Source Geographic Information System (GIS) Software, under the
[Open Source Geospatial (OSGeo)](https://www.osgeo.org) foundation umbrella.

The latest documentation is available at <https://docs.qgis.org/latest>

* [Building the documentation](#building-the-documentation)
   * [Build on Linux](#build-on-linux)
   * [Build on macOS or Linux](#build-on-macos-or-linux)
   * [Build on Windows](#build-on-windows)
   * [Build PDFs](#build-pdfs)
* [Translating](#translating)

# Building the documentation

1. If not provided by your OS, you need to install:

   - [git](https://git-scm.com/download/)
   - and [Python3](https://www.python.org/downloads/)

   You can install both in default places and with default options.
1. [Clone the repository](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository)
1. Go into that directory and follow the next instructions depending on your OS.

The best way to build the documentation is within a Python Virtual Environment (venv).

## Build on Linux

To check/create the venv and use it in the build:

```
make -f venv.mk html
```

The venv.mk will create/update a virtual env (if not available) in current dir/venv AND run the html build in it.

You can also use that virtual environment later doing:

```
source venv/bin/activate
```

to activate the venv and then run the build from within that venv:

```
make html
```

If, for some reason, you want to start from scratch:

```
make -f venv.mk cleanall
```

## Build on macOS or Linux

You can also use your own virtual env by creating it first:

```
# you NEED python >3.6. Depending on distro either use `python3` or `python`
# common name is 'venv' but call it whatever you like

python3 -m venv venv  # using the venv module, create a venv named 'venv'
```

Then activate the venv:

```
source ./venv/bin/activate
```

With 'activated' virtualenv, you should see 'venv' in the prompt. Install the requirements via the REQUIREMENTS.txt:

```
pip install -r REQUIREMENTS.txt
```

And run the build from within that venv:

```
make html
```

Want to build your own language? Note that you will use the translations from the po files from git! For example for 'nl' do:

```
make LANG=nl html
```

## Build on Windows

Create a virtual environment called 'venv' in that directory (search the Internet for Python Virtual
Env on Windows for more details), but in short: use the module 'venv' to create a virtual environment called 'venv'

```
# in dos box:
python -m venv venv
```

Then activate the venv:

```
venv\Scripts\activate.bat
```

With 'activated' virtualenv, you should see 'venv' in the prompt. Install the requirements via the REQUIREMENTS.txt:

```
pip install -r REQUIREMENTS.txt
```

And run the build from within that venv, using the make.bat script with the html argument to locally build the docs:

```
make.bat html
```

Want to build your own language? Note that you will use the translations from the po files from git! For example 'nl' do:

```
set SPHINXOPTS=-D language=nl
make.bat html
```

## Build PDFs

In Linux, you can also build the PDF versions of the main documents.

```
make -f venv.mk pdf
```

Or after you enabled the venv:

```
make pdf
```

For building PDFs you will need to install the XeLaTex compiler package `textlive-xetex` and GNU Freefont.

```
sudo apt install textlive-xetex fonts-freefont
```

If you want to build PDFs in a language other than English, you can use a similar syntax:

```
make LANG=fr pdf
```

For building translated PDFs, you may have to install the texlive extra package
for your specific language (e.g. `texlive-lang-french`).
For japanese, it's crucial to install `texlive-lang-japanese`, which will install the platex compiler.
If you plan to build all languages, it might be easier to install all languages packages (`texlive-lang-all`),
but it will use a considerable amount of disk space.

Some languages will also need specific fonts installed:

-   Korea (ko) - NanumMyeongjo from the `fonts-nanum` package
-   Hindi (hi) - Nakula from the `fonts-nakula` package

# Translating

<http://www.sphinx-doc.org/en/master/usage/advanced/intl.html>

<https://pypi.org/project/sphinx-intl/>

<https://docs.transifex.com/integrations/transifex-github-integration>

To update the english po files (which are being used as SOURCE files in transifex):

```
# FIRST create the pot files in build/gettext (po file be based on those pot files)
make gettext
# then update the english po files only:
sphinx-intl update -p build/gettext -l en
```

To create the `.tx/config` file to push/pull using tx client do:

```
# Creating the txconfig is only to be done the first time (we have one now...)
#sphinx-intl create-txconfig

# Update list of resources (necessary when files were added or removed)
sphinx-intl update-txconfig-resources --transifex-project-name qgis-documentation

# Then (only Transifex admin) can push the po source files to Transifex
tx push -fs --no-interactive #push the source (-s) files forcing (-f) overwriting the ones there without asking (--no-interactive)
```

To update all po files of all languages (Which we do not use here! This is done by Transifex):

```
export SPHINXINTL_LANGUAGE=de,nl, ...
# is the same same as
sphinx-intl <command> --language=de --language=nl ...
```

We created a script to create the transifex yaml files for github-transifex integrations.

BUT we do not do this yet as there were some technical issues...

```
.\scripts\create_transifex_yaml.sh
```
