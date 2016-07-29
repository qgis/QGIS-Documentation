
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
   lean history and snapshot.

There are different ways to contribute to QGIS documentation. Though we expose
them below separately, they are not mutually exclusive, meaning that you can, at
any moment, switch from one process to another without any harm because they
follow this scheme:

#. Do your modifications in an ad'hoc branch of your repository
#. Publish your changes and ask for merging in the main doc through a pull request (PR)
#. Others review, discuss and integrate your work in the main branch when everything seems ok.

Using GitHub web interface
---------------------------

From your cloned repository, you can now propose changes to the main documentation.
Indeed, GitHub web interface offers you ways to easily:

* edit files, preview and commit your changes
* make a pull request to have your changes inserted in the main repo
* create, update or delete branches

Read the GitHub `Hello-world <https://guides.github.com/activities/hello-world/>`_
project to learn some basic vocabulary and actions that will be used below.

Make changes in your repo
..........................

Documentation can be improved by addressing issues reported at
https://github.com/qgis/QGIS-Documentation/issues or issues you may
have encountered while browsing the doc. They can be of different
types: typo error, missing feature, wrong or out of date description...

Alternative 1: Picking an issue in the list
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Select an `issue <https://github.com/qgis/QGIS-Documentation/issues>`_ you
   want to fix. To avoid many persons tackling the same issue, you can inform
   contributors about your choice by adding a comment to the issue report and
   get it assigned to you.
#. From your repository, create (and switch to) a branch with a name that helps
   you remind what it's about
#. Browse the source files to the file that has to be changed
#. Toggle the file into Edit mode using the pencil icon and do your modifications
   following :ref:`guidelines <QGIS-documentation-guidelines>`
#. Validate your changes by filling the :guilabel:`Commit Changes` frame and
   commit directly to your branch.
#. Redo the previous steps for any other file that needs to be updated to fix
   the issue.


Alternative 2: Using the ``Fix Me`` shortcut
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The QGIS project provides an easy way to reach source file from online documentation.
Indeed, instead of browsing the source files in GitHub to find the one that suits
the issue, or if you find an issue while reading the manuals, you simply have to
click the "Fix Me" link at the bottom of the page to open its source file in Edit mode.

#. This will open the file in the ``qgis:master`` branch with a message at the
   top of the page telling you that you don't have write access to this repo and
   your changes will be applied in a new branch of your repository.
#. Do your changes following guidelines available at
   http://docs.qgis.org/testing/en/docs/documentation_guidelines/
#. When you finish, at the bottom of the page, comment a bit what your changes
   are about and click on :guilabel:`Propose File change`. This will generate a
   new branch (``patch-xxx``) in your repo.

.. tip:: If your ``master`` branch is even with ``qgis:master``, you can safely
   replace in the link ``qgis`` by ``<YourName>``. In this case, once your changes
   are done, you need to check |radioButtonOn| :guilabel:`Create a new branch for
   this commit and start a pull request` and avoid modifying ``master``.


Share your changes via Pull Request
...................................

Now, you have a new branch in QGIS with a file that diverge from ``qgis:master``.
To integrate your changes in the official documentation, you need to do a pull
request.

#. Actually, after you committed your changes, GitHub opens a new dialog comparing
   branches:

   * if you used the ``Fix Me`` without changing the url, then the comparison is
     between your ``patch-xxx`` branch and ``qgis:master`` (the base fork is
     ``qgis/QGIS-Documentation`` and its branch ``master``).
   * if you used a branch you had named yourself then the comparison is done between
     that branch and your own ``master`` branch (the base is simply ``master``).
     You therefore need to leave that page and create a new pull request in which
     you should ensure the base fork is ``qgis/QGIS-Documentation`` with ``master``
     branch and the head fork is ``<YourName>/QGIS-Documentation`` with your
     modified branch along.

#. A green check along the compared branches shows that your changes can
   automatically be merged in the official doc. Click the :guilabel:`Create
   pull request` button.
#. Fill the form if needed and click again :guilabel:`Create pull request` button.
#. A new PR is added to https://github.com/qgis/QGIS-Documentation/pulls
   and everybody can look or comment it.
#. That will trigger a `travis build <https://travis-ci.org/qgis/QGIS-Documentation>`_
   automatically checking if your contribution doesn't contain a build error.
#. Until your PR is merged with the main repo, you can add modifications to your
   proposal. Actually any new changes done to your branch is appended to your pull
   request. Do it if the change has to do with your initial pull request, otherwise
   create a new branch with those changes following steps above.
#. Once everything looks good to others, a committer can merge your branch with
   the main repo. Your contribution is validated.
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


Using Git command line tools
-----------------------------

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

Local repository
................

Now you are ready to get a local clone of **your** QGIS-Documentation repository:

::

  $ cd ~/Documents/Development/QGIS/
  $ git clone git@github.com:<YourName>/QGIS-Documentation.git

The former command line is simply an example.
You should adapt both the path and the repository URL, replacing ``<YourName>``
with your real name.

Check it:

::

  $ git remote -v
  origin  git@github.com:<YourName>/QGIS-Documentation.git (fetch)
  origin  git@github.com:<YourName>/QGIS-Documentation.git (push)
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
..............................

To be able to follow the work in the main project, add a new remote repository
in your local repository. This new remote repository is the QGIS-Documentation
repository from QGIS project:

::

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


Update your master branch
..........................

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
...................

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
  letter and have 80 characters length, don't end with a ``.``. Be concise.
  Your description can be longer, end with a ``.`` and you can give much more details.
* use a ``#`` with a number to refer to an issue. Prefix with ``Fix`` if you fix the
  ticket: your commit will close the ticket.

Now you can go to your github repository and create a Pull Request. Check
to create a PR from your branch to the master branch of the official
QGIS-Documentation repository.

Clean-up your local and remote repository
.........................................

After your PR has been merged into the official QGIS-Documentation, you can
delete your branch. If you work a lot this way, in few weeks you will get a lot
of unuseful branches. So keep your repository clean this way:

::

  # delete local branch
  $ git branch -d myNewBranch
  # Remove your remote myNewBranch by pushing nothing to it
  $ git push origin :myNewBranch

And do not forget to update the ``master`` branch in your local repository!

