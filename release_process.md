_This document is meant to explain the workflow to effectively
and bug-freely release a new version of QGIS documentation_ 

# Versions and branch naming

Different versions of documentation are usually released by the QGIS project
and are somehow tied to the development cycle of the software:

1. testing: targets functionalities available in the development cycle
or in versions newer than the latest Long Term Release (LTR).
Source files are available in the `master` branch.
The released documentation is accessible at https://docs.qgis.org/testing.
1. latest: targets functionalities available in the current Long Term Release.
Documentation source files are available in `release_x.y` branch where x.y represents the version number.
The released documentation is accessible at https://docs.qgis.org/latest
or https://docs.qgis.org/x.y.
1. When the first release of the next-to-be LTR is published, a new `release_x.y` branch is also created
in the documentation repository and covers features available in that version (some are not in the current LTR).
The documentation is accessible through https://docs.qgis.org/x.y.
When that version becomes LTR months later, `latest` URL is redirected to that version.


# Release steps

New releases are branched off the `master` branch.
Following changes are required:

## When LTR is still unchanged
This usually happens from the October release.
<details>
  <summary>Instructions when the next LTR is first released and there is no LTR switch</summary>

### master branch
<details>

#### Before creating the new release branch
Following changes have to be done in `master` branch before you create the new release branch.
Otherwise, you will have to do the changes twice: in master and in the new branch.

- [ ] In [substitutions.txt](substitutions.txt) file:
  - [ ] replace |CURRENT| value with the new version number
  - [ ] Remove intermediate versions substitutions and their occurrences in the rst files
- [ ] In [docs_conf.yml](docs_conf.yml) file: add the new release number to the `version_list` parameter

#### After the new LTR branch is created
- [ ] In [substitutions.txt](substitutions.txt) file, add substitutions for the versions
  of the next LTR cycle that starts (e.g. if you just create the release_3.22 branch, you should add
  to the master branch substitutions for 3.22, 3.26 and 3.28)
- [ ] In [auto-label.yml](.github/workflows/auto-label.yml) file: update list of versions labels to listen to
</details>

### Current LTR branch
<details>

- [ ] In [docs_conf.yml](docs_conf.yml) file, add the new release number to the `version_list` parameter
</details>

### Next to-be LTR branch
<details>
New releases are branched off the `master` branch and thus require a set of changes.

- [ ] Ensure that [basic changes](#Before-creating-the-new-release-branch) are applied
- [ ] In [conf.py](conf.py) file:
  - [ ] set the `version` value (in the form x.y)
  - [ ] set the html_context `isTesting` option to `False`
- [ ] In [docker-world.sh](docker-world.sh) file: replace `QGIS-Documentation` with `QGIS-Documentation-x.y`
- [ ] In [cronjob.sh](cronjob.sh) file:
  - [ ] replace `QGIS-Documentation` with `QGIS-Documentation-x.y`
  - [ ] replace `qgis_docs_master_build` with `qgis_docs_x.y_build`
- [ ] In [doctest.dockerfile](doctest.dockerfile): set the project container to pull QGIS sources from (i.e. `release-x_y`)
- [ ] In main [index.rst](docs/index.rst) file: replace `testing` with `x.y` in the Table Of Contents
</details>

### Repository and project configuration
- [ ] ⚠️ Make sure that the [C++ API documentation](https://api.qgis.org/api) of the new version is available.
- [ ] ⚠️ Make sure that the [PyQGIS documentation](https://qgis.org/pyqgis) of the new version is available.
- [ ] Add new labels to triage issues and pull requests: `backport <new_branch>`, new target versions
- [ ] Create a new milestone for the new cycle of LTR that starts

### Server
- [ ] Update commands to publish the new version (in English, as html, zip and pdf)
  and avoid redirecting it to testing
</details>


## When the new LTR is published
In February, the new version is labeled as LTR, and replaces the previous one in many places.
<details>
  <summary>Instructions when the new LTR officially takes place</summary>

### Old LTR branch 
<details>

- [ ] In [conf.py](conf.py) file: set the html_context `outdated` option to `True`
- [ ] Pull translations for all languages from transifex
  (see instructions in [README](README.md) file)
- [ ] Build the docs one more time

</details>

### New LTR branch 
<details>

- [ ] In [docs_conf.yml](docs_conf.yml) file: add target languages to the `supported_languages` parameter.
  These are the languages that will be published in the documentation.
  A threshold of 5% is currently applied to candidates.
- [ ] In [docker-world.sh](docker-world.sh) file: complete the `langs` variable with the supported languages
- [ ] In the [makefile](makefile):
  - [ ] set `VERSION` parameter to the version number
  - [ ] add the supported languages to the `LANGUAGES` parameter 
- [ ] Copy the [locale](locale) folder from the previous LTR to the new one
- [ ] Generate new English source files (see instructions in [README](README.md) file)
- [ ] Pull/Copy-paste translated files from the old LTR branch to the new LTR branch
</details>

### Transifex platform
<details>
Translated versions are available only for long term releases and only the active LTR
is being translated. So when a new LTR is published, we disconnect the old one and connect the new one.

- [ ] ⚠️ Make sure that the translated files from the old LTR branch have been correctly pasted
  to the new LTR branch
- [ ] Link the new LTR branch to the QGIS-Documentation project
  ([read docs on Transifex](https://docs.transifex.com/transifex-github-integrations/github-tx-ui))
- [ ] If the connection above does not correctly proceed and update files in the transifex platform,
  see workaround instructions in [README](README.md) file
</details>

### master branch
<details>

- [ ] In [fix_versions.sh](scripts/fix_versions.sh) file:
  - [ ] add the old LTR number to the `DEPRECATED` parameter
  - [ ] add the new LTR number to the `DOCVERSIONS` parameter
- [ ] In [pofiles.yml](.github/workflows/pofiles.yml): update references to the new LTR branch in order
  to generate updated English \*.po source files to push to Transifex
- [ ] In [translation_statistics.yml](.github/workflows/translation_statistics.yml): update references to
  the branch to generate translation statistics for the new LTR
</details>

### Server
<details>

- [ ] Redirect `latest` URL to the new LTR pages
- [ ] Update commands to publish the new version (in released languages, as html, zip and pdf)
</details>

</details>

# Possible improvements
Many parts of the process are currently manual. This sometimes results in failing builds because
some steps were overlooked/forgotten.
Automating the process as much as possible would lower the risk and make it less time consuming.

* Some values are somehow copy-pasted across places while they could likely be put in a variable: 

  * languages list: they are defined in docs_conf.yml, makefile, docker-world.sh
  * version number: it is defined in conf.py, makefile, docker-world.sh, cronjob.sh, doctest.dockerfile
* The pull of translations from Transifex could be improved via a github action that regularly
  downloads unfinished files (making published docs as close as possible to translators work)
