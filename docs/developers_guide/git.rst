.. _git_access:

*********************
 Development Process
*********************

.. contents::
   :local:

As common in open source projects, contributions of code and documentation
to the project are highly appreciated. The QGIS community is very supportive.
This section describes the procedure for developing and merging your contributions
in the QGIS project.

A git based project
===================

The complexity of the QGIS source code has increased considerably during the
last years. Therefore it is hard to anticipate the side effects that the
addition of a feature will have. In the past, the QGIS project had very long
release cycles because it was a lot of work to reestablish the stability of the
software system after new features were added. To overcome these problems, QGIS
switched to a development model using the `git <https://git-scm.com>`_ version
control system: new features are coded in the contributor branches first and
merged to the QGIS master (the main branch) when they are finished and stable.

QGIS source code is hosted at https://github.com/qgis/QGIS.


Roles
-----

There exist various roles on GitHub. When having an account on GitHub you are already
allowed to contribute by forking the repository and have the role 'contributor'.
Core developers are 'collaborators' and can merge branches into the upstream and
official repository.


Environment
------------

To get started using and contributing to the QGIS repository, you need to:

#. have a `GitHub account <https://github.com/join>`_
#. make your own copy of the `QGIS repository <https://github.com/qgis/QGIS>`_
   (see `fork <https://docs.github.com/en/get-started/quickstart/fork-a-repo>`_)
#. have a :ref:`git client installed <installing_git>` on your system
#. set up your `git environment <https://docs.github.com/en/get-started/quickstart/set-up-git#setting-up-git>`_
#. and have fun!


.. _installing_git:

Installing git
--------------

The git project provides recent versions of the software for most platforms.
Follow the instructions at https://git-scm.com/downloads to get and install
the copy corresponding to your OS and architecture.
There, it's also possible to install a git GUI client to browse and manage
your repositories (most of the time, it will install git if not yet available).

Development in branches
=======================

Contributions to development
----------------------------

Once signed up on GitHub and having forked the repository, you can engage as
a contributor.

.. note:: Contributions to QGIS code can be done from your forked repository on
  the GitHub website. The new code will automatically be built by the test environment.
  But this workflow can quickly reveal its limits when you want to provide complex
  changes. Instructions below will assume a local clone.

You can contribute by initiating a pull request. To do that follow these generic steps:

#. :ref:`Clone your repository <access_repository>` onto your local computer and
   set up the build environment
#. Create a new branch and do the edits for development
#. Commit your changes and push your branch back to the remote fork on GitHub.
   A pull request is then offered as web link (URL) right after.
#. Open a pull request (PR) asking to pull the commit(s) from your branch into
   the master branch into the upstream repository.
#. A review process is being started informing other contributors and collaborators
   about your pull request. You should be reactive to their comments and suggestions.


.. note:: A more detailed Github's Fork & Pull Workflow is available at
  https://reflectoring.io/github-fork-and-pull/

.. note:: Most of the QGIS projects (website, documentation, pyQGIS API, plugins...)
 are available in the `project GitHub page <https://github.com/qgis>`_ and can
 get contributions, following the same process.

.. _access_repository:

Accessing the Repository
------------------------

To be able to interact from your local disk with both your remote fork
and the QGIS upstream repositories, you need to:

#. Make a clone of your copy on your local disk

   .. code-block:: bash

     cd path/to/store/the/repository
     git clone https://github.com/<yourName>/QGIS.git

#. Connect the QGIS main repository (we will name it ``upstream``) to yours

   .. code-block:: bash

     git remote add upstream https://github.com/qgis/QGIS.git

#. Check connected remote repositories

   .. code-block:: bash

     git remote -v
     # origin	https://github.com/<YourName>/QGIS.git (fetch)
     # origin	https://github.com/<YourName>/QGIS.git (push)
     # upstream	https://github.com/qgis/QGIS.git (fetch)
     # upstream	https://github.com/qgis/QGIS.git (push)

   Your online repository is now accessible from your local drive and
   you can interact with it using the name ``origin``.
   Whenever you'd like to fetch changes from the qgis/QGIS repository,
   use ``upstream``.

.. note:: In QGIS we keep our most stable code in the current release branch.
  ``master`` branch contains code for the so called 'unstable' release series. Periodically
  we will branch a release off master, and then continue stabilisation and selective
  incorporation of new features into master.

  See the :source:`INSTALL <INSTALL.md>` file in the source tree for specific instructions
  on building development versions.

Procedure
---------

#. Initial announcement on mailing list or issues repo:
    Before starting, make an announcement on the developer mailing list to see if
    another developer is already working on the same feature. You can also mention
    your interest as a comment in the issue report if one exists in the repo.
    If the new feature requires any changes to the QGIS architecture, a `QGIS
    Enhancement Proposal (QEP) <https://github.com/qgis/QGIS-Enhancement-Proposals/>`_
    is needed.

#. Create a branch in your local repository:
    Create a new git branch for the development of the new feature, based on latest
    state of the master branch.

    .. code-block:: bash

      git fetch upstream master
      git checkout -b newfeature upstream/master

#. Now you can start developing:
    Code your changes in your local disk with your usual IDE.
    Remember to write tests suite for your modifications, when appropriate.

