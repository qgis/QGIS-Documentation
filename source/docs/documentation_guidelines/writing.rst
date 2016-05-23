************************
Documentation Guidelines
************************

.. contents::
   :local:

Introduction
============

QGIS Documentation will
be built automatically on the server at 0, 8am, 4pm PDT (Pacific Daylight Time).
The current status is available at http://docs.qgis.org.

QGIS Documentation is mainly written using the reStructuredText (reST) format syntax,
coupled with some scripts from the Sphinx toolset to post-process the HTML output.
See http://docutils.sourceforge.net/docs/ref/rst/restructuredtext.html
or http://sphinx.pocoo.org/markup/inline.html.

In general, when creating rst documentation for the QGIS project, please follow
the `Python documentation style guidelines
<http://docs.python.org/devguide/documenting.html>`_.
Below are exposed some general guidelines to follow when
using reST for the QGIS documentation writing.

If you are looking for general rules on contributing to QGIS project or managing
repositories, you may find help at
`Get Involved in the QGIS Community <http://qgis.org/en/site/getinvolved/index.html>`_.


Writing Documentation
=====================


Headlines
---------

To each webpage of the documentation corresponds a ``.rst`` file.

Sections used to structure the text are identified through their title which
is underlined (and overlined for the first level).
Same level titles must use same character for underline adornment.
In QGIS Documentation, you should use following styles for chapter,
section, subsection and minisec.

::

   ********
   Chapter
   ********

   Section
   =======

   Subsection
   ----------

   Minisec
   .......


Inline tags
-----------

You can use some tags inside the text to emphasize some items.

* **Menu gui**: to mark a complete sequence of menu selections,
  including selecting submenus and choosing a specific operation,
  or any subsequence of such a sequence.

  ::

     :menuselection:`menu --> submenu`

* **Dialog and Tab title**: Labels presented as part of an interactive user interface
  including window title, tab title and option labels.

  ::

     :guilabel:`title`

* **Button labels**

  ::

     **[Apply]**

* **Filename or directory**

  ::

     :file:`README.rst`

* **Icon with popup text belonging to Icon**

  ::

     |icon| :sup:`popup_text`

  (see `image`_ below).

* **Shorcut keyboard**

  ::

     :kbd:`ctrl B`

  will show :kbd:`Ctrl B`


* **User text**

  ::

     ``label``


.. _my_anchor:

Label/reference
---------------

References are used to place anchors inside the text.
It then helps you create and call hyperlinks between sections or page.

The example below creates the anchor of a section (e.g., Label/reference title)

::

   .. _my_anchor:

   Label/reference
   ---------------

To call the reference in the **same page**, use

::

   see my_anchor_ for more information.

which will return:

see my_anchor_ for more information.

Notice how it will jump to the following line/thing following the 'anchor'.
Normally to declare this label you do not need to use apastroph's but
you do need to use empty lines before and after the anchor.

Another way to jump to the same place **from anywhere in the documentation**
is to use the ``:ref:`` role.

::

   see :ref:`my_anchor` for more information.

which will display the caption instead (in this case the title of this section!):

see :ref:`my_anchor` for more information.

So reference 1 (my_anchor_) and reference 2 (:ref:`my_anchor`).
Because the reference often displays a full caption, there is not really
the need to use the word *section*.
Note that you can also use a custom caption to describe the reference

::

   see :ref:`Label and reference <my_anchor>` for more information.

returning:

see :ref:`Label and reference <my_anchor>` for more information.


.. _`image`:

Figure and image
----------------


Pictures
........

To insert an image, use

::

   .. image:: /static/common/qgislogo.png
      :width: 10 em

which returns

.. image:: /static/common/qgislogo.png
    :width: 10 em

Replacement
...........

You can put an image inside text or add an alias to use everywhere. To use an image
inside a paragraph, just create an alias somewhere.


::

   .. |nice_logo| image:: /static/common/qgislogo.png
                  :width: 2 em

and call it in your paragraph:

::

   my paragraph begins here with a nice logo |nice_logo|.

Here is how this example become:

.. |nice_logo| image:: /static/common/qgislogo.png
               :width: 2 em

