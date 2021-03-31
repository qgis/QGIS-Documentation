.. _git_access:

*************
 GIT Access
*************

.. contents::
   :local:

This section describes how to get started using the QGIS GIT repository. Before
you can do this, you need to first have a git client installed on your system.


Installation
=============

Install git for GNU/Linux
--------------------------

Debian based distro users can do:

.. code-block:: bash

  sudo apt install git


Install git for Windows
------------------------

Windows users can obtain `msys git <https://gitforwindows.org/>`_ or use git
distributed with `cygwin <https://cygwin.com>`_.


Install git for OSX
-------------------

The `git project <https://git-scm.com/>`_ has a downloadable build of git.
Make sure to get the package matching your processor (x86_64 most likely, only
the first Intel Macs need the i386 package).

Once downloaded open the disk image and run the installer.

PPC/source note

The git site does not offer PPC builds. If you need a PPC build, or you just want
a little more control over the installation, you need to compile it yourself.

Download the source from https://git-scm.com/.
Unzip it, and in a Terminal cd to the source folder, then:

.. code-block:: bash

  make prefix=/usr/local
  sudo make prefix=/usr/local install

If you don't need any of the extras, Perl, Python or TclTk (GUI),
you can disable them before running make with:

.. code-block:: bash

  export NO_PERL=
  export NO_TCLTK=
  export NO_PYTHON=


Accessing the Repository
=========================


To clone QGIS master:

.. code-block:: bash

  git clone git://github.com/qgis/QGIS.git


Check out a branch
===================

To check out a branch, for example the release 2.6.1 branch do:

.. code-block:: bash

  cd QGIS
  git fetch
  git branch --track origin release-2_6_1
  git checkout release-2_6_1

To check out the master branch:

.. code-block:: bash

  cd QGIS
  git checkout master

.. note:: In QGIS we keep our most stable code in the current release branch.
  Master contains code for the so called 'unstable' release series. Periodically
  we will branch a release off master, and then continue stabilisation and selective
  incorporation of new features into master.

  See the INSTALL file in the source tree for specific instructions on building
  development versions.


QGIS documentation sources
===========================

If you're interested in checking out QGIS documentation sources:

.. code-block:: bash

  git clone git@github.com:qgis/QGIS-Documentation.git

You can also take a look at the readme included with the documentation repo
for more information.


QGIS website sources
=====================

If you're interested in checking out QGIS website sources:

.. code-block:: bash

  git clone git@github.com:qgis/QGIS-Website.git

You can also take a look at the readme included with the website repo
for more information.


GIT Documentation
==================


See the following sites for information on becoming a GIT master.

* https://git-scm.com/book/en/v2
* http://gitready.com
* https://help.github.com/en


Development process
===================

As common in open source projects contributions of code and documentation
to the project are highly appreciated. The QGIS community is very supportive. 


Development in branches
-----------------------

The complexity of the QGIS source code has increased considerably during the
last years. Therefore it is hard to anticipate the side effects that the
addition of a feature will have. In the past, the QGIS project had very long
release cycles because it was a lot of work to reestablish the stability of the
software system after new features were added. To overcome these problems, QGIS
switched to a development model where new features are coded in GIT branches
first and merged to master (the main branch) when they are finished and stable.
This section describes the procedure for branching and merging in the QGIS
project.

Roles
-----

There exist various roles on GitHub. When having an account on GitHub you are already
allowed to contribute by forking the repository and have the role 'contributor'.
Core developers are 'collaborators' and can merge branches into the upstream and
official repository.

Contributions to development
----------------------------

Once signed up on GitHub you can engage as a contributor. You can contribute by
forking the repository and initiating a pull request. To do that follow these
generic steps:

1. Fork the repository on GitHub
2. (Optional) Clone it onto your local computer and set up the build environment
3. Create a new branch and do the edits for development
4. Commit your changes and push your branch back to the remote fork on GitHub.
   A pull request is then offered as web link (URL) right after.