#. Proper formatting and spell check
    Make sure your code is properly formatted and spelled by running the prepare commit script 
    **before** issuing `git commit`.

    .. code-block:: bash

      ./scripts/prepare_commit.sh

    This can be automated by adding it to a pre-commit hook, for example:

    .. code-block:: bash

      # check if a pre-commit already exists and backup it
      test -e .git/hooks/pre-commit && mv .git/hooks/pre-commit pre-commit.000
      # copy prepare_commit.sh as new pre-commit hook
      cp ./scripts/prepare_commit.sh .git/hooks/pre-commit

    The spell checker script can also be run alone with: 

    .. code-block:: bash

      ./scripts/astyle_all.sh

#. Commit your changes to the git repo:
    When making a commit, put a descriptive comment and rather do
    several small commits if the changes across a number of files are unrelated.
    Conversely we prefer you to group related changes into a single commit.

    .. code-block:: bash

      git add path/to/your/files
      git commit -m "Add a comment describing your nice feature"

    Without the `-m` option, a new editor window will open for you to write your commit message.

    Commit description should follow `this recommendation <https://www.conventionalcommits.org/en/v1.0.0/#summary>`_.

#. Now, you may want to share your work with QGIS community members.
   Push your new feature up to your online fork repository by doing:

   .. code-block:: bash

     git push origin newfeature

   .. note:: If the branch already exists, your changes will be pushed into it,
     otherwise, it is created.

#. :ref:`Submit your changes <submit_patch>` with a pull-request
    With opening the pull-request, the automated test suite is triggered and
    checks whether your changes follow the coding guidelines of QGIS and do
    not break any existing feature.
    You'd need to fix any reported issues before your branch is merged upstream.

    .. tip:: We use `GitHub actions <https://docs.github.com/en/actions>`_
      to manage the tests to be run on the repository. For convenience, you can
      enable the actions on your repository so that the tests are run when you
      push the changes. You'd then open the pull request after they all passed,
      making the review process more efficient.

#. Rebase to upstream master regularly:
    It is recommended to rebase to incorporate the changes in master to the
    branch on a regular basis. This makes it easier to merge the branch back to
    master later. After a rebase you need to ``git push -f`` to your forked repo.

    .. code-block:: bash

      git pull --rebase upstream master
      git push -f origin newfeature


.. note:: See the following sites for information on becoming a GIT master.

 * https://git-scm.com/book/en/v2
 * https://gitready.com
 * https://support.github.com/

Testing before merging back to master
--------------------------------------

When you are finished with the new feature and happy with the stability, make
an announcement on the developer list. Before merging back, the changes will
be tested by developers and users.

.. _submit_patch:

Submitting Pull Requests
========================

There are a few guidelines that will help you to get your patches and pull
requests into QGIS easily, and help us deal with the patches that are sent to
use easily.

In general it is easier for developers if you submit GitHub pull
requests. We do not describe Pull Requests here, but rather refer you to the
`GitHub pull request documentation <https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests>`_.

If you make a pull request we ask that you please merge master to your PR
branch regularly so that your PR is always mergeable to the upstream master
branch.

If you are a developer and wish to evaluate the pull request queue, there is a
very nice `tool that lets you do this from the command line
<https://changelog.com/posts/git-pulls-command-line-tool-for-github-pull-requests>`_

In general when you submit a PR you should take the responsibility to follow it
through to completion - respond to queries posted by other developers, seek out a
'champion' for your feature and give them a gentle reminder occasionally if you
see that your PR is not being acted on. Please bear in mind that the QGIS
project is driven by volunteer effort and people may not be able to attend to
your PR instantaneously. We do scan the incoming pull requests
but sometimes we miss things. Don't be offended or alarmed. Try to identify a
developer to help you and contact them asking them if they can look at your patch.
If you feel the PR is not receiving the attention it
deserves your options to accelerate it should be (in order of priority):

* Help review others pull requests to free the person assigned to yours.
* Send a message to the mailing list 'marketing' your PR and how wonderful it
  will be to have it included in the code base.
* Send a message to the person your PR has been assigned to in the PR queue.
* Send a message to the project steering committee asking them to help see your
  PR incorporated into the code base.


Best practice for creating a pull request
-----------------------------------------

* Always start a feature branch from current master.
* If you are coding a feature branch, don't "merge" anything into that branch,
  rather rebase as described in the next point to keep your history clean.
* Before you create a pull request do ``git fetch upstream`` and ``git rebase upstream/master``
  (given upstream is the remote for qgis user and not your own remote, check your
  ``.git/config`` or do ``git remote -v | grep github.com/qgis``).

* You may do a git rebase like in the last line repeatedly without doing any
  damage (as long as the only purpose of your branch is to get merged into
  master).
* Attention: After a rebase you need to ``git push -f`` to your forked repo. 
  **CORE DEVS: DO NOT DO THIS ON THE QGIS PUBLIC REPOSITORY!**


Special labels to notify documentors
------------------------------------

There is a special label (``Needs Documentation``) that can be assigned by reviewers
to your pull request to automatically generate issue reports in QGIS-Documentation
repository as soon as your pull request is merged. Remember to mention whether your
feature deserves such a label.

Moreover, you can add special tags to your commit messages to provide more information
to documenters. The commit message is then added to the generated issue report:
  
* ``[needs-docs]`` to instruct doc writers to please add some extra documentation
  after a fix or addition to an already existing functionality.
* ``[feature]`` in case of new functionality. Filling a good description in your
  PR will be a good start.

Please devs use these labels (case insensitive) so doc writers have issues to
work on and have an overview of things to do. BUT please also take time to add
some text: either in the commit OR in the docs itself.


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
