
.. _step_by_step:

*****************************
 A Step By Step Contribution
*****************************

.. contents::
   :local:

.. note:: Though QGIS-Documentation is used to demonstrate the process, all
   commands and steps shown below also apply to QGIS-Website.

Now that you know the :ref:`rules <writing_doc_guidelines>` to follow to write a
clean doc for QGIS, let's dive in the process of production of this documentation
and how quickly and safely share your changes with the community.

Assuming you already have a `GitHub account <https://github.com/join>`_,
you first need to clone the source files of the documentation in order to have
your own copy you can work on: go to the `QGIS-Documentation repository
<https://github.com/qgis/QGIS-Documentation>`_ page (for convenience, this repository
is called below ``qgis/QGIS-Documentation``) and click on the **Fork** button in
the upper right corner.

Few seconds later, in your GitHub account you find a QGIS-Documentation
repository (``https://github.com/<YourName>/QGIS-Documentation``).
This repo is a safe copy in which you have full write access and can push all
your contributions without a risk to affect the official documentation. At the
beginning, this repository contains the same branches as ``qgis/QGIS-Documentation``
and is defaulted to ``master`` branch. Branches are parallel lines of
development containing different snapshots of the doc that may merge or diverge.
Preferably create a branch for each issue you want to tackle and you can create
as many branches as you want.

.. tip:: **Do your changes in an ad'hoc branch, never in** ``master``

   By convention, avoid making changes in your ``master`` branch except merging
   the modifications from the ``master`` branch of ``qgis/QGIS-Documentation``
   (called ``qgis:master``). And use it as model to create new branches for a
   clean history and snapshot.

There are different ways to contribute to QGIS documentation. Though we expose
them below separately, they are not mutually exclusive, meaning that you can, at
any moment, switch from one process to another without any harm because they
both follow the scheme below:

#. Do your modifications in an ad'hoc branch of your repository
#. Publish your changes and ask for merging in the main doc through a pull request (PR)
#. Others review, discuss and integrate your work in the main branch when everything seems ok.

Using GitHub web interface
===========================

From your cloned repository, you can now propose changes to the main documentation.
Indeed, GitHub web interface offers you ways to easily:

* edit files, preview and commit your changes
* make a pull request to have your changes inserted in the main repo
* create, update or delete branches

Read the GitHub `Hello-world <https://guides.github.com/activities/hello-world/>`_
project to learn some basic vocabulary and actions that will be used below.

Make changes in your repo
--------------------------

Documentation can be improved by addressing the `reported issues
<https://github.com/qgis/QGIS-Documentation/issues>`_ or issues you may
have encountered while browsing the doc. They can be of different
types: typo error, missing feature, wrong or out of date description...

Alternative 1: Picking an issue in the list
............................................

#. Select an `issue <https://github.com/qgis/QGIS-Documentation/issues>`_ you
   want to fix. To avoid many persons tackling the same issue, you can inform
   contributors about your choice by adding a comment to the issue report and
   get it assigned to you.
#. From your repository, create (and switch to) a branch with a name that helps
   you remind what it's about
#. Browse the source files to the file that has to be changed
#. Toggle the file into Edit mode using the pencil icon and do your modifications
   following :ref:`writing guidelines <QGIS-documentation-guidelines>`
#. Validate your changes by filling the :guilabel:`Commit Changes` frame and
   commit directly to your branch.
#. Redo the previous steps for any other file that needs to be updated to fix
   the issue.

Alternative 2: Using the ``Fix Me`` shortcut
.............................................

The QGIS project provides an easy way to reach source file from online documentation.
Indeed, instead of browsing the source files in GitHub to find the one that suits
the issue, or if you find an issue while reading the manuals, you simply have to
click the "Fix Me" link at the bottom of the page to open its source file in Edit mode.

#. This will open the file in the ``qgis:master`` branch with a message at the
   top of the page telling you that you don't have write access to this repo and
   your changes will be applied in a new branch of your repository.
   
   .. note:: If you have commit rights to QGIS-Documentation repository, then no
    message will show and you'll directly modify ``qgis:master`` branch itself
    unless you save your changes in another branch.

#. Do your changes following the :ref:`writing guidelines <QGIS-documentation-guidelines>`;
#. When you finish, at the bottom of the page, comment a bit what your changes
   are about and click on :guilabel:`Propose File change`. This will generate a
   new branch (``patch-xxx``) in your repo.

.. tip:: **Switch to your own fork and branch**

   If your ``master`` branch is even with ``qgis:master``, you can safely
   replace in the link ``qgis`` by ``<YourName>``. In this case, once your changes
   are done, you need to check |radioButtonOn| :guilabel:`Create a new branch for
   this commit and start a pull request` and avoid modifying ``master``.

.. _sharing_changes:

Share your changes via Pull Request
------------------------------------

Now, you have a new branch in QGIS with a file that diverge from ``qgis:master``.
To integrate your changes in the official documentation, you need to do a pull
request.

#. Actually, after you commit your changes, GitHub opens a new dialog comparing
   branches:

   * if you used the ``Fix Me`` without changing the url, then the comparison is
     between your ``patch-xxx`` branch and ``qgis:master`` (the base fork is
     ``qgis/QGIS-Documentation`` and its branch ``master``).
   * if you used a branch you had named yourself then the comparison is done between
     that branch and your own ``master`` branch (the base is simply ``master``).
     You therefore need to leave that page and follow the next step.

#. In any case (including pushing branch to GitHub from command lines) you can
   create a new pull request at any moment from many pages. Simply go to the
   main page of the repository (yours or qgis), click on :guilabel:`New pull
   request` and :guilabel:`Compare across forks` (if needed). Ensure you select
   ``qgis/QGIS-Documentation`` with ``master`` as base branch and that the head
   fork is your repository ``<YourName>/QGIS-Documentation`` with your modified
   branch along.

   .. tip:: Though released and being translated, the documentation of QGIS
      |CURRENT| is still maintained and existing issues are fixed. If you plan
      to fix the issues in the current released doc, replace ``master`` branch
      by the appropriate ``release_...`` branch in any of the steps exposed
      earlier.

#. A green check along the compared branches shows that your changes can
   automatically be merged in the official doc. Click the :guilabel:`Create
   pull request` button.

   If you get a red cross, it means that there's conflicts: the files you are
   modifying are not up to date with the branch you are targetting (a commit
   that brought changes on some common lines or files has been pushed to the
   branch since you create or last update your branch). You can still create
   the pull request but you'll need to fix the conflict(s) as 
   :ref:`explained below <fix_conflicts>` to allow any review.
#. Fill the form if needed and click again :guilabel:`Create pull request` button.
#. A new PR is added to the `Pull requests list <https://github.com/qgis/QGIS-Documentation/pulls>`_
   and everybody can look or comment it.
#. That will trigger a `Travis CI build <https://travis-ci.org/qgis/QGIS-Documentation>`_
   automatically checking if your contribution doesn't contain a build error.
   In case of error, a red cross appears along your commit. Simply click on it
   or on ``Details`` in the summary section at the bottom of the page to have
   details on the error. You'll need to fix any reported error or warning
   before your changes are committed in the repository.

    .. %ToDo: The FAQ could add information on Travis error and common fixes.

#. Until your PR is merged with the main repo, you can add modifications to your
   proposal, either to improve your changes, to address requested modifications
   or to fix a build error. Checkout the ``Files changed`` tab in your pull request
   page and click the pencil next to the filename you want to modify.
   Actually any new changes done to your branch is appended to your pull request.
   Hence, do it only if the change has to do with the issue you are fixing,
   otherwise create a new branch for those changes following the steps above.
#. Once everything looks good to you and others, a committer can merge your branch
   with the main repo. Your contribution is validated.
#. If you want, you can now delete the branch you used, to avoid having too many
   (unused and outdated) branches crowding your repository.

Doing this little steps will make you learn the process easier.

.. warning:: Be vigilant to pull request against ``qgis:master`` and not your own
   ``master`` branch, otherwise nobody is aware of your changes and you may
   mistakenly merge your changes into your ``master`` branch, polluting its history.

.. tip:: **Automatically close issue report from pull request**

   To ease issue reports management, mention the number of the issue you are
   addressing in your pull-request. This can be done using ``#issue_number``. If
   preceded by terms like ``fix``, ``close``... the concerned issue is closed as
   soon as the pull request is merged.

.. _git_command_line_tools:

Using Git command line tools
=============================

GitHub web interface helps you update the repo with your contribution in an easier
way but it doesn't offer tools to:

* group your commits and clean your changes history
* fix conflicts with the main repo if needed...
* build the documentation to test your changes

You then need to `install git <https://git-scm.com/downloads>`_ on your hard
drive in order to get access to more advanced and powerful tools and have a
local copy of the repository. Some basics you may often need are exposed below.
You'll also find rules to care about even if you opt for the web interface.

In the code samples below, lines beginning with ``$`` show commands you should
type while ``#`` are comments.

.. _local_repository:

Local repository
----------------

Now you are ready to get a local clone of **your** QGIS-Documentation repository:

.. code-block:: bash

  $ cd ~/Documents/Development/QGIS/
  $ git clone git@github.com:<YourName>/QGIS-Documentation.git

The former command line is simply an example.
You should adapt both the path and the repository URL, replacing ``<YourName>``
with your user name.

.. tip:: **Permission denied (publickey) error?**

   If you get a Permission denied (publickey) error, there may be a problem with
   your SSH key. See `GitHub help <https://help.github.com/articles/error-permission-denied-publickey/>`_ for details.

Check it:

.. code-block:: bash

  $ git remote -v
  origin  git@github.com:<YourName>/QGIS-Documentation.git (fetch)
  origin  git@github.com:<YourName>/QGIS-Documentation.git (push)
  $ git branch
  * master


* *origin* is the name of the remote repository of your QGIS-Documentation
  repository.
* *master* is the default main branch. You should never use it to contribute!
  **Never!**

You can start to work here but in the long term process you will get a lot of
issue when you will push your contribution (called Pull Request in github
process) as the master branch of the QGIS-Documentation repository will diverge
from your local/remote repository.

Add another remote repository
------------------------------

To be able to follow the work in the main project, add a new remote repository
in your local repository. This new remote repository is the QGIS-Documentation
repository from QGIS project:

.. code-block:: bash

  $ git remote add upstream git@github.com:qgis/QGIS-Documentation.git
  $ git remote -v
  origin  git@github.com:<YourName>/QGIS-Documentation.git (fetch)
  origin  git@github.com:<YourName>/QGIS-Documentation.git (push)
  upstream        git@github.com:qgis/QGIS-Documentation.git (fetch)
  upstream        git@github.com:qgis/QGIS-Documentation.git (push)

So now you have the choice between two remote repository:

* *origin* to push your local branch in **your** remote repository
* *upstream* to merge (if you have right to do so) your contribution to the
  official one OR to update your master branch of local repository from the
  master branch of the official repository.

.. note:: *upstream* is just a label, a kind of standard name but you can call
   it as you want.


Update your base branch
-----------------------

For testing doc (``master`` branch)
...................................

Before working on a new contribution, you should always update your local master
branch in your local repository. Just run this command line:

.. code-block:: bash

  # switch to master branch (it is easy to forget this step!)
  $ git checkout master
  # get "information" from the master branch in upstream repository
  # (aka qgis/QGIS-Documentation's repository)
  $ git fetch upstream master
  # merge update from upstream/master to the current local branch
  # (which should be master, see step 1)
  $ git merge upstream/master
  # update **your** remote repository
  $ git push origin master

Now you have a local and remote repositories which have both ``master`` branch up to date with
QGIS-Documentation from QGIS organisation. You can start to work on your
contribution.

For released doc (``release_`` branch)
......................................

Along the testing documentation, we continue to fix issues in QGIS |CURRENT| doc,
meaning that you can also contribute to it. Following the previous section sample code,
you can easily do that by selecting the corresponding branch.

When you clone the repository (see :ref:`local_repository`), your clone has all
the branches of the upstream repository.
As above, you need to ensure your branch is up to date with the upstream's:

.. code-block:: bash

  # change branch e.g. for 2.18 LTR
  $ git checkout release_2.18
  # get "information" from the release_2.18 branch in upstream repository
  $ git fetch upstream release_2.18
  # merge update from upstream/release_2.18 to the current local branch
  $ git merge upstream/release_2.18
  # update **your** remote repository
  $ git push origin release_2.18

In this way your local and remote branches for the |CURRENT| version are up to
date with the one of the official upstream repository.

.. _contribute:

Contribute to your production branch
-------------------------------------

Now that your base branch is updated, you need to create a dedicated branch
in which you add your contribution. Always work on a branch other than the
base branch! Always!

.. code-block:: bash

   $ git checkout -b myNewBranch
   # checkout means go to the branch
   # and -b flag creates a new branch if needed, based on current branch
   $ git branch
   master
   release_2.18
   * myNewBranch
   # a list of existing branch where * means the current branch
   # You can now add your contribution, by editing the concerned file
   # with any application (in this case, vim is used)
   $ vim myFile
   # once done
   $ git add myFile
   $ git commit

Few words about commit/push commands:

* try to commit only one contribution (atomic change) i.e. address only one issue
* try to explain carefully what you change in the title of your commit and in
  the description. The first line is a title and should start by an upper case
  letter and have 80 characters length, don't end with a ``.``. Be concise.
  Your description can be longer, end with a ``.`` and you can give much more details.
* use a ``#`` with a number to refer to an issue. Prefix with ``Fix`` if you fix the
  ticket: your commit will close the ticket.

Now that your changes are saved and committed in your local branch,
you need to send them to your remote repository in order to create pull request:

.. code-block:: bash

   $ git push origin myNewBranch


Share your Changes
------------------

Now you can go to your github repository and :ref:`create a Pull Request
<sharing_changes>` as exposed in a previous section.
Ensure you create a PR from your branch to the remote branch you are targetting
in the official QGIS-Documentation repository.

.. _clean_up:

Clean-up your local and remote repository
------------------------------------------

After your PR has been merged into the official QGIS-Documentation, you can
delete your branch. If you work a lot this way, in few weeks you will get a lot
of unuseful branches. So keep your repository clean this way:

.. code-block:: bash

  # delete local branch
  $ git branch -d myNewBranch
  # Remove your remote myNewBranch by pushing nothing to it
  $ git push origin :myNewBranch

And do not forget to update the ``master`` branch in your local repository!

Further reading
===============

* Other than the Github web interface and the git command line tools exposed
  above, there are also `GUI applications <https://git-scm.com/downloads/guis>`_
  you can use to create and manage your contributions to the documentation.

.. _fix_conflicts:

* When the changes in the pull request are conflicting with recent changes
  pushed to the target branch, the conflicts need to be resolved before a
  merge is possible:

  * if the conflict relates to few competing lines, a **[Resolve conflicts]**
    button is available in the Github pull request page. Press the button
    and resolve the issue as explained at
    https://help.github.com/articles/resolving-a-merge-conflict-on-github/
  * if the conflict involves files renaming or removal, then you'd need to
    resolve the conflict using git command lines. Typically, you have to first
    rebase your branch over the target branch using ``git rebase targetBranch``
    call and fix the conflicts that are reported. Read more at
    https://help.github.com/articles/resolving-a-merge-conflict-using-the-command-line/
* Sometimes, at the end of the proofreading process, you may end up with changes
  split into multiple commits that are not necessarily worth it. Git command
  lines help you squash these commits to a smaller number and more meaningful
  commit messages. Some details at
  https://help.github.com/articles/using-git-rebase-on-the-command-line/


.. Substitutions definitions - AVOID EDITING PAST THIS LINE
   This will be automatically updated by the find_set_subst.py script.
   If you need to create a new substitution manually,
   please add it also to the substitutions.txt file in the
   source folder.

.. |CURRENT| replace:: 2.18
.. |radioButtonOn| image:: /static/common/radiobuttonon.png
