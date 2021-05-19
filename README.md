<img src="https://github.com/qgis/QGIS/blob/master/images/README-md/main_logo.png" width="300" alt="Our full logo">

[![Docs Builds](https://github.com/qgis/QGIS-Documentation/workflows/Docs%20builds/badge.svg?branch=master)](https://github.com/qgis/QGIS-Documentation/actions/workflows/builds.yml?query=branch%3Amaster+event%3Apush)
[![Doctest Build](https://github.com/qgis/QGIS-Documentation/workflows/Doctest%20build/badge.svg?branch=master)](https://github.com/qgis/QGIS-Documentation/actions/workflows/doctest.yml?query=branch%3Amaster+event%3Apush)
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

If you want to build PDFs in a language other than English, you can use a similar syntax:

```
make LANG=fr pdf
```

For building PDFs in English you will need to install the XeLaTex compiler package `texlive-xetex` and GNU Freefont.

```
sudo apt install texlive-xetex font-freefonts-otf
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

We rely on the [Transifex platform](https://transifex.com) to store and coordinate
our translation efforts. To be part of the translation team, please follow
[becoming a translator](https://www.qgis.org/en/site/getinvolved/translate.html#becoming-a-translator).

The process is automated using some custom scripts and GitHub integration:
* [create_transifex_resources](scripts/create_transifex_resources.sh):
creates/updates the [.tx/config](.tx/config) file with references of the English
source files and their translation in the GitHub repository and link them to
the resources in Transifex.
This may only be necessary when releasing a new branch, to push local strings to Transifex.
* [pofiles action](.github/workflows/pofiles.yml): update English `*.po` files
with recent changes in the source files 
* The [Transifex GitHub integration](https://docs.transifex.com/integrations/transifex-github-integration):
  manages pulls and pushes of the strings, in other words:
  - Tracks any changes of the English `*.po` resource files in GitHub
    and automatically sends them to the Transifex platform
  - Each language translator can begin translating the new strings
  - When a resource is 100% translated, automatically sends back
    the translated `*.po` file to GitHub, for build.

Based on the above, translated strings are automatically available in released
branch so building the docs in any translated locale is possible following
the instructions in earlier sections:
```
make html LANG=yourlanguage
```

You may however want to pull unfinished translated resources to build.
To do so, you need to manually pull the translations from Transifex to your local repository:

1. Checkout locally the repository and target branch in git
1. Prepare the environment
   ```
   python3 -m venv venv
   source ./venv/bin/activate
   pip install -r REQUIREMENTS.txt
   ```
1. Update resources references in the config file.
   This is necessary to catch any new or removed files.
   ```
   ./scripts/create_transifex_resources.sh
   ```
1. Download the translated strings using the [minimize_translation script](scripts/minimize_translation.sh).
   By default this pulls all the languages.
   ```
   ./scripts/minimize_translation.sh
   ```
   To pull a specific language (e.g. italian), do
   ```
   ./scripts/minimize_translation.sh -l it
   ```

   IMPORTANT: to be able to pull from transifex.com, you will need a credentials file. 
   This file should be named: ``.transifexrc`` and easiest is to put it in your home dir. 
   The file should contain this:
   ```
   [https://www.transifex.com]
   hostname = https://www.transifex.com
   password = yourtransifexpassword
   token = 
   username = yourtransifexusername
   ```
1. Build the docs in your language
   ```
   make html LANG=yourlanguage
   ```
1. Share the changes by opening a pull-request, allowing us to integrate
   the new strings for the pulled language(s)
