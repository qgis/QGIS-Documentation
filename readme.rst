Installation
================================================================================

Quick Overview
--------------------------------------------------------------------------------

* git clone the project
* add the linfiniti-sphinx-theme git repository as a submodule
* create the internationalization directory structure
* compile the message (make compile_messages)
* build the documentation (make html)
* translators edit the files
* administrator update the template files for each master document release

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
   
Now create a virtualenv, source it and install latest version of Sphinx::
    
    virtualenv --no-site-packages qgis-doc-env
    . qgis-doc-env/bin/activate
    pip install sphinx
   
Create the internationalization directory structure
--------------------------------------------------------------------------------

Project administrators must generate .pot files (and update them every time the 
master document has been updated). For example, for User Guide::

    $ sphinx-build -b gettext user_guide/ user_guide/translated/pot/

To add a new language the administrator need to copy the source/translated/pot 
directory to source/transated/language-code directory, where your-language-code 
is the `ISO language code with 2 digits 
<http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes>`_, and rename the files 
.pot to .po.

For example, for the Italian version of the User Guide::

	mkdir user_guide/translated/it
	cp user_guide/translated/pot/* user_guide/translated/it/
	cd user_guide/translated/it/
	for f in *.pot; do mv $f `basename $f .pot`.po; done;

This is how it should look the directory tree::

	translated/
	|-- it
	|   |-- conventions.po
	|   |-- foreword.po
	|   |-- help_and_support.po
	|   |-- introduction.po
	|   |-- LC_MESSAGES
	|   |   |-- conventions.mo
	|   |   |-- foreword.mo
	|   |   |-- help_and_support.mo
	|   |   |-- introduction.mo
	|   |   |-- plugins.mo
	|   |   |-- preamble.mo
	|   |   |-- print_composer.mo
	|   |   |-- server.mo
	|   |   |-- user_guide.mo
	|   |   `-- working.mo
	|   |-- plugins.po
	|   |-- preamble.po
	|   |-- print_composer.po
	|   |-- server.po
	|   |-- user_guide.po
	|   `-- working.po
	`-- pot
		|-- conventions.pot
		|-- foreword.pot
		|-- help_and_support.pot
		|-- introduction.pot
		|-- plugins.pot
		|-- preamble.pot
		|-- print_composer.pot
		|-- server.pot
		|-- user_guide.pot
		`-- working.pot
  
Build the documentation
--------------------------------------------------------------------------------

You can build the documentation in the following way (this process is for the 
user guide):

* first compile all the messages for getting updated translations in the build::

    make compile_messages SOURCE=user_guide
    
* then compile the project to the desired output. For html::
    
    make html

Translators edit workflow
--------------------------------------------------------------------------------

Every time a new master document is released, the translators can start 
translating the .po files of competence.

Translators must edit the .po files using the web application, based on Pootle, 
or an offline editor, with `Virtal 
<http://translate.sourceforge.net/wiki/virtaal/index?redirect=1>`_ being the 
highly recommended choice.

As soon as they finish editing one or more of the .po files, they should commit 
as soon as possible the edits to the git repository, in order to minimize the 
possibility of conflicts.

When a new version of the master document is released, the administrator must 
produce the new version of the template files (.pot).
At this point the administrator should also use the msgmerge command, for 
identifing the differences that each .po files has with the master document.

This is a basic usage of the msgmerge command::

	msgmerge source/translated/it/introduction.po \ 
		source/translated/pot/introduction.pot -U