5. Open a pull request (PR) asking to pull the commit(s) from your branch into
   the master branch into the upstream repository.
6. A review process is being started informing other contributors and collaborators
   about your pull request. You should be reactive to their comments and suggestions.

.. note:: Regarding (optional) step 2: Contributions to QGIS code can also be
  done on the GitHub website without a local clone. The new code will automatically
  be built by the build environment.

.. note:: A more detailed Github's Fork & Pull Workflow is available at
  https://reflectoring.io/github-fork-and-pull/


Procedure
---------

- Initial announcement on mailing list:
    Before starting, make an announcement on the developer mailing list to see if
    another developer is already working on the same feature. Also contact the
    technical advisor of the project steering committee (PSC). If the new feature
    requires any changes to the QGIS architecture, a request for comment (RFC) is
    needed.

Create a branch:
Create a new GIT branch for the development of the new feature.

.. code-block:: bash

  git checkout -b newfeature

Now you can start developing. If you plan to do extensive on that branch, would
like to share the work with other developers, and have write access to the
upstream repo, you can push your repo up to the QGIS official repo by doing:

.. code-block:: bash

  git push origin newfeature


.. note:: If the branch already exists your changes will be pushed into it.

  Rebase to master regularly:
  It is recommended to rebase to incorporate the changes in master to the
  branch on a regular basis. This makes it easier to merge the branch back to
  master later. After a rebase you need to ``git push -f`` to your forked repo.

.. note:: Never ``git push -f`` to the origin repository! Only use this for your working branch.

.. code-block:: bash

  git rebase master


Testing before merging back to master
--------------------------------------

When you are finished with the new feature and happy with the stability, make
an announcement on the developer list. Before merging back, the changes will
be tested by developers and users.

.. _submit_patch:

Submitting Patches and Pull Requests
====================================


There are a few guidelines that will help you to get your patches and pull
requests into QGIS easily, and help us deal with the patches that are sent to
use easily.


Pull Requests
--------------


In general it is easier for developers if you submit GitHub pull
requests. We do not describe Pull Requests here, but rather refer you to the
`GitHub pull request documentation <https://help.github.com/articles/about-pull-requests>`_.

If you make a pull request we ask that you please merge master to your PR
branch regularly so that your PR is always mergeable to the upstream master
branch.

If you are a developer and wish to evaluate the pull request queue, there is a
very nice `tool that lets you do this from the command line
<https://changelog.com/posts/git-pulls-command-line-tool-for-github-pull-requests>`_

Please see the section below on 'getting your patch noticed'. In general when
you submit a PR you should take the responsibility to follow it through to
completion - respond to queries posted by other developers, seek out a
'champion' for your feature and give them a gentle reminder occasionally if you
see that your PR is not being acted on. Please bear in mind that the QGIS
project is driven by volunteer effort and people may not be able to attend to
your PR instantaneously. If you feel the PR is not receiving the attention it
deserves your options to accelerate it should be (in order of priority):

* Send a message to the mailing list 'marketing' your PR and how wonderful it
  will be to have it included in the code base.
* Send a message to the person your PR has been assigned to in the PR queue.
* Send a message to Marco Hugentobler (who manages the PR queue).
* Send a message to the project steering committee asking them to help see your
  PR incorporated into the code base.


Best practice for creating a pull request
..........................................


* Always start a feature branch from current master.
* If you are coding a feature branch, don't "merge" anything into that branch,
  rather rebase as described in the next point to keep your history clean.
* Before you create a pull request do ``git fetch origin`` and ``git rebase origin/master``
  (given origin is the remote for upstream   and not your own remote, check your
  ``.git/config`` or do ``git remote -v | grep github.com/qgis``).

* You may do a git rebase like in the last line repeatedly without doing any
  damage (as long as the only purpose of your branch is to get merged into
  master).
* Attention: After a rebase you need to ``git push -f`` to your forked repo. 
  **CORE DEVS: DO NOT DO THIS ON THE QGIS PUBLIC REPOSITORY!**

