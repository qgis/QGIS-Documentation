Installation
================================================================================

Where I can read this documentation
--------------------------------------------------------------------------------

It is possible to read the HTML version of the documentation for many languages 
here:

* English: http://documentation.qgis.org/
* French: http://documentation.qgis.org/html/fr/user_guide
* German: http://documentation.qgis.org/html/de/user_guide
* Italian: http://documentation.qgis.org/html/it/user_guide
* Japanese: http://documentation.qgis.org/html/ja/user_guide
* Portuguese: http://documentation.qgis.org/html/pt/user_guide
* Russian: http://documentation.qgis.org/html/ru/user_guide
* Spanish: http://documentation.qgis.org/html/es/user_guide

It is available also the subdomain docs.qgis.org, for example for the German 
language:
http://docs.qgis.org/html/user_guide/de/

It is possible to read the HTML English version of the documentation here:
http://readthedocs.org/docs/qgis/en/latest/

In the qgis.org site the documentation is scheduled to be built every 30 
minutes. In the readthedocs.org site it is built every time something is 
committed at this repository.

Quick Overview
--------------------------------------------------------------------------------

* git clone the project
* create the internationalization directory structure
* compile the message (make compile_messages)
* build the documentation (make html)
* translators edit the files
* administrator update the template files for each master document release

Installation
--------------------------------------------------------------------------------

Git clone this project.
   
Now create a virtualenv, source it and install latest requirements::
    
    virtualenv --no-site-packages qgis-doc-env
    . qgis-doc-env/bin/activate
    pip install -r requirements.txt
   
Create the internationalization directory structure
--------------------------------------------------------------------------------

Project administrators must generate .pot files (and update them every time the 
master document has been updated). He/she must generate .pot files for each
directory containing .rst files. For example::

    $ sphinx-build -b gettext source/ source/translated/pot/

$ sphinx-build -b gettext -c source source/others/ source/translated/pot
$ sphinx-build -b gettext -c source source/introduction/ source/translated/pot
$ sphinx-build -b gettext -c source source/plugins/ source/translated/pot/
$ sphinx-build -b gettext -c source source/print_composer/ source/translated/pot/
$ sphinx-build -b gettext -c source source/server/ source/translated/pot/
$ sphinx-build -b gettext -c source source/working/ source/translated/pot/
$ sphinx-build -b gettext -c source source/ source/translated/pot/

To add a new language the administrator need to copy the source/translated/pot 
directory to source/transated/language-code directory, where your-language-code 
is the `ISO language code with 2 digits 
<http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes>`_, and rename the files 
.pot to .po.

For example, for the Italian version of the User Guide::

	mkdir source/translated/it
	mkdir source/translated/it/LC_MESSAGES
	cp source/translated/pot/* source/translated/it/
	cd source/translated/it/
	for f in *.pot; do mv $f `basename $f .pot`.po; done;

This is how it should look the directory tree::

	translated/
	├── it
	│   ├── conventions.po
	│   ├── foreword.po
	│   ├── help_and_support.po
	│   ├── index.po
	│   ├── introduction.po
	│   ├── LC_MESSAGES
	│   ├── plugins.po
	│   ├── preamble.po
	│   ├── print_composer.po
	│   ├── server.po
	│   └── working.po
	└── pot
	    ├── conventions.pot
	    ├── foreword.pot
	    ├── help_and_support.pot
	    ├── index.pot
	    ├── introduction.pot
	    ├── plugins.pot
	    ├── preamble.pot
	    ├── print_composer.pot
	    ├── server.pot
	    └── working.pot

  
Build the documentation
--------------------------------------------------------------------------------

You can build the documentation in the following way:

* first compile all the messages for getting updated translations in the build::

    make compile_messages

You should have the following structure now::

	translated/
	├── it
	│   ├── conventions.po
	│   ├── foreword.po
	│   ├── help_and_support.po
	│   ├── index.po
	│   ├── introduction.po
	│   ├── LC_MESSAGES
	│   │   ├── conventions.mo
	│   │   ├── foreword.mo
	│   │   ├── help_and_support.mo
	│   │   ├── index.mo
	│   │   ├── introduction.mo
	│   │   ├── plugins.mo
	│   │   ├── preamble.mo
	│   │   ├── print_composer.mo
	│   │   ├── server.mo
	│   │   └── working.mo
	│   ├── plugins.po
	│   ├── preamble.po
	│   ├── print_composer.po
	│   ├── server.po
	│   └── working.po
	└── pot
	    ├── conventions.pot
	    ├── foreword.pot
	    ├── help_and_support.pot
	    ├── index.pot
	    ├── introduction.pot
	    ├── plugins.pot
	    ├── preamble.pot
	    ├── print_composer.pot
	    ├── server.pot
	    └── working.pot


* then clean the build directory::

    make clean
    
* then compile the project to the desired output. For html::
    
    make html
    
* for pdf::
    
    make pdf
    

Translators edit workflow
--------------------------------------------------------------------------------

Every time a new master document is released, the translators can start 
translating the .po files of competence.

Translators must edit the .po files using the web application, based on Pootle, 
or an offline editor, with `Virtaal 
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


