# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# http://www.sphinx-doc.org/en/master/config

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
# import os
# import sys
# sys.path.insert(0, os.path.abspath('.'))


# -- Project information -----------------------------------------------------

project = 'QGIS Documentation'
copyright = '2002-now, QGIS project'
author = 'QGIS Authors'


# -- General configuration ---------------------------------------------------

# The master toctree document.
master_doc = 'docs/index'

# The name of an image file (relative to this directory) to place at the top
# of the sidebar.
html_logo = 'static/common/logo.png'

html_last_updated_fmt = '%b %d, %Y %H:%M'


# The version info for the project you're documenting, acts as replacement for
# |version| and |release|, also used in various other places throughout the
# built documents.
#
# The short X.Y version.
version = '3.4'

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [
    'sphinx.ext.imgmath',
    'sphinx.ext.intersphinx',
    'sphinx.ext.doctest',
    'sphinx.ext.extlinks',
    'sphinx.ext.autodoc',
]

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = [
    'venv',
    'README.rst',
]

# -- Internationalisation ----------------------------------------------------

language = 'en'
locale_dirs = ['locale/']   # path is example but recommended.
gettext_compact = False     # optional.


# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
#html_theme = 'alabaster'
html_theme = 'rtd_qgis'

# https://sphinx-rtd-theme.readthedocs.io/en/stable/configuring.html#theme-options
# rtd / read the docs theme options:
html_theme_options = {
     # collapse_navigation: With this enabled, navigation entries are not expandable – the [+] icons next to each entry are removed. Default: True
    'collapse_navigation': True,
    # sticky_navigation: Scroll the navigation with the main page content as you scroll the page. Default: True
    'sticky_navigation': True,
    # navigation_depth: The maximum depth of the table of contents tree. Set this to -1 to allow unlimited depth. Default: 4
    'navigation_depth': 4,
    # includehidden:Specifies if the navigation includes hidden table(s) of contents – that is, any toctree directive that is marked with the :hidden: option. Default: True,
    # 'includehidden': True,
    # canonical_url: This will specify a canonical URL meta link element to tell search engines which URL should be ranked as the primary URL for your documentation. This is important if you have multiple URLs that your documentation is available through. The URL points to the root path of the documentation and requires a trailing slash.
    'canonical_url': 'https://docs.qgis.org/latest/',
    # display_version: If True, the version number is shown at the top of the sidebar. Default: True,
    'display_version': True,
    # logo_only: Only display the logo image, do not display the project name at the top of the sidebar. Default: False,
    'logo_only': False,
    # prev_next_buttons_location': Location to display Next and Previous buttons. This can be either bottom, top, both , or None. Default: 'bottom',
    'prev_next_buttons_location': 'both',
    # style_external_links': Add an icon next to external links. Default: False,
    'style_external_links': False,
    # style_nav_header_background': Changes the background of the search area in the navigation bar. The value can be anything valid in a CSS background property. Default: 'white',
    #'style_nav_header_background': 'Gray',
    # Toc options
    # titles_only: When enabled, page subheadings are not included in the navigation. Default: False
    # 'titles_only': False,
}

# Add any paths that contain custom themes here, relative to this directory.
html_theme_path = ['./themes']

html_favicon = 'static/common/qgis_logo.ico'

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['static']

## for rtd themes, creating a html_context for the version/language part

import os
import sys
import yaml
# sys.path.insert(0, os.path.abspath('.'))

sys.path.insert(0, os.path.abspath('../../'))

with open('docs_conf.yml', 'r') as f:
    cfg = yaml.safe_load(f)

html_context = {
    # When a QGIS version reaches end of life, set this to True to show an information
    # message on the top of the page.
    'outdated': True,
    # When a new QGIS version is released, set this to False to remove the disclaimer
    # information message on the top of the page.
    'isTesting': False
}

# Add custom CSS when a top bar is needed to be shown (for testing or outdated versions)
if html_context['isTesting'] or html_context['outdated']:
  html_css_files = ['css/qgis_topbar.css']

supported_languages = cfg['supported_languages'].replace(' ','').split(',')
version_list = cfg['version_list'].replace(' ','').split(',')
docs_url = 'https://docs.qgis.org/'

