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

import sphinx.ext.doctest as ext_doctest
import re
import doctest
import yaml
import sys
import os
from hashlib import md5
from sphinx.roles import MenuSelection

project = 'QGIS Documentation'
copyright = '2002-now, QGIS project'
author = 'QGIS Authors'


# -- General configuration ---------------------------------------------------

# The master toctree document.
master_doc = 'docs/index'

# The name of an image file (relative to this directory) to place at the top
# of the sidebar.
html_logo = 'static/common/logo.png'

html_last_updated_fmt = '%Y %b %d, %H:%M %z'


# The version info for the project you're documenting, acts as replacement for
# |version| and |release|, also used in various other places throughout the
# built documents.
#
# The short X.Y version.
version = 'testing'

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [
    'sphinx.ext.intersphinx',
    'sphinx.ext.doctest',
    'sphinx.ext.extlinks',
    'sphinxext.rediraffe',
    'sphinx_togglebutton',
    'sphinx_copybutton'
]

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = [
    'venv',
    'docs/user_manual/expressions/expression_help/*'
]

# -- Internationalisation ----------------------------------------------------

language = 'en'
locale_dirs = ['locale/']   # path is example but recommended.
gettext_compact = False     # optional.

# Enable numeric figure references
numfig = True

# The filename format for language-specific figures
figure_language_filename = '{path}{language}/{basename}{ext}'

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
    'canonical_url': 'https://docs.qgis.org/latest/en/',
    # display_version: If True, the version number is shown at the top of the sidebar. Default: True,
    'display_version': True,
    # logo_only: Only display the logo image, do not display the project name at the top of the sidebar. Default: False,
    'logo_only': False,
    # prev_next_buttons_location': Location to display Next and Previous buttons. This can be either bottom, top, both , or None. Default: 'bottom',
    'prev_next_buttons_location': 'both',
    # style_external_links': Add an icon next to external links. Default: False,
    'style_external_links': False,
    # style_nav_header_background': Changes the background of the search area in the navigation bar. The value can be anything valid in a CSS background property. Default: 'white',
    # 'style_nav_header_background': 'Gray',
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

# Set a bullet character for :menuselection: role
# easier to identify in non latin languages, e.g. japanese
MenuSelection.BULLET_CHARACTER = '\u25BA'  # '\N{BLACK RIGHT-POINTING POINTER}'

# for rtd themes, creating a html_context for the version/language part

# sys.path.insert(0, os.path.abspath('.'))

sys.path.insert(0, os.path.abspath('../../'))

with open('docs_conf.yml', 'r') as f:
    cfg = yaml.safe_load(f)

html_context = {
    # When a QGIS version reaches end of life, set this to True to show an information
    # message on the top of the page.
    'outdated': False,
    # When a new QGIS version is released, set this to False to remove the disclaimer
    # information message on the top of the page.
    'isTesting': True
}

# Add custom CSS when a top bar is needed to be shown (for testing or outdated versions)
if html_context['isTesting'] or html_context['outdated']:
    html_css_files = ['css/qgis_topbar.css']

# Add custom tags to allow display of text based on the branch status
if html_context['isTesting']:
    tags.add('testing')
if html_context['outdated']:
    tags.add('outdated')

supported_languages = cfg['supported_languages'].split()
version_list = cfg['version_list'].replace(' ', '').split(',')
docs_url = 'https://docs.qgis.org/'

if version not in version_list:
    raise ValueError('QGIS version is not in version list',
                     version, version_list)

# This config value contains the locations and names of other projects that
# should be linked to in this documentation.

pyqgis_version = version if version != 'testing' else 'master'
intersphinx_mapping = {'pyqgis_api': (
    'https://qgis.org/pyqgis/{}/'.format(pyqgis_version), None)}

# This config value must be a dictionary of external sites, mapping unique short
# alias names to a base URL and a prefix.

