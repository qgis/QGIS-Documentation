
Build on Linux
==============

Best to build in a Python Virtual Environment

To check/create the venv and use it in the build::

 make -f venv.mk html

The venv.mk will create/update a virt env (if not availablie ) in current dir/venv AND run the html build in it.

If you want for some reason start from scratch::

 make -f venv.mk cleanall

You can also use that virtual environment later doing::

 source/bin/activate

to activate the venv and then from within that venv::

 make html

You can also use your own virtual env by creating it using the REQUIRMENTS.txt::

 pip install -r REQUIREMENTS.txt myvirtualenv
 myvirtualenv/source/bin/activate


Build on Windows
================

::

 pip install -r REQUIREMENTS.txt venv
 venv/source/bin/activate
 make.bat




