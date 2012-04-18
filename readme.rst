Installation
================================================================================

Very basic steps
--------------------------------------------------------------------------------

* git clone the project
* add the linfiniti-sphinx-theme git repository as a submodule
* build the documentation

Installation
--------------------------------------------------------------------------------

Git clone this project.

Create a git submodule support to include the linfiniti-sphinx-theme in your 
git project::

   git submodule add git@github.com:timlinux/linfiniti-sphinx-theme.git \
     linfiniti-sphinx-theme
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
  
Build the documentation
--------------------------------------------------------------------------------

You can build the html in the following way (this process is for the user 
guide):

* first compile all the messages for getting updated translations in the build::

    make compile_messages SOURCE=user_guide
    
* then compile the project::
    
    make html


