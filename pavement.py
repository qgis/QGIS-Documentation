
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
        resourcedir='static',
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
            'docutils==0.14',
            'Jinja2==2.10',
            'MarkupSafe==1.0',
            'Pygments==2.3.1',
            'Sphinx==1.6.5',
            'sphinx-intl==0.9.9',
            'transifex-client==0.12.5',
            'urllib3==1.23'
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
    print ("virtual environment successfully bootstrapped.")
    print (INSTRUCTIONS)


@task
@cmdopts([
    ('lang=', 'l', 'Optional language param (iso code, like "nl") to build for. If ommitted all languages in i18n dir will be build')
])
def clean(options):
    # all static stuff which is copied in source
    staticdir = os.path.join(options.sphinx.sourcedir, "static")
    print (staticdir)
    if os.path.exists(staticdir):
        print("")
        shutil.rmtree(staticdir)
    # something in i18n/pot dir creates havoc when using gettext: remove it
    potdir = os.path.join(options.sphinx.i18ndir, "pot")
    if os.path.exists(potdir):
        shutil.rmtree(potdir)



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

    #"Updating static content (substitution images) into $(SOURCEDIR)/static
    print(options.sphinx.resourcedir)
    distutils.dir_util.copy_tree(options.sphinx.resourcedir, os.path.join(options.sphinx.sourcedir,  "static"), update=1)
    
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
    #sh('%s -c %s build -l %s ' % (options.sphinxintl.sphinxintlbin, options.sphinx.conf, options.setup.lang))
    sh('%s build -l %s ' % (options.sphinxintl.sphinxintlbin, options.setup.lang))


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

