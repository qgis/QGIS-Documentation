======================
Linfiniti Sphinx Theme
======================

Example:
--------

The example below should give you an idea of what your sphinx markup should
look like when using this theme.

.. image:: https://github.com/timlinux/linfiniti-sphinx-theme/raw/master/screenshot.jpeg

License:
--------

This is a theme for the `sphinx documentation system
<http://sphinx.pocoo.org/>`_ based on the `bootstrap css framework
<http://twitter.github.com/bootstrap/>`_. It also uses a few icons from the
free `34aL volume 3.2 SE <http://www.icojoy.com/articles/26/>`_ icon set.

The base layout.html is taken from the default sphinx theme and modified.

Bootstrap is provided under the Apache License Version 2.0 license, a copy
of which is included under static/bootstrap/LICENSE.txt

This theme is the original work of Tim Sutton, Linfiniti Consulting CC and made
available under the Creative Commons Share-Alike license. More about this
license can be found `here <http://creativecommons.org/licenses/by-sa/3.0/>`_.

Please do not remove our name / license logo from the theme without our
permission.

Simple Installation & Usage:
----------------------------

We assume that you already have a sphinx documentation project (read their 
documentation for advice on how to do that). In order to use this theme, you 
can either install it in a central location (if you plan to use it for more 
then one project) or install a copy of it with your sphinx documentation 
project (recommended route, explained here). 

You can get the latest version of this theme as a unix 'tarball' `here
<https://github.com/timlinux/linfiniti-sphinx-theme/tarball/master>`_, or if
you prefer, the latest version is available as a zip file `here
<https://github.com/timlinux/linfiniti-sphinx-theme/zipball/master>`_.

Assuming you have extracted this theme under::

   <your sphinx project>/linfiniti-sphinx-theme

and your documentation sources live in a subdirectory e.g.::

   <your sphinx project>/source

then modify your project/source/conf.py to include the theme directory and
indicate that this theme should be used::

   html_theme = 'linfiniti-sphinx-theme'
   html_theme_path = ['..']

Then regenerate your documentation::

   make html

And you should see a new theme activated on your html output when opening
it with a web browser.


Advanced installation (as a git submodule):
-------------------------------------------

As an alternative to downloading the theme as a zip file, you can use git
submodule support to include it in your git project::

   git submodule add git@github.com:timlinux/linfiniti-sphinx-theme.git linfiniti-sphinx-theme
   git submodule
   git submodule init linfiniti-sphinx-theme
   git submodule update linfiniti-sphinx-theme
   git status
   git commit -m "Import linfiniti-sphinx-theme as a git submodule" -a
   git push
   make html

The above being a typical workflow to incorporate the theme as a submodule in
your project.

.. note:: The theme is frozen at the particular version that was current when
   you perform the git submodule update command.

If you wish to obtain updates to the theme submodule, the procedure is
something like this::

   cd <your sphinx project>/linfiniti-sphinx-theme
   git pull
   cd ..

Then commit the fact that the submodule now tracks a different SHA1::

   git commit -am "Updates linfiniti theme to latest version"



Reporting issues:
-----------------

If you encounter problems using this theme, please use the `github issue
<https://github.com/timlinux/linfiniti-sphinx-theme/issues>`_ tracker to let us
know.

Contributions:
--------------

There are a number of theme elements that are not yet realised in this theme.
If you have improved the theme, please share your improvements via a github pull
request or a patch so that others may also benifit from your work as you have
from ours.

Localised Changes to CSS:
-------------------------

Please do not modify the `static/bootstrap` directory contents directly as this is a
verbatim copy from the bootstrap project. Rather add your css improvements to
`static\linfiniti.css`.

History:
--------

We developed this theme for some in-house projects we were working on, but
decided to 'put it out there' since we started using the theme in some of our
contributions to the `Quantum GIS (QGIS) <http://qgis.org>`_ project too.

Contact:
--------

If you wish to contact us (we always enjoy hearing from people who appreciate
the work we do), please email us at `tim@linfiniti.com <tim@linfiniti.com>`_.

Tim Sutton, 9 April 2011
