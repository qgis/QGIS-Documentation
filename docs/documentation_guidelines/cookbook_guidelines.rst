
.. _pyqgis_testing:

***********************************
Writing code in the PyQGIS Cookbook
***********************************

.. contents::
   :local:

If you are planning to add or update some chapters of the
:ref:`PyQGIS-Developer-Cookbook`, then you should follow some rules to enable
automatic testing of the code snippets.

Testing is really important because it allows automatic checking of
the code. Code snippets with errors or code that uses outdated methods will fail and
the notification will help you fix the problems.

For testing, we use the `Sphinx doctest extension
<https://www.sphinx-doc.org/en/master/usage/extensions/doctest.html>`_. Refer to
the extension documentation for more detailed information.


How to write testable code snippets
===================================

Writing testable code snippets is not so different from the *old* method.
Basically, you need to use a different Sphinx `directive`.

Doctest sphinx directives
-------------------------

Instead of embedding the code in a ``.. code-block:: python``
directive (which would highlight the code syntax automatically), you now need to
embed it in a ``.. testcode::``. That is, instead of  this::

  .. code-block:: python

     crs = QgsCoordinateReferenceSystem("EPSG:4326")
     assert crs.isValid()

You now use this::

  .. testcode::

     crs = QgsCoordinateReferenceSystem("EPSG:4326")
     assert crs.isValid()

After you wrote the example code, you should add some *assertion* that
will evaluate the code and that will be run automatically.

In the above example, you are creating a crs and with ``assert crs.isValid()``
you **test** if it is valid. If the code has a wrong python syntax or the
``crs.isValid()`` returns ``False``, this code snippet will fail during testing.

To successfully run the tests on snippets, you must import all the classes and
declare any variables used in the code snippets. You can include those in the
code snippet itself (visible in the HTML pages) or you can add them to a
``.. testsetup::`` directive (hidden in the HTML pages). The ``.. testsetup::``
needs to be placed before the ``.. testcode::``::

  .. testsetup::

     from qgis.core import QgsCoordinateReferenceSystem

  .. testcode::

     crs = QgsCoordinateReferenceSystem("EPSG:4326")
     assert crs.isValid()

If the code snippet doesn't create objects (and therefore you cannot use
something like ``assert object.isValid()``), you can test the code using the
``print()`` method, then add the expected results within a ``.. testoutput::``
directive to compare the expected output::

  .. testcode::

     print("QGIS CRS ID:", crs.srsid())
     print("PostGIS SRID:", crs.postgisSrid())

  .. testoutput::

     QGIS CRS ID: 3452
     PostGIS SRID: 4326

By default, the content of ``.. testoutput::`` is shown in the HTML output.
To hide it from the HTML use the `:hide:` option::

  .. testoutput::
     :hide:

     QGIS CRS ID: 3452
     PostGIS SRID: 4326

.. note::

   If the code snippet contains any print statements, you MUST add a ``testoutput``
   with the expected outputs; otherwise the test will fail.

Grouping tests
----------------------------

For each rst document, the code snippets are tested sequentially, which means
you can use one ``.. testsetup::`` for all the following code snippets and that
later snippets will have access to variables declared in earlier ones in the document.

Alternatively, you can use groups to break down the examples on the same page in
different tests.

You add the code snippet to groups by adding one or more group names (separated
by commas) in the respective directive::

  .. testcode:: crs_crsfromID [, morenames]

     crs = QgsCoordinateReferenceSystem("EPSG:4326")
     assert crs.isValid()

The ``doctest`` will pick each group snippets and run them independently.

.. note::

   Use group names that make sense with the related content.
   Use something similar to <chapter>_<subchapter>, for example: crs_intro,
   crs_fromwkt. In case of failures, this will help identifying where the failures
   occur.

If you don't declare any group, the code snippet will be added to a group named
``default``. If instead, you use ``*`` as a group name, the snippet will be used
in all testing groups, something normally usefull to use in the test setup::

  .. testsetup:: *

     from qgis.core import QgsCoordinateReferenceSystem

How to test snippets on your local machine
==========================================

.. note:: Instructions are valid for Linux system.

To test Python code snippets, you need a *QGIS* installation. For this, there
are many options. You can:

* Use your system *QGIS* installation with *Sphinx* from a Python virtual
  environment::

    make -f venv.mk doctest

* Use a manually built installation of *QGIS*. You'd need to:

  #. Create a custom ``Makefile`` extension on top of the :file:`venv.mk` file,
     for example a :file:`user.mk` file with the following content::

      # Root installation folder
      QGIS_PREFIX_PATH = /home/user/apps/qgis-master

      include venv.mk

     Or ::

      # build output folder
      QGIS_PREFIX_PATH = /home/user/dev/QGIS-build-master/output

      include venv.mk

  #. Then, use it to run target ``doctest``::

      make -f user.mk doctest

* Run target ``doctest`` inside the official *QGIS* docker image::

    make -f docker.mk doctest

  You have to install `Docker <https://www.docker.com/>`_ first because this
  uses a docker image with QGIS in it.