Special labels to notify documentors
.....................................

Besides common tags you can add to classify your PR, there are special ones
you can use to automatically generate issue reports in QGIS-Documentation
repository as soon as your pull request is merged:
  
* ``[needs-docs]`` to instruct doc writers to please add some extra documentation
  after a fix or addition to an already existing functionality.
* ``[feature]`` in case of new functionality. Filling a good description in your
  PR will be a good start.

Please devs use these labels (case insensitive) so doc writers have issues to
work on and have an overview of things to do. BUT please also take time to add
some text: either in the commit OR in the docs itself.

For merging a pull request
...........................

Option A:

* click the merge button (Creates a non-fast-forward merge)

Option B:

* `Checkout the pull request <https://gist.github.com/piscisaureus/3342247>`_
* Test (Also required for option A, obviously)
* checkout master, git merge pr/1234
* Optional: ``git pull --rebase``: Creates a fast-forward, no "merge commit" is
  made. Cleaner history, but it is harder to revert the merge.
* ``git push`` (NEVER EVER use the -f option here)


Patch file naming
==================

If the patch is a fix for a specific bug, please name the file with the bug
number in it e.g. bug777fix.patch, and attach it to the `original bug report in
GitHub <https://github.com/qgis/QGIS/issues>`_.

If the bug is an enhancement or new feature, it's usually a good idea to create
a `ticket in GitHub <https://github.com/qgis/QGIS/issues>`_
first and then attach your patch.


Create your patch in the top level QGIS source dir
===================================================

This makes it easier for us to apply the patches since we don't need to
navigate to a specific place in the source tree to apply the patch. Also when I
receive patches I usually evaluate them using merge, and having the patch
from the top level dir makes this much easier. Below is an example of how you
can include multiple changed files into your patch from the top level
directory:

.. code-block:: bash

  cd QGIS
  git checkout master
  git pull origin master
  git checkout newfeature
  git format-patch master --stdout > bug777fix.patch

This will make sure your master branch is in sync with the upstream repository,
and then generate a patch which contains the delta between your feature branch
and what is in the master branch.


Getting your patch noticed
---------------------------

QGIS developers are busy folk. We do scan the incoming patches on bug reports
but sometimes we miss things. Don't be offended or alarmed. Try to identify a
developer to help you and contact them
asking them if they can look at your patch. If you don't get any response, you
can escalate your query to one of the Project Steering Committee members
(contact details also available in the Technical Resources).


Due Diligence
--------------

QGIS is licensed under the GPL. You should make every effort to ensure you only
submit patches which are unencumbered by conflicting intellectual property
rights. Also do not submit code that you are not happy to have made available
under the GPL.


Obtaining GIT Write Access
===========================

Write access to QGIS source tree is by invitation. Typically when a person
submits several (there is no fixed number here) substantial patches that
demonstrate basic competence and understanding of C++ and QGIS coding
conventions, one of the PSC members or other existing developers can nominate
that person to the PSC for granting of write access. The nominator should give
a basic promotional paragraph of why they think that person should gain write
access. In some cases we will grant write access to non C++ developers e.g. for
translators and documentors. In these cases, the person should still have
demonstrated ability to submit patches and should ideally have submitted several
substantial patches that demonstrate their understanding of modifying the code
base without breaking things, etc.

.. note:: Since moving to GIT, we are less likely to grant write access to new
  developers since it is trivial to share code within github by forking QGIS and
  then issuing pull requests.

Always check that everything compiles before making any commits / pull
requests. Try to be aware of possible breakages your commits may cause for
people building on other platforms and with older / newer versions of
libraries.

When making a commit, your editor (as defined in $EDITOR environment variable)
will appear and you should make a comment at the top of the file (above the
area that says 'don't change this'). Put a descriptive comment and rather do
several small commits if the changes across a number of files are unrelated.
Conversely we prefer you to group related changes into a single commit.