api_version = version if version != 'testing' else ''
source_version = ''.join(['release-', version]).replace('.',
                                                        '_') if version != 'testing' else 'master'

extlinks = {  # api website: docs master branch points to '/' while x.y points to x.y
    'api': ('https://api.qgis.org/api/{}%s'.format(''.join([version, '/']) if version != 'testing' else ''), None),
    # pyqgis website: docs master branch points to 'master' and x.y points to x.y
    'pyqgis': ('https://qgis.org/pyqgis/{}/%s'.format(pyqgis_version), None),
    # code on github: docs master branch points to 'master' while x.y points to release-x_y
    'source': ('https://github.com/qgis/QGIS/blob/{}/%s'.format(source_version), None)
}

def calculate_tx_slug(filepath):
    """A function to calculate Transifex slug using md5 on file path"""

    result = md5(filepath.encode())
    return result.hexdigest()

context = {
    # 'READTHEDOCS': True,
    'version_downloads': True,
    'versions': [[v, docs_url+v] for v in version_list],
    'supported_languages': [[l, docs_url+version+'/'+l] for l in supported_languages],
    'downloads': [['PDF', docs_url+version+'/pdf'], ['HTML', docs_url+version+'/zip']],

    # Do not display for outdated releases
    'display_github': not html_context['outdated'],
    'github_user': 'qgis',
    'github_repo': 'QGIS-Documentation',
    'github_version': 'master/',
    'github_url': 'https://github.com/qgis/QGIS-Documentation/edit/master',
    'transifex_url': 'https://app.transifex.com/qgis/qgis-documentation/translate',
    'calculate_tx_slug': calculate_tx_slug,

    'pyqgis_version': pyqgis_version,
    'source_version': source_version,
    'api_version': api_version,
}

if 'html_context' in globals():
    html_context.update(context)
else:
    html_context = context

# Supported image file formats and order of picking if named alike
from sphinx.builders.html import StandaloneHTMLBuilder
StandaloneHTMLBuilder.supported_image_types = [
    'image/svg+xml',
    'image/gif',
    'image/png',
    'image/jpeg'
]

rst_prolog = r"""
    .. only:: html and i18n

      .. important::
        Translation is a community effort `you can join <https://qgis.org/en/site/getinvolved/translate.html#becoming-a-translator>`_.
        This page is currently translated at |translation progress|.
    """

# -- Options for LaTeX output --------------------------------------------------

latex_engine = 'xelatex'

# The paper size ('letter' or 'a4').
latex_paper_size = 'a4'

# The font size ('10pt', '11pt' or '12pt').
#latex_font_size = '10pt'

# Grouping the document tree into LaTeX files. List of tuples
# (source start file, target name, title, author, documentclass [howto/manual]).
latex_documents = [
    ('docs/user_manual/index', 'DesktopUserGuide.tex',
     f'QGIS Desktop {version} User Guide', u'QGIS Project', 'manual'),
    ('docs/server_manual/index', 'ServerUserGuide.tex',
        f'QGIS Server {version} User Guide', u'QGIS Project', 'manual'),
    ('docs/pyqgis_developer_cookbook/index', 'PyQGISDeveloperCookbook.tex',
        f'PyQGIS {version} developer cookbook', u'QGIS Project', 'manual'),
    ('docs/training_manual/index', 'TrainingManual.tex',
        u'QGIS Training Manual', u'QGIS Project', 'manual'),
    ('docs/gentle_gis_introduction/index', 'GentleGISIntroduction.tex',
        u'Gentle GIS Introduction', u'QGIS Project', 'manual'),
    ('docs/documentation_guidelines/index', 'DocumentationGuidelines.tex',
        u'QGIS Documentation Guidelines', u'QGIS Project', 'manual'),
    #('docs/developers_guide/index', 'DevelopersGuide.tex', u'QGIS Developers Guide', u'QGIS Project', 'manual'),
]

# The name of an image file (relative to this directory) to place at the top of
# the title page.
latex_logo = 'static/common/logo.png'