my paragraph begins here with a nice logo |nice_logo|.

.. note::

   Currently, to ensure consistency and help in the use of QGIS icons
   a list of alias is built and available in :ref:`substitutions` chapter.

Figure
......

::

   .. _figure_readme_1:

   .. only:: html

      **Figure Readme 1:**

   .. figure:: /static/common/qgislogo.png
      :width: 20 em
      :align: center

      A caption: A logo I like


The result looks like this:

.. _figure_readme_1:

.. only:: html

   **Figure Readme 1:**

.. figure:: /static/common/qgislogo.png
   :width: 20 em
   :align: center

   A caption: A logo I like

Use ``.. only:: html`` to make the number to the figure (**Figure Readme 1**)
visible only in the html files.
The scripts will insert an automatical generated number before the caption of
the figure in pdf.

To use a caption (see My caption) just insert indented text after a blank line
in the figure block.

Referencing to the figure can be done using the reference label like this

::

   (see Figure_Readme_1_).


It will show the anchor Figure_Readme_1_. You can use uppercase if you want.
It can be used in the same :file:`.rst` document but not in other .rst
documents.

You can not use the ``:ref:`` role for reference anymore, because in html the reference
to the caption is lost (it now refers to the place before **Figure Readme 1:**)

::

   see :ref:`figure_readme_1`, does not work due to the lost reference to
   the caption of the figure, this is not a 'bug' but a choice we made!


Tables
......

To create a simple table

::

   =======  =======  =======
   x        y        z
   =======  =======  =======
   1        2        3
   2        4
   =======  =======  =======

Use a ``\`` followed by an empty space to leave an empty space.

You can also use more complicated tables by drawing them using references and all

::

   .. _my_drawn_table_1:

   +---------------+--------------------+
   | Windows       | Mac OSX            |
   +---------------+--------------------+
   | |win|         | |osx|              |
   +---------------+--------------------+
   | and of course not to forget |nix|  |
   +------------------------------------+

   My drawn table, mind you this is unfortunately not regarded a caption

   You can reference to it like this my_drawn_table_1_.

The result:

.. _my_drawn_table_1:

+---------------+--------------------+
| Windows       | Mac OSX            |
+---------------+--------------------+
| |win|         | |osx|              |
+---------------+--------------------+
| and of course not to forget |nix|  |
+------------------------------------+

My drawn table, mind you this is unfortunately not regarded a caption

You can reference to it like this my_drawn_table_1_.


Index
-----

Several index tag exists in RST. To be able to translate the index, it is necessary to
integrate it into the normal text. In this case use this syntax:

::

   QGIS allows to load several :index:`Vector formats` supported by GDAL/OGR ...

If the term does not have to be translated, please use this syntax:

::

   .. index:: WMS, WFS, WCS, CAT, SFS, GML, ...

Footnotes
---------

Please note: Footnotes are not recognized by any translation software and
it is also not converted to pdf format properly.
So, if possible don't use footnotes within any documentation.

This is for creating a footnote

::

   blabla [1]_

Which will point to:

 .. [1] Updates of core plugins

Managing Screnshots
===================

Add new Screenshots
-------------------

Here are some hints to create new, nice looking screenshots.
For the user guide they go into :file:`./resources/en/user_manual/`

* same environment for all the screen caps (same OS, same decoration, same font size).
  We have used Ubuntu with Unity and the default "ambience" theme.
  For screenshots of QGIS main window and composer we have set it to show menus on the window
  (not the default in unity).
* reduce the window to the minimal space needed to show the feature (taking the all screen
  for a small modal window > overkill)
* the less clutter, the better (no need to activate all the toolbars)
* don't resize them in an image editor, the size will be set into the rst files if necessary
  (downscaling the dimensions without properly upping the resolution > ugly)
* cut the background
* Set print size resolution to 135 dpi, eg in Gimp set the print resolution
  (image > print size) and save. This way, if no size is set in the rst files,
  images will be at original size in html and at a good print resolution in the PDF.
  You can use ImageMagick convert command to do a batch of images:

::

 convert -units PixelsPerInch input.png -density 135 output.png

