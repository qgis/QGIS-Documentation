
.. _pyqgis_testing:

***********************************
Writing code in the PyQGIS Cookbook
***********************************

If you are planning to add or update some chapters of the
:ref:`PyQGIS-Developer-Cookbook`, then you should follow some rules to enable
automatic testing of the code snippets.

Testing is really important because allows checking automatically the quality of
the code. During testing, if the code is not good or is outdated, tests will fail,
meaning that the code snippet has errors and needs to be fixed.

For testing, we use the `Sphinx doctest extension
<https://www.sphinx-doc.org/en/master/usage/extensions/doctest.html>`_. Refer to
the extension documentation for more detailed information.


How to write testable code snippets
===================================

Writing testable code snippets is not so different from the *old* method.
Basically, you need to use a different Sphinx `directive`.

Instead of embedding the code in a ``.. code-block:: python``
directive (which would highlight the code syntax automatically), you now need to
embed it in a ``.. testcode::``. That is, instead of  this::

  .. code-block:: python

     crs = QgsCoordinateReferenceSystem(4326, QgsCoordinateReferenceSystem.PostgisCrsId)
     assert crs.isValid()

You now use this::

  .. testcode::

     crs = QgsCoordinateReferenceSystem(4326, QgsCoordinateReferenceSystem.PostgisCrsId)
     assert crs.isValid()

After you wrote the example code, you should add some *assertion* that
will evaluate the code and that will be run automatically.

In the above example, you are creating a crs and with ``assert crs.isValid()``
you **test** if it is valid. If the code has a wrong python syntax or the
``crs.isValid()`` returns ``False``, this code snippet will fail during testing.

To successfully run the tests on snippets, you must import all the classes and
declare any variables used in the code snippets. You can include those in the
code snippet itself (visible in the HTML pages) or you can add them to a ``..
testsetup::`` directive (hidden in the HTML pages). The ``.. testsetup::`` need
to be before the ``.. testcode::``::

  .. testsetup::

     from qgis.core import QgsCoordinateReferenceSystem

  .. testcode::

     crs = QgsCoordinateReferenceSystem(4326, QgsCoordinateReferenceSystem.PostgisCrsId)
     assert crs.isValid()

If the code snippet is not creating an object (and therefore you cannot use
something like ``assert object.isValid()``) you can still compare the output
with another directive using the ``print()`` method. If your code has printed
outputs, you need to add the expected results within a ``.. testoutput::`` to
compare the expected output::

  .. testcode::

      print("QGIS CRS ID:", crs.srsid())
      print("PostGIS SRID:", crs.srid())

  .. testoutput::

      QGIS CRS ID: 3452
      PostGIS SRID: 4326

Grouping code snippets tests
----------------------------

For each rst document, the code snippets are tested sequentially, which means
you can use one ``.. testsetup::`` for all the following code snippets and that
latter snippets will use variables declared in previous ones.

Alternatively, you can use groups to break down the examples on the same page in
different tests.

You add the code snippet to groups by adding one or more group names (separated
by commas) in the respective directive::

  .. testcode:: crs_crsfromID [, morenames]

     crs = QgsCoordinateReferenceSystem(4326, QgsCoordinateReferenceSystem.PostgisCrsId)
     assert crs.isValid()

The doctest will pick each group snippets and run them independently.

.. note::

   Use group names that make sense with the related content.
   Use something similar to <chapter>_<subchapter>, for example: crs_intro,
   crs_fromwkt. In case of failures, this will help identifying where the failures
   occur.

If you don't declare any group, the code snippet will be added to the *default*
group. If instead, you use ``*`` as a group name, the snippet will be used in
all testing groups, something normally useful to use in the test setup::

  .. testsetup:: *

     from qgis.core import QgsCoordinateReferenceSystem

How to test snippets on your local machine
==========================================

.. note:: instructions are valid for Linux system.

To test Python code snippets, you need a *QGIS* installation. For this, there
are many options:

* You can use your system *QGIS* installation with *Sphinx* from a Python virtual
  environment::

    make -f venv.mk doctest

* You can use a manually built installation of *QGIS*, to do so, you need to
  create a custom ``Makefile`` extension on top of the ``venv.mk`` file, for
  example a ``user.mk`` file with the following content::

    # Root installation folder
    QGIS_PREFIX_PATH = /home/user/apps/qgis-master

    # Or build output folder
    QGIS_PREFIX_PATH = /home/user/dev/QGIS-build-master/output

    include venv.mk

  Then, use it to run target ``doctest``::

    make -f user.mk doctest

* Or you can run target ``doctest`` inside the official *QGIS* docker image::

    make -f docker.mk doctest

  You have to install `Docker <https://www.docker.com/>`_ first because we will
  use a docker image with QGIS in it.
