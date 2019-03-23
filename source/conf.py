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

project = 'QGISDoc'
copyright = '2002-now, QGIS project'
author = 'QGIS Authors'


# -- General configuration ---------------------------------------------------

# The master toctree document.
master_doc = 'docs/index'

# The name of an image file (relative to this directory) to place at the top
# of the sidebar.
html_logo = 'static/common/logo.png'

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [
]

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = []

# -- Internationalisation ----------------------------------------------------

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
    'includehidden': True,
    # canonical_url: This will specify a canonical URL meta link element to tell search engines which URL should be ranked as the primary URL for your documentation. This is important if you have multiple URLs that your documentation is available through. The URL points to the root path of the documentation and requires a trailing slash.
    'canonical_url': '',
    # display_version: If True, the version number is shown at the top of the sidebar. Default: True,
    'display_version': True,
    # logo_only: Only display the logo image, do not display the project name at the top of the sidebar. Default: False,
    'logo_only': False,
    # prev_next_buttons_location': Location to display Next and Previous buttons. This can be either bottom, top, both , or None. Default: 'bottom',
    'prev_next_buttons_location': 'bottom',
    # style_external_links': Add an icon next to external links. Default: False,
    'style_external_links': False,
    # vcs_pageview_mode': Changes how to view files when using display_github, display_gitlab, etc. When using GitHub or GitLab this can be: blob (default), edit, or raw. On Bitbucket, this can be either: view (default) or edit. '',
    # unsupported ??
    #'vcs_pageview_mode': 'edit',
    # style_nav_header_background': Changes the background of the search area in the navigation bar. The value can be anything valid in a CSS background property. Default: 'white',
    #'style_nav_header_background': 'Gray',
    # Toc options
    # titles_only: When enabled, page subheadings are not included in the navigation. Default: False
    'titles_only': False,
    # 'github_url' Force the Edit on GitHub button to use the configured URL.
     'github_url': 'https://github.com/rduivenvoorde/qgisdoc',
    # 'gitlab_url' Force the Edit on GitLab button to use the configured URL.
    # 'gitlab_url': 'xxx',
}

# Add any paths that contain custom themes here, relative to this directory.
html_theme_path = ['../themes']


# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['static']
