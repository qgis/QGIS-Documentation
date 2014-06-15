
from paver.easy import *
from paver.setuputils import setup
from sys import platform as currentos

import os
import shutil
import distutils.core

setup(
    name="QGIS-Documentation",
    version="1.0",
    url="http://docs.qgis.org/testing",
    author="Richard Duivenvoorde",
    author_email="richard@duif.net"
)


options(
    setup=Bunch(
        lang='en',
    ),
    clean=Bunch(
        lang='en',
    ),
    sphinx=Bunch(
        sphinxbuildbin='sphinx-build',
        builder='html',
        builddir='build',
        sourcedir='source',
        i18ndir='i18n',
        resourcedir='resources',
        conf='source/conf.py'
    ),
    sphinxintl=Bunch(
        sphinxintlbin='sphinx-intl'
    ),
    virtualenv=Bunch(
        script_name='bootstrap.py',
        dest_dir="virtualenv",
        packages_to_install = [
            # Project dependencies
            'Jinja2==2.7.2',
            'MarkupSafe==0.18',
            'Pygments==1.6',
            'Sphinx==1.2',
            'argparse==1.2.1',
            'distribute==0.7.3',
            'docutils==0.11',
            'polib==1.0.3',
            'six==1.5.2',
            'sphinx-intl==0.9.4',
            # pip install transifex on Windows files because of py2exe problem
            # if you need id: pip install transifex-client==0.9
            #'transifex-client==0.9'
            ],
        paver_command_line="virtual_env_init",
    )
)


# from http://blog.carduner.net/tag/paver/
# to create bootstrap.py: 
#   paver paver.virtual.bootstrap

INSTRUCTIONS = """
To enter the virtual environment on Linux/Mac, run:
   $ source virtualenv/bin/activate
To exit the environment:
   $ deactivate

To enter the virtual environment on Windows, run:
   $ virtualenv\Scripts\\activate
To exit the environment:
   $ deactivate
"""

@task
def virtual_env_init():
    """Initializing everything so you can start working
    by running: $ paver paver.virtual.bootstrap
    This will create a bootstrap.py file, which you can run with
    $ python bootstrap.py
    That will create a virtual environment to work in.
    """
    print "virtual environment successfully bootstrapped."
    print INSTRUCTIONS


@task
@cmdopts([
    ('lang=', 'l', 'Optional language param (iso code, like "nl") to build for. If ommitted all languages in i18n dir will be build')
])
def clean(options):
    # all static stuff which is copied in source
    staticdir = os.path.join(options.sphinx.sourcedir, "static")
    if os.path.exists(staticdir):
        shutil.rmtree(staticdir)
    # something in i18n/pot dir creates havoc when using gettext: remove it
    potdir = os.path.join(options.sphinx.i18ndir, "pot")
    if os.path.exists(potdir):
        shutil.rmtree(potdir)


# rm -rf i18n/*/LC_MESSAGES/docs/*/
# rm -rf output/html/en/*
# rm -f source/docs_conf.py*
# rm -rf source/docs/*/
# # all .mo files
# find i18n/*/LC_MESSAGES/ -type f -name '*.mo' -delete

# remove all resources from source/static directory
# copy english resources from resources/en to source/static directory
# IF we have a localized build (LANG != en) then
# overwrite with potentially available LANG resources  by
# copy LANG resources from resources/LANG to source/static directory
# TODO: check if LANG != en, for now: unnessecary copy for english
#   localizeresources: clean
#   	@echo
#   	@echo "Removing all static content from $(SOURCEDIR)/static."
#   	rm -rf $(SOURCEDIR)/static
#   	@echo "Copy 'en' (base) static content to $(SOURCEDIR)/static."
#   	mkdir $(SOURCEDIR)/static
#   	# historically the images for the docs sub project are not in a separate docs folder
#   	# that is why we copy site (to site) and docs/* into root in separate steps
#   	cp -r $(RESOURCEDIR)/en/site $(SOURCEDIR)/static
#   	@if [ -d "$(RESOURCEDIR)/en/docs" ]; then \
#   		cp -r $(RESOURCEDIR)/en/docs/* $(SOURCEDIR)/static; \
#   	fi
#   	@echo "Copy localized '$(LANG)' static content to $(SOURCEDIR)/static."
#   	@if [ -d "$(RESOURCEDIR)/$(LANG)/site" ]; then \
#   		cp -r $(RESOURCEDIR)/$(LANG)/site $(SOURCEDIR)/static; \
#   	fi
#   	@if [ -d "$(RESOURCEDIR)/$(LANG)/docs" ]; then \
#   		cp -r $(RESOURCEDIR)/$(LANG)/docs/* $(SOURCEDIR)/static; \
#   	fi