* save them in png (no jpeg artifacts)
* the screenshot should show the content according to what is described in the text
* you can find some prepared QGIS-projects that were used before to create screenshots
  in :file:`./qgis-projects`.
  This makes it easier to reproduce screenshots for the next version of QGIS.
  These projects use the QGIS `Sample Data <http://qgis.org/downloads/data/>`_
  (aka Alaska Dataset), which should be placed in the same folder
  as the QGIS-Documentation Repository.
* Use the following command to remove the global menu function in Ubuntu
  to create smaller application screens with menu's:

::

  sudo apt-get autoremove appmenu-gtk appmenu-gtk3 appmenu-qt


Translate Screenshots
---------------------

Here are some hints to create screenshots for your translated user guide.
They will go into :file:`./resources/<your language>/user_manual/`

* same environment for all the screen caps (same OS, same decoration, same font size)
* use the QGIS -projects included in QGIS-Documentation repository (in :file:`./qgis_projects` ).
  These were used to produce the 'original' screenshots in the manual.
  The QGIS `Sample Data <http://qgis.org/downloads/data/>`_ (aka Alaska Dataset)
  should be placed in the same folder as the QGIS-Documentation Repository.
* same size as the english 'original' screenshots, otherwise they will be stretched
  and look ugly. If you need to have a different size due to longer ui strings,
  don't forget to change the dimension in the rst code of your language.
* reduce the window to the minimal space needed to show the feature
  (taking all the screen for a small modal window > overkill)
* the less clutter, the better (no need to activate all the toolbars)
* don't resize them in an image editor, the size will be set into the rst files
  (downscaling the dimensions without properly upping the resolution > ugly)
* cut the background
* save them in png (no jpeg artifacts)
* the screenshot should show the content according to what is described in the text


Documenting Processing algorithms
=================================

If you want to write documentation for Processing algorithms consider these guidelines:

* don't overwrite existing help files by files from other sources (e.g. QGIS
  source tree or Processing-Help repository), this files have different formats
* Processing algorithm help files are part of QGIS User Guide, so use same
  formatting as User Guide and other documentation
* avoid use "This algoritm does this and that..." as first sentence in algorithm
  description. Try to use more general words like in TauDEM or GRASS algoritms
  help
* add images if needed. Use PNG format and follow general guidelines for documentation.
* if necessary add links to additional information (e.g. publications or web-pages)
  to the "See also" section
* give clear explanation for algorithm parameters and outputs (again GRASS and
  TauDEM are good examples).
* don't edit parameter or output names. If you found typo or wrong spelling ---
  report this in bugracker, so developers can fix this in Processing code too
* don't list available options in algorithm description, options already listed
  in parameter description.
* don't add information vector geometry type in algorithm or parameter description
  without compelling reason as this information already available in parameter
  description


Managing your repository
========================

Given that documentation files are hosted and managed through git process,
below are given some hints to quickly and safely share your changes.

QGIS-Documentation Clone
------------------------

First you need to clone the QGIS-Documentation into your github account. Go to
the `QGIS-Documentation repository <https://github.com/qgis/QGIS-Documentation>`_
page and click on the **Fork** button.