# For "manual" documents, if this is true, then toplevel headings are parts,
# not chapters.
latex_use_parts = False

# Additional stuff for the LaTeX preamble.
#latex_preamble = ''

# Documents to append as an appendix to all manuals.
#latex_appendices = []

# If false, no module index is generated.
#latex_use_modindex = True


latex_elements = {
    # The paper size ('letterpaper' or 'a4paper').
    'papersize': 'a4paper',

    # The font size ('10pt', '11pt' or '12pt').
    # 'pointsize': '10pt',

    # Additional stuff for the LaTeX preamble.
    'preamble': u'''
    \\usepackage{combelow}
    \\setcounter{tocdepth}{2}
    \\usepackage{newunicodechar}
    \\newunicodechar{Ș}{\\cb{S}}
    \\newunicodechar{ș}{\\cb{s}}
    \\newunicodechar{Ț}{\\cb{T}}
    \\newunicodechar{ț}{\\cb{t}}
    \\newunicodechar{≠}{$\\neq$}
    \\newunicodechar{≥}{$\geq$}
    \\newunicodechar{≤}{$\leq$}
    \\newunicodechar{π}{$\pi$}
    \\newunicodechar{㎡}{$m^2$}
    \\newunicodechar{\u25BA}{$\u25BA$}
    \\newunicodechar{′}{\ensuremath{^{\prime}}}
    \\newunicodechar{″}{\ensuremath{^{\prime\prime}}}
    \\newunicodechar{​}{ }''',

    # Latex figure float alignment
    # use ‘H’ to disable floating, and position the figures strictly in the order they appear in the source
    'figure_align': 'H'
}

# Special case of korean that need different latex settings to work
if tags.has('ko'):
    latex_elements = {
        'inputenc': '',
        'utf8extra': '',
        'preamble': '''
        \\usepackage{fontspec}
        \\usepackage[space]{xeCJK}
        \\renewcommand\CJKglue{}
        \\setCJKmainfont{NanumMyeongjo}''',
    }

# Special case for hindi that need different setting and typeset
if tags.has('hi'):
    latex_elements = {
        'inputenc': '',
        'utf8extra': '',
        'preamble': '''
        \\usepackage{fontspec}
        \\setmainfont[Script=Devanagari]{Nakula}''',
    }


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

    ('py:mod', 'qgis.utils'),

    ('py:const', 'False'),
    ('py:const', 'True'),
]


# Add doctest configuration

doctest_path = ['/usr/share/qgis/python/plugins/',
                os.path.join(os.getcwd(), 'testdata', 'processing')]