@task
@cmdopts([
    ('lang=', 'l', 'Language param (iso code, like "nl"), defaults to "en"')
])
def setup():
    """Setting up static resources (like images).
    Starting with the english version and overwriting with localized
    resources if available.
    """
    # first clean for this language
    options.clean.lang = options.setup.lang
    clean()

    # create an empty static dir again
    staticdir = os.path.join(options.sphinx.sourcedir, "static")
    os.mkdir(staticdir)
    # copy english site resources to static dir
    english_site_resources = os.path.join(options.sphinx.resourcedir, "en", "site")
    if os.path.exists(english_site_resources):
        distutils.dir_util.copy_tree(english_site_resources, os.path.join(staticdir, "site"))
    # copy (optional) localized site resources in static dir
    translated_site_resources = os.path.join(options.sphinx.resourcedir, options.setup.lang, "site")
    if os.path.exists(translated_site_resources):
        distutils.dir_util.copy_tree(translated_site_resources, os.path.join(staticdir, "site"))
    # historically the images for the docs sub project are not in a separate 'docs' folder
    # that is why we copy docs/* into root instead of docs to docs
    english_docs_resources = os.path.join(options.sphinx.resourcedir, "en", "docs")
    if os.path.exists(english_docs_resources):
        distutils.dir_util.copy_tree(english_docs_resources, staticdir)
    translated_docs_resources = os.path.join(options.sphinx.resourcedir, options.setup.lang, "docs")
    if os.path.exists(translated_docs_resources):
        distutils.dir_util.copy_tree(translated_docs_resources, staticdir)

    # we also need to set the proper sphinx binaries
    if currentos == 'win32':
        options.sphinxintl.sphinxintlbin = 'virtualenv\Scripts\sphinx-intl.exe' 
        options.sphinx.sphinxbuildbin = 'virtualenv\Scripts\sphinx-build.exe'



@task
@cmdopts([
    ('lang=', 'l', 'Optional language param (iso code, like "nl") to build for. If ommitted all languages in i18n dir will be build')
], share_with=['setup'])
@needs(['setup'])
@no_help
def sphinxintl(options):
    """Generate .mo files from .po files of this language."""
    # print "Running sphinx-intl build"
    # sphinx-intl uses 'locale-dir' from conf.py
    # -c = pointing to conf.py
    # -l = language
    sh('%s build -l %s -c %s' % (options.sphinxintl.sphinxintlbin, options.setup.lang, options.sphinx.conf))


@task
@needs(['sphinxintl'])
@cmdopts([
    ('lang=', 'l', 'Optional language param (defaults to "en") to build for.'),
    ('builder=', 'b', 'Sphinx builder to use (defaults to "html").')
], share_with=['setup'])
def html(options):
    """Generate html in output dir."""
    #print "Running sphinx-build"
    # sphinx-build options used:
    # -b = build type (html, pdf etc)
    # -d = path for the cached environment and doctree files
    # -D = override a setting in configuration file
    # -A = pass a value into the templates, for HTML builder
    # sphinx-build -b html -d output/html/doctrees  -D language=en -A language=en source output/html/en
    sh('%s -b %s -d %s -D language=%s -A language=%s, %s %s' % ( \
        options.sphinx.sphinxbuildbin,      \
        options.sphinx.builder,             \
        os.path.join(options.sphinx.builddir, options.sphinx.builder, "doctrees"), \
        options.setup.lang,         \
        options.setup.lang,         \
        options.sphinx.sourcedir,   \
        os.path.join(options.sphinx.builddir, options.sphinx.builder, options.setup.lang) ))

