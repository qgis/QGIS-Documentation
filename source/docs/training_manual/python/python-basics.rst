|LS| Python Basics
======================

In this lesson we will introduce you to the basics of python. If you have
programmed with other languages (Java, C++, VB etc.) you will find that
python is very easy and quick to learn, though it is a little different
to the way other languages work, particularly in terms of its requirements
for code formatting.

|basic| |FA| Hello World
-------------------------

Install python from `python.org <http://python.org>`_ then open a terminal or
command window and start the python prompt::

  timlinux@ultrabook:~/dev/cpp/QGIS-Training-Manual/python$ python

When it starts you will see a message like this::

  Python 2.7.3 (default, Aug  1 2012, 05:14:39)
  [GCC 4.6.3] on linux2
  Type "help", "copyright", "credits" or "license" for more information.

Now type :samp:`print 'Hello World'` at the command prompt as shown below::

  >>> print 'Hello World'

Python will respond by running your command::

  Hello World
  >>>

Congratulations, you just wrote your first python application!

.. note:: You can escape from the python prompt by pressing :kbd:`ctrl-D`
   or by typing :samp:`quit()` and then pressing :kbd:`Enter`.


|moderate| |FA| Running commands from a file
--------------------------------------------

Naturally it would be of limited use to only ever be able to type your python
commands interactively, so it is common practice to save your python commands
in a :file:`.py` file and then run the file. For example, save this line in
a text file called :file:`hello_world.py`::

  print 'Hello World'

.. note:: By convention, avoid saving your python code with file names
   containing spaces or hypens.


Now you can run your program by typing this from your command prompt::

  python hello_world.py


|advanced| |FA| Defining the interpreter in the file
----------------------------------------------------

It would be more convenient if we could just run the file directly. You can do
this on Linux and Mac OSX by adding an interpreter annotation to the top of the
file::

   #!/usr/bin/python

   print 'Hello World'

You will also need to make the file executable like this::

   chmod +x hello_world.py

Now you can execute the file like this::

   ./hello_world.py

.. note:: Doing this may prevent your program from being portable accross
   operating systems.


