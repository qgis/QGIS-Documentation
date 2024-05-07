<img src="https://github.com/qgis/QGIS/blob/master/images/README-md/main_logo.png" width="300" alt="Our full logo">

[![Docs Builds](https://github.com/qgis/QGIS-Documentation/workflows/Docs%20builds/badge.svg?branch=master)](https://github.com/qgis/QGIS-Documentation/actions/workflows/builds.yml?query=branch%3Amaster+event%3Apush)
[![Doctest Build](https://github.com/qgis/QGIS-Documentation/workflows/Doctest%20build/badge.svg?branch=master)](https://github.com/qgis/QGIS-Documentation/actions/workflows/doctest.yml?query=branch%3Amaster+event%3Apush)
[![Read the documentation](https://img.shields.io/badge/Read-the%20docs-green.svg)](https://docs.qgis.org/testing/)


This repository is meant to write and manage the Official Documentation of [QGIS](https://qgis.org),
a free and Open Source Geographic Information System (GIS) Software
whose source code can be found in [this repository](https://github.com/qgis/QGIS).
QGIS is part of the [Open Source Geospatial (OSGeo)](https://www.osgeo.org) foundation,
offering a range of complementary open-source GIS software projects.

The latest documentation of QGIS is available at <https://docs.qgis.org/latest>

* [Building the documentation](#building-the-documentation)
   * [Build on Linux](#build-on-linux)
   * [Build on macOS or Linux](#build-on-macos-or-linux)
   * [Build on Windows](#build-on-windows)
   * [Build PDFs](#build-pdfs)
* [Translating](#translating)
* [Testing Python snippets](#testing-python-snippets)

# Building the documentation

1. If not provided by your OS, you need to install:

   - [git](https://git-scm.com/download/)
   - and [Python](https://www.python.org/downloads/) (>=3.9)

   You can install both in default places and with default options.
1. [Clone the repository](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository)
1. Go into that directory and follow the next instructions depending on your OS.

The best way to build the documentation is within a Python Virtual Environment (venv).

## Build on Linux or macOS

You can use your own virtual env by creating it first:

```
# you NEED python >=3.9. Depending on distro either use `python3` or `python`
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

<details>
  <summary>Tip: One-line command to create the venv and run the build in a row</summary>

  The `venv.mk` file will create/update a virtual env (if not available) in current dir/venv
  AND run the html build in it.

  ```
  make -f venv.mk html
  ```
</details>

If, for some reason, you want to (re)start from scratch:

```
make -f venv.mk cleanall
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
sudo apt install texlive-xetex fonts-freefont-otf
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

We rely on the [Transifex platform](https://www.transifex.com) to store and coordinate
our translation efforts. To be part of the translation team, please follow
[becoming a translator](https://www.qgis.org/en/site/getinvolved/translate.html#becoming-a-translator).

The process is automated using the [Transifex - GitHub integration system](https://help.transifex.com/en/articles/6265125-github-via-transifex-ui)
and some custom scripts:

* The [transifex.yml](transifex.yml) configuration file:
  provides way to retrieve the English source files and where to locate the translated ones.

  ---
   **Note to Transifex administrators**

   If after the integration system is setup for a new release, the translation strings fail to
   (fully) upload to Transifex:

   1. Run the [create_transifex_resources](scripts/create_transifex_resources.sh) script:
      creates/updates the [.tx/config](.tx/config) file with formatted references of the English
      source files and their translation in the GitHub repository and link them to
      the resources in Transifex.
   1. Force-push the translation files to Transifex
      ```
       tx push -f -t --no-interactive
      ```
  ---

* The transifex integration bot: 
  manages pulls and pushes of the strings, in other words:
  - Tracks any changes of the English `*.po` resource files in GitHub
    and automatically sends them to the Transifex platform
  - When a resource is 100% translated, automatically sends back
    the translated `*.po` file to GitHub, for build.
* The [pofiles action](.github/workflows/pofiles.yml): creates/updates English `*.po` files
  with recent changes in the source `*.rst` files. Feeds the transifex bot.

* For files that are not yet fully translated in Transifex,
  the [pull_minimized_translations action](.github/workflows/pull_minimized_translations.yml)
  periodically and automatically pulls them to the repository.

Based on the above, translated strings are automatically available in released
branch so building the docs in any translated locale is possible following
the instructions in earlier sections:
```
make html LANG=yourlanguage
```

Sometimes, you may want to build the docs with really new strings in a partially translated file
and the above workflow may fail to work.
In that case, you need to manually pull the translations from Transifex to your local repository:

1. Checkout locally the repository and target branch in git
1. Prepare the environment
   ```
   python3 -m venv venv
   source ./venv/bin/activate
   pip install -r REQUIREMENTS.txt
   ```
1. Install [Transifex command line client](https://github.com/transifex/cli/)
   ```
   curl -o- https://raw.githubusercontent.com/transifex/cli/master/install.sh | bash
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
   [https://app.transifex.com]
   rest_hostname = https://rest.api.transifex.com
   token = yourtransifextoken
   ```
1. Build the docs in your language
   ```
   make html LANG=yourlanguage
   ```
1. Share the changes by opening a pull-request, allowing us to integrate
   the new strings for the pulled language(s)

# Testing Python snippets

To test Python code snippets in the PyQGIS Cookbook, you need a *QGIS* installation.
For this there are many options:

* You can use your system *QGIS* installation with *Sphinx* from Python virtual environment:

  ```
  make -f venv.mk doctest
  ```
* You can use a manually built installation of *QGIS*. To do so, you need to:
  1. Create a custom ``Makefile`` extension on top of the ``venv.mk`` file,
     for example a ``user.mk`` file with the following content:

     ```
     # Root installation folder
     QGIS_PREFIX_PATH = /home/user/apps/qgis-master

     # Or build output folder
     QGIS_PREFIX_PATH = /home/user/dev/QGIS-build-master/output

     include venv.mk
     ```

  1. Then use it to run target ``doctest``:

     ```
     make -f user.mk doctest
     ```
* Or you can run target ``doctest`` inside the official *QGIS* docker image:

  ```
  make -f docker.mk doctest
  ```

Note that only code blocks with directive ``testcode`` are tested and it is possible to run tests setup code
which does not appear in documentation with directive ``testsetup``, for example:

```
 .. testsetup::

     from qgis.core import QgsCoordinateReferenceSystem

 .. testcode::

     # SRID 4326 is allocated for WGS84
     crs = QgsCoordinateReferenceSystem("EPSG:4326")
     assert crs.isValid()
```

For more information see *Sphinx* doctest extension documentation:
https://www.sphinx-doc.org/en/master/usage/extensions/doctest.html