doctest_global_setup = '''
import os
import sys
import tempfile
import shutil

# Copy all cookbook test data into a
# testdata directory (which is in .gitignore)
# This is necessary because some test files
# are modified during the tests and it's annoying
# to find them changed in git
try:
    shutil.rmtree('testdata')
except:
    pass
shutil.copytree('qgis-projects/python_cookbook', 'testdata')

# Prepare environment for QgsApplication
os.environ['QGIS_AUTH_DB_DIR_PATH'] = tempfile.mkdtemp()
os.environ['QT_QPA_PLATFORM'] = 'offscreen'

from qgis.testing import start_app
from qgis.testing.mocked import get_iface

# Workaround for https://github.com/qgis/QGIS/issues/48670
from qgis.PyQt.QtCore import QSettings
settings = QSettings()
settings.setValue("cache/directory", "testdata")


def start_qgis():

    save_stdout = sys.stdout
    try:
        with open(os.devnull, 'w') as f:
            sys.stdout = f
            globals()['QGISAPP'] = start_app()
    finally:
        sys.stdout = save_stdout
    sys.stdout = sys.stderr

    from qgis.core import (
        QgsProject,
        QgsVectorLayer,
        QgsFeature,
        QgsGeometry,
        QgsApplication,
        QgsLayerTreeModel,
        QgsSettings,
    )

    from qgis.gui import (
        QgsLayerTreeView,
        QgsMessageBar,
    )

    QgsProject.instance().clear()

    from qgis.analysis import QgsNativeAlgorithms

    # Expose the iface for plugins snippets
    iface = get_iface()

    # Mock activeLayer()
    iface.activeLayer.return_value = QgsVectorLayer("Point?crs=4326&field=fid:integer&field=name:string", "temporary_points", "memory")

    # Add a feature
    f = QgsFeature(iface.activeLayer().fields())
    f.setAttributes([1, 'First feature'])
    f.setGeometry(QgsGeometry.fromWkt('point( 7 45)'))
    f2 = QgsFeature(iface.activeLayer().fields())
    f2.setAttributes([2, 'Second feature'])
    f2.setGeometry(QgsGeometry.fromWkt('point( 7.5 45.5)'))
    iface.activeLayer().dataProvider().addFeatures([f, f2])

    # Mock messageBar
    iface.messageBar.return_value = QgsMessageBar()

    # Mock layerTreeView
    layertree_view = QgsLayerTreeView()
    layertree_model = QgsLayerTreeModel(QgsProject.instance().layerTreeRoot())
    layertree_view.setModel(layertree_model)
    iface.layerTreeView.return_value = layertree_view
    iface.layertree_model = layertree_model

    # Init processing plugin
    import processing
    QgsApplication.processingRegistry().addProvider(QgsNativeAlgorithms())

    return iface


def dump_tree(root):
    """Dump the layer tree for testing"""

    def _print_children(parent, indent):
        print('-' * indent, parent.name(), parent)
        for c in parent.children():
            _print_children(c, indent + 1)
    _print_children(root, 1)

'''
doctest_test_doctest_blocks = ''

doctest_global_cleanup = ''

# Make Sphinx doctest insensitive to object address differences,
# also 'output_....' processing alg ids


ADDRESS_RE = re.compile(
    r'\b0x[0-9a-f]{1,16}\b|_[a-z0-9]{8}_[a-z0-9]{4}_[a-z0-9]{4}_[a-z0-9]{4}_[a-z0-9]{12}')


class BetterDocTestRunner(ext_doctest.SphinxDocTestRunner):
    def __init__(self, checker=None, verbose=None, optionflags=0):
        checker = BetterOutputChecker()
        doctest.DocTestRunner.__init__(self, checker, verbose, optionflags)


class BetterOutputChecker(doctest.OutputChecker):
    def check_output(self, want, got, optionflags):
        # Patch to test tasks output (which is in random order)
        if want.startswith('Random') or got.startswith('Random'):
            return True
        want = ADDRESS_RE.sub('0x7f00ed991e80', want)
        got = ADDRESS_RE.sub('0x7f00ed991e80', got)
        return doctest.OutputChecker.check_output(self, want, got, optionflags)


ext_doctest.SphinxDocTestRunner = BetterDocTestRunner

class BetterDocTestBuilder(ext_doctest.DocTestBuilder):

    def skipped(self, node) -> bool:
        to_skip = super().skipped(node)

        if not to_skip and os.environ.get('SINGLE_TEST') is not None:
            to_skip = os.path.basename(node.source or '') != os.environ.get('SINGLE_TEST')

        return to_skip

ext_doctest.DocTestBuilder = BetterDocTestBuilder

# -- External Link check settings --------------------------------

# A list of regular expressions that match URIs that should not be checked
# when doing a linkcheck build.
linkcheck_ignore = [r'http://localhost(:|/)?',
                    r'http://qgis(platform)?\.demo',
                    r'http://myhost/'
                    ]

# The number of times the linkcheck builder will attempt to check a URL
# before declaring it broken. Defaults to 1 attempt.
linkcheck_retries = 2

# -- Redirection settings --------------------------------

rediraffe_redirects = "redirects.txt"