if version not in version_list:
  raise ValueError('QGIS version is not in version list', version, version_list)

# This config value contains the locations and names of other projects that
# should be linked to in this documentation.

pyqgis_version = version
intersphinx_mapping = {'pyqgis_api': ('https://qgis.org/pyqgis/{}/'.format(pyqgis_version), None)}

# This config value must be a dictionary of external sites, mapping unique short
# alias names to a base URL and a prefix.

api_version = version
source_version = ''.join(['release-', version]).replace('.', '_')

extlinks = {'api': ('https://qgis.org/api/{}%s'.format(''.join([version, '/'])), None),
            'pyqgis': ('https://qgis.org/pyqgis/{}/%s'.format(version), None),
            'source': ('https://github.com/qgis/QGIS/blob/{}/%s'.format(
                ''.join(['release-', version]).replace('.', '_') ), None)
           }

context = {
    # 'READTHEDOCS': True,
    'version_downloads': False,
    'versions': [ [v, docs_url+v] for v in version_list],
    'supported_languages': [ [l, docs_url+version+'/'+l] for l in supported_languages],
    # 'downloads': [ ['PDF', '/builders.pdf'], ['HTML', '/builders.tgz'] ],
    
    'display_github': not html_context['outdated'], # Do not display for outdated releases
    'github_user': 'qgis',
    'github_repo': 'QGIS-Documentation',
    'github_version': 'master/',
    'github_url':'https://github.com/qgis/QGIS-Documentation/edit/master',
    'transifex_url': 'https://www.transifex.com/qgis/qgis-documentation/translate',
    
    'pyqgis_version': pyqgis_version,
    'source_version': source_version,
    'api_version': api_version
}

if 'html_context' in globals():
    html_context.update(context)
else:
    html_context = context

# -- Settings for Python code samples testing --------------------------------

# adding this because in pycookbook a lot of text is referencing classes, which cannot be found by sphinx
# eg: Map canvas is implemented as :class:`QgsMapCanvas` ...
# I hope somebody will create the real references for these so they can be removed here...
nitpick_ignore = [
                  ('py:class', 'QDomElement'),
                  ('py:class', 'QAction'),
                  ('py:class', 'QMenu'),

                  ('py:data', 'iface'),
                  ('py:data', 'qgis.utils.iface'),

                  ('py:func', 'classFactory'),
                  ('py:func', '__init__'),
                  ('py:func', 'initGui'),
                  ('py:func', 'hide'),
                  ('py:func', 'requestReady'),
                  ('py:func', 'sendResponse'),
                  ('py:func', 'serverClassFactory'),
                  ('py:func', 'show'),
                  ('py:func', 'showPluginHelp'),
                  ('py:func', 'unload'),

                  ('py:mod', 'qgis.core'),
                  ('py:mod', 'qgis.gui'),
                  ('py:mod', 'qgis.utils'),
                  ]


# Add doctest configuration
doctest_global_setup = '''
import os
import sys
from qgis.testing import start_app
def start_qgis():
    save_stdout = sys.stdout
    try:
        with open(os.devnull, 'w') as f:
            sys.stdout = f
            start_app()
    finally:
        sys.stdout = save_stdout
    sys.stdout = sys.stderr
'''
doctest_test_doctest_blocks = ''

doctest_global_cleanup = '''
from qgis.core import QgsProject
QgsProject.instance().clear()
'''

# Make Sphinx doctest insensitive to object address differences
import doctest
import re
import sphinx.ext.doctest as ext_doctest

ADDRESS_RE = re.compile(r'\b0x[0-9a-f]{1,16}\b')

class BetterDocTestRunner(ext_doctest.SphinxDocTestRunner):
    def __init__(self, checker=None, verbose=None, optionflags=0):
        checker = BetterOutputChecker()
        doctest.DocTestRunner.__init__(self, checker, verbose, optionflags)

class BetterOutputChecker(doctest.OutputChecker):
    def check_output(self, want, got, optionflags):
        want = ADDRESS_RE.sub('0x7f00ed991e80', want)
        got = ADDRESS_RE.sub('0x7f00ed991e80', got)
        return doctest.OutputChecker.check_output(self, want, got, optionflags)

ext_doctest.SphinxDocTestRunner = BetterDocTestRunner