Few seconds later, in your github account you can find your QGIS-Documentation
clone (Here an example of account https://github.com/yjacolin/QGIS-Documentation).

From your cloned repository, you can now propose changes to the main documentation.
Indeed, `GitHub web interface <https://guides.github.com/activities/hello-world/>`_
offers you ways to easily:

* edit files, preview and commit your changes
* make a pull request to have your changes inserted in the main repo
* create or delete branches

.. tip: **Keep using the latest version, easily**

  When you find a page that may need some completion or adjustment, use the ``Fix me``
  link at the bottom of the page (available for Testing doc). This generates
  a copy of the main repo's master branch (latest version) into your fork and
  opens in edit mode the file to update.
  Just make your changes, commit in the new branch and submit your pull request.


However, and despite the tip above, the web interface doesn't offer tools to:

* update your existing branches
* group your commits and clean your changes history
* build the documentation to test your changes
* fix conflicts with the main repo if needed...

You then need to `install git <https://git-scm.com/downloads>`_ on your hard
drive in order to get access to more advanced and powerful tools and have a
local copy of the repository. Some basics you may often need are exposed below.
You'll also find rules to care about even if you opt for the web interface.

In the code samples below, lines beginning with ``$`` show commands you should
type while ``#`` are comments.

Local repository
----------------

Now you are ready to get a local clone of **your** QGIS-Documentation repository:

::

  $ cd ~/Documents/Development/QGIS/
  $ git clone git@github.com:yjacolin/QGIS-Documentation.git

The former command line example are for my local QGIS-Documentation repository.
You should adapt both the path and the repository URL.

Check it:

::

  $ git remote -v
  origin  git@github.com:yjacolin/QGIS-Documentation.git (fetch)
  origin  git@github.com:yjacolin/QGIS-Documentation.git (push)
  $ git branch
  * master


* *origin* is the name of the remote repository of your QGIS-Documentation
  repository.
* *master* is the default main branch. You should never use it to contribute!
  **Never!**

You can start to work here but in the long terme process you will get a lot of
issue when you will push your contribution (called Pull Request in github
process) as the master branch of the QGIS-Documentation repository will diverge
from your local/remote repository.

Add another remote repository
-----------------------------

To be able to follow the work in the main project, add a new remote repository
in your local repository. This new remote repository is the QGIS-Documentation
repository from QGIS project:

::

  $ git remote add upstream git@github.com:qgis/QGIS-Documentation.git
  $ git remote -v
  origin  git@github.com:yjacolin/QGIS-Documentation.git (fetch)
  origin  git@github.com:yjacolin/QGIS-Documentation.git (push)
  upstream        git@github.com:qgis/QGIS-Documentation.git (fetch)
  upstream        git@github.com:qgis/QGIS-Documentation.git (push)

So now you have the choice between two remote repository:

* *origin* to push your local branch in **your** remote repository
* *upstream* to merge (if you have right to do so) your contribution to the
  official one OR to update your master branch of local repository from the
  master branch of the official repository.

.. note:: *upstream* is just a label, a kind of standard name but you can call
   it as you want.


Update your master branch
-------------------------

Before working on a new contribution, you should always update your local master
branch in your local repository. Just run this command line:

::

  # switch to master branch (it is easy to forget this step!)
  $ git checkout master
  # get "information" from upstream repository
  # (aka qgis/QGIS-Documentation's repository)
  $ git fetch upstream
  # merge update from upstream/master to the current local branch
  # (which should be master, see step 1)
  $ git merge upstream/master
  # update **your** remote repository
  $ git push origin master

Now we have a local and remote repository which are both up to date with
QGIS-Documentation from QGIS organisation. You can start to work on your
contribution.

Contribute to QGIS
------------------

Always work on a branch! Always!

::

   $ git checkout -b myNewBranch
   # checkout means go to the branch
   # and -b flag creates a new branch if needed
   $ git branch
   master
   * myNewBranch
   # * means the current branch
   # You can now add your contribution, by editing the concerned file
   # with any application (in this case, vim is used)
   $ vim myFile
   # once done
   $ git add myFile
   $ git commit
   # send your changes to your remote repository
   $ git push origin myNewBranch


Few words about commit/push commands:

* try to commit only one contribution (atomic change) i.e. address only one issue
* try to explain carefully what you change in the title of your commit and in
  the description. The first line is a title and should start by an upper case
  letter and have 80 caracters length, don't end with a ``.``. Be concise.
  Your description can be longer, end with a ``.`` and you can give much more details.
* use a ``#`` with a number to refer to an issue. Prefix with ``Fix`` if you fix the
  ticket: your commit will close the ticket.

Now you can go to your github repository and create a Pull Request (PR). Check
to create a PR from your branch to the master branch of the official
QGIS-Documentation repository.

Clean-up your local and remote repository
-----------------------------------------

After your PR has been merged into the official QGIS-Documentation, you can
delete your branch. If you work a lot this way, in few weeks you will get a lot
of unuseful branches. So keep your repository clean this way:

::

  # delete local branch
  $ git branch -d myNewBranch
  # Remove your remote myNewBranch by pushing nothing to it
  $ git push origin :myNewBranch

And do not forget to update the ``master`` branch in your local repository!

